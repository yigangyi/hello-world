#!/bin/bash
cd /home/wuyun/Desktop/hello-world/
for((;;))
do
  myip=$(cat myip);
  #realip=$(curl --connect-timeout 10 --url icanhazip.com);
  #realip=$(curl --connect-timeout 10 --url ifconfig.me);
  realip=$(curl --connect-timeout 10 --url ipinfo.io/ip);
  if [ "$myip" = "$realip" ];then
    echo "=="
    sleep 30m
  elif [ ! -z $realip ];then
    echo $realip >myip;
    git commit -m 2020 mydns;
    git commit -m 2020 myip;
    git commit -m 2020 commit.sh;
    git push;
    cat myip;
    sleep 12h
  else
    sleep 1m
  fi
done
