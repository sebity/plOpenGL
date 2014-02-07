:- use_foreign_library(foreign(plOpenGL)).
:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


% material.pl
% This program demonstrates the use of the GL lighting model.
% Several objects are drawn using different material characteristics.
% A single light source illuminates the objects.

width(600).
height(600).


display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_FRONT(FRONT),
	kGL_AMBIENT(AMBIENT),
	kGL_DIFFUSE(DIFFUSE),
	kGL_SPECULAR(SPECULAR),
	kGL_SHININESS(SHININESS),
	kGL_EMISSION(EMISSION),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	% first row, first column
	glPushMatrix,
	glTranslatef(-3.75, 3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% first row, second column
	glPushMatrix,
	glTranslatef(-1.25, 3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [5.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% first row, third column
	glPushMatrix,
	glTranslatef(1.25, 3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [5.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% first row, fourth column
	glPushMatrix,
	glTranslatef(3.75, 3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.3, 0.2, 0.2, 0.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% second row, first column
	glPushMatrix,
	glTranslatef(-3.75, 0.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.7, 0.7, 0.7, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% second row, second column
	glPushMatrix,
	glTranslatef(-1.25, 0.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.7, 0.7, 0.7, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [5.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% second row, third column
	glPushMatrix,
	glTranslatef(1.25, 0.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.7, 0.7, 0.7, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [100.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% second row, fourth column
	glPushMatrix,
	glTranslatef(3.75, 0.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.7, 0.7, 0.7, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.3, 0.2, 0.2, 0.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% third row, first column
	glPushMatrix,
	glTranslatef(-3.75, -3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.8, 0.8, 0.2, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% third row, second column
	glPushMatrix,
	glTranslatef(-1.25, -3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.8, 0.8, 0.2, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [5.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% third row, third column
	glPushMatrix,
	glTranslatef(1.25, -3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.8, 0.8, 0.2, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [100.0]),
	glMaterialfv(FRONT, EMISSION, [0.0, 0.0, 0.0, 1.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	% third row, fourth column
	glPushMatrix,
	glTranslatef(3.75, -3.0, 0.0),
	glMaterialfv(FRONT, AMBIENT, [0.8, 0.8, 0.2, 1.0]),
	glMaterialfv(FRONT, DIFFUSE, [0.1, 0.5, 0.8, 1.0]),
	glMaterialfv(FRONT, SPECULAR, [0.0, 0.0, 0.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [0.0]),
	glMaterialfv(FRONT, EMISSION, [0.3, 0.2, 0.2, 0.0]),
	glutSolidSphere(1.0, 16, 16),
	glPopMatrix,
	glFlush.

init:-
	% defs
	kGL_DEPTH_TEST(DEPTH_TEST),
	kGL_SMOOTH(SMOOTH),
	kGL_AMBIENT(AMBIENT),
	kGL_DIFFUSE(DIFFUSE),
	kGL_POSITION(POSITION),
	kGL_LIGHT_MODEL_AMBIENT(MODEL_AMBIENT),
	kGL_LIGHT_MODEL_LOCAL_VIEWER(LOCAL_VIEWER),
	kGL_LIGHTING(LIGHTING),
	kGL_LIGHT0(LIGHT0),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glEnable(DEPTH_TEST),
	glShadeModel(SMOOTH),
	glLightfv(LIGHT0, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glLightfv(LIGHT0, DIFFUSE, [1.0, 1.0, 1.0, 1.0]),
	glLightfv(LIGHT0, POSITION, [0.0, 3.0, 2.0, 0.0]),
	glLightModelfv(MODEL_AMBIENT, [0.4, 0.4, 0.4, 1.0]),
	glLightModelfv(LOCAL_VIEWER,[0.0]),
	glEnable(LIGHTING),
	glEnable(LIGHT0).



reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	width(H),
	H1 is H * 2,
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	(   W =< H1
	->  Aspect is float(H1) / float(W),
	    Top is -3.0 * Aspect,
	    Bottom is 3.0 * Aspect,
	    glOrtho(-6.0, 6.0, Top, Bottom, -10.0, 10.0)
	;   Aspect is float(W) / float(H1),
	    Left is -6.0 * Aspect,
	    Right is 6.0 * Aspect,
	    glOrtho(Left, Right, -3.0, 3.0, -10.0, 10.0)
	),
	glMatrixMode(MODELVIEW),
	glLoadIdentity.


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
	kGLUT_DEPTH(DEPTH),
	% gl code
	glutInit,
	glutInitDisplayMode(SINGLE \/ RGB \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Material'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




