#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

#Instalacion de  docker
sudo apt-get install ca-certificates curl gnupg wget apt-transport-https -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 


#Descargamos e instalamos los binarios de microk8s
sudo snap install microk8s --classic --channel=1.29



#instalacion de argocd
sudo microk8s kubectl create namespace argocd
git clone https://github.com/argoproj/argo-cd.git
sudo microk8s  kubectl apply -n argocd --force -f argo-cd/manifests/install.yaml
sudo microk8s kubectl get all -n argocd