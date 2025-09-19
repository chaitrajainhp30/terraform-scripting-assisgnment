#Assignment1

Terraform project where I run commands manually here
What this project does
1. Creates a Docker volume using the user_name variable
2. Creates a Docker network using the custom_network variable
3. Creates a Docker container using the base_image
4. Maps internal container port to host port
5. Mounts the created volume inside /data in the container
6. Outputs the container's IP address

#Providers Used

kreuzwerker/docker
 — Manage Docker resources like containers, volumes, and networks.
hashicorp/random
 — Generate random suffixes for unique container names.

Here i follow the below steps
1. terraform init - Initialize terraform and it downloads the required providers.
2. terraform plan - Creates a plan, this shows what resources Terraform will create.
3. terraform apply - Apply the plan, need to approve by giving 'yes'. It actually creates the Docker resources.

Outputs
After a deployment, Terraform will output:
container_ip — The IP address of the running Docker container inside the custom network


#Assignment2

Here I have used bash script to automate the resource creation using run_terraform.sh script

to run the script
chmod +x run_terraform.sh
./run_terraform.sh

This script does:
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply

#cleanup
terraform destroy -var-file="terraform.tfvars" has to be approved as 'yes' to destroy
