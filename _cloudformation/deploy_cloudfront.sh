#!/usr/bin/env bash

CERTIFICATE_ARN=$(aws --region us-east-1 acm list-certificates | jq --raw-output '.CertificateSummaryList | map(select(.DomainName == "*.lemonlabs.io"))[0].CertificateArn')
aws cloudformation update-stack --stack-name lemon-labs-cloudfront --template-body file://cloudfront.json --parameters ParameterKey=AcmCertificateArn,ParameterValue=$CERTIFICATE_ARN
