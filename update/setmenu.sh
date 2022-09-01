#!/bin/bash
#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                   SYSTEM SETTING$wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y.  Add Or Change Subdomain Host For VPS"
echo -e "$yy 2$y.  Change Port Of Some Service"
echo -e "$yy 3$y.  Webmin Menu"
echo -e "$yy 4$y.  Check Usage of VPS Ram"
echo -e "$yy 5$y.  Reboot VPS"
echo -e "$yy 6$y.  Speedtest VPS"
echo -e "$yy 7$y.  Displaying System Information"
echo -e "$yy 8$y.  Info Script Auto Install"
echo -e "$yy 9$y.  Menu"
echo -e "$yy 10$y. Exit"
echo -e "$y-------------------------------------------------------------$wh"
echo -e ""
read -p "Select From Options [ 1 - 10 ] : " menu
echo -e ""
case $menu in
1)
addhost
;;
2)
changeport
;;
3)
wbmn
;;
4)
ram
;;
5)
reboot
;;
6)
speedtest
;;
7)
info
;;
8)
about
;;
9)
clear
menu
;;
10)
clear
exit
;;
*)
clear
menu
;;
esac
