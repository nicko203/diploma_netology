resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_route_table" "nat-instance-route" {
  name                    = "nat-instance-route"
  network_id              = yandex_vpc_network.network-1.id
  static_route {
    destination_prefix    = "0.0.0.0/0"
    next_hop_address      = "192.168.10.10"
  }
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}
