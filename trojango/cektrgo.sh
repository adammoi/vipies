#!/bin/bash
clear 
echo -n > /tmp/other.txt 
data=(`cat /etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`) ; 
echo -e "┌─────────────────────────────────────────────────┐" 
echo -e "│              • TROJANGO USER ONLINE •             │"
echo -e "└─────────────────────────────────────────────────┘" 
echo -e "┌─────────────────────────────────────────────────┐" 
for akun in "${data[@]}" 
do
if [[ -z "$akun" ]] ; then 
account="none"
fi
echo -n > /tmp/iptrojango.txt 
data2=(`cat /etc/trojan-go/akun.conf | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`) ; 
for ip in "${data2[@]}" 
do

jum=$(cat /etc/trojan-go/akun.conf | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq) 
if [[ "$jum" = "$ip" ]] ; then 
echo "$jum" >> /tmp/iptrojango.txt 
else
echo "$ip" >> /tmp/other.txt 
fi
jum2=$(cat /tmp/iptrojango.txt ) 
sed -i "/$jum2/d" /tmp/other.txt > /dev/null  2>&1 
done 

day=$(cat /tmp/iptrojango.txt ) 
if [[ -z "$jum" ]] ;  then 
echo > /dev/null 
else 
jum2=$(cat /tmp/iptrojango.txt | nl ) 
echo -e "│     user :  $akun                               |" ; 
echo -e "│     $jum2                                       |" ; 
fi 
rm -rf /tmp/iptrojango.txt 
done 

rm -rf /tmp/other.txt 
echo -e "└─────────────────────────────────────────────────┘"  
echo -e "┌────────────────────── BY ───────────────────────┐" 
echo -e "│                  • ADAM SIJA •                  │"
echo -e "└─────────────────────────────────────────────────┘"  
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-trojango
