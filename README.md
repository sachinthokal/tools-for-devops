# Tools-For-Devops 🛠️

> A centralized collection of lightweight installation guides and automation scripts to quickly deploy essential DevOps tools and observability components onto any Kubernetes cluster.

---

## 📂 Repository Structure

```text
tools-for-devops/
├── .github/
├── .gitignore
├── README.md                 # Main project overview & index
├── tools-for-devops.sh       # Unified CLI / automation setup script
├── argocd/argocd-setup.md           # Argo CD installation & access guide
├── k8s-metrics/k8s-metrics-setup.md      # Kubernetes Metrics Server setup guide
└── sonarqube/sonarqube-setup.md        # SonarQube deployment guide

```

---

## ⚡ Quick Start

Run the centralized automation script to select and install tools directly into your cluster:

```bash
# Make the script executable
chmod +x tools-for-devops.sh

# Run the setup script
./tools-for-devops.sh

```

For manual step-by-step instructions, open the respective setup guide:

* **Argo CD:** `argocd-setup.md`
* **Kubernetes Metrics:** `k8s-metrics-setup.md`
* **SonarQube:** `sonarqube-setup.md`

---

## 🤝 Contributing

Contributions to add new DevOps tool guides or improve the automation scripts are always welcome.

1. **Fork** this repository.
2. Create a new branch: `git checkout -b feature/add-<tool-name>`
3. Add your setup guide (`<tool>-setup.md`) or update `tools-for-devops.sh`.
4. Commit your changes: `git commit -m "feat: add <tool-name> guide"`
5. Push to your fork: `git push origin feature/add-<tool-name>`
6. Open a **Pull Request (PR)**.

---
