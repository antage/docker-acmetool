# acmetool

This is acmetool in docker container.
Based on debian:stable.

## Building

Run `make docker`. This command will create docker container with `acmetool`
in `/usr/local/bin/` path. The container is tagged as `acmetool`.

## Exposed ports

None.

## External directories

* `/var/lib/acme`
* `/usr/lib/acme/hooks` (useless)

## Environment variables

* `CREATE_USER_UID` (uid value of the user `acme`)
* `CREATE_GROUP_GID` (gid value of the group `acme`)
* `RUN_AS_USER` (`nobody` by default)
* `RUN_AS_GROUP` (`nogroup` by default)
