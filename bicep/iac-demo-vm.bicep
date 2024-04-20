// Parameters
param location string
param vmName string 
param tags object 
param vmSize string = 'Standard_DS1_v2'
param adminUsername string = 'adoadmin'
param adminPassword string = 'SuperSecretPwd!23' // Follow Azure's password requirements
param vnetName string = 'iac-demo-vnet'
param subnetName string = 'subnet01'
param osDiskType string = 'Premium_LRS'
param dataDiskSizeGB int = 1024
param addressSpace string = '10.0.0.0/16'
param subnetAddressPrefix string = '10.0.0.0/24'



// Create Virtual Network
resource vnetExample 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
}

// Create Public IP
resource pipExample 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: concat(vmName, '-pip')
  location: location
  tags: tags
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

// Create Network Interface
resource nicExample 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: concat(vmName, '-nic')
  location: location
  tags: tags
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: pipExample.id
          }
          subnet: {
            id: vnetExample.properties.subnets[0].id
          }
        }
      }
    ]
  }
}

// Create VM
resource vmExample 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  tags: tags
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
      }
      dataDisks: [
        {
          lun: 0
          createOption: 'Empty'
          diskSizeGB: dataDiskSizeGB
          managedDisk: {
            storageAccountType: osDiskType
          }
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicExample.id
        }
      ]
    }
  }
}
