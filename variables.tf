variable "name" {
  type        = string
  description = "Name of the virtual network"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "address_space" {
  type        = list(string)
  description = "Address space"
}

variable "subnet" {
  type        = map(object({
    name           = string
    address_prefix = string
  }))
  description = "Subnets"
}

variable "vnet_tags" {
  type        = map(string)
  description = "Tags"
}

# variable "dns_servers" {
#   description = "DNS servers for the virtual network"
#   type        = list(string)
# }

variable "vm_protection_enabled" {
  description = "Flag to indicate whether virtual machine protection is enabled"
  type        = bool
  default     = false
}

variable "encryption" {
  type        = map(object({
    enforcement = string
  }))
  description = "Encryption settings"
}

variable "ddos_pp" {
  description = "Flag to indicate whether to create a DDOS protection plan"
  type        = bool
  default     = false
}

variable "ddos_enable_pp" {
  description = "Flag to indicate whether to enable DDOS protection plan"
  type        = bool
  default     = false
}

variable "ddos_pp_name" {
  description = "Name of the DDOS protection plan"
  type        = string
}