# acklen-avenue-devops-challenge

**INSTRUCTIONS**

Before you start you must have **Terraform** installed on your OS.

Una vez listo debes clonar el repositorio
`git clone https://github.com/dymunoz/acklen-avenue-devops-challenge.git`

Create the **terraform.tfvars** file with the AWS_ACCESS_KEY and AWS_SECRET_KEY variables.

Example:
```
AWS_ACCESS_KEY = "YOUR_ACCESS_KEY"
AWS_SECRET_KEY = "YOUR_SECRET_KEY" 
 ```

In the **vars.tf** file you can modify the variables to create the instances such as the region and the ssh keys.

Example:
```
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  } 
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
```
To create the ssh keys you must execute the following command 
`ssh-keygen -f mykey`

Once these things have been configured, run the command 
`terraform init`

Run the command
`terraform plan`

And if everything is correct, execute the command 
`terraform apply`

Type 'yes' when prompted and wait for the infrastructure to be created.
Once created the console will display the url of ELB

Example:
**http://my-elb-1864883165.us-east-1.elb.amazonaws.com/**

Then you have to wait for some time for the instances to be started correctly
