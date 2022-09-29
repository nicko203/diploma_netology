resource "yandex_compute_instance" "proxy" {
#  name = "proxy"

#  resources {
#    cores  = 2
#    memory = 2
#  }

  for_each = "${terraform.workspace == "prod" ? var.proxy_prod : var.proxy_stage}"
  name  = "${each.value.name}"

  allow_stopping_for_update = true

  lifecycle {
    create_before_destroy = true
  }

  resources {
    cores         = each.value.cores
    memory        = each.value.memory_size
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
#      image_id = "fd81u2vhv3mc49l1ccbb"
      image_id = "fd84mnpg35f7s7b0f5lg" // nat-instance-ubuntu-1804-lts
#      image_id = ${var.yandex_disk_id_nat}
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
    nat_ip_address = "51.250.6.16"
    ip_address = "192.168.10.10"
  }


  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

#resource "yandex_vpc_network" "network-1" {
#  name = "network1"
#}

#resource "yandex_vpc_subnet" "subnet-1" {
#  name           = "subnet1"
#  zone           = "ru-central1-a"
#  network_id     = yandex_vpc_network.network-1.id
#  v4_cidr_blocks = ["192.168.10.0/24"]
#}

#output "internal_ip_address_vm_01" {
#  value = yandex_compute_instance.${each.value.name}.network_interface.0.ip_address
#}

#output "external_ip_address_vm_01" {
#  value = yandex_compute_instance.${each.value.name}.network_interface.0.nat_ip_address
#}