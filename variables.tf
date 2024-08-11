variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "ami" {
  type        = string
  default     = "ami-039470c0765f439c4"
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.small"
  description = "Instance Type"
}

variable "key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to the public key"
}
