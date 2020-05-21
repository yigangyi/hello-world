#!/bin/bash
for((;;))
do
  myip=$(cat myip);
  realip=$(curl -s icanhazip.com);
  if [ "$myip" = "$realip" ];then
    echo "=="
  elif [ ! -z $realip ];then
    echo $realip >myip;
    git commit -m 2020 mydns;
    git commit -m 2020 myip;
    git commit -m 2020 commit.sh;
    git push;
    cat myip;
  else
    break;
  fi
  sleep 2h
done
