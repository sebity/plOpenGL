:- ['../plOpenGL.pl'].

% alpha.pl
% This program draws several overlapping filled polygons
% to demonstrate the effect order has on alpha blending results.
% Use the 't' key to toggle the order of drawing polygons.

:- dynamic leftFirst/1.

width(400).
height(400).

leftFirst(1).

display:-
        % defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	% gl code
	glClear(COLOR_BUFFER),
	(   leftFirst(1)
	->  draw_left_triangle,
	    draw_right_triangle
	;   draw_right_triangle,
	    draw_left_triangle
	),
	glFlush.

init:-
	% defs
	kGL_BLEND(BLEND),
	kGL_SRC_ALPHA(ALPHA),
	kGL_FLAT(FLAT),
	kGL_ONE_MINUS_SRC_ALPHA(MINUS_ALPHA),
	% gl code
	glEnable(BLEND),
	glBlendFunc(ALPHA, MINUS_ALPHA),
	glShadeModel(FLAT),
	glClearColor(0.0, 0.0, 0.0, 0.0).


draw_left_triangle :-
	% defs
	kGL_TRIANGLES(TRIANGLE),
	% gl code
	glBegin(TRIANGLE),
	glColor4f(1.0, 1.0, 0.0, 0.75),
	glVertex3f(0.1, 0.9, 0.0),
	glVertex3f(0.1, 0.1, 0.0),
	glVertex3f(0.7, 0.5, 0.0),
	glEnd.

draw_right_triangle :-
	% defs
	kGL_TRIANGLES(TRIANGLE),
	% gl code
	glBegin(TRIANGLE),
	glColor4f(0.0, 1.0, 1.0, 0.75),
	glVertex3f(0.9, 0.9, 0.0),
	glVertex3f(0.3, 0.5, 0.0),
	glVertex3f(0.9, 0.1, 0.0),
	glEnd.

reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	width(H),
	kGL_PROJECTION(PROJECTION),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	(   W =< H
	->  Aspect is float(H) / float(W),
	    gluOrtho2D(0.0, 1.0, 0.0, Aspect)
	;   Aspect is float(W) / float(H),
	    gluOrtho2D(0.0, Aspect, 0.0, 1.0)
	).


% 27 is ASCII Code for Escape
keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.
% 84 is ASCII Code for T
keyboard(84,_,_) :-
	(   leftFirst(1)
	->  retract(leftFirst(1)),
	    assert(leftFirst(0))
	;   retract(leftFirst(0)),
	    assert(leftFirst(1))
	),
	glutPostRedisplay.
% 116 is ASCII Code for t
keyboard(116,_,_) :-
	(   leftFirst(1)
	->  retract(leftFirst(1)),
	    assert(leftFirst(0))
	;   retract(leftFirst(0)),
	    assert(leftFirst(1))
	),
	glutPostRedisplay.


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
	glutCreateWindow('Alpha'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




