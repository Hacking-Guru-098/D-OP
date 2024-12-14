#!/bin/bash

###################################################
# Author: Sahil Joshi
# Date: 14th-Dec-2024
# Contact: hacking.guru.098@gmail.com
#
# Version: v1
#
# This script will report the AWS resource usage
##################################################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

set -x
set -e
set -o pipefail

# list all s3 buckets
aws s3 ls > resourceTracer

# list all ec2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list all lambda functions
aws lambda list-functions >> resourceTracker

# list all iam users
aws iam list-users >> resourceTracker

cat resourceTracker