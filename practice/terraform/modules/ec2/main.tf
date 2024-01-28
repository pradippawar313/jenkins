resource "aws_instance" "my_ec2" {
    ami= var.instance_ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    tags = {
      Name = "ubuntu"
    }
}