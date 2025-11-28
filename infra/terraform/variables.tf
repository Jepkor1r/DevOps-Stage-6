variable "linode_token" {
  type        = string
  description = "Linode API token"
}

variable "region" {
  type        = string
  default     = "us-east"
}

variable "instance_type" {
  type        = string
  default     = "g6-standard-1"
}

variable "root_pass" {
  type        = string
  description = "Root password for Linode instance"
}

variable "ssh_public_key" {
  type        = string
}