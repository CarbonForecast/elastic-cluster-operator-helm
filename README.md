# elastic-cluster-operator-helm
Helm chart for deploying the elastic cluster on kubernetes (ECK).

The CRDs and any other YAMLs defining resource are subject to the [Elastic licence](https://github.com/elastic/cloud-on-k8s/blob/master/LICENSE.txt).


Kibana && ES:
```
user: elastic
kubectl get secret jaegerdb-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```
