# WireGuard in Docker

## How to run this image

-   a host with WireGuard support in the kernel is needed
-   a `wg-quick` style config file needs to be mounted at
    `/etc/wireguard/wg0.conf`

### Example command

```
docker run \
    -v "$(pwd)":/etc/wireguard -p 55555:55555 \
    --cap-add NET_ADMIN \
    --tty --interactive \
    felixfischer/wireguard:latest
```
