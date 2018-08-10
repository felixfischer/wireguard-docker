#!/bin/bash

if ! compgen -G "/etc/wireguard/*.conf" > /dev/null; then
    echo "no config file at /etc/wireguard/*.conf – creating demo config"
    wget -q -O /client-quick.sh https://git.zx2c4.com/WireGuard/plain/contrib/examples/ncat-client-server/client-quick.sh
    #cat /client-quick.sh
    bash /client-quick.sh > /dev/null
    cd /etc/wireguard && umask 077
    # replace unhelpful values
    awk '/PrivateKey/ { print; print "ListenPort = 38945"; next }1' demo.conf > wg0.conf
    sed -i "s/0\.0\.0\.0\/0/192.168.4.1\/24/g" wg0.conf
fi

/bin/bash "$@"

wg show

# check if Wireguard is running
if [[ $(wg) ]]
then
    syslogd -n      # keep container alive
else
    echo "stopped"  # else exit container
fi
