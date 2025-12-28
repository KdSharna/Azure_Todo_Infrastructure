# data "azurerm_subnet" "subnets" {
#   for_each = toset(["fe_subnet", "be_subnet"]) # subnets jahan apply karna hai
#   name                 = each.value
#   virtual_network_name = "fe_vnet"
#   resource_group_name  = "tittu11"
# }
