
CC=cc
prefix=/usr/local
exec_prefix=/usr/local
bindir=/usr/local/bin
libdir=/usr/local/lib
includedir=/usr/local/include
sysconfdir=/usr/local/etc
CPPFLAGS+= -DSUPER_SECURE
CPPFLAGS+=  -DHAVE_GNU_GETSERVBYNAME_R -DHAVE_PIPE2 -DHAVE_SOCK_CLOEXEC
LD_SET_SONAME = -Wl,--soname,
