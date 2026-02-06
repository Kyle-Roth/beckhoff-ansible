# Powershell script to setup a windows host for Ansible
# for more information, see http://docs.ansible.com

# enable the WinRM service and set up an HTTP listener
Enable-PSRemoting -Force

# open port 5985 for all profiles
$firewallParams = @{
    Action      = 'Allow'
    Description = 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]'
    Direction   = 'Inbound'
    DisplayName = 'Windows Remote Management (HTTP-In)'
    LocalPort   = 5985
    Profile     = 'Any'
    Protocol    = 'TCP'
}
New-NetFirewallRule @filewallParams

# allow local user account to be used with WinRM
$tokenFilterParams  = @{
    Path            = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Polocies\System'
    Name            = 'LocalAccountTokenFilterPolicy'
    Value           = 1
    PropertyType    = 'DWORD'
    Force           = $true
}
New-ItemPropery @tokenFilterParams
