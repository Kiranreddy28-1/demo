resource "aws_instance" "application_instance" {
  ami                         = "ami-0a91cd140a1fc148a"
  key_name                    = "Devops_assignment"
  instance_type               = "t2.micro"
  user_data                   = <<-EOF
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install apache2
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install php5-curl
                                EOF
  security_groups             = [aws_security_group.application_sg.id]
  tags          = {
    Name        = "Application Server"
  }
  subnet_id                   = aws_subnet.Application_subnet.id
  associate_public_ip_address = true
}
