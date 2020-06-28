</$objtype/mkfile

LIB=libterm.a

OFILES=\
	terminfo.$O\

HFILES=\
	/sys/include/ape/term.h

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\
	${LIB:/$objtype/%=/386/%}\

</sys/src/cmd/mksyslib

CC=pcc
LD=pcc
CFLAGS= -c -I. -I.. -D_POSIX_SOURCE -D_BSD_EXTENSION -D_C99_SNPRINTF_EXTENSION \
-DHAVE_VSNPRINTF 

%.$O: %.c
	$CC $CFLAGS $stem.c


install:V:
    cp libterm.a /$objtype/lib/ape/libterm.a
	cp term.h /sys/include/ape/term.h

clean:V:
	rm -f *.[$OS]

nuke:V:
	rm -f $LIB
	rm -f /$objtype/lib/ape/libterm.a
	rm -f $HFILES
