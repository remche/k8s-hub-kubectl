#!/bin/bash
sed -i 's/Bash/K8S/g' ~/.local/share/jupyter/kernels/bash/kernel.json
ln -sf  /usr/share/pixmaps/logo-32x32.png ~/.local/share/jupyter/kernels/bash/
ln -sf  /usr/share/pixmaps/logo-64x64.png ~/.local/share/jupyter/kernels/bash/
kubectl config set-context default
kubectl config use-context default
kubens $JUPYTERHUB_USER
