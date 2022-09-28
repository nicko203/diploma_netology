# Дипломное проект по курсу «DevOps-инженер»


## 1. Регистрация доменного имени

У регистратора [REG.RU](https://www.reg.ru/) зарегистрированно доменное имя `sysad.su`.  

Используются NSы cloudflare.com.:  

![cloudflare_dns_record.png](images/cloudflare_dns_record.png)


## 2. Создание инфраструктуры  

- Существует облако `nicko-cloud ( id = b1gusbu5rl5peuirh6d4 ) `

- В Yandex Cloud WebUI cоздаю каталог для диплома `diploma ( id = b1g9722vka0pph7vu29a )` и сервисный аккаунт `nicko-diploma ( id = ajeitrutkofhd0mjlhhl )`  

![yc_catalog.png](images/yc_catalog.png)


Резервирую в Yandex Cloud один статический "белый" IP-адрес `51.250.6.16`.  
Данный адрес будет настроен на "бастионе" (прокси) для доступа к внутренним узлам проекта и для возможности прописать ДНС-записи.  

В terraform создаю два workspace: stage и prod. Параметры каждой виртуальной машины (количество ядер, размер ОЗУ, размер диска) настраиваются программно исходя из значений в `nodes_parameters.tf`.  

Состояние terraform сохраняю в YC S3 бакет:  

![tf_state_s3.png](images/tf_state_s3.png)


Инфраструктура создаётся командами:  
```
export YC_TOKEN="AQAAAAAA..."

cd ./diploma_netology
terraform apply -auto-approve
```
В результате получаю набор ВМ, необходимых для выполнения заданий дипломного проекта:  

![vm_list.png](images/vm_list.png)

## 3. Установка Nginx и LetsEncrypt

