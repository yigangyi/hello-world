#!/bin/bash
cd /root/hello-world/
for((;;))
do
	ping -c 1 10.14.13.254 >/dev/null
	if [ $? -ne 0 ];then
		sleep 1m;
		curl --connect-timeout 20  --url https://codeload.github.com/yigangyi/hello-world/zip/master --output ./master.zip
		myip=$(unzip -p ./master.zip hello-world-master/myip);
		rm master.zip
		realip=$(curl --connect-timeout 10 --url ipv4.icanhazip.com |  grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}');
		if [ -z $realip ];then
			realip=$(curl www.net.cn/static/customercare/yourip.asp | grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}');
		fi
		if [[ "$myip" == "$realip" ]];then
			echo "=="
			sleep 30m
		elif [ ! -z $realip ];then
			echo $realip >myip;
			git commit -m 2020 myip;
			git commit -m 2020 commit.sh;
			git push;
			sleep 30m 
		else
			sleep 1m
		fi
	fi
	sleep 2m;
done
