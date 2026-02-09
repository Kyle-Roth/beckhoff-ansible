# beckhoff_ansible

Tools for using Ansible with Beckhoff IPCs






### Windows Host Setup (should be the IPC)
Need to startup PSRP and open a firewall port for PSRP. The eastiest thing to do is just turn off the firewall, but IT may not appreciate that.

Setting firewall rule:
 - Enable running scripts with: ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser```
 - 

Upgrade poweshell with: ```Install-Module PowerShellGet -Force```
Install TcXaeMgmt with:```Install-Module -Name TcXaeMgmt```

