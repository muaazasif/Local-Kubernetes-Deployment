# Todo Chatbot - Kubernetes Deployment Guide

This guide explains how to deploy the Todo Chatbot application on a Kubernetes cluster using Helm charts.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Deployment Steps](#deployment-steps)
3. [Using kubectl-ai and Kagent](#using-kubectl-ai-and-kagent)
4. [Using Gordon (Docker AI)](#using-gordon-docker-ai)
5. [Troubleshooting](#troubleshooting)

## Prerequisites

Before deploying the Todo Chatbot application, ensure you have:

- A running Kubernetes cluster (Minikube, Kind, or cloud-based)
- Helm 3.x installed
- kubectl installed and configured to connect to your cluster
- Docker installed (for building images)

## Deployment Steps

### 1. Clone the Repository
```bash
git clone <repository-url>
cd todo-chatbot
```

### 2. Build Docker Images
```bash
# Build backend image
cd backend
docker build -t todo-backend:latest .
cd ..

# Build frontend image
cd frontend
docker build -t todo-frontend:latest .
cd ..
```

### 3. Push Images to Registry (if using remote cluster)
```bash
# Tag and push images to your registry
docker tag todo-backend:latest <registry>/todo-backend:latest
docker push <registry>/todo-backend:latest

docker tag todo-frontend:latest <registry>/todo-frontend:latest
docker push <registry>/todo-frontend:latest
```

### 4. Deploy Using Helm
```bash
cd helm/todo-chatbot

# Install the chart
helm install todo-chatbot .

# Or with custom values
helm install todo-chatbot . -f custom-values.yaml
```

### 5. Verify Deployment
```bash
# Check pods
kubectl get pods

# Check services
kubectl get svc

# Check deployments
kubectl get deployments
```

### 6. Access the Application
```bash
# Get the frontend service external IP
kubectl get svc todo-frontend-service

# Or use port forwarding for testing
kubectl port-forward svc/todo-frontend-service 8080:80
```

## Using kubectl-ai and Kagent

The deployment can be enhanced with AI-powered tools:

### kubectl-ai Examples:
```bash
# Deploy the todo frontend with 2 replicas
kubectl-ai "deploy the todo frontend with 2 replicas"

# Scale the backend to handle more load
kubectl-ai "scale the backend to handle more load"

# Check why the pods are failing
kubectl-ai "check why the pods are failing"

# Get all resources in the todo namespace
kubectl-ai "get all resources in the todo namespace"
```

### Kagent Examples:
```bash
# Analyze the cluster health
kagent "analyze the cluster health"

# Optimize resource allocation
kagent "optimize resource allocation"

# Troubleshoot deployment issues
kagent "troubleshoot deployment issues"
```

## Using Gordon (Docker AI)

For intelligent Docker operations:

```bash
# Check Gordon's capabilities
docker ai "What can you do?"

# Build optimized images
docker ai "build an optimized image for the todo backend"

# Analyze image vulnerabilities
docker ai "analyze vulnerabilities in todo-frontend:latest"
```

## Customizing Values

The Helm chart supports customization through values.yaml:

```yaml
backend:
  replicaCount: 2
  image:
    repository: my-registry/todo-backend
    tag: v1.0.0
  service:
    type: ClusterIP
    port: 5000
  resources:
    limits:
      cpu: 200m
      memory: 256Mi
    requests:
      cpu: 100m
      memory: 128Mi

frontend:
  replicaCount: 2
  image:
    repository: my-registry/todo-frontend
    tag: v1.0.0
  service:
    type: LoadBalancer
    port: 80
  resources:
    limits:
      cpu: 200m
      memory: 256Mi
    requests:
      cpu: 100m
      memory: 128Mi
```

## Troubleshooting

### Common Issues and Solutions:

1. **Pods stuck in Pending state**
   ```bash
   kubectl describe pods
   # Check if there are enough resources or node selectors are correct
   ```

2. **Service not accessible**
   ```bash
   kubectl get svc
   kubectl describe svc todo-frontend-service
   # Check if the service type is correct for your environment
   ```

3. **Image pull errors**
   ```bash
   kubectl describe pods
   # Ensure images are pushed to the correct registry and tags are correct
   ```

4. **Application not responding**
   ```bash
   kubectl logs deployment/todo-backend
   kubectl logs deployment/todo-frontend
   ```

### Useful Commands:
```bash
# Check all resources
kubectl get all -n <namespace>

# View logs
kubectl logs -f deployment/todo-backend

# Exec into a pod
kubectl exec -it deployment/todo-backend -- sh

# Port forward for debugging
kubectl port-forward deployment/todo-backend 5000:5000

# Check events
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Cleanup

To remove the deployment:
```bash
helm uninstall todo-chatbot
```

## Development Workflow

For development, you can use the Agentic Dev Stack workflow:
1. Write spec
2. Generate plan
3. Break into tasks
4. Implement via Claude Code
5. Review the process, prompts, and iterations

This approach ensures consistent, well-documented deployments that leverage AI tools for enhanced productivity.