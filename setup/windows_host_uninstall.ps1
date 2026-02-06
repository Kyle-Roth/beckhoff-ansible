# Powershell script to undo steps from Windows Ansible host setup
# Be careful running this script, it could affect other services using PSRP or WinRM
# for more information, see http://docs.ansible.com

# enable the WinRM service and set up an HTTP listener
Disable-PSRemoting -Force

# close port 5985 for all profiles
Remove-NetFirewallRule -DisplayName 'Windows Remote Management (HTTP-In)'

# remove local user account WinRM rule
Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Polocies\System' -Name 'LocalAccountTokenFilterPolicy'
