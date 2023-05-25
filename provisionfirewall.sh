#!/bin/bash

# Configuración de redirección
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sysctl -p

# Configuración de firewall
firewall-cmd --set-default-zone=public
firewall-cmd --zone=public --remove-interface=eth2 --permanent
firewall-cmd --zone=internal --add-interface=eth2 --permanent
firewall-cmd --zone=public --remove-interface=eth0 --permanent
firewall-cmd --zone=internal --add-interface=eth0 --permanent
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --permanent --zone=public --add-forward-port=port=8080:proto=tcp:toaddr=192.168.100.4
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" destination address="172.20.10.50" forward-port port="8080" protocol="tcp" to-port="8080" to-addr="192.168.100.4"'
firewall-cmd --zone=public --add-masquerade --permanent
firewall-cmd --zone=internal --add-masquerade --permanent
# Recarga de firewall
firewall-cmd --reload
