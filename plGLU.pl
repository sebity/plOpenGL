% glu Predicates

gluBuild2DMipmaps(Target,Internal,Width,Height,Format,Type,Texels):-
	c_gluBuild2DMipmaps(Target,Internal,Width,Height,Format,Type,Texels).

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

gluOrtho2D(Left, Right, Bottom, Top):-
    float(Left),
    float(Right),
    float(Bottom),
    float(Top),
    c_gluOrtho2D(Left, Right, Bottom, Top).


gluPerspective(Fovy,Aspect,Near,Far):-
	float(Fovy),
	float(Aspect),
	float(Near),
	float(Far),
	c_gluPerspective(Fovy,Aspect,Near,Far).

