import (
	"fmt"

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
