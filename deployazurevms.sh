###This will deploy the required infrastructure on Azure for this workshop##########


### Login to Azure Subscription ####

az login

###Non-Fixed Parameter#####

echo "Please enter naming convention prefix - charators only)"
read envprefix
echo "Please enter number of students for whom resources to be deployed in azure - integer only"
read numberofstudent
echo "Please enter number of docker host(azureVM's) to be created for each student"
read dockerhostperstudent
echo "Please enter azure region resources to be deployed to e.g eastus , westus"
read location
###Fixed Parameter#####
adminusername='localadmin'
adminpassword='microsoft@123'
rg='rg'
storage='strgacc'
vnet='dockervnet'
diskname='osdisk'
ipname='pip'

###Creating resources##
##Starting Outer for loop: this will create ResourceGroup, Network, and storage account##

for ((n=1;n<=$numberofstudent;n++))
do
std=std$n

###Creating Resource Group for Each Student###
az resource group create -l $location -n $envprefix$std$rg

###Creating storage account for each Student###
az storage account create -g $envprefix$std$rg -n $envprefix$std$storage -l $location --sku Standard_LRS

###Creating Virtual network for each Student###
az network vnet create -g $envprefix$std$rg  --name $envprefix$std$vnet --address-prefix 10.0.0.0/16 -l $location --subnet-name subnet --subnet-prefix 10.0.0.0/24

###Creating Virtual Machine(Ubuntu) with Docker for each user###
	###Starting Inner For Loop for creating virtual machines for each student###
	for ((i=1;n<=$dockerhostperstudent;n++))
	do
	vm=vm$i
	az vm create -g $envprefix$std$rg --image UbuntuLTS --name $envprefix$std$vm --authentication-type password --admin-username $adminusername --admin-password $adminpassword -l $location --nsg '' --os-disk-name $envprefix$std$vm$diskname --public-ip-address $envprefix$std$vm$ipname --size Standard_D1 --storage-account $envprefix$std$storage --vnet $envprefix$std$vnet --subnet-name Subnet > $envprefix$std$vm.txt

	az vm extension set -n DockerExtension --publisher Microsoft.Azure.Extensions --version 1.2.0 --vm-name $envprefix$std$vm --resource-group $envprefix$std$rg 

	done
	### Inner Loop Done###


done
### Outer Loop Done ###

####Finished Deployment#######
echo Deployment finished successfully, Check Current directory for text file containing IP details for each student. Thanks




