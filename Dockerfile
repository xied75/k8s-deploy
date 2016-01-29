FROM ubuntu:trusty
MAINTAINER Dong Xie <xied75@gmail.com>

# install aws-cli, and wget, jq
RUN apt-get update && \
    apt-get install -yq --no-install-recommends  python-pip wget jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install awscli

WORKDIR /usr/local/bin

# install kube-aws v0.3.0
RUN wget -qO- https://github.com/coreos/coreos-kubernetes/releases/download/v0.3.0/kube-aws-linux-amd64.tar.gz | tar xvz

# install kubectl v1.1.4
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v1.1.4/bin/linux/amd64/kubectl
RUN chmod +x kubectl

# get files ready
RUN bash -c 'mkdir -pv /usr/local/k8s-deploy/{aws,keycloak,nginx}'

VOLUME /usr/local/k8s-deploy

COPY k8s/ /usr/local/k8s-deploy/k8s
COPY nginx/ /usr/local/k8s-deploy/nginx
COPY keycloak /usr/local/k8s-deploy/keycloak
COPY template/ /usr/local/k8s-deploy/template
COPY deploy.sh /usr/local/k8s-deploy/

# ENV, to be overridden
ENV CLUSTER_NAME=kube1 \
    AWS_KEYPAIR_NAME= \
    DOMAIN_ROOT= \
    SUBDOMAIN_NAME= \
    KC_USERNAME= \
    KC_PASSWORD= \
    LE_LIVE=

# final work
WORKDIR /usr/local/k8s-deploy

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/k8s-deploy/deploy.sh"]

