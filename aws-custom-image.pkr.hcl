packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}
source "amazon-ebs" "ubuntu" {
    ami_name = "my-first-packer-image -{{timestamp}}"
    instance_type= "t2.micro"
    region = "us-east-1"
    source_ami = "ami-0c7217cdde317cfec"
    ssh_username = "ubuntu"
    ami_regions = [ "us-east-1" ]
}
build {
    name = "my-first-build"
    sources = ["source.amazon-ebs.ubuntu"]
}
provisioner "Ansible" {
      playbook_file   = "./playbook.yml"
      user            = "ubuntu"
      use_proxy       = false
}