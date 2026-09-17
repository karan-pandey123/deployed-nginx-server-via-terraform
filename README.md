# 🚀 Nginx Server Deployment on AWS EC2 using Terraform

This project demonstrates how to provision an AWS EC2 instance using Terraform and automatically deploy an Nginx web server using Terraform user data.

The entire infrastructure is managed using Infrastructure as Code (IaC), making the deployment repeatable, automated, and easy to manage.

## 🏗️ Architecture

Internet
    |
    v
AWS EC2 Instance
    |
    v
Ubuntu Linux
    |
    v
Nginx Web Server
    |
    v
Web Browser

## 🛠️ Technologies Used

- Terraform
- AWS EC2
- AWS Security Group
- Ubuntu Linux
- Nginx
- AWS IAM
- Git
- GitHub

## 📁 Project Structure

terraform/
├── ec2.tf
├── provider.tf
├── terraform.tf
├── install_nginx.sh
├── .gitignore
├── .terraform.lock.hcl
└── README.md

## 📄 File Description

| File | Description |
|------|-------------|
| ec2.tf | Creates the EC2 instance and Security Group |
| provider.tf | Configures the AWS provider |
| terraform.tf | Contains Terraform configuration |
| install_nginx.sh | Automatically installs and starts Nginx |
| .gitignore | Prevents sensitive and unnecessary files from being pushed |
| .terraform.lock.hcl | Locks Terraform provider versions |
| README.md | Project documentation |

## ⚙️ How It Works

1. Terraform connects to AWS using the AWS provider.
2. Terraform creates a Security Group.
3. Required inbound traffic is configured.
4. An Ubuntu EC2 instance is launched.
5. The Security Group is attached to the EC2 instance.
6. Terraform user data executes the install_nginx.sh script.
7. Nginx is automatically installed on the EC2 instance.
8. Nginx service is started automatically.
9. The EC2 public IP can be accessed through a web browser.

## 🔐 Security Group Configuration

| Protocol | Port | Purpose |
|----------|------|---------|
| TCP | 22 | SSH |
| TCP | 80 | HTTP / Nginx |
| TCP | 443 | HTTPS |
| TCP | 8000 | Application Traffic |

For production environments, inbound access should be restricted according to the actual application requirements.

## 🚀 Deployment

### 1. Clone the Repository

git clone https://github.com/karan-pandey123/deployed-nginx-server-via-terraform.git

cd deployed-nginx-server-via-terraform

### 2. Initialize Terraform

terraform init

### 3. Validate the Configuration

terraform validate

### 4. Review the Infrastructure Plan

terraform plan

### 5. Deploy the Infrastructure

terraform apply

Enter "yes" when Terraform asks for confirmation.

## 🌐 Access the Nginx Server

After Terraform creates the EC2 instance, copy the Public IPv4 Address from the AWS Console.

Open the following URL in your browser:

http://<EC2-PUBLIC-IP>

Example:

http://13.232.14.145

You should see the Nginx web server page.

Note: The EC2 public IP can change if the instance is recreated. An Elastic IP can be used when a static public IP is required.

## 🧹 Destroy the Infrastructure

When the infrastructure is no longer required, run:

terraform destroy

Enter "yes" when Terraform asks for confirmation.

Terraform will remove the resources created by the configuration.

## 🔒 Security & Best Practices

The project uses a .gitignore file to prevent sensitive and unnecessary files from being pushed to GitHub.

The following files are excluded:

.terraform/
*.tfstate
*.tfstate.*
*.pem

Never upload the following to a public GitHub repository:

- EC2 private SSH keys
- Terraform state files
- AWS access keys
- Passwords
- API keys
- Secret credentials

## 📚 What I Learned

Through this project, I practiced:

- Infrastructure as Code using Terraform
- AWS EC2 provisioning
- AWS Security Group configuration
- Terraform user_data
- Automated Nginx installation
- Ubuntu Linux
- AWS networking basics
- Terraform workflow
- Git and GitHub
- Managing sensitive files using .gitignore

## 🔄 Terraform Workflow

Write Terraform Configuration
        ↓
terraform init
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
        ↓
AWS EC2 Instance
        ↓
Nginx Installation
        ↓
Access Nginx using Public IP

## 🎯 Project Objective

The objective of this project is to demonstrate how Terraform can automate AWS infrastructure provisioning and reduce the need for manual configuration through the AWS Management Console.

The project also demonstrates automatic Nginx installation and configuration during EC2 instance launch using Terraform user_data.

## 👨‍💻 Author

Karan Pandey

Cloud & DevOps Enthusiast

## ⭐ Conclusion

This project provides hands-on experience with Terraform, AWS EC2, Infrastructure as Code, Linux, Nginx, and basic cloud automation.
