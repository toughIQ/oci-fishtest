# OpenShift / K8s Deployment of FishTest container

# Create a new Project
`oc new-project fishtest`

# Create a Secret with FishTest credentials
1. Create account here: https://tests.stockfishchess.org/signup
2. Use credentials to create a secret:
`oc create secret generic fishtest --from-literal USERNAME="MyUsername" --from-literal PASSWORD="MyPassword"`
The secret `name` `fishtest` is referred in the provided `deployment.yaml`. So if you change the secrets name, you have to change it in the `deployment` too.

# Deployment
`oc apply -f deployment.yaml`

Since the used OCI container is configured by `default` to use 1 CPU core. scaling should be done via upscaling the deployment and not increasing the cores within one pod. So you can better scale according to your needs and resources. 
