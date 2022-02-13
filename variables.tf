variable "cluster_name" {
  description = "Name of the cluster"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$", var.cluster_name))
    error_message = "Value of cluster_name should be lowercase and can only contain alphanumeric characters and hyphens(-)."
  }
}

variable "apiserver_alternative_names" {
  description = "subject alternative names for the API Server signing cert."
  default     = []
  type        = list(string)
}

variable "worker_os" {
  description = "OS to run on worker machines"

  # valid choices are:
  # * ubuntu
  # * centos
  default = "ubuntu"
  type    = string
}

variable "ssh_public_key_file" {
  description = "SSH public key file"
  default     = "~/.ssh/id_rsa.pub"
  type        = string
}

variable "ssh_port" {
  description = "SSH port to be used to provision instances"
  default     = 22
  type        = number
}

variable "ssh_username" {
  description = "SSH user, used only in output"
  default     = "tron"
  type        = string
}

variable "ssh_private_key_file" {
  description = "SSH private key file used to access instances"
  default     = ""
  type        = string
}

variable "ssh_agent_socket" {
  description = "SSH Agent socket, default to grab from $SSH_AUTH_SOCK"
  default     = "env:SSH_AUTH_SOCK"
  type        = string
}

# Provider specific settings

variable "location" {
  description = "Azure datacenter to use"
  default     = "centralus"
  type        = string
}

variable "control_plane_vm_size" {
  description = "VM Size for control plane machines"
  default     = "Standard_B2s"
  type        = string
}

variable "worker_vm_size" {
  description = "VM Size for worker machines"
  default     = "Standard_B2s"
  type        = string
}

variable "control_plane_vm_count" {
  description = "Number of control plane instances"
  default     = 2
  type        = number
}

variable "initial_machinedeployment_replicas" {
  description = "Number of replicas per MachineDeployment"
  default     = 1
  type        = number
}