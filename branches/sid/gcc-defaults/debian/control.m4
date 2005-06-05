divert(-1)
define(`ifenabled', `ifelse(index(PACKAGES, `$1'), -1, `dnl', `$2')')

define(`SSW', `
 .
 NOTE: This is not a final release, but taken from the CVS gcc-2_95-branch
       (dated 20010506).')
define(`SSW', `')

divert`'dnl
dnl --------------------------------------------------------------------------
Source: gcc-defaults
Section: devel
Priority: standard
Maintainer: Debian GCC maintainers <debian-gcc@lists.debian.org>
Uploaders: Matthias Klose <doko@debian.org>, Ryan Murray <rmurray@debian.org>
Standards-Version: 3.5.10
Build-Depends: m4, debhelper (>= 4)

Package: cpp
Architecture: any
Section: interpreters
Depends: cpp-PV_CPP REQV_CPP
Suggests: cpp-doc
Conflicts: cpp-doc (<< 1:2.95.3)
Description: The GNU C preprocessor (cpp)
 The GNU C preprocessor is a macro processor that is used automatically
 by the GNU C compiler to transform programs before actual compilation.
 .
 This package has been separated from gcc for the benefit of those who
 require the preprocessor but not the compiler.
 .
 This is a dependency package providing the default GNU C preprocessor.SSW

ifenabled(`c++',`
Package: g++
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gcc (>= EPOCH:CV_CPP), g++-PV_GPP REQV_GPP, gcc-PV_GPP REQV_GPP
Provides: c++-compiler
Description: The GNU C++ compiler
 This is the GNU C++ compiler, a fairly portable optimizing compiler for C++.
 .
 This is a dependency package providing the default GNU C++ compiler.SSW
')`'dnl c++

ifenabled(`objc',`
Package: gobjc
Priority: optional
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gcc (>= EPOCH:CV_CPP), gobjc-PV_GOBJC REQV_GOBJC, gcc-PV_GOBJC REQV_GOBJC
Provides: objc-compiler
Description: The GNU Objective-C compiler
 This is the GNU Objective-C compiler, which compiles Objective-C on platforms
 supported by the gcc compiler. It uses the gcc backend to generate optimized
 code.
 .
 This is a dependency package providing the default GNU Objective-C compiler.SSW
')`'dnl objc

ifenabled(`chill',`
Package: chill
Priority: extra
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), chill-PV_CHILL REQV_CHILL, gcc-PV_CHILL REQV_CHILL
Description: The GNU CHILL compiler
 This is the ITU CHILL compiler. CHILL is the "CCITT High-Level Language",
 where CCITT is the old name for what is now ITU, the International
 Telecommunications Union. It is a language in the Modula-2 family, and targets
 many of the same applications as Ada (especially large embedded systems).
 CHILL was never used much in the United States, but is still being used in
 Europe, Brazil, Korea, and other places.
 .
 This is a dependency package providing the default GNU CHILL compiler.SSW
')`'dnl chill

ifenabled(`fortran',`
Package: g77
Priority: optional
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gcc (>= EPOCH:CV_CPP), g77-PV_G77 REQV_G77, gcc-PV_G77 REQV_G77
Suggests: g77-doc
Provides: fortran-compiler
Description: The GNU Fortran 77 compiler
 This is the GNU g77 Fortran compiler, which compiles Fortran 77 on platforms
 supported by the gcc compiler. It uses the gcc backend to generate optimized
 code.
 .
 This is a dependency package providing the default GNU Fortran 77 compiler.SSW
')`'dnl fortran

ifenabled(`java',`
Package: gcj
Priority: optional
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gcc (>= EPOCH:CV_CPP), g++ (>= EPOCH:CV_CPP), gcj-PV_GCJ REQV_GCJ
Recommends: gij (>= EPOCH:CV_CPP)
Provides: java-compiler
Description: The GNU Java compiler
 GCJ is a front end to the GCC compiler which can natively compile both
 Java(tm) source and bytecode files. The compiler can also generate class
 files.
 .
 This is a dependency package providing the default GNU Java compiler.SSW

Package: libgcj-dev
Priority: optional
Architecture: any
Depends: LIBGCJ-dev REQV_LIBGCJ, gcj (>= EPOCH:CV_CPP)
Description: Java development headers and static library for use with gcj 
 These are the development headers and static libraries that go along with 
 the gcj front end to gcc. libgcj includes parts of the Java Class Libraries, 
 plus glue to connect the libraries to the compiler and the underlying OS.
 .
 This is a dependency package providing the default Java development headers.SSW

Package: gij
Priority: optional
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gij-PV_GIJ REQV_GIJ
Suggests: gcj (>= EPOCH:CV_CPP)
Conflicts: libgcj2 (<= 3.0.2-4)
Description: The GNU Java bytecode interpreter
 GIJ is not limited to interpreting bytecode. It includes a class loader which
 can dynamically load shared objects, so it is possible to give it the name
 of a class which has been compiled and put into a shared library on the
 class path.
 .
 This is a dependency package providing the default GNU Java bytecode
 interpreter.SSW
')`'dnl java

ifenabled(`pascal',`
Package: gpc
Priority: optional
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gpc-PV_GPC REQV_GPC, gcc-PV_GPCDEP REQV_GPCDEP
Suggests: gpc-doc
Conflicts: gpc-doc (<< 1:2.95.3)
Provides: pascal-compiler
Description: The GNU Pascal compiler
 This is the GNU Pascal compiler, which compiles Pascal on platforms supported
 by the gcc compiler. It uses the gcc backend to generate optimized code.
 .
 The current version 2.2 (release candiate 2) implements Standard Pascal
 (ISO 7185, level 1), a large subset of Extended Pascal (ISO 10206), and
 Borland Pascal. Many Borland Pascal units supported.
 .
 This is a dependency package providing the default GNU Pascal compiler.SSW
')`'dnl pascal

Package: gcc
Architecture: any
Depends: cpp (>= EPOCH:CV_CPP), gcc-PV_GCC REQV_GCC, cpp-PV_GCC REQV_GCC
Recommends: libc-dev
Suggests: make, manpages-dev, autoconf, automake, libtool, flex, bison, gdb, gcc-doc
Provides: c-compiler
Conflicts: gcc-doc (<< 1:2.95.3)
Description: The GNU C compiler
 This is the GNU C compiler, a fairly portable optimizing compiler for C.
 .
 This is a dependency package providing the default GNU C compiler.SSW

Package: cpp-doc
Architecture: any
Priority: optional
Depends: cpp-PV_CPP-doc REQV_CPP
Suggests: cpp (>= EPOCH:CV_CPP)
Description: Documentation for the GNU C preprocessor (cpp)
 Documentation for the GNU C preprocessor in info format (dependency package).

ifenabled(`fortran',`
Package: g77-doc
Architecture: any
Priority: optional
Depends: g77-PV_G77-doc REQV_G77
Suggests: g77 (>= EPOCH:CV_CPP)
Description: Documentation for the GNU Fortran compiler (g77)
 Documentation for the GNU Fortran compiler in info format (dependency package).
')`'dnl fortran

ifenabled(`pascal',`
Package: gpc-doc
Architecture: any
Priority: optional
Depends: gpc-PV_GPC-doc REQV_GPC
Suggests: gpc (>= EPOCH:CV_GPC)
Description: Documentation for the GNU Pascal compiler (gpc)
 Documentation for the GNU Pascal compiler in info format (dependency package).
')`'dnl pascal

Package: gcc-doc
Architecture: any
Priority: optional
Depends: gcc-PV_GCC-doc REQV_GCC
Suggests: gcc (>= EPOCH:CV_CPP)
Description: Documentation for the GNU C compilers (gcc, gobjc, g++)
 Documentation for the GNU compilers in info format (dependency package).
