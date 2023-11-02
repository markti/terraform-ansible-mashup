# terraform-ansible-mashup

## Configure the SKUs for your region

`az vm list-skus --location <YOUR_REGION> --resource-type virtualMachines --zone --output table | grep -E "1,2,3|1,3,2|2,1,3|2,3,1|3,1,2|3,2,1"`

## Setup

`cd src\terraform\gallery`

`terraform init`

`terraform appply`

`ansible % ansible-playbook -i inventory.yml main.yml --extra-vars "@vars.yml" -b`