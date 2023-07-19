
-- tweets definition

CREATE TABLE tweets (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	sender_id TEXT,
	"text" TEXT,
	"timestamp" TEXT
);

-- follows definition

CREATE TABLE follows (
	follower_id TEXT,
	followee_id TEXT
);

-- users definition

CREATE TABLE users (
	id TEXT,
	screen_name TEXT,
	profile_img TEXT
);

INSERT INTO users (id,screen_name,profile_img) VALUES
	 ("246729b6-0321-44c6-960f-e9d36ce8377c",'alice','https://static.wikia.nocookie.net/disney/images/7/75/Profile_-_Alice.jpeg/revision/latest?cb=20190312054522'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b",'bob','https://pbs.twimg.com/profile_images/1618018399723962371/_rFrYivV_400x400.jpg'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313",'john','https://static.wikia.nocookie.net/unordinary6344/images/f/fe/Unordinary_John_new_look.png/revision/latest?cb=20211222045243'),
	 ("e7c46917-28f4-43ff-8997-f75d8940af04",'mary','https://static.wikia.nocookie.net/sonypicturesanimation/images/0/00/Profile_-_Mary_Jane_Watson.png/revision/latest/scale-to-width-down/258?cb=20230105085107');

INSERT INTO tweets (sender_id,"text","timestamp") VALUES
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","I've been thinking a lot about how, if 50% of employees were fired tomorrow, businesses would immediately become 50% more efficient.",'2023-07-18 18:39:35'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","All businesses, but especially startups, need people who can do low-level work. But it's a mistake to assume that hiring such people makes you efficient.",'2023-07-18 18:39:55'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","When I worked at Google, (a) there was almost nothing we didn't know how to do, (b) we had no idea how to do, and (c) we were often too stupid to bother asking.",'2023-07-18 18:40:01'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","To ask What's the harm? is to ask the wrong question. The question to ask is What good can it do?",'2023-07-18 18:40:08'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","When Elon Musk says something that seems crazy, it's usually because he thinks something no one thinks about.",'2023-07-18 18:40:15'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","Someone asked me why I thought AI would mostly be bad. I said it seemed likely that over time, humans would become less creative, less interesting, and less fun to be around.",'2023-07-18 18:40:18'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","The hardest thing is deciding which of the 50,000 things you want to do is most important.",'2023-07-18 18:40:21'),
	 ("246729b6-0321-44c6-960f-e9d36ce8377c","If you're worried about how accurate a chatbot is, don't. It's much more important that it's talkative.",'2023-07-18 18:40:23'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","The secret to consistent personal progress:

✅ No excuses

✅ No distractions

✅ No drama

✅ No burnout

✅ No fear

✅ No blame

✅ No guilt",'2023-07-18 18:48:09'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","Steal these words to 10x your hooks:

The only way to succeed is to fail.

—Warren Buffett",'2023-07-18 18:48:13');
INSERT INTO tweets (sender_id,"text","timestamp") VALUES
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","The most underrated skill?

Empathy.

The ability to put yourself in someone else's shoes.

Without it, you'll only ever think for yourself.

And that's a problem.",'2023-07-18 18:48:18'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","The 85/15 rule:

85% of your day should be spent doing (and enjoying) the things you love.

15% of your time should be spent working on the things that bring you income.",'2023-07-18 18:48:22'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","The secret to creating a fulfilling life is this:

Consistency.

The 100 times you show up when no one's watching.

The 100 things you do that no one else wants to do.

The 100 things you do every single day, for years on end.

The kind of stuff that doesn't get noticed or appreciated, but it's the stuff that builds empires.",'2023-07-18 18:48:28'),
	 ("b7134a18-afab-4b13-9a3e-64534532ae6b","The secret to happiness:

Consistency.",'2023-07-18 18:48:32'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","The most valuable skill you can learn:

How to be comfortable being uncomfortable.",'2023-07-18 18:51:53'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","The 9/5/4 Rule of delegation:

Delegate 9% of tasks to people below you. Delegate 5% of tasks to people above you. And delegate 4% of tasks to anyone.

The 9% of tasks below you:

1. The 99% of tasks that don’t require your genius",'2023-07-18 18:51:57'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","The 9/90 Rule:

9 hours of deliberate study, 90 hours of practice.,'2023-07-18 18:52:00'),
	 (4ec34dc0-fc79-4ce4-9202-86dc2b0af313,The best career advice I’ve ever received:

“Don’t stop learning—especially when nobody’s looking.”

—Anonymous",'2023-07-18 18:52:03'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","When reading fiction, you should:

1. Think of characters as real people.
2. Try to imagine yourself in the story.
3. Ask yourself: If this story were true, how would my life be different?
4. Ask yourself: If this story were real, how would I respond?

You'll never know if a story is true unless you imagine yourself in the story.",'2023-07-18 18:52:07'),
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","The 5 components to making great art:

1. Set a high standard.
2. Work towards it.
3. Keep going even when it's not fun.
4. Ask others for feedback.
5. Repeat.",'2023-07-18 18:52:12');
INSERT INTO tweets (sender_id,"text","timestamp") VALUES
	 ("4ec34dc0-fc79-4ce4-9202-86dc2b0af313","Instead of asking, 'What can I do?' ask yourself, 'What am I willing to do?'

—Stephen R. Covey",'2023-07-18 18:52:16'),
	 ("e7c46917-28f4-43ff-8997-f75d8940af04","You will fail at something.

You will fail at many things throughout your life.

But your failures are your lessons.

Learn from your failures.

Never quit."
,'2023-07-18 18:59:39');




INSERT INTO follows (follower_id, followee_id) VALUES('246729b6-0321-44c6-960f-e9d36ce8377c', 'b7134a18-afab-4b13-9a3e-64534532ae6b');
INSERT INTO follows (follower_id, followee_id) VALUES('246729b6-0321-44c6-960f-e9d36ce8377c', '4ec34dc0-fc79-4ce4-9202-86dc2b0af313');
INSERT INTO follows (follower_id, followee_id) VALUES('246729b6-0321-44c6-960f-e9d36ce8377c', 'e7c46917-28f4-43ff-8997-f75d8940af04');

INSERT INTO follows (follower_id, followee_id) VALUES('4ec34dc0-fc79-4ce4-9202-86dc2b0af313', 'e7c46917-28f4-43ff-8997-f75d8940af04');
INSERT INTO follows (follower_id, followee_id) VALUES('4ec34dc0-fc79-4ce4-9202-86dc2b0af313', 'b7134a18-afab-4b13-9a3e-64534532ae6b');
