prod_rg = {
  rg1 = {
    name     = "prod_rg"
    location = "Central India"
  }
}

prod_vnet = {
  vnet1 = {
    vnet_name           = "Prod_Vnet"
    resource_group_name = "prod_rg"
    location            = "Central India"
    address_space       = ["10.0.0.0/24"]
  }
}

prod_subnet = {
  sub1 = {
    subnet_name          = "elern_frontend"
    resource_group_name  = "prod_rg"
    virtual_network_name = "Prod_Vnet"
    address_prefixes     = ["10.0.0.0/25"]
  }
  sub2 = {
    subnet_name          = "elern_backend"
    resource_group_name  = "prod_rg"
    virtual_network_name = "Prod_Vnet"
    address_prefixes     = ["10.0.0.128/26"]
  }
  sub3 = {
    subnet_name          = "elern_free_Subnet"
    resource_group_name  = "prod_rg"
    virtual_network_name = "Prod_Vnet"
    address_prefixes     = ["10.0.0.192/26"]
  }
}

prod_nsg = {

  nsg1 = {
    nsg_name            = "https"
    location            = "Central India"
    resource_group_name = "prod_rg"
    security_rule_name  = "https_allowed"
  }

  nsg2 = {
    nsg_name            = "ftp"
    location            = "Central India"
    resource_group_name = "prod_rg"
    security_rule_name  = "ftp_block"
  }
}

prod_subnet_asso_nsg = {

  nsg_asso1 = {
    #subnet_data_nsgasso_block
    subnet-data          = "elern_frontend"
    virtual_network_name = "Prod_Vnet"
    resource_group_name  = "prod_rg"
    name_nsg             = "https"
  }

  nsg_asso2 = {
    #subnet_data_nsgasso_block
    subnet-data          = "elern_backend"
    virtual_network_name = "Prod_Vnet"
    resource_group_name  = "prod_rg"
    name_nsg             = "ftp"
  }
}

prod_nic = {
  nic1 = {
    nic_name             = "elrarn-frontend-nic"
    location             = "Central India"
    resource_group_name  = "prod_rg"
    internal_ip_name     = "elrarn-frontend-nic"
    subnet_name          = "elern_frontend"
    virtual_network_name = "Prod_Vnet"

  }
  nic2 = {
    nic_name             = "elrarn-backend-nic"
    location             = "Central India"
    resource_group_name  = "prod_rg"
    internal_ip_name     = "elrarn-frontend-nic"
    subnet_name          = "elern_backend"
    virtual_network_name = "Prod_Vnet"
  }
}

prod_pip = {

  pip1 = {
    pip_name            = "elaran_frontend_pip"
    location            = "Central India"
    resource_group_name = "prod_rg"
    allocation_method   = "Static"
  }

  pip2 = {
    pip_name            = "elaran_backend_pip"
    location            = "Central India"
    resource_group_name = "prod_rg"
    allocation_method   = "Static"
  }
}

prod_vm = {
  Frontend_vm = {
    vm_name              = "Frontend-vm1"
    resource_group_name  = "prod_rg"
    location             = "Central India"
    size                 = "Standard_F2"
    admin_username       = "pcpl"
    admin_password       = "pcpl@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nic-name             = "elrarn-frontend-nic"
  }

  Backend_vm = {
    vm_name              = "backend-vm1"
    resource_group_name  = "prod_rg"
    location             = "Central India"
    size                 = "Standard_F2"
    admin_username       = "pcpl"
    admin_password       = "pcpl@123"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    nic-name             = "elrarn-backend-nic"
  }
}


Prod_SQL_Server_User = {
  sql_user1 = {
    user_principal_name   = "sql_admin@bahubalijihotmail.onmicrosoft.com"
    display_name          = "sql.admin@bahubalijihotmail.onmicrosoft.com"
    password              = "P@ssword1234!"
    force_password_change = "false"
    mail_nickname         = "sqladmin"
  }
  key_vault_user2 = {
    user_principal_name   = "keyvault@bahubalijihotmail.onmicrosoft.com"
    display_name          = "keyvault@bahubalijihotmail.onmicrosoft.com"
    password              = "P@ssword1234!"
    force_password_change = "false"
    mail_nickname         = "keyvault"
  }
}

Prod_SQL_Server = {
  Server1 = {
    sql_server_name              = "mssqserverpayasyougo-gk"
    resource_group_name          = "prod_rg"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "missadministrator"
    administrator_login_password = "thisIsKat11"
    minimum_tls_version          = "1.2"
    login_username               = "sql_admin"
    user_principal_name          = "sql_admin@bahubalijihotmail.onmicrosoft.com"
    object_id                    = "sql_admin@bahubalijihotmail.onmicrosoft.com"

  }
}

prod_mssql_DB = {
  MSSQL-DB1 = {
    server_id           = "mssqserverpayasyougo-gk"     #Server Name
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    sql-db-name         = "prod-sql-db"                 #DB Name
    resource_group_name = "prod_rg"
    sql_server_name     = "mssqserverpayasyougo-gk"
    mssql-db-name       = "prod-sql-db"

  }
}

prod_key_vault = {
  key_vault = {

    key_vault_name               = "prokv"
    resource_group_name          = "prod_rg"
    location                     = "Central India"
    enabled_for_disk_encryption  = true
    tenant_id                    = "keyvault@bahubalijihotmail.onmicrosoft.com"
    object_id                    = "keyvault@bahubalijihotmail.onmicrosoft.com"
    soft_delete_retention_days   = 7
    purge_protection_enabled     = false
    user_principal_name          = "keyvault@bahubalijihotmail.onmicrosoft.com"
    sku_name                     = "standard"
    byte_length                  = 4
    enable_rbac_authorization    = true
    role_definition_name         = "Key Vault Administrator"
    role_definition_Secrets_name = "Key Vault Secrets Officer"
    user_principal_name          = "keyvault@bahubalijihotmail.onmicrosoft.com"

  }
}


