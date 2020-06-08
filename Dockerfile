FROM remche/jupyterhub-bash:0.6

USER root

RUN pip install jupyterlab_iframe && \
    jupyter labextension install jupyterlab_iframe && \
    jupyter serverextension enable --py jupyterlab_iframe

ARG BIN_PATH=/usr/local/bin
ARG KUBECTL_VERSION=v1.18.3

COPY entrypoint_override.sh /entrypoint_override.sh

RUN wget https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl -O $BIN_PATH/kubectl && \
    chmod +x $BIN_PATH/kubectl

RUN wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -O $BIN_PATH/kubens && \
    chmod +x $BIN_PATH/kubens

RUN mkdir /etc/bash_completion.d && kubectl completion bash > /etc/bash_completion.d/kubectl

USER jovyan
