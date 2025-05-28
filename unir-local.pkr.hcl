packer {
  required_plugins {
    docker = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = var.docker_ubu_jammy
  commit = true
}


build {
  name    = var.docker_image_name
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = ["PROVISIONERTEST=ProvisionerTest1"]
    scripts          = ["./provisioners/nodejs.sh"]
  }

  provisioner "shell" {
    environment_vars = ["PROVISIONERTEST=ServerJS"]
    scripts          = ["./provisioners/serverjs.sh"]
  }

  provisioner "file" {
    source      = "./scripts/unir.conf"
    destination = "/tmp/unir.conf"
  }

  provisioner "shell" {
    environment_vars = ["PROVISIONERTEST=NginxProxy"]
    scripts          = ["./provisioners/nginx.sh"]
  }

  provisioner "shell" {
    environment_vars = [
      "FOO=UNIR",
    ]
    inline = [
      "echo Iniciando server UNIR...",
    ]
  }

  post-processor "docker-tag" {
    repository = var.docker_image_name
    tags = [var.docker_image_tag]
  }
}