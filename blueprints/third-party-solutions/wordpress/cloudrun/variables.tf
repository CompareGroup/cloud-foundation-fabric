/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# Documentation: https://cloud.google.com/run/docs/securing/managing-access#making_a_service_public
variable "cloud_run_invoker" {
  type        = string
  description = "IAM member authorized to access the end-point (for example, 'user:YOUR_IAM_USER' for only you or 'allUsers' for everyone)"
  default     = "allUsers"
}

variable "connector_cidr" {
  type        = string
  description = "CIDR block for the VPC serverless connector (10.8.0.0/28 by default)"
  default     = "10.8.0.0/28"
}

variable "prefix" {
  description = "Unique prefix used for resource names. Not used for project if 'project_create' is null."
  type        = string
  default     = ""
}

variable "principals" {
  description = "List of emails of people/service accounts to give rights to, eg 'user@domain.com'."
  type        = list(string)
  default     = []
}

variable "project_create" {
  description = "Provide values if project creation is needed, uses existing project if null. Parent is in 'folders/nnn' or 'organizations/nnn' format."
  type = object({
    billing_account_id = string
    parent             = string
  })
  default = null
}

variable "project_id" {
  description = "Project id, references existing project if `project_create` is null."
  type        = string
}

# Documentation: https://cloud.google.com/vpc/docs/configure-private-services-access#allocating-range
variable "psa_cidr" {
  type        = string
  description = "CIDR block for Private Service Access for CloudSQL (10.60.0.0/24 by default)"
  default     = "10.60.0.0/24"
}

variable "region" {
  type        = string
  description = "Region for the created resources"
  default     = "europe-west4"
}

variable "sql_vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC for the CloudSQL (10.0.0.0/20 by default)"
  default     = "10.0.0.0/20"
}

variable "wordpress_image" {
  type        = string
  description = "Image to run with Cloud Run, starts with \"gcr.io\""
}

variable "wordpress_port" {
  type        = number
  description = "Port for the Wordpress image (8080 by default)"
  default     = 8080
}