# Set up a Minecraft Server with AWS using Terraform, Ansible, and Docker

1. The first step is to set up the infrastructure for this repository.

2. Need to make sure we have the following installed and ready to go

- Ansible
- AWS CLI
- Terraform

To install these components make sure you go to each website and follow the instruction based on the operating system you have:

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- [Ansible](https://ansible.readthedocs.io/projects/ansible-core/devel/installation_guide/index.html)

## Set up

Once you have all the requirements installed, lets clone this repository:

```bash
git clone git@github.com:vibrahim09/terraform_minecraft_server.git
```

I'm using ssh but you can use HTTPS if that is better.

Then navigate to the repo main directory which it should be ```terraform_minecraft_server```

Then run the set up script to initialize the directory and keys.

**Make sure** to set the permission of the scripts to executable

``` bash
chmod +x ./set_up.bash
```

```bash
chmod +x ./run_script.bash
```

Once the scripts are executable, execute the first script

```bash
./set_up.bash
```

After the **.aws** dir has been created, put the aws credentials in a file called ***credentials***

Once the credential have been added, create a ```variable.tfvars``` file.

```bash
touch variable.tfvars
```

Add this to the file:

```python
vpc_id       = "vpc-1234567890abcdefg" #change to your vpc id
subnet_id    = "subnet-1234567890abc" #Change to your subnet id
ami_id       = "ami-0123456789abc" # Change to a valid AMI id
key_name     = "minecraft_project_2" # Keep or change if you created a different key name
instance_type = "t2.medium" # t2.medium should work.
instance_name = "instance_name" #name this whatever you want
```

These should correspond to the variables.tf file in the repo.

once the ```.tfvars``` file has been created and populated with the appropriate varaibles run the ```run_script.bash``` script.

```bash
./run_script.bash
```

The script should take a minute or two to complete, once you get the message that the server has been set up succesfully, run this command to test if everything is workign correctly.

```bash
nmap -sV -Pn -p T:25565 <instance_public_ip>
```
