:- ['../plOpenGL.pl'].

% hello.pl
% This is a simple, introductory OpenGL program.

width(250).
height(250).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_POLYGON(POLYGON),
	% gl code
	glClear(COLOR_BUFFER),
	glColor3f(1.0, 1.0, 1.0),
	glBegin(POLYGON),
	glVertex3f(0.25, 0.25, 0.0),
	glVertex3f(0.75, 0.25, 0.0),
	glVertex3f(0.75, 0.75, 0.0),
	glVertex3f(0.25, 0.75, 0.0),
	glEnd,
	glFlush.

init:-
	% defs
	kGL_PROJECTION(PROJECTION),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0).

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
	glutCreateWindow('Hello World'),
	init,
	glutDisplayFunc,
	glutMainLoop.



