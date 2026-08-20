# Quick Guide: Argo CD Setup

Install and access Argo CD on Kubernetes for GitOps deployments.

---

## 1. Install Argo CD

```bash
# Create namespace
kubectl create namespace argocd

# Apply official installation manifest
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

## 2. Access the Argo CD Web UI

Port-forward the server service to your local machine:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

- **URL:** `https://localhost:8080`
- **Username:** `admin`
- **Password:** Retrieve the default initial password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

---

## 3. Verify Pods Status

```bash
kubectl get pods -n argocd
```
