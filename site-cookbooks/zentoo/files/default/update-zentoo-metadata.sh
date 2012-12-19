#!/bin/bash

PROGRAM=${0##*/}
LOG_FACILITY="local1"

exec 1> >(logger -i -p "${LOG_FACILITY}.info" -t "${PROGRAM}")
exec 2> >(logger -i -p "${LOG_FACILITY}.error" -t "${PROGRAM}")

(

	flock -n 9 || exit 1

	export PORTDIR="/var/cache/portage/zentoo"

	pushd ${PORTDIR} > /dev/null
	git fetch -q origin
	git reset --hard origin/master
	./scripts/sync-local-cache > /dev/null
	popd > /dev/null

	export PORTDIR="/var/cache/portage/zentoo-next"

	pushd ${PORTDIR} > /dev/null
	git fetch -q origin
	git reset --hard origin/next
	./scripts/sync-local-cache > /dev/null
	popd > /dev/null

) 9>/var/lock/${PROGRAM}.lock
