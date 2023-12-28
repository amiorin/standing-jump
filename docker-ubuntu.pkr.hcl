packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:jammy"
  commit = true
  platform = "linux/amd64"
  changes = [
    "ENTRYPOINT /bin/bash"
  ]
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]
  provisioner "file" {
      source = "init.sh"
      destination = "/root/init.sh"
    }
  provisioner "shell" {
    inline = [
      "/usr/bin/bash /root/init.sh",
    ]
  }
}
