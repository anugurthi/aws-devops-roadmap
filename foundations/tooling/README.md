# Local Tooling & Automation Setup

Install the core tools used throughout the roadmap before starting service-specific labs.

## Essential Installs

| Tool | Purpose | Install Notes |
| --- | --- | --- |
| AWS CLI v2 | Primary interface for automation | `brew install awscli` or download bundled installer |
| Terraform | IaC for multi-cloud workflows | `brew tap hashicorp/tap && brew install hashicorp/tap/terraform` |
| AWS SAM CLI | Serverless builds & testing | `brew install aws-sam-cli` |
| Docker Desktop / Colima | Container builds for ECS/EKS labs | Ensure 4 vCPUs / 8 GB RAM allocated |
| Node.js LTS | CDK & frontend build steps | `nvm install --lts` |
| Python 3.11 | Lambda + automation scripts | Use `pyenv` or system package manager |

## Suggested Project Structure

```
~/aws-devops-labs/
├── foundations/
├── services/
│   ├── 01-aws-fundamentals/
│   ├── 02-iam/
│   └── ...
├── projects/
└── scratchpad/
```

## Shell Customization

```bash
# ~/.zshrc additions
export AWS_REGION=us-east-1
export AWS_PAGER=""
alias k=kubectl
alias tf="terraform"

# enable command completion
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
```

## Validation Script

Create `validate-tools.sh` to verify installations:

```bash
#!/usr/bin/env bash
set -euo pipefail

commands=(aws terraform sam docker kubectl node python3)
for cmd in "${commands[@]}"; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "[MISSING] $cmd" && missing=1
  else
    echo "[OK] $cmd -> $("$cmd" --version | head -n1)"
  fi
done

exit ${missing:-0}
```

Run it after provisioning a new workstation to ensure consistency.
