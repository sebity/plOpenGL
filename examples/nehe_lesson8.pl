:- ['../plOpenGL.pl'].

:- dynamic xrot/1,yrot/1,xspeed/1,yspeed/1,zdepth/1,filter/1,light/1,blend/1,fullscreen/1.

width(1024).
height(768).
xrot(0.0).
yrot(0.0).
xspeed(0.0).
yspeed(0.0).
zdepth(-5.0).
filter(1).
light(0).
blend(0).
fullscreen(0).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_QUADS(QUAD),
	xrot(X),
	yrot(Y),
	zdepth(Z),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glLoadIdentity,
	glTranslatef(0.0, 0.0, Z),
	glRotatef(X, 1.0, 0.0, 0.0),
	glRotatef(Y, 0.0, 1.0, 0.0),
	% Draw a Triangle
	filter(Filter),
	glBindTexture(TEXTURE_2D, Filter),
	glBegin(QUAD),
	% Front Face
	glNormal3f(0.0, 0.0, 1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0,  1.0),
	% Back Face
	glNormal3f(0.0, 0.0, -1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0, -1.0),
	% Top Face
	glNormal3f(0.0, 1.0, 0.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0,  1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	% Bottom Face
	glNormal3f(0.0, -1.0, 0.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0, -1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	% Right Face
	glNormal3f(1.0, 0.0, 0.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	% Left Face
	glNormal3f(-1.0, 0.0, 0.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glEnd,
	xspeed(XS),
	yspeed(YS),
	X1 is X + XS,
	retract(xrot(_)),
	assert(xrot(X1)),
	Y1 is Y + YS,
	retract(yrot(_)),
	assert(yrot(Y1)),
	sleep(20),
	glutSwapBuffers.

init:-
	% defs
	width(W),
	height(H),
	Aspect is float(W) / float(H),
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_LESS(GL_LESS),
	kGL_DEPTH_TEST(DEPTH_TEST),
	kGL_SMOOTH(SMOOTH),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	kGL_TEXTURE_MAG_FILTER(MAG_FILTER),
	kGL_TEXTURE_MIN_FILTER(MIN_FILTER),
	kGL_RGB(RGB),
	kGL_UNSIGNED_BYTE(UNSIGNED_BYTE),
	kGL_LINEAR(LINEAR),
	kGL_NEAREST(NEAREST),
	kGL_LINEAR_MIPMAP_NEAREST(MIPMAP_NEAREST),
	kGL_LIGHT1(LIGHT1),
	kGL_AMBIENT(AMBIENT),
	kGL_DIFFUSE(DIFFUSE),
	kGL_POSITION(POSITION),
	kGL_SRC_ALPHA(SRC_ALPHA),
	kGL_ONE(ONE),
	% gl code
	loadGLTextures('Data/glass.bmp',Width,Height,Data),
	glGenTextures(3,TextureNames),
	% Texture 1
	nth1(1,TextureNames,T1),
	write('T1: '),write(T1),nl,
	glBindTexture(TEXTURE_2D,T1),
	glTexParameteri(TEXTURE_2D, MAG_FILTER, NEAREST),
	glTexParameteri(TEXTURE_2D, MIN_FILTER, NEAREST),
	glTexImage2D(TEXTURE_2D, 0, 3, Width, Height, 0, RGB, UNSIGNED_BYTE, Data),
	% Texture 2
	nth1(2,TextureNames,T2),
	glBindTexture(TEXTURE_2D,T2),
	glTexParameteri(TEXTURE_2D, MAG_FILTER, LINEAR),
	glTexParameteri(TEXTURE_2D, MIN_FILTER, LINEAR),
	glTexImage2D(TEXTURE_2D, 0, 3, Width, Height, 0, RGB, UNSIGNED_BYTE, Data),
	% Texture 3
	nth1(3,TextureNames,T3),
	glBindTexture(TEXTURE_2D,T3),
	glTexParameteri(TEXTURE_2D, MAG_FILTER, LINEAR),
	glTexParameteri(TEXTURE_2D, MIN_FILTER, MIPMAP_NEAREST),
	glTexImage2D(TEXTURE_2D, 0, 3, Width, Height, 0, RGB, UNSIGNED_BYTE, Data),
	gluBuild2DMipmaps(TEXTURE_2D, 3, Width, Height, RGB, UNSIGNED_BYTE, Data),
	glEnable(TEXTURE_2D),
	glClearColor(0.0, 0.0, 0.0, 0.0),
	glClearDepth(1.0),
	glDepthFunc(GL_LESS),
	glEnable(DEPTH_TEST),
	glShadeModel(SMOOTH),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	gluPerspective(45.0, Aspect, 0.1, 100.0),
	glMatrixMode(MODELVIEW),
	glLightfv(LIGHT1, AMBIENT, [0.5, 0.5, 0.5, 1.0]),
	glLightfv(LIGHT1, DIFFUSE, [1.0, 1.0, 1.0, 1.0]),
	glLightfv(LIGHT1, POSITION, [0.0, 0.0, 2.0, 1.0]),
	glEnable(LIGHT1),
	glBlendFunc(SRC_ALPHA, ONE),
	glColor4f(1.0, 1.0, 1.0, 0.5).


reshape:-
	% defs
	fullscreen(F),
	X is 0,
	Y is 0,
	width(W),
	height(H),
	kGLUT_SCREEN_WIDTH(SCREEN_WIDTH),
	kGLUT_SCREEN_HEIGHT(SCREEN_HEIGHT),
	glutGet(SCREEN_WIDTH,SW),
	glutGet(SCREEN_HEIGHT,SH),
	kGL_PROJECTION(PROJECTION),
	kGL_MODELVIEW(MODELVIEW),
	% gl code
	(   F = 1
	->  glViewport(X,Y,SW,SH)
	;   glViewport(X,Y,W,H)
	),
	glMatrixMode(PROJECTION),
	glLoadIdentity,
	(   F = 1
	->  AF is float(SW) / float(SH),
	    gluPerspective(45.0, AF, 0.1, 100.0)
	;   ANF is float(W) / float(H),
	    gluPerspective(45.0, ANF, 0.1, 100.0)
	),
	glMatrixMode(MODELVIEW).

keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.
keyboard(108,_,_):-
	light(L),
	kGL_LIGHTING(LIGHTING),
	(   L = 1
	->  glDisable(LIGHTING),
	    retract(light(_)),
	    assert(light(0)),
	    write('l pressed, light is: 0'),nl
	;   glEnable(LIGHTING),
	    retract(light(_)),
	    assert(light(1)),
	    write('l pressed, light is: 1'),nl
	).
keyboard(102,_,_):-
	filter(F),
	F1 is F + 1,
	(   F1 > 3
	->  retract(filter(_)),
	    assert(filter(1)),
	    write('f pressed, filter is: 1'),nl
	;   retract(filter(_)),
	    assert(filter(F1)),
	    write('f pressed, filter is: '),write(F1),nl
	).
keyboard(98,_,_):-
	blend(B),
	kGL_BLEND(BLEND),
	kGL_DEPTH_TEST(DEPTH_TEST),
	(   B = 1
	->  glDisable(BLEND),
	    glEnable(DEPTH_TEST),
	    retract(blend(_)),
	    assert(blend(0)),
	    write('b pressed, blend is: 0'),nl
	;   glEnable(BLEND),
	    glDisable(DEPTH_TEST),
	    retract(blend(_)),
	    assert(blend(1)),
	    write('b pressed, blend is: 1'),nl
	).

% Press z to zoom in
keyboard(122,_,_):-
	zdepth(Z),
	Z1 is Z + 0.2,
	retract(zdepth(_)),
	assert(zdepth(Z1)).
% Press x to zoom out
keyboard(120,_,_):-
	zdepth(Z),
	Z1 is Z - 0.2,
	retract(zdepth(_)),
	assert(zdepth(Z1)).
% Press w to increase y rotation speed
keyboard(119,_,_):-
	xspeed(X),
	X1 is X + 0.1,
	retract(xspeed(_)),
	assert(xspeed(X1)).
% Press s to increase y rotation speed
keyboard(115,_,_):-
	xspeed(X),
	X1 is X - 0.1,
	retract(xspeed(_)),
	assert(xspeed(X1)).
% Press a to increase y rotation speed
keyboard(97,_,_):-
	yspeed(Y),
	Y1 is Y + 0.1,
	retract(yspeed(_)),
	assert(yspeed(Y1)).
% Press d to increase y rotation speed
keyboard(100,_,_):-
	yspeed(Y),
	Y1 is Y - 0.1,
	retract(yspeed(_)),
	assert(yspeed(Y1)).
% Press 1 to toggle fullscreen
keyboard(49,_,_) :-
	width(W),
	height(H),
	fullscreen(F),
	(   F = 0
	->  glutFullScreen,
	    retract(fullscreen(_)),
	    assert(fullscreen(1))
	;   glutReshapeWindow(W,H),
	    retract(fullscreen(_)),
	    assert(fullscreen(0))
	).

idle:-
	display.


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
	glutCreateWindow('NeHe''s Blending'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



