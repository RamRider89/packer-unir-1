packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1.1" # Especifica una versión compatible del plugin
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:latest"
  commit = true
}

build {
  name    = "prueba-ubuntu"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "apt-get update -y",
      "apt-get install -y --no-install-recommends curl",
      "echo 'Hola desde Packer!' > /tmp/packer-output.txt"
    ]
  }

  post-processor "docker-tag" {
    repository = "mi-imagen-packer"
    tag        = ["latest"]
  }
}