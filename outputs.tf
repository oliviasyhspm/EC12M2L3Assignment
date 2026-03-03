output "public_ip" {
   value = aws_instance.public.public_ip
}
output "default_vpc_id" {
   value = data.aws_vpc.selected_default.id
}
output "ami_id" {
   value = data.aws_ami.amazon_linux.id
}
output "subnet_ids" {
   value = data.aws_subnets.example.ids
}