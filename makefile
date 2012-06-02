#-------------------------------------#
#     Makefile for UNIX systems       #
#       using a GNU C compiler        #
#-------------------------------------#
CC=swipl-ld
CFLAGS=-shared -ggdb -Wall -D__USE_FIXED_PROTOTYPES__ -ansi -v
RELFLAGS=-shared -D__USE_FIXED_PROTOTYPES__ -ansi
LDFLAGS=-L/usr/X11R6/lib -L/opt/local/lib -lGL -lglut -lGLU -lm
SRCS=plOpenGL.c
MACFLAGS=-L/System/Library/Frameworks/OpenGL.framework/Libraries \
        -I/opt/local/lib/swipl-5.11.18/include \
        -framework Cocoa -framework OpenGL -framework GLUT
NIXFLAGS=-I/root/lib/swipl-5.11.20/include

#
# Compiler flags:
#		-g		-- Enable debugging
#		-Wall	-- Turn on all warnings
#		-D__USE_FIXED_PROTOTYPES__
#				-- Force the compiler to use the correct headers
#		-ansi	-- Don't use GNU extensions. Stick to ANSI C.
#		-v		-- Enable Verbose

opengl: $(SRCS)
		$(CC) $(CFLAGS) -o plOpenGL.so $(SRCS) $(LDFLAGS) $(MACFLAGS)

linux: 	$(SRCS)
		$(CC) $(CFLAGS) -o plOpenGL.so $(SRCS) $(LDFLAGS) $(NIXFLAGS)


clean:
		rm -f *.o *~ plOpenGL.so

release:
		$(CC) $(RELFLAGS) -o plOpenGL.so $(SRCS) $(LDFLAGS)

