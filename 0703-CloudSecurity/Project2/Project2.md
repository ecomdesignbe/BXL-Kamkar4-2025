
## Objective
Deploying and Securing a Scalable Application on Azure Kubernetes Service (AKS)

```
Note : Moniter your credit during the operations and do not exceed free tier
```

## References
- https://youtu.be/RUoejLILgyA?si=UFgdGywJ5WZ16FZ4
- https://youtu.be/YlR9AkDJMMA?si=GAyOGImSmjnLex1E
- https://www.youtube.com/live/JD3mj5bTOuk?si=IQtvF1IhcUvqy5Ec
- https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-portal?tabs=azure-cli


## Tasks

1. Deploy an AKS cluster. Connect with kubectl. Verify cluster to check if the cluster is accessible.
2. Choose an app (e.g., a 3-tier app with frontend, backend API, and database). You can use Microsoft’s sample https://github.com/Azure-Samples/aks-store-demo Build and push Docker images to Azure Container Registry (ACR).
3. Connect ACR to AKS. Deploy the app using Kubernetes manifests. Check if the application is running in the cluster and is reachable via kubectl port-forward.
4. Create a Kubernetes service of type LoadBalancer. Verify external IP and access via browser. Enable Horizontal Pod Autoscaler (HPA).
5. Create Kubernetes namespaces e.g. dev, prod. Configure RBAC roles for limited access. Enable Network Policies to restrict inter-pod communication. Use Azure AD integration for user authentication.
6. Add observability using Azure Monitor and Container Insights. Deploy Prometheus https://prometheus.io/ for custom dashboarding with visible pod and node metrics.
