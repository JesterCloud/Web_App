# NGNIX on Linux server powered by AWS and Terraform (IaS)

## Technical Stack

- **Operating System:** Linux CentOS 7.
- **Web Server:** Nginx, selected for its high performance and efficiency in serving web content.
- **Scripting:** Bash, shell scripting and EC2 bootstrap to download the HTML and CSS files form this git.
- **AWS Integration:**
  - EC2 instances for core application hosting.
  - S3 for image storage and pre-loading before deployment.
  - Multi-AZ deployment strategy for high availability and failover capabilities.
  - AutoScaling Groups to dynamically adjust resource.
  - App Load Balancing to distribute traffic.
  - AWS Firewall to safeguard infrastructure and data flow.
- **Monitoring and Logging:**
  - Amazon CloudWatch for comprehensive real-time monitoring of the application and infrastructure.
  - CloudWatch Logs for detailed log management and analysis.
- **Infrastructure as Code:**
  - Terraform scripts for declarative and reproducible infrastructure setup.

[![LinkedIn](https://www.linkedin.com/in/giogalindo470/)](Tu-URL-de-LinkedIn)
https://www.linkedin.com/in/giogalindo470/
