# DuckDNS container

>[Duck DNS](https://www.duckdns.org/)  is a free service which will point a DNS (sub domains of duckdns.org) to an IP of your choice.

### Environment variables
| Variable | Comment |
|----------|----------|
|`DUCK_DOMAIN`|This is your domain `xxxxxx.duckdns.org` or subdomain `xxxxxx`. Both works. You can also add multiples domains, just add a comma between each domain `xxxxxx;myblog.duckdns.org;home.duckdns.org`|
|`DUCK_TOKEN`|Your token. Something like this `a7c4d0ad-114e-40ef-ba1d-d217904a50f2`|
|`DUCK_IP`|*Optional*. To target a particular IP. Otherwise it will automatically assign the IP which you're running the container|
|`DUCK_REFRESH`|*Optional*. Cronjob to set how often to refresh (works in minutes). It is 5 minutes by default |

### Run sample
```
docker run \
    --rm \
    --name duckdns \
    -e DUCK_DOMAIN="mydomain.duckdns.org" \
    -e DUCK_TOKEN="a7c4d0ad-114e-40ef-ba1d-d217904a50f2" \
    -e DUCK_REFRESH="10" \
    -d \
    tweelon/duckdns
```
