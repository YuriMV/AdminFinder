#!/bin/bash
#by vold
clear
wget https://gist.githubusercontent.com/YuriMV/da83ee70e436b3ba2bd5f8eeba118e51/raw/3bfa2a541fd2f05cfceabd5b17f1b894ecd193ab/painel.txt 2>/dev/null
rm -rf painel.txt.1 2>/dev/null
read -p "Digite o site: " site
printf "\n"
  for i in `cat painel.txt`
  do
    curlvar=$(curl -s -o /dev/null -w "%{http_code}" $site/$i)
        if [ "$curlvar" = "301" ] || [ "$curlvar" = "302" ] || [ "$curlvar" = "201" ]
          then
          echo -n "Encontrado : \033[04;34m$site/$i\n\033[0m"
          break
           else
          echo -n "\033[05;31mNao encontrou!\n"
          fi
          done
