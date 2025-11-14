# EventBridge – Event-Driven Architecture

**Estimated Time**: 6-8 hours

## What You'll Learn

- Event buses (default, custom, partner)
- Event patterns and filtering
- Rules and targets
- Scheduled events (cron/Rate)
- Cross-account events and SaaS integrations
- Dead-letter queues and retry policies

## Free Resources

- 📺 [AWS EventBridge Tutorial](https://www.youtube.com/watch?v=TXh5oU_yo9M)
- 📖 [EventBridge User Guide](https://docs.aws.amazon.com/eventbridge/)
- 📚 [Event Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html)

## Examples

```bash
# Trigger Lambda on EC2 termination
aws events put-rule \
  --name EC2StateChange \
  --event-pattern '{
    "source": ["aws.ec2"],
    "detail-type": ["EC2 Instance State-change Notification"],
    "detail": {
      "state": ["terminated"]
    }
  }'
aws events put-targets \
  --rule EC2StateChange \
  --targets Id=1,Arn=arn:aws:lambda:us-east-1:ACCOUNT_ID:function:NotifyTeam

# Scheduled rule (daily 9 AM UTC)
aws events put-rule \
  --name DailyBackup \
  --schedule-expression 'cron(0 9 * * ? *)'
```

## Use Cases

- **Audit automation** – Trigger Lambda when IAM policy changes
- **Data pipelines** – Fan-out S3 events to multiple consumers
- **Microservices** – Decouple services via event bus
- **Automation** – Cron replacements for AWS-native scheduling

## Best Practices

- ✅ Use schema registry to document event shapes
- ✅ Route failed invocations to DLQs or retry with exponential backoff
- ✅ Use archival/replay for debugging and reprocessing
- ✅ Leverage fine-grained permissions on custom buses
