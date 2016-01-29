#!/bin/bash

# Dong Xie 2016
# Set temp conf then install letsencrypt cli and then get certs and finally
# swap with final conf

# Parameters: $1 FQDN for letsencrypt signing

echo "Init nginx ..."

# Need to make sure to get $pod
pod=
until [ -n "$pod" -a "$pod" != "null" ]; do
  pod=$(kubectl get pod --selector=name=nginx --output=json | jq -r '.items[] | select(.status.phase == "Running") | .metadata.name')
  echo "waiting for nginx pod..."
  sleep 10
done

# Install git then letsencrypt
kubectl exec $pod -- apt-get -qq update 

echo "  installing git ... output silenced"
kubectl exec $pod -- apt-get -qqy install git curl --no-install-recommends > /dev/null

kubectl exec $pod -- git clone https://github.com/letsencrypt/letsencrypt.git /usr/local/letsencrypt

# Get partial conf ready
kubectl exec $pod -- mkdir /tmp/letsencrypt-auto

kubectl exec -i $pod -- /bin/bash -c 'cat > /etc/nginx/conf.d/default.conf' < ./nginx/proxy_ssl_partial.conf

kubectl exec $pod -- nginx -s reload

sleep 5

# Run letsencrypt

echo "  calling letsencrypt ... output silenced"

staging_tag="--staging"
if [ -n "$LE_LIVE" ]
then $staging_tag=""
fi

kubectl exec $pod -- /usr/local/letsencrypt/letsencrypt-auto certonly --email \
    xied75@gmail.com --domain $1 --keep-until-expiring --agree-tos $staging_tag \
    --authenticator webroot --webroot-path=/tmp/letsencrypt-auto > /dev/null

# Copy certs
kubectl exec $pod -- cp /etc/letsencrypt/live/$1/fullchain.pem /etc/nginx/fullchain.pem
kubectl exec $pod -- cp /etc/letsencrypt/live/$1/privkey.pem /etc/nginx/privkey.pem

# Get final conf
kubectl exec -i $pod -- /bin/bash -c 'cat > /etc/nginx/conf.d/default.conf' < ./nginx/proxy_ssl.conf

kubectl exec $pod -- nginx -s reload

echo "Init nginx ... Done"
