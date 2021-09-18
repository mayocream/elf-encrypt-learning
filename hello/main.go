package main

import (
	"fmt"
	"time"
)

func main() {
	go func() {
		time.Sleep(999 * time.Second)
	}()
	go fmt.Println("hello world!")
	select {}
}
