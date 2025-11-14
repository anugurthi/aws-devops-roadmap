# Lambda – Serverless Computing

**Estimated Time**: 8-10 hours

## What You'll Learn

- Lambda execution model and pricing
- Event sources and triggers
- Packaging dependencies and Lambda layers
- Environment variables and secrets
- VPC integration, concurrency, and performance tuning
- Lambda@Edge and Step Functions integrations

## Free Resources

- 📺 [AWS Lambda Full Course](https://www.youtube.com/watch?v=Gjnup-PuquQ)
- 📖 [Lambda Developer Guide](https://docs.aws.amazon.com/lambda/)
- 🎮 [Serverless Workshops](https://catalog.workshops.aws/serverless/en-US)
- 📚 [Lambda Best Practices](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html)

## Sample Function (Python)

```python
import json
import boto3
import os

s3 = boto3.client('s3')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    try:
        for record in event['Records']:
            bucket = record['s3']['bucket']['name']
            key = record['s3']['object']['key']
            size = record['s3']['object']['size']
            response = s3.head_object(Bucket=bucket, Key=key)

            table.put_item(
                Item={
                    'file_name': key,
                    'bucket': bucket,
                    'size': size,
                    'last_modified': response['LastModified'].isoformat(),
                    'content_type': response.get('ContentType', 'unknown')
                }
            )
            print(f"Processed: {key} from {bucket}")

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Success'})
        }

    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
```

## Deployment Workflow

```bash
zip function.zip lambda_function.py

aws lambda create-function \
  --function-name ProcessS3Events \
  --runtime python3.11 \
  --role arn:aws:iam::ACCOUNT_ID:role/LambdaExecutionRole \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip \
  --environment Variables={TABLE_NAME=file-metadata} \
  --timeout 30 \
  --memory-size 256

aws lambda add-permission \
  --function-name ProcessS3Events \
  --statement-id s3-trigger \
  --action lambda:InvokeFunction \
  --principal s3.amazonaws.com \
  --source-arn arn:aws:s3:::my-bucket

aws s3api put-bucket-notification-configuration \
  --bucket my-bucket \
  --notification-configuration file://notification.json

aws lambda invoke \
  --function-name ProcessS3Events \
  --payload '{"key1":"value1"}' \
  response.json

aws lambda update-function-code \
  --function-name ProcessS3Events \
  --zip-file fileb://function.zip

aws logs tail /aws/lambda/ProcessS3Events --follow
```

## Best Practices

- ✅ Keep deployment packages small; leverage layers for shared dependencies
- ✅ Use provisioned concurrency for latency-sensitive workloads
- ✅ Set reserved concurrency to protect downstream resources
- ✅ Monitor with CloudWatch metrics (Invocations, Errors, Duration, Throttles)
- ✅ Store configuration in SSM Parameter Store or Secrets Manager
