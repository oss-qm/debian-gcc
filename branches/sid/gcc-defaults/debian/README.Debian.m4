divert(-1)
define(`ifenabled', `ifelse(index(PACKAGES, `$1'), -1, `dnl', `$2')')

divert`'dnl
dnl --------------------------------------------------------------------------
		The Debian GNU Compiler Collection Setup
		========================================

Abstract
--------

Debian 3.1 (sarge) is (mostly) built using the GCC 3.3.x compiler
collection.  As some packages have not yet been ported to GCC 3.3, the
gcc-2.95 compiler is still available on all major platforms (gcc-2.96
on ia64, gcc-3.0 on hppa).  Also, the gcc 2.7.2.3 C compiler is still
available for compatibility reasons (e.g. for building Linux 2.0.xx
kernels).

Debian has made some modifications to its packed GCC versions, which are
summarised at the end of /usr/share/doc/gcc-<version>/README.Debian.


Introduction
------------

Debian 3.1 has three/four (if 3.4 gets in) main sets of compiler
(related) packages:

- One based on GCC-3.3.x. These include the compilers g++, gobjc, g77,
  gcj, gnat, gpc, treelang and libraries libstdc++5(-dev), libobjc1,
  libgcj4(-dev) and libgcc1.
  On all architectures, this is the preferred C compiler which
  is called `gcc'.

- One based on gcc-2.95. These include the compilers g++, gobjc,
  g77, chill and gpc and libraries libstdc++2.10(-dev), libg++2.8.1.3(-dev).
  gcc-2.95 is available on all architectures except ia64 and hppa. On ia64,
  there is gcc-2.96; on hppa gcc-3.0 is available as an alternative compiler.

- One based on the FSF's GNU CC Compiler version 2.7.2.3
  (http://www.fsf.org/software/gcc/gcc.html).  This only encompasses the
  package `gcc272' for the architectures i386 and m68k.


Why Debian has more than one version of the compiler collection
---------------------------------------------------------------

We strive to get to a point to have the whole distribution be built by
one compiler version across all supported architectures, but still
support software relying on older compiler versions.

- GCC-3.3.x is currently the default compiler for all architectures.

- gcc-2.95 still is the recommended compiler for building Linux 2.4.xx
  (stable) kernels. Additionally, it is the only version distributed by 
  Debian which supports the CHILL language.

- FSF gcc 2.7.2.x is the recommended compiler for building Linux 2.0.xx (old
  stable) kernels, as it was the primary compiler used in the development of 
  that kernel series.

- Just released GCC-3.4.x [TODO]
  XXX on hppa and m68k don't mix code compiled with GCC-3.3.x and GCC-3.4.x.

For software compatibility testing, you may find older versions,
backports and snapshots of newer version for GCC in the unstable or
experimental distributions or at http://people.debian.org/~doko/


How are the default compilers selected?
---------------------------------------

Starting in Debian 3.0, there is now a gcc-defaults package set. This
creates the actual packages for gcc, gpc, g++, gobjc, chill, g77, gcj,
gij, treelang and gpc.  These packages will depend on the corresponding
default compiler for that architecture. For Debian 3.1 for example,
"gcc" depends on "gcc-3.3", which means that the "gcc-3.3" package will
install a binary called "gcc-3.3", which is symlinked to in the "gcc"
package as "gcc".

This may seem confusing, but what it allows you do to is install more
than one version of the GCC compiler collection at the same time,
making sure you are always using the one preferred for that
architecture. To use the other compiler, simply set CC=gcc-2.95, or
similar.

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

[This paragraph not relevant for Debian 3.1] With this method, each
architecture can choose its own preferred compiler, and that
preference can change without requiring a complete rebuild of both
compiler packages for all architectures. (to change the names), and
simply requires updating the small gcc-defaults package set, to point
the symlinks correctly.


Practical implications
----------------------

The most important practical implications are in the merging/linking
of object files built with different compilers; If you use the 2.95.x
C compiler, you should use the `gcc-2.95' compiler driver for all your
work.  When configuring sources, use

    CC=gcc-2.95 ./configure <configure options> 	# bash
    setenv CC gcc-2.95; ./configure <options>		# csh

When calling make, use `make CC=gcc-2.95'.


C++ and C++ libraries
---------------------

Some notes on porting applications from libstdc++-2.90 (or earlier
versions) found in gcc-2.95 or earlier version to libstdc++-v3 (found
in gcc-3.0 and up) can be found in the libstdc++5-3.3-doc package.
After the installation of the package, look at:

/usr/share/doc/gcc-3.3-base/libstdc++/html/17_intro/porting-howto.html

Code compiled with gcc-2.95.x has to use the libstdc++2.10 libraries.

Now, with the g++-3.3 compiler, we also have the libstdc++-v3
libraries, which bring (in theory) a stable ABI to GCC's C++
interface. Also, 2.95 and prior always had a libgcc.a library that was
linked to by all applications that gcc built. This has now been made
available as a shared library, libgcc_s.so, which is in the libgcc1
package.

XXX: Don't mix code compiled using different g++-X.Y
version. [COMPLETE THIS SECTION]

To use the libstdc++ library (found in the libstd++<N>-dbg package) for 
debugging, add /usr/lib/debug to your LD_LIBRARY_PATH. For gdb to display
the source you need to get the correspondig gcc-X.Y source package, unpack
the source and point gdb to the location of the source (`dir' directive).

Java
----

gcj has the ability to compile to byte code and to native code (for the
latter the installation of the libgcj4-dev package is needed).  To compile
a simple Hello World program:

	gcj --main=HelloWorld -o HelloWorld HelloWorld.java

awt and swing are currently not yet supported by GCC-3.3.x. The
GCC-3.4.x as found in Debian's experimental release contains a
snapshot of the java-gui-branch. Try:

	gcj-3.4 --main=TestAWT -o TestAWT \
		/usr/share/doc/libgcj5-dev/examples/TestAWT.java


Pascal
------

In the GCC-3.3 and in the gcc-2.95 packages, a Beta version of GNU
Pascal 2.2 is included.  The default gpc version in the one based on
GCC-3.3.x.

Bugs
----

Before submitting a bug, please read README.Bugs in this directory.


Feedback appreciated
--------------------

Feedback about this document is appreciated; preferably as a Severity:
wishlist bug against Package: gcc . For general discussions and
questions, subscribe and/or email the debian-gcc@lists.debian.org mailing
list.


Maintainers of these packages
-----------------------------

Matthias Klose <doko@debian.org>
Ray Dassen <jdassen@debian.org>
Philip Blundell <pb@debian.org>			(arm-linux)
Jeff Bailey <jbailey@nisa.net>			(hurd-i386) 
Joel Baker <fenton@debian.org>			(netbsd-i386) 
Ben Collins <bcollins@debian.org>		(sparc-linux)
Randolph Chung <tausq@debian.org>		(ia64-linux, hppa-linux)
Ryan Murray <rmurray@cyberhqz.com>		(mips*-linux)
Dan Jacobowitz <dan@debian.org>			(powerpc-linux)
Gerhard Tonn <GerhardTonn@swol.de>		(s390-linux)
Roman Zippel <zippel@linux-m68k.org>		(m68k-linux)

===============================================================================

