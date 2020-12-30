variable "key_name" {
    default = "key_priv_pub" 
}

variable "region" {
     default = "us-east-2"
}
variable "availabilityZone" {
     default = "us-east-2a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "172.31.0.0/16"
}
variable "subnetCIDRblock" {
    default = "172.31.64.0/20"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}

# Instance Numbers

variable instance_count {
  default = 5
}

# Student Tower Variables

variable basename_tower {
 default = "ansible-tower"
}

# Student Target Variables

variable basename_target {
 default = "ansible-target"
}

# end of variables.tf