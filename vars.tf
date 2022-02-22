/*variable "access_key" {

}
variable "secretaccess_key" {

}*/

variable "ami" {
    description = "AMI ID"
    default = "ami-0b614a5d911900a9b"
}
variable "app_instance_type"{
    description = "EC2 Instance type example:t2.micro"
    default = "t2.micro"
}

variable "subnet_pub1" {
    description = "Public Subnet 1"
    default = "subnet-09918fa2d642e5cc3"
}
variable "subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "subnet_azs" {
    default = "us-east-2b"
}
variable "instance_tenancy" {
    description = "Tenancy of VPC"
    type = string
    default = "default"
}

variable "custom_vpc" {
    description = "VPC for cloudboult HA Deployment"
    type = string
    default = "10.0.0.0/16"
}
variable "ha1_az" {
    type = string
    default = "us-east-2b"

}
variable "ha2_az" {
    type = string
    default = "us-east-2c"

}
variable "key_name" {
    description = "EC2 KeyPair"
    default = "se-demo"
  
}
