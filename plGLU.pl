:- module(plGLU,
	  [
	   gluBuild2DMipmaps/7,
	   gluLookAt/9,
	   gluOrtho2D/4,
	   gluPerspective/4
	  ]).

/** <module> GLU Interface

This module is the glu extension of the Prolog OpenGL Interface
(plOpengL)

  @author Jan Tatham
  @license LGPL 2.1
*/

/** gluBuild2DMipmaps(+Target, +Internal, +Width, +Height, +Format, +Type, +Texels).

Builds a two-dimensional mipmap
*/
gluBuild2DMipmaps(Target,Internal,Width,Height,Format,Type,Texels):-
	c_gluBuild2DMipmaps(Target,Internal,Width,Height,Format,Type,Texels).


/** gluLookAt(+EyeX, +EyeY, +EyeZ, +CenterX, +CenterY, +CenterZ, +UpX, +UpY, +UpZ).

Defines a viewing transformation.
*/
gluLookAt(EyeX, EyeY, EyeZ, CenterX, CenterY, CenterZ, UpX, UpY, UpZ):-
	float(EyeX),
	float(EyeY),
	float(EyeZ),
	float(CenterX),
	float(CenterY),
	float(CenterZ),
	float(UpX),
	float(UpY),
	float(UpZ),
	c_gluLookAt(EyeX, EyeY, EyeZ, CenterX, CenterY, CenterZ, UpX, UpY, UpZ).


/** gluOrtho2D(+Left, +Right, +Bottom, +Top).

Define a 2D orthographic projection matrix
*/
gluOrtho2D(Left, Right, Bottom, Top):-
    float(Left),
    float(Right),
    float(Bottom),
    float(Top),
    c_gluOrtho2D(Left, Right, Bottom, Top).


/** gluPerspective(+Fovy, +Aspect, +Near, +Far).

Set up a perspective projection matrix
*/
gluPerspective(Fovy,Aspect,Near,Far):-
	float(Fovy),
	float(Aspect),
	float(Near),
	float(Far),
	c_gluPerspective(Fovy,Aspect,Near,Far).

