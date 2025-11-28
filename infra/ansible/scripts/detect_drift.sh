#!/bin/bash
set -e
terraform init -input=false
terraform plan -no-color -out=tfplan || true
terraform show -json tfplan > plan.json || true
CHANGES=$(jq '.resource_changes | length' plan.json)
if [ "$CHANGES" -gt 0 ]; then
  echo "drift=true" > drift.out
  exit 0
else
  echo "drift=false" > drift.out
  exit 0
fi