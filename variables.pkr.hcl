//  variables.pkr.hcl

# ubuntu 18
variable "docker_ubu_focal" {
  type    = string
  default = "ubuntu:focal"
}

# ubuntu 22
variable "docker_ubu_jammy" {
  type    = string
  default = "ubuntu:jammy"
}

variable "docker_image_name" {
  type    = string
  default = "unir-local-uno"
}

variable "docker_image_tag" {
  type    = string
  default = "latest"
}

