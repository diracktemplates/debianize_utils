#!/bin/bash

# Script for building a debian package using DPKG

# Set up the following variables based on your package
PACKAGENAME=sayhello
VERSION=0.1.0
BIN=bin
MANUALS="docs/man1"
DESCRIPTION="My description"
MANTAINER="Fulano <http://www.google.com>"
ORIGINAL_MANTAINER=
BUGS="<http://www.google.com>"
HOMEPAGE="<http://www.google.com>"
DEPENDS="bash"

CONTROL="Package: ${PACKAGENAME:=mypackage}
Version: ${VERSION:=0.1.0}
Architecture: all
Priority: optional
Essential: no
Maintainer: ${MANTAINER:='Rodolfo A C Neves (Dirack) <https://www.geofisicando.com>'}
Original-Maintainer: ${MANTAINER:='GPGEOF <https://github.com/gpgeof>'}
Bugs: ${BUGS:='GPGEOF \<https://github.com/gpgeof\>'}
Homepage: ${HOMEPAGE:='GPGEOF <https://github.com/gpgeof>'}
Depends: ${DEPENDS:='bash'}
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
	elif [ -d "$BIN" ]
	then
		mkdir -p ${PACKAGENAME}_${VERSION}_all/usr
		cp ${BIN} ${PACKAGENAME}_${VERSION}_all/usr
	fi
fi

if [ -n "$MANUALS" ]
then
	if [ -f "$MANUALS" ]
	then
		mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/share/man/man1
		cp ${MANUALS} ${PACKAGENAME}_${VERSION}_all/usr/share/man/man1
	elif [ -d "$MANUALS" ]
	then
		mkdir -p ${PACKAGENAME}_${VERSION}_all/usr/share/man
		cp -r ${MANUALS} ${PACKAGENAME}_${VERSION}_all/usr/share/man
	fi
fi


# Build using the following command
dpkg-deb -b ${PACKAGENAME}_${VERSION}_all
