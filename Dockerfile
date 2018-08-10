FROM jessfraz/wireguard

ENV WG_QUICK_URL https://git.zx2c4.com/WireGuard/plain/src/tools/wg-quick/linux.bash

RUN apk add --no-cache bash wget openresolv
RUN wget -O /bin/wg-quick $WG_QUICK_URL \
    && chmod +x /bin/wg-quick

COPY docker-entrypoint.sh /usr/bin/

VOLUME ["/etc/wireguard"]
EXPOSE 38945/udp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["wg-quick", "up", "wg0"]
