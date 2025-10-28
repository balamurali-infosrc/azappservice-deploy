variable "resource_group_name" { default = "rg-webapp-demo" }
variable "location" { default = "East US2" }
variable "app_service_plan_name" { default = "asp-demo" }
variable "app_service_name" { default = "webapp-demo-007" }
variable "slot_name" { default = "staging" }
variable "repo_url" { default = "https://github.com/balamurali-infosrc/tf-sample-bg-master.git" }
variable "branch" { default = "main" }
