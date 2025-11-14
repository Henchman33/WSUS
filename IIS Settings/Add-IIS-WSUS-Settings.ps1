# WSUS Administration Max Connections Should be Unlimited	
Import-Module webadministration ; (get-itemproperty IIS:\Sites\'WSUS Administration' -name limits.maxConnections.Value)
Import-Module webadministration ; set-Itemproperty IIS:\Sites\'WSUS Administration' -Name limits.maxConnections -Value 4294967295

# WSUS Administration MaxBandwidth should be unlimited
Import-Module webadministration ; (get-itemproperty IIS:\Sites\'WSUS Administration' -name limits.maxbandwidth.Value)
Import-Module webadministration ; set-Itemproperty IIS:\Sites\'WSUS Administration' -Name limits.maxBandwidth -Value 4294967295

# WSUS Administration TimeOut should be 320
Import-Module webadministration;(get-itemproperty IIS:\Sites\'WSUS Administration' -Name limits.connectionTimeout.value).TotalSeconds
Import-Module webadministration ; set-Itemproperty IIS:\Sites\'WSUS Administration' -Name limits.connectionTimeout -Value 00:05:20


# WSUSPool CPU ResetInterval should be 15 min
Import-Module webadministration ; set-Itemproperty IIS:\AppPools\Wsuspool -Name cpu -Value @{resetInterval="00:15:00"}

# WSUSPool Ping Disabled
Import-Module webadministration ; set-Itemproperty IIS:\AppPools\Wsuspool -Name processmodel.pingingEnabled False

# WSUSPool Private Memory Limit should be 0
Import-module webadministration
$applicationPoolsPath = "/system.applicationHost/applicationPools"
$appPoolPath = "$applicationPoolsPath/add[@name='WsusPool']"
Set-WebConfiguration "$appPoolPath/recycling/periodicRestart/@privateMemory" -Value 0

# WSUSPool queueLength should be 30000
Import-Module webadministration ; set-Itemproperty IIS:\AppPools\Wsuspool -name queueLength 30000

# WSUSPool RapidFail Should be Disable
Import-Module webadministration ; set-Itemproperty IIS:\AppPools\Wsuspool -name failure.rapidFailProtection False

# WSUSPool Recycling Regular Time interval should be 0
Import-Module webadministration ; set-Itemproperty IIS:\AppPools\Wsuspool recycling.periodicRestart.time -Value 00:00:00

# WSUSPool requests should be 0
Import-module webadministration
$applicationPoolsPath = "/system.applicationHost/applicationPools"
$appPoolPath = "$applicationPoolsPath/add[@name='WsusPool']"
Set-WebConfiguration "$appPoolPath/recycling/periodicRestart/@requests" -Value 0

# WSUS IIS - SSL Settings - https://kc.jetpatch.com/hc/en-us/articles/360043618872-7a-How-to-Configure-SSL-for-WSUS
Set-WebConfigurationProperty -Filter //security/access -name sslflags -Value "Ssl" -PSPath IIS:\ -Location "WSUS Administration/SimpleAuthWebService"
Set-WebConfigurationProperty -Filter //security/access -name sslflags -Value "Ssl" -PSPath IIS:\ -Location "WSUS Administration/DSSAuthWebService"
Set-WebConfigurationProperty -Filter //security/access -name sslflags -Value "Ssl" -PSPath IIS:\ -Location "WSUS Administration/ServerSyncWebService"
Set-WebConfigurationProperty -Filter //security/access -name sslflags -Value "Ssl" -PSPath IIS:\ -Location "WSUS Administration/APIRemoting30"
Set-WebConfigurationProperty -Filter //security/access -name sslflags -Value "Ssl" -PSPath IIS:\ -Location "WSUS Administration/ClientWebService
