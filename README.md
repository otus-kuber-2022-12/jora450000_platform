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
### ДЗ №4
- Изучены возможности StatefulSet, PV, PVC
- Написаны манифест  для использования секретов, кодированные в base64 
### ДЗ №5
- Изучены возможности заведения учетных записей и ролей в k8s
- Порядок задания выполнения манифестов с помощью числового префикса
### ДЗ №9
- Изучены возможности Prometheus для ораганизации сбора метрик
- Развернут стенд с экспортером nginx и nginx exporter 
- К Grafana добавлен datasource Prometheus и dashboard nginx
