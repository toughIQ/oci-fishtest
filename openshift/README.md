# OpenShift / K8s Deployment of FishTest container

# Create a new Project
`oc new-project fishtest`

# Create a Secret with FishTest credentials
1. Create account here: https://tests.stockfishchess.org/signup
2. Use credentials to create a secret:
`oc create secret generic fishtest --from-literal USERNAME="MyUsername" --from-literal PASSWORD="MyPassword"`
The secret `name` `fishtest` is referred in the provided `deployment.yaml`. So if you change the secrets name, you have to change it in the `deployment` too.
## Keep an eye on the FishTest Machine Max of 16
FishTest has a maximum of 16 machines or servers per username. So the simple idea of a 1 core pod scaling up the deployment to the limits of your cluster does not work, since 16 pods are the max.
But this max only applies to machines and not CPU or anything else. You just can run 16 instances at a time.
So it might be an idea to increase the CPU cores per pod, if you have the resources available.
You can achieve this by adding this parameters to the `secret` creation: `--from-literal CORES="<SomeNumber>"` 

# Deployment
`oc apply -f deployment.yaml`

Since the used OCI container is configured by `default` to use 1 CPU core. scaling should be done via upscaling the deployment and not increasing the cores within one pod. So you can better scale according to your needs and resources. 
