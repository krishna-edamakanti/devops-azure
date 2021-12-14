terraform {
  backend "azurerm" {
    resource_group_name  = "Fiserv-test"
    storage_account_name = "fiservterraformcodeops"
    container_name       = "tfsstatefile"
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
