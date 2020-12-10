//vpc cidr
variable "cidr_block" {

    default = "10.0.0.0/16"
}
//public subnet cidr for bastion
variable "Bastion_cidr" {

    default = "10.0.1.0/24"
}
//Web subnet cidr
variable "Web_cidr" {

    default = "10.0.2.0/24"
}
//Application subnet cidr
variable "Application_cidr" {

    default = "10.0.3.0/24"
}

