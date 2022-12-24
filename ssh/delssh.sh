#!/bin/bash
read -p "Username SSH to Delete : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "Username $Pengguna Telah Di Hapus"
else
        echo -e "Failure: Username $Pengguna Tidak Ada"
fi
