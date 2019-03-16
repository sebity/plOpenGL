:- module(plMisc, 
	  []).


loadTextureRaw(Filename, Wrap) :-
    c_loadTextureRaw(Filename, Wrap).

