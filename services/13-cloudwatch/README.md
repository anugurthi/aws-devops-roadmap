# CloudWatch – Monitoring & Logging

**Estimated Time**: 8-10 hours

## What You'll Learn

- CloudWatch metrics, dashboards, and custom metrics
- CloudWatch Logs, Log Insights, and log retention
- CloudWatch Alarms with SNS notifications
- Composite alarms and anomaly detection
- CloudWatch Synthetics and RUM
- Container Insights, Lambda Insights, and Application Insights

## Free Resources

- 📺 [AWS CloudWatch Tutorial](https://www.youtube.com/watch?v=qVYnlxdEebE)
- 📖 [CloudWatch User Guide](https://docs.aws.amazon.com/cloudwatch/)
- 📚 [Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)

## Command Reference

```bash
# Log groups
aws logs create-log-group --log-group-name /aws/myapp/production
aws logs tail /aws/lambda/my-function --follow --format short

# Custom metrics
aws cloudwatch put-metric-data \
  --namespace MyApp \
  --metric-name PageViewCount \
  --value 1 \
  --timestamp $(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Alarm
aws cloudwatch put-metric-alarm \
  --alarm-name HighCPU \
  --alarm-description "CPU exceeds 80%" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:us-east-1:ACCOUNT_ID:alerts

# Logs Insights query
aws logs start-query \
  --log-group-name /aws/lambda/my-function \
  --start-time $(date -d "1 hour ago" +%s) \
  --end-time $(date +%s) \
  --query-string 'fields @timestamp, @message | filter @message like /ERROR/ | sort @timestamp desc | limit 20'

# Dashboards
aws cloudwatch put-dashboard \
  --dashboard-name MyAppDashboard \
  --dashboard-body file://dashboard.json
```

## Dashboard Example

```json
{
  "widgets": [
    {
      "type": "metric",
      "width": 12,
      "height": 6,
      "properties": {
        "title": "CPU Utilization",
        "metrics": [
          ["AWS/EC2", "CPUUtilization", "AutoScalingGroupName", "production-asg"]
        ],
        "stat": "Average",
        "period": 300,
        "region": "us-east-1"
      }
    }
  ]
}
```

## Best Practices

- ✅ Centralize logs with CloudWatch Logs and set retention policies
- ✅ Create dashboards per workload (infrastructure, application, business KPIs)
- ✅ Use metric math and anomaly detection for advanced alerting
- ✅ Tag alarms with environment and workload metadata
- ✅ Forward critical alarms to PagerDuty/Slack via SNS + Lambda
