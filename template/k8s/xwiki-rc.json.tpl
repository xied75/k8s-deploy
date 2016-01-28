{
  "kind": "ReplicationController",
  "apiVersion": "v1",
  "metadata": {
    "name": "xwiki",
    "labels": {
      "name": "xwiki"
    }
  },
  "spec": {
    "replicas": 1,
    "selector": {
      "name": "xwiki"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "xwiki"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "xwiki",
            "image": "xied75/xwiki:latest",
            "ports": [
              {
                "name": "xwiki-http",
                "containerPort": 8080
              },
              {
                "name": "xwiki-https",
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
