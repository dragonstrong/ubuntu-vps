# ubuntu-vps-
ubuntu下vps搭建指南
Vps代理服务器搭建指南(基于ubuntu18)
一、购买国外VPS
1、官网
https://www.vultr.com/
2、vps配置截图
 
二、配置VPS
1、本机通过ssh连接远程vps(国外服务器)
 
连接成功界面
失败解决办法：
https://liuyanzhao.com/6338.html
连接ssh提示IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY
 
删掉hosts文件后重试



2、配置vps
在登陆进去的远程界面（root@vultr:~#）输入命令




自此远程服务器端已配好，ssh相当于向日葵或xshell，方便在自己电脑上操作远程服务器，配完就可以关掉远程界面（root@vultr:~#）。
三、ubuntu系统下shadowsockschain-qt5的安装和配置
1、安装
链接：https://www.codetd.com/article/3092913
2、配置
ubuntu打开shadowsockschain-qt5 GUI界面,按照服务器shadowsocks.json的设置配置客户端（本机电脑）参数，连接远程服务器，一定要成功才能进行后续操作。此时将浏览器设置一下就能访问外网，但终端还不能。

 
客户端配置


 
与vps连接成功
四、ubuntu终端走代理
参考链接：
https://blog.csdn.net/weixin_42135399/article/details/82706083?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control
1、proxychains安装





2、修改配置文件proxychains.conf
###特别注意不是主目录下的etc，而是/usr/local/etc/proxychains.conf，把最后一句（带socks4的）修改成如下：
socks5  127.0.0.1 1080  #1080改为你自己的端口
3、使用代理
在要用代理的命令前面加"proxychains4"即可，如：
proxychains4 wget google.com
若配置代理成功，此句命令会有返回，否则没有
 
测试google的可访问性
 
不用代理的IP和速度
 
使用代理的IP和速度（注意strict chain那一行，都从127.0.0.1:1080出）
五、ubuntu浏览器走代理
参考链接：https://www.codetd.com/article/1790848
1、下载插件SwitchyOmega 
https://proxy-switchyomega.com/download/#firefox-%E6%88%96%E5%9F%BA%E4%BA%8E-mozilla-%E7%9A%84%E6%B5%8F%E8%A7%88%E5%99%A8
2、使用说明
proxy一栏设置为：socks5 127.0.0.1 1080，点击应用选项保存。
使用时点击auto switch 
浏览器访问google发现还访问不了，这时再点蓝色图标，点开未加载的资源，然后模式选择proxy,点击添加条件。
六、window浏览器使用代理
1、下载ssr windows安装包
https://tlanyan.me/shadowsockr-shadowsocksr-shadowsocksrr-clients/
2、配置好并连接
2、打开chrome浏览器设置中  
高级→系统→代理设置→手动设置代理如下
ip:   127.0.0.1
port: 1080


参考图：

 
Vps配置

 
查看代理并取消代理命令
