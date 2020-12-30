# lab-aws-dps
Quick Terraform Lab

Simple Lab for N students

In the variables.tf, you may find

variable instance_count {
  default = 5
}


Change it to get more student Lab or less

The plan will create a VPC, a subnet, and a jumphost to access the rest of the instances

TODO> Add makefile so each student logs directly into their machine

