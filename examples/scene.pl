:- use_foreign_library(foreign(plOpenGL)).
:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


% scene.pl
% This program demonstrates the use of the GL lighting model.
% Objects are drawn using a grey material characteristic.
% A single light source illuminates the objects.

width(500).
height(500).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glPushMatrix,
	glRotatef(20.0, 1.0, 0.0, 0.0),
	% Torus
	glPushMatrix,
	glTranslatef(-0.75, 0.5, 0.0),
	glRotatef(90.0, 1.0, 0.0, 0.0),
	glutSolidTorus(0.275, 0.85, 15, 15),
	glPopMatrix,
	% Cone
	glPushMatrix,
	glTranslatef(-0.75, -0.5, 0.0),
	glRotatef(270.0, 1.0, 0.0, 0.0),
	glutSolidCone(1.0, 2.0, 15, 15),
	glPopMatrix,
	% Sphere
	glPushMatrix,
	glTranslatef(0.75, 0.0, -1.0),
	glutSolidSphere(1.0, 15, 15),
	glPopMatrix,
	glPopMatrix,
	glFlush.

init:-
	% defs
	kGL_AMBIENT(AMBIENT),
	kGL_DIFFUSE(DIFFUSE),
	kGL_SPECULAR(SPECULAR),
	kGL_POSITION(POSITION),
	kGL_LIGHTING(LIGHTING),
	kGL_LIGHT0(LIGHT0),
	kGL_DEPTH_TEST(DEPTH_TEST),
	% gl code
	glLightfv(LIGHT0, AMBIENT, [0.0, 0.0, 0.0, 1.0]),
	glLightfv(LIGHT0, DIFFUSE, [1.0, 1.0, 1.0, 1.0]),
	glLightfv(LIGHT0, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glLightfv(LIGHT0, POSITION, [1.0, 1.0, 1.0, 0.0]),
	glEnable(LIGHTING),
	glEnable(LIGHT0),
	glEnable(DEPTH_TEST).


reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	height(H),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	(   W =< H
	->  Aspect is H / W,
	    Top is -2.5 * Aspect,
	    Bottom is 2.5 * Aspect,
	    glOrtho(-2.5, 2.5, Top, Bottom, -10.0, 10.0)
	;   Aspect is W / W,
	    Left is -2.5 * Aspect,
	    Right is 2.5 * Aspect,
	    glOrtho(Left, Right, -2.5, 2.5, -10.0, 10.0)
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
	kGLUT_ALPHA(ALPHA),
	kGLUT_DEPTH(DEPTH),
	% gl code
	glutInit,
	glutInitDisplayMode(SINGLE \/ RGB \/ ALPHA \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Scene'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




