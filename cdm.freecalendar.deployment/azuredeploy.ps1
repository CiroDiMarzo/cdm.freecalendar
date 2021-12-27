. "$PSScriptRoot\azuredeploy.parameters.ps1"

#########################
# AD App Registration
#########################

$serviceAppName = "$($json.parameters.companyName.value)-$($json.parameters.projectName.value)-$($json.parameters.environment.value)-serviceApp"

$appId = az ad app create --display-name $serviceAppName --available-to-other-tenants $false --oauth2-allow-implicit-flow $false --query "appId" --output "tsv"

az ad app update --id $appId --reply-urls "$($json.parameters.serviceAppUri.value)/.auth/login/aad/callback" --identifier-uris "api://$appId"

az ad app permission add --id $appId --api 00000003-0000-0000-c000-000000000000 --api-permissions "5c28f0bf-8a70-41f1-8ab2-9032436ddb65=Scope"

az ad app permission add --id $appId --api 00000003-0000-0000-c000-000000000000 --api-permissions "df021288-bdef-4463-88db-98f22de89214=Role"

$json.parameters.serviceAppClientId.value = $appId

#########################
# Resource group
#########################

az group create --name $resourceGroupName --location $json.parameters.location.value

#########################
# Resources deployment
#########################

az deployment group create --resource-group $resourceGroupName --template-file "$deploymentFolder/azuredeploy.bicep" --parameters "$deploymentFolder/$parametersFile" --parameters serviceAppClientId=$appId 