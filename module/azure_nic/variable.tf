variable "nic_name" {
  type = map(object({
    name        = string
    rg_name     = string
    location    = string
    subnet_name = string
    vnet_name    = string
    pip_name    = string

  }))
}
