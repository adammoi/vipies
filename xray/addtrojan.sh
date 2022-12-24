#!/bin/bash
clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "           TROJAN ACCOUNT          "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
		echo -e "           TROJAN ACCOUNT          "
		echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "           TROJAN Account           " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Remarks        : ${user}" | tee -a /etc/log-create-user.log
echo -e "Host/IP        : ${domain}" | tee -a /etc/log-create-user.log
echo -e "port           : ${tr}" | tee -a /etc/log-create-user.log
echo -e "Key            : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Path           : /trojan-ws" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link WS        : ${trojanlink}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
