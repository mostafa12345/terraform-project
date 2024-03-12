Terraform Project Documentation
Overview

This project is a Terraform-based solution that consists of the following AWS resources:

    EC2 instance
    security group

To use this project, you will need Terraform, an AWS account, and a code editor installed on your machine.
Project Structure


Let's navigate through the module folders and files for a better explanation:
Network Module

The network module defines these resources to cover all requirements:

    random_id: Chooses random bytes. This is used for naming resources in the module.
    aws_vpc: Creates a VPC for all resources that will be used in this project.
    aws_subnet: Two resources are created from this one for the public subnet (used for the EC2 instance) and the private subnet (used for the DynamoDB table and S3 bucket).
    aws_internet_gateway: Creates a gateway for the route table in the public subnet.
    aws_route_table: Two resources are created from this one for the private subnet and the other for the public subnet.
    aws_network_acl: Creates an access control list (ACL is a security level for the subnet).
    aws_network_acl_association: Associates the created ACL and public subnet.
    aws_route_table_association: Two resources are created from this one to link the route table with the public subnet, and the other for the private subnet.
    output: At the end of the file, an output block refers to these values for main.tf in the project. This is used because these values will need to be passed to other modules in main.tf in the project.


Project Folder

In the project folder, you will find the following files:

    main.tf: This is the main file where modules are called. First, it calls the network module to create our VPC, subnets, and route tables. Then, it calls the DynamoDB module, S3 module, and finally the EC2 module. An additional attribute is used to create the DynamoDB and S3 first, then creates the EC2 instance. You will note this pattern module.MODULE_NAME.OUTPUT_NAME which passes output from one module to another.
    provider.tf: This file is used to configure the provider and upload the state file to the S3 backend.
    variable.tf: This file is used to declare the variables used in all modules' variables file.
    output.tf: This file declares the outputs of the project, which appear after Terraform finishes.

Installing and Running the Project

To install and run the project, follow these steps:

    Clone the repository to your local machine:

    git clone https://github.com/SamMelad/Terraform_Project.git

Navigate to the project directory:

cd Terraform_Project

Initialize Terraform:

terraform init

This command initializes your Terraform workspace by downloading the AWS provider and setting up the backend for storing your Terraform state.

Create an execution plan:

terraform plan

This command creates an execution plan and shows you what changes will be made to your infrastructure.

Apply the changes:

terraform apply

    This command applies the changes required to reach the desired state of the configuration.

That's it! You have now successfully deployed the project on your AWS account.
