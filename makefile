SOBJ=   $(PACKSODIR)/plOpenGL.$(SOEXT)
CFLAGS+=-shared -ggdb -Wall -D__USE_FIXED_PROTOTYPES__ -ansi -v
ifeq ($(SWIARCH),x86_64-darwin)
  LDFLAGS=-framework OpenGL -framework GLUT -lm 
else
  LDFLAGS=-lGL -lglut -lGLU -lm 
endif

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
