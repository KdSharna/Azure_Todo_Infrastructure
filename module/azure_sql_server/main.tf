# resource "azurerm_mssql_server" "sqlserver" {
#   for_each                     = var.sqlserver
#   name                         = each.value.name
#   resource_group_name          = each.value.resource_group_name
#   location                     = each.value.location
#   version                      = each.value.version
#   administrator_login          = each.value.administrator_login
#   administrator_login_password = each.value.administrator_login_password
#   minimum_tls_version          = each.value.minimum_tls_version
# }

# variable "sqlserver" {
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
