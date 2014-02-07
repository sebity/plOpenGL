SOBJ=   $(PACKSODIR)/plOpenGL.$(SOEXT)
CC=swipl-ld
CFLAGS=-shared -ggdb -Wall -D__USE_FIXED_PROTOTYPES__ -ansi -v
LDFLAGS=-lGL -lglut -lGLU -lm

all:    $(SOBJ)

OBJ=	c/plOpenGL.o

$(SOBJ): $(OBJ)
	mkdir -p $(PACKSODIR)
	$(CC) $(CFLAGS) $(LDSOFLAGS) -o $@ $(OBJ) $(SWISOLIB) $(LDFLAGS)

check::
install::
#clean:
#	rm -f $(OBJ)
#distclean: clean
#	rm -f $(SOBJ)
