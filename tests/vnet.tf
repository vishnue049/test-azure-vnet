provider "azurerm" {
  features {}
}

module "azurerm_virtual_network" {
  source = "../"

  name                = "bh-vnet-sandbox"
  resource_group_name = "test"
  location            = "eastus"
  address_space       = ["10.224.85.208/28"]

  subnet = {
    vnettest1 = {
      name           = "vnettest1"
      address_prefix = "10.224.85.208/29"
    }
    vnettest2 = {
      name           = "vnettest2"
      address_prefix = "10.224.85.216/29"
    }
  }

  encryption = {
    encryption1 = {
      enforcement = "AllowUnencrypted"
    }
  }

  vnet_tags = {
    DataClassification = "TBD"
    DataSensitivity    = "TBD"
    department         = "TBD"
    Criticality        = "TBD"
    BusinessUnit       = "TBD"
    OperatingLevel     = "TBD"
    cost-center        = "TBD"
    Creator            = "TBD"
    env                = "TBD"
    Owner              = "TBD"
    PublicOrPrivate    = "TBD"
    DeployedBy         = "TBD"
    DataRetention      = "TBD"
    WorkloadName       = "TBD"
  }

  ddos_pp_name   = "bh-vnet-sandbox-pp1112"
  ddos_pp        = true
  ddos_enable_pp = true
  
}

