# Aws-resource-listing-automation-script

Purpose:
The script was created to automate and standardize the process of discovering and listing AWS resources across multiple services in an account. It helps administrators and developers quickly get an inventory of resources without manually running separate AWS CLI commands for each service, saving time and reducing human error.
________________________________________
Explanation :
•	The script accepts two inputs: the AWS region and the target service (e.g., EC2, S3, Lambda).
•	It validates that the AWS CLI is installed and configured.
•	A case statement determines which AWS CLI command to run for each service (e.g., describe-instances, list-buckets, list-functions).
•	Global services like S3 and IAM are handled without requiring a region.
•	Results are printed in a structured format showing key identifiers for easy review or further processing.
•	Includes error handling for invalid inputs, missing configuration, and unsupported services.

for output and code refer the attached files
