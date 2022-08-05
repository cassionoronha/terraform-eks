# CASSIO - EKS

Project of EKS

This terraform project creates:
1. 1 VPC
2. 2 PUBLIC SUBNETS
3. 2 PRIVATE SUBNETS
4. 1 INTERNET GATEWAY
5. 1 NATGATEWAY
6. 1 EKS CLUSTER

## Provisioning the infrastructure

We create a Workspace called 'cassiolab'.

1. `terraform init`
2. `terraform workspace new cassiolab`
4. `terraform plan -var-file="_v_lab.tfvars" -out=lab.plan -var 'aws_profile=<your-aws-profile>' -var 'aws_region=us-west-2'` 
5. `terraform apply "lab.plan"` 

### How do I destroy my infrastructure? ###

`terraform destroy -var-file="_v_lab.tfvars" -var 'aws_profile=<your-aws-profile>' -var 'aws_region=us-west-2'`