#!/bin/sh
DEFAULT_ROUTE_IP=`ip route | grep default |awk '{ print $3}'`
DEFAULT_ROUTE_IP=${DEFAULT_ROUTE_IP:-"172.17.0.1"}
VPN_SERVER_IP=`dig $VPN_SERVER +short | grep ^[0-9]| head -n 1 | sed s'/$//'`
VIRTUAL_HUB=${VIRTUAL_HUB:-"DEFAULT"}
VPN_SERVER=${VPN_SERVER_IP:-"$VPN_SERVER"}
VPN_PORT=${VPN_PORT:-"5555"}
TAP_IPADDR=${TAP_IPADDR:-""}
ACCOUNT_NAME=${ACCOUNT_NAME:-"DEFAULT"}
ACCOUNT_USER=${ACCOUNT_USER:-"username"}
ACCOUNT_PASS=${ACCOUNT_PASS:-"password"}

ACCOUNT_PASS_TYPE=standard
VPNCMD="/usr/local/vpnclient/vpncmd localhost /CLIENT /CMD"

/usr/local/vpnclient/vpnclient start

sleep 2

$VPNCMD NicList $VIRTUAL_HUB
$VPNCMD NicCreate $VIRTUAL_HUB
$VPNCMD NicEnable $VIRTUAL_HUB
$VPNCMD AccountCreate $ACCOUNT_NAME /SERVER:$VPN_SERVER:$VPN_PORT /HUB:$VIRTUAL_HUB /USERNAME:$ACCOUNT_USER /NICNAME:$VIRTUAL_HUB
$VPNCMD AccountPasswordSet $ACCOUNT_NAME /PASSWORD:$ACCOUNT_PASS /TYPE:$ACCOUNT_PASS_TYPE
$VPNCMD AccountConnect $ACCOUNT_NAME

sleep 3

TAP_DEVICE=$(cd /sys/class/net; echo vpn_*)
case ${TAP_IPADDR} in
	dhcp)
		dhcpcd -4 $TAP_DEVICE
		;;
	none)
		;;
	*)
		ip addr add $TAP_IPADDR dev $TAP_DEVICE
		;;
esac

sleep 3
tail -F /usr/local/vpnclient/client_log/*.log &
sleep 1
ip route add $VPN_SERVER/32 via $DEFAULT_ROUTE_IP
ip route delete default via $DEFAULT_ROUTE_IP
echo "nameserver 8.8.8.8" > /etc/resolv.conf

set +e
while pgrep vpnclient > /dev/null; do sleep 1; done
set -e
