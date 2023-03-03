# Ansible Playbook for Node Decommission From Puppet & Katello + DNS Server

<p>Tested with:</p>

```
Ansible AWX 21
Puppet Enterprise 2021.6
vCenter Server 7
Windows Server 2019
```
## Overview

The playbook receives the node/server to be decommissioned and proceeds with the shutdown of the Server, removal from puppet, Foreman/Katello and DNS server

Permissions:
- Puppet user with autentication token generated and API permission
- Foreman user with permission do delete hosts
- Windows AD user with permission to delete DNS records 
- vCenter server user with permission to shutdown guest

### Related posts:

[Automation: node decommission , vCenter, puppet, foreman & DNS](https://virtualclusterit.com/2023/03/03/automation-node-decommission-vcenter-puppet-foreman-amp-dns/)
## [DEMO](https://www.youtube.com/watch?v=bJ37diR94Z0)
[![DEMO: Watch the video](https://i.imgur.com/JBmbq1l.png)](https://www.youtube.com/watch?v=bJ37diR94Z0)

### To do
1. Accept list of nodes as input
2. Backup & remove server from vCenter