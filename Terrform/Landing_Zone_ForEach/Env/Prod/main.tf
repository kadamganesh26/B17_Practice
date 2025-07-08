module "rg-module" {
  source   = "../../Modules/01- Azurerm_Resource_Group"
  child_rg = var.prod_rg
}

module "vnet_module" {
  depends_on = [module.rg-module]
  source     = "../../Modules/02- Azurerm_Virtual_Network"
  child_vnet = var.prod_vnet
}

module "subnet_module" {
  depends_on   = [module.vnet_module]
  source       = "../../Modules/03- Azurerm_Subnet"
  child_subnet = var.prod_subnet
}
module "nsg_module" {
  depends_on = [module.rg-module]
  source     = "../../Modules/04- Azurerm_Network_Security_Group"
  child_nsg  = var.prod_nsg
}

module "nsg-asso" {
  depends_on            = [module.nsg_module, module.subnet_module]
  source                = "../../Modules/05- Azurerm_Subnet_Network_Security_Group_Association"
  child_subnet_asso_nsg = var.prod_subnet_asso_nsg
}

module "network_interface" {
  source     = "../../Modules/06- Azurerm_ Network_Interface_Card"
  depends_on = [module.subnet_module, module.vnet_module]
  child_nic  = var.prod_nic
}

module "pip" {
  source     = "../../Modules/07- Azurerm_Public_IP_Address"
  child_pip  = var.prod_pip
  depends_on = [module.rg-module]
}

module "virtual_machine" {
  source     = "../../Modules/08- Auzrerm_Virtual_Machine"
  child_vm   = var.prod_vm
  depends_on = [module.network_interface, module.subnet_module, ]
}

module "SQL_Server_UserName" {
  source       = "../../Modules/09- Azurerm_mssql_Server_UserName"
  child_azuser = var.Prod_SQL_Server_User
}

module "SQL_Server" {
  source           = "../../Modules/10- Azurerm_mssql_Server"
  depends_on       = [module.rg-module, module.SQL_Server_UserName]
  child_SQL_server = var.Prod_SQL_Server
}

module "mssql-database" {
  depends_on   = [module.SQL_Server, module.SQL_Server_UserName, module.rg-module]
  source       = "../../Modules/11- Azurerm_mssql_database"
  child_SQL_DB = var.prod_mssql_DB
}
module "key_vault" {
  source          = "../../Modules/12- Azurerm_KeyVault"
  depends_on      = [module.rg-module, module.SQL_Server_UserName]
  child_key_vault = var.prod_key_vault
}
