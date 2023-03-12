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
### ДЗ №6
- На виртуальной машине поднят k3s 
- С помощью help установлен cert-manager. в качестве ingress выбран traefik. Выдача сертификатов от cert-manager проверена в режиме self-signed и в acme от Let's Encrypt.
- С помощью helm подняты доступные снаружи chartmusem, harbor с достоверными сертификатами TLS от cert-manager Let's Encrypt.
- Отделены микросервисы из чарта согласно заданию 
- Изучен kubecfg
- Кustomizирован сервис recommendationservice из hipster-shop


### ДЗ № 8
- согласно заданию написаны манифесты для описания кастомного ресурса и для создания
- установлен python3.8 с модулями для kopf и kubernetes
- запущен контроллер mysql с помощью kopf run mysql-operator.py
- проверено создание PVC и подов 
- собран образ docker и через mysql-operator проверена работа оператора в кластере k8s
- создана таблица в БД otus-database:
~~~
─# k exec -ti mysql-instance-66886fbcd9-p77v9 -- bash                                                                                              1 ⨯
root@mysql-instance-66886fbcd9-p77v9:/# mysql -u root -potuspassword
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| otus-database      |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.001 sec)

MariaDB [(none)]> use otus-database;
Database changed
MariaDB [otus-database]> show tables;
Empty set (0.000 sec)

MariaDB [otus-database]> CREATE TABLE test ( id smallint
    -> unsigned not null auto_increment, name varchar(20) not null, constraint pk_example primary key
    -> (id) );
Query OK, 0 rows affected, 1 warning (0.008 sec)

MariaDB [otus-database]> INSERT INTO test ( id, name ) VALUES (
    -> null, 'some data' );
Query OK, 1 row affected (0.003 sec)

MariaDB [otus-database]> INSERT INTO test ( id, name ) VALUES ( null, 'some data 2' );
Query OK, 1 row affected (0.001 sec)

MariaDB [otus-database]> select * from test;
+----+-------------+
| id | name        |
+----+-------------+
|  1 | some data   |
|  2 | some data 2 |
+----+-------------+
2 rows in set (0.000 sec)
~~~
- Удален инстанс - проверены pvc - остался только backup
~~~
-# kubectl delete ms/mysql-instance
mysql.otus.homework "mysql-instance" deleted
NAME                        STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
backup-mysql-instance-pvc   Bound    pvc-1e88a1fa-9ba7-429c-9da8-f77e01f2846e   1Gi        RWO            local-path     16m
~~~
- заново развернут новый инстанс mysql/mariadb
~~~
k apply -f ./cr.yaml
-# k get po
NAME                               READY   STATUS             RESTARTS     AGE
mysql-operator-848bd44fbf-mmxxd    1/1     Running            0            20m
backup-mysql-instance-job-5qqx5    0/1     Completed          0            3m10s
restore-mysql-instance-job-wd75k   0/1     CrashLoopBackOff   1 (7s ago)   9s
mysql-instance-66886fbcd9-qxltj    1/1     Running            0            9s

─# k exec -ti mysql-instance-66886fbcd9-qxltj -- bash
root@mysql-instance-66886fbcd9-qxltj:/# mysql -u root -potuspassword
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 4
Server version: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use otus;
ERROR 1049 (42000): Unknown database 'otus'
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| otus-database      |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.000 sec)

MariaDB [(none)]> use otus-database;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [otus-database]> select * from test;
+----+-------------+
| id | name        |
+----+-------------+
|  1 | some data   |
|  2 | some data 2 |
+----+-------------+
2 rows in set (0.000 sec)
~~~
==>Бэкап/восстановление произведено успешно
=======

### ДЗ №8
-  Изучены возможности Prometheus для ораганизации сбора метрик
-   Развернут стенд с экспортером nginx и nginx exporter
-   К Grafana добавлен datasource Prometheus и dashboard nginx


