# Scripts to build your debian package

## Quick Start

Use 'debianize.sh' to build your debian package in this directory. This is a fully functional example that you can run or you can
adapt it for your own purposes.

First you have to setup your package documentation for control file (needed by all debian packages). In order to do that
modify the variables in ['line 5 of debianize.sh'](https://github.com/diracktemplates/debianize_utils/blob/541730021c9eb20cbcc63211a47db61a3423a47b/build/debianize.sh#L5).

Variable BIN is the directory were your binary files or scripts are and 'debianize.sh' will install it in '/usr/bin' inside your package.
Variable MANUALS is the directory were your documentation is and 'debianize.sh' will install it in  '/usr/share/man' inside your package
(it is better to use 'man1' or conventional man program names for this directory. Please check program man documentation for linux).

After setup, run 'debianize.sh' script and your debian package will be generated in the current folder. You will be able to install it
on your system using DPKG.
