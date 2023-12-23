variable "name" {
  description = "Name"
  type        = string
  default     = "dev"
}

variable "cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.10.0.0/16"
}
