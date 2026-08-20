# SonarQube on Kubernetes (Official Installation)

Deploy and configure SonarQube using the official SonarSource Helm chart.

---

## Prerequisites

- Kubernetes 1.24+ cluster
- Helm 3.x installed
- Minimum cluster capacity: 2 vCPU and 4 GB RAM

---

## 1. Add Official Helm Repository

```bash
helm repo add sonarsource https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
```

---

## 2. Install SonarQube

```bash
# Create namespace and install SonarQube Community edition
helm install sonarqube sonarsource/sonarqube   --create-namespace   --namespace sonarqube
```

---

## 3. Verify Deployment

Wait for the pod status to show `Running`:

```bash
kubectl get pods -n sonarqube -w
```

---

## 4. Access the Web Dashboard

Forward the port to your local machine:

```bash
kubectl port-forward -n sonarqube svc/sonarqube-sonarqube 9000:9000
```

- **URL:** [http://localhost:9000](http://localhost:9000)
- **Default Username:** `admin`
- **Default Password:** `admin` *(required to update upon first login)*

---

## 5. Uninstall (Optional)

```bash
helm uninstall sonarqube -n sonarqube
kubectl delete namespace sonarqube
```
