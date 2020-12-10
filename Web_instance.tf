resource "aws_instance" "web_instance" {
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
  security_groups             = [aws_security_group.web_sg.id]
  tags          = {
    Name        = "Web Server"
  }
  subnet_id                   = aws_subnet.Web_subnet.id
  associate_public_ip_address = true
}
