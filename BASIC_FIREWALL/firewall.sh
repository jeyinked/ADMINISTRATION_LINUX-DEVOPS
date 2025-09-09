#!/bin/bash

### Variables ###
IPT=/sbin/iptables

### Flush (on nettoie tout avant d'appliquer les règles) ###
$IPT -F
$IPT -X
$IPT -t nat -F
$IPT -t nat -X
$IPT -t mangle -F
$IPT -t mangle -X

### Politique par défaut (tout DROP sauf loopback et ce qu'on ouvre après) ###
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT ACCEPT

### Autoriser loopback ###
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

### Autoriser connexions déjà établies ###
$IPT -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

### Autoriser SSH (port 22) ###
$IPT -A INPUT -p tcp --dport 22 -j ACCEPT

### Autoriser HTTP (80) et HTTPS (443) ###
$IPT -A INPUT -p tcp --dport 80 -j ACCEPT
$IPT -A INPUT -p tcp --dport 443 -j ACCEPT

### ICMP (ping) - optionnel ###
$IPT -A INPUT -p icmp -j ACCEPT
