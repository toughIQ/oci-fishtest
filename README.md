# oci-fishtest
StockFish fishtest worker - Chess

Project: https://github.com/glinscott/fishtest

## OCI engine
I used `podman`, but you can use `docker` as well. Just use `docker` instead of `podman` for the CLI commands. 

## BUILD
`podman build -t my_fishtest:latest https://github.com/toughIQ/oci-fishtest.git`

## RUN 
- Using DockerHub image:

`podman run -it --rm -e USERNAME="myUsername" -e PASSWORD="myPassword" docker.io/toughiq/fishtest:latest`

- Using local build image:

`podman run -it --rm -e USERNAME="myUsername" -e PASSWORD="myPassword" my_fishtest:latest`

- Running as daemon:

`podman run -d -e USERNAME="myUsername" -e PASSWORD="myPassword" docker.io/toughiq/fishtest:latest`

- Change number of CPU cores:

You may change the default number of cores from `1` to anything you like by adding the `-e CORES="<some_number>"` parameter.

## !!! DISCLAIMER !!!
Since in there are `USERNAME` and `PASSWORD` used in the above commands, make sure, that you dont use a unique username and password for your FishTest account. Also make sure, that you run these commands only on systems, where you can be sure, that you are the only one to have access to the `history` of these commands.

There is also an `OpenShift` Deployment, which could be used to get FishTest up and running in an OpenShift Cluster. 

Please keep in mind, that this is still `Work in Progress`!
