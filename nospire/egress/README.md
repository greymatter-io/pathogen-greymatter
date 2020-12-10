# Egress Route Pathogen Templates

This directory contains the pathogen templates for adding an egress route from one service to another.

- A Kubernetes deployment environment.
- A SPIRE deployment using pod label identities.

## NOTE

THERE IS AN EXTRA STEP _ EDIT LISTENER

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                     | Default       | Description                                              |
| ------------------------ | ------------- | -------------------------------------------------------- |
| serviceName              |               | The name of the service making egress requests.          |
| egressServiceName        |               | The name of the service to make requests to.             |
| path                     |               | The path for the route to egress service.                |
| trustDomain              | quickstart.greymatter.io | The name of the SPIRE trust domain.           |
| zone                     | zone-default-zone  | The zone.                                           |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com:greymatter-io/pathogen-greymatter.git//egress DIRECTORY
