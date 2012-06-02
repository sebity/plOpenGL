% gl Predicates

eq(X,X).

% Operates on the accumulation buffer.
glAccum(Operation,Value):-
	float(Value),
	c_glAccum(Operation,Value).

% Specify which texture unit is active.
glActiveTextureARB(Texture):-
	c_glActiveTextureARB(Texture).

% Specify the alpha test function.
glAlphaFunc(Func, Ref):-
	float(Ref),
	c_glAlphaFunc(Func, Ref).

% Render a vertex using the specified vertex array element.
glArrayElement(Index):-
	c_glArrayElement(Index).

% Delimits the vertices of a primitive or group of like primitives.
glBegin(Mode):-
	c_glBegin(Mode).

% Binds a named texture to a texturing target.
glBindTexture(Target,Texture):-
	c_glBindTexture(Target,Texture).

% Draws a Bitmap
glBitmap(W,H,X1,Y1,X2,Y2,Bitmap):-
	size(Bitmap,N),
	float(X1),
	float(Y1),
	float(X2),
	float(Y2),
	c_glBitmap(W,H,X1,Y1,X2,Y2,Bitmap,N).

% Specifies pixel arithmetic.
glBlendFunc(SFactor,DFactor):-
	c_glBlendFunc(SFactor,DFactor).

glCallList(OptionList) :-
	c_glCallList(OptionList).

glClear(OptionList):-
	Applied_options is OptionList,
	c_glClear(Applied_options).

glClearColor(R,G,B,A) :-
	float(R),
	float(G),
	float(B),
	float(A),
	c_glClearColor(R,G,B,A).

glClearDepth(Depth) :-
	float(Depth),
	c_glClearDepth(Depth).

glClearIndex(Index) :-
	float(Index),
	c_glClearIndex(Index).

glClearStencil(S):-
	c_glClearStencil(S).

glClipPlane(Plane,Equation) :-
	size(Equation,N),
	c_glClipPlane(Plane,Equation,N).

glColor3f(Red,Green,Blue):-
	float(Red),
	float(Green),
	float(Blue),
	c_glColor3f(Red,Green,Blue).

glColor4f(Red,Green,Blue,Alpha):-
	float(Red),
	float(Green),
	float(Blue),
	float(Alpha),
	c_glColor4f(Red,Green,Blue,Alpha).

glCopyPixels(X, Y, Width, Height, Type):-
    c_glCopyPixels(X, Y, Width, Height, Type).

glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border):-
    c_glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border).

glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border):-
    c_glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border).

glCullFace(Mode):-
	Mode_Eval is Mode,
	c_glCullFace(Mode_Eval).

glDepthFunc(Mode):-
	Mode_Eval is Mode,
	c_glDepthFunc(Mode_Eval).

glDisable(Mode):-
	Mode_Eval is Mode,
	c_glDisable(Mode_Eval).

glEnable(Mode):-
	Mode_Eval is Mode,
	c_glEnable(Mode_Eval).

% Delimits the vertices of a primitive or group of like primitives.
glEnd:-
	c_glEnd.

glEndList :-
	c_glEndList.

glFinish:-
	c_glFinish.

glFlush:-
	c_glFlush.

glFogf(PName, Param):-
	float(Param),
	c_glFogf(PName, Param).

glFogi(PName, Param):-
	c_glFogi(PName, Param).

glFrustum(Left,Right,Top,Bottom,Near,Far):-
	float(Left),
	float(Right),
	float(Top),
	float(Bottom),
	float(Near),
	float(Far),
	c_glFrustum(Left,Right,Top,Bottom,Near,Far).

glGenTextures(N,Texture):-
    size(Texture,Num),
    c_glGenTextures(N,Texture, Num).

glHint(Target,Hint):-
	T is Target,
	H is Hint,
	c_glHint(T,H).

glIndexi(Index):-
    c_glIndexi(Index).

glLightfv(Light, PName, Params):-
	size(Params,N),
	c_glLightfv(Light, PName, Params, N).

glLightModelfv(PName, Params):-
	size(Params,N),
	c_glLightModelfv(PName, Params, N).

glLineStipple(Factor,Pattern):-
	F is Factor,
	P is Pattern,
	c_glLineStipple(F,P).

glLineWidth(Width) :-
	float(Width),
	c_glLineWidth(Width).

glLoadIdentity:-
	c_glLoadIdentity.

glMaterialfv(Face, PName, Params):-
	size(Params,N),
	c_glMaterialfv(Face, PName, Params, N).

glMatrixMode(Mode):-
	c_glMatrixMode(Mode).

glNewList(List,Mode) :-
	c_glNewList(List,Mode).

glOrtho(Left,Right,Top,Bottom,Near,Far):-
	float(Left),
	float(Right),
	float(Top),
	float(Bottom),
	float(Near),
	float(Far),
	c_glOrtho(Left,Right,Top,Bottom,Near,Far).

glPixelStorei(Mode,Param) :-
    c_glPixelStorei(Mode,Param).

glPointSize(Size):-
	float(Size),
	c_glPointSize(Size).

glPopAttrib:-
	c_glPopAttrib.

glPopClientAttrib:-
	c_glPopClientAttrib.

glPopMatrix:-
	c_glPopMatrix.

glPopName:-
	c_glPopName.

glPushAttrib(Mask):-
    c_glPushAttrib(Mask).

glPushClientAttrib(Mask):-
    c_glPushClientAttrib(Mask).

glPushMatrix:-
	c_glPushMatrix.

glPushName(Name):-
    c_glPushName(Name).

glRasterPos2i(X,Y):-
    c_glRasterPos2i(X,Y).

glRectf(X1,Y1,X2,Y2) :-
	float(X1),
	float(Y1),
	float(X2),
	float(Y2),
	c_glRectf(X1,Y1,X2,Y2).

glRotatef(Angle,X,Y,Z) :-
	float(Angle),
	float(X),
	float(Y),
	float(Z),
	c_glRotatef(Angle,X,Y,Z).

glScalef(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glScalef(X,Y,Z).

glShadeModel(Mode):-
	c_glShadeModel(Mode).

glStencilFunc(Func, Ref, Mask):-
	c_glStencilFunc(Func, Ref, Mask).

glStencilMask(Mask):-
	c_glStencilMask(Mask).

glStencilOp(Fail, ZFail, ZPass):-
	c_glStencilOp(Fail, ZFail, ZPass).

glTexCoord2f(S,T):-
	float(S),
	float(T),
	c_glTexCoord2f(S,T).

glTexImage2D(Target,Level,Internal,Width,Height,Border,Format,Type,Texels):-
	c_glTexImage2D(Target,Level,Internal,Width,Height,Border,Format,Type,Texels).

glTexParameteri(Target,PName,Param):-
	c_glTexParameteri(Target,PName,Param).

glTranslatef(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glTranslatef(X,Y,Z).

glVertex2f(X,Y):-
	float(X),
	float(Y),
	c_glVertex2f(X,Y).

glVertex2i(X,Y):-
	c_glVertex2i(X,Y).

glVertex3d(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glVertex3d(X,Y,Z).

glVertex3f(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glVertex3f(X,Y,Z).

glVertex3i(X,Y,Z):-
	c_glVertex3i(X,Y,Z).

glViewport(X,Y,W,H):-
	c_glViewport(X,Y,W,H).






