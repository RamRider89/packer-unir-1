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

source "docker" "node" {
  image  = var.docker_image_node
  commit = true
}

source "docker" "nginx" {
  image  = var.docker_image_nginx
  commit = true
}

# building node 22
build {
  name    = var.docker_image_node
  sources = [
    "source.docker.node"
  ]

  provisioner "shell" {
    inline = [
      "echo Iniciando server node UNIR...",
    ]
  }

  provisioner "file" {
    source      = "./scripts/hello.js"
    destination = "/tmp/hello.js"
  }

  provisioner "shell" {
    environment_vars = ["PROVISIONERTEST=ServerJS"]
    scripts          = ["./provisioners/serverjs.sh"]
  } 

  post-processor "docker-tag" {
    repository = var.docker_image_name
    tags = [var.docker_image_tag]
  }

  provisioner "shell" {
    inline = [
      "echo Terminando de crear imagen server node UNIR...",
    ]
  }
}

# building nginx
build {
  name    = var.docker_image_nginx
  sources = [
    "source.docker.nginx"
  ]

  provisioner "shell" {
    inline = [
      "echo Iniciando server nginx...",
    ]
  }

  post-processor "docker-tag" {
    repository = var.docker_nginx_name
    tags = [var.docker_image_tag]
  }

  provisioner "shell" {
    inline = [
      "echo Terminando aprovisionamiento...",
    ]
  }
}