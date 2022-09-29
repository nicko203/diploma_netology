terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket-nicko-diploma"
    region     = "ru-central1-a"
    key        = "terraform/infrastructure1/terraform.tfstate"
    access_key = "YCAxxxxxxxxxxxxxxxxxxxxxx"
    secret_key = "YCOxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}

provider "yandex" {
  #  token     = "<OAuth>"  Load from environment var YC_TOKEN
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"

  zone      = "ru-central1-a"
}
