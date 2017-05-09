# Docker-flood-ovpn

Inspired by [github.com/haugene/docker-transmission-openvpn/](https://github.com/haugene/docker-transmission-openvpn/)

Torrenting container running rtorrent+flood with OpenVPN.

### Usage
Todo
#### Run
Todo

```
docker run \
    --rm -ti \
    --name seedwhale \
    --privileged \
    --dns 8.8.8.8 --dns 8.8.4.4 \
    -v /opt/flood/data:/data \
    -v /opt/flood/config/:/config \
    -e OVPN_LOGIN="user" \
    -e OVPN_PASSWORD="password" \
    -e UID=1234 \
    -e GID=1234 \
    -e OVPN_CONFIG="file.ovpn" \
    -e FLOOD_SECRET="such-wow-secret" \
    -e RTORRENT_DOWNLOAD_RATE=1000 \
    -e RTORRENT_UPLOAD_RATE=500 \
    flood-vpn
```
Todo

#### Run proxy
Todo
```
docker run \
    --rm -ti \
    --name ovpn-proxy \
    --link seedwhale:flood \
    -p 8080:8080 \
    flood-proxy

```
Todo
