provider "aws" {
  region  = "us-east-2"
}
/*
data "aws_subnet_ids" "default" { 
  vpc_id = "${aws_vpc.cloudboult_vpc.id}"
  tags = { 
    Name = "public" 
  } 
} */

/*locals {
  subs = concat([aws_subnet.public-subnet-1.id], [aws_subnet.public-subnet-2.id])
}*/

data "aws_vpc" "lookup" {
  tags = {
    Name = SalesDemo
  }
}

data "aws_security_group" "lookup" {
  vpc_id = aws_vpc.lookup.id
  tags = {
    SG_Type = var.sg_type
  }
}
resource "aws_instance" "cloudboult-HA-app-1" {
    #count = length(aws_subnet.public_subnet)
    #count = 2
    #for_each = aws_subnet.public_subnet[*]
    ami = var.ami
    instance_type = var.app_instance_type
    subnet_id = var.subnet_pub1
    vpc_id = aws_vpc.lookup.id
    vpc_security_group_ids = ["sg-00835b8be90bc607c"]
    key_name = var.key_name
    #availability_zone = var.ha2_az
    tags = {
        Name = "cloudboult-HA-app-1"
    }

    #subnet_id = aws_subnet.public_subnet.id
    #subnet_id     = element(local.subs, count.index)
    /*depends_on = [
      aws_vpc.cloudboult_vpc
    ]*/
}

/*resource "aws_vpc" "cloudboult_vpc" {
    cidr_block = var.custom_vpc
    instance_tenancy = var.instance_tenancy
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        "Name" = "Cloudbolt-HA-VPC-BN"
    }
  
}*/


//creating public subnet
/*resource "aws_subnet" "public_subnet" {
    //count = 2
    vpc_id = "${aws_vpc.cloudboult_vpc.id}"
    cidr_block = "${var.subnet_cidr}"
    availability_zone = "${var.subnet_azs}"
    //map_public_ip_on_launch = “true” //it makes this a public subnet
     depends_on = [
      aws_vpc.cloudboult_vpc
    ]
    tags = {
        "Name" = "cloudboult-HA-Public-Subnet-BN"
    }
}*/

//creating Internet Gateway for  vpc  connect internet
/*resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.cloudboult_vpc.id
    tags = {
        "Name" = "cloudboult-HA-IG-BN"
    }
  
}*/

//Creating a ALB for HA 

