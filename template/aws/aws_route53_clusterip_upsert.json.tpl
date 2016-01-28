{
  "Comment": "Add k8s cluster ip A record",
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "kube1.aws.fourty-two.org",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "52.17.53.231"
          }
        ]
      }
    }
  ]
}
