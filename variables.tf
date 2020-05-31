variable "access_key" {}
variable "secret_key" {}
#variable "key_name" {}
variable "private_key_path" {}
variable "public_key_path" {}
variable "region" {
     default = "ap-south-1"
}
variable "availabilityZone" {
     default = "ap-south-1b"
}
variable "vpcName" {
     default = "default"
}
variable "pubSecurityGroupGName" {
     default = "pub_http_ssh_sg"
}
variable "privSecurityGroupGName" {
     default = "priv_http_ssh_sg"
}

variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    default = [ "0.0.0.0/0" ]
}
