{
  "kind": "ReplicationController",
  "apiVersion": "v1",
  "metadata": {
    "name": "sampleapp",
    "labels": {
      "name": "sampleapp"
    }
  },
  "spec": {
    "replicas": 1,
    "selector": {
      "name": "sampleapp"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "sampleapp"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "sampleapp",
            "image": "xied75/sampleapp:latest",
            "ports": [
              {
                "name": "sampleapp-http",
                "containerPort": 8080
              },
              {
                "name": "sampleapp-https",
                "containerPort": 8443
              }
            ],
            "env": [
              {
                "name": "KEYCLOAK_SERVER_URL",
                "value": "https://squonk.aws.fourty-two.org"
              }
            ]
          }
        ]
      }
    }
  }
}
