## rhel_server
Mini project to deploy a rhel server with GUI and RDP access, and ssm agent installed

### Terraform AWS Modules used in this repository:
https://github.com/terraform-aws-modules/terraform-aws-vpc  
https://github.com/terraform-aws-modules/terraform-aws-ec2-instance  
https://github.com/terraform-aws-modules/terraform-aws-security-group  
https://github.com/terraform-aws-modules/terraform-aws-dynamodb-table  
Refer to these modules for deeper understanding of what is being provisioned, and for examples.  

### Network
Builds a VPC, and 1 public subnets across a and b availabilty zones.  

### Remote-backend
Builds an S3 / DynamoDB backend for remote state management. State files stored in S3 and state locking via DynamoDB.  

### App
Sources Hashicorps AWS EC2 instance module and security group module.   
Builds an EBS-volume backed EC2 instance, using the free tier RHEL 9.4 AMI available from AWS catalogue.  
IAM role needs to grant permission for AWS Systems Manager actions.  

Builds a security group for your RHEL EC2 instance, user required to input ingress and egress rules.  
Instance security group should allow for ingress RDP traffic from your local machine, ingress SSH traffic from your local machine, and egress traffic to any destination on any port.  

Builds AWS secret to store local IP address, accessed using data sources.  
User required to update the secret in AWS console with their local machine IP.  
User data file currently empty, to be populated after initial deployment.  

### Objectives
* Build an AWS VPC with a public subnet.  
* Provision a RHEL EC2 instance, with a supporting IAM role and Security group.  
* Provision an S3 bucket to store terraform state files remotely, and DynamoDB table to lock state files (hint; build all resources first, then initialise your remote backend).   
* Install an SSM agent on your instance (hint; user data).
* Remotely access your instance using SSM via AWS CLI.
* Configure your server; install a GUI and enable RDP.
* Remotely access your server using RDP.
* Design an AMI build that bakes all manual installation and configuration into the AMI (hint; SSM docs / Packer)
* Rebuild your server using your newly created AMI, instead of the AWS provided AMI. 