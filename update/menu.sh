#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                  MENU UTAMA $wh"
echo -e "$y            Script Mod By ADAM SIJA $wh"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  SSH & OpenVPN MENU  $wh"
echo -e "$yy 2$y.  XRAY VMESS MENU$wh"
echo -e "$yy 3$y.  XRAY VLESS MENU$wh"
echo -e "$yy 4$y.  XRAY TROJAN MENU$wh"
echo -e "$yy 5$y.  TROJAN GO MENU$wh"
echo -e "$yy 6$y.  XRAY GRPC MENU$wh"
echo -e "$yy 7$y.  CEK SEMUA SERVICE VPN$wh"
echo -e "$yy 8$y.  UPDATE MENU (2x)$wh"
echo -e "$yy 9$y.  Settings (Pengaturan)$wh"
echo -e "$yy 10$y. Exit (Keluar)$wh"
echo -e "$yy 11$y. menuinfo (Untuk Mendapatkan Informasi)$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 11 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
vmessmenu
;;
3)
clear
vlessmenu
;;
4)
clear
trmenu
;;
5)
clear
trgomenu
;;
6)
clear
grpcmenu
;;
7)
clear
running
;;
8)
clear
updatemenu
;;
9)
clear
setmenu
;;
10)
clear
exit
;;
11)
clear
menuinfo
;;
*)
clear
menu
;;
esac
