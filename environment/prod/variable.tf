variable "name_rg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
  }))
}

variable "pip_engress" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

variable "name_nic" {
  type = map(object({
    name        = string
    rg_name     = string
    location    = string
    subnet_name = string
    vnet_name   = string
    pip_name    = string
  }))
}

variable "nw_virtual" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnet = list(object({
      name             = string
      address_prefixes = list(string)

    }))
  }))
}

variable "vm_linux" {
  type = map(object({
    name          = string
    computer_name = string
    rg_name       = string
    location      = string
    size          = string
    nic           = string
    kv_name       = string
    script_name   = string
    # pip_name = string
    source_image_reference = map(object({
      publisher = string
      version   = string
      sku       = string
      offer     = string
    }))
  }))
}

# variable "serversql" {
#   type = map(object({
#     name                         = string
#     resource_group_name          = string
#     location                     = string
#     version                      = string
#     administrator_login          = string
#     administrator_login_password = string
#     minimum_tls_version          = string
#   }))
# }

# variable "databasesql" {
#   type = map(object({
#     name = string
#     # server_id    = string
#     collation    = string
#     license_type = string
#     max_size_gb  = number
#     sku_name     = string
#     enclave_type = string
#     sql_name     = string
#     rg_name      = string
#   }))
# }

