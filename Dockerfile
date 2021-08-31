
FROM debian:buster
MAINTAINER Haixin Lee <docker@lihaixin.name>

#ENV VERSION v4.24-9651-beta-2017.10.23
ENV VERSION v4.38-9760-rtm-2021.08.17
WORKDIR /usr/local/vpnclient

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y -q install iptables gcc make wget dhcpcd5 tar net-tools iftop mtr tmux psmisc curl iputils-ping iproute2 unzip procps figlet dnsutils && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
    wget http://www.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Client/64bit_-_Intel_x64_or_AMD64/softether-vpnclient-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnclient.tar.gz &&\
    tar -xzvf /tmp/softether-vpnclient.tar.gz -C /usr/local/ && \
    rm /tmp/softether-vpnclient.tar.gz && \
    make && \
    apt-get purge -y -q --auto-remove gcc make wget
ADD ./.bashrc /root/.bashrc 
ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
