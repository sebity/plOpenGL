:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


% cube.pl
% This program demonstrates a single modeling transformation,
% glScalef() and a single viewing transformation, gluLookAt().
% A wireframe cube is rendered.

width(500).
height(500).

display:-
    % defs
    kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	% gl code
	glClear(COLOR_BUFFER),
	glColor3f(1.0, 1.0, 1.0),
	glLoadIdentity,
	gluLookAt(0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0),
	glScalef(1.0, 2.0, 1.0),
	glutWireCube(1.0),
	glFlush.

init:-
	% defs
	kGL_FLAT(FLAT),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glShadeModel(FLAT).


reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	width(H),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 20.0),
	glMatrixMode(MODELVIEW).


% 27 is ASCII Code for Escape
keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.


main:-
	% defs
	width(W),
	height(H),
	kGLUT_SINGLE(SINGLE),
	kGLUT_RGB(RGB),
	% gl code
	glutInit,
	glutInitDisplayMode(SINGLE \/ RGB),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Cube'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




