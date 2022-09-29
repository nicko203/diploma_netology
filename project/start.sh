#!/usr/bin/bash

export YC_TOKEN="AQAAAAAARtxxxxxxxxxxx__xxxxxxxxxxxxxxxx"

cd ./diploma_netology
terraform apply -auto-approve

sleep 60


cd ../diploma_netology_ansible

ansible-playbook playbook.yml -i hosts
#ansible-playbook monitoring.yml -i hosts

cd ..