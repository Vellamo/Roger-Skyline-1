# Roger-Skyline-1
*A 42-school project. Involves the use of basic sysadmin/network tools and the creation of my first web server.*
Due to the size of the VDI (and the nature of the project), it is not included as part of this repository.

## Workflow

1. Installed VM to specifications.
1. Check partition sizes with `cfdisk`.
1. apt-get install required services. 
1. adduser & give them Sudo permissions.
1. Modify /etc/network/interfaces.d/ to make a static IP, as outlined in the brief.
1. ssh-keygen a new SSH key for accessing the remote. Copy it to the remote and use this to connect. 
1. Configure UFW to default to deny incoming and allow outgoing. Open only required ports.
1. Configure F2B for DOS protection. Modify jail.local and create appropriate filters.
1. Configure PortSentry for port scanning protection. Modify /etc/default/portsentry & /etc/portsentry/portsentry.conf
1. Use `systemctl --type=service --state=active` to find non-vital services running and `systemctl disable <service>` to disable them. `service --status-all` and `serivce <service> disable` is also another option.
1. Create/configure Crontab scripts. 
1. Create and configure SSL certificates. 

## Tools used:

- Nginx 
- UFW
- Fail2ban
- Portsentry
- Cron
- HTML & CSS

## Useful commands!

- sudo <cmd\>
- ufw
- service --status-all
- service <service name\> stop/restart/start
- adduser <name\>
- usermod -Ag sudo <name\>
- ssh -i <keyfile\> <IP\> -p <port\>
- crontab -e 

## Useful files/locations!

- /etc/aliases
- /etc/default/portsentry
- /etc/fail2ban/jail.local
- /etc/hosts.deny
- /etc/network/interfaces.d/
- /var/mail/

## Useful links!  

* Installing Debian:
https://medium.com/platform-engineer/how-to-install-debian-linux-on-virtualbox-with-guest-additions-778afa0ee7e0

* Nginx Config:
https://www.linode.com/docs/web-servers/nginx/how-to-configure-nginx/

* UFW Config:
https://help.ubuntu.com/community/UFW

* Fail2Ban Configuration
https://www.digitalocean.com/community/tutorials/how-to-protect-an-nginx-server-with-fail2ban-on-ubuntu-14-04

* Protecting against portscans with Port Sentry:
https://en-wiki.ikoula.com/en/To_protect_against_the_scan_of_ports_with_portsentry

* Using Nginx to host a Webpage:
https://medium.com/@jgefroh/a-guide-to-using-nginx-for-static-websites-d96a9d034940

* HTML/CSS Guides:
https://www.w3schools.com/html/default.asp

* Self-Signing SSL Cert:
https://webtips4u.com/guides/linux/creating-a-self-signed-ssl-certificate-on-linux-or-unix-server/
