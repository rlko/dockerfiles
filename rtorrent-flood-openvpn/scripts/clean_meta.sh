#!/bin/sh

DIR="/data/torrents"
find $DIR -name \*.meta -mtime +1 -type f -delete
