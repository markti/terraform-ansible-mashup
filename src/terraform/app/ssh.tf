resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "azurerm_key_vault_secret" "ssh_public" {

  key_vault_id = module.keyvault.id

  name  = "hub-ssh-public"
  value = tls_private_key.ssh.public_key_openssh

}

resource "azurerm_key_vault_secret" "ssh_private" {

  key_vault_id = module.keyvault.id

  name  = "hub-ssh-private"
  value = trimspace(tls_private_key.ssh.private_key_pem)

}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${path.module}/sshkey2.pem"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh.public_key_openssh
  filename = "${path.module}/sshkey2.pub"
}