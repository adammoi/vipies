#!/bin/bash
mkdir -p /etc/xray
touch /etc/xray/domain
touch /etc/xray/scdomain

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${GREEN}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${GREEN}INFO${NC} ] Aight good ... installation file is ready"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);

mkdir /var/lib/SIJA;
echo "${MYIP}" >> /var/lib/SIJA/ipvps.conf

echo "Add Domain for vmess/vless/trojan dll"
echo " "
read -rp "Input ur domain : " -e pp
    if [ -z $pp ]; then
        echo -e "
        Nothing input for domain!
        Then a random domain will be created"
    else
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /root/domain
        echo "IP=$pp" > /var/lib/SIJA/ipvps.conf
    fi


# Link Hosting Kalian Untuk Ssh Vpn
SSH="raw.githubusercontent.com/adammoi/vipies/main/ssh"
# Link Hosting Kalian Untuk Xray
XRAY="raw.githubusercontent.com/adammoi/vipies/main/xray"
# Link Hosting Kalian Untuk Websocket
Websocket="raw.githubusercontent.com/adammoi/vipies/main/websocket"


#SSH
wget https://${SIJA}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#XRAY
wget https://${XRAY}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
# Websocket
wget https://${websocket}/edu.sh && chmod +x edu.sh && ./edu.sh

rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/edu.sh


echo "3.0" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22, 2253"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5                : 443, 445"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAY Vmess TLS          : 8443"  | tee -a log-install.txt
echo "   - XRAY Vmess None TLS     : 8080"  | tee -a log-install.txt
echo "   - XRAY Vless TLS          : 6443"  | tee -a log-install.txt
echo "   - XRAY Vless None TLS     : 80"  | tee -a log-install.txt
echo "   - XRAY Trojan             : 2083"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
rm -f setup.sh
reboot
