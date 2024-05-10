module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = ""
  cidr               = "10.0.0.0/16"
  azs                = ["${var.region}a", "${var.region}b"]
  public_subnets     = ["10.0.101.0/24"]

  tags = {
    Account   = data.aws_caller_identity.current.account_id
    Project  = ""
  }
}
