divert(-1)
define(`ifenabled', `ifelse(index(PACKAGES, `$1'), -1, `dnl', `$2')')

divert`'dnl
dnl --------------------------------------------------------------------------
gcc-defaults for Debian
-----------------------

Provide the architecture specific defaults for the compilers of the
GNU compiler collection (gcc).

The default compiler versions for Debian GNU/OS_NAME on DEB_ARCH are
(minor version numbers omitted):

	cpp	- cpp-V_CPP	(package cpp-PV_CPP)
	gcc	- gcc-V_GCC	(package gcc-PV_GCC)
ifenabled(`c++',`	g++	- g++-V_GPP	(package g++-PV_GPP)')
ifenabled(`fortran',`	g77	- g77-V_G77	(package g77-PV_G77)')
ifenabled(`java',`	gcj	- gcj-V_GCJ	(package gcj-PV_GCJ)')
ifenabled(`java',`	gij	- gij-V_GIJ	(package gij-PV_GIJ)')
ifenabled(`objc',`	gobjc	- gcc-V_GOBJC	(package gobjc-PV_GOBJC)')
ifenabled(`pascal',`	gpc	- gpc-V_GPC	(package gpc-PV_GPC)')
ifenabled(`chill',`	chill	- chill-V_CHILL	(package chill-PV_CHILL)')

Documentation for the default compilers can be found in

	/usr/share/doc/<compiler>-<package version>.

-- Matthias Klose <doko@debian.org>  Fri, 29 Dec 2000 19:12:08 +0100
