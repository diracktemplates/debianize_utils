#!/bin/bash

PACKAGENAME=sayhello
VERSION=0.1.0
BIN=./sayhello
MANUALS=

DESCRIPTION=

CONTROL="Package: ${PACKAGENAME:=mypackage}
Version: ${VERSION:=0.1.0}
Architecture: all
Priority: optional
Essential: no
Maintainer: Rodolfo A C Neves (Dirack) <https://www.geofisicando.com>
Original-Maintainer: GPGEOF <https://github.com/gpgeof>
Bugs: https://github.com/Dirack/Shellinclude/issues
Homepage: https://github.com/Dirack/Shellinclude/wiki
Depends: bash
Description: ${DESCRIPTION:=Just a test! :)}
"

mkdir -p ${PACKAGENAME}_${VERSION}_all/DEBIAN

echo "$CONTROL" > ${PACKAGENAME}_${VERSION}_all/DEBIAN/control

if [ -n "$BIN" ]
then
	if [ -f "$BIN" ]
	then
		mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/bin
		cp ${BIN} ${PACKAGENAME}_${VERSION}_all/usr/bin
	else if [ -d "$BIN" ]
	then
		cp ${BIN} ${PACKAGENAME}_${VERSION}_all/usr/bin
	fi
fi

if [ -n "$MANUALS" ]
then
	if [ -f "$MANUALS" ]
	then
		mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/share/man/man1
		cp ${MANUALS} ${PACKAGENAME}_${VERSION}_all/usr/share/man/man1
	else if [ -d "$MANUALS" ]
	then
		cp ${MANUALS} ${PACKAGENAME}_${VERSION}_all/usr/share/man/man1
	fi
fi


# Build using the following command
dpkg-deb -b ${PACKAGENAME}_${VERSION}_all
