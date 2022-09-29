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
    access_key = "YCAJE0uAC5NT4xw6fizqxktoa"
    secret_key = "YCOb2Gu-v1wLwdi1yLWNubuIenuuKrbVZ3c3UI_2"

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
