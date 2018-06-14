#!/bin/bash
newaliases
postfix start
syslog-ng
exec docker-entrypoint.sh "$@"
