# ArgoCD Manifests 🚀

This folder contains the highly optimized Kubernetes manifests to deploy **ArgoCD (GitOps)** on a cluster. It utilizes **Kustomize** to enforce resource quotas and abstract hardcoded configuration configurations.

---

## 🛠️ Design & Port Mapping

To save laptop memory and CPU, this manifest uses the **single-server lightweight architecture** (`argocd-server`) instead of booting up the entire high-availability operator stack.

* **Target Namespace:** `devops-tools`
* **Service Type:** `NodePort`
* **Cluster Internal Port:** `8080`
* **Cluster NodePort:** `30080` (Mapped to Laptop HostPort **`8080`** via KinD configuration)

---

## ⚡ Deployment Instructions

Run the declarative Kustomize deployment command from the root directory of the repository:

```bash
# Ensure the namespace exists
kubectl create ns devops-tools

# Deploy ArgoCD components
kubectl apply -k argocd/

```

### Verify Deployment Status

Track the rollout progress until the pod enters the `Running` state:

```bash
kubectl get pods -n devops-tools -l tool=gitops -w

```

---

## 🔑 Accessing ArgoCD & Credentials

Once the pod status is **Running**, open your preferred web browser and navigate to:
👉 **`http://localhost:8080`**

### 1. Username

* Default username: `admin`

### 2. Retrieve Initial Password

ArgoCD generates a secure randomized token at boot time stored inside a Kubernetes Secret. Run the following command in your terminal to extract and decode it:

```bash
kubectl -n devops-tools get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo

```

> 💡 **DevOps Best Practice:** It is highly recommended to navigate to user profile settings right after your first login and update the password to a permanent one.

---

## ➕ Connecting Applications (GitOps Engine)

Once logged into the ArgoCD UI, you can connect your repository to deploy apps.