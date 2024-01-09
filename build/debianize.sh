#!/bin/bash

PACKAGENAME=sayhello
VERSION=0.1.0
BIN=../sayhello

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

mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/bin

if [ -n "$BIN" ]
then
	cp ${BIN} ${PACKAGENAME}_${VERSION}_all/usr/bin
fi

# Build using the following command 'dpkg-deb -b ${PACKAGENAME}_${VERSION}_all'
