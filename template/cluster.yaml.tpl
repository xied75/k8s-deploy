# Unique name of Kubernetes cluster. In order to deploy
# more than one cluster into the same AWS account, this
# name must not conflict with an existing cluster.
clusterName: kube1

# Name of the SSH keypair already loaded into the AWS
# account being used to deploy this cluster.
keyName: dong-kube-aws

# Region to provision Kubernetes cluster
region: eu-west-1

# Availability Zone to provision Kubernetes cluster
#availabilityZone:

# DNS name routable to the Kubernetes controller nodes
# from worker nodes and external clients. The deployer
# is responsible for making this name routable
externalDNSName: kube1.aws.fourty-two.org

# Instance type for controller node
#controllerInstanceType: m3.medium
controllerInstanceType: t2.small

# Disk size (GiB) for controller node
controllerRootVolumeSize: 20

# Number of worker nodes to create
workerCount: 2

# Instance type for worker nodes
workerInstanceType: t2.small

# Disk size (GiB) for worker nodes
workerRootVolumeSize: 20

# Location of kube-aws artifacts used to deploy a new
# Kubernetes cluster. The necessary artifacts are already
# available in a public S3 bucket matching the version
# of the kube-aws tool. This parameter is typically
# overwritten only for development purposes.
# artifactURL: https://coreos-kubernetes.s3.amazonaws.com/<VERSION>
