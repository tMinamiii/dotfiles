ddb := connect()
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

