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

# For Udacity evaluation

#### If you need to run this Cloud Formation stack, just do:

./cfm.sh create-stack FinalProjectStack-Network network.yaml network-parameters.json

./cfm.sh create-stack FinalProjectStack-Udagram udagram.yaml udagram-parameters.json
