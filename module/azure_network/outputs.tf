output "virtual_networks" {
  value = {
    for k, vnet in azurerm_virtual_network.virtual_nw : k => {
      name     = vnet.name
      id       = vnet.id
      location = vnet.location
    }
  }
}
# output "subnet_ids" {
#   value = {
#     for k, s in azurerm_subnet.subnet :
#     s.name => s.id
#   }
# }
