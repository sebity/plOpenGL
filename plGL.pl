:- module(plGL,
	  [
	   glAccum/2,
	   glActiveTextureARB/1,
	   glAlphaFunc/2,
	   glArrayElement/1,
	   glBegin/1,
	   glBindTexture/2,
	   glBitmap/7,
	   glBlendFunc/2,
	   glCallList/1,
	   glClear/1,
	   glClearAccum/4,
	   glClearColor/4,
	   glClearDepth/1,
	   glClearIndex/1,
	   glClearStencil/1,
	   glClipPlane/2,
	   glColor3b/3,
	   glColor3bv/1,
	   glColor3d/3,
	   glColor3d/3,
	   glColor3dv/1,
	   glColor3f/3,
	   glColor3fv/1,
	   glColor3i/3,
	   glColor3iv/1,
	   glColor3s/3,
	   glColor3sv/1,
	   glColor3ub/3,
	   glColor3ubv/1,
	   glColor3ui/3,
	   glColor3uiv/1,
	   glColor3us/3,
	   glColor3usv/1,
	   glColor4b/4,
	   glColor4bv/1,
	   glColor4d/4,
	   glColor4dv/1,
	   glColor4f/4,
	   glColor4fv/1,
	   glColor4i/4,
	   glColor4iv/1,
	   glColor4s/4,
	   glColor4ub/4,
	   glColorMask/4,
	   glColorMaterial/2,
	   glCopyColorTable/5,
	   glCopyPixels/5,
	   glCopyTexImage1D/7,
	   glCopyTexImage2D/8,
	   glCopyTexSubImage1D/6,
	   glCopyTexSubImage2D/8,
	   glCullFace/1,
	   glDepthFunc/1,
	   glDepthMask/1,
	   glDepthRange/2,
	   glDisable/1,
	   glDisableClientState/1,
	   glDrawArrays/3,
	   glDrawBuffer/1,
	   glDrawElements/4,
	   glDrawPixels/5,
	   glEnable/1,
	   glEnableClientState/1,
	   glEnd/0,
	   glEndList/0,
	   glEvalCoord1d/1,
	   glEvalCoord1dv/1,
	   glEvalCoord1f/1,
	   glEvalCoord1fv/1,
	   glEvalCoord2d/2,
	   glEvalCoord2dv/1,
	   glEvalCoord2f/2,
	   glEvalCoord2fv/1,
	   glEvalMesh1/3,
	   glEvalMesh2/5,
	   glEvalPoint1/1,
	   glEvalPoint2/2,
	   glFinish/0,
	   glFlush/0,
	   glFogf/2,
	   glFogi/2,
	   glFrontFace/1,
	   glFrustum/6,
	   glGenLists/1,
	   glGenTextures/2,
	   glGetLightfv/3,
	   glGetLightiv/3,
	   glGetMaterialfv/3,
	   glGetMaterialiv/3,
	   glHint/2,
	   glIndexi/1,
	   glIndexf/1,
	   glIndexMask/1,
	   glLightfv/3,
	   glLightModelfv/2,
	   glLineStipple/2,
	   glLineWidth/1,
	   glLoadIdentity/0,
	   glLogicOp/1,
	   glLoadName/1,
	   glMaterialfv/3,
	   glMaterialiv/3,
	   glMatrixMode/1,
	   glMinmax/3,
	   glNewList/2,
	   glNormal3f/3,
	   glOrtho/6,
	   glPixelStorei/2,
	   glPointSize/1,
	   glPolygonMode/2,
	   glPolygonOffset/2,
	   glPopAttrib/0,
	   glPopClientAttrib/0,
	   glPopMatrix/0,
	   glPopName/0,
	   glPushAttrib/1,
	   glPushClientAttrib/1,
	   glPushMatrix/0,
	   glPushName/1,
	   glRasterPos2d/2,
	   glRasterPos2dv/1,
	   glRasterPos2f/2,
	   glRasterPos2fv/1,
	   glRasterPos2i/2,
	   glRasterPos2iv/1,
	   glRasterPos2s/2,
	   glRasterPos2sv/1,
	   glRasterPos3d/3,
	   glRasterPos3dv/1,
	   glRasterPos3f/3,
	   glRasterPos3fv/1,
	   glRasterPos3i/3,
	   glRasterPos3iv/1,
	   glRasterPos3s/3,
	   glRasterPos3sv/1,
	   glRasterPos4d/4,
	   glRasterPos4dv/1,
	   glRasterPos4f/4,
	   glRasterPos4fv/1,
	   glRasterPos4i/4,
	   glRasterPos4iv/1,
	   glRasterPos4s/4,
	   glRasterPos4sv/1,
	   glReadBuffer/1,
	   glRectf/4,
	   glRenderMode/1,
	   glResetMinmax/1,
	   glRotated/4,
	   glRotatef/4,
	   glScaled/3,
	   glScalef/3,
	   glScissor/4,
	   glShadeModel/1,
	   glStencilFunc/3,
	   glStencilMask/1,
	   glStencilOp/3,
	   glTexCoord1d/1,
	   glTexCoord1dv/1,
	   glTexCoord1f/1,
	   glTexCoord1fv/1,
	   glTexCoord1i/1,
	   glTexCoord1iv/1,
	   glTexCoord1s/1,
	   glTexCoord1sv/1,
	   glTexCoord2d/2,
	   glTexCoord2dv/1,
	   glTexCoord2f/2,
	   glTexCoord2fv/1,
	   glTexCoord2i/2,
	   glTexCoord2iv/1,
	   glTexCoord2s/2,
	   glTexCoord2sv/1,
	   glTexCoord3d/3,
	   glTexCoord3dv/1,
	   glTexCoord3f/3,
	   glTexCoord3fv/1,
	   glTexCoord3i/3,
	   glTexCoord3iv/1,
	   glTexCoord3s/3,
	   glTexCoord3sv/1,
	   glTexCoord4d/4,
	   glTexCoord4dv/1,
	   glTexCoord4f/4,
	   glTexCoord4fv/1,
	   glTexCoord4i/4,
	   glTexCoord4iv/1,
	   glTexCoord4s/4,
	   glTexCoord4sv/1,
	   glTexImage1D/8,
	   glTexImage2D/9,
	   glTexParameteri/3,
	   glTexSubImage1D/7,
	   glTexSubImage2D/9,
	   glTexSubImage3D/11,
	   glTranslated/3,
	   glTranslatef/3,
	   glVertex2d/2,
	   glVertex2dv/1,
	   glVertex2f/2,
	   glVertex2fv/1,
	   glVertex2i/2,
	   glVertex2iv/1,
	   glVertex2s/2,
	   glVertex2sv/1,
	   glVertex3d/3,
	   glVertex3dv/1,
	   glVertex3f/3,
	   glVertex3fv/1,
	   glVertex3i/3,
	   glVertex3iv/1,
	   glVertex3s/3,
	   glVertex3sv/1,
	   glVertex4d/4,
	   glVertex4dv/1,
	   glVertex4f/4,
	   glVertex4fv/1,
	   glVertex4i/4,
	   glVertex4iv/1,
	   glVertex4s/4,
	   glVertex4sv/1,
	   glVertexPointer/4,
	   glViewport/4
	  ]).

/** <module> OpenGL Interface

This module is the opengl extension of the Prolog OpenGL Interface
(plOpengL)

 @author   Jan Tatham
 @version  0.5.0
 @license  LGPL
*/

%%	glAccum(+Operation, +Value).
%Operates on the accumulation buffer.
%
% * Operation
%   Specifies the accumulation buffer operation. Symbolic
%   constants *|kGL_LOAD, kGL_ACCUM, kGL_MULT, kGL_ADD,|* and
%   *kGL_RETURN* are accepted.
%
% * Value
%   Specifies a floating-point value used in the accumulation
%   buffer operation. The Operation parameter determines how Value is
%   used.
%
glAccum(Operation,Value):-
	float(Value),
	c_glAccum(Operation,Value).

%%	glActiveTextureARB(+Texture).
% Specify which texture unit is active.
%
% * Texture
%   Specifies which texture unit to make active.
%
glActiveTextureARB(Texture):-
	c_glActiveTextureARB(Texture).

%%	glAlphaFunc(+Func, +Ref).
% Specify the alpha test function.
%
% * Func
%   Specifies the alpha comparison function. Symbolic constants
%   *|kGL_NEVER, kGL_LESS, kGL_EQUAL, kGL_LEQUAL, kGL_GREATER,
%   kGL_NOTEQUAL, kGL_GEQUAL,|* and *kGL_ALWAYS* are accepted. The
%   default function is *kGL_ALWAYS*.
%
% * Ref
%   Specifies the reference value to which incoming alpha values are
%   compared. This value is clamped to the range 0 (zero) through 1
%   (one), where 0 represents the lowest possible alpha value, and 1 the
%   highest possible value. The default reference is 0.
%
glAlphaFunc(Func, Ref):-
	float(Ref),
	c_glAlphaFunc(Func, Ref).

%%	glArrayElement(+Index).
% Render a vertex using the specified vertex array element.
%
%  * Index
%    Specifies an index into the enabled vertex data arrays.
%
glArrayElement(Index):-
	c_glArrayElement(Index).

%%	glBegin(+Mode).
% Delimits the vertices of a primitive or group of like primitives.
%
% * Mode
%   Specifies the primitive or primitives that will be created from
%   vertices presented between glBegin and the subsequent glEnd. Ten
%   symbolic constants are accepted: *|kGL_POINTS, kGL_LINES,
%   kGL_LINE_STRIP, kGL_LINE_LOOP, kGL_TRIANGLES, kGL_TRIANGLE_STRIP,
%   kGL_TRIANGLE_FAN, kGL_QUADS, kGL_QUAD_STRIP,|* and *kGL_POLYGON*.
%
glBegin(Mode):-
	c_glBegin(Mode).

%%	glBindTexture(+Target, +Texture).
% Binds a named texture to a texturing target.
%
%  * Target
%    Specifies the target to which the texture is bound.
%    Must be either *|kGL_TEXTURE_1D, kGL_TEXTURE_2D, kGL_TEXTURE_3D,|*
%    or *kGL_TEXTURE_3D_EXT*.
%
% * Texture
%   Specifies the name of a texture.
%
glBindTexture(Target,Texture):-
	c_glBindTexture(Target,Texture).

%%	glBitmap(+W, +H, +X1, +Y1, +X2, +Y2, +Bitmap).
% Draws a Bitmap
%
% * W
%   Specifies the pixel width of the bitmap image.
%
% * H
%   Specifies the pixel height of the bitmap image.
%
% * X1
%   Specifies the location of the x origin in the bitmap image. The x
%   origin is measured from the lower left corner of the bitmap, with
%   right and up being the positive axes.
%
% * Y1
%   Specifies the location of the y origin in the bitmap image. The y
%   origin is measured from the lower left corner of the bitmap, with
%   right and up being the positive axes.
%
% * X2
%   Specifies the x offset to be added to the current raster position
%   after the bitmap is drawn.
%
% * Y2
%   Specifies the y offset to be added to the current raster position
%   after the bitmap is drawn.
%
% * Bitmap
%   Specifies the address of the bitmap image.
%
glBitmap(W,H,X1,Y1,X2,Y2,Bitmap):-
	size(Bitmap,N),
	float(X1),
	float(Y1),
	float(X2),
	float(Y2),
	c_glBitmap(W,H,X1,Y1,X2,Y2,Bitmap,N).

%%	glBlendFunc(+SFactor, +DFactor).
% Specifies pixel arithmetic.
%
% * SFactor
%   Specifies how the RGBA source-blending factors are computed.
%   *|kGL_ONE, kGL_DST_COLOR, kGL_ONE_MINUS_DST_COLOR, kGL_SRC_ALPHA,
%   kGL_ONE_MINUS_SRC_ALPHA, kGL_DST_ALPHA, kGL_ONE_MINUS_DST_ALPHA,
%   kGL_CONSTANT_COLOR, kGL_CONSTANT_COLOR_EXT,
%   kGL_ONE_MINUS_CONSTANT_COLOR, kGL_ONE_MINUS_CONSTANT_COLOR_EXT,
%   kGL_CONSTANT_ALPHA, kGL_CONSTANT_ALPHA_EXT,
%   kGL_ONE_MINUS_CONSTANT_ALPHA, kGL_ONE_MINUS_CONSTANT_ALPHA_EXT, and
%   kGL_SRC_ALPHA_SATURATE|*.
%   These symbolic constants are defined in the Description section. The
%   initial value is *kGL_ONE*.
%
% * DFactor
%   Specifies how the RGBA destination-blending factors are computed.
%   Twelve symbolic constants are accepted: *|kGL_ZERO, kGL_ONE,
%   kGL_SRC_COLOR, kGL_ONE_MINUS_SRC_COLOR, kGL_SRC_ALPHA,
%   kGL_ONE_MINUS_SRC_ALPHA, kGL_DST_ALPHA , kGL_ONE_MINUS_DST_ALPHA,
%   kGL_CONSTANT_COLOR, kGL_CONSTANT_COLOR_EXT,
%   kGL_ONE_MINUS_CONSTANT_COLOR, kGL_ONE_MINUS_CONSTANT_COLOR_EXT,
%   kGL_CONSTANT_ALPHA, kGL_CONSTANT_ALPHA_EXT,
%   kGL_ONE_MINUS_CONSTANT_ALPHA, and
%   kGL_ONE_MINUS_CONSTANT_ALPHA_EXT|*.
%   These symbolic constants are defined in the Description section. The
%   initial value is *kGL_ZERO*.
%
glBlendFunc(SFactor,DFactor):-
	c_glBlendFunc(SFactor,DFactor).

%%	glCallList(+OptionList).
% Execute a display list
%
% * OptionList
%   Specifies the integer name of the display list to be executed.
%
glCallList(OptionList) :-
	c_glCallList(OptionList).

%%      glClear(+OptionList).
% Clear buffers to preset values
% * OptionList
% Bitwise OR of masks that indicate the buffers to be cleared. The four
% masks are *|kGL_COLOR_BUFFER_BIT, kGL_DEPTH_BUFFER_BIT,
% kGL_ACCUM_BUFFER_BIT,|* and *kGL_STENCIL_BUFFER_BIT*.
%
glClear(OptionList):-
	Applied_options is OptionList,
	c_glClear(Applied_options).

%%	glClearAccum(+R, +G, +B, +A).
% Specify clear values for the accumulation buffer
%
% * R
%   Specifies the red value used when the accumulation buffer is
%   cleared. The default value is 0 (zero).
%
% * G
%   Specifies the green value used when the accumulation buffer is
%   cleared. The default value is 0.
%
% * B
%   Specifies the blue value used when the accumulation buffer is
%   cleared. The default value is 0.
%
% * A
%   Specifies the alpha value used when the accumulation buffer is
%   cleared. The default value is 0.
%
glClearAccum(R,G,B,A) :-
	float(R),
	float(G),
	float(B),
	float(A),
	c_glClearAccum(R,G,B,A).

%%	glClearColor(+R, +G, +B, +A)
% Specify clear values for the color buffers
%
% * R
%   Specifies the red value used when the accumulation buffer is
%   cleared. The default value is 0 (zero).
%
% * G
%   Specifies the green value used when the accumulation buffer is
%   cleared. The default value is 0.
%
% * B
%   Specifies the blue value used when the accumulation buffer is
%   cleared. The default value is 0.
%
% * A
%   Specifies the alpha value used when the accumulation buffer is
%   cleared. The default value is 0.
%
glClearColor(R,G,B,A) :-
	float(R),
	float(G),
	float(B),
	float(A),
	c_glClearColor(R,G,B,A).

%%	glClearDepth(+Depth)
% Specify the clear value for the depth buffer
glClearDepth(Depth) :-
	float(Depth),
	c_glClearDepth(Depth).

%%	glClearIndex(+Index)
% Specify the clear value for the color index buffers
glClearIndex(Index) :-
	float(Index),
	c_glClearIndex(Index).

%%	glClearStencil(+S)
% Specify the clear value for the stencil buffer
glClearStencil(S):-
	c_glClearStencil(S).

%%	glClipPlane(+Plane, +Equation).
% Specify a plane against which all geometry is clipped
glClipPlane(Plane,Equation) :-
	size(Equation,N),
	c_glClipPlane(Plane,Equation,N).

%%	glColor3b(+Red, +Green, +Blue).
% Sets the current color.
glColor3b(Red,Green,Blue):-
	c_glColor3b(Red,Green,Blue).

%%	glColor3bv(+X:list(number)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue values.
%
glColor3bv(X):-
	c_glColor3bv(X).

%%	glColor3d(+Red, +Green, +Blue).
% Sets the current color.
glColor3d(Red,Green,Blue):-
	float(Red),
	float(Green),
	float(Blue),
	c_glColor3d(Red,Green,Blue).

%%	glColor3dv(+X:list(float)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue values.
%
glColor3dv(X):-
	c_glColor3dv(X).

%%	glColor3f(+Red, +Green, +Blue).
% Sets the current color.
glColor3f(Red,Green,Blue):-
	float(Red),
	float(Green),
	float(Blue),
	c_glColor3f(Red,Green,Blue).

%%	glColor3fv(+X:list(float)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3fv(X):-
	c_glColor3fv(X).

%%	glColor3i(+Red, +Green, +Blue).
% Sets the current color.
glColor3i(Red,Green,Blue):-
	c_glColor3i(Red,Green,Blue).

%%	glColor3iv(+X:list(number)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3iv(X):-
	c_glColor3iv(X).

%%	glColor3s(+Red, +Green, +Blue).
% Sets the current color.
glColor3s(Red,Green,Blue):-
	c_glColor3s(Red,Green,Blue).

%%	glcolor3sv(+X).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3sv(X):-
	c_glColor3sv(X).

%%	glColor3ub(+Red, +Green, +Blue).
% Sets the current color.
glColor3ub(Red,Green,Blue):-
	c_glColor3ub(Red,Green,Blue).

%%	glcolor3ubv(+X).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3ubv(X):-
	c_glColor3ubv(X).

%%	glColor3ui(+Red, +Green, +Blue).
% Sets the current color.
glColor3ui(Red,Green,Blue):-
	c_glColor3ui(Red,Green,Blue).

%%	glcolor3uiv(+X).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3uiv(X):-
	c_glColor3uiv(X).

%%	glColor3us(+Red, +Green, +Blue).
% Sets the current color.
glColor3us(Red,Green,Blue):-
	c_glColor3us(Red,Green,Blue).

%%	glcolor3usv(+X).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue
%    values.
%
glColor3usv(X):-
	c_glColor3usv(X).

%%	glColor4b(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4b(Red,Green,Blue, Alpha):-
	c_glColor4b(Red,Green,Blue,Alpha).


%%	glColor4bv(+X:list(number)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue, and
%    alpha values.
%
glColor4bv(X):-
	c_glColor4bv(X).

%%	glColor4d(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4d(Red,Green,Blue, Alpha):-
	c_glColor4d(Red,Green,Blue,Alpha).

%%	glColor4dv(+X:list(float)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue, and
%    alpha values.
%
glColor4dv(X):-
	c_glColor4dv(X).

%%	glColor4f(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4f(Red,Green,Blue,Alpha):-
	float(Red),
	float(Green),
	float(Blue),
	float(Alpha),
	c_glColor4f(Red,Green,Blue,Alpha).

%%	glColor4fv(+X:list(float)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue, and
%    alpha values.
%
glColor4fv(X):-
	c_glColor4fv(X).

%%	glColor4i(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4i(Red,Green,Blue, Alpha):-
	c_glColor4i(Red,Green,Blue,Alpha).


%%	glColor4iv(+X:list(number)).
% Sets the current color.
%
%  * X
%    Specifies a pointer to an array that contains red, green, blue, and
%    alpha values.
%
glColor4iv(X):-
	c_glColor4iv(X).

%%	glColor4s(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4s(Red,Green,Blue, Alpha):-
	c_glColor4s(Red,Green,Blue,Alpha).


%%	glColor4ub(+Red, +Green, +Blue, +Alpha).
% Sets the current color.
glColor4ub(Red,Green,Blue,Alpha):-
	c_glColor4ub(Red,Green,Blue,Alpha).

%%	glColorMask(+Red, +Green, +Blue, +Alpha).
% Enable and disable writing of frame buffer color components
glColorMask(Red,Green,Blue,Alpha):-
	c_glColorMask(Red,Green,Blue,Alpha).

%%	glColorMaterial(+Face, +Mode).
% Cause a material color to track the current color
glColorMaterial(Face, Mode):-
	c_glColorMaterial(Face,Mode).

%%	glCopyColorTable(+Target, +Format, +X, +Y, +Width).
% Copy pixels into a color table
glCopyColorTable(Target, Format, X, Y, Width):-
    c_glCopyColorTable(Target, Format, X, Y, Width).

%%	glCopyPixels(+X, +Y, +Width, +Height, +Type).
% Copy pixels in the frame buffer
glCopyPixels(X, Y, Width, Height, Type):-
    c_glCopyPixels(X, Y, Width, Height, Type).

%%	glCopyTexImage1D(+Target, +Level, +Internal, +X, +Y, +Width, +Border).
% Copy pixels into a 1D texture image
%
glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border):-
    c_glCopyTexImage1D(Target, Level, Internal, X, Y, Width, Border).

%%      glCopyTexImage2D(+Target, +Level, +Internal, +X, +Y, +Width, +Height, +Border).
% Copy pixels into a 2D texture image
glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border):-
    c_glCopyTexImage2D(Target, Level, Internal, X, Y, Width, Height, Border).

%%	glCopyTexSubImage1D(+Target, +Level, +XOffset, +X, +Y, +Width).
% Copy a one-dimensional texture subimage
glCopyTexSubImage1D(Target, Level, XOffset, X, Y, Width):-
    c_glCopyTexSubImage1D(Target, Level, XOffset, X, Y, Width).

%%      glCopyTexSubImage2D(+Target, +Level, +XOffset, +YOffset, +X, +Y, +Width, +Height).
% Copy a two-dimensional texture subimage
glCopyTexSubImage2D(Target, Level, XOffset, YOffset, X, Y, Width, Height):-
    c_glCopyTexSubImage2D(Target, Level, XOffset, YOffset, X, Y, Width, Height).

%%	glCullFace(+Mode).
% Specify whether front- or back-facing facets can be culled
glCullFace(Mode):-
	Mode_Eval is Mode,
	c_glCullFace(Mode_Eval).

%%	glDepthFunc(+Mode).
% Specify the value used for depth buffer comparisons
glDepthFunc(Mode):-
	Mode_Eval is Mode,
	c_glDepthFunc(Mode_Eval).

%%	glDepthMask(+Flag).
% Enable or disable writing into the depth buffer
glDepthMask(Flag):-
    c_glDepthMask(Flag).

%%	glDepthRange(+NEar, +Far).
% Specify mapping of depth values from normalized device coordinates to window coordinates
glDepthRange(Near, Far) :-
    float(Near),
    float(Far),
    c_glDepthRange(Near, Far).

%%	glDisable(+Mode).
% Enable or disable server-side GL capabilities
glDisable(Mode):-
	Mode_Eval is Mode,
	c_glDisable(Mode_Eval).

%%	glDisableClientState(+Cap).
% Enables or disables an array.
glDisableClientState(Cap):-
    c_glDisableClientState(Cap).

%%	glDrawArrays(+Mode, +First, +Count).
% Render primitives from array data
glDrawArrays(Mode, First, Count):-
    c_glDrawArrays(Mode, First, Count).

%%	glDrawBuffer(+Mode).
% Specify which color buffers are to be drawn into
glDrawBuffer(Mode):-
    c_glDrawBuffer(Mode).

%%	glDrawElements(+Mode, +Count, +Type, +Indices).
% Render primitives from array data
glDrawElements(Mode, Count, Type, Indices):-
    c_glDrawElements(Mode, Count, Type, Indices).

%%	glDrawPixels(+Width, +Height, +Format, +Type, +Data).
% Write a block of pixels to the frame buffer
glDrawPixels(Width, Height, Format, Type, Data):-
    c_glDrawPixels(Width, Height, Format, Type, Data).

%%	glEnable(+Mode).
% Enables GL capability.
glEnable(Mode):-
	Mode_Eval is Mode,
	c_glEnable(Mode_Eval).

%%	glEnableClientState(+Cap).
% Enables an array.
glEnableClientState(Cap):-
    c_glEnableClientState(Cap).

%%	glEnd.
% Delimits the vertices of a primitive or group of like primitives.
glEnd:-
	c_glEnd.

%%	glEndList.
% Create or replace a display list
glEndList :-
	c_glEndList.

%%	glEvalCoord1d(+U).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord1d(U) :-
    float(U),
    c_glEvalCoord1d(U).

%%	glEvalCoord1dv(+U).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord1dv(U) :-
    c_glEvalCoord1dv(U).

%%	glEvalCoord1f(+U).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord1f(U) :-
    float(U),
    c_glEvalCoord1f(U).

%%	glEvalCoord1fv(+U).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord1fv(U) :-
    c_glEvalCoord1fv(U).

%%	glEvalCoord2d(+U, +V).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord2d(U,V) :-
    float(U),
    float(V),
    c_glEvalCoord2d(U,V).

%%	glEvalCoord2dv(+U, +V).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord2dv(U) :-
    c_glEvalCoord2dv(U).

%%	glEvalCoord2f(+U, +V).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord2f(U,V) :-
    float(U),
    float(V),
    c_glEvalCoord2f(U,V).

%%	glEvalCoord2fv(+U, +V).
% Evaluates enabled one-dimensional (1D) and two-dimensional (2D) maps.
glEvalCoord2fv(U) :-
    c_glEvalCoord2fv(U).

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

%%	glFinish.
% block until all GL execution is complete
glFinish:-
	c_glFinish.

%%	glFlush.
% Force execution of GL commands in finite time
glFlush:-
	c_glFlush.

%%	glFogf(+PName, +Param:list(float)).
% Specify fog parameters
glFogf(PName, Param):-
	float(Param),
	c_glFogf(PName, Param).

%%	glFogi(+PName, +Param:list(number)).
% Specify fog parameters
glFogi(PName, Param):-
	c_glFogi(PName, Param).

%%	glFrontFace(+Mode).
% Define front- and back-facing polygons
glFrontFace(Mode):-
	c_glFrontFace(Mode).

%%	glFrustum(+Left, +Right, +Top, +Bottom, +Near, +Far).
% Multiply the current matrix by a perspective matrix
glFrustum(Left,Right,Top,Bottom,Near,Far):-
	float(Left),
	float(Right),
	float(Top),
	float(Bottom),
	float(Near),
	float(Far),
	c_glFrustum(Left,Right,Top,Bottom,Near,Far).

%%	glGenLists(+Range).
% Generate a contiguous set of empty display lists.
glGenLists(Range):-
    c_glGenLists(Range).

%%	glGenTextures(+N, +TextureNames:list(number)).
% Generate texture names
%
% * N
% Specifies the number of texture names to be generated.
%
% * TextureNames
% Specifies an array in which the generated texture names are stored.
glGenTextures(N,TextureNames):-
    c_glGenTextures(N,TextureNames).

%%	glGetLightfv(+Light, +PName, -Params:list(float)).
% Return light source parameter values
glGetLightfv(Light, PName, Params) :-
    c_glGetLightfv(Light, PName, Params).

%%	glGetLightiv(+Light, +PName, -Params:list(number)).
% Return light source parameter values
glGetLightiv(Light, PName, Params) :-
    c_glGetLightiv(Light, PName, Params).

%%	glGetMaterialfv(+Light, +PName, -Params:list(float)).
% Return material parameters
glGetMaterialfv(Light, PName, Params) :-
    c_glGetMaterialfv(Light, PName, Params).

%%	glGetMaterialiv(+Light, +PName, -Params:list(number)).
% Return material parameters
glGetMaterialiv(Light, PName, Params) :-
    c_glGetMaterialiv(Light, PName, Params).

%%	glHint(+Target, +Hint).
% Specify implementation-specific hints
glHint(Target,Hint):-
	T is Target,
	H is Hint,
	c_glHint(T,H).

%%	glIndexi(+Index).
% set the current color index.
glIndexi(Index):-
    c_glIndexi(Index).

%%	glIndexf(+Index).
% set the current color index.
glIndexf(Index):-
    float(Index),
    c_glIndexf(Index).

%%	glIndexMask(+Mask).
% Control the writing of individual bits in the color index buffers.
glIndexMask(Mask):-
    c_glIndexMask(Mask).

%%	glLightfv(+Light, +PName, +Param:list(float)).
% Set light source parameters.
glLightfv(Light, PName, Params):-
	size(Params,N),
	c_glLightfv(Light, PName, Params, N).

%%	glLightModelfv(+PName, +Params).
% Sets lighting model parameters.
glLightModelfv(PName, Params:list(float)):-
	size(Params,N),
	c_glLightModelfv(PName, Params, N).

%%	glLineStipple(+Factor, +Pattern).
% Specify the line stipple pattern.
glLineStipple(Factor,Pattern):-
	F is Factor,
	P is Pattern,
	c_glLineStipple(F,P).

%%	glLineWidth(+Width).
% Specify the width of rasterized lines.
glLineWidth(Width) :-
	float(Width),
	c_glLineWidth(Width).

%%	glLoadIdentity.
% Replaces the current matrix with the identity matrix.
glLoadIdentity:-
	c_glLoadIdentity.

%%	glLogicOp(+Opcode).
% Specify a logical pixel operation for rendering.
glLogicOp(Opcode) :-
        c_glLogicOp(Opcode).

%%	glLoadName(+Name).
% Load a name onto the name stack
glLoadName(Name):-
    c_glLoadName(Name).

%%	glMaterialfv(+Face, +PName, +Params:list(float)).
% Specifies material parameters for the lighting model.
glMaterialfv(Face, PName, Params):-
	size(Params,N),
	c_glMaterialfv(Face, PName, Params, N).

%%	glMaterialiv(+Face, +PName, +Params:list(number)).
% Specifies material parameters for the lighting model.
glMaterialiv(Face, PName, Params):-
	size(Params,N),
	c_glMaterialiv(Face, PName, Params, N).

%%	glMatrixMode(+Mode).
% Specify which matrix is the current matrix.
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

%%	glPopMatrix.
% Pop the current matrix stack.
glPopMatrix:-
	c_glPopMatrix.

glPopName:-
	c_glPopName.

glPushAttrib(Mask):-
    c_glPushAttrib(Mask).

glPushClientAttrib(Mask):-
    c_glPushClientAttrib(Mask).

%%	glPushMatrix.
% Push the current matrix stack.
glPushMatrix:-
	c_glPushMatrix.

glPushName(Name):-
    c_glPushName(Name).

glRasterPos2d(X,Y):-
    float(X),
    float(Y),
    c_glRasterPos2d(X,Y).

glRasterPos2dv(V):-
    c_glRasterPos2dv(V).

glRasterPos2f(X,Y):-
    float(X),
    float(Y),
    c_glRasterPos2f(X,Y).

glRasterPos2fv(V):-
    c_glRasterPos2fv(V).

glRasterPos2i(X,Y):-
    c_glRasterPos2i(X,Y).

glRasterPos2iv(V):-
    c_glRasterPos2iv(V).

glRasterPos2s(X,Y):-
    c_glRasterPos2s(X,Y).

glRasterPos2sv(V):-
    c_glRasterPos2sv(V).

glRasterPos3d(X,Y,Z):-
    float(X),
    float(Y),
    float(Z),
    c_glRasterPos3d(X,Y,Z).

glRasterPos3dv(V):-
    c_glRasterPos3dv(V).

glRasterPos3f(X,Y,Z):-
    float(X),
    float(Y),
    float(Z),
    c_glRasterPos3f(X,Y,Z).

glRasterPos3fv(V):-
    c_glRasterPos3fv(V).

glRasterPos3i(X,Y,Z):-
    c_glRasterPos3i(X,Y,Z).

glRasterPos3iv(V):-
    c_glRasterPos3iv(V).

glRasterPos3s(X,Y,Z):-
    c_glRasterPos3s(X,Y,Z).

glRasterPos3sv(V):-
    c_glRasterPos3sv(V).

glRasterPos4d(X,Y,Z,W):-
    float(X),
    float(Y),
    float(Z),
    float(W),
    c_glRasterPos4d(X,Y,Z,W).

glRasterPos4dv(V):-
    c_glRasterPos4dv(V).

glRasterPos4f(X,Y,Z,W):-
    float(X),
    float(Y),
    float(Z),
    float(W),
    c_glRasterPos4f(X,Y,Z,W).

glRasterPos4fv(V):-
    c_glRasterPos4fv(V).

glRasterPos4i(X,Y,Z,W):-
    c_glRasterPos4i(X,Y,Z,W).

glRasterPos4iv(V):-
    c_glRasterPos4iv(V).

glRasterPos4s(X,Y,Z,W):-
    c_glRasterPos4s(X,Y,Z,W).

glRasterPos4sv(V):-
    c_glRasterPos4sv(V).

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

glTexCoord1d(S):-
	float(S),
	c_glTexCoord1d(S).

glTexCoord1dv(V):-
	c_glTexCoord1dv(V).

glTexCoord1f(S):-
	float(S),
	c_glTexCoord1f(S).

glTexCoord1fv(V):-
	c_glTexCoord1fv(V).

glTexCoord1i(S):-
	c_glTexCoord1i(S).

glTexCoord1iv(V):-
	c_glTexCoord1iv(V).

glTexCoord1s(S):-
	c_glTexCoord1s(S).

glTexCoord1sv(V):-
	c_glTexCoord1sv(V).

glTexCoord2d(S,T):-
	float(S),
	float(T),
	c_glTexCoord2d(S,T).

glTexCoord2dv(V):-
	c_glTexCoord2dv(V).

glTexCoord2f(S,T):-
	float(S),
	float(T),
	c_glTexCoord2f(S,T).

glTexCoord2fv(V):-
	c_glTexCoord2fv(V).

glTexCoord2i(S,T):-
	c_glTexCoord2i(S,T).

glTexCoord2iv(V):-
	c_glTexCoord2iv(V).

glTexCoord2s(S,T):-
	c_glTexCoord2s(S,T).

glTexCoord2sv(V):-
	c_glTexCoord2sv(V).

glTexCoord3d(S,T,R):-
	float(S),
	float(T),
        float(R),
	c_glTexCoord3d(S,T,R).

glTexCoord3dv(V):-
	c_glTexCoord3dv(V).

glTexCoord3f(S,T,R):-
	float(S),
	float(T),
        float(R),
	c_glTexCoord3f(S,T,R).

glTexCoord3fv(V):-
	c_glTexCoord3fv(V).

glTexCoord3i(S,T,R):-
	c_glTexCoord3i(S,T,R).

glTexCoord3iv(V):-
	c_glTexCoord3iv(V).

glTexCoord3s(S,T,R):-
	c_glTexCoord3s(S,T,R).

glTexCoord3sv(V):-
	c_glTexCoord3sv(V).

glTexCoord4d(S,T,R,Q):-
	float(S),
	float(T),
        float(R),
        float(Q),
	c_glTexCoord4d(S,T,R,Q).

glTexCoord4dv(V):-
	c_glTexCoord4dv(V).

glTexCoord4f(S,T,R,Q):-
	float(S),
	float(T),
        float(R),
        float(Q),
	c_glTexCoord4f(S,T,R,Q).

glTexCoord4fv(V):-
	c_glTexCoord4fv(V).

glTexCoord4i(S,T,R,Q):-
	c_glTexCoord4i(S,T,R,Q).

glTexCoord4iv(V):-
	c_glTexCoord4iv(V).

glTexCoord4s(S,T,R,Q):-
	c_glTexCoord4s(S,T,R,Q).

glTexCoord4sv(V):-
	c_glTexCoord4sv(V).

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

% Specify a vertex
glVertex4d(X,Y,Z,W):-
	float(X),
	float(Y),
	float(Z),
	float(W),
	c_glVertex4d(X,Y,Z,W).

% Specify a vertex
glVertex4dv(X):-
	c_glVertex4dv(X).

% Specify a vertex
glVertex4f(X,Y,Z,W):-
	float(X),
	float(Y),
	float(Z),
	float(W),
	c_glVertex4f(X,Y,Z,W).

% Specify a vertex
glVertex4fv(X):-
	c_glVertex4fv(X).

% Specify a vertex
glVertex4i(X,Y,Z,W):-
	c_glVertex4i(X,Y,Z,W).

% Specify a vertex
glVertex4iv(X):-
	c_glVertex4iv(X).

% Specify a vertex
glVertex4s(X,Y,Z,W):-
	c_glVertex4s(X,Y,Z,W).

% Specify a vertex
glVertex4sv(X):-
	c_glVertex4sv(X).

% Define an array of vertex data
glVertexPointer(Size, Type, Stride, Pointer):-
    c_glVertexPointer(Size, Type, Stride, Pointer).

%%	glViewPort(+X, +Y, +W, +H).
% Set the viewport
glViewport(X,Y,W,H):-
	c_glViewport(X,Y,W,H).


eq(X,X).



