# Lab: Getting Started with NetOpsKube
This guide will walk you through setting up a local networking lab environment using NetOpsKube (NOK).
Prerequisites
Before starting, ensure you have your development environment ready:

* GitHub Codespaces (Recommended) OR a Local Dev Container environment.
* Docker/Podman installed (if running locally).

------------------------------
## Step 1: Clone the Repository
Once your devcontainer is up and running, open a terminal and clone the NetOpsKube project:

```bash
git clone https://github.com/CSPDevLabs/NetOpsKube
cd NetOpsKube
```

## Step 2: Launch the BNG Lab
Execute the following command to bootstrap the Broadband Network Gateway (BNG) environment:

```bash
make try-nok-bng
```

## Step 3: Understanding the Infrastructure
Running the command above automates the deployment of a KinD (Kubernetes in Docker) cluster.
What is KinD?

* KinD is a tool for running local Kubernetes clusters using Docker container "nodes."
* It is primarily designed for testing Kubernetes itself or developing cloud-native applications locally without the overhead of a full virtual machine or cloud provider.
* In this lab, KinD acts as the platform for our observability and configuration management apps like gnmic, prometheus, grafana, sdcio and others.

You can open an addtional terminal in VSCode and execute:

```bash
kubectl get nodes
```

You should be able to see one node cluster.
Also, try using `kubectl get pods -n kube-system` to see the status of kubernetes pods that sustain cluster functions.

## Step 4: Installed Tools
The following toolchain is automatically managed and installed to support the lab:

* GH (GitHub CLI): Used for interacting with GitHub repositories and workflows from the command line.
* HELM: The package manager for Kubernetes; used to deploy and manage NOK applications.
* KIND: The engine that creates your local Kubernetes cluster.
* KPT: A tool for managing Kubernetes native configurations as packages.
* KUBECTL: The standard CLI for running commands against Kubernetes clusters.
* K9S: A terminal UI that provides a high-level view of your cluster activities.
* YQ: A portable command-line YAML processor (like jq but for YAML).
* CLAB (Containerlab): Orchestrates container-based networking labs, allowing you to spin up NOS (Network Operating System) nodes.
* FLUX: A set of continuous and progressive delivery solutions for Kubernetes (GitOps).

------------------------------
# Step 5: Verification & Infrastructure Components
To see the base applications that control the deployment of multiple network domains, run:

```bash
kubectl get pods -n nok-base
```

If you are managing more than one domain, these core components act as the central control plane:

| Component | Description |
|---|---|
| nok-controller | An operator that simplifies the creation of network device targets as CRDs. It allows you to define profiles and easily enable/disable sdcio and gnmic features. |
| config-server | Used by sdcio for centralized network configuration management. |
| gnmic-controller | The recently launched gNMI operator that manages telemetry and configuration collectors. |
| cert-manager | Automates certificate management for secure communication between components. |
| ingress-nginx | Manages external access to the services within the cluster. |
| prometheus/grafana | Provides the observability stack for monitoring network performance and logs. |





