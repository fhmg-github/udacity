# Cloud Formation Management script - cfm.sh

#### This script is intended to avoid typing the long Cloud Formation commands when managing Cloud formation stacks.

# Usage:
#### "For the actions: describe-stack/update-stack/deploy-stack/preview-stack the usage is:"
#### "Usage: $0 <action> <stack_name> <path_to_template_file.yaml> <path_to_parameters.json>\n"

#### "For the actions: delete-stack/describe-stack the usage is:"
##### "Usage: $0 <action> <stack_name>\n"

#### "For the actions: validate-stack the usage is:"
#### "Usage: $0 <action> <path_to_template_file.yaml>\n"

## The valid CloudFormation commands are:
* "create-stack"
* "update-stack"
* "delete-stack"
* "describle-stacks"
* "validate-template"
* "deploy"
* "preview-stack"

# Usage examples:
``` 
./cfm.sh create-stack stack_name_example network.yaml parameters.json
./cfm.sh deploy stack_name_example network.yaml parameters.json
./cfm.sh delete-stack stack_name_example
```

# cfm.parameters file
#### This file is used to set additional parameters when running the cfm.sh script.

### REGION
Region where you want to deploy your Cloud Formation stacks

### CAPABILITY
When creating IAM resources, "CAPABILITY_IAM" or "CAPABILITY_NAMED_IAM" needs to be set.

If left blank, any IAM resource creation will fail.

## PROFILE
AWS profile you want to execute the CloudFormation commands.
If not configured, default profile will be used


# For Udacity evaluation

#### If you need to run this Cloud Formation stack, just do:

./cfm.sh create-stack FinalProjectStack-Network network.yaml network-parameters.json

./cfm.sh create-stack FinalProjectStack-Udagram udagram.yaml udagram-parameters.json

# Cloud Formation Template and parameters

The only configurable parameter to be able to access the EC2 instances are "HomeIpAdress" and "EC2KeyPairName" in the udagram-parameters.json file. Respectively, your network public IP address from where the Bastion host will be accessed and your KeyPair file to be set on the Bastion Host and EC2 instances that are part of the Auto-Scaling Group.

## How to find the LoadBalancer DNS entry with the http://<LB_DNS> 

Visit the CloudFormation page, select the FinalProjectStack-Udagram stack and go to "Outputs" tab.

Visit: http://FinalP-LoadB-pDArSTJc7wml-365752579.us-east-1.elb.amazonaws.com

To access the Udagram website created for this project. The website will be up and running until 5PM (PST).