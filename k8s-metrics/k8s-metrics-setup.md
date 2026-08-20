# Quick Guide: Enable Metrics in Kubernetes

This guide shows how to deploy the Kubernetes Metrics Server to enable resource metrics (`kubectl top`, HPA).

---

## 1. Install Metrics Server

### Option A: Standard Manifest (kubectl)
```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

### Option B: Helm Chart
```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
helm install metrics-server metrics-server/metrics-server -n kube-system
```

---

## 2. Insecure TLS Configuration (For Minikube / Kind / kubeadm)

If your kubelet uses self-signed certificates, edit the deployment:

```bash
kubectl patch deployment metrics-server -n kube-system --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'
```

---

## 3. Verify Metrics

Wait ~30 seconds for initial metric scraping, then run:

```bash
# View node resource utilization (CPU / Memory)
kubectl top nodes

# View pod resource utilization
kubectl top pods -A
```

---

## Quick Reference: Local Clusters

- **Minikube:** `minikube addons enable metrics-server`
- **MicroK8s:** `microk8s enable metrics-server`
- **K3s:** Enabled by default.
