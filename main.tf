provider "aws" {
  region = "us-east-2"
  #shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}



resource "aws_instance" "jumphost" {
  ami           = "ami-0a54aef4ef3b5f881"
  instance_type = "t2.micro"
  subnet_id =  aws_subnet.My_VPC_Subnet.id 
  vpc_security_group_ids = [aws_security_group.My_VPC_Security_Group.id]
  key_name      =  aws_key_pair.generated_key_jumphost.key_name

  
tags = { Name = "jumphost"}

}

resource "aws_instance" "student_tower_instance" {
  
  count         = var.instance_count
  ami           = "ami-0a54aef4ef3b5f881"
  instance_type = "t2.micro"
  subnet_id =  aws_subnet.My_VPC_Subnet.id 
  vpc_security_group_ids = [aws_security_group.My_VPC_Security_Group.id]
  key_name      =  aws_key_pair.generated_key_students[count.index].key_name
tags = { 
  
  Name = "${var.basename_tower}-student-${count.index}"

}

}


resource "aws_instance" "student_1_target" {

  count         = var.instance_count
  ami           = "ami-0a54aef4ef3b5f881"
  instance_type = "t2.micro"
  subnet_id =  aws_subnet.My_VPC_Subnet.id 
  vpc_security_group_ids = [aws_security_group.My_VPC_Security_Group.id]
  key_name      =  aws_key_pair.generated_key_students[count.index].key_name


tags = { 
  
  Name = "${var.basename_target}-student-${count.index}"

}


}