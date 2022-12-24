#!/bin/bash
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
