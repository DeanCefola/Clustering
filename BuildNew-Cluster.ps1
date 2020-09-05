<#Author   : Dean Cefola
# Creation Date: 07-22-2020
# Usage      : Setup FailOver Cluster

#**************************************************************************
# Date                         Version      Changes
#------------------------------------------------------------------------
# 07/22/2020                       1.0       Intial Version
#
#***************************************************************************
#
#>


$nodes = ("Clus00","Clus01")
Invoke-Command  $nodes {
    Install-WindowsFeature Failover-Clustering `
        -IncludeAllSubFeature `
        -IncludeManagementTools
}
Test-Cluster `
    –Node ("Clus00","Clus01") `
    –Include "Inventory", "Network", "System Configuration"
New-Cluster `
    -Name AZCluster `
    -Node ("Clus00","Clus01") `
    -ManagementPointNetworkType Distributed

