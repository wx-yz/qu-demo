package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/mattn/go-sqlite3"
)

// Timeline consists of a bunch of Tweets for the current user
type Timeline struct {
	Timeline []Tweet
}

// Hold a single Tweet
type Tweet struct {
	Id         string
	ProfileImg string
	Text       string
	TimeStamp  string
	ScreenName string
}

// Input format when POSTing a Tweet
type Message struct {
	Id   string
	Text string
}

func main() {
	http.HandleFunc("/getTimeline", getTimeline)
	http.HandleFunc("/post", postTweet)
	http.HandleFunc("/testme/", testme)

	log.Fatal(http.ListenAndServe(":8000", nil))

}

// Get timeline for the current logged in user
func getTimeline(w http.ResponseWriter, r *http.Request) {
	db, err := sql.Open("sqlite3", "./tweets.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	// Query to get all tweets from all followers
	stmt := `SELECT t.id, u.profile_img, t.text, t.timestamp, u.screen_name FROM tweets t
	JOIN users u ON t.sender_id = u.id
	JOIN follows f ON f.followee_id = u.id
	WHERE f.follower_id = '4ec34dc0-fc79-4ce4-9202-86dc2b0af313'`

	rows, err := db.Query(stmt)
	if err != nil {
		log.Printf("%q: %s\n", err, stmt)
		return
	}
	defer rows.Close()

	var ts Timeline
	for rows.Next() {
		var t Tweet
		err = rows.Scan(&t.Id, &t.ProfileImg, &t.Text, &t.TimeStamp, &t.ScreenName)
		if err != nil {
			log.Fatal(err)
		}
		ts.Timeline = append(ts.Timeline, t)
	}
	b, err := json.Marshal(ts)
	if err != nil {
		log.Fatal(err)
	}
	w.Header().Set("Content-Type", "application/json")
	fmt.Fprintf(w, "%s\n", b)
}

// Handle posting of tweet
func postTweet(w http.ResponseWriter, r *http.Request) {
	decoder := json.NewDecoder(r.Body)
	var t Message

	if err := decoder.Decode(&t); err != nil {
		log.Fatal(err)
	}

	// inJWT := r.Header.Get("X-JWT-Assertion")

	db, err := sql.Open("sqlite3", "./tweets.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	tx, err := db.Begin()
	if err != nil {
		log.Fatal(err)
	}
	stmt, err := tx.Prepare("insert into tweets (sender_id, text, timestamp) values(?, ?, datetime())")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	if _, err := stmt.Exec("1234-5678", t.Text); err != nil {
		log.Fatal(err)
	}
	if err := tx.Commit(); err != nil {
		log.Fatal(err)
	}
	resp := make(map[string]string)
	resp["status"] = "Created"
	jsonResp, err := json.Marshal(resp)
	if err != nil {
		log.Fatal(err)
	}
	w.WriteHeader(http.StatusCreated)
	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonResp)
}

func testme(w http.ResponseWriter, r *http.Request) {
	myJWT := r.Header.Get("X-JWT-Assertion")
	log.Println(myJWT)
	// print all headers
	// for name, values := range r.Header {
	// 	for _, value := range values {
	// 		fmt.Println(name, value)
	// 	}
	// }
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte("{\"hello\": \"world\"}"))
}
