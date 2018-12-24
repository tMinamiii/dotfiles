import (
	"io/ioutil"
	"log"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/s3"
)

func GetObjectImage() {
	goi := &s3.GetObjectInput{
		Bucket: aws.String(bucket),
		Key:    aws.String(s3Key),
	}
	log.Println("Fetch!!! ", bucket, s3Key)
	resp, err := s3Sess.GetObject(goi)
	if err != nil {
		log.Fatal(err.Error())
		return nil
	}
	if resp.Body == nil {
		log.Fatal("Body is nil")
		return nil
	}
	b, _ := ioutil.ReadAll(resp.Body)
	return b
}

