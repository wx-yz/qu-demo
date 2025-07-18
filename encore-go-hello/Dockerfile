FROM golang:1.20-buster
WORKDIR /app
COPY . .
RUN go install encore.dev/cli@latest
ENV PATH="/root/go/bin:$PATH"
USER 10001
CMD ["encore", "run"]
