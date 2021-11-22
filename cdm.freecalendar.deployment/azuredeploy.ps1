# To execute this file I had to run this command to avoid a permission denied
# error from the VS Code task runner:
#   sudo chmod -R 777 ./cdm.freecalendar.deployment/azuredeploy.ps1

$deploymentFolder = './cdm.freecalendar.deployment/'

$parametersFile = 'azuredeploy.parameters.json'

az login

$json = Get-Content "$deploymentFolder/$parametersFile" | Out-String | ConvertFrom-Json

$resourceGroupName = [string]::Format('{0}-{1}-{2}-rg', $json.parameters.companyName.value, $json.parameters.projectName.value, $json.parameters.environment.value)

az group create --name $resourceGroupName --location $json.parameters.location.value

az deployment group create --resource-group $resourceGroupName --template-file "$deploymentFolder/azuredeploy.bicep" --parameters "$deploymentFolder/$parametersFile"