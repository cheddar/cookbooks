#!/bin/bash

PROGRAM=${0##*/}
LOG_FACILITY="local1"

exec 1> >(logger -i -p "${LOG_FACILITY}.info" -t "${PROGRAM}")
exec 2> >(logger -i -p "${LOG_FACILITY}.error" -t "${PROGRAM}")

(

	flock -n 9 || exit 1

	export DISTDIR="/var/cache/portage/distfiles.new"
	export PORTDIR="/var/cache/portage/zentoo"
	export PORTDIR_OVERLAY=""

	export GENTOO_MIRRORS="http://www.zentoo.org http://ftp.spline.de/pub/gentoo"
	export FEATURES="mirror lmirror"

	export FETCHCOMMAND="/usr/bin/wget -t 1 -T 5 -nv --passive-ftp -O \"\${DISTDIR}/\${FILE}\" \"\${URI}\""
	export RESUMECOMMAND="/usr/bin/wget -c -t 1 -T 5 -nv --passive-ftp -O \"\${DISTDIR}/\${FILE}\" \"\${URI}\""

	mkdir -p ${DISTDIR}

	pushd ${PORTDIR} > /dev/null

	git pull -q origin master

	for i in $(find . -name '*.ebuild'); do
		ebuild $i fetch
	done

	popd > /dev/null

	rsync -rltp --delete ${DISTDIR}/ ${DISTDIR/.new}/

	rm -rf ${DISTDIR}

) 9>/var/lock/${PROGRAM}.lock
