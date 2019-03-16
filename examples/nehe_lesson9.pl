:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


:- dynamic texture/1,stars/6,spin/1,zoom/1,tilt/1,twinkle/1.

width(640).
height(480).
texture(1).
zoom(-15.0).
tilt(90.0).
spin(0.0).
loop(50).
twinkle(0).

create_stars(X,X).
create_stars(I,Max) :-
	random(0, 255, R),
	random(0, 255, G),
	random(0, 255, B),
	Dist is (float(I) / float(Max)) * 5.0,
	Angle is 0.0,
	assert(stars(I, R, G, B, Dist, Angle)),
	Num is I + 1,
	create_stars(Num, Max).


draw_stars(X,X).
draw_stars(I,Max) :-
	glLoadIdentity,
	zoom(ZOOM),
	tilt(TILT),
	spin(SPIN),
	stars(I,R,G,B,DIST,ANGLE),
	glTranslatef(0.0, 0.0, ZOOM),
	glRotatef(TILT, 1.0, 0.0, 0.0),
	glRotatef(ANGLE, 0.0, 1.0, 0.0),
	glTranslatef(DIST, 0.0, 0.0),
	ANGLE_NEG is (-DIST),
	TILT_NEG is (-TILT),
	glRotatef(ANGLE_NEG, 0.0, 1.0, 0.0),
	glRotatef(TILT_NEG, 1.0, 0.0, 0.0),
	twinkle(T),
	stars_twinkle(T,I),
	glRotatef(SPIN, 0.0, 0.0, 1.0),
	% Assign Color
	glColor4ub(R, G, B, 255),
	kGL_QUADS(QUADS),
	glBegin(QUADS),
	glTexCoord2f(0.0, 0.0), glVertex3f(-1.0,-1.0, 0.0),
	glTexCoord2f(1.0, 0.0), glVertex3f( 1.0,-1.0, 0.0),
	glTexCoord2f(1.0, 1.0), glVertex3f( 1.0, 1.0, 0.0),
	glTexCoord2f(0.0, 1.0), glVertex3f(-1.0, 1.0, 0.0),
	glEnd,

	S1 is SPIN + 0.01,
	retract(spin(_)),
	assert(spin(S1)),
	A1 is ANGLE + (float(I) / float(Max)),
	D1 is DIST - 0.01,
	retract(stars(I,_,_,_,_,_)),
	(   D1 < 0.0
	->  D2 is D1 + 5.0,
	    random(0,255,R1),
	    random(0,255,G1),
	    random(0,255,B1),
	    assert(stars(I,R1,G1,B1,D2,A1))
	;   assert(stars(I,R,G,B,D1,A1))
	),
	I1 is I + 1,
	draw_stars(I1, Max).


stars_twinkle(0,_).
stars_twinkle(1,0).
stars_twinkle(1,I) :-
	X is I - 1,
	stars(X,R,G,B,_,_),
	glColor4ub(R,G,B,255),
	kGL_QUADS(QUADS),
	glBegin(QUADS),
	glTexCoord2f(0.0, 0.0), glVertex3f(-1.0,-1.0, 0.0),
	glTexCoord2f(1.0, 0.0), glVertex3f( 1.0,-1.0, 0.0),
	glTexCoord2f(1.0, 1.0), glVertex3f( 1.0, 1.0, 0.0),
	glTexCoord2f(0.0, 1.0), glVertex3f(-1.0, 1.0, 0.0),
	glEnd.



display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_TEXTURE_2D(TEXTURE_2D),
	loop(LOOP),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	texture(Texture),
	glBindTexture(TEXTURE_2D, Texture),
	draw_stars(0,LOOP),
	glutSwapBuffers.

init:-
	% defs
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_BLEND(BLEND),
	kGL_SRC_ALPHA(ALPHA),
	kGL_ONE(ONE),
	kGL_SMOOTH(SMOOTH),
	kGL_TEXTURE_MAG_FILTER(MAG_FILTER),
	kGL_TEXTURE_MIN_FILTER(MIN_FILTER),
	kGL_RGB(RGB),
	kGL_UNSIGNED_BYTE(UNSIGNED_BYTE),
	kGL_LINEAR(LINEAR),
	kGL_PERSPECTIVE_CORRECTION_HINT(PERSPECTIVE),
	kGL_NICEST(NICEST),
	% gl code
	loadGLTextures('Data/Star.bmp',Width,Height,Data),
	glGenTextures(1,TextureNames),
	nth1(1,TextureNames,Texture),
	glBindTexture(TEXTURE_2D,Texture),
	glTexParameteri(TEXTURE_2D, MAG_FILTER, LINEAR),
	glTexParameteri(TEXTURE_2D, MIN_FILTER, LINEAR),
	glTexImage2D(TEXTURE_2D, 0, 3, Width, Height, 0, RGB, UNSIGNED_BYTE, Data),
	glEnable(TEXTURE_2D),
	glShadeModel(SMOOTH),
	glClearColor(0.0, 0.0, 0.0, 0.5),
	glClearDepth(1.0),
	glHint(PERSPECTIVE,NICEST),
	glBlendFunc(ALPHA, ONE),
	glEnable(BLEND).


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
% Press s key
keyboard(119,_,_) :-
	zoom(Z),
	Z1 is Z - 0.5,
	retract(zoom(_)),
	assert(zoom(Z1)).
% Press s key
keyboard(115,_,_) :-
	zoom(Z),
	Z1 is Z + 0.5,
	retract(zoom(_)),
	assert(zoom(Z1)).
% Press a key
keyboard(97,_,_) :-
	tilt(T),
	T1 is T - 0.5,
	retract(tilt(_)),
	assert(tilt(T1)).
% Press d key
keyboard(100,_,_) :-
	tilt(T),
	T1 is T + 0.5,
	retract(tilt(_)),
	assert(tilt(T1)).
% Press t key
keyboard(116,_,_) :-
	twinkle(T),
	retract(twinkle(_)),
	(   T = 1
	->  assert(twinkle(0))
	;   assert(twinkle(1))
	).

idle:-
	display.


main:-
	%create stars
	loop(LOOP),
	create_stars(0,LOOP),
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
	glutCreateWindow('NeHe''s Moving Bitmaps in 3D Space'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



