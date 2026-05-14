# ☸️ Kubernetes Journey: From Imperative to Declarative Architecture

This project documents my evolution from manual container management to architecting a resilient, scalable, and persistent cluster using **Minikube** on **Debian Trixie**.

---

## 🧠 Core Concepts: The Pillars of Kubernetes

### 1. Desired vs. Actual State (Self-Healing)
The **Control Loop** is the heart of K8s. By defining a **Desired State** (e.g., 3 replicas), Kubernetes constantly monitors the **Actual State**. If a Pod fails, the system automatically provisions a replacement to maintain resilience.

### 2. Imperative vs. Declarative (YAML)
* **Imperative**: Giving direct commands (`kubectl create`). Great for quick tests.
* **Declarative**: Writing "recipes" in **YAML** files (`kubectl apply`). This is **Infrastructure as Code (IaC)**, allowing for version control and professional automation.

---

## 🛠️ Step-by-Step Implementation

### Phase 1: Cluster & Orchestration
1.  **Initialization**:
    ```bash
    minikube start
    minikube dashboard
    ```
2.  **Scaling & Exposing**: Initially performed via CLI to understand high availability and the networking tunnel required for the Linux/Docker driver:
    ```bash
    minikube service hello-kubernetes
    ```

### Phase 2: Advanced Declarative Architecture (The 1-Hour Sprint)
In this phase, I transitioned to using YAML manifests to define the complete system state.

#### 📝 1. Scalable Deployment (The "Walls")
Defined a deployment with 3 replicas using a declarative manifest. This ensures that the infrastructure is documented and reproducible.
```bash
kubectl apply -f first-deployment.yaml
```

#### 🎒 2. ConfigMaps (The "Instructions")

Separated environment configuration from the application code. This allows changing app behavior (like messages or shop names) without rebuilding the container image.

```bash
kubectl apply -f config-practice.yaml
```

#### 💾 3. Persistent Volume Claims (The "Vault")

Implemented data persistence. Unlike standard Pods that lose data upon restart, using **PVCs** ensures that important information survives even if the Pod is destroyed or rescheduled.

```bash
kubectl apply -f storage-practice.yaml
```

## 📈 Key Takeaways

-   **IaC Mastery**: Transitioned from one-off commands to reusable YAML manifests.
    
-   **Data Survival**: Understood how to "attach" external storage to ephemeral containers.
    
-   **Security & Decoupling**: Learned to manage configuration outside the application layer using ConfigMaps.


```
# 🏗️ Infraestructura como Código (IaC) con Terraform

Este módulo forma parte de mi entrenamiento intensivo de 14 días ("El Triángulo de Hierro") para dominar el stack DevOps. Aquí gestiono el aprovisionamiento de recursos de forma declarativa utilizando el proveedor de Docker.

## 🎯 Objetivos del Proyecto
* **Aprovisionamiento Inmutable:** Garantizar que el entorno sea idéntico en cada despliegue.
* **Gestión de Estado:** Controlar el ciclo de vida de los recursos mediante el archivo `terraform.tfstate`.
* **Paridad de Entornos:** Eliminar el problema de "en mi máquina funciona".

## 🛠️ Tecnologías Utilizadas
* **Terraform v1.15.3**: Orquestador de infraestructura.
* **Docker Provider**: Para la gestión de contenedores e imágenes.
* **Debian Trixie**: Sistema operativo base para el desarrollo.

## 🚀 Flujo de Trabajo
Para desplegar esta infraestructura, sigue estos pasos en orden:

1. **Inicialización**: Descarga los plugins necesarios.
   ```bash
   terraform init
   

```

2.  **Planificación**: Previsualiza los cambios antes de aplicarlos.
    
    Bash
    
    ```
    terraform plan
    
    
    ```
    

```
3. **Aplicación**: Crea los recursos en el sistema.
   ```bash
   terraform apply
   

```

## 📂 Estructura de Archivos

-   `main.tf`: Definición de recursos (Imágenes, Contenedores, Redes).
    
-   `terraform.tfstate`: (Excluido de Git) Contiene la "verdad" de la infraestructura actual.
---
"The journey continues. Automation is the key in this journey" _Documentation updated: May 14, 2026_