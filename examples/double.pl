:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).

% double.pl
% This is a simple double buffered program.
% Pressing the left mouse button rotates the rectangle.
% Pressing the middle mouse button stops the rotation.

:- dynamic spin/1.

width(250).
height(250).
spin(0.0).

init:-
	% defs
	kGL_FLAT(FLAT),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glShadeModel(FLAT).


display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	spin(X),
	% gl code
	glClear(COLOR_BUFFER),
	glPushMatrix,
	glRotatef(X, 0.0, 0.0, 1.0),
	glColor3f(1.0, 1.0, 1.0),
	glRectf(-25.0, -25.0, 25.0, 25.0),
	glPopMatrix,
	sleep(50),
	glutSwapBuffers.

spinDisplay:-
	spin(Z),
	X is Z + 2.0,
	(   X > 360.0
	->  Y is X - 360.0
	;   Y = X
	),
	retract(spin(_)),
	assert(spin(Y)),
	glutPostRedisplay.


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
	glOrtho(-50.0, 50.0, -50.0, 50.0, -1.0, 1.0),
	glMatrixMode(MODELVIEW),
	glLoadIdentity.


% 27 is ASCII Code for Escape
keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.

mouse(0,0,_,_):-
	glutIdleFunc(idle).

mouse(2,0,_,_):-
	glutIdleFunc(null).

idle:-
	spinDisplay.

main:-
	% defs
	width(W),
	height(H),
	kGLUT_DOUBLE(DOUBLE),
	kGLUT_RGB(RGB),
	% gl code
	glutInit,
	glutInitDisplayMode(DOUBLE \/ RGB),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Double'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMouseFunc,
	glutMainLoop.
