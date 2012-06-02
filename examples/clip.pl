:- ['../plOpenGL.pl'].

% clip.pl
% This program demonstrates arbitrary clipping planes.

width(500).
height(500).


init:-
	% defs
	kGL_FLAT(FLAT),
	% gl code
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glShadeModel(FLAT).


display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_CLIP_PLANE0(CLIP_PLANE0),
	kGL_CLIP_PLANE1(CLIP_PLANE1),
	% gl code
	glClear(COLOR_BUFFER),
	glColor3f(1.0, 1.0, 1.0),
	glPushMatrix,
	glTranslatef(0.0, 0.0, -5.0),
	glClipPlane(CLIP_PLANE0, [0.0, 1.0, 0.0, 0.0]),
	glEnable(CLIP_PLANE0),
	glClipPlane(CLIP_PLANE1, [1.0, 0.0, 0.0, 0.0]),
	glEnable(CLIP_PLANE1),
	glRotatef(90.0, 1.0, 0.0, 0.0),
	glutWireSphere(1.0, 20, 16),
	glPopMatrix,
	glFlush.


reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	width(H),
	Aspect is float(W / H),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	gluPerspective(60.0, Aspect, 1.0, 20.0),
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
	glutInitWindowPosition(100,100),
	glutCreateWindow('Clip'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




