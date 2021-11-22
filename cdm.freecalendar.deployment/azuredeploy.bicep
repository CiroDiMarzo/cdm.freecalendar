param companyName string

param projectName string

param environment string

param location string

param sqlServerConnectionString string

param serviceBusConnectionString string

param appInsightsInstrumentationKey string

param appServicePlanName string = format('{0}-{1}-plan', companyName, projectName)

param storageAccountName string = format('{0}{1}sa', companyName, projectName)

param functionAppName string = format('{0}-{1}-func-api', companyName, projectName)

param functionAppConfigName string = format('{0}-{1}-func-config', companyName, projectName)

resource storageAccountRes 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

resource functionAppApi 'Microsoft.Web/sites@2020-12-01' = {
  name: functionAppName
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    serverFarmId: appServicePlanName
  }
  dependsOn: [
    storageAccountRes
  ]
}
