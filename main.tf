resource "aws_instance" "public" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.example.ids[0]  #Public Subnet ID, e.g. subnet-xxxxxxxxxxx
  associate_public_ip_address = true
  key_name                    = "oliviaM2L3-key-pair" #Change to your keyname, e.g. jazeel-key-pair
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
  tags = {
   Name = "${var.name}-ec2"
  }

}

resource "aws_security_group" "allow_ssh" {
  name        = "oliviaM2L3-terraform-security-group" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = data.aws_vpc.selected.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
