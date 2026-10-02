#!/bin/bash

set -e

echo "Starting bootstap..."

USER_NAME="opentofu-user"

read -sp "Enter AWS Access Key ID : " aws_access_key

echo

read -sp "Enter AWS Access Secret Key : " aws_access_secret

echo

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
  --user-name "$USER_NAME" \
  --profile bootstrap

aws iam create-access-key \
  --user-name "$USER_NAME" \
  --profile bootstrap \
  --output json)

tofu_access_key=$(echo "$access_key" | jq -r '.AccessKey.AccessKeyId')
tofu_secret_key=$(echo "$access_key" | jq -r '.AccessKey.SecretAccessKey')

aws configure set aws_access_key_id "$tofu_access_key" \
  --profile tofu

aws configure set aws_secret_access_key "$tofu_secret_key" \
  --profile tofu

aws configure set region "$aws_region" \
  --profile tofu

export AWS_PROFILE=tofu

tofu plan