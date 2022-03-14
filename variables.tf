variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "project_id" {
  type    = string
  default = "devops-340708"
}

variable "network" {
  type    = string
  default = "default"
}
variable "subnetwork" {
  type    = string
  default = "default"
}

variable "cluster_name" {
  type    = string
  default = "my-cluster"
}

variable "k8s_version" {
  type    = string
  default = "1.21.5-gke.1302"
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 2
}

variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}

variable "preemptible" {
  type    = bool
  default = true
}
