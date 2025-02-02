# Debian packages repository

This is a local debian packages repository. They
are open source software, so feel free to share and modify them.

- Maintainer: Rodolfo A C Neves (Dirack) - rodolfo_profissional@hotmail.com

## Quick Start

First, put all your debian packages here to use that directory as a local debian package repository.

You can use the script 'update_packages_list.sh' to create and update the packages list of this repository using dpkg.
Every debian packages repository has a packages list
that apt will use to update its own list and cache.

To let apt aware of this repository you will have to add this to apt sources list as follows.

### How to add this repository to your sources.list?

To add this repository to your apt repositories add the following line to your '/etc/apt/sources.list' file:

```sh
deb [trusted=yes] <pathToThisDirectory> ./
```

Update packages list with:

```sh
sudo apt update
```

Now you can download all of the packages available in this repository using apt as follows:

```sh
sudo apt install <package>
```

And if you need a specific release use:

```sh
sudo apt install <package>=<release>
```

### Get packages List

After adding this repository to your 'sources.list' following the steps above, you are able to get this repository
packages list as follows:

```sh
grep -e Package: /var/lib/apt/lists/gpgeof.github.io_debian_*_Packages | sed 's/Package: //' | xargs -I % bash -c 'apt-cache search %'
```

This command will exhibit a list and a brief explanation of each package available in this repository.
To get more information about a specific package use the following command:

```sh
apt show <package>
```
