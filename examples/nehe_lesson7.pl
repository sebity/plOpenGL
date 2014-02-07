:- use_foreign_library(foreign(plOpenGL)).
:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


:- dynamic xrot/1,yrot/1,xspeed/1,yspeed/1,zdepth/1,filter/1,light/1.

width(800).
height(600).
xrot(0.0).
yrot(0.0).
xspeed(0.0).
yspeed(0.0).
zdepth(-5.0).
filter(1).
light(1).

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
	sleep(50),
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
	% gl code
	loadGLTextures('Data/crate.bmp',Width,Height,Data),
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
	glEnable(LIGHT1).


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
% Press z to zoom in
keyboard(122,_,_):-
	zdepth(Z),
	Z1 is Z + 0.2,
	retract(zdepth(_)),
	assert(zdepth(Z1)),
	write('Z Depth: '),write(Z1),nl.
% Press x to zoom out
keyboard(120,_,_):-
	zdepth(Z),
	Z1 is Z - 0.2,
	retract(zdepth(_)),
	assert(zdepth(Z1)),
	write('Z Depth: '),write(Z1),nl.
% Press w to increase y rotation speed
keyboard(119,_,_):-
	xspeed(X),
	X1 is X + 0.1,
	retract(xspeed(_)),
	assert(xspeed(X1)),
	write('X Speed: '),write(X1),nl.
% Press s to increase y rotation speed
keyboard(115,_,_):-
	xspeed(X),
	X1 is X - 0.1,
	retract(xspeed(_)),
	assert(xspeed(X1)),
	write('X Speed: '),write(X1),nl.
% Press a to increase y rotation speed
keyboard(97,_,_):-
	yspeed(Y),
	Y1 is Y + 0.1,
	retract(yspeed(_)),
	assert(yspeed(Y1)),
	write('Y Speed: '),write(Y1),nl.
% Press d to increase y rotation speed
keyboard(100,_,_):-
	yspeed(Y),
	Y1 is Y - 0.1,
	retract(yspeed(_)),
	assert(yspeed(Y1)),
	write('Y Speed: '),write(Y1),nl.


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
	glutCreateWindow('NeHe''s Texture Filters, Lighting & Keyboard Control'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



