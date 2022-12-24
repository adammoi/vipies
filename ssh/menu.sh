#!/bin/bash
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Getting CPU Information
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
tram=$( free -m | awk 'NR==2 {print $2}' )
clear 
echo -e "                                                           "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "		   	Bug ? Rebuild lagilah..."
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " █████╗ ██████╗  █████╗ ███╗   ███╗    ███████╗██╗     ██╗ █████╗" 
echo -e "██╔══██╗██╔══██╗██╔══██╗████╗ ████║    ██╔════╝██║     ██║██╔══██╗"
echo -e "███████║██║  ██║███████║██╔████╔██║    ███████╗██║     ██║███████║"
echo -e "██╔══██║██║  ██║██╔══██║██║╚██╔╝██║    ╚════██║██║██   ██║██╔══██║"
echo -e "██║  ██║██████╔╝██║  ██║██║ ╚═╝ ██║    ███████║██║╚█████╔╝██║  ██║"
echo -e "╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝    ╚══════╝╚═╝ ╚════╝ ╚═╝  ╚═╝"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "                                                                                         "
echo -e "Operating System     :  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "Total Amount Of RAM  :  $tram MB"
echo -e "System Uptime        :  $uptime "
echo -e "Isp Name             :  $ISP"
echo -e "City                 :  $CITY"
echo -e "Domain               :  $domain"	
echo -e "Ip Vps               :  $IPVPS"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "                 • SCRIPT MENU •                 "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " [•1] SSH & OpenVPN Menu  [•5] SYSTEM Menu"
echo -e " [•2] Vmess Menu          [•6] Status Service"
echo -e " [•3] Vless Menu          [•7] Clear Log"
echo -e " [•4] Trojan Go Menu      [•8] Trojan Menu"                  
echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trgo ;;
5) clear ; m-system ;;
6) clear ; running ;;
7) clear ; clearlog ;;
8) clear ; m-trojan ;;
x) exit ;;
esac
