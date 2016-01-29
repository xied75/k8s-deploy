#!/bin/bash

# Dong Xie 2016

if [ -z $CLUSTER_NAME ]; then exit 1; fi

while :
do
  status=$(aws cloudformation describe-stacks --stack-name $CLUSTER_NAME | jq -r '.Stacks[0].StackStatus')

  case "$status" in
      ""|null)
      exit 0;
      ;;

  DELETE_FAILED)
      break;
      ;;
  esac

  sleep 20
done

echo "Failed to remove cluster cleanly, we re-try once..."

groupid=$(aws ec2 describe-security-groups | jq -r ".SecurityGroups[] | \
    select(.Tags[0].Value == \"$CLUSTER_NAME\" and .Tags[0].Key == \"KubernetesCluster\") | .GroupId")

echo "  offending SecurityGroup id: $groupid"

aws ec2 delete-security-group --group-id $groupid

sleep 5

echo "  now retry destroy"

aws cloudformation delete-stack --stack-name $CLUSTER_NAME

