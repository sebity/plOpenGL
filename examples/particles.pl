:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


:- dynamic texture/2,particle/17,xstrength/1,ystrength/1,zstrength/1,show_particles/1,zoom/1,rainbow/1,fullscreen/1.

width(800).
height(600).
max_particles(1000).
max_particles_age(1).
max_bounce_count(5).
show_particles(200).
rainbow(0).
r(0.8).
g(0.2).
b(0.0).
cR(0.001).
cG(0.002).
cB(0.003).
xstrength(20.0).
ystrength(20.0).
zstrength(20.0).
zoom(-10.0).
fullscreen(0).

colors(0, 1.0, 0.5, 0.5).
colors(1, 1.0, 0.75, 0.5).
colors(2, 1.0, 1.0, 0.5).
colors(3, 0.75, 1.0, 0.5).
colors(4, 0.5, 1.0, 0.5).
colors(5, 0.5, 1.0, 0.75).
colors(6, 0.5, 1.0, 1.0).
colors(7, 0.5, 0.75, 1.0).
colors(8, 0.5, 0.5, 1.0).
colors(9, 0.75, 0.5, 1.0).
colors(10, 1.0, 0.5, 1.0).
colors(11, 1.0, 0.5, 0.75).

bmp(1, 'Data/particle.bmp').
bmp(2, 'Data/plane.bmp').

/* Template of a particle struct
PARTICLE {
	  int Id,
	  float X,Y,Z;
	  float sX,sY,sZ;
	  float tX,tY,tZ;
	  float R,B,G;
	  bool Active; int Age; int MaxAge; int BounceCount;
	 }
*/

init_particles(X,X).
init_particles(P,Max) :-
	assert(particle(P,
			_, _, _,
			_, _, _,
			0.0, (-1.0), 0.0,
			_, _, _,
			0, _, _, _)),
	P1 is P + 1,
	init_particles(P1, Max).


activate_particles(X,X).
activate_particles(P,Max) :-
	rainbow(RAINBOW),
	particle(P,
		 _, _, _,
		 _, _, _,
		 _, _, _,
		 _, _, _,
		 Active, _, _, _),
	(   Active = 0
	->  random(0.0, 100.0, SX_Temp),
	    random(0.0, 100.0, SY_Temp),
	    random(0.0, 100.0, SZ_Temp),
	    SX is (((SX_Temp + 1.0) / 1000.0) - 0.05),
	    SY is ((SY_Temp + 50.0) / 500.0),
	    SZ is (((SZ_Temp + 1.0) / 1000.0) - 0.05),
	    max_particles_age(MPA),
	    (	RAINBOW = 0
	    ->	r(R),
		g(G),
		b(B),
		cR(CR),
		cG(CG),
		cB(CB),
		R1 is R + CR,
		G1 is G + CG,
		B1 is B + CB
	    ;	TEMP is integer((P + 1) / (Max / 11)),
		colors(TEMP, R1, G1, B1)
	    ),
	    retract(particle(P,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _, _)),
	    assert(particle(P,
			    0.0, 0.0, 0.0,
			    SX, SY, SZ,
			    0.0, (-1.0), 0.0,
			    R1, G1, B1,
			    1, 0, MPA, 0))
	;   write('')
	),
	P1 is P + 1,
	activate_particles(P1,Max).


adjust_particles(X,X).
adjust_particles(P,Max) :-
	xstrength(XSTRENGTH),
	ystrength(YSTRENGTH),
	zstrength(ZSTRENGTH),
	max_bounce_count(MBC),
	max_particles_age(MPA),
	particle(P,
		 X, Y, Z,
		 SX, SY, SZ,
		 TX, TY, TZ,
		 R, G, B,
		 Active, Age, MPA, Bounce),

	SX1 is (SX + ((TX - SX) / XSTRENGTH)),
	SY1 is (SY + ((TY - SY) / YSTRENGTH)),
	SZ1 is (SZ + ((TZ - SZ) / ZSTRENGTH)),
	X1 is (X + SX1),
	Y1 is (Y + SY1),
	Z1 is (Z + SZ1),
	retract(particle(P,
			 _, _, _,
			 _, _, _,
			 _, _, _,
			 _, _, _,
			 _, _, _, _)),
	assert(particle(P,
			X1, Y1, Z1,
			SX1,SY1, SZ1,
			TX, TY, TZ,
			R, G, B,
			Active, Age, MPA, Bounce)),

	(   Y1 < 0.0
	->  particle(P,
		     X2, _, Z2,
		     SX2,SY2_Temp, SZ2,
		     TX2, TY2, TZ2,
		     R2, G2, B2,
		     Active2, Age2, MPA2, Bounce2_Temp),
	    Y2 is 0.0,
	    SY2 is (-SY2_Temp),
	    Bounce2 is Bounce2_Temp + 1,
	    retract(particle(P,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _, _)),


	    (	Bounce2 > MBC
	    ->	assert(particle(P,
			    X2, Y2, Z2,
			    SX2,SY2, SZ2,
			    TX2, TY2, TZ2,
			    R2, G2, B2,
			    0, Age2, MPA2, Bounce2))
	    ;	assert(particle(P,
			    X2, Y2, Z2,
			    SX2,SY2, SZ2,
			    TX2, TY2, TZ2,
			    R2, G2, B2,
			    Active2, Age2, MPA2, Bounce2))
	    )
	;   write('')
	),
	Age_Temp is Age + 1,
	(   Age_Temp > MPA
	->  particle(P,
		     X3, Y3, Z3,
		     SX3,SY3, SZ3,
		     TX3, TY3, TZ3,
		     R3, G3, B3,
		     _, Age3, MPA3, Bounce3),
	    retract(particle(P,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _,
			     _, _, _, _)),
	    assert(particle(P,
			    X3, Y3, Z3,
			    SX3, SY3, SZ3,
			    TX3, TY3, TZ3,
			    R3, G3, B3,
			    0, Age3, MPA3, Bounce3))
	;   write('')
	),
	P1 is P + 1,
	adjust_particles(P1,Max).





render_particles(X,X).
render_particles(P,Max) :-
	kGL_DEPTH_TEST(DEPTH),
	kGL_BLEND(BLEND),
	kGL_SRC_COLOR(SRC_COLOR),
	kGL_ONE(ONE),
	kGL_TEXTURE_2D(TEXTURE_2D),

	texture(1, BMP),
	glEnable(TEXTURE_2D),
	glBindTexture(TEXTURE_2D, BMP),

	glDisable(DEPTH),

	glEnable(BLEND),
	glBlendFunc(SRC_COLOR, ONE),

	particle(P,
		 X, Y, Z,
		 _, _, _,
		 _, _, _,
		 R, G, B,
		 _, _, _, _),
	glColor4f(R, G, B, 0.9),

	glPushMatrix,
	glTranslatef(X,Y,Z),

	kGL_QUADS(QUADS),
	glBegin(QUADS),
	glNormal3f(0.0, 0.0, 1.0),

	glTexCoord2f(0.0, 0.0),
	glVertex3f(-0.1, -0.1, 0.0),

	glTexCoord2f(1.0, 0.0),
	glVertex3f(0.1, -0.1, 0.0),

	glTexCoord2f(1.0, 1.0),
	glVertex3f(0.1, 0.1, 0.0),

	glTexCoord2f(0.0, 1.0),
	glVertex3f(-0.1, 0.1, 0.0),
	glEnd,

	glPopMatrix,

	glEnable(DEPTH),
	P1 is P + 1,
	render_particles(P1,Max).


display:-
	show_particles(SHOW),
	zoom(ZOOM),
	activate_particles(0,SHOW),
	adjust_particles(0,SHOW),
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_QUADS(QUADS),
	kGL_BLEND(BLEND),
	kGL_ONE_MINUS_SRC_ALPHA(ONE_MINUS),
	kGL_SRC_ALPHA(ALPHA),
	kGL_TEXTURE_2D(TEXTURE_2D),

	texture(2, BMP),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glLoadIdentity,

	glTranslatef(0.0, -1.0, ZOOM),

	% Reflection code
	glPushMatrix,
	glScalef(1.0, -1.0, 1.0),
	render_particles(0,SHOW),
	glPopMatrix,

	glEnable(BLEND),
	glBlendFunc(ONE_MINUS, ALPHA),

	glColor4f(0.0, 0.2, 0.2, 0.4),

	glEnable(TEXTURE_2D),
	glBindTexture(TEXTURE_2D, BMP),
	glBegin(QUADS),
	glNormal3f(0.0, 1.0, 0.0),
	glTexCoord2f(0.0, 0.0), glVertex3f(-10.0, 0.0, 10.0),
	glTexCoord2f(1.0, 0.0), glVertex3f( 10.0, 0.0, 10.0),
	glTexCoord2f(1.0, 1.0), glVertex3f( 10.0, 0.0,-10.0),
	glTexCoord2f(0.0, 1.0), glVertex3f(-10.0, 0.0,-10.0),
	glEnd,


	render_particles(0,SHOW),
	sleep(20),
	glutSwapBuffers.


load_texture(X) :-
	bmp(X, BMP),
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_TEXTURE_MAG_FILTER(MAG_FILTER),
	kGL_TEXTURE_MIN_FILTER(MIN_FILTER),
	kGL_RGB(RGB),
	kGL_UNSIGNED_BYTE(UNSIGNED_BYTE),
	kGL_LINEAR(LINEAR),
	loadGLTextures(BMP, Width, Height, Data),
	glGenTextures(1, TextureNames),
	nth1(1, TextureNames, Texture),
	glBindTexture(TEXTURE_2D, Texture),
	glTexParameteri(TEXTURE_2D, MAG_FILTER, LINEAR),
	glTexParameteri(TEXTURE_2D, MIN_FILTER, LINEAR),
	glTexImage2D(TEXTURE_2D, 0, 3, Width, Height, 0, RGB, UNSIGNED_BYTE, Data),
	assert(texture(X, Texture)),
	write('Texture: '),write(Texture),nl.


init:-
	% defs
	kGL_SMOOTH(SMOOTH),
	kGL_PERSPECTIVE_CORRECTION_HINT(PERSPECTIVE),
	kGL_POINT_SMOOTH_HINT(SMOOTH_HINT),
	kGL_NICEST(NICEST),
	kGL_DEPTH_TEST(DEPTH_TEST),
	% gl code
	glShadeModel(SMOOTH),
	glClearColor(0.0, 0.0, 0.0, 0.5),
	glClearDepth(1.0),
	glDisable(DEPTH_TEST),
	glHint(PERSPECTIVE,NICEST),
	glHint(SMOOTH_HINT,NICEST),
	load_texture(1),
	load_texture(2),
	max_particles(Max),
	init_particles(0, Max).


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
	%Aspect is float(W) / float(H),
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
	glMatrixMode(MODELVIEW),
	glLoadIdentity.


keyboard(27,_,_) :-
	write('Closing Window and Exiting...'),nl,
	glutDestroyWindow.
% Press 1 key
keyboard(49,_,_) :-
	xstrength(X),
	(   X > 1.0
	->  X1 is X - 1.0,
	    retract(xstrength(_)),
	    assert(xstrength(X1)),
	    write('X Strength: '),write(X1),nl
	;   write('X Strength: '),write(X),nl
	).
% Press 2 key
keyboard(50,_,_) :-
	xstrength(X),
	(   X < 100.0
	->  X1 is X + 1.0,
	    retract(xstrength(_)),
	    assert(xstrength(X1)),
	    write('X Strength: '),write(X1),nl
	;   write('X Strength: '),write(X),nl
	).
% Press 3 key
keyboard(51,_,_) :-
	ystrength(X),
	(   X > 1.0
	->  X1 is X - 1.0,
	    retract(ystrength(_)),
	    assert(ystrength(X1)),
	    write('Y Strength: '),write(X1),nl
	;   write('Y Strength: '),write(X),nl
	).
% Press 4 key
keyboard(52,_,_) :-
	ystrength(X),
	(   X < 100.0
	->  X1 is X + 1.0,
	    retract(ystrength(_)),
	    assert(ystrength(X1)),
	    write('Y Strength: '),write(X1),nl
	;   write('Y Strength: '),write(X),nl
	).
% Press 5 key
keyboard(53,_,_) :-
	zstrength(X),
	(   X > 1.0
	->  X1 is X - 1.0,
	    retract(zstrength(_)),
	    assert(zstrength(X1)),
	    write('Z Strength: '),write(X1),nl
	;   write('Z Strength: '),write(X),nl
	).
% Press 6 key
keyboard(54,_,_) :-
	zstrength(X),
	(   X < 100.0
	->  X1 is X + 1.0,
	    retract(zstrength(_)),
	    assert(zstrength(X1)),
	    write('Z Strength: '),write(X1),nl
	;   write('Z Strength: '),write(X),nl
	).

% Press 7 key
keyboard(55,_,_) :-
	show_particles(X),
	(   X > 10
	->  X1 is X - 10,
	    retract(show_particles(_)),
	    assert(show_particles(X1)),
	    write('Particles: '),write(X1),nl
	;   write('Particles: '),write(X),nl
	).
% Press 7 key
keyboard(56,_,_) :-
	show_particles(X),
	(   X < 1000
	->  X2 is X + 10,
	    retract(show_particles(_)),
	    assert(show_particles(X2)),
	    write('Particles: '),write(X2),nl
	;   write('Particles: '),write(X),nl
	).
% Press r key
keyboard(114,_,_) :-
	rainbow(X),
	(   X = 0
	->  retract(rainbow(_)),
	    assert(rainbow(1)),
	    write('Rainbow On'),nl
	;   retract(rainbow(_)),
	    assert(rainbow(0)),
	    write('Rainbow Off'),nl
	).
% Press w key
keyboard(119,_,_) :-
	zoom(X),
	(   X < -4.0
	->  X1 is X + 1.0,
	    retract(zoom(_)),
	    assert(zoom(X1)),
	    write('Zoom: '),write(X1),nl
	;   write('Zoom: '),write(X),nl
	).
% Press s key
keyboard(115,_,_) :-
	zoom(X),
	(   X > -10.0
	->  X1 is X - 1.0,
	    retract(zoom(_)),
	    assert(zoom(X1)),
	    write('Zoom: '),write(X1),nl
	;   write('Zoom: '),write(X),nl
	).
% Press f to toggle fullscreen
keyboard(102,_,_) :-
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
	% gl code
	glutInit,
	glutInitDisplayMode(DOUBLE \/ RGB \/ ALPHA),
	glutInitWindowSize(W, H),
	glutInitWindowPosition(0,0),
	glutCreateWindow('Particle Engine'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



