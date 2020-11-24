# Cluster Pathogen Templates

This directory contains the pathogen templates for adding a service to an existing edge deployment in an exemplar Grey Matter instance. This exemplar instance assumes the following:

- A Kubernetes deployment environment.
- A SPIRE deployment using pod label based identities.
å
The configuration created will route to the service with name serviceName at `/services/{{serviceName}}/latest`.

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name                  | Default       | Description                                       |
| --------------------- | ------------- | ------------------------------------------------- |
| serviceName           |               | The name of the service to route to from edge.    |
| trustDomain           | quickstart.greymatter.io | The name of the trust domain.          |
| zone                  | zone-default-zone  | The zone.                                    |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com:greymatter-io/pathogen-greymatter.git//edge DIRECTORY