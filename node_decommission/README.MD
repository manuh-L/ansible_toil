# Ansible Playbook for Node Decommission From Puppet & Katello + DNS Server

<p>Tested with:</p>

```
Puppet Enterprise 2021.6
AWX 21
vCenter Server 7
Windows Server 2019
```
## Overview

The playbook receives the node/server to be decommissioned and proceeds with the shutdown of the Server, removal from puppet, Foreman/Katello and DNS server

Permissions:
- Puppet user with autentication token generated and permission do 
- Foreman user with permission do delete hosts
- Windows AD user with permission to delete DNS records 
- vCenter server user with permission to shutdown guest

### To do
1. Accept list of nodes as input
2. Backup & remove server from vCenter