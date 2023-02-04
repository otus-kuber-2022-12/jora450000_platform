# jora450000_platform
jora450000 Platform repository

### ДЗ №1
ч.1
- Написан Dockerfile который собирает контейнер с nginx, образ выложен на docker hub
- Манифест web-pod.yaml настроен для запуска пода с nginx в k8s и инициализацией index.html

ч.2 
- Запушен образ с hipster-frontend на docker hub
- Добавлены переменные среды env в сгенеренный манифест frontend-pod-healthy.yaml

### ДЗ №2
- Изучен и опрообован kind
- Написаны deploymen и replicaset для серсивов frontend и payment
- Изучен daymonset для exporter для использования на master- и worker-нодах.
### ДЗ №3
- Изучены возможности балансировки k8s
- Написаны манифесты по проверки доступности, по сервисам
- Изучен daymonset для exporter для использования на master- и worker-нодах.
- Включен режим IPVS для изменения режимы работы kube-proxy
- изучен балансер MetalLB
- ingress'ы и сервисы web, dns  для публикации наружу из k8s
- написаны манифесты под канареечный деплой
