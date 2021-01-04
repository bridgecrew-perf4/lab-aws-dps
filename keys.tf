resource "tls_private_key" "keys" {
  count     = var.instance_count
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "generated_key_jumphost" {

  key_name   = "key_name"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbBpAUisJucLdCKTRrBI/zYEdg72298zQ9eEilahgP6vgobmfbrpz6ESsVnJ+ETLcKKKNtN89St/o3atgAa+YfZ3pdXbAlTPz4jnygPO9XevoTSwP3k5Z6vVtnShTl7+fgEx7uDS5nXersVGDsUOQ9txZWFxJrz1hxjZIXf/WoPIqd14grVnROQJ6ZkKRr2VBPSaBjxh2A8B2xfHuR3mp+Yx09jN+CyQu7GL3oPs3Egu8S47wV1n2TDN0u1NCEQXqMOpR8uSqoBcXP8HI3TyiOqLMHzJfviMrmYa4Od4M899xnuKoys75Zh11/ZP2RWEQ4Dz9MvktXDYWCC6AnMl0ceuZw1FvbbPK5Zp38WEo85+/zuEkUsBxWySm2qhB8FMyp0xpNZ4tjbEk4fkIgNqWW2AMjfeGw6hZfnkf6MknUo2rY3dgdjkY880Sl0Mpsurw98bfGHtj+/rlo73WYFTSXOM/oDnXfcXsJo+H/NUnaei3DfJNI2LeLNLrCynulF9U= tom@spectre"

}

resource "aws_key_pair" "generated_key_students" {

  count      = var.instance_count
  key_name   = "student-${count.index}-key-pair"
  public_key = tls_private_key.keys[count.index].public_key_openssh
 # private_key = tls_private_key.keys[count.index].private_key_pem

}

