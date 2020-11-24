# Service Pathogen Templates

This directory contains the pathogen templates for inital service deployments in an exemplar Grey Matter instance. This exemplar instance assumes the following:

- A Kubernetes deployment environment.
- A SPIRE deployment using namespace and service account based identities.

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                     | Default       | Description                                              |
| ------------------------ | ------------- | -------------------------------------------------------- |
| serviceHost              | localhost     | The hostname or address for the service.                 |
| serviceName              |               | The name of the service.                                 |
| servicePort              | 8080          | The port on which the service listens.                   |
| trustDomain              | quickstart.greymatter.io | The name of the SPIRE trust domain.           |
| sidecarEgressPort        | 10909         | The port on which the sidecar should listen for egress.  |
| sidecarIngressPort       | 10808         | The port on which the sidecar should listen for ingress. |
| zone                     | zone-default-zone  | The zone.                                           |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com/joshua-rutherford/pathogen-greymatter.git//service DIRECTORY
