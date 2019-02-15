num('a').
num('b').
num('c').
num('d').
num('e').
num('f').
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

%% AD
(((Isatom=no;Length<4),num(AD));
(Isatom=yes,sub_atom(Sample, 3,1,_,AD),num(AD))),AD\=AA,AD\=AB,AD\=AC,

%% AE
(((Isatom=no;Length<5),num(AE));
(Isatom=yes,sub_atom(Sample, 4,1,_,AE),num(AE))),AE\=AA,AE\=AB,AE\=AC,AE\=AD,

%% AF
(((Isatom=no;Length<6),num(AF));
(Isatom=yes,sub_atom(Sample, 5,1,_,AF),num(AF))),AF\=AA,AF\=AB,AF\=AC,AF\=AD,AF\=AE,


%% BA
(((Isatom=no;Length<7),num(BA));
(Isatom=yes,sub_atom(Sample, 6,1,_,BA),num(BA))),BA\=AA,

%% BB
(((Isatom=no;Length<8),num(BB));
(Isatom=yes,sub_atom(Sample, 7,1,_,BB),num(BB))),BB\=BA,
BB\=AB,

%% BC
(((Isatom=no;Length<9),num(BC));
(Isatom=yes,sub_atom(Sample, 8,1,_,BC),num(BC))),BC\=BA,BC\=BB,
BC\=AC,

%% BD
(((Isatom=no;Length<10),num(BD));
(Isatom=yes,sub_atom(Sample, 9,1,_,BD),num(BD))),BD\=BA,BD\=BB,BD\=BC,
BD\=AD,

%% BE
(((Isatom=no;Length<11),num(BE));
(Isatom=yes,sub_atom(Sample, 10,1,_,BE),num(BE))),BE\=BA,BE\=BB,BE\=BC,BE\=BD,
BE\=AE,

%% BF
(((Isatom=no;Length<12),num(BF));
(Isatom=yes,sub_atom(Sample, 11,1,_,BF),num(BF))),BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,
BF\=AF,


%% CA
(((Isatom=no;Length<13),num(CA));
(Isatom=yes,sub_atom(Sample, 12,1,_,CA),num(CA))),CA\=AA,CA\=BA,

%% CB
(((Isatom=no;Length<14),num(CB));
(Isatom=yes,sub_atom(Sample, 13,1,_,CB),num(CB))),CB\=CA,
CB\=AB,CB\=BB,

%% CC
(((Isatom=no;Length<15),num(CC));
(Isatom=yes,sub_atom(Sample, 14,1,_,CC),num(CC))),CC\=CA,CC\=CB,
CC\=AC,CC\=BC,

%% CD
(((Isatom=no;Length<16),num(CD));
(Isatom=yes,sub_atom(Sample, 15,1,_,CD),num(CD))),CD\=CA,CD\=CB,CD\=CC,
CD\=AD,CD\=BD,

%% CE
(((Isatom=no;Length<17),num(CE));
(Isatom=yes,sub_atom(Sample, 16,1,_,CE),num(CE))),CE\=CA,CE\=CB,CE\=CC,CE\=CD,
CE\=AE,CE\=BE,

%% CF
(((Isatom=no;Length<18),num(CF));
(Isatom=yes,sub_atom(Sample, 17,1,_,CF),num(CF))),CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,
CF\=AF,CF\=BF,


%% DA
(((Isatom=no;Length<19),num(DA));
(Isatom=yes,sub_atom(Sample, 18,1,_,DA),num(DA))),DA\=AA,DA\=BA,DA\=CA,

%% DB
(((Isatom=no;Length<20),num(DB));
(Isatom=yes,sub_atom(Sample, 19,1,_,DB),num(DB))),DB\=DA,
DB\=AB,DB\=BB,DB\=CB,

%% DC
(((Isatom=no;Length<21),num(DC));
(Isatom=yes,sub_atom(Sample, 20,1,_,DC),num(DC))),DC\=DA,DC\=DB,
DC\=AC,DC\=BC,DC\=CC,

%% DD
(((Isatom=no;Length<22),num(DD));
(Isatom=yes,sub_atom(Sample, 21,1,_,DD),num(DD))),DD\=DA,DD\=DB,DD\=DC,
DD\=AD,DD\=BD,DD\=CD,

%% DE
(((Isatom=no;Length<23),num(DE));
(Isatom=yes,sub_atom(Sample, 22,1,_,DE),num(DE))),DE\=DA,DE\=DB,DE\=DC,DE\=DD,
DE\=AE,DE\=BE,DE\=CE,

%% DF
(((Isatom=no;Length<24),num(DF));
(Isatom=yes,sub_atom(Sample, 23,1,_,DF),num(DF))),DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,
DF\=AF,DF\=BF,DF\=CF,


%% EA
(((Isatom=no;Length<25),num(EA));
(Isatom=yes,sub_atom(Sample, 24,1,_,EA),num(EA))),EA\=AA,EA\=BA,EA\=CA,EA\=DA,

%% EB
(((Isatom=no;Length<26),num(EB));
(Isatom=yes,sub_atom(Sample, 25,1,_,EB),num(EB))),EB\=EA,
EB\=AB,EB\=BB,EB\=CB,EB\=DB,

%% EC
(((Isatom=no;Length<27),num(EC));
(Isatom=yes,sub_atom(Sample, 26,1,_,EC),num(EC))),EC\=EA,EC\=EB,
EC\=AC,EC\=BC,EC\=CC,EC\=DC,

%% ED
(((Isatom=no;Length<28),num(ED));
(Isatom=yes,sub_atom(Sample, 27,1,_,ED),num(ED))),ED\=EA,ED\=EB,ED\=EC,
ED\=AD,ED\=BD,ED\=CD,ED\=DD,

%% EE
(((Isatom=no;Length<29),num(EE));
(Isatom=yes,sub_atom(Sample, 28,1,_,EE),num(EE))),EE\=EA,EE\=EB,EE\=EC,EE\=ED,
EE\=AE,EE\=BE,EE\=CE,EE\=DE,

%% EF
(((Isatom=no;Length<30),num(EF));
(Isatom=yes,sub_atom(Sample, 29,1,_,EF),num(EF))),EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,
EF\=AF,EF\=BF,EF\=CF,EF\=DF,


%% FA
(((Isatom=no;Length<31),num(FA));
(Isatom=yes,sub_atom(Sample, 30,1,_,FA),num(FA))),FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,

%% FB
(((Isatom=no;Length<32),num(FB));
(Isatom=yes,sub_atom(Sample, 31,1,_,FB),num(FB))),FB\=FA,
FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,

%% FC
(((Isatom=no;Length<33),num(FC));
(Isatom=yes,sub_atom(Sample, 32,1,_,FC),num(FC))),FC\=FA,FC\=FB,
FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,

%% FD
(((Isatom=no;Length<34),num(FD));
(Isatom=yes,sub_atom(Sample, 33,1,_,FD),num(FD))),FD\=FA,FD\=FB,FD\=FC,
FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,

%% FE
(((Isatom=no;Length<35),num(FE));
(Isatom=yes,sub_atom(Sample, 34,1,_,FE),num(FE))),FE\=FA,FE\=FB,FE\=FC,FE\=FD,
FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,

%% FF
(((Isatom=no;Length<36),num(FF));
(Isatom=yes,sub_atom(Sample, 35,1,_,FF),num(FF))),FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,
FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,








atom_list_concat([AA,AB,AC,AD,AE,AF,BA,BB,BC,BD,BE,BF,CA,CB,CC,CD,CE,CF,DA,DB,DC,DD,DE,DF,EA,EB,EC,ED,EE,EF,FA,FB,FC,FD,FE,FF],LongAtom),
term_string(LongAtom,LongString),
write(Sample),write("="),write(LongString),write("\n"),fail.
