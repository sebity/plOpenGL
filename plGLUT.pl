% glut Predicates

glutCreateWindow(String):-
	c_glutCreateWindow(String).

glutDestroyWindow:-
	c_glutDestroyWindow.

glutDisplayFunc:-
	c_glutDisplayFunc.

glutFullScreen:-
	c_glutFullScreen.

glutGet(State, Answer):-
	c_glutGet(State, Answer).

glutDisplayFunc(String):-
	c_glutDisplayFunc(String).

glutIdleFunc(String):-
	c_glutIdleFunc(String).

glutInit:-
	c_glutInit.

glutInitDisplayMode(OptionList):-
	AppliedOptions is OptionList,
	c_glutInitDisplayMode(AppliedOptions).

glutInitWindowPosition(X,Y) :-
	Xs is X,
	Ys is Y,
	c_glutInitWindowPosition(Xs,Ys).

glutInitWindowSize(Width,Height):-
	W is Width,
	H is Height,
	c_glutInitWindowSize(W,H).

glutKeyboardFunc:-
	c_glutKeyboardFunc.

glutMainLoop:-
	c_glutMainLoop.

glutMotionFunc:-
	c_glutMotionFunc.

glutMouseFunc:-
	c_glutMouseFunc.

glutPostRedisplay:-
	c_glutPostRedisplay.

glutReshapeFunc:-
	c_glutReshapeFunc.

glutReshapeWindow(W,H):-
	c_glutReshapeWindow(W,H).

glutSetColor(Index, Red, Green, Blue) :-
    float(Red),
    float(Green),
    float(Blue),
    c_glutSetColor(Index, Red, Green, Blue).

glutSolidCone(Radius, Height, Slices, Stacks):-
    float(Radius),
    float(Height),
    L is Slices,
    T is Stacks,
    c_glutSolidCone(Radius, Height, L, T).

glutSolidCube(Size) :-
    float(Size),
    c_glutSolidCube(Size).

glutSolidSphere(Radius, Slices, Stacks):-
    float(Radius),
    L is Slices,
    T is Stacks,
    c_glutSolidSphere(Radius, L, T).

glutSolidTeapot(Size) :-
    float(Size),
    c_glutSolidTeapot(Size).

glutSolidTorus(InnerRadius, OuterRadius, NSides, Rings):-
    float(InnerRadius),
    float(OuterRadius),
    N is NSides,
    R is Rings,
    c_glutSolidTorus(InnerRadius, OuterRadius, N, R).

glutSwapBuffers:-
	c_glutSwapBuffers.

glutWireCone(Radius, Height, Slices, Stacks):-
    float(Radius),
    float(Height),
    L is Slices,
    T is Stacks,
    c_glutWireCone(Radius, Height, L, T).

glutWireCube(Size) :-
    float(Size),
    c_glutWireCube(Size).

glutWireSphere(Radius, Slices, Stacks):-
    float(Radius),
    L is Slices,
    T is Stacks,
    c_glutWireSphere(Radius, L, T).

glutWireTeapot(Size) :-
    float(Size),
    c_glutWireTeapot(Size).

glutWireTorus(InnerRadius, OuterRadius, NSides, Rings):-
    float(InnerRadius),
    float(OuterRadius),
    N is NSides,
    R is Rings,
    c_glutWireTorus(InnerRadius, OuterRadius, N, R).
