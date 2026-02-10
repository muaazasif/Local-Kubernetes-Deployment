# Todo Chatbot - Cloud Native Application

A sophisticated cloud-native todo application with AI-powered chatbot functionality, designed for deployment on Kubernetes clusters.

## 🌟 Features

- **Modern UI/UX**: Beautiful, responsive interface with animations and smooth interactions
- **AI-Powered Chatbot**: Intelligent assistant to help manage your tasks
- **Real-time Updates**: Instant feedback on task operations
- **Cloud-Native**: Designed for containerized deployment
- **Kubernetes Ready**: Includes Helm charts for easy deployment
- **Scalable Architecture**: Microservices-based design

## 🚀 Live Demo

Check out the live demo: [Todo Chatbot on Railway](https://todo-chatbot-production.up.railway.app)

## 🛠️ Tech Stack

### Frontend
- HTML5, CSS3, JavaScript (ES6+)
- Responsive design with Flexbox/Grid
- Smooth animations and transitions
- Font Awesome icons

### Backend
- Node.js
- Express.js
- RESTful API design

### Deployment
- Docker containerization
- Kubernetes orchestration
- Helm charts for deployment
- CI/CD ready

## 📋 Project Structure

```
todo-chatbot/
├── backend/                 # Backend API server
│   ├── server.js           # Main server file
│   ├── package.json        # Dependencies
│   └── Dockerfile          # Container definition
├── frontend/               # Frontend application
│   └── index.html          # Single page application
├── k8s/                    # Kubernetes manifests
│   ├── backend.yaml        # Backend deployment/service
│   └── frontend.yaml       # Frontend deployment/service
├── helm/                   # Helm charts
│   └── todo-chatbot/       # Helm chart directory
│       ├── Chart.yaml      # Chart metadata
│       ├── values.yaml     # Default values
│       └── templates/      # Kubernetes templates
├── docker-compose.yml      # Multi-container setup
└── DEPLOYMENT_GUIDE.md     # Deployment documentation
```

## 🚀 Quick Start

### Prerequisites
- Docker
- Kubernetes cluster (Minikube, Kind, or cloud-based)
- Helm 3.x

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/muaazasif/Local-Kubernetes-Deployment.git
cd Local-Kubernetes-Deployment
```

2. **Run with Docker Compose**
```bash
docker-compose up --build
```

3. **Access the application**
- Frontend: http://localhost:80
- Backend API: http://localhost:5000

### Kubernetes Deployment

1. **Build and push Docker images**
```bash
# Build images
docker build -t your-registry/todo-backend:latest ./backend
docker build -t your-registry/todo-frontend:latest ./frontend

# Push images
docker push your-registry/todo-backend:latest
docker push your-registry/todo-frontend:latest
```

2. **Deploy with Helm**
```bash
cd helm/todo-chatbot

# Install the chart
helm install todo-chatbot . \
  --set backend.image.repository=your-registry/todo-backend \
  --set backend.image.tag=latest \
  --set frontend.image.repository=your-registry/todo-frontend \
  --set frontend.image.tag=latest
```

3. **Access the application**
```bash
# Get the frontend service external IP
kubectl get svc todo-frontend-service

# Or use port forwarding for testing
kubectl port-forward svc/todo-frontend-service 8080:80
```

## 🔧 Configuration

### Helm Values

The Helm chart supports the following customizable parameters:

#### Backend Configuration
```yaml
backend:
  replicaCount: 1
  image:
    repository: todo-backend
    tag: latest
    pullPolicy: IfNotPresent
  service:
    type: ClusterIP
    port: 5000
  resources:
    limits:
      cpu: 100m
      memory: 128Mi
    requests:
      cpu: 50m
      memory: 64Mi
```

#### Frontend Configuration
```yaml
frontend:
  replicaCount: 1
  image:
    repository: todo-frontend
    tag: latest
    pullPolicy: IfNotPresent
  service:
    type: LoadBalancer
    port: 80
  resources:
    limits:
      cpu: 100m
      memory: 128Mi
    requests:
      cpu: 50m
      memory: 64Mi
```

## 🤖 AI Tool Integration

This project is designed to work with AI-powered DevOps tools:

### kubectl-ai Examples
```bash
# Deploy with specific configuration
kubectl-ai "deploy the todo frontend with 2 replicas"

# Scale backend for increased load
kubectl-ai "scale the backend to handle more load"

# Troubleshoot failing pods
kubectl-ai "check why the pods are failing"
```

### Kagent Examples
```bash
# Analyze cluster health
kagent "analyze the cluster health"

# Optimize resource allocation
kagent "optimize resource allocation"
```

### Gordon (Docker AI) Examples
```bash
# Build optimized images
docker ai "build an optimized image for the todo backend"

# Analyze image vulnerabilities
docker ai "analyze vulnerabilities in todo-frontend:latest"
```

## 🚢 CI/CD Pipeline

The application is designed for continuous integration and deployment:

1. **Code Commit**: Push changes to the repository
2. **Build**: Automated Docker image builds
3. **Test**: Automated testing pipeline
4. **Deploy**: Deploy to staging/production environments
5. **Monitor**: Health checks and monitoring

## 📊 Monitoring & Observability

- **Health Checks**: Liveness and readiness probes
- **Resource Limits**: CPU and memory constraints
- **Logging**: Structured logging in applications
- **Metrics**: Prometheus-compatible endpoints

## 🔐 Security

- **Container Security**: Minimal base images, non-root users
- **Network Policies**: Restrict inter-pod communication
- **RBAC**: Role-based access control for Kubernetes
- **Secrets Management**: Secure handling of sensitive data

## 📈 Scaling

The application is designed to scale horizontally:

- **Auto-scaling**: HPA configured for both frontend and backend
- **Load Balancing**: Kubernetes service handles traffic distribution
- **Database Ready**: Easy integration with persistent storage

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

If you encounter any issues or have questions, please open an issue in the GitHub repository.

---

<div align="center">

**Made with ❤️ using modern web technologies**

[![GitHub stars](https://img.shields.io/github/stars/muaazasif/Local-Kubernetes-Deployment?style=social)](https://github.com/muaazasif/Local-Kubernetes-Deployment/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/muaazasif/Local-Kubernetes-Deployment?style=social)](https://github.com/muaazasif/Local-Kubernetes-Deployment/network/members)
[![GitHub issues](https://img.shields.io/github/issues/muaazasif/Local-Kubernetes-Deployment.svg)](https://github.com/muaazasif/Local-Kubernetes-Deployment/issues)

</div>