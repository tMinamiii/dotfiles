package main

import (
	"context"
	"fmt"

	"github.com/olivere/elastic"
)

func readCsv() [][]string {
	return make([][]string, 4)
}

func main() {
	// workMapping := readFile("./mappings/work.json")

	// Starting with elastic.v5, you must pass a context to execute each service
	ctx := context.Background()
	client, err := elastic.NewClient(elastic.SetURL("http://127.0.0.1:9200"))
	if err != nil {
		panic(err)
	}

	// createMapping(ctx, client, "works", string(workMapping))

	fmt.Print("\n ###### 作品 ###### \n\n")
	works := readCsv()
	for _, work := range works {
		_, err := client.Index().Index("works").Type("works").BodyJson(work).Do(ctx)
		if err != nil {
			panic(err)
		}
	}
}
