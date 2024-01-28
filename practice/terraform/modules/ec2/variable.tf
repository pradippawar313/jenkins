variable "instance_ami" {
  type = string
}

variable "instance_type" {
    default = "t2.micro"
}

variable "subnet_id" {
    type = string
}

variable "key_name" {
    type = string
}