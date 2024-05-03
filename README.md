# ultimate

I had to run everything locally using kind (https://kind.sigs.k8s.io/)

You can find the cluster configuration under ./kubernetes/cluster

To create the cluster:
 - 'kind create cluster --config ./kubernetes/cluster/cluster.yaml'

To deploy application and k8s reources:
 - build docker images located in './docker/app' and ./docker/db'
 - 'bash kubernetes/app/deploy.sh'

To deploy prometheus and elastic search:
 - 'bash kubernetes/prometheus/deploy.sh'
 - 'bash kubernetes/elasticsearch/deploy.sh'