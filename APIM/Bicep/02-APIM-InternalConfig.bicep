
param apiManagementServiceName string
param groupType string


resource apiManagementService 'Microsoft.ApiManagement/service@2021-08-01' existing = {
  name: apiManagementServiceName
}

// ================= Products =================
resource GameAPIProduct 'Microsoft.ApiManagement/service/products@2020-12-01' ={
  name:'${apiManagementServiceName}/GameAPI-Product'
  properties:{
    displayName: 'GameAPI-Product'
    description: 'GameAPI product for all Game API'
    subscriptionRequired: true
    approvalRequired: false
    subscriptionsLimit: 1
    state: 'published'
  }
}

// ================= Groups =================
resource Identifier 'Microsoft.ApiManagement/service/groups@2021-12-01-preview' = {
 name: 'CRM-Group'
 parent: apiManagementService
 properties: {
   description: 'User group for CRM'
   displayName: 'CRM-Group'
   externalId: null
   type: groupType
 }
}

