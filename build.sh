#!/bin/sh

# see http://web.archive.org/web/20141011042821/http://www.trevorpounds.com/blog/?p=33
# and http://web.archive.org/web/20141011042821/http://www.trevorpounds.com/blog/?p=103


[ -z "$CC" ] && CC=gcc
set -e

$CC $CFLAGS -fPIC -c -o dso.o dso.c
$CC -shared -Wl,--version-script dso.map dso.o -o libdso.so

$CC $CFLAGS -o a.out dso-user.c -L. -ldso
LD_LIBRARY_PATH=. ./a.out

$CC $CFLAGS -o dl.out dso-user-dl.c -ldl
LD_LIBRARY_PATH=. ./dl.out
