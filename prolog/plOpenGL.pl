/*  $Id$

    plOpenGL - SWI-Prolog OpenGL Bindings

    Author:        Jan Tatham
    E-Mail:        jan@sebity.com
    WWW:           http://www.sebity.com
    Copyright (C): 2012-2013, Jan Tatham.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

:- module(plOpenGL,
	  [
	   loadGLTextures/4,
	   sleep/1,
	   size/2
]).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Select the Library that you need by commenting out the library %
% that you do not need, and uncommenting the one you do.         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- use_module(library(plGL_defs)).
:- use_module(library(plGLU_defs)).
:- use_module(library(plGLUT_defs)).
:- use_module(library(plGL)).
:- use_module(library(plGLU)).
:- use_module(library(plGLUT)).
:- use_module(library(plMisc)).
:- use_module(library(general_defs)).



%%%%%%%%%%%%%%
% OLD LOADER %
%%%%%%%%%%%%%%
% Windows Library
%:-load_foreign_library('plOpenGL.dll').

% Mac/Linux Library
%:-load_foreign_library('plOpenGL.so').

%:-['plGL_defs.pl'],['plGLU_defs.pl'],['plGLUT_defs.pl'].
%:-['plGL.pl'],['plGLU.pl'],['plGLUT.pl'].
%:-['plMisc.pl'].
%:-['general_defs.pl'].



%%	loadGLTextures(+Filename, -Width, -Height, -Data)
% Load Texture
loadGLTextures(Filename,Width,Height,Data):-
    c_loadGLTextures(Filename,Width,Height,Data).

%%	sleep(+X)
% Sleep for X seconds
sleep(X):-
	X1 = X,
	c_sleep(X1).

size([],0).
size([_|T],N) :- size(T,N1), N is N1+1.










