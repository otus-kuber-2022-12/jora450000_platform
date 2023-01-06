

install k3s

$ curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

$ export KUBECONFIG=~/.kube/config:~/.kube/k3s-config

$ systemctl start k3s


$ kubectl cluster-info

$ kubectl get nodes


$ k9s

$ kubectl delete pod --all -n kube-system

$ kubectl get cs

системные поды запустились, т.к. статус политики перезапуска  restartPolicy Always

$ kubectl apply -f web-pod.yaml

$ kubectl get pod web -o yaml

проверим сгенерированный https://tinyurl.com/otus-k8s-intro index.html c помощью curl

curl 10.42.0.24:8000
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
 <head>
  <title>Index of /</title>
 </head>
 <body>
<h1>Index of /</h1>
<ul><li><a href="homework.html"> homework.html</a></li>
</ul>
</body></html>


$ kubectl port-forward --address 0.0.0.0 web 8000:8000

пробрасываем порты

проверяем с другой консоли в tmux

$ lynx http://localhost:8000/
                                                        Index of /

     * homework.html







