# Deployment Pathogen Template

This directory contains the pathogen templates for a Kubernetes service deployment with a Grey Matter sidecar. This exemplar instance assumes the following:

- A Kubernetes deployment environment.
- A SPIRE deployment using pod label based identities (the default in Grey Matter Helm Charts).

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                     | Default       | Description                                              |
| ------------------------ | ------------- | -------------------------------------------------------- |
| serviceName              |               | The name of the service.                                 |
| servicePort              | 8080          | The port on which the service listens.                   |
| sidecarIngressPort       | 10808         | The port on which the sidecar should listen for ingress. |
| zone                     | zone-default-zone  | The zone.                                           |
| fabricNamespace          | default       | The namespace in which Grey Matter Control is running.   |
| image                    |               | The image of your service to deploy.                     |
| controlPodLabel          | greymatter.io/control | The value of `gm_control_kubernetes_cluster_label` environment variable for Grey Matter Control. (this value is greymatter.io/control by default for the Grey Matter Helm Charts). |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com:greymatter-io/pathogen-greymatter.git//deployment DIRECTORY

### Before Apply

In the deployment file, which will be in `DIRECTORY/deploy/k8s-deployment.yaml`, there is a space within your service container that looks like the following:

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

Once you have done this, your deployment file should be ready to go.
