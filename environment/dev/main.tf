module "name_rg" {
  source = "../../module/azure_resource_group"

  rg_name = var.name_rg
}

module "pip_engress" {
  source     = "../../module/azure_public_ip"
  depends_on = [module.name_rg]

  engress_pip = var.pip_engress
}

module "name_nic" {
  source     = "../../module/azure_nic"
  depends_on = [module.name_rg, module.nw_virtual, module.pip_engress]

  nic_name = var.name_nic
}

module "nw_virtual" {
  source     = "../../module/azure_network"
  depends_on = [module.name_rg]

  virtual_nw = var.nw_virtual
}

module "vm_linux" {
  source     = "../../module/azure_linux_vm"
  depends_on = [module.name_rg, module.name_nic, module.nw_virtual, module.pip_engress]

  linux_vm = var.vm_linux
}

module "serversql" {
  source     = "../../module/azure_sql_server"
  depends_on = [module.name_rg]

  sqlserver = var.serversql
}

module "databasesql" {
  source     = "../../module/azure_sql_database"
  depends_on = [module.serversql]

  sqldatabase = var.databasesql
}
