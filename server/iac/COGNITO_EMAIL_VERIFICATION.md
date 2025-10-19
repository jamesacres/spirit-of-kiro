# Cognito Email Verification Configuration

## Overview

This document describes the changes made to enable email verification in the
Cognito User Pool for Spirit of Kiro.

## Changes Made

### 1. CloudFormation Template Updates (`cognito.yml`)

- **Added SES Integration**: Created SES EmailIdentity and ConfigurationSet
  resources
- **Added IAM Role**: Created CognitoSESRole for Cognito to send emails via SES
- **Email Verification Settings**:
  - Enabled `AutoVerifiedAttributes: [email]`
  - Configured `EmailConfiguration` with SES integration
  - Added custom email verification template
- **New Parameters**: Added `SESSourceEmail` parameter (default:
  noreply@spiritofkiro.com)

### 2. Signup Handler Updates (`server/handlers/signup.ts`)

- **Removed Auto-Confirmation**: Eliminated `AdminConfirmSignUpCommand`
- **Updated Response**: Added `emailVerificationRequired: true` and informative
  message
- **User State**: Set `userConfirmed: false` to indicate verification is needed

### 3. Deployment Script Updates (`scripts/deploy-cognito.sh`)

- **SES Email Parameter**: Added optional second parameter for SES source email
- **Additional Outputs**: Capture and display SES-related CloudFormation outputs
- **Environment Variables**: Added SES configuration to generated `dev.env` file

## Email Verification Flow

1. User signs up → Cognito creates unverified account
2. Cognito automatically sends verification email via SES
3. User clicks verification link in email
4. Cognito marks account as verified
5. User can now sign in successfully

## Email Template

The verification email includes:

- Professional Spirit of Kiro branding
- Clear call-to-action with verification link
- 24-hour expiration notice
- Security notice for unintended signups

## Deployment

```bash
# Deploy with default email
./scripts/deploy-cognito.sh game

# Deploy with custom email
./scripts/deploy-cognito.sh game your-email@yourdomain.com
```

## Requirements Satisfied

- **1.1**: Verification email sent automatically on registration
- **1.3**: Email contains unique verification link with 24-hour expiration
- **7.1**: Uses Amazon Cognito's built-in email verification
- **7.2**: Leverages Cognito's email template system

## Next Steps

- Implement email verification resend functionality (Task 5)
- Update signin handler to check verification status (Task 8)
- Create frontend components for verification prompts (Task 9)
