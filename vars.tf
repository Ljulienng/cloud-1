variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  type = string
  default = "eu-west-3"
}

variable "AWS_AMI" {
  type = string
  default = "ami-0c03e02984f6a0b41"
}
