:- module(plGLUT,
	  [
	   glutCreateWindow/1,
	   glutDestroyWindow/0,
	   glutDisplayFunc/0,
	   glutFullScreen/0,
	   glutGet/2,
	   glutDisplayFunc/1,
	   glutIdleFunc/1,
	   glutInit/0,
	   glutInitDisplayMode/1,
	   glutInitWindowPosition/2,
	   glutInitWindowSize/2,
	   glutKeyboardFunc/0,
	   glutMainLoop/0,
	   glutMotionFunc/0,
	   glutMouseFunc/0,
	   glutPostRedisplay/0,
	   glutReshapeFunc/0,
	   glutReshapeWindow/2,
	   glutSetColor/4,
	   glutSolidCone/4,
	   glutSolidCube/1,
	   glutSolidSphere/3,
	   glutSolidTeapot/1,
	   glutSolidTorus/4,
	   glutSwapBuffers/0,
	   glutWireCone/4,
	   glutWireCube/1,
	   glutWireSphere/3,
	   glutWireTeapot/1,
	   glutWireTorus/4
	  ]).

/** <module> GLUT Interface

 This module is the glut extension of the Prolog OpenGL Interface
 (plOpengL)

  @author Jan Tatham
  @license LGPL 2.1
*/

%%	glutCreateWindow(+String)
% Creates a top-level window
glutCreateWindow(String):-
	c_glutCreateWindow(String).

%%	glutDestroyWindow
% Destroys the window
glutDestroyWindow:-
	c_glutDestroyWindow.

%%	glutDisplayFunc
% Sets the display callback for the current window.
glutDisplayFunc:-
	c_glutDisplayFunc.

%%	glutFullScreen
% Requests that the current window be made full screen.
glutFullScreen:-
	c_glutFullScreen.

%%	glutGet(+State, -Answer)
% Retrieves simple GLUT state represented by integers.
glutGet(State, Answer):-
	c_glutGet(State, Answer).

%%	glutDisplayFunc(+String)
% Requests that the current window be made full screen.
glutDisplayFunc(String):-
	c_glutDisplayFunc(String).

%%	glutIdleFunc(+String)
% Sets the global idle callback.
glutIdleFunc(String):-
	c_glutIdleFunc(String).

%%	glutInit
% Used to initialize the GLUT library.
glutInit:-
	c_glutInit.

%%	glutInitDisplayMode(+OptionList)
% Sets the initial display mode.
glutInitDisplayMode(OptionList):-
	AppliedOptions is OptionList,
	c_glutInitDisplayMode(AppliedOptions).

%%	glutInitWindowPosition(+X, +Y)
%  set the initial window position.
glutInitWindowPosition(X,Y) :-
	Xs is X,
	Ys is Y,
	c_glutInitWindowPosition(Xs,Ys).

%%	glutInitWindowSize(+X, +Y)
%  set the initial window size.
glutInitWindowSize(Width,Height):-
	W is Width,
	H is Height,
	c_glutInitWindowSize(W,H).

%%	glutKeyboardFunc
% Sets the keyboard callback for the current window.
glutKeyboardFunc:-
	c_glutKeyboardFunc.

%%	glutMainLoop
% Enters the GLUT event processing loop.
glutMainLoop:-
	c_glutMainLoop.

%%	glutMotionFunc
% Set the motion and passive motion callbacks respectively
% for the current window.
glutMotionFunc:-
	c_glutMotionFunc.

%%	glutMouseFunc
% Sets the mouse callback for the current window.
glutMouseFunc:-
	c_glutMouseFunc.

%%	glutPostRedisplay
% Marks the current window as needing to be redisplayed.
glutPostRedisplay:-
	c_glutPostRedisplay.

%%	glutReshapeFunc
% Sets the reshape callback for the current window.
glutReshapeFunc:-
	c_glutReshapeFunc.

%%	glutReshapeWindow(+W, +H)
% Requests a change to the size of the current window.
glutReshapeWindow(W,H):-
	c_glutReshapeWindow(W,H).

%%	glutSetColor(+Index, +Red, +Green, +Blue)
% Sets the color of a colormap entry in the layer of use
% for the current window.
glutSetColor(Index, Red, Green, Blue) :-
    float(Red),
    float(Green),
    float(Blue),
    c_glutSetColor(Index, Red, Green, Blue).

%%	glutSolidCone(+Radius, +Height, +Slices, +Stacks).
% Render a solid cone
glutSolidCone(Radius, Height, Slices, Stacks):-
    float(Radius),
    float(Height),
    L is Slices,
    T is Stacks,
    c_glutSolidCone(Radius, Height, L, T).

%%	glutSolidCube(+Size)
% Render a solid cube
glutSolidCube(Size) :-
    float(Size),
    c_glutSolidCube(Size).

%%	glutSolidSphere(+Radius, +Slices, +Stacks)
% Render a solid sphere
glutSolidSphere(Radius, Slices, Stacks):-
    float(Radius),
    L is Slices,
    T is Stacks,
    c_glutSolidSphere(Radius, L, T).

%%	glutSolidTeapot(+Size)
% Render a solid teapot
glutSolidTeapot(Size) :-
    float(Size),
    c_glutSolidTeapot(Size).

%%	glutSolidTorus(+InnerRadius, +OuterRadius, +NSides, +Rings)
% Render a solid torus
glutSolidTorus(InnerRadius, OuterRadius, NSides, Rings):-
    float(InnerRadius),
    float(OuterRadius),
    N is NSides,
    R is Rings,
    c_glutSolidTorus(InnerRadius, OuterRadius, N, R).

%%	glutSwapBuffers
% Swaps the buffers of the current window if double buffered.
glutSwapBuffers:-
	c_glutSwapBuffers.

%%	glutWireCone(+Radius, +Height, +Slices, +Stacks).
% Render a wireframe cone
glutWireCone(Radius, Height, Slices, Stacks):-
    float(Radius),
    float(Height),
    L is Slices,
    T is Stacks,
    c_glutWireCone(Radius, Height, L, T).

%%	glutWireCube(+Size)
% Render a wireframe cube
glutWireCube(Size) :-
    float(Size),
    c_glutWireCube(Size).

%%	glutWireSphere(+Radius, +Slices, +Stacks)
% Render a wireframe sphere
glutWireSphere(Radius, Slices, Stacks):-
    float(Radius),
    L is Slices,
    T is Stacks,
    c_glutWireSphere(Radius, L, T).

%%	glutWireTeapot(+Size)
% Render a wireframe teapot
glutWireTeapot(Size) :-
    float(Size),
    c_glutWireTeapot(Size).

%%	glutWireTorus(+InnerRadius, +OuterRadius, +NSides, +Rings)
% Render a wireframe torus
glutWireTorus(InnerRadius, OuterRadius, NSides, Rings):-
    float(InnerRadius),
    float(OuterRadius),
    N is NSides,
    R is Rings,
    c_glutWireTorus(InnerRadius, OuterRadius, N, R).
