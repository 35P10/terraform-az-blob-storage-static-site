variable "location" {
    type        = string
    default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "account_tier" {
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "tags to be applied to resources"
  type = map(string)
  default = {
    Environment = "Dev"
    Project     = "HelloWorld!"
  }
}

variable "source_index" {
  type        = string
  description = "path from your repo root to index.html"
  default     = "www/index.html"
}

variable "source_error" {
  type        = string
  description = "path from your repo root to your custom 404 page"
  default     = "www/error.html"
}

variable "cors_rules" {
  description = "blob service cors rules:  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule"
  type = list(object({
    allowed_origins   = list(string)
    allowed_methods   = list(string)
    allowed_headers   = list(string)
    exposed_headers   = list(string)
    max_age_in_seconds = number
  }))
  default = [
    {
      allowed_origins   = ["*"]
      allowed_methods   = ["GET", "POST"]
      allowed_headers   = ["*"]
      exposed_headers   = ["*"]
      max_age_in_seconds = 200
    }
  ]
}