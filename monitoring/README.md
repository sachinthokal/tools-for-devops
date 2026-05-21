# Cluster Monitoring Stack (Prometheus & Grafana) 📊

This folder contains the complete, lightweight, and laptop-friendly observability stack containing **Prometheus** (Metrics Collector) and **Grafana** (Visualization Dashboard). The entire stack is managed declaratively via **Kustomize**.

---

## 🏗️ Architecture & Component Details

To ensure your laptop does not suffer from high RAM usage or **Disk Pressure**, the stack components are heavily optimized with strict guardrails:

1. **Prometheus:** Configured with a `--storage.tsdb.retention.time=6h` flag. It keeps only the last 6 hours of metrics in an ephemeral `emptyDir` volume, ensuring zero permanent disk hogging.
2. **Grafana:** Lightweight UI setup mapped to the host machine for real-time visualization.

### 🛠️ Port & Service Mapping

| Component | K8s Service Type | Internal Port | NodePort / Access | Target Host URL |
| :--- | :--- | :--- | :--- | :--- |
| **Grafana** | `NodePort` | `3000` | `30081` | `http://localhost:8081` |
| **Prometheus** | `ClusterIP` | `9090` | Internal Only | `http://prometheus-service:9090` |

---

## ⚡ Deployment Instructions

Run the declarative Kustomize instruction from the repository's root directory:

```bash
# 1. Ensure the namespace exists
kubectl create ns devops-tools

# 2. Deploy Prometheus ConfigMap, Deployments, and Services in one go
kubectl apply -k monitoring/

```

### Verify Deployment Status

Track the rollout progress until both Prometheus and Grafana pods enter the `Running` state:

```bash
kubectl get pods -n devops-tools -l tool=monitoring -w

```

---

## 🔑 Accessing Grafana & Initial Setup

Once the pods are **Running**, follow these steps to connect your metrics engine:

### Step 1: Login to Grafana

* **URL:** 👉 `http://localhost:8081`
* **Default Credentials:** `admin` / `admin` *(You will be prompted to change the password on your first login)*

### Step 2: Connect Prometheus Data Source

Because Prometheus is running inside the same Kubernetes namespace, Grafana can resolve it securely via CoreDNS using its internal service name.

1. Inside the Grafana sidebar, navigate to **Connections -> Data Sources**.
2. Click on **Add Data Source** and select **Prometheus**.
3. Under the **Connection** settings, enter the following internal URL:

```text
http://prometheus-service:9090
```

1. Scroll to the bottom of the page and click **Save & Test**.
2. You should see a green success banner: `"Data source is working"`. 🎉

---

## 🛑 Resource Quotas & Guardrails (Laptop Safety)

The following resources are enforced inside `deployment.yaml` to protect your laptop's performance:

* **Grafana Limits:** Max `512Mi` Memory, `500m` CPU.
* **Prometheus Limits:** Max `512Mi` Memory, `500m` CPU.
* **Storage Guardrail:** Data retention capped strictly at **6 hours** inside standard temporary RAM storage.

---
