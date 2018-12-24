package main

import (
	"context"
	"sync"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// HandleRequest represents
func resizer(ctx context.Context, event events.S3Event) (interface{}, error) {
	wg := &sync.WaitGroup{}
	for _, record := range event.Records {
		// routine(wg, record)
	}
	wg.Wait()
	resp := &struct {
		StatusCode uint `json:"statusCode"`
	}{StatusCode: 200}
	return resp, nil
}

func main() {
	lambda.Start(resizer)
}
