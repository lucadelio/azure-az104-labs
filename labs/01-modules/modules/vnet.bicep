param location string
param vnetName string
param addressPrefix string
param subnets array
@description('Deploy the Azure Bastion subnet. Costly - leaving false in lab')
param deployBastion bool = false

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [ addressPrefix ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.prefix
      }
    }]
  }
}

output vnetId string = vnet.id
output vnetName string = vnet.name

resource bastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-11-01' = if (deployBastion) {
  parent: vnet
  name: 'AzureBastionSubnet'
  properties: {
    addressPrefix: '10.0.255.0/26'
  }
}
