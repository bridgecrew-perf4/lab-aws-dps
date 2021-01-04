output "pemfiles" {

value =   tls_private_key.keys

}


resource "local_file" "PEM_STUDENT"{

    count    = var.instance_count
    content  = tls_private_key.keys[count.index].private_key_pem
    filename = "${path.module}/pem_files/${var.basename_target}-student-${count.index}.pem"


}