# Project 3 – S3 Static Website with CloudFront CDN

**Duration**: 4–6 hours  
**Goal**: Host a static website with global distribution, HTTPS, and automation-friendly deployments.

## Components

- S3 bucket for website hosting (block public access disabled with bucket policy safeguards)
- CloudFront distribution with origin access control (OAC)
- Route 53 hosted zone + ACM certificate (us-east-1) for custom domain
- CI deployment script (GitHub Actions or CodeBuild) syncing site assets to S3

## Steps

1. **Prepare Assets** – Create a sample static site (`index.html`, `assets/`). Store source in this folder under `site/`.
2. **Provision S3 Bucket** – Enable versioning, default encryption, and configure static website hosting endpoint.
3. **Secure Access** – Use origin access control (preferred) or legacy origin access identity to restrict direct S3 access.
4. **Create CloudFront Distribution** –
   - Origin: S3 bucket with OAC
   - Default behavior: redirect HTTP → HTTPS
   - Enable caching policies (Managed-CachingOptimized)
   - Configure custom error responses (404, 403)
5. **Domain Setup** – Request certificate in `us-east-1`, validate DNS, create `A`/`AAAA` aliases pointing to CloudFront.
6. **Deployment Automation** –
   ```bash
   aws s3 sync ./site s3://<bucket-name> --delete
   aws cloudfront create-invalidation --distribution-id <id> --paths "/*"
   ```
   Add the above to a pipeline or GitHub Actions workflow for push-to-deploy.
7. **Monitoring** – Enable CloudFront access logs to S3 or Kinesis Data Firehose, set up CloudWatch alarms for 4xx/5xx spikes.

## Validation

- Browse to the custom domain and ensure HTTPS lock is present.
- Confirm direct S3 website endpoint is inaccessible if using OAC.
- Run `lighthouse` or WebPageTest to measure performance improvements.

## Stretch Goals

- Add Lambda@Edge/CloudFront Functions for header manipulation and redirects.
- Integrate AWS WAF with managed rule sets for basic protection.
- Implement CI pipeline that zips and uploads artifacts + invalidates cache automatically.
