aws cloudformation deploy \
   --stack-name $1 \
   --template-file workflow-and-helpers.yml \
   --parameter-overrides file://workflow-and-helpers-parameters.json \
   --region us-east-1 