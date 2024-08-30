#!/bin/bash

# Path to current and new backend configuration
CURRENT_BACKEND=".terraform/terraform.tfstate"
NEW_BACKEND="desired_backend.tf"

# Check if the backend file exists
if [ ! -f "$CURRENT_BACKEND" ]; then
    echo "Current backend not found. Running terraform init..."
    terraform init -migrate-state
    exit 0
fi

# Compare backend configurations (this can be enhanced based on your needs)
diff_output=$(diff -q "$CURRENT_BACKEND" "$NEW_BACKEND")

if [ "$diff_output" != "" ]; then
    echo "Backend has changed. Running terraform init -migrate-state..."
    terraform init -migrate-state
else
    echo "Backend is unchanged. No migration required."
fi
