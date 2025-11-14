# Project 7 – Serverless API with Lambda & API Gateway

**Duration**: 6–8 hours  
**Goal**: Deliver a RESTful API using fully managed services and adopt infrastructure as code for deployment.

## Architecture

- Amazon API Gateway (REST API) with stage variables (`dev`, `prod`)
- AWS Lambda functions (Node.js or Python) with shared layers
- DynamoDB table for persistence
- IAM roles and resource policies to secure endpoints
- CloudWatch Logs & X-Ray tracing

## Implementation Steps

1. **Define the Contract** – Document endpoints (`/tasks`, `/tasks/{id}`) and methods (GET, POST, PATCH, DELETE).
2. **Author Lambda Functions** – Build handlers with input validation and structured responses.
3. **DynamoDB Schema** – Primary key `taskId` (string), TTL attribute for auto-expiry.
4. **Infrastructure as Code** – Use AWS SAM or CDK for repeatable deployments.
   ```yaml
   Resources:
     TasksTable:
       Type: AWS::DynamoDB::Table
       Properties:
         BillingMode: PAY_PER_REQUEST
         AttributeDefinitions:
           - AttributeName: taskId
             AttributeType: S
         KeySchema:
           - AttributeName: taskId
             KeyType: HASH
   ```
5. **Security** – Configure IAM authorizer or Cognito User Pool authorizer. Limit Lambda execution role permissions.
6. **Observability** – Enable X-Ray tracing, add structured logging (`logger = logging.getLogger(__name__)`).
7. **CI/CD** – Add `sam build` + `sam deploy` pipeline or CDK synth/deploy step.

## Validation

- Call API via `curl` or Postman; verify CRUD operations.
- Check DynamoDB table for data consistency.
- Inspect CloudWatch Logs for request IDs and latencies.

## Stretch Goals

- Add AWS Step Functions for workflow orchestration.
- Integrate with EventBridge for async processing.
- Implement custom domain name with ACM-managed certificate.
