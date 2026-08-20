param location string = resourceGroup().location

module storage 'modules/storage.bicep' = {
  name: 'deploy-storage'
  params: {
    location: location
    storageAccountName: 'stlab${uniqueString(resourceGroup().id)}'
  }
}

module network 'modules/vnet.bicep' = {
  name: 'deploy-vnet'
  params: {
    location: location
    vnetName: 'vnet-lab-01'
    addressPrefix: '10.0.0.0/16'
    subnets: [
      { name: 'snet-app', prefix: '10.0.1.0/24' }
      { name: 'snet-data', prefix: '10.0.2.0/24' }
    ]
  }
}

output blobEndpoint string = storage.outputs.blobEndpoint
output vnetId string = network.outputs.vnetId
