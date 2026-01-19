
variable "rg_name" {
  description = "Resource group name"
  type        = string

}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "env" {
  description = "Environment/workspace name (e.g., dev, prod)"
  type        = string
}



