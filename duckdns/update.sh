#!/bin/sh

if [ -z "$DUCK_DOMAIN" ]; then
    echo "DUCK_DOMAIN not set"
fi

if [ -z "$DUCK_TOKEN" ]; then
    echo "DUCK_TOKEN not set"
fi

if [ -n "$DUCK_DOMAIN" ] && [ -n "$DUCK_TOKEN" ]; then
    echo url="https://www.duckdns.org/update?domains=$DUCK_DOMAIN&token=$DUCK_TOKEN&ip=$DUCK_IP" | curl -k -K - -o /duck.log
fi
