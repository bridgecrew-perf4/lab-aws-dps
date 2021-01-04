# Quick Terraform Lab

## Simple Lab for N students

In the variables.tf, you may find

  variable instance_count {
    default = 5
  }


Change it to get more student lab stations or less.

The plan will create a VPC, a subnet, and a jumphost to access the rest of the instances. A Folder with all the private keys will created as well.


TODO> Add makefile so each student logs directly into their machine

