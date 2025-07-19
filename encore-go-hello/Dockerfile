FROM golang:1.20-buster
WORKDIR /app
COPY . .
RUN curl -L https://encore.dev/install.sh | bash
ENV PATH="/root/go/bin:$PATH"
USER 10001
CMD ["~/.encore/bin/encore", "run"]
