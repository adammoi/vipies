#!/bin/bash
clear
echo -e "[ INFO ] Start " 
sleep 0.5
systemctl stop nginx
domain=$(cat /var/lib/SIJA/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING ] Detected port 80 used by $Cek " 
systemctl stop $Cek
echo -e "[ INFO ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ INFO ] Starting renew cert... " 
sleep 0.5
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ INFO ] Renew cert done... " 
sleep 0.5
echo -e "[ INFO ] Starting service $Cek " 
sleep 0.5
echo $domain > /etc/xray/domain
systemctl restart $Cek
systemctl restart nginx
echo -e "[ INFO ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
