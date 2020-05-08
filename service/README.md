# Service Pathogen Templates
This directory contains the pathogen templates for inital service deployments in an exemplar Grey Matter instance. This exemplar instance assumes the following:

- A Kubernetes deployment environment.
- A SPIRE deployment using namespace and service account based identities.

## Usage

### Variables
These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                     | Default       | Description                                              |
| ------------------------ | ------------- | -------------------------------------------------------- |
| kubernetesNamespace      | default       | The namespace into which the service is deployed.        |
| kubernetesServiceAccount | default       | The serivce account running the service.                 |
| serviceHost              | localhost     | The hostname or address for the service.                 |
| serviceName              | service       | The name of the service.                                 |
| servicePort              | 10080         | The port on which the service listens.                   |
| spireTrustDomain         | greymatter.io | The name of the SPIRE trust domain.                      |
| sidecarEgressPort        | 9080          | The port on which the sidecar should listen for egress.  |
| sidecarIngressPort       | 8443          | The port on which the sidecar should listen for ingress. |
| zone                     | default.zone  | The zone.                                                |

### Generation
To generate mesh resources with these templates run the following command replacing `DIRECORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com/joshua-rutherford/pathogen-greymatter.git//service DIRECTORY