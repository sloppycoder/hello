## testing gRPC service with go-micro

```
# update the proto file
cd proto/hello
protoc --micro_out=. --go_out=. hello.proto 

# build binaries
go build ./cmd/srv
go build ./cmd/cli

# run
./srv 
# antoher window
./cli
```

# update to test pull request 1
