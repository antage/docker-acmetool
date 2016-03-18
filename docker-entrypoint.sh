#!/bin/bash

if [ "$CREATE_USER_UID" -a "$CREATE_GROUP_GID" ]; then
	echo "Create 'acme' group with GID=$CREATE_GROUP_GID"
	groupadd -g $CREATE_GROUP_GID acme
	echo "Create 'acme' user with UID=$CREATE_USER_UID, GID=$CREATE_GROUP_GID"
	useradd -d /var/lib/acme -g $CREATE_GROUP_GID -s /bin/false -M -N -u $CREATE_USER_UID acme
fi

if [ "$1" = 'acmetool' ]; then
	exec gosu ${RUN_AS_USER:-nobody}:${RUN_AS_GROUP:-nogroup} /usr/local/bin/acmetool ${@:2}
fi

exec "$@"
