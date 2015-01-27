#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`; pwd)
RESRC=$CUR_DIR/../resource
set -e

apt-get install iptables --force-yes

cp $RESRC/iptables.conf /etc/iptables.conf
cp $RESRC/iptables.up.sh /etc/network/if-pre-up.d/iptables.up.sh

chmod 644 /etc/iptables.conf
chmod 744 /etc/network/if-pre-up.d/iptables.up.sh

bash /etc/network/if-pre-up.d/iptables.up.sh

