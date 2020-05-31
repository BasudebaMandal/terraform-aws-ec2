resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2key"
  public_key = "${file(var.public_key_path)}"
}