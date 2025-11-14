# AWS Developer Tools (CodeCommit, CodeBuild, CodeDeploy)

**Estimated Time**: 10-12 hours

## What You'll Learn

- Git repository hosting with CodeCommit
- Build automation using CodeBuild
- Deployment automation with CodeDeploy
- IAM roles and policies for developer tools
- Integrating AWS Developer Tools with external VCS providers
- Managing buildspec and appspec files
- Artifact storage and pipeline hand-offs

## Free Resources

- 📺 [AWS CodeCommit Tutorial](https://www.youtube.com/watch?v=T4u5ek-P7cA)
- 📺 [AWS CodeBuild Deep Dive](https://www.youtube.com/watch?v=uPMBVfBNyEg)
- 📺 [AWS CodeDeploy Tutorial](https://www.youtube.com/watch?v=HcpmvqPFcr0)
- 📖 [AWS Developer Tools Documentation](https://aws.amazon.com/products/developer-tools/)

## Getting Started

1. **Create a CodeCommit repository**
   ```bash
   aws codecommit create-repository --repository-name my-app --repository-description "Infrastructure automation demo"
   ```
2. **Create a CodeBuild project** linked to the repo and specify `buildspec.yml`.
3. **Create a CodeDeploy application and deployment group** targeting EC2/Auto Scaling or ECS.
4. Use IAM roles:
   - `CodeCommitServiceRole`
   - `CodeBuildServiceRole`
   - `CodeDeployServiceRole`

## Key Files

- `buildspec.yml` – Defines build phases, commands, artifacts
- `appspec.yml` – Declares deployment instructions and lifecycle hooks
- `scripts/` – Hook scripts executed during CodeDeploy lifecycle events

Refer to the CodePipeline module for full CI/CD orchestration that ties these services together.
