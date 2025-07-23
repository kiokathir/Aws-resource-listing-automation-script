#!/bin/bash

###############################################################################
# Author: Kathir S
# Version: v0.0.1

# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
#
# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh  <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ];then
    echo "Enter 2 arguments correctly"
    echo "Format : ./aws_resource_list.sh  <aws_region> <aws_service>"
    echo "Eg: ./aws_resource_list.sh us-east-1 ec2"
    exit 1 #exit from the script
fi


# Assign the arguments to variables and convert the service to lowercase
aws_region=$1       
aws_service=$2     
aws_region="${aws_region,,}"
aws_service="${aws_service,,}"

# Check if the AWS CLI is installed
if  ! command -v aws &> dev/null ;then 
    echo "You have not installed AWS CLI .This script requires AWS CLI !!!"
    exit 1 #exit from the script
fi

if [ ! -d ~/.aws ];then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# List the resources based on the service

case "$aws_service" in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region  "$aws_region" | grep InstanceId
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets Globally " #buckets do not have specific region
        aws s3api list-buckets 
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions Globally" #CLoudfront do not have specific region  
        aws cloudfront list-distributions 
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users Globally "  #IAM do not have specific region  
        aws iam list-users 
        ;;
    route53)
        echo "Listing Route53 Hosted Zones Globally" #Route53 do not have specific region                                       
        aws route53 list-hosted-zones 
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac