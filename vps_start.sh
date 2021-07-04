sudo apt install python3-pip
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip
git clone https://github.com/dragonstrong/ubuntu-vps-/shadowsocks.json
sudo vim shadowsocks.json
ssserver -c shadowsocks -d start
