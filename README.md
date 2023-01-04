# APIM_POC

This is an example on how a simple Azure API Management can be deployed. The thought is that the API management is dived in three parts. One for API Management- the service. One for the surrounding resources such as products and user groups etc. The third part of the API representation in API Management gateway is managed in the code base for the API. 

Requirements
* Azure CLI (az)
* Azure Biceps module
* Azure account
* VS code or any other text editor and a terminal


## Usage

The project is verry simple and only contain the bicep and configuration that is needed. 
The command.sh contain the needed command to crate the API management instance using bicep and Azure CLI (az commands)

start with loging in to your Azure account

```bash
az login
```

select subscription

```bash
az account set --subscription <subscription id> 
```

Create a resource group Create a resource group (this can of course be done in biceps also)

```bash
az group create -l <locaton> -n <resource group name>
```

## For the main API management service 
01-APIM-service.bicep together with APIM-Service-dev.parameters.json is used. OBS! APIM-Service-dev.parameters.json needs to be updated with your API Management details. 


## For the main API Management service 
To deploy the API Manager instance run the 01-APIM-service.bicep file together with APIM-Service-dev.parameters.json. OBS! APIM-Service-dev.parameters.json needs to be updated with your API Management details. 

```bash
az deployment group create --resource-group <resource group name> --template-file Bicep/01-APIM-service.bicep --parameters @Config/APIM-InternalConfig-dev.parameters.json
```
## For the internal config in API Management service 
To deploy API Manager internal resources run the 02-APIM-InternalConfig.bicep file together with APIM-Service-dev.parameters.json. OBS! APIM-InternalConfig -dev.parameters.json needs to be updated with your API Management details. 

```bash
az deployment group create --resource-group <resource group name> --template-file Bicep/02-APIM-InternalConfig.bicep --parameters @Config/APIM-InternalConfig-dev.parameters.json
```

## Contributing
This is just a note for my own reference. If it can help anyone else, great. But it is only a POC to investigate APIM and Bicep. It is not designed for production or even test usage but get started example. 

## License

[MIT](https://choosealicense.com/licenses/mit/)
