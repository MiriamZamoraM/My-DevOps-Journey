# ☸️ Kubernetes Practice: Orchestration 

This project documents the transition from managing individual containers to orchestrating a resilient cluster. Using **Minikube** on **Debian Trixie**, I implemented a scalable environment to observe Kubernetes' core automation capabilities.


---


## 🧠 Core Concept: Desired vs. Actual State

The main objective of this practice was to witness the **Control Loop** in action:

*  **Desired State**: The configuration I requested (3 active replicas).

*  **Actual State**: The real-time status of the cluster on my system.

*  **The Result**: When a Pod was manually deleted, Kubernetes detected the mismatch and automatically provisioned a replacement to reconcile both states. This is known as **Self-healing**.



---



## 🛠️ Step-by-Step Implementation



### 1. Cluster Initialization

First, I started the local cluster and enabled the visual management interface:

```bash

minikube  start

minikube  dashboard

```

### 2. Creating the Deployment
I deployed a standard Nginx web server as the primary workload:
```bash

kubectl create deployment hello-kubernetes --image=nginx

```

### 3. Scaling for High Availability

To ensure the application can handle more traffic and remain resilient, I scaled the deployment to 3 replicas:

```bash

kubectl scale deployment hello-kubernetes --replicas=3

```

### 4. Exposing the Application

Since Kubernetes pods are isolated, I created a **Service** to allow external access:


```bash

kubectl expose deployment hello-kubernetes --type=LoadBalancer --port=80

```

### 5. Accessing the Service (Linux/Docker Driver)

On my  laptop using the Docker driver, the cluster IP is not directly reachable. I had to establish a tunnel to bridge the traffic:

```bash

minikube service hello-kubernetes

```