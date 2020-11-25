# Deploy a service using templates

The templates in this repository contain all of the necessary pieces to create a service deployment and the necessary api configuration files to wire it into the mesh.  If you would like to see a step by step installation guide, with an explanation of each piece, see the [official docs](https://docs.greymatter.io/guides/configure-egress-ingress). Otherwise, for a quick service deployment strategy, follow these steps.

## 1. Variables

There are several variables that will be reused for multiple different template steps. Make sure that variables with the same name have the same value as you go through - these variables include:

| Variable                 | Helm Charts Default       |
| ------------------------ | ------------------------- |
| serviceName              |                           |
| servicePort              |                           |
| sidecarIngressPort       | 10808                     |
| zone                     | zone-default-zone         |
| trustDomain              | quickstart.greymatter.io  |

If your Grey Matter installation used the Grey Matter helm charts, unless you explicitly changed any of the above values with a default, you should use those values.  Service name and the port your service will be running on are up to you, be sure to add whatever environment variables are necessary to ensure this when you generate the [deployment](#1-the-deployment)

In each template command you will indicate with directory you want the generated files to be put in, this is indicated as `DIRECTORY`. It is recommended to create a directory for each service you will be adding, and create all its templated files into it.

## 1. The Deployment

If you already have a Kubernetes deployment file with a sidecar to deploy your service, you can move onto step 2.

If you need to generate a Kubernetes deployment file with a sidecar for your service, run the following:

```bash
pathogen generate deployment DIRECTORY/
```

With this step, there is one manual configuration piece, open your generated file at `DIRECTORY/deploy/k8s-deployment.yaml` and find the line that looks like the following:

```yaml
        env:
        -- FILL IN YOUR SERVICE'S ENVVARS --
```

Delete the `-- FILL IN YOUR SERVICE'S ENVVARS --` and manually configure the environment variables for your service in the form:

```yaml
        env:
        - name: KEY
            value: "VALUE"
        - name: KEY
            value: "VALUE"
        ...
```

If you have a Kubernetes cluster ready that you would like to apply into, run:

```bash
kubectl apply -f DIRECTORY/deploy/k8s-deployment.yaml
```

## 2. Service templates

To create the base mesh configurations for the service, run the following:

```bash
pathogen generate service DIRECTORY/
```

This will generate the necessary mesh objects to allow Control to configure the sidecar and connect the deployment's sidecar to it's service.

## 3. Edge to service templates

To create the mesh configurations necessary to route from edge to the new service, run the following:

```bash
pathogen generate edge DIRECTORY/
```

## 4. Catalog template

To create a catalog cluster file to register your service with the Grey Matter Application, run the following:

```bash
pathogen generate catalog DIRECTORY/
```

## 5. Apply

If your service will generate requests to another service in the mesh, you will need to configure [egress routes]() as well. If you only need to configure your service for ingress, follow these steps to apply.

Make sure you have the [Grey Matter CLI](https://docs.greymatter.io/guides/commands-cli) downloaded and installed and configured for your Grey Matter deployment. You can check this by running `greymatter list cluster`. If you don't see any errors, you should be good to go.

To apply the files and wire your service into the mesh, run the following:

```bash
export DIRECTORY={DIRECTORY}
```

```bash
cd $DIRECTORY
./apply.sh
cd ..
```

Once you've done this, you should see your service on the dashboard and be able to route to it through edge!

## 6. Remove

To remove the service completely from the mesh, run the following:

```bash
kubectl delete -f $DIRECTORY/deploy/k8s-deployment.yaml
cd $DIRECTORY
./remove.sh
cd ..
```

## (Optional) Egress Routes

If your service doesn't need to make requests to another service within the mesh, you do not need to do this step.

If your service will generate requests to another service in the mesh, run the following:

```bash
pathogen generate egress DIRECTORY/
```

Note that if the service your service is routing to - egressServiceName - already exists and is configured in the mesh, you **must** edit it's listener secret to allow your service to access it:

```bash
greymatter edit listener listener-{{egressServiceName}}
```

(or whatever the listener key for the service is),

and add to the `secret.subject_names` list:

```bash
spiffe://{{ trustDomain }}/{{ serviceName }}
```

filling in the SPIRE trust domain value (quickstart.greymatter.io for the helm-charts) and serviceName.

Your service will need to be configured to make requests to `http://localhost:{{egressPort}}/{{ path }}` in order to make these egress requests.