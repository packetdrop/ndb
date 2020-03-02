# Network Debugger (ndb) 
This project builds a docker image with network debugging tools and publish it to docker hub.
Please refer to the [Docker file](Dockerfile) to see the upto date list of tools present in
this image.

To build the image, fire following command from project root directory:
```
make build
```

To publish the image, fire the following command from project root directory:
```
make publish
```

**Note** Make sure you update the docker usename in the Makefile.

To cleanup the previously built image:
```
make clean
```
  
