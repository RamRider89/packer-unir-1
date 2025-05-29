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

# nginx
variable "docker_image_nginx" {
  type    = string
  default = "nginx:latest"
}

# node
variable "docker_image_node" {
  type    = string
  default = "node:22.16-alpine"
}

variable "docker_image_name" {
  type    = string
  default = "node-unir-uno"
}

variable "docker_nginx_name" {
  type    = string
  default = "nginx-unir-uno"
}

variable "docker_image_tag" {
  type    = string
  default = "latest"
}

