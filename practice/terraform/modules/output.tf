output "vpc_id" {
    value = module.custom_vpc.vpc_id
}

output "key_name" {
    value = module.key_pair.key_name
}

output "subnet_id" {
    value = module.custom_vpc.public_subnet_id
}