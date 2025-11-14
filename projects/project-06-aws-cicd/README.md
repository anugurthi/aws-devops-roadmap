# Project 6 – AWS Native CI/CD Pipeline

**Duration**: 10–12 hours  
**Goal**: Build an automated delivery pipeline with CodeCommit, CodeBuild, CodeDeploy, and CodePipeline.

## Pipeline Stages

1. **Source** – CodeCommit repository (or GitHub trigger via CodeStar connection)
2. **Build** – CodeBuild project running tests and packaging artifacts
3. **Test** – Optional integration tests (Selenium, API tests) triggered via CodeBuild or Lambda
4. **Deploy** – CodeDeploy to EC2 Auto Scaling group or ECS service
5. **Post-Deploy** – Manual approval + notify via SNS/Slack webhook

## Implementation Steps

1. **Repository Setup** – Create repo structure (`app/`, `infrastructure/`, `buildspec.yml`). Seed with sample application.
2. **CodeBuild** – Write `buildspec.yml` covering install, pre_build, build, post_build phases. Publish artifacts to S3.
3. **CodeDeploy** – Define `appspec.yml` and lifecycle hooks (BeforeInstall, AfterInstall, ApplicationStart). Include scripts.
4. **CodePipeline** – Wire stages together with IAM service roles. Enable artifact encryption and cross-region replication if needed.
5. **Approvals & Notifications** – Add manual approval action before production deploy. Integrate SNS or Chatbot for alerts.
6. **Monitoring** – Enable pipeline execution CloudWatch Events → EventBridge → Lambda for custom notifications.

## Sample `buildspec.yml`

```yaml
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 18
  build:
    commands:
      - npm ci
      - npm test -- --watch=false
      - npm run build
artifacts:
  files:
    - dist/**/*
  base-directory: dist
cache:
  paths:
    - node_modules/**/*
```

## Validation Checklist

- ✅ Commits trigger pipeline automatically
- ✅ Failing tests stop the pipeline and notify stakeholders
- ✅ Blue/green or canary deployment succeeds with health checks
- ✅ Rollbacks work when health checks fail

## Stretch Goals

- Add security scanning stage (Snyk, Trivy, or AWS CodeGuru Security)
- Configure cross-account deployment to staging/prod accounts
- Use Parameter Store or Secrets Manager for configuration injection
