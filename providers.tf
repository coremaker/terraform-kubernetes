terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.0.2"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.0.2"
    }
  }
}

provider "kubernetes" {
  host = var.gke_endpoint
  token = var.gke_token
  cluster_ca_certificate = var.gke_certificate
}

provider "helm" {
  kubernetes {
    host = var.gke_endpoint
    token = var.gke_token
    cluster_ca_certificate = var.gke_certificate
  }
}