#!/bin/bash
sed -i 's/Bash/K8S/g' ~/.local/share/jupyter/kernels/bash/kernel.json
kubectl config set-context default
kubectl config use-context default
kubens $JUPYTERHUB_USER
