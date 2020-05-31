# AWS EC2 Terraform module

Terraform module which creates EC2 instaces on AWS.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
* [Security Group](https://www.terraform.io/docs/providers/aws/r/security_group.html)
* [EC2 Instance](https://www.terraform.io/docs/providers/aws/r/instance.html)
* [Key Pair](https://www.terraform.io/docs/providers/aws/r/key_pair.html)


## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

## Requirements

* Terraform Binary
* Access_key ( for programmatic access )
* Secret_key ( for programmatic access )
* Key_name ( To access ec2 instances )
* Path_of_Private_key_on_local_machine ( To access ec2 instances )

## Installation

To create a VPC on aws using terraform code in this repository, variables need to be configured as per the one’s own need.


##  Variables files: 


* Terraform.tfvars : vars that overwrites default values
* Varables.tf: contains default values of vars


##  Commands :

* terraform init
* terraform plan -out aws_vpc.plan
* terraform apply aws_vpc.plan