# oci-fishtest
StockFish fishtest worker - Chess

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
