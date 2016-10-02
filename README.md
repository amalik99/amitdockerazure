# Trainer tools to create and prepare Instances for Docker workshops on Azure

## Prerequisites

- [Docker](https://docs.docker.com/engine/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Run Azure CLI Docker Container by issuing following command
  docker run -it azuresdk/azure-cli-python


## General Workflow

- fork/clone repo - by issuing folowing command
"git clone https://github.com/amalik99/amitdockerazure"
- Ensure that you have Azure Login credentials available, requires interactive login
- Change directory to docker repo
- run `bash trainerazuredeploy.sh` commands to Create container for Azure CLI, and deploy instances on Azure
- Check output folder inside cloned directory - text file for each student will be available here.
 Script will ask generic questions such as enviremetn prefix(for naming conventions), Number of Students in class, Number of Docker Host per student, Username and password to be used for proviosning the instances on Azure.





- 
