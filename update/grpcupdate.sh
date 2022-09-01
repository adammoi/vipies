#!/bin/bash
# ==========================================
# ==========================================
# 
cd

cd /usr/bin

wget -O addgrpc "https://raw.githubusercontent.com/adammoi/vipies/main/grpc/addgrpc.sh"
wget -O cekgrpc "https://raw.githubusercontent.com/adammoi/vipies/main/grpc/cekgrpc.sh"
wget -O delgrpc "https://raw.githubusercontent.com/adammoi/vipies/main/grpc/delgrpc.sh"
wget -O renewgrpc "https://raw.githubusercontent.com/adammoi/vipies/main/grpc/renewgrpc.sh"


chmod +x addgrpc
chmod +x delgrpc
chmod +x cekgrpc
chmod +x renewgrpc

cd
