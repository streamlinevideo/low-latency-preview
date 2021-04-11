FROM golang:1.11.10
WORKDIR $GOPATH/src/app
COPY . .
RUN mkdir -p www logs
RUN go get -d -v ./...
RUN go install -v ./...
EXPOSE 8080
CMD ["app", "'./www'"]

