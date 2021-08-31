#!/bin/bash

if [ -t 1 ]; then
	export PS1="\e[1;34m[\e[1;33m\u@\e[1;32mdocker-\h\e[1;37m:\w\[\e[1;34m]\e[1;36m\\$ \e[0m"
fi

# Aliases
alias l='ls -lAsh --color'
alias ls='ls -C1 --color'
alias cp='cp -ip'
alias rm='rm -i'
alias mv='mv -i'
alias h='cd ~;clear;'
alias localip='time curl ipinfo.io'
alias speedtest='time curl -o /dev/null http://cachefly.cachefly.net/10mb.test'

. /etc/os-release

echo -e -n '\E[1;34m'
figlet -w 120 "softether client"
echo "#softether client,可以拨号vpngate,使用容器网络配合lihaixin/softether和lihaixin/xray可以配置vpn和s5输出"
echo "默认远程链接端口为9930"
echo "输入<localip>查看本容器出口IP"
echo "输入<speedtest>查看本容器下载速度"
echo -e -n '\E[1;34m'
echo -e '\E[0m'
