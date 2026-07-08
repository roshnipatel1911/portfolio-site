# Portfolio Site — Automated CI/CD Deployment

A personal portfolio website deployed using a complete DevOps pipeline — provisioned, configured, and auto-deployed with zero manual intervention after the initial setup.

## Architecture

GitHub Push → Webhook → Jenkins → Pull Latest Code → Deploy to Nginx → Live Site

## Tech Stack

- **Terraform** — provisions the AWS EC2 instance, security group, and disk configuration (Infrastructure as Code)
- **Nginx** — serves the static site
- **Jenkins** — CI/CD pipeline that checks out the repo and deploys the latest code
- **GitHub Webhooks** — automatically triggers a Jenkins build on every push to `main`

## What This Demonstrates

- Infrastructure provisioning using Terraform (security groups, EC2, EBS sizing)
- A working CI/CD pipeline — not just written, but triggered automatically via webhook
- Real troubleshooting: resolved Jenkins disk-space monitor issues, SSH connectivity debugging, file permission fixes for CI deployments, and git history cleanup

## How It Works

1. Terraform provisions an EC2 instance with a security group allowing HTTP (80), SSH (22), and Jenkins (8080)
2. A `user_data` script bootstraps Nginx on first boot
3. Jenkins runs on the same instance, with a pipeline job configured to:
   - Pull the latest code from this repository
   - Copy `index.html` into Nginx's serving directory (`/var/www/html/`)
4. A GitHub webhook triggers this pipeline automatically on every push — no manual "Build Now" required

## Author

Roshni Patel — [github.com/roshnipatel1911](https://github.com/roshnipatel1911)
Aspiring DevOps Engineer transitioning from Physiotherapy Education, based in Dubai, UAE
