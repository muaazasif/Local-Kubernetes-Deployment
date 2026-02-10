# Todo Chatbot Helm Chart

This Helm chart deploys the Todo Chatbot application, which consists of a frontend and backend component.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `my-todo-chatbot`:

```bash
helm install my-todo-chatbot .
```

## Uninstalling the Chart

To uninstall/delete the `my-todo-chatbot` release:

```bash
helm delete my-todo-chatbot
```

## Configuration

The following table lists the configurable parameters of the todo-chatbot chart and their default values.

### Backend Parameters

| Parameter                      | Description                                     | Default                           |
|--------------------------------|-------------------------------------------------|-----------------------------------|
| `backend.replicaCount`         | Number of backend replicas                      | `1`                               |
| `backend.image.repository`     | Backend image repository                        | `todo-backend`                    |
| `backend.image.tag`            | Backend image tag                               | `latest`                          |
| `backend.image.pullPolicy`     | Backend image pull policy                       | `IfNotPresent`                    |
| `backend.service.type`         | Backend service type                            | `ClusterIP`                       |
| `backend.service.port`         | Backend service port                            | `5000`                            |
| `backend.resources`            | CPU/Memory resource requests/limits             | `{}`                              |

### Frontend Parameters

| Parameter                      | Description                                     | Default                           |
|--------------------------------|-------------------------------------------------|-----------------------------------|
| `frontend.replicaCount`        | Number of frontend replicas                     | `1`                               |
| `frontend.image.repository`    | Frontend image repository                       | `todo-frontend`                   |
| `frontend.image.tag`           | Frontend image tag                              | `latest`                          |
| `frontend.image.pullPolicy`    | Frontend image pull policy                      | `IfNotPresent`                    |
| `frontend.service.type`        | Frontend service type                           | `LoadBalancer`                    |
| `frontend.service.port`        | Frontend service port                           | `80`                              |
| `frontend.resources`           | CPU/Memory resource requests/limits             | `{}`                              |

## Example

To customize the deployment, create a `values.yaml` file with your desired settings and use it during installation:

```bash
helm install my-todo-chatbot -f values.yaml .
```