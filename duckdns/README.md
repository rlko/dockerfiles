# DuckDNS container

>[Duck DNS](https://www.duckdns.org/)  is a free service which will point a DNS (sub domains of duckdns.org) to an IP of your choice.

### Environment variables
| Variable | Comment |
|----------|----------|
|`DUCK_DOMAIN`|This is your domain `xxxxxx.duckdns.org` or subdomain `xxxxxx`. It can both work|
|`DUCK_TOKEN`|Your token. Something like this `a7c4d0ad-114e-40ef-ba1d-d217904a50f2`|
|`DUCK_IP`|*Optional*. To target a particular IP|
|`DUCK_REFRESH`|*Optional*. Set how often to refresh (works in minutes). It is 5 minutes by default |
