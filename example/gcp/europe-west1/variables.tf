variable "project_id" {
  type    = string
  default = "example-project"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "subnet_cidr" {
  type    = string
  default = "10.20.0.0/24"
}
