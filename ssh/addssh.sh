#!/bin/bash
# Getting

domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "=============================="
echo -e " SSH Account Details "
echo -e "=============================="
echo -e "IP/Host             : $IP"
echo -e "Domain              : $domain"
echo -e "Username            : $Login"
echo -e "Password            : $Pass"
echo -e "SSL/TLS             : $ssl"
echo -e "SSH Websocket SSL   : 443"
echo -e "SSH Websocket HTTP  : 8880"
echo -e "BadVpn UDPGW        : 7100-7200-7300"
echo -e "Created             : $hariini"
echo -e "Expired             : $expi"
echo -e "=============================="
echo -e "Payload Websocket SSL/TLS"
echo -e "=============================="
echo -e "GET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e "Payload Websocket HTTP"
echo -e "=============================="
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e "Script Mod By ADAM SIJA"
