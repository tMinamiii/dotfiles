import (
	"fmt"
	"takeo-archives/system/adminconsole/awsutil"
	"takeo-archives/system/datatype"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
)

func Update1() {
	uii := &dynamodb.UpdateItemInput{
		TableName: aws.String(tablename),
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(id),
			},
		},
		UpdateExpression: aws.String("SET s3_main_image.original = :original, s3_main_image.small = :small"),
		ExpressionAttributeValues: map[string]*dynamodb.AttributeValue{
			":original": {S: aws.String(original)},
			":small":    {S: aws.String(small)},
		},
		ReturnValues: aws.String("UPDATED_NEW"),
	}
}

func Update2() {
	exp := fmt.Sprintf("SET s3_sub_images[%s].original = :original, s3_sub_images[%s].small = :small", index, index)

	uii := &dynamodb.UpdateItemInput{
		TableName: aws.String(tablename),
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(id),
			},
		},
		UpdateExpression: aws.String(exp),
		ExpressionAttributeValues: map[string]*dynamodb.AttributeValue{
			":original": {S: aws.String(original)},
			":small":    {S: aws.String(small)},
		},
		ReturnValues: aws.String("UPDATED_NEW"),
	}

}

func Update3() {
	updateItem := &dynamodb.UpdateItemInput{
		TableName: aws.String(tableName),
		Key: map[string]*dynamodb.AttributeValue{
			"id": {
				S: aws.String(creator.ID),
			},
		},
		UpdateExpression:            aws.String(dynamoutil.CreateUpdateExpression(creator)),
		ExpressionAttributeNames:    dynamoutil.CreateExpressionAttributeNames(creator),
		ExpressionAttributeValues:   dynamoutil.CreateExpressionAttributeValues(creator),
		ReturnConsumedCapacity:      aws.String("NONE"),
		ReturnItemCollectionMetrics: aws.String("NONE"),
		ReturnValues:                aws.String("NONE"),
	}
}

func scanData() {
	table := awsutil.DynamoTableName()
	var limit int64
	if event.Data.Limit == 0 {
		limit = 50
	} else {
		limit = event.Data.Limit
	}
	qin := &dynamodb.QueryInput{
		TableName:              aws.String(table),
		KeyConditionExpression: aws.String("#category = :category AND #id >= :first_id"),
		ExpressionAttributeNames: map[string]*string{
			"#id":       aws.String("id"),
			"#category": aws.String("archives_category"),
		},
		ExpressionAttributeValues: map[string]*dynamodb.AttributeValue{
			":first_id": {
				N: aws.String("1"),
			},
			":category": {
				S: aws.String(event.Category),
			},
		},
		Limit:             aws.Int64(limit),
		ExclusiveStartKey: event.Data.LastEvaluatedKey,
		ScanIndexForward:  aws.Bool(false),
	}
	out, err := ddb.Query(qin)
	archives := unmarshalItem(event.Category, out.Items)
	resp := &struct {
		StatusCode       uint        `json:"statusCode"`
		Count            *int64      `json:"count"`
		ScannedCount     *int64      `json:"scanned_count"`
		Items            interface{} `json:"items"`
		LastEvaluatedKey interface{} `json:"LastEvaluatedKey"`
	}{
		StatusCode:       200,
		Count:            out.Count,
		ScannedCount:     out.ScannedCount,
		Items:            archives,
		LastEvaluatedKey: out.LastEvaluatedKey,
	}
	return resp, err
}

func (event *TakeoArchivesEvent) showData() (interface{}, error) {
	tablename := awsutil.DynamoTableName()

	getInput := &dynamodb.GetItemInput{
		TableName: aws.String(tablename),
		Key: map[string]*dynamodb.AttributeValue{
			"archives_category": {
				S: aws.String(event.Category),
			},
			"id": {
				N: aws.String(event.ID),
			},
		},
	}

	getItemResp, err := ddb.GetItem(getInput)
	if err != nil {
		resp := datatype.CreateErrorResponse(err)
		return resp, err
	}

	archives := unmarshalItem(event.Category, getItemResp.Item)
	resp := &struct {
		StatusCode uint        `json:"statusCode"`
		Items      interface{} `json:"items"`
	}{
		StatusCode: 200,
		Items:      archives,
	}
	return resp, err
}
