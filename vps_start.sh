sudo apt install python3-pip
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip
sudo vim /etc/shadowsocks.json
ssserver -c shadowsocks -d start
