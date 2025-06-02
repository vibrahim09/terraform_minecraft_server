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

**make sure** to set the permission of the scripts to executable

``` bash
chmod +x ./set_up.bash
```

```bash
chmod +x ./run_script.bash
```
