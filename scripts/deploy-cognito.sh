#!/bin/bash

# Exit on error
set -e

# Store the original directory
ORIGINAL_DIR=$(pwd)

# Check if stack name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <stack-name> [ses-email]"
  echo "Example: $0 game noreply@spiritofkiro.com"
  exit 1
fi

STACK_PREFIX=$1
SES_EMAIL=${2:-noreply@spiritofkiro.com}
COGNITO_STACK_NAME="${STACK_PREFIX}-cognito"
REGION=${AWS_REGION:-us-west-2}

echo "Deploying Cognito resources for stack: $COGNITO_STACK_NAME"
echo "Region: $REGION"

# Change to the iac directory
cd "$(dirname "$0")/../server/iac"

# Deploy the Cognito stack
echo "Deploying Cognito stack with SES email: $SES_EMAIL"
aws cloudformation deploy \
  --template-file cognito.yml \
  --stack-name $COGNITO_STACK_NAME \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides SESSourceEmail=$SES_EMAIL \
  --region $REGION

# Get Cognito outputs
echo "Getting Cognito outputs..."
COGNITO_USER_POOL_ID=$(aws cloudformation describe-stacks \
  --stack-name $COGNITO_STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='UserPoolId'].OutputValue" \
  --output text \
  --region $REGION)

COGNITO_CLIENT_ID=$(aws cloudformation describe-stacks \
  --stack-name $COGNITO_STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='UserPoolClientId'].OutputValue" \
  --output text \
  --region $REGION)

COGNITO_USER_POOL_ARN=$(aws cloudformation describe-stacks \
  --stack-name $COGNITO_STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='UserPoolArn'].OutputValue" \
  --output text \
  --region $REGION)

SES_IDENTITY_ARN=$(aws cloudformation describe-stacks \
  --stack-name $COGNITO_STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='SESIdentityArn'].OutputValue" \
  --output text \
  --region $REGION)

SES_SOURCE_EMAIL=$(aws cloudformation describe-stacks \
  --stack-name $COGNITO_STACK_NAME \
  --query "Stacks[0].Outputs[?OutputKey=='SESSourceEmail'].OutputValue" \
  --output text \
  --region $REGION)

echo "Deployment completed successfully!"
echo "Cognito User Pool ID: $COGNITO_USER_POOL_ID"
echo "Cognito Client ID: $COGNITO_CLIENT_ID"
echo "Cognito User Pool ARN: $COGNITO_USER_POOL_ARN"
echo "SES Identity ARN: $SES_IDENTITY_ARN"
echo "SES Source Email: $SES_SOURCE_EMAIL"

# Return to original directory before creating .env file
cd "$ORIGINAL_DIR"

# Create a .env file with the Cognito configuration
echo "Creating .env file with Cognito configuration..."
cat > dev.env << EOL
COGNITO_USER_POOL_ID=$COGNITO_USER_POOL_ID
COGNITO_CLIENT_ID=$COGNITO_CLIENT_ID
COGNITO_USER_POOL_ARN=$COGNITO_USER_POOL_ARN
SES_IDENTITY_ARN=$SES_IDENTITY_ARN
SES_SOURCE_EMAIL=$SES_SOURCE_EMAIL
EOL

echo "Created .env file with Cognito configuration"
echo "You can now use these values in your application" 