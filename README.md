# Intro and Requirements

This repository contains the material of the "NetOps Stack for Core/Aggregation Operators of Any Size" workshop held at [Nanog97 — June 1-3, 2026](https://nanog.org/events/nanog-97/).

## Using codespaces -- during/post event
Use  [codespaces](https://github.com/codespaces/new/) to create your environment.
this will open a VS Code app in your browser.

Note: This will utilize your personal GitHub Codespaces credits.

### Using VS Code in your computer
Make sure to install [VS Code](https://code.visualstudio.com/download)
Install the following extensions:
- [Remote SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

# Workshop Overview

**Proctor(s):** Mau Rojas
**Level:** Intermediate (some knowledge needed)

## Title: NetOps Stack for Core/Aggregation Operators of Any Size

This workshop introduces network operators to a comprehensive open-source approach for streamlining network operations, focusing on observability, configuration management, and automation. Participants will learn how to establish a foundational lab environment using Containerlab, integrate leading open-source tools like Grafana and Prometheus for advanced telemetry, and leverage Kubernetes for robust, scalable, and resilient deployments. We will explore GitOps principles with Flux, delve into defining network elements, using a Broadband Network Gateway (BNG) as a practical use case, managing telemetry subscriptions, and implementing intent-based configuration management with SDCIO, including handling deviation events and schema imports. The session will highlight how a Kubernetes-centric architecture enhances operational efficiency, simplifies resource management, and provides a unified platform for alarms, monitoring, and configuration.
 
High level Agenda:
* Foundation & Lab Setup (20 min): Introduction to unified NetOps and Containerlab environment.
* Advanced Observability (40 min): gnmic, Prometheus, Grafana for network telemetry and monitoring.
* GitOps & Configuration (40 min): Flux, SDCIO for intent-based config and deviation management (e.g., BNGs).
* Kubernetes Benefits & Q&A (20 min): Resilience, scalability, and open discussion.

This [**FAQ**](https://github.com/CSPDevLabs/nanog97-nok/blob/main/FAQ.md) will help you get ready for the hands-on labs using either **GitHub Codespaces** or **local VS Code and Docker**. It covers tool installation, environment setup, and common scenarios for both **Mac** and **Windows** users.