#!/bin/bash
myip=$(cat myip);
realip=$(curl icanhazip.com);
if [ "$myip" = "$realip" ];then
  echo "=="
else 
  git commit -m 2020 myip;
  git commit -m 2020 mydns;
  git commit;
  git push;
  cat myip;
fi

