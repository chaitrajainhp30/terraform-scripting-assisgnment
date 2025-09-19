#!/bin/bash

set -e

TERRAFORM_DIR="./"
TFVARS_FILE="terraform.tfvars"
PLAN_FILE="tfplan.out"

echo "Initializing Terraform"
terraform -chdir="$TERRAFORM_DIR" init

echo " Planning Terraform deployment"
terraform -chdir="$TERRAFORM_DIR" plan -var-file="$TFVARS_FILE" -out="$PLAN_FILE"

echo "Applying Terraform plan"
terraform -chdir="$TERRAFORM_DIR" apply "$PLAN_FILE"

echo " Terraform deployment complete."