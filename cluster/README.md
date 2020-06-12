# Cluster Pathogen Templates

This directory contains the pathogen templates for adding a cluster to an existing service deployments in an exemplar Grey Matter instance. This exemplar instance assumes the following:

- A Kubernetes deployment environment.
- A SPIRE deployment using namespace and service account based identities.

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                  | Default       | Description                                              |
| --------------------- | ------------- | -------------------------------------------------------- |
| clusterName           |               | The name of the cluster.                                 |
| clusterNamespace      | default       | The namespace into which the cluster is deployed.        |
| clusterServiceAccount | default       | The service account running the cluster.                 |
| serviceHost           | localhost     | The hostname or address for the service.                 |
| serviceName           |               | The name of the service.                                 |
| serviceNamespace      | default       | The namespace into which the service is deployed.        |
| servicePort           | 10080         | The port on which the service listens.                   |
| serviceServiceAccount | default       | The serivce account running the service.                 |
| sidecarEgressPort     | 9080          | The port on which the sidecar should listen for egress.  |
| sidecarIngressPort    | 8443          | The port on which the sidecar should listen for ingress. |
| trustDomain           | greymatter.io | The name of the trust domain.                            |
| zone                  | default.zone  | The zone.                                                |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com/joshua-rutherford/pathogen-greymatter.git//cluster DIRECTORY