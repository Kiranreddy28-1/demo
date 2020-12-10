resource "aws_instance" "bastion" {
  ami                         = "ami-0a91cd140a1fc148a"
  key_name                    = "Devops_assignment"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.bastion_sg.id]
  tags          = {
    Name        = "Bastion Server"
  }
  subnet_id                   = aws_subnet.Bastion_subnet.id
  associate_public_ip_address = true
}
