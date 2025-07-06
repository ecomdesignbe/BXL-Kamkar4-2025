function Get-ServerDowntimeReport { 
    # On crée une fonction qui s’appelle "Get-ServerDowntimeReport"
    # We create a function named "Get-ServerDowntimeReport"

    [CmdletBinding()]
    param (
        # On dit qu'on veut un ou plusieurs noms d’ordinateurs (obligatoire), qu’on peut passer via un pipeline
        # We want one or more computer names (required), and we allow pipeline input
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string[]]$ComputerName,

        # Optionnellement, on peut donner un identifiant (nom d’utilisateur + mot de passe)
        # Optionally, we can provide a credential (username + password)
        [Parameter()]
        [System.Management.Automation.PSCredential]$Credential
    )

    process {
        # Pour chaque nom d’ordinateur dans la liste
        # For each computer name in the list
        foreach ($computer in $ComputerName) {
            try {
                # On prépare les infos pour aller chercher les journaux d’événements système
                # We prepare the info to read the system event logs
                $params = @{
                    ComputerName = $computer
                    LogName      = 'System'
                    ErrorAction  = 'Stop' # 🇫🇷 S'il y a une erreur, on l’arrête ici / 🇬🇧 Stop if there’s an error
                }

                # On lit tous les événements système du PC
                # We read all system events from the PC
                $allEvents = Get-WinEvent @params

                # On garde seulement les événements avec les ID 6005 (démarrage), 6006 (arrêt), 1074 (qui a redémarré)
                # Keep only events with ID 6005 (startup), 6006 (shutdown), 1074 (who shut it down)
                $events = $allEvents | Where-Object { $_.Id -in 6005, 6006, 1074 } | Sort-Object TimeCreated -Descending

                # Si on a donné des identifiants, on les ajoute aux paramètres
                # If credentials were given, add them to the parameters
                if ($Credential) {
                    $params.Credential = $Credential
                }

                # On cherche le dernier démarrage (event 6005)
                # Find the last startup (event 6005)
                $startupEvent = $events | Where-Object { $_.Id -eq 6005 } | Select-Object -First 1

                # On cherche l’arrêt juste avant ce démarrage (event 6006)
                # Find the shutdown right before the startup (event 6006)
                $shutdownEvent = $events | Where-Object {
                    $_.Id -eq 6006 -and $_.TimeCreated -lt $startupEvent.TimeCreated
                } | Select-Object -First 1

                # On cherche qui a lancé l’arrêt ou redémarrage (event 1074)
                # Find who initiated the shutdown/restart (event 1074)
                $whoEvent = $events | Where-Object {
                    $_.Id -eq 1074 -and $_.TimeCreated -le $shutdownEvent.TimeCreated
                } | Select-Object -First 1

                # On essaie d’extraire le nom de la personne qui a redémarré (ou sinon "Unknown")
                # Try to extract the user who rebooted (or "Unknown")
                $initiatedBy = if ($whoEvent) {
                    $whoEvent.Properties[6].Value
                } else {
                    "Unknown"
                }

                # On calcule combien de temps la machine est restée éteinte
                # Calculate how long the machine was down
                $downtime = if ($startupEvent -and $shutdownEvent) {
                    $startupEvent.TimeCreated - $shutdownEvent.TimeCreated
                } else {
                    $null
                }

                # On calcule depuis combien de temps la machine est allumée
                # Calculate how long the machine has been up
                $uptime = if ($startupEvent) {
                    (Get-Date) - $startupEvent.TimeCreated
                } else {
                    $null
                }

                # On retourne toutes les infos dans un tableau bien propre
                # We return all the info in a neat table/object
                [PSCustomObject]@{
                    ComputerName = $computer
                    ShutdownTime = $shutdownEvent.TimeCreated
                    StartupTime  = $startupEvent.TimeCreated
                    Downtime     = $downtime
                    Uptime       = $uptime
                    InitiatedBy  = $initiatedBy
                }
            } catch {
                # Si on a une erreur (par ex. PC éteint), on affiche un message
                # If there's an error (e.g., computer is off), show a warning
                Write-Warning "Erreur sur $computer : $_"

                # Et on retourne un objet vide mais propre
                # And we return a clean but empty object
                [PSCustomObject]@{
                    ComputerName = $computer
                    ShutdownTime = $null
                    StartupTime  = $null
                    Downtime     = $null
                    Uptime       = $null
                    InitiatedBy  = "Error"
                }
            }
        }
    }
}
