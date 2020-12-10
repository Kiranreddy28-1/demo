resource "aws_subnet" "Bastion_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.Bastion_cidr

  tags = {
    Name = "Bastion subnet"
  }
  
}
resource "aws_subnet" "Web_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.Web_cidr

  tags = {
    Name = "Web subnet"
  }
}
resource "aws_subnet" "Application_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.Application_cidr

  tags = {
    Name = "Application subnet"
  }
}