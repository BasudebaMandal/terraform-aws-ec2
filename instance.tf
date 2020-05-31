###############  Data   ###############

data "aws_ami" "aws_image" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

################  Resource  ##############
##  Select VPC as Default VPC
resource "aws_default_vpc" "default" {

}

###  Create the required Security group

resource "aws_security_group" "ec2_sg" {
  name        = var.pubSecurityGroupGName
  description = "Allow SSH and Web inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingressCIDRblock  
    }

  ingress {
    description = "Allow http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingressCIDRblock
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egressCIDRblock
  }

}

### Aws ec2 instance creation

resource "aws_instance" "ec2-test" {
  ami                    = data.aws_ami.aws_image.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = "${aws_key_pair.ec2_key.key_name}"

  connection {
    type           = "ssh"
    host           = self.public_ip
    user           = "ec2-user"
    private_key    = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }

}


######## Output ############

output "aws_instance_public_dns" {
    value = aws_instance.ec2-test.public_dns
}