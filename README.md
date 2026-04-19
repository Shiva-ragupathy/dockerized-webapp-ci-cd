# 🚀 DevOps CI/CD Pipeline Project – Dockerized Application Deployment on AWS EC2

## 📌 Project Overview

This project demonstrates a complete end-to-end **DevOps CI/CD pipeline** for automating application build, containerization, deployment, and monitoring using modern DevOps tools and cloud infrastructure.

The system ensures:
- Automated build and deployment pipeline
- Containerized application using Docker
- Cloud deployment on AWS EC2
- Image management using Docker Hub
- Continuous Integration using Jenkins
- Application monitoring using open-source tools

---

## 🏗️ System Architecture

```text
GitHub (Source Code Management)
        ↓
Jenkins (CI/CD Automation)
        ↓
Docker Image Build
        ↓
Docker Hub (Image Registry)
        ↓
AWS EC2 Instance (Deployment Server)
        ↓
Docker / Docker Compose (Runtime)
        ↓
Web Application (Port 80 - Public Access)
        ↓
Uptime Kuma (Monitoring System)
