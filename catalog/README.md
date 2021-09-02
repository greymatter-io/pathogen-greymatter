# Catalog Pathogen Templates

This directory contains the pathogen templates for adding a service to an existing Grey Matter Catalog.

## Usage

### Variables

These templates use the following variables to customize the Grey Matter service mesh resources.

| Name          | Default      | Description                                                    |
| ------------- | ------------ | -------------------------------------------------------------- |
| clusterName   |              | The name of the cluster.                                       |
| displayName   |              | The name as it should appear in the dashboard.                 |
| zone          | zone-default-zone | The zone.                                                      |
| impact        | low          | The impact level if the application is down                    |
| version       | latest       | The service  version.                                          |
| owner         |              | The owner of the service                                       |
| capability    |              | The capability of the service                                  |
| documentation |              | The path to the documenation link                              |
| minInstances  | 1            | The minimum number of instances that should always be running. |
| maxInstances  | 1            | The maximum number of instances that could be running          |

### Generation

To generate mesh resources with these templates run the following command replacing `DIRECTORY` is the local directory to which the resources should be generated.

    pathogen generate git@github.com/joshua-rutherford/pathogen-greymatter.git//catalog DIRECTORY
