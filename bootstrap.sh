#!/bin/bash

set -e

echo "Starting bootstap..."

USER_NAME="opentofu-user"

read -sp "Enter AWS Access Key ID : " aws_access_key

read -sp "Enter AWS Access Secret Key : " aws_access_secret

read -p "Enter  AWS Region : " aws_region

aws configure set aws_access_key_id "$aws_access_key" \
  --profile bootstrap

aws configure set aws_secret_access_key "$aws_access_secret" \
  --profile bootstrap

aws configure set region "$aws_region" \
  --profile bootstrap

echo "AWS bootstrap profile is configured"

echo "Tofu user's will creating ..."

aws iam create-user \
  --user-name opentofu-user

aws iam create-access-key \
  --user-name opentofu-user