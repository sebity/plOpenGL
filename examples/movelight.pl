:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).



% movelight.pl
% This program demonstrates when to issue lighting and
% transformation commands to render a model with a light
% which is moved by a modeling transformation (rotate or
% translate).  The light position is reset after the modeling
% transformation is called.  The eye position does not change.
%
% A sphere is drawn using a grey material characteristic.
% A single light source illuminates the object.
%
% Interaction:  pressing the left mouse button alters
% the modeling transformation (x rotation) by 30 degrees.
% The scene is then redrawn with the light in a new position.

:- dynamic spin/1.

width(500).
height(500).
spin(0).


display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_LIGHT0(LIGHT0),
	kGL_POSITION(POSITION),
	kGL_LIGHTING(LIGHTING),
	spin(X),
	Y is float(X),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glPushMatrix,
	glTranslatef(0.0, 0.0, -5.0),
	glPushMatrix,
	glRotatef(Y, 1.0, 0.0, 0.0),
	glLightfv(LIGHT0, POSITION, [0.0, 0.0, 1.5, 1.0]),
	glTranslatef(0.0, 0.0, 1.5),
	glDisable(LIGHTING),
	glColor3f(0.0, 1.0, 1.0),
	glutWireCube(0.1),
	glEnable(LIGHTING),
	glPopMatrix,
	glutSolidTorus(0.275, 0.85, 8, 15),
	glPopMatrix,
	glFlush.


init:-
	% defs
	kGL_SMOOTH(SMOOTH),
	kGL_LIGHTING(LIGHTING),
	kGL_LIGHT0(LIGHT0),
	kGL_DEPTH_TEST(DEPTH_TEST),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glShadeModel(SMOOTH),
	glEnable(LIGHTING),
	glEnable(LIGHT0),
	glEnable(DEPTH_TEST).

reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	height(H),
	Aspect is float(W) / float(H),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	gluPerspective(40.0, Aspect, 1.0, 20.0),
	glMatrixMode(MODELVIEW),
	glLoadIdentity.


% 27 is ASCII Code for Escape
keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.


mouse(0,0,_,_):-
	spin(X),
	Y is (X + 30),
	M is mod(Y,360),
	retract(spin(X)),
	assert(spin(M)),
	glutPostRedisplay.


main:-
	% defs
	width(W),
	height(H),
	kGLUT_SINGLE(SINGLE),
	kGLUT_RGB(RGB),
	kGLUT_DEPTH(DEPTH),
	% gl code
	glutInit,
	glutInitDisplayMode(SINGLE \/ RGB \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Move Light'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMouseFunc,
	glutMainLoop.
