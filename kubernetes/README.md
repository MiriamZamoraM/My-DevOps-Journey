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

### 🚀 Level Up: De la Práctica al Diseño Arquitectónico

> "Cualquiera puede ejecutar un comando, pero no cualquiera puede diseñar la orquesta."

En esta etapa, dejé de ser una espectadora para convertirme en la arquitecta de mi propio clúster. Tras una inmersión profunda de 3 horas en la sintaxis de Kubernetes, logré:

-   **Dominio del YAML:** Pasé de la confusión de las sangrías a estructurar manifiestos complejos con precisión quirúrgica.
    
-   **Pensamiento Jerárquico:** Entendí la lógica de las "Matrioshkas" (muñecas rusas) dentro de Kubernetes: `Deployment` > `Template` > `Spec` > `Containers`.
    
-   **Control de Flotas:** Desplegué simultáneamente 3 arquitecturas diferentes (**Blog**, **Pagos con Alta Disponibilidad** y **Side-car multi-contenedor**) con un total de 9 Pods perfectamente sincronizados.
    
-   **Resolución de Conflictos:** Aprendí a interpretar y corregir errores de _Strict Decoding_ y _Bad Requests_, entendiendo el "porqué" detrás de cada falla estructural.
    

**Estado actual:** Dashboard en verde. Lógica procesada. El "paraíso" de la terminal ahora tiene un mapa claro. 🥂🐧☸️🚀


---
---
> "From running containers to architecting systems. The journey continues." _Documentation updated: May 11, 2026_