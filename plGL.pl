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

% Execute a display list
glCallList(OptionList) :-
	c_glCallList(OptionList).

% Clear buffers to preset values
glClear(OptionList):-
	Applied_options is OptionList,
	c_glClear(Applied_options).

% Specify clear values for the accumulation buffer
glClearAccum(R,G,B,A) :-
	float(R),
	float(G),
	float(B),
	float(A),
	c_glClearAccum(R,G,B,A).

% Specify clear values for the color buffers
glClearColor(R,G,B,A) :-
	float(R),
	float(G),
	float(B),
	float(A),
	c_glClearColor(R,G,B,A).

% Specify the clear value for the depth buffer
glClearDepth(Depth) :-
	float(Depth),
	c_glClearDepth(Depth).

% Specify the clear value for the color index buffers
glClearIndex(Index) :-
	float(Index),
	c_glClearIndex(Index).

% Specify the clear value for the stencil buffer
glClearStencil(S):-
	c_glClearStencil(S).

% Specify a plane against which all geometry is clipped
glClipPlane(Plane,Equation) :-
	size(Equation,N),
	c_glClipPlane(Plane,Equation,N).

% Sets the current color.
glColor3b(Red,Green,Blue):-
	c_glColor3b(Red,Green,Blue).

% Sets the current color.
glColor3bv(Red,Green,Blue):-
	c_glColor3bv(Red,Green,Blue).

% Sets the current color.
glColor3f(Red,Green,Blue):-
	float(Red),
	float(Green),
	float(Blue),
	c_glColor3f(Red,Green,Blue).

% Sets the current color.
glColor3i(Red,Green,Blue):-
	c_glColor3i(Red,Green,Blue).


% Sets the current color.
glColor3s(Red,Green,Blue):-
	c_glColor3s(Red,Green,Blue).

% Sets the current color.
glColor3iv(Red,Green,Blue):-
	c_glColor3iv(Red,Green,Blue).

% Sets the current color.
glColor4f(Red,Green,Blue,Alpha):-
	float(Red),
	float(Green),
	float(Blue),
	float(Alpha),
	c_glColor4f(Red,Green,Blue,Alpha).

% Sets the current color.
glColor4ub(Red,Green,Blue,Alpha):-
	c_glColor4ub(Red,Green,Blue,Alpha).

% Enable and disable writing of frame buffer color components
glColorMask(Red,Green,Blue,Alpha):-
	c_glColorMask(Red,Green,Blue,Alpha).

% Cause a material color to track the current color
glColorMaterial(Face, Mode):-
	c_glColorMaterial(Face,Mode).

% Copy pixels into a color table
glCopyColorTable(Target, Format, X, Y, Width):-
    c_glCopyColorTable(Target, Format, X, Y, Width).

% Copy pixels in the frame buffer
glCopyPixels(X, Y, Width, Height, Type):-
    c_glCopyPixels(X, Y, Width, Height, Type).

% Copy pixels into a 1D texture image
glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border):-
    c_glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border).

% Copy pixels into a 2D texture image
glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border):-
    c_glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border).

% Copy a one-dimensional texture subimage
glCopyTexSubImage1D(Target, Level, XOffset, X, Y, Width):-
    c_glCopyTexSubImage1D(Target, Level, XOffset, X, Y, Width).

% Copy a two-dimensional texture subimage
glCopyTexSubImage2D(Target, Level, XOffset, YOffset, X, Y, Width, Height):-
    c_glCopyTexSubImage2D(Target, Level, XOffset, YOffset, X, Y, Width, Height).

% Specify whether front- or back-facing facets can be culled
glCullFace(Mode):-
	Mode_Eval is Mode,
	c_glCullFace(Mode_Eval).

% Specify the value used for depth buffer comparisons
glDepthFunc(Mode):-
	Mode_Eval is Mode,
	c_glDepthFunc(Mode_Eval).

% Enable or disable writing into the depth buffer
glDepthMask(Flag):-
    c_glDepthMask(Flag).

% Specify mapping of depth values from normalized device coordinates to window coordinates
glDepthRange(Near, Far) :-
    float(Near),
    float(Far),
    c_glDepthRange(Near, Far).

glDisable(Mode):-
	Mode_Eval is Mode,
	c_glDisable(Mode_Eval).

glDisableClientState(Cap):-
    c_glDisableClientState(Cap).

% Render primitives from array data
glDrawArrays(Mode, First, Count):-
    c_glDrawArrays(Mode, First, Count).

% Specify which color buffers are to be drawn into
glDrawBuffer(Mode):-
    c_glDrawBuffer(Mode).

% Render primitives from array data
glDrawElements(Mode, Count, Type, Indices):-
    c_glDrawElements(Mode, Count, Type, Indices).

% Write a block of pixels to the frame buffer
glDrawPixels(Width, Height, Format, Type, Data):-
    c_glDrawPixels(Width, Height, Format, Type, Data).

glEnable(Mode):-
	Mode_Eval is Mode,
	c_glEnable(Mode_Eval).

glEnableClientState(Cap):-
    c_glEnableClientState(Cap).

% Delimits the vertices of a primitive or group of like primitives.
glEnd:-
	c_glEnd.

% Create or replace a display list
glEndList :-
	c_glEndList.

% Compute a one- or two-dimensional grid of points or lines
glEvalMesh1(Mode,I1,I2) :-
    c_glEvalMesh1(Mode,I1,I2).

% Compute a one- or two-dimensional grid of points or lines
glEvalMesh2(Mode,I1,I2,J1,J2) :-
    c_glEvalMesh2(Mode,I1,I2,J1,J2).

% Generate and evaluate a single point in a mesh
glEvalPoint1(I) :-
    c_glEvalPoint1(I).

% Generate and evaluate a single point in a mesh
glEvalPoint2(I,J) :-
    c_glEvalPoint2(I,J).


% block until all GL execution is complete
glFinish:-
	c_glFinish.

% Force execution of GL commands in finite time
glFlush:-
	c_glFlush.

% Specify fog parameters
glFogf(PName, Param):-
	float(Param),
	c_glFogf(PName, Param).

% Specify fog parameters
glFogi(PName, Param):-
	c_glFogi(PName, Param).

% define front- and back-facing polygons
glFrontFace(Mode):-
	c_glFrontFace(Mode).

glFrustum(Left,Right,Top,Bottom,Near,Far):-
	float(Left),
	float(Right),
	float(Top),
	float(Bottom),
	float(Near),
	float(Far),
	c_glFrustum(Left,Right,Top,Bottom,Near,Far).

glGenLists(Range):-
    c_glGenLists(Range).

glGenTextures(N,TextureNames):-
    c_glGenTextures(N,TextureNames).

% Return light source parameter values
glGetLightfv(Light, PName, Params) :-
    c_glGetLightfv(Light, PName, Params).

% Return light source parameter values
glGetLightiv(Light, PName, Params) :-
    c_glGetLightiv(Light, PName, Params).

% Return material parameters
glGetMaterialfv(Light, PName, Params) :-
    c_glGetMaterialfv(Light, PName, Params).

% Return material parameters
glGetMaterialiv(Light, PName, Params) :-
    c_glGetMaterialiv(Light, PName, Params).

glHint(Target,Hint):-
	T is Target,
	H is Hint,
	c_glHint(T,H).

glIndexi(Index):-
    c_glIndexi(Index).

glIndexMask(Mask):-
    c_glIndexMask(Mask).

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

% Load a name onto the name stack
glLoadName(Name):-
    c_glLoadName(Name).

glMaterialfv(Face, PName, Params):-
	size(Params,N),
	c_glMaterialfv(Face, PName, Params, N).

glMatrixMode(Mode):-
	c_glMatrixMode(Mode).

% Define minmax table
glMinmax(Target, InternalFormat, Sink):-
	c_glMinmax(Target, InternalFormat, Sink).

glNewList(List,Mode) :-
	c_glNewList(List,Mode).

glNormal3f(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glNormal3f(X,Y,Z).

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

glPolygonMode(Face, Mode):-
    c_glPolygonMode(Face, Mode).

% Set the scale and units used to calculate depth values
glPolygonOffset(Factor, Units):-
	float(Factor),
	float(Units),
	c_glPolygonOffset(Factor, Units).

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

% Select a color buffer source for pixels
glReadBuffer(Mode):-
    c_glReadBuffer(Mode).

% Draw a rectangle
glRectf(X1,Y1,X2,Y2) :-
	float(X1),
	float(Y1),
	float(X2),
	float(Y2),
	c_glRectf(X1,Y1,X2,Y2).

% Set rasterization mode
glRenderMode(Mode):-
    c_glRenderMode(Mode).

% Reset minmax table entries to initial values
glResetMinmax(Target):-
    c_glResetMinmax(Target).

% Multiply the current matrix by a rotation matrix
glRotated(Angle,X,Y,Z) :-
	float(Angle),
	float(X),
	float(Y),
	float(Z),
	c_glRotated(Angle,X,Y,Z).

% Multiply the current matrix by a rotation matrix
glRotatef(Angle,X,Y,Z) :-
	float(Angle),
	float(X),
	float(Y),
	float(Z),
	c_glRotatef(Angle,X,Y,Z).

% Multiply the current matrix by a general scaling matrix
glScaled(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glScaled(X,Y,Z).

% Multiply the current matrix by a general scaling matrix
glScalef(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glScalef(X,Y,Z).

glScissor(X,Y,Width,Height) :-
    c_glScissor(X,Y,Width,Height).

glShadeModel(Mode):-
	c_glShadeModel(Mode).

glStencilFunc(Func, Ref, Mask):-
	c_glStencilFunc(Func, Ref, Mask).

glStencilMask(Mask):-
	c_glStencilMask(Mask).

glStencilOp(Fail, ZFail, ZPass):-
	c_glStencilOp(Fail, ZFail, ZPass).

glTexCoord2d(S,T):-
	float(S),
	float(T),
	c_glTexCoord2d(S,T).

glTexCoord2f(S,T):-
	float(S),
	float(T),
	c_glTexCoord2f(S,T).

glTexImage1D(Target,Level,Internal,Width,Border,Format,Type,Texels):-
	c_glTexImage1D(Target,Level,Internal,Width,Border,Format,Type,Texels).

glTexImage2D(Target,Level,Internal,Width,Height,Border,Format,Type,Texels):-
	c_glTexImage2D(Target,Level,Internal,Width,Height,Border,Format,Type,Texels).

% Temporarily Disabled due to FFI Limitation
% glTexImage3D(Target,Level,Internal,Width,Height,Depth,Border,Format,Type,Texels):-
%	c_glTexImage3D(Target,Level,Internal,Width,Height,Depth,Border,Format,Type,Texels).
%

glTexParameteri(Target,PName,Param):-
	c_glTexParameteri(Target,PName,Param).

glTexSubImage1D(Target,Level,XOffset,Width,Format,Type,Texels):-
	c_glTexSubImage1D(Target,Level,XOffset,Width,Format,Type,Texels).

glTexSubImage2D(Target,Level,XOffset,YOffset,Width,Height,Format,Type,Texels):-
	c_glTexSubImage2D(Target,Level,XOffset,YOffset,Width,Height,Format,Type,Texels).

glTexSubImage3D(Target,Level,XOffset,YOffset,ZOffset,Width,Height,Depth,Format,Type,Texels):-
	c_glTexSubImage3D(Target,Level,XOffset,YOffset,ZOffset,Width,Height,Depth,Format,Type,Texels).

glTranslated(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glTranslated(X,Y,Z).

glTranslatef(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glTranslatef(X,Y,Z).

% Specify a vertex
glVertex2d(X,Y):-
	float(X),
	float(Y),
	c_glVertex2d(X,Y).

% Specify a vertex
glVertex2dv(X):-
	c_glVertex2dv(X).

% Specify a vertex
glVertex2f(X,Y):-
	float(X),
	float(Y),
	c_glVertex2f(X,Y).

% Specify a vertex
glVertex2fv(X):-
	c_glVertex2fv(X).

% Specify a vertex
glVertex2i(X,Y):-
	c_glVertex2i(X,Y).

% Specify a vertex
glVertex2iv(X):-
	c_glVertex2iv(X).

% Specify a vertex
glVertex2s(X,Y):-
	float(X),
	float(Y),
	c_glVertex2s(X,Y).

% Specify a vertex
glVertex2sv(X):-
	c_glVertex2sv(X).

% Specify a vertex
glVertex3d(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glVertex3d(X,Y,Z).

% Specify a vertex
glVertex3dv(X):-
	c_glVertex3dv(X).

% Specify a vertex
glVertex3f(X,Y,Z):-
	float(X),
	float(Y),
	float(Z),
	c_glVertex3f(X,Y,Z).

% Specify a vertex
glVertex3fv(X):-
	c_glVertex3fv(X).

% Specify a vertex
glVertex3i(X,Y,Z):-
	c_glVertex3i(X,Y,Z).

% Specify a vertex
glVertex3iv(X):-
	c_glVertex3iv(X).

% Specify a vertex
glVertex3s(X,Y,Z):-
	c_glVertex3s(X,Y,Z).

% Specify a vertex
glVertex3sv(X):-
	c_glVertex3sv(X).


% Define an array of vertex data
glVertexPointer(Size, Type, Stride, Pointer):-
    c_glVertexPointer(Size, Type, Stride, Pointer).

% Set the viewport
glViewport(X,Y,W,H):-
	c_glViewport(X,Y,W,H).






