FROM debian:buster
MAINTAINER Haixin Lee <docker@lihaixin.name>

ENV VERSION=4.38-9760-rtm
WORKDIR /usr/local/vpnclient

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y -q install iptables gcc make wget tar unzip dhcpcd5 iproute2 curl psmisc iputils-ping mtr procps net-tools iftop mtr tmux figlet && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
    wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v${VERSION}/softether-vpnclient-v${VERSION}-2021.08.17-linux-x64-64bit.tar.gz -O /tmp/softether-vpnclient.tar.gz &&\
    tar -xzvf /tmp/softether-vpnclient.tar.gz -C /usr/local/ && \
    rm /tmp/softether-vpnclient.tar.gz && \
    make  && \
    apt-get purge -y -q --auto-remove gcc make tar wget && \
    update-alternatives --set iptables /usr/sbin/iptables-legacy && \
    update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy 
ADD ./.bashrc /root/.bashrc
ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
