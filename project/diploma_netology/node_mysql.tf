resource "yandex_compute_instance" "dbs" {

  for_each = "${terraform.workspace == "prod" ? var.db_prod : var.db_stage}"
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
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
#      image_id = "fd8987mnac4uroc0d16s" // debian-11
#      image_id = ${var.yandex_disk_id}
      size = each.value.disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
#    nat       = false
    ip_address = each.value.ip
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}


