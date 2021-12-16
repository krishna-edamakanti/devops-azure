terraform {
  backend "azurerm" {
    resource_group_name  = "rg-mywebapp"
    storage_account_name = "test1993"
    container_name       = "mycontainer"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/storageaccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}
