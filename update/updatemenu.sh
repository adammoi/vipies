#!/bin/bash
# ==========================================
# Color
# hapus menu
rm -rf menu
rm -rf sshovpnmenu
rm -rf vmessmenu
rm -rf vlessmenu
rm -rf grpcmenu
rm -rf grpcupdate
rm -rf trmenu
rm -rf trgomenu
rm -rf setmenu
rm -rf running

# download menu
cd /usr/bin
rm -rf menu
rm -rf menuinfo
wget -O menu "https://raw.githubusercontent.com/adammoi/vipies/main/update/menu.sh"
wget -O sshovpnmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/sshovpn.sh"
wget -O vmessmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/vmessmenu.sh"
wget -O vlessmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/vlessmenu.sh"
wget -O grpcmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/grpcmenu.sh"
wget -O grpcupdate "https://raw.githubusercontent.com/adammoi/vipies/main/update/grpcupdate.sh"
wget -O trmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/trmenu.sh"
wget -O trgomenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/trgomenu.sh"
wget -O setmenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/setmenu.sh"
wget -O running "https://raw.githubusercontent.com/adammoi/vipies/main/update/running.sh"
wget -O updatemenu "https://raw.githubusercontent.com/adammoi/vipies/main/update/updatemenu.sh"
wget -O slhost "https://raw.githubusercontent.com/adammoi/vipies/main/ssh/slhost.sh"


chmod +x slhost
chmod +x menu
chmod +x sshovpnmenu
chmod +x vmessmenu
chmod +x vlessmenu
chmod +x grpcmenu
chmod +x grpcupdate
chmod +x trmenu
chmod +x trgomenu
chmod +x setmenu
chmod +x running
chmod +x updatemenu