# resource "azurerm_subnet_network_security_group_association" "this" {
#   for_each = {
#     for nsg_name, subnets in var.nsg_subnet_associate :
#     "${nsg_name}-${subnets[0]}" => {
#       nsg    = nsg_name
#       subnet = subnets[0]
#     }
#   }

#   subnet_id                 = data.azurerm_subnet.subnets[each.value.subnet].id
#   network_security_group_id = var.nsg_ids[each.value.nsg]
# }

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = data.azurerm_subnet.subnets

  subnet_id                 = each.value.id
  network_security_group_id = var.nsg_ids[split("-", each.key)[0]] # NSG name part
}