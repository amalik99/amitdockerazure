# Trainer tools to create and prepare Instances for Docker workshops on Azure

## Prerequisites

- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

- Run Azure CLI Docker Container by issuing following command
  "docker run -it azuresdk/azure-cli-python"
-

## General Workflow

- get the scipt file by issuing following command
"wget https://raw.githubusercontent.com/amalik99/amitdockerazure/master/deployazurevms.sh"

- Ensure that you have Azure Login credentials available, requires interactive login

- run "bash deployazurevms.sh" commands to deploy entire workload on Azure.

- Script will ask generic questions such as enviremetn prefix(for naming conventions), Number of Students in class, Number of Docker Host per student, Username and password to be used for proviosning the instances on Azure.

- Scipt will deploy following per student
    -Resource Group
    - Storage Account
    - Virtual Network
    - Number of Virtual Machines as spcified during deployment - Machine will have ubuntu as OS along with Docker pre-installed
    
- After succesfull deployment, Check current working directory for text files container Public IP for each VM per student.

Spektra Systems






- 
