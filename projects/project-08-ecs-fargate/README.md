# Project 8 – Containerized Application on ECS Fargate

**Duration**: 10–12 hours  
**Goal**: Deploy a microservice to Amazon ECS using serverless Fargate launch type.

## Architecture

- ECR repository storing container images
- ECS cluster with Fargate capacity
- Application Load Balancer (HTTPS) fronting the service
- Private subnets with NAT for outbound access
- AWS Secrets Manager for configuration values
- CloudWatch Logs for container stdout/stderr

## Implementation Checklist

1. **Dockerize App** – Build sample Node.js/Flask app with health endpoint. Store Dockerfile under `app/`.
2. **Create ECR Repo** – Tag and push image (`:v1`). Enable scan on push.
3. **Task Definition** – Configure container port, CPU/memory, environment variables from Secrets Manager.
4. **Service** – Set desired count (2+), attach to ALB target group, enable circuit breaker with rollback.
5. **Auto Scaling** – Configure target tracking on average CPU (50%) and memory (65%).
6. **CI/CD** – Build & push container image via pipeline; update ECS service with new task definition revision.
7. **Logging & Metrics** – Send container logs to CloudWatch Logs; enable Container Insights for metrics.

## Sample `ecs-params.yml`

```yaml
version: 1
run_params:
  network_configuration:
    awsvpc_configuration:
      subnets:
        - subnet-abc
        - subnet-def
      security_groups:
        - sg-ecs-service
      assign_public_ip: DISABLED
```

## Validation

- Hitting ALB DNS name returns healthy response.
- Deploying new image triggers rolling update with zero downtime.
- CloudWatch dashboards reflect CPU/memory trends and service counts.

## Stretch Goals

- Add service mesh (AWS App Mesh) for observability and traffic shift.
- Enable AWS WAF on the ALB for security.
- Implement blue/green deployments using CodeDeploy for ECS.
