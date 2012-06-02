plOpenGL
========
SWI-Prolog OpenGL Bindings


What is plOpenGL
----------------
plOpenGL is an open source project that aims to develop a complete cross-platform SWI-Prolog binding for the OpenGL, GLU and GLUT libraries.


Platforms
---------
Windows, Mac OSX and Linux


Compiling
---------
Coming Soon...


Setup
-----
plOpenGL does require setting up, but luckily it is easy.  All that is required is to open the plOpenGL.pl file and comment/uncomment the libraries that is associated with the OS that plOpenGL is running on.

For example, is you are using a Windows System, update the load_foreign_library line to look like:

% Windows Library 
:-load_foreign_library('plOpenGL.dll').

% Mac/Linux Library
%:-load_foreign_library('plOpenGL.so').

If you are using plOpenGL on Mac OSX, then reverse the comments on the load_foreign_library line.


Command Line Usage
------------------
plOpenGL can be run from the command line, e.g.

> swipl -g main -s examples/helloworld.pl


Example Applications
--------------------
See the examples/ folder


Author
------
Jan Tatham
