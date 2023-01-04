
# Az commands needed/used for the POC. OBS! this should be done in CI/CD pipeline 
# run the az commands in the terminal, from the root folder of the project. Obs! require Azure az moduele installed, and azure biceps moduel installed

#  =============== Log in===============
az login

# =============== list tenants on account ===============
az account tenant list


# =============== set subscription context ===============
az account set --subscription <subscription id> 

# =============== Create resource group ===============
az group create -l <locaton> -n <resource group name>


# =============== Deploy Bicep ===============
az deployment group create --resource-group <resource group name> --template-file Bicep/01-APIM-service.bicep --parameters @Config/APIM-InternalConfig-dev.parameters.json
az deployment group create --resource-group <resource group name> --template-file Bicep/02-APIM-InternalConfig.bicep --parameters @Config/APIM-InternalConfig-dev.parameters.json



