https://access.redhat.com/solutions/1350723
https://access.redhat.com/solutions/5444941

#explanation
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/integrating_rhel_systems_directly_with_windows_active_directory/connecting-rhel-systems-directly-to-ad-using-sssd_integrating-rhel-systems-directly-with-active-directory

yum install adcli realmd sssd oddjob oddjob-mkhomedir samba-common-tools krb5-workstation authselect-compat 

dig -t SRV _ldap._tcp.lab.com
dig -t SRV _kerberos._tcp.lab.com
dig -t SRV _ldap._tcp.dc._msdcs.lab.com

realm discover lab.com 

realm join lab.com
realm join -U Administrator lab.com

echo Password1 | realm join -U Administrator --computer-ou="ou=Linux,dc=lab,dc=com" --computer-name=terra.lab.com lab.com

# getent passwd administrator@ad.example.com
administrator@ad.example.com:*:1450400500:1450400513:Administrator:/home/administrator@ad.example.com:/bin/bash

#DNS
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/windows_integration_guide/sssd-dyndns
https://www.redhat.com/sysadmin/linux-active-directory

[domain/ad.example.com]
auth_provider = ad
chpass_provider = ad
ldap_schema = ad
dyndns_update = true
dyndns_refresh_interval = 43200
dyndns_update_ptr = true
dyndns_ttl = 3600



#file editado final
[sssd]
domains = lab.com
config_file_version = 2
services = nss, pam

[domain/lab.com]
ad_domain = lab.com
krb5_realm = LAB.COM
realmd_tags = manages-system joined-with-adcli 
cache_credentials = True
id_provider = ad
krb5_store_password_if_offline = True
default_shell = /bin/bash
ldap_id_mapping = True
use_fully_qualified_names = False
fallback_homedir = /home/%u
access_provider = ad
auth_provider = ad
chpass_provider = ad
ldap_schema = ad
dyndns_update = true
dyndns_refresh_interval = 43200
dyndns_update_ptr = true
dyndns_ttl = 3600

#REALM DENY
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/windows_integration_guide/realmd-logins

realm permit -x administrator@lab.com^C
realm deny --all
realm permit -g administrators
realm permit -g administrators@lab.com

#join
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/windows_integration_guide/realmd-conf

echo Password1 | realm join --computer-ou="ou=Linux,dc=lab,dc=com" --computer-name=terra.lab.com lab.com

realm join --computer-ou="ou=Linux,dc=lab,dc=com" --automatic-id-mapping=no --user-principal=terra@lab.com
/usr/sbin/adcli join --verbose --domain lab.com --domain-realm LAB.COM --domain-controller 192.168.100.203 --computer-ou ou=Linux,dc=lab,dc=com --login-type user --login-user Administrator --stdin-password --user-principal=terra@lab.com


#prompt
https://groups.google.com/g/ansible-project/c/L0Es3aGAKV8

#response
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/expect_module.html