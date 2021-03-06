# Creates a VPN on a windows client device with the following settings. 
#
# L2TP VPN
# PSK authentication
# No idle disconnect timer
# Requires encryption
# Authentication methods: PAP, MSChapv2
#
# Author: Steve Swift

$psk = "changeme"
$server = "0.0.0.0" #IP address of the VPN gateway
$name = "VPN"

# Pull 
$vpn = Get-VpnConnection -name $name -ErrorAction Ignore

if($vpn -eq $null){ 
    #create VPN if it doesn't already exist
    Add-VpnConnection -Name $name -ServerAddress $server -TunnelType L2tp -L2tpPsk $psk -IdleDisconnectSeconds 0 -EncryptionLevel Required -AuthenticationMethod PAP,MSChapv2 -Force -WarningAction SilentlyContinue
    }
else{
    #modify existing VPN, if one already exists
    Set-VpnConnection -Name $name -ServerAddress $server -TunnelType L2tp -L2tpPsk $psk -IdleDisconnectSeconds 0 -EncryptionLevel Required -AuthenticationMethod PAP,MSChapv2 -Force -WarningAction SilentlyContinue
    }
