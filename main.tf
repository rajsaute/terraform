
# VPC creation
resource "aws_vpc" "vpc-tf" {
  cidr_block  = var.cidr_range
  instance_tenancy  = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-tf"
  }
}

# Subnet creation



resource "aws_subnet" "subnet" {
  count = 6
  vpc_id = aws_vpc.vpc-tf.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = var.subnet_azs[count.index]

  tags = {
    "Name" = var.subnets[count.index]
  }
  depends_on = [
    aws_vpc.vpc-tf
  ]
}







