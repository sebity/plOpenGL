:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).



:- dynamic rtri/1,rquad/1.

width(640).
height(480).
rtri(0.0).
rquad(0.0).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_TRIANGLES(TRIANGLE),
	kGL_QUADS(QUAD),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glLoadIdentity,
	glTranslatef(-1.5, 0.0, -6.0),
	rtri(X),
	glRotatef(X, 0.0, 1.0, 0.0),
	% Draw a Triangle
	glBegin(TRIANGLE),
	glColor3f(1.0,0.0,0.0),
	glVertex3f( 0.0,  1.0, 0.0),
	glColor3f(0.0,1.0,0.0),
	glVertex3f(-1.0, -1.0, 0.0),
	glColor3f(0.0,0.0,1.0),
	glVertex3f( 1.0, -1.0, 0.0),
	glEnd,
	glLoadIdentity,
	glTranslatef(1.5, 0.0, -6.0),
	rquad(Y),
	glRotatef(Y, 1.0, 0.0, 0.0),
	glColor3f(0.5,0.5,1.0),
	% Draw a Square
	glBegin(QUAD),
	glVertex3f(-1.0,  1.0, 0.0),
	glVertex3f( 1.0,  1.0, 0.0),
	glVertex3f( 1.0, -1.0, 0.0),
	glVertex3f(-1.0, -1.0, 0.0),
	glEnd,
	X1 is X + 1.0,
	retract(rtri(_)),
	assert(rtri(X1)),
	Y1 is Y - 1.0,
	retract(rquad(_)),
	assert(rquad(Y1)),
	sleep(20),
	glutSwapBuffers.

idle:-
	display.

init:-
	% defs
	width(W),
	height(H),
	Aspect is float(W) / float(H),
	kGL_LESS(GL_LESS),
	kGL_DEPTH_TEST(DEPTH_TEST),
	kGL_SMOOTH(SMOOTH),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glClearDepth(1.0),
	glDepthFunc(GL_LESS),
	glEnable(DEPTH_TEST),
	glShadeModel(SMOOTH),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	gluPerspective(45.0, Aspect, 0.1, 100.0),
	glMatrixMode(MODELVIEW).

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
	gluPerspective(45.0, Aspect, 0.1, 100.0),
	glMatrixMode(MODELVIEW).

keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.

main:-
	% defs
	width(W),
	height(H),
	kGLUT_DOUBLE(DOUBLE),
	kGLUT_RGB(RGB),
    kGLUT_ALPHA(ALPHA),
	kGLUT_DEPTH(DEPTH),
	% gl code
	glutInit,
	glutInitDisplayMode(DOUBLE \/ RGB \/ ALPHA \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('NeHe''s Rotation Tutorial'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



