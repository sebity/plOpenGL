:- ['../plOpenGL.pl'].

% drawf.pl
% Draws the bitmapped letter F on the screen (several times).
% This demonstrates use of the glBitmap() call.

width(300).
height(300).
rasters([0xc0,0x00,0xc0,0x00,0xc0,0x00,0xc0,0x00,0xc0,0x00,
	 0xff,0x00,0xff,0x00,0xc0,0x00,0xc0,0x00,0xc0,0x00,
	 0xff,0xc0,0xff,0xc0]).

display:-
        % defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	rasters(List),
	% gl code
	glClear(COLOR_BUFFER),
	glColor3f(1.0, 1.0, 1.0),
	glRasterPos2i(20,20),
	glBitmap(10, 12, 0.0, 0.0, 11.0, 0.0, List),
	glBitmap(10, 12, 0.0, 0.0, 11.0, 0.0, List),
	glBitmap(10, 12, 0.0, 0.0, 11.0, 0.0, List),
	glFlush.

init:-
	% defs
	kGL_UNPACK_ALIGNMENT(ALIGNMENT),
	% gl code
	glPixelStorei(ALIGNMENT, 1),
	glClearColor(0.0, 0.0, 0.0, 0.0).



reshape:-
	% defs
	X is 0,
	Y is 0,
	width(W),
	width(H),
	Right is float(W),
	Top is float(H),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	glViewport(X,Y,W,H),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	glOrtho(0.0, Right, 0.0, Top, -1.0, 1.0),
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
	glutInitWindowPosition(0,0),
	glutCreateWindow('DrawF'),
	init,
	glutDisplayFunc,
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.




