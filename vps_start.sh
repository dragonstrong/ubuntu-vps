sudo apt install python3-pip
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip
sudo vim shadowsocks.json
ssserver -c shadowsocks.json -d start
