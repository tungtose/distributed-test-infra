## Usage

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Once the cluster is up and running, you can check that Karpenter is functioning as intended with the following command:

```bash
# First, make sure you have updated your local kubeconfig
aws eks --region <region> update-kubeconfig --name <cluster_name>

# Second, scale the example deployment
kubectl scale deployment inflate --replicas 5

# You can watch Karpenter's controller logs with
kubectl logs -f -n karpenter -l app.kubernetes.io/name=karpenter -c controller
```

You should see a new node named `karpenter.sh/provisioner-name/default` eventually come up in the console; this was provisioned by Karpenter in response to the scaled deployment above.

### Tear Down & Clean-Up

1. Remove the example deployment created above and any nodes created by Karpenter

```bash
kubectl delete deployment inflate
kubectl delete node -l karpenter.sh/provisioner-name=default
```

2. Remove the resources created by Terraform

```bash
terraform destroy
```
