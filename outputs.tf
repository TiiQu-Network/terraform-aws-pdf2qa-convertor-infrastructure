# Output variable definitions

output "root_vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value = module.vpc.vpc_public_subnets
}
