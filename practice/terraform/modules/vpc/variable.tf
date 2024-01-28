variable "vpc_name" {
  default = "my_vpc"
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_name" {
    default = "my_public_subnet"
}

variable "public_subnet_cidr_block" {
    type = string 
}

variable "private_subnet_name" {
    default = "my_private_subnet"
}

variable "private_subnet_cidr_block" {
    type = string 
}

variable "internet_gateway_name" {
    default = "my_IG"
}

variable "public_route_table_name" {
    default = "my_publicRT"  
}

variable "nat_gateway_name" {
    default = "my_nat"
}

variable "private_route_table_name" {
    default = "my_privateRT"
}