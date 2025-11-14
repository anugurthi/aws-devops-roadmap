# Route 53 – DNS Management

**Estimated Time**: 4-6 hours

## What You'll Learn

- Domain registration and management
- DNS record types (A, AAAA, CNAME, MX, TXT)
- Hosted zones (public vs private)
- Routing policies (Simple, Weighted, Latency, Failover, Geolocation)
- Health checks and monitoring
- Traffic flow and geoproximity routing
- Integrations with AWS services

## Free Resources

- 📺 [AWS Route 53 Tutorial](https://www.youtube.com/watch?v=BtiS0QBsz7E) – Stephane Maarek
- 📖 [Route 53 Developer Guide](https://docs.aws.amazon.com/route53/)
- 📚 [DNS Fundamentals](https://www.cloudflare.com/learning/dns/what-is-dns/)
- 🎮 [Route 53 Hands-On Lab](https://aws.amazon.com/getting-started/hands-on/get-a-domain/)

## DNS Record Types

| **Record Type** | **Purpose** | **Example** |
|---|---|---|
| **A** | IPv4 address | example.com → 192.0.2.1 |
| **AAAA** | IPv6 address | example.com → 2001:0db8::1 |
| **CNAME** | Alias for another domain | www.example.com → example.com |
| **MX** | Mail server | example.com → mail.example.com |
| **TXT** | Text information | SPF, DKIM records |
| **NS** | Name server | Delegation to name servers |
| **Alias** | AWS resource mapping | example.com → ELB |

## Routing Policies

- **Simple** – Single resource
- **Weighted** – Traffic distribution by percentage
- **Latency** – Choose lowest latency endpoint
- **Failover** – Active/passive failover
- **Geolocation** – Route based on user location
- **Geoproximity** – Route based on resource + user location
- **Multi-value** – Return multiple IPs with health checks

## Hands-On Project – Custom Domain with Blue/Green Deployment

```bash
# Create hosted zone
aws route53 create-hosted-zone \
  --name example.com \
  --caller-reference $(date +%s) \
  --hosted-zone-config Comment="Production domain"

# Simple A record
cat > change-batch.json << 'EOF'
{
  "Changes": [{
    "Action": "CREATE",
    "ResourceRecordSet": {
      "Name": "example.com",
      "Type": "A",
      "TTL": 300,
      "ResourceRecords": [{"Value": "203.0.113.1"}]
    }
  }]
}
EOF
aws route53 change-resource-record-sets \
  --hosted-zone-id Z1234567890ABC \
  --change-batch file://change-batch.json

# Health check
aws route53 create-health-check \
  --health-check-config IPAddress=203.0.113.1,Port=80,Type=HTTP,ResourcePath=/health \
  --caller-reference $(date +%s)

# Weighted routing for Blue/Green
aws route53 change-resource-record-sets --hosted-zone-id Z1234567890ABC --change-batch '{
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "app.example.com",
        "Type": "A",
        "SetIdentifier": "Blue",
        "Weight": 90,
        "TTL": 60,
        "ResourceRecords": [{"Value": "203.0.113.1"}]
      }
    },
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "app.example.com",
        "Type": "A",
        "SetIdentifier": "Green",
        "Weight": 10,
        "TTL": 60,
        "ResourceRecords": [{"Value": "203.0.113.2"}]
      }
    }
  ]
}'
```

Use the weighted policy to gradually shift traffic during deployments and quickly roll back by adjusting weights.
