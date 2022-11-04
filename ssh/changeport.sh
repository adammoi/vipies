#!/bin/bash
# SL
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

clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "[1]. Change Port Vmess + Vless"
echo -e "[2]. Change Port Trojan"
echo -e "[3]. Change Port SSH WS HTTP"
echo -e "[4]. Change Port SSH WS TLS / SSL"
echo -e "[5]. Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "Select From Options [ 1-6 ] : " port
echo -e ""
case $port in
1)
portvlm
;;
2)
porttrojan
;;
3)
portsshnontls
;;
4)
portsshws
;;
5)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
