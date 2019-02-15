num('a').
num('b').
num('c').
atom_list_concat([H|T], Cat):-
    atom_list_concat(H,T,Cat).
atom_list_concat(Cat,[],Cat).
atom_list_concat(A,[H|T],Cat) :-
    atom_concat(A,H,ACat),
    atom_list_concat(ACat,T,Cat).
string_list_concat(List, StrCat):-
    string_list_concat(List,"",StrCat).
string_list_concat([],StrCat,StrCat).
string_list_concat([H|T],Str,Cat):-
    string_concat(Str,H,StrH),
    string_list_concat(T,StrH,Cat).

solver(Sample) :-
((not(atom(Sample)),Isatom=no,Length=0);(atom(Sample),atom_length(Sample,Length),Isatom=yes)),
%% AA
(((Isatom=no;Length<1),num(AA));
(Isatom=yes,sub_atom(Sample, 0,1,_,AA),num(AA))),
%% AB
(((Isatom=no;Length<2),num(AB));
(Isatom=yes,sub_atom(Sample, 1,1,_,AB),num(AB))),AB\=AA,

%% AC
(((Isatom=no;Length<3),num(AC));
(Isatom=yes,sub_atom(Sample, 2,1,_,AC),num(AC))),AC\=AA,AC\=AB,


%% BA
(((Isatom=no;Length<4),num(BA));
(Isatom=yes,sub_atom(Sample, 3,1,_,BA),num(BA))),BA\=AA,

%% BB
(((Isatom=no;Length<5),num(BB));
(Isatom=yes,sub_atom(Sample, 4,1,_,BB),num(BB))),BB\=BA,
BB\=AB,

%% BC
(((Isatom=no;Length<6),num(BC));
(Isatom=yes,sub_atom(Sample, 5,1,_,BC),num(BC))),BC\=BA,BC\=BB,
BC\=AC,


%% CA
(((Isatom=no;Length<7),num(CA));
(Isatom=yes,sub_atom(Sample, 6,1,_,CA),num(CA))),CA\=AA,CA\=BA,

%% CB
(((Isatom=no;Length<8),num(CB));
(Isatom=yes,sub_atom(Sample, 7,1,_,CB),num(CB))),CB\=CA,
CB\=AB,CB\=BB,

%% CC
(((Isatom=no;Length<9),num(CC));
(Isatom=yes,sub_atom(Sample, 8,1,_,CC),num(CC))),CC\=CA,CC\=CB,
CC\=AC,CC\=BC,



write("help"),

atom_list_concat([AA,AB,AC,BA,BB,BC,CA,CB,CC],LongAtom),
term_string(LongAtom, LongString),
%term_string(Sample,LongString),
write(Sample),write("="),write(LongString),write("\n"),
fail.
