{
  "Comment": "Create elb nginx record",
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "squonk.aws.fourty-two.org.",
        "Type": "A",
        "AliasTarget": {
          "DNSName": "dualstack.a3215662ebde811e5bc910ad222f2e92-1520242704.eu-west-1.elb.amazonaws.com",
          "EvaluateTargetHealth": false,
          "HostedZoneId": "Z32O12XQLNTSW2"
        }
      }
    }
  ]
}
