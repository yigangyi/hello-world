#!/bin/bash
myip=$(cat myip);
realip=$(curl icanhazip.com);
if [ "$myip" = "$realip" ];then
  echo "=="
else
  echo $realip >myip;
  git commit -m 2020 mydns;
  git commit -m 2020 myip;
  git commit -m 2020 commit.sh;
  git push;
  cat myip;
fi

