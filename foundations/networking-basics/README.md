# Networking Basics for AWS

A solid networking foundation keeps your VPCs, load balancers, and hybrid connections secure. Use this module as a refresher before diving into VPC, Route 53, and ELB labs.

## Key Topics

| Concept | Summary | Lab Idea |
| --- | --- | --- |
| CIDR Notation | Defines IP ranges (e.g., `10.0.0.0/16`) | Calculate subnet ranges for multiple availability zones |
| Subnets | Logical partitions of a VPC | Design public/private subnets with appropriate netmasks |
| Routing | Directs traffic between networks | Build a route table that sends internet traffic to an IGW |
| NAT vs IGW | Outbound-only vs full internet access | Compare behavior of instances with and without a NAT gateway |
| Security Groups & NACLs | Stateful vs stateless filtering | Simulate SSH lockdown using SGs and NACL rules |
| DNS | Translates names to IP addresses | Create Route 53 records and inspect TTL behavior |

## Lab Walkthrough

1. Draw a simple three-tier architecture and assign CIDR blocks.
2. Use the AWS VPC wizard to deploy the design in a sandbox account.
3. Create security groups that enforce the diagram (no broad `0.0.0.0/0` inbound rules).
4. Attach a bastion host in the public subnet and use it to reach private instances.
5. Publish an internal service behind an Application Load Balancer and test failover.

## Troubleshooting Toolkit

- `traceroute` / `mtr` – visualize hops
- `dig` / `nslookup` – inspect DNS
- VPC Flow Logs – verify accepted/rejected connections
- AWS Reachability Analyzer – validate path between ENIs

## Resources

- 📘 [AWS VPC User Guide](https://docs.aws.amazon.com/vpc/index.html)
- 🎓 [Subnets & CIDR Blocks Deep Dive – AWS Skill Builder](https://explore.skillbuilder.aws/learn/course/external/view/elearning/10481/aws-core-services-networking)
- 📺 [Networking Fundamentals – AWS Re:Invent Talk](https://www.youtube.com/watch?v=OI8P1dD3Fww)
