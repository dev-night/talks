# #029 /dev/night - Stairway to Service Mesh

By: [Stefan](https://twitter.com/stesie23)

## Preparation

You can run the following commands to prepare your system.
Because it has to download some hundred MBs.
Stefan will explain what you did at the event.

```bash
$ minikube start --memory=8192
$ curl -L https://github.com/istio/istio/releases/download/1.0.4/istio-1.0.4-linux.tar.gz | tar xvzf -
$ cd istio-1.0.4
$ kubectl apply -f install/kubernetes/helm/istio/templates/crds.yaml
$ kubectl apply -f install/kubernetes/helm/helm-service-account.yaml
$ helm init --service-account tiller
$ helm install install/kubernetes/helm/istio --name istio --namespace istio-system --set servicegraph.enabled=true --set tracing.enabled=true
```

## Slides

[Rendered version of the slides](https://stesie.github.io/istio-talk-en/)

Sources available from https://github.com/stesie/istio-talk-en/.

## Workshop

Material of the workshop on Gitlab at https://git.mayflower.de/stefan.siegl/istio-workshop/.

Copy & paste git clone command:

```
git clone https://git.mayflower.de/stefan.siegl/istio-workshop.git
```

... within the repository you'll find another README.md with further instructions.
