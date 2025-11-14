# EC2 – Elastic Compute Cloud

**Estimated Time**: 8-10 hours

## What You'll Learn

- EC2 instance types and families
- Amazon Machine Images (AMIs)
- Security Groups and Network ACLs
- SSH key pairs and instance access
- User Data scripts for automation
- EC2 pricing models (On-Demand, Reserved, Spot)
- Auto Scaling Groups
- Elastic IP addresses
- Instance metadata and user data

## Free Resources

- 📺 [AWS EC2 Tutorial](https://www.youtube.com/watch?v=8TlukLu11Yo) – TechWorld with Nana
- 📖 [EC2 User Guide](https://docs.aws.amazon.com/ec2/)
- 🎮 [EC2 Hands-On Labs](https://aws.amazon.com/getting-started/hands-on/launch-a-virtual-machine/)
- 📺 [EC2 Instance Types Explained](https://www.youtube.com/watch?v=PYh77Fp7_aY)

## Instance Type Comparison

| **Type** | **Use Case** | **Example** |
|---|---|---|
| **t3, t4g** | General purpose, burstable | Web servers, dev environments |
| **m5, m6i** | Balanced compute/memory | Application servers |
| **c5, c6i** | Compute optimized | High-performance computing |
| **r5, r6i** | Memory optimized | Databases, caching |
| **p3, p4** | GPU instances | Machine learning, rendering |

## Hands-On Project – Deploy Jenkins on EC2

Launch an EC2 instance and install Jenkins for CI/CD.

### Step 1 – Provision Networking + SSH Access

```bash
# Create key pair
aws ec2 create-key-pair \
  --key-name jenkins-key \
  --query 'KeyMaterial' \
  --output text > jenkins-key.pem
chmod 400 jenkins-key.pem

# Create security group
aws ec2 create-security-group \
  --group-name jenkins-sg \
  --description "Security group for Jenkins"

# Allow SSH (22) and Jenkins (8080)
aws ec2 authorize-security-group-ingress \
  --group-name jenkins-sg \
  --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress \
  --group-name jenkins-sg \
  --protocol tcp --port 8080 --cidr 0.0.0.0/0
```

### Step 2 – User Data Script

Save as `jenkins-install.sh`.

```bash
#!/bin/bash
# Update system
yum update -y

# Install Java
amazon-linux-extras install java-openjdk11 -y

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install jenkins -y

# Start Jenkins
systemctl start jenkins
systemctl enable jenkins

# Print initial admin password
echo "Jenkins Initial Password:" > /tmp/jenkins-init.txt
cat /var/lib/jenkins/secrets/initialAdminPassword >> /tmp/jenkins-init.txt
```

### Step 3 – Launch Instance

```bash
aws ec2 run-instances \
  --image-id ami-0c55b159cbfafe1f0 \
  --count 1 \
  --instance-type t2.micro \
  --key-name jenkins-key \
  --security-groups jenkins-sg \
  --user-data file://jenkins-install.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Jenkins-Server}]'
```

### Step 4 – Access Jenkins

1. Retrieve public IP: `aws ec2 describe-instances --filters "Name=tag:Name,Values=Jenkins-Server"`
2. Browser: `http://<PUBLIC_IP>:8080`
3. SSH: `ssh -i jenkins-key.pem ec2-user@<PUBLIC_IP>`
4. Initial password: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

## Cost Optimization Tips

- Use **t3** or **t4g** instances for cost savings
- Leverage **Spot Instances** for non-critical workloads (up to 90% savings)
- Enable **Auto Scaling** to match capacity with demand
- Purchase **Reserved Instances** for predictable workloads (up to 75% savings)
- Create **CloudWatch alarms** to stop idle instances automatically
