variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default = "vpc-04d0119a2a85a2a3b"
}

#variable "subnet_cidr" {
#  description = "CIDR block for VPC"
#  type        =  string
#  default     = "192.168.0.0/25","192.168.0.128/25"
#}

#variable "ami" {
  #description = "ami for EC2"
  #type        = string
  #default     = "ami-0d5eff06f840b45e9"
#}

variable "ami" {}

variable "instance_type" {
  description = "EC2 type"
  type        = string
  default     = "t2.micro"
}

variable "security_groups" {
  description = "EC2 type"
  type        = string
  default     = "sg-0172ac417e9c02d07"
}

#variable "subnet_id1" {
# description = "Subnet 1"
# type        = string
#}

#variable "subnet_id2" {
# description = "Subnet 2"
#  type        = string
#}
variable "az1" {
  description = "EC2 type"
  type        = string
  default     = "us-east-1e"
}

variable "az2" {
  description = "EC2 type"
  type        = string
  default     = "us-east-1f"
}


