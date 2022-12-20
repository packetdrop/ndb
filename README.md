# Network Debugger (ndb) 
This project builds a container image with network debugging tools and publish it to docker hub, quay and as a github package.

Container images packs following tools : iperf3, netperf, traceroute, iproute2, wireshark, mtr, ethtools and many more.
Please refer to the [Docker file](Dockerfile) for full list of tools this image contains.

To pull the image

#### Quay
```shell
docker pull quay.io/packetdrop/ndb:latest
```
#### Github Packages
```shell
docker pull ghcr.io/packetdrop/ndb:latest
```

### Docker hub
```shell
docker pull avishnoi/ndb:latest
```

### Build image locally 
```
make build
```

### Cleanup existing local image
```
make clean
```
  
## Usages

### Run Docker container
```shell
docker run  -itd --rm --name=ndb ghcr.io/packetdrop/ndb:latest

or 

docker run  -itd --rm --name=ndb quay.io/packetdrop/ndb:latest

or 

docker run  -itd --rm --name=ndb avishnoi/ndb:latest
```

### Run Kubernetes Pod
```shell
kubectl run ndb --image=ghcr.io/packetdrop/ndb:latest --restart=Never
```

You can exec now to the pod and run the tools packed in the image.

```shell
kubectl exec -it ndb -- /bin/bash
```

You can use the manifest files present in the `./deployment` directory to deploy the pod as well.

```shell
kubectl apply -f ./deployment/ndb-pod.yaml
```