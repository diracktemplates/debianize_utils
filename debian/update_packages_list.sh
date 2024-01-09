#!/bin/bash

# This is a script to update the Packages list with the following command
dpkg-scanpackages -m . /dev/null > Packages

DIR="$( dirname -- "${BASH_SOURCE[0]}"; )";   # Get the directory name
DIR="$( realpath -e -- "$DIR"; )";    # Resolve its full path if need be
echo "Add this line to your '/etc/apt/sources.list' to turn this directory into a debian repository:"
echo -e "\033[95mdeb [trusted=yes] file://$DIR ./\033[m"

echo "Or use the following command to install a package throughout dpkg"
echo -e "\033[95m'sudo dpkg -i mypackage.deb'\033[m"
