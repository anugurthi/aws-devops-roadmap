# CodePipeline – CI/CD Automation

**Estimated Time**: 10-12 hours

## What You'll Learn

- Orchestrating end-to-end CI/CD pipelines
- Pipeline stages: Source, Build, Test, Deploy
- Integrations (CodeCommit, GitHub, Jenkins, etc.)
- Manual approval gates and notifications
- Cross-region/cross-account pipelines
- Blue/Green and canary deployment patterns

## Free Resources

- 📺 [AWS CodePipeline Complete Tutorial](https://www.youtube.com/watch?v=NwzJCSPSPZs)
- 📖 [CodePipeline User Guide](https://docs.aws.amazon.com/codepipeline/)
- 🎮 [CI/CD Workshop](https://catalog.workshops.aws/cicd/en-US)
- 📚 [CodePipeline Best Practices](https://aws.amazon.com/blogs/devops/)

## Reference Architecture

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  CodeCommit  │────▶│  CodeBuild   │────▶│  CodeDeploy  │────▶│     EC2      │
│   (Source)   │     │   (Build)    │     │   (Deploy)   │     │  (Production)│
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
       │                     │                     │                     │
       └─────────────────────┴─────────────────────┴─────────────────────┘
                         AWS CodePipeline Orchestration
```

## Files

### buildspec.yml (CodeBuild)
```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - echo "Installing dependencies..."
      - npm install
  
  pre_build:
    commands:
      - echo "Running tests..."
      - npm test
      - echo "Running linter..."
      - npm run lint
  
  build:
    commands:
      - echo "Building application..."
      - npm run build
      - echo "Build completed on `date`"
  
  post_build:
    commands:
      - echo "Creating deployment package..."
      - zip -r application.zip . -x "*.git*" "node_modules/*" "tests/*"

artifacts:
  files:
    - '**/*'
  name: BuildArtifact

cache:
  paths:
    - 'node_modules/**/*'
```

### appspec.yml (CodeDeploy)
```yaml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html

hooks:
  BeforeInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
  AfterInstall:
    - location: scripts/configure_app.sh
      timeout: 300
      runas: root
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
  ValidateService:
    - location: scripts/validate_service.sh
      timeout: 300
```

### pipeline.json
```json
{
  "pipeline": {
    "name": "NodeJS-CI-CD-Pipeline",
    "roleArn": "arn:aws:iam::ACCOUNT_ID:role/CodePipelineServiceRole",
    "artifactStore": {
      "type": "S3",
      "location": "my-codepipeline-artifacts-ACCOUNT_ID"
    },
    "stages": [
      {
        "name": "Source",
        "actions": [
          {
            "name": "SourceAction",
            "actionTypeId": {
              "category": "Source",
              "owner": "AWS",
              "provider": "CodeCommit",
              "version": "1"
            },
            "outputArtifacts": [{ "name": "SourceOutput" }],
            "configuration": {
              "RepositoryName": "my-app-repo",
              "BranchName": "main",
              "PollForSourceChanges": "false"
            }
          }
        ]
      },
      {
        "name": "Build",
        "actions": [
          {
            "name": "BuildAction",
            "actionTypeId": {
              "category": "Build",
              "owner": "AWS",
              "provider": "CodeBuild",
              "version": "1"
            },
            "inputArtifacts": [{ "name": "SourceOutput" }],
            "outputArtifacts": [{ "name": "BuildOutput" }],
            "configuration": {
              "ProjectName": "my-build-project"
            }
          }
        ]
      },
      {
        "name": "Approval",
        "actions": [
          {
            "name": "ManualApproval",
            "actionTypeId": {
              "category": "Approval",
              "owner": "AWS",
              "provider": "Manual",
              "version": "1"
            },
            "configuration": {
              "CustomData": "Please review and approve deployment to production",
              "NotificationArn": "arn:aws:sns:us-east-1:ACCOUNT_ID:pipeline-approvals"
            }
          }
        ]
      },
      {
        "name": "Deploy",
        "actions": [
          {
            "name": "DeployAction",
            "actionTypeId": {
              "category": "Deploy",
              "owner": "AWS",
              "provider": "CodeDeploy",
              "version": "1"
            },
            "inputArtifacts": [{ "name": "BuildOutput" }],
            "configuration": {
              "ApplicationName": "my-application",
              "DeploymentGroupName": "production"
            }
          }
        ]
      }
    ]
  }
}
```

## Pipeline Setup Commands

```bash
aws s3 mb s3://my-codepipeline-artifacts-$(aws sts get-caller-identity --query Account --output text)
aws codepipeline create-pipeline --cli-input-json file://pipeline.json
```

## Best Practices

- ✅ Use artifacts bucket in same region as pipeline
- ✅ Enable encryption on artifact stores
- ✅ Add manual approval before production deployments
- ✅ Integrate with CloudWatch Events / EventBridge for notifications
- ✅ Use separate CodeBuild projects per environment or stage
- ✅ Tag pipelines and stages for cost tracking
