# 🚀 My DevOps Journey: From Infrastructure to Orchestration

This repository serves as a live, hands-on documentation of my technical evolution into cloud infrastructure, automation, and configuration management. It tracks my progress from mastering container fundamentals to architecting complex environments on my **local workstation**.

---

## 🛠️ Tech Stack & Environment

* **Operating System:** Debian Trixie (Testing)
* **Hardware:** Own Device / Local Workstation
* **Infrastructure as Code (IaC):** Terraform
* **Orchestration:** Kubernetes (Minikube)

---

## 📂 Project Roadmap & Structure

### 1. Docker Fundamentals 🐳
Practical exercises focusing on the absolute basics of containerization, networking, and data persistence.
* **Storage & Resilience:** Implemented Named Volumes for database workloads.
* **Networking:** Explored advanced bridge networks and internal communication container-to-container.

### 2. Infrastructure & Automation (IaC) 🏗️🔧
The middle ground where environments are created and configured programmatically without manual intervention.
* **Terraform Module:** Automating the provision of clean Linux states and containerized environments.
* **Ansible Module:** Managing configuration through Playbooks, utilizing idempotency and raw commands to bootstrap lightweight infrastructure.

### 3. Kubernetes Orchestration & IaC Convergence ☸️
Transitioning from single-host architectures to automated, resilient clusters, and unifying infrastructure creation.
* **Declarative States:** Moving from imperative CLI commands to structural manifests.
* **Terraform-K8s Integration:** Bypassing native YAML manifests by declaring Kubernetes resources (Namespaces, Deployments, and NodePort Services) using HashiCorp Configuration Language (HCL) to map strict structural dependencies (`metadata[0].name`).

---

## 🧠 Learning Strategy & Methodology
I maintain a disciplined daily study routine coupled with an **English-only immersion environment**, focusing on technical documentation literacy and professional fluency.

---

## 📈 Completed Milestones
- [x] Master Docker fundamentals and network isolation.
- [x] Configure Minikube environment on Debian Trixie.
- [x] Build declarative Kubernetes architectures.
- [x] Write reusable Terraform blueprints to provision local infrastructure.
- [x] Create and execute Ansible Playbooks for automated deployment.
- [x] **Deploy full Nginx stacks on Kubernetes using the Terraform Kubernetes Provider without manual YAML intervention.**

## 🎯 Next Steps & Upcoming Tools
- [ ] Orchestrate multi-tier applications integrating the whole stack.
- [ ] Explore CI/CD pipeline automation principles.

---

> "Eureka! The alchemy of learning never stops. Automation is the absolute key."  
_Documentation updated: July 6th 2026_