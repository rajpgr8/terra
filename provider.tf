#Terraform relies on plugins called "providers" to interact with remote systems. 
#Additionally, some providers require configuration (like endpoint URLs or cloud regions) before they can be used. 
#For example: kubernetes, kubectl and helm

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.33"
    }
    
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.8.0"
    }
    
    kubectl = {
      source  = "hashicorp/kubectl"
      version = ">= 1.14.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
    
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3"
    }
    
  }
}

provider "kubernetes" {
  alias                  = "internal"
  host                   = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
  token                  = data.google_client_config.internal.token
}

provider "kubectl" {
  alias                  = "internal"
  host                   = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
  token                  = data.google_client_config.internal.token
  load_config_file       = false
}
  
 provider "helm" {
  alias                  = "internal"
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
    token                  = data.google_client_config.myk8s.token
  }
}

