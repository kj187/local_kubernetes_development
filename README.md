# Local Kubernetes Development

## Mac OSX

Execute the setup script to install:
- brew
- minikube
- kubectl
- helm
- draft

```
scripts/setup.sh
```

### Problems

Set driver 
https://minikube.sigs.k8s.io/docs/reference/drivers/

```
minikube config set driver virtualbox
```

## Install a dummy app

```
minikube addons enable ingress
kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment web --port=8080 --target-port=8080 --type=NodePort
minikube service web --url
kubectl apply -f example/hello-world/ingress.yaml
IP=$(minikube ip) echo "${IP} hello-world.info" | sudo tee -a /etc/hosts
```

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

Check also via dashboard

```
minikube dashboard
```