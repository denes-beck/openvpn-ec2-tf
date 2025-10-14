# 🔒 OpenVPN EC2 Server

Terraform code to create an OpenVPN server on an EC2 instance. For cost savings, two EventBridge schedules are created to start and stop the instance at specific times.

## 🛠️ Prerequisites

- Terraform installed
- AWS account

## 🎬 Setup

1. Clone the repository.

```bash
git clone https://github.com/denes-beck/openvpn-ec2-tf.git
cd openvpn-ec2-tf
```

2. Create a `terraform.tfvars` file with the following content:

```hcl
aws_access_key = "YOUR ACCESS KEY"
aws_secret_key = "YOUR SECRET KEY"
account_id = "YOUR ACCOUNT ID"
region = "REGION" # Defaut: eu-central-1
ami = "AMI ID" # Defaut: ami-039470c0765f439c4
instance_type = "INSTANCE TYPE" # Defaut: t2.small (AMI recommended)
key_path = "PATH TO YOUR KEY" # Defaut: ~/.ssh/id_rsa.pub
timezone = "TIMEZONE" # Defaut: Europe/Berlin
```

3. Run the following commands:

```bash
terraform init
terraform apply
```

4. SSH into the instance and run the following commands:

```bash
chmod 400 <key_path>
ssh -i <key_path> openvpnas@<instance_public_ip>
```

5. Follow the instructions to configure the OpenVPN server.

## 🗂️ Resources

[OpenVPN Access Server AMI](https://aws.amazon.com/marketplace/pp/prodview-y3m73u6jd5srk?applicationId=AWSMPContessa&ref_=beagle&sr=0-1)
[OpenVPN Guide](https://openvpn.net/as-docs/aws-ec2.html)\
