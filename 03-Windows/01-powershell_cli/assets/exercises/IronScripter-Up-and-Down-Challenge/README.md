# An Up and Down PowerShell Challenge

## Fonction : `Get-ServerDowntimeReport`

Cette fonction permet de récupérer les informations suivantes depuis les journaux d’événements de Windows :
- Heure d'arrêt
- Heure de redémarrage
- Durée d'indisponibilité
- Uptime actuel
- Utilisateur ayant lancé l'arrêt/redémarrage

### Usage


# En local
```powershell
Get-ServerDowntimeReport -ComputerName "localhost"
```

# En pipeline
```powershell
"SRV01", "SRV02" | Get-ServerDowntimeReport
```

# Avec des identifiants
```powershell
$cred = Get-Credential
Get-ServerDowntimeReport -ComputerName "SRV01" -Credential $cred
```

# OUTPUT
```powershell
. .\Get-ServerDowntimeReport.ps1
Get-ServerDowntimeReport -ComputerName "localhost"
```
```powershell
ComputerName : localhost
ShutdownTime : 06-07-25 15:16:37
StartupTime  : 06-07-25 15:24:11
Downtime     : 00:07:33.2840812
Uptime       : 07:59:00.0487979
InitiatedBy  : N4M3OFM4CH1N3\N4M3OFD1R4CCOUNT
```

# An Up and Down PowerShell Challenge

## Fonction : `Get-ServerDowntimeReport`

This function retrieves the following information from Windows Event Logs:
- Shutdown time
- Restart time
- Downtime duration
- Current uptime
- User who initiated the shutdown/restart


### Usage


# Locally
```powershell
Get-ServerDowntimeReport -ComputerName "localhost"
```

# Via pipeline
```powershell
"SRV01", "SRV02" | Get-ServerDowntimeReport
```

# With credentials
```powershell
$cred = Get-Credential
Get-ServerDowntimeReport -ComputerName "SRV01" -Credential $cred
```

# OUTPUT
```powershell
. .\Get-ServerDowntimeReport.ps1
Get-ServerDowntimeReport -ComputerName "localhost"
```
```powershell
ComputerName : localhost
ShutdownTime : 06-07-25 15:16:37
StartupTime  : 06-07-25 15:24:11
Downtime     : 00:07:33.2840812
Uptime       : 07:59:00.0487979
InitiatedBy  : N4M3OFM4CH1N3\N4M3OFD1R4CCOUNT
```
