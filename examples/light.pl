:- ['../plOpenGL.pl'].

% light.pl
% This program demonstrates the use of the OpenGL lighting
% model.  A sphere is drawn using a grey material characteristic.
% A single light source illuminates the object.

width(500).
height(500).


display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glutSolidSphere(1.0, 20, 16),
	glFlush.

init:-
	% defs
	kGL_SMOOTH(SMOOTH),
	kGL_FRONT(FRONT),
	kGL_SPECULAR(SPECULAR),
	kGL_SHININESS(SHININESS),
	kGL_POSITION(POSITION),
	kGL_LIGHTING(LIGHTING),
	kGL_LIGHT0(LIGHT0),
	kGL_DEPTH_TEST(DEPTH_TEST),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glShadeModel(SMOOTH),
	glMaterialfv(FRONT, SPECULAR, [1.0, 1.0, 1.0, 1.0]),
	glMaterialfv(FRONT, SHININESS, [50.0]),
	glLightfv(LIGHT0, POSITION, [1.0, 1.0, 1.0, 0.0]),
	glEnable(LIGHTING),
	glEnable(LIGHT0),
	glEnable(DEPTH_TEST).


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
	(   W =< H
	->  Aspect is H / W,
	    Top is -1.5 * Aspect,
	    Bottom is 1.5 * Aspect,
	    glOrtho(-1.5, 1.5, Top, Bottom, -10.0, 10.0)
	;   Aspect is W / H,
	    Left is -1.5 * Aspect,
	    Right is 1.5 * Aspect,
	    glOrtho(Left, Right, -1.5, 1.5, -10.0, 10.0)
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
	kGLUT_ALPHA(ALPHA),
	% gl code
	glutInit,
	glutInitDisplayMode(SINGLE \/ RGB \/ ALPHA \/ DEPTH),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Light'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




