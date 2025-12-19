name_rg = {
  rg1 = {
    name       = "tittu11"
    location   = "west us"
    managed_by = "Terraform"
  }
}

pip_engress = {
  pip1 = {
    name                = "fe_pip"
    resource_group_name = "tittu11"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "be_pip"
    resource_group_name = "tittu11"
    location            = "west us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
}

name_nic = {
  nic1 = {
    name        = "fe_nic"
    rg_name     = "tittu11"
    location    = "west us"
    subnet_name = "fe_subnet"
    vnet_name   = "fe_vnet"
    pip_name    = "fe_pip"
  }
  nic2 = {
    name        = "be_nic"
    rg_name     = "tittu11"
    location    = "west us"
    subnet_name = "be_subnet"
    vnet_name   = "fe_vnet"
    pip_name    = "be_pip"
  }
}

nw_virtual = {
  vnet1 = {
    name                = "fe_vnet"
    resource_group_name = "tittu11"
    location            = "west us"
    address_space       = ["10.0.0.0/16"]
    dns_servers = ["8.8.8.8", "1.1.1.1"]


    subnet = [
      {
        name             = "fe_subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "be_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}

vm_linux = {
  vm1 = {
    name           = "fe_vm"
    computer_name  = "fevm01"
    rg_name        = "tittu11"
    location       = "west us"
    size           = "Standard_D2s_v3"
    nic            = "fe_nic"
    kv_name        = "my-secrete01"
    admin_username = "vm-username"
    admin_password = "vm-password"
    vnet_name      = "fe_vnet"
    subnet_name    = "fe_subnet"
    script_name    = "nginx.yaml"
    source_image_reference = {
      image1 = {
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        publisher = "Canonical"
        version   = "latest"
      }
    }
  }
  vm2 = {
    name           = "be_vm"
    computer_name  = "bevm01"
    rg_name        = "tittu11"
    location       = "west us"
    size           = "Standard_D2s_v3"
    nic            = "be_nic"
    kv_name        = "my-secrete01"
    admin_username = "vm-username"
    admin_password = "vm-password"
    vnet_name      = "fe_vnet"
    subnet_name    = "be_subnet"
    script_name    = "python.yaml"
    source_image_reference = {
      image1 = {
        publisher = "Canonical"
        version   = "latest"
        sku       = "22_04-lts"
        offer     = "0001-com-ubuntu-server-jammy"
      }
    }
  }
}

serversql = {
  server1 = {
    name                         = "mysqlservertittu123"
    resource_group_name          = "tittu11"
    location                     = "west us"
    version                      = "12.0"
    administrator_login          = "Tattu01!@"
    administrator_login_password = "Tattu!12345"
    minimum_tls_version          = "1.2"

  }
}

databasesql = {
  database1 = {
    name         = "mysqldatabase"
    sql_name     = "mysqlservertittu123"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    rg_name      = "tittu11"
  }
}
