plOpenGL
========
SWI-Prolog OpenGL Bindings


What is plOpenGL
----------------
plOpenGL is an open source project that aims to develop a complete cross-platform SWI-Prolog binding for the OpenGL, GLU and GLUT libraries.


Platforms
---------
Windows, Mac OSX and Linux


Usage
-----
To use plOpenGL, add the following import modules and libraries to your script:

:- use_foreign_library(foreign(plOpenGL)).

:- use_module(library(plOpenGL)).

:- use_module(library(plGL_defs)).

:- use_module(library(plGLU_defs)).

:- use_module(library(plGLUT_defs)).

:- use_module(library(plGL)).

:- use_module(library(plGLU)).

:- use_module(library(plGLUT)).


Author
------
Jan Tatham


License
-------
plOpenGL is currently available under the GNU Lesser General Public License (LGPL) version 2.1.

