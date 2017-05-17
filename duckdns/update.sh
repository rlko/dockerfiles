#!/bin/sh

if [ -z "$DUCK_SUBDOMAIN" ]; then
    echo "DUCK_SUBDOMAIN not set"
fi

if [ -z "$DUCK_TOKEN" ]; then
    echo "DUCK_TOKEN not set"
fi

if [ -n "$DUCK_SUBDOMAIN" ] && [ -n "$DUCK_TOKEN" ]; then
    echo url="https://www.duckdns.org/update?domains=$DUCK_SUBDOMAIN.duckdns.org&token=$DUCK_TOKEN&ip=$DUCK_IP" | curl -k -K - -o /duck.log
fi
