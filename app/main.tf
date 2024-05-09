resource "aws_secretsmanager_secret" "cidr_block" {
  name = "remote-access-ip"
}

module "server-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = ""
  description = "security group for redhat test server"
  vpc_id      = ""

  # default CIDR block, used for all ingress rules uless stated otherwise
  # typically CIDR blocks of the VPC
  ingress_cidr_blocks = [] 

  # SG ingress rules for RDP access from local machine
  ingress_with_cidr_blocks = []

  egress_cidr_blocks = []
  
  # SG egress rules for RDP access from local machine
  egress_with_cidr_blocks = []
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = ""

  ami                    = "ami-035cecbff25e0d91e" # RHEL 9.4
  instance_type          = "m5.large" # additional compute required for GUI & xrdp
  key_name               = "" # create a key pair in AWS
  monitoring             = true
  vpc_security_group_ids = [] # SG module
  subnet_id              = "" # public subnet ID
  associate_public_ip_address = true # required for RDP access from your local machineß

  create_iam_instance_profile = true
  iam_role_description        = "IAM role for Redhat EC2"
  iam_role_policies = {} # SSM policy required

  # include user data in final step
  // user_data_base64            = filebase64("")
  // user_data_replace_on_change = true

  root_block_device = [
    {
      volume_type = "gp3"
      throughput  = 200
      volume_size = 20
      volume_tags = {
        Name = "root"
      }
    },
  ]

  tags = {} # tag your server!
}