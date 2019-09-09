package main

import (
	"context"
	"fmt"

	"github.com/micro/go-micro"
	_ "github.com/micro/go-plugins/registry/kubernetes"

	hello "github.com/sloppycoder/hello/proto/hello"
)

func main() {
	// create a new service
	service := micro.NewService()

	// parse command line flags
	service.Init()

	// Use the generated client stub
	cl := hello.NewSayService("hello.srv.greeter", service.Client())

	// Make request
	rsp, err := cl.Hello(context.Background(), &hello.Request{
		Name: "John",
	})
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println(rsp.Msg)
}
