# Docker-flood-ovpn

Inspired by [github.com/haugene/docker-transmission-openvpn/](https://github.com/haugene/docker-transmission-openvpn/)

Torrenting container running [rtorrent](https://github.com/rakshasa/rtorrent)+[flood](https://github.com/jfurrow/flood) with OpenVPN.
Unlike haugene's docker, a .ovpn config file has to be provided on your own if you want to use vpn.

### Environment variables

#### OpenVPN
| Variable | Comment |
|----------|----------|
|`OVPN_CONFIG`|Is the config file you will use to connect on vpn, it is required for openvpn. **It must be placed in the `/config` volume**. Otherwise it will run without vpn|
|`OVPN_LOGIN`| To authenticate. If not specified it will try to connect without authentication|
|`OVPN_PASSWORD`| Same as `OVPN_LOGIN`|
#### flood
| Variable | Comment |
|----------|----------|
|`FLOOD_BASE_URI`| Is root by default|
|`FLOOD_SECRET`|**Change it!!**|
|`FLOOD_ENABLE_SSL`|*(I haven't tried actually)*. Must be placed in the `/config` volume|

#### rtorrent
| Variable | Comment |
|----------|----------|
|`RTORRENT_DOWNLOAD_RATE`|To set download limit at launch|
|`RTORRENT_UPLOAD_RATE`|To set upload limit at launch|

#### Owner
These variables are to fit permissions' volumes between host and container

| Variable | Comment |
|----------|----------|
|`UID`|To set the user id. It's root (0) by default|
|`GID`|To set the group id. It's root (0) by default|

### Volumes
*   `/data` : Torrents' downloads
*   `/config` : Flood's db and config files (.ovpn, cert, key)

### Example
#### Run
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
    -d \
    tweelon/flood-openvpn
```
###### Notes:
*   `--privileged` is necessary to make openvpn works.
*   `--dns` perhaps too. See [this](https://github.com/haugene/docker-transmission-openvpn/#known-issues-tips-and-tricks).
*   You may not access to the container even with `-p 3000:3000` because of the VPN. This is why we need a proxy. See [this](https://github.com/haugene/docker-transmission-openvpn/#access-the-webui) for further details

#### Run proxy
```
docker run \
    --rm -ti \
    --name ovpn-proxy \
    --link seedwhale:flood \
    -p 8080:8080 \
    -d \
    tweelon/flood-proxy

```
Once you've run the main container and the proxy container, you can now access to http://localhost:8080

### Post-deployment
You can watch what's going on inside the container by running:
*   `docker exec -it seedwhale bash`
*   `screen -ls` To list screen sessions
*   `script /dev/null`
*   `screen -r rtorrent` or `screen -r flood` or `screen -r openvpn`

### Stuff todo
*   docker-compose
*   complete docs
*   remove unnecessary stuff
*   migrate to alpine
*   gitgud
*   make torrenting free again
