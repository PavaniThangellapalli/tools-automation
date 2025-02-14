module "vm" {
  for_each  = var.tools
  source    = "./vm-module"
  component = each.key
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  port = each.value["port"]
}
variable "tools" {
  default = {
    vault = {
      port = 8200
    }
  }
}
variable "ssh_username" {}
variable "ssh_password" {}
terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup"
    storage_account_name = "pavanitfstates"
    container_name       = "tfstates"
    key                  = "terraform.tfstate"
  }
  }
provider "azurerm" {
  features {}
  subscription_id = "ef791f67-7558-4920-ba6c-72951b295947"
}
