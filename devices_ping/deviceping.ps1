#$gateway = (Get-NetRoute -DestinationPrefix "0.0.0.0/0").NextHop
#$pingGateway = Test-Connection -ComputerName $gateway -Count 1 -Quiet

#if ($pingGateway) { Write-Host "Gateway $gateway is reachable." } 
#else {
#    Write-Host "Gateway $gateway is not reachable."
#    exit
#}

function FastScan() { #use to verify devices on local network quickly

    Get-NetNeighbor | Select-Object IPAddress, LinkLayerAddress, State | ForEach-Object {
    
        $ip = $_.IPAddress
        $mac = $_.LinkLayerAddress
        
        Write-Host "MAC: $mac, IP: $ip" 
    }
}

function CompleteScan() { # use to verify devices on local network thoroughly and check if they are online or other without authorization

    Get-NetNeighbor | Select-Object IPAddress, LinkLayerAddress, State | ForEach-Object {
    
        $ip = $_.IPAddress
        $mac = $_.LinkLayerAddress

        if ($mac -and $mac -ne "ff-ff-ff-ff-ff-ff" -and $mac -ne "00-00-00-00-00-00" ) {
            $pingResult = Test-Connection -ComputerName $ip -Count 1 -Quiet
            if ($pingResult) { Write-Host "MAC: $mac, IP: $ip" }
        }
    }
}