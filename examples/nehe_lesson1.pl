:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


% nehe_lesson1.pl

width(640).
height(480).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glLoadIdentity,
	glutSwapBuffers.

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


% 27 is ASCII Code for Escape
keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.


main:-
	% defs
	width(W),
	height(H),
	kGLUT_DOUBLE(DOUBLE),
	kGLUT_RGB(RGB),
	kGLUT_DEPTH(DEPTH),
	% gl code
	glutInit,
	glutInitDisplayMode(DOUBLE \/ RGB \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('NeHe''s OpenGL Framework'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




