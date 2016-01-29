#!/bin/bash

# Dong Xie @ 2016

# To prevent from re-entry, as we are not idempotent
if [ -e .k8s-deploy-here ]
then echo "This has been run before... exit"; exit 1;
else touch .k8s-deploy-here
fi

# Check mandate env var
if [ -z "$KC_USERNAME" -o -z "$KC_PASSWORD" -o -z "$DOMAIN_ROOT" -o -z "$AWS_KEYPAIR_NAME" ]
then exit 1
fi

# Get cluster.yaml ready

sed -e "s/^clusterName:.*/clusterName: $CLUSTER_NAME/" \
    -e "s/^externalDNSName:.*/externalDNSName: $CLUSTER_NAME\.$DOMAIN_ROOT/" \
    -e "s/^keyName:.*/keyName: $AWS_KEYPAIR_NAME/" \
    template/cluster.yaml.tpl > cluster.yaml

# Up the cluster
kube-aws up --config=cluster.yaml

sleep 5

# Set aws route53 to reach cluster
clusterip=$(kube-aws status | grep Controller | cut -d$'\t' -f2)
hostedzoneid=$(aws route53 list-hosted-zones-by-name --dns-name $DOMAIN_ROOT | jq -r '.HostedZones[0].Id')

sed -e "s/Name.*/Name\": \"$CLUSTER_NAME\.$DOMAIN_ROOT\",/" \
    -e "s/Value.*/Value\": \"$clusterip\"/" \
    template/aws/aws_route53_clusterip_upsert.json.tpl > aws/aws_route53_clusterip_upsert.json

aws route53 change-resource-record-sets --hosted-zone-id $hostedzoneid --change-batch=file://aws/aws_route53_clusterip_upsert.json

# temp fix to get away from route53 need time to stabilize
echo "$clusterip    $CLUSTER_NAME.$DOMAIN_ROOT" >> /etc/hosts

# Start k8s deploy
export KUBECONFIG=/usr/local/k8s-deploy/clusters/$CLUSTER_NAME/kubeconfig

until kubectl get nodes 2>/dev/null; do
    sleep 5
done

kubectl create -f k8s/postgres-rc.json
kubectl create -f k8s/postgres-service.json
kubectl create -f k8s/keycloak-rc.json
kubectl create -f k8s/keycloak-service.json

sleep 20

# Set keycloak

./keycloak/init-keycloak.sh

# Deploy more
jq ".spec.template.spec.containers[0].env[0].value = \"https://$SUBDOMAIN_NAME.$DOMAIN_ROOT\"" \
    template/k8s/sampleapp-rc.json.tpl > k8s/sampleapp-rc.json

jq ".spec.template.spec.containers[0].env[0].value = \"https://$SUBDOMAIN_NAME.$DOMAIN_ROOT\"" \
    template/k8s/xwiki-rc.json.tpl > k8s/xwiki-rc.json

kubectl create -f k8s/sampleapp-rc.json
kubectl create -f k8s/sampleapp-service.json
kubectl create -f k8s/xwiki-rc.json
kubectl create -f k8s/xwiki-service.json

sleep 5

kubectl create -f k8s/nginx-rc.json
kubectl create -f k8s/nginx-service.json

sleep 10

nginx_lbdnsname=$(kubectl describe svc nginx | grep "LoadBalancer Ingress:" | cut -d$'\t' -f2)
nginx_lbname=$(echo "$nginx_lbdnsname" | cut -d'-' -f1)
nginx_lbhostedzoneid=$(aws elb describe-load-balancers --load-balancer-names $nginx_lbname \
    | jq -r '.LoadBalancerDescriptions[0].CanonicalHostedZoneNameID')

# Nginx mess
jq ".Changes[0].ResourceRecordSet.Name = \"$SUBDOMAIN_NAME.$DOMAIN_ROOT.\" | \
    .Changes[0].ResourceRecordSet.AliasTarget.DNSName = \"$nginx_lbdnsname\" | \
    .Changes[0].ResourceRecordSet.AliasTarget.HostedZoneId = \"$nginx_lbhostedzoneid\"" \
    template/aws/aws_route53_elb_nginx_upsert.json.tpl > \
    aws/aws_route53_elb_nginx_upsert.json


aws route53 change-resource-record-sets --hosted-zone-id $hostedzoneid --change-batch=file://aws/aws_route53_elb_nginx_upsert.json

# Set nginx
./nginx/init-nginx.sh "$SUBDOMAIN_NAME.$DOMAIN_ROOT"

# Maybe remove our hosts line to revert back to DNS for kube api

echo "k8s deploy Done"

# Looping waiting for destroy, NOT MEANT FOR PRODUCTION!!!
while [ ! -e .k8s-deploy-destroy ]
do
    sleep 120
done

sleep 60

# Destroy everything

kubectl delete -f k8s/nginx-service.json

sleep 20

kube-aws destroy

sleep 20

echo "k8s destroy Done"

exit 0
