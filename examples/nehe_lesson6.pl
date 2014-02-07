:- use_foreign_library(foreign(plOpenGL)).
:- use_module(library(plOpenGL)).
:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).


:- dynamic xrot/1,yrot/1,zrot/1,texture/1.

width(640).
height(480).
xrot(0.0).
yrot(0.0).
zrot(0.0).
texture(1).

display:-
	% defs
	kGL_COLOR_BUFFER_BIT(COLOR_BUFFER),
	kGL_DEPTH_BUFFER_BIT(DEPTH_BUFFER),
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_QUADS(QUAD),
	% gl code
	glClear(COLOR_BUFFER \/ DEPTH_BUFFER),
	glLoadIdentity,
	glTranslatef(0.0, 0.0, -5.0),
	xrot(X),
	yrot(Y),
	zrot(Z),
	glRotatef(X, 1.0, 0.0, 0.0),
	glRotatef(Y, 0.0, 1.0, 0.0),
	glRotatef(Z, 0.0, 0.0, 1.0),
	% Draw a Triangle
	texture(Texture),
	glBindTexture(TEXTURE_2D, Texture),
	glBegin(QUAD),
	% Front Face
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0,  1.0),
	% Back Face
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0, -1.0),
	% Top Face
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0,  1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	% Bottom Face
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0, -1.0, -1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	% Right Face
	glTexCoord2f(1.0, 0.0),
	glVertex3f( 1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f( 1.0,  1.0, -1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f( 1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 0.0),
	glVertex3f( 1.0, -1.0,  1.0),
	% Left Face
	glTexCoord2f(0.0, 0.0),
	glVertex3f(-1.0, -1.0, -1.0),
	glTexCoord2f(1.0, 0.0),
	glVertex3f(-1.0, -1.0,  1.0),
	glTexCoord2f(1.0, 1.0),
	glVertex3f(-1.0,  1.0,  1.0),
	glTexCoord2f(0.0, 1.0),
	glVertex3f(-1.0,  1.0, -1.0),
	glEnd,
	X1 is X + 0.3,
	retract(xrot(_)),
	assert(xrot(X1)),
	Y1 is Y + 0.2,
	retract(yrot(_)),
	assert(yrot(Y1)),
	Z1 is Z + 0.4,
	retract(zrot(_)),
	assert(zrot(Z1)),
	sleep(30),
	glutSwapBuffers.

init:-
	% defs
	kGL_TEXTURE_2D(TEXTURE_2D),
	kGL_LEQUAL(LEQUAL),
	kGL_DEPTH_TEST(DEPTH_TEST),
	kGL_SMOOTH(SMOOTH),
	kGL_TEXTURE_MAG_FILTER(MAG_FILTER),
	kGL_TEXTURE_MIN_FILTER(MIN_FILTER),
	kGL_RGB(RGB),
	kGL_UNSIGNED_BYTE(UNSIGNED_BYTE),
	kGL_LINEAR(LINEAR),
	kGL_PERSPECTIVE_CORRECTION_HINT(PERSPECTIVE),
	kGL_NICEST(NICEST),
	% gl code
	loadGLTextures('Data/NeHe.bmp',Width,Height,Data),
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
	glEnable(DEPTH_TEST),
	glDepthFunc(LEQUAL),
	glHint(PERSPECTIVE,NICEST).


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
	glutCreateWindow('NeHe''s Texture Mapping'),
	init,
	glutDisplayFunc,
	glutIdleFunc(idle),
	glutReshapeFunc,
	glutKeyboardFunc,
	glutMainLoop.



