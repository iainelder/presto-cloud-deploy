variable "aws_region" {
  type = string
  default = "eu-west-1"
}

//variable "vpc_id" {
//  description = "VPC ID to create the Presto cluster in"
//  type        = string
//}

variable "subnet_id" {
  description = "The subnet to deploy Presto in"
  type        = string
  default = "subnet-31665779"
}

variable "clients_lb_subnets" {
  description = "A list of subnet IDs to attach to the clients LB"
  type        = list(string)
  default     = ["subnet-31665779", "subnet-31665779", "subnet-31665779"]
}

variable "key_name" {
  default = "presto"
}

variable "volume_encryption" {
  type    = bool
  default = true
}

variable "environment_name" {
  description = "The name of the Presto cluster (aka environment)."
  type        = string
  default = "heypresto"
}

variable "http_port" {
  description = "Port on which to expose the Presto UI."
  type        = string
  default     = "8080"
}

variable "query_max_memory" {
  description = "Total cluster memory a single query may consume. This property may be used to ensure that single query cannot use all resources in cluster. The value should be set to be higher than what typical expected query in system will need."
  type        = number
  default     = 500
}

variable "count_clients" {
  description = "Number of nodes with Apache Superset and Redash installed."
  type        = string
  default     = 1
}

variable "clients_use_spot" {
  description = "Whether to use spot instances for client nodes"
  type        = string
  default     = "false"
}

variable "client_spot_hourly_price" {
  type    = string
  default = "0.30"
}

variable "count_workers" {
  description = "Number of workers to launch."
  type        = string
  default     = 0
}

variable "count_workers_spot" {
  description = "Number of workers on spot instances to launch."
  type        = string
  default     = 0
}

variable "worker_spot_hourly_price" {
  type    = string
  default = "0.30"
}

variable "coordinator_instance_type" {
  default = "r5.xlarge"
}

variable "worker_instance_type" {
  default = "r5.4xlarge"
}

variable "client_instance_type" {
  default = "t2.large"
}

variable "coordinator_heap_size" {
  # needs to be ~80% of available machine memory
  type    = string
  default = 25
}


variable "worker_heap_size" {
  description = "JVM heap size for workers. Recommended to set to 70% of instance memory"
  type        = string
  default     = 102 # 80% of available memory
}

variable "extra_worker_configs" {
  type = string
  default = <<EOF
task.max-partial-aggregation-memory=64MB
node-scheduler.max-splits-per-node=1000
EOF
}

variable "public_facing" {
  default = "true"
}

variable "s3_buckets" {
  type = list(string)
  default = [
    "arn:aws:s3:::athena-examples",
    "arn:aws:s3:::athena-examples/*",
  ]
}

variable "aws_access_key_id" {
  type    = string
  default = ""
}

variable "aws_secret_access_key" {
  type    = string
  default = ""
}

variable "allow_cidr_blocks" {
  description = "Additional CIDR blocks to allow access to the Presto UI from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "additional_security_groups" {
  description = "Additional security groups requiring access to the coordinator for submitting queries"
  type        = list(string)
  default     = []
}
