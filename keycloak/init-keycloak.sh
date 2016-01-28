#!/bin/bash

# Dong Xie @ 2015
# Temporary solution to preset keycloak

echo "Init keycloak ..."

url="http://127.0.0.1:8080"

# Need to make sure to get $pod
pod=
until [ -n "$pod" -a "$pod" != "null" ]; do
  pod=$(kubectl get pod --selector=name=keycloak --output=json | jq -r '.items[0].metadata.name')
  echo "waiting for keycloak pod..."
  sleep 5
done

until kubectl exec $pod -- /opt/jboss/keycloak/bin/jboss-cli.sh --connect --commands="cd deployment, cd keycloak-server.war, read-attribute status" 2>/dev/null; do
  sleep 5
done

# Add our user
kubectl exec $pod -- /opt/jboss/keycloak/bin/add-user.sh -r master -u $KC_USERNAME -p $KC_PASSWORD

# Get our config xml
kubectl exec -i $pod -- /bin/bash -c 'cat > /opt/jboss/keycloak/standalone/configuration/standalone.xml' < ./keycloak/standalone.xml

# Reload
kubectl exec $pod -- /opt/jboss/keycloak/bin/jboss-cli.sh --connect --command=:reload

until kubectl exec $pod -- /opt/jboss/keycloak/bin/jboss-cli.sh --connect --commands="cd deployment, cd keycloak-server.war, read-attribute status" 2>/dev/null; do
  sleep 5
done

token=
until [ -n "$token" ]; do
  token=$(kubectl exec $pod -- curl -s -X POST $url/auth/realms/master/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d "username=dong" -d 'password=testing123' -d 'grant_type=password' -d 'client_id=admin-cli' | jq -r '.access_token')
  sleep 5
done

# echo "$token"

adminuserid=$(kubectl exec $pod -- curl -s $url/auth/admin/realms/master/users?username=admin -H "Authorization: Bearer $token" | jq -r '.[0].id')

# echo "$adminuserid"

kubectl exec $pod -- curl -s -X DELETE $url/auth/admin/realms/master/users/$adminuserid -H "Authorization: Bearer $token"

# import realms into keycloak
echo "importing realms:"

sed -e "s/{{fqdn}}/$SUBDOMAIN_NAME.$DOMAIN_ROOT/g" ./template/keycloak/squonk-realm.json.tpl > ./keycloak/squonk-realm.json

content=$(cat ./keycloak/squonk-realm.json)
kubectl exec $pod -- curl -v -s -X POST $url/auth/admin/realms -H "Authorization: Bearer $token" -H "Content-Type: application/json" --data "$content" 

echo "Init keycloak ... Done"
