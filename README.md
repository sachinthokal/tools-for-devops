# Tools_For_Devops 🛠️

>A centralized, production-ready repository containing Kubernetes manifests managed via **Kustomize** for core DevOps tools. Designed specifically for rapid local deployment on a **KinD (Kubernetes in Docker)** cluster with pre-configured node-port mappings.

---

## 🏗️ Project Architecture

This repository follows the **DRY (Don't Repeat Yourself)** principle using Kustomize layers.

Every tool resides in its own self-contained folder with a dedicated `kustomization.yaml` to manage namespaces, resources, and labels uniformly.

```text
Tools_For_Devops/
├── README.md                 # Project documentation
├── sonarqube/                # Code Quality Tool
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── argocd/                   # GitOps Deployment Tool
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
└── Grafana/               # Cluster Observability - Grafana
    ├── deployment.yaml
    ├── service.yaml
    └── kustomization.yaml
```

---

## ⚡ Deployment Guide

#### 1. Prepare Environment

Ensure the common namespace for all DevOps utilities exists on your cluster:

```bash
kubectl create ns devops-tools
```

1. Deploy Tools (Choose what you need)

```bash
# Install Tool
kubectl apply -k argocd/            # Example

# 3. Verify Pod Status - Monitor the rollout status in the centralized namespace:

kubectl get pods -n devops-tools
```

#### 🔑 Post-Deployment & Credentials

ArgoCD - URL: <http://localhost:8080>

Username: admin

Retrieve Initial Password:

```bash
kubectl -n devops-tools get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
```

---

## 🤝 Contributing to Open Source

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make to this repository are **greatly appreciated**.

If you want to add a new DevOps tool manifest or optimize an existing Kustomize configuration, follow these steps to submit a Pull Request (PR):

### 🛣️ Step-by-Step Contribution Workflow

#### 1. Fork the Project

Click the **Fork** button at the top-right corner of this repository page to create a copy of this repository under your GitHub account.

#### 2. Clone Your Fork

Clone your forked repository to your local machine:

```bash
git clone [https://github.com/YOUR_USERNAME/Tools_For_Devops.git](https://github.com/YOUR_USERNAME/Tools_For_Devops.git)
cd Tools_For_Devops

```

#### 3. Create a Feature Branch

Always create a fresh branch for your new tool or fix. Keep the name descriptive (e.g., `add-vault-manifest`):

```bash
git checkout -b feature/add-<tool-name>

```

#### 4. Commit Your Changes

Add your well-documented Kustomize manifests. Ensure your YAML code contains simple English comments and follows standard CPU/Memory resource constraints. Commit with a clear message:

```bash
git add .
git commit -m "feat: add highly optimized manifest for <tool-name>"

```

#### 5. Push to Your Fork

Push your local feature branch up to your GitHub repository fork:

```bash
git push origin feature/add-<tool-name>

```

#### 6. Open a Pull Request (PR)

* Go back to the original repository page on GitHub.
* You will see a banner saying *"Compare & pull request"*. Click on it.
* Describe your changes clearly (e.g., *"Added HashiCorp Vault manifest under port 30083 with custom resource quotas"*).
* Submit the PR! 🚀

### 📜 Rules for Manifest Contribution

* **No `latest` Tags:** Pinned stable or LTS image versions only.
* **Resource Limits:** Always define strict CPU and Memory `requests` and `limits` to keep clusters lightweight.
* **Kustomize Alignment:** Ensure your tool uses a valid `kustomization.yaml` wired into the standard `devops-tools` namespace.

---
