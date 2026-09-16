variable "project_id" {
  type    = string
  default = "example-project"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.0.0/24"
}
