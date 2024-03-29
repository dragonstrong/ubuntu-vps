
# ubuntu 18下vps搭建指南

说明：不推荐买服务器搭，性价比低且不稳定，已弃用（可试试搬瓦工，听说还行，反正vultr不推荐）


1、**强烈推荐：fastlink，19元100G高速流量/月：[https://github.com/dragonstrong/clash](https://github.com/dragonstrong/clash)，也有便宜的见3**

2、[https://github.com/freefq/free](https://github.com/freefq/free),实时更新，关键免费，凑合用

3、现成机场，速度和稳定性都ok：[https://9.234456.xyz/abc.html?t=637626390496742785](https://9.234456.xyz/abc.html?t=637626390496742785)

4、免费VPN：[https://github.com/dragonstrong/ubuntu-vps-/blob/main/lantern.md](https://github.com/dragonstrong/ubuntu-vps-/blob/main/lantern.md)

## 搭建步骤

### 一、购买国外VPS

1、官网
[https://www.vultr.com/](https://www.vultr.com/)

2、vps配置截图
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218124113512.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)

### 二、配置VPS

1、本机通过ssh远程连接vps(国外服务器)

```
ssh username@IP                       #官网查看（上图）
输入密码                              

```
连接成功界面

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218124305245.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)

失败解决办法：
[https://liuyanzhao.com/6338.html](https://liuyanzhao.com/6338.html)
连接ssh提示IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218124406695.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)

删掉hosts文件后重试

```
sudo rm -rf ~/.ssh/known_hosts
```


2、配置vps
在登陆进去的远程界面（root@vultr:~#）输入命令

```
sudo apt install python3-pip   #安装pip
pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip  #安装Shadowsocks 3.0.0
ssserver --version           #检查是否为3.0.0版本
#显示Shadowsocks 3.0.0则进行下一步

########配置Shadowsocks
sudo vim /etc/shadowsocks.json   #创建配置文件shadowsocks.json并编辑
复制粘贴以下内容并适当修改：
####
{
    "server":"服务器ip",             (vultr官网)
    "server_port":6666,             （自定义）
    "local_address": "127.0.0.1",    （本地IP,维持127.0.0.1不变）
    "local_port":1080,                （本地端口，维持1080）
    "password":"连接密码",             (自定义)
    "timeout":300,                    
    "method":"rc4-md5"               （配成rc4-md5比其他方式网速更快）注意最后一句末尾没有逗号
}
###
###根据我的vps信息修改为：
{
    "server":"192.248.160.37",   
    "server_port":8010,    
    "local_address": "127.0.0.1",   
    "local_port":1080,                
    "password":"181181lq",            
    "timeout":300,                    
    "method":"rc4-md5"              
}

##启动Shadowsocks：（成功会有提示）
ssserver -c /etc/shadowsocks.json -d start

```



远程服务器配好后就可以关掉远程界面（root@vultr:~#）了。

### 三、ubuntu系统下shadowsockschain-qt5的安装和配置

**说明：ubuntu 20用下面的不行，可以直接把ubuntu-vps-/ubuntu 20 shadowsock client目录下的文件烤过去，然后改为可执行文件，chmod +x 赋权，双击运行即可**

1、安装

参考链接：[https://www.codetd.com/article/3092913](https://www.codetd.com/article/3092913)

```
sudo add-apt-repository ppa:hzwhuang/ss-qt5
###
执行上一句后报bionic Release错，因为qt5没有ubuntu 18的源，将bionic (18.04版本代号)改成xenial（16.04版本代号）
sudo gedit /etc/apt/sources.list.d/hzwhuang-ubuntu-ss-qt5-bionic.list
将hzwhuang-ubuntu-ss-qt5-bionic.list文件中的bionic修改为xenial，然后再执行下面两句命令就可装好
###
sudo apt-get update
sudo apt-get install shadowsocks-qt5

```

2、配置
ubuntu打开shadowsockschain-qt5 GUI界面,按照服务器shadowsocks.json的设置配置客户端（本机电脑）参数，连接远程服务器，一定要成功才能进行后续操作。此时将浏览器设置一下就能访问外网，但终端还不能。

客户端配置

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218124805626.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)

与vps连接成功

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218124824243.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)


### 四、让ubuntu终端走代理

参考链接：
[ubuntu终端走代理](https://blog.csdn.net/weixin_42135399/article/details/82706083?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-
1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control)

1、proxychains安装

```
git clone https://github.com/rofl0r/proxychains-ng #访问不了github可以windows上开vpn到github下载后拷贝到ubuntu，然后执行后续命令
cd proxychains-ng
sudo apt install gcc
./configure
make
sudo make install
sudo make install-config

##
若没装gcc,运行./configure报错
https://blog.csdn.net/jiugedexiaodi/article/details/92368546
####

```


2、修改修改配置文件proxychains.conf
###特别注意不是主目录下的etc，而是/usr/local/etc/proxychains.conf，把最后一句（带socks4的）修改成如下：
socks5  127.0.0.1 1080  

```
sudo gedit /usr/local/etc/proxychains.conf
```

3、使用代理
在要用代理的命令前面加"proxychains4"即可，如：
proxychains4 wget google.com
若配置代理成功，此句命令会有返回，否则没有

测试google的可访问性

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218125015484.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)

不用代理的IP和速度

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218125023903.png#pic_center)

使用代理的IP和速度（注意strict chain那一行，都从127.0.0.1:1080出）

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20210218125058710.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2RyYWdvbnN0cm9uZw==,size_16,color_FFFFFF,t_70#pic_center)


### 五、ubuntu浏览器走代理

参考链接：[ubuntu浏览器走代理]
(https://www.codetd.com/article/1790848)

1、下载插件SwitchyOmega 
[下载地址](https://proxy-switchyomega.com/download/#firefox-%E6%88%96%E5%9F%BA%E4%BA%8E-mozilla-%E7%9A%84%E6%B5%8F%E8%A7%88%E5%99%A8)

2、使用说明
proxy一栏设置为：  socks5 127.0.0.1 1080  ，点击应用选项保存。
使用时点击auto switch 
浏览器访问google发现还访问不了，这时再点蓝色图标，点开未加载的资源，然后模式选择proxy,点击添加条件。

### 六、window浏览器使用代理

1、下载ssr windows安装包
[下载地址](https://tlanyan.me/shadowsockr-shadowsocksr-shadowsocksrr-clients/)

2、配置好并连接

3、打开chrome浏览器设置中  
高级->系统->代理设置->手动设置代理如下
ip:   127.0.0.1
port: 1080




**说明：
vultr ip被墙，若还能ping通，改端口重启服务解决，但治根不治本,用不了多久。如有稳定又便宜的服务器推荐，请在issues留言，谢谢**
