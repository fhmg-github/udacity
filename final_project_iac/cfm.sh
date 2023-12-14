#!/bin/bash

# Created By fhmg

# This script is intended to avoid typing the long Cloud Formation commands when managing Cloud formation stacks.
#
# Usage:
#
# "For the actions: describe-stack/update-stack/deploy-stack/preview-stack the usage is:"
# "Usage: $0 <action> <stack_name> <path_to_template_file.yaml> <path_to_parameters.json>\n"

# "For the actions: delete-stack/describe-stack the usage is:"
# "Usage: $0 <action> <stack_name>\n"

# "For the actions: validate-stack the usage is:"
# "Usage: $0 <action> <path_to_template_file.yaml>\n"

#
# The valid CloudFormation commands are:
#
# "create-stack"
# "update-stack"
# "delete-stack"
# "describle-stacks"
# "validate-template"
# "deploy"
# "preview-stack"
#
# Usage examples:
#
#     ./cfm.sh create-stack
#     ./cfm.sh deploy
#     ./cfm.sh delete-change-set

# Import variables from cfm.vars file
source cfm.parameters

# List of actions
stack_actions=(
    "create-stack"
    "update-stack"
    "delete-stack"
    "describle-stacks"
    "validate-template"
    "deploy"
    "preview-stack"
)

# Error message to be displayed in case a parameter is not parsed when executing the script
function check_parsed_action() {
    echo "The valid actions are: "
    for action in ${stack_actions[@]}; do
        echo "- '$action'"
    done
    echo -e "\n"
    echo -e "For the actions: describe-stack/update-stack/deploy-stack/preview-stack the usage is:"
    echo -e "Usage: $0 <action> <stack_name> <path_to_template_file.yaml> <path_to_parameters.json>\n"
    echo -e "For the actions: delete-stack/describe-stack the usage is:"
    echo -e "Usage: $0 <action> <stack_name>\n"
    echo -e "For the actions: validate-stack the usage is:"
    echo -e "Usage: $0 <action> <path_to_template_file.yaml>\n"
    exit 1
}

function create_stack () {
    echo "Creating stack"
    aws cloudformation create-stack \
        --stack-name "$1" \
        --template-body file://$2 \
        --parameters file://$3 \
        --capabilities $CAPABILITY \
        --region $REGION \
        --profile $PROFILE
}

function update_stack() {
    echo "Updating stack"
    aws cloudformation update-stack \
        --stack-name $1 \
        --template-body file://$2 \
        --parameters file://$3 \
        --capabilities $CAPABILITY \
        --region $REGION \
        --profile $PROFILE
}

function delete_stack() {
    echo "Deleting stack"
    aws cloudformation delete-stack \
        --stack-name $1 \
        --region $REGION \
        --profile $PROFILE 
}

function describe_stacks() {
    echo "Describing stacks"
    aws cloudformation describe-stacks \
        --stack-name $1 \
        --region $REGION \
        --profile $PROFILE 
}

function validate_template() {
    echo "Validating Template"
    aws cloudformation validate-template \
        --template-body file://$1 \
        --region $REGION \
        --profile $PROFILE 
}

function deploy_stack() {
    echo "Deploying stack"
    aws cloudformation deploy \
        --stack-name $1 \
        --template-file $2 \
        --parameter-overrides $3 \
        --region $REGION \
        --profile $PROFILE 
}

function preview_stack() {
    echo "Previewing your desired stack"
    aws cloudformation deploy \
        --stack-name $1 \
        --template-file $2 \
        --parameter-overrides $3 \
        --no-execute-changeset \
        --region $REGION \
        --profile $PROFILE 
}

# Main execution
if [[ -z "$1" ]] || [[ $1 == "--help" ]]; then
    check_parsed_action
elif [[ $1 == "create-stack" ]]; then
    echo "$2 - $3 - $4"
    create_stack $2 $3 $4
elif [[ $1 == "update-stack" ]]; then
    update_stack "$2" "$3" "$4"
elif [[ $1 == "delete-stack" ]]; then
    delete_stack "$2"
elif [[ $1 == "describe-stack" ]]; then
    describe_stacks "$2"
elif [[ $1 == "validate-template" ]]; then
    validate_template "$2"
elif [[ $1 == "deploy" ]]; then
    deploy_stack "$2" "$3" "$4"
elif [[ $1 == "preview-stack" ]]; then
    preview_stack "$2" "$3" "$4"
else
    echo "ERROR: $1 is not a recognized action"
    echo "run $0 --help"
fi
