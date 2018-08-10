FROM jessfraz/wireguard

RUN apk add --no-cache bash wget
RUN wget -O /bin/wg-quick https://git.zx2c4.com/WireGuard/plain/src/tools/wg-quick/linux.bash \
    && chmod +x /bin/wg-quick

COPY docker-entrypoint.sh /usr/bin/

VOLUME ["/etc/wireguard"]
EXPOSE 55555/udp

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["wg-quick", "up", "wg0"]
