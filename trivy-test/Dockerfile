FROM golang:1.19.2-bullseye

USER 10001

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o /main

EXPOSE 8080

CMD ["/main"]
