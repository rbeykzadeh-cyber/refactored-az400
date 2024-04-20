targetScope='subscription'

param resourceGroupName string = 'rg-cus-iac-demo-01'
param resourceGroupLocation string = 'centralus'
param tags object = {
  costCenter: '1234'
  businessUnit: 'Acct'
}

resource rgExample 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: tags
}

output resourceGroupName string = rgExample.name
output resourceGroupLocation string = rgExample.location
output resourceGroupTags object = rgExample.tags
