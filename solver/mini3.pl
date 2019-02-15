num('a').
num('b').
num('c').
num('d').
num('e').
num('f').
num('g').
num('h').
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

%% AG
(((Isatom=no;Length<7),num(AG));
(Isatom=yes,sub_atom(Sample, 6,1,_,AG),num(AG))),AG\=AA,AG\=AB,AG\=AC,AG\=AD,AG\=AE,AG\=AF,

%% AH
(((Isatom=no;Length<8),num(AH));
(Isatom=yes,sub_atom(Sample, 7,1,_,AH),num(AH))),AH\=AA,AH\=AB,AH\=AC,AH\=AD,AH\=AE,AH\=AF,AH\=AG,


%% BA
(((Isatom=no;Length<9),num(BA));
(Isatom=yes,sub_atom(Sample, 8,1,_,BA),num(BA))),BA\=AA,

%% BB
(((Isatom=no;Length<10),num(BB));
(Isatom=yes,sub_atom(Sample, 9,1,_,BB),num(BB))),BB\=BA,
BB\=AB,

%% BC
(((Isatom=no;Length<11),num(BC));
(Isatom=yes,sub_atom(Sample, 10,1,_,BC),num(BC))),BC\=BA,BC\=BB,
BC\=AC,

%% BD
(((Isatom=no;Length<12),num(BD));
(Isatom=yes,sub_atom(Sample, 11,1,_,BD),num(BD))),BD\=BA,BD\=BB,BD\=BC,
BD\=AD,

%% BE
(((Isatom=no;Length<13),num(BE));
(Isatom=yes,sub_atom(Sample, 12,1,_,BE),num(BE))),BE\=BA,BE\=BB,BE\=BC,BE\=BD,
BE\=AE,

%% BF
(((Isatom=no;Length<14),num(BF));
(Isatom=yes,sub_atom(Sample, 13,1,_,BF),num(BF))),BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,
BF\=AF,

%% BG
(((Isatom=no;Length<15),num(BG));
(Isatom=yes,sub_atom(Sample, 14,1,_,BG),num(BG))),BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,
BG\=AG,

%% BH
(((Isatom=no;Length<16),num(BH));
(Isatom=yes,sub_atom(Sample, 15,1,_,BH),num(BH))),BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,
BH\=AH,


%% CA
(((Isatom=no;Length<17),num(CA));
(Isatom=yes,sub_atom(Sample, 16,1,_,CA),num(CA))),CA\=AA,CA\=BA,

%% CB
(((Isatom=no;Length<18),num(CB));
(Isatom=yes,sub_atom(Sample, 17,1,_,CB),num(CB))),CB\=CA,
CB\=AB,CB\=BB,

%% CC
(((Isatom=no;Length<19),num(CC));
(Isatom=yes,sub_atom(Sample, 18,1,_,CC),num(CC))),CC\=CA,CC\=CB,
CC\=AC,CC\=BC,

%% CD
(((Isatom=no;Length<20),num(CD));
(Isatom=yes,sub_atom(Sample, 19,1,_,CD),num(CD))),CD\=CA,CD\=CB,CD\=CC,
CD\=AD,CD\=BD,

%% CE
(((Isatom=no;Length<21),num(CE));
(Isatom=yes,sub_atom(Sample, 20,1,_,CE),num(CE))),CE\=CA,CE\=CB,CE\=CC,CE\=CD,
CE\=AE,CE\=BE,

%% CF
(((Isatom=no;Length<22),num(CF));
(Isatom=yes,sub_atom(Sample, 21,1,_,CF),num(CF))),CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,
CF\=AF,CF\=BF,

%% CG
(((Isatom=no;Length<23),num(CG));
(Isatom=yes,sub_atom(Sample, 22,1,_,CG),num(CG))),CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,
CG\=AG,CG\=BG,

%% CH
(((Isatom=no;Length<24),num(CH));
(Isatom=yes,sub_atom(Sample, 23,1,_,CH),num(CH))),CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,
CH\=AH,CH\=BH,


%% DA
(((Isatom=no;Length<25),num(DA));
(Isatom=yes,sub_atom(Sample, 24,1,_,DA),num(DA))),DA\=AA,DA\=BA,DA\=CA,

%% DB
(((Isatom=no;Length<26),num(DB));
(Isatom=yes,sub_atom(Sample, 25,1,_,DB),num(DB))),DB\=DA,
DB\=AB,DB\=BB,DB\=CB,

%% DC
(((Isatom=no;Length<27),num(DC));
(Isatom=yes,sub_atom(Sample, 26,1,_,DC),num(DC))),DC\=DA,DC\=DB,
DC\=AC,DC\=BC,DC\=CC,

%% DD
(((Isatom=no;Length<28),num(DD));
(Isatom=yes,sub_atom(Sample, 27,1,_,DD),num(DD))),DD\=DA,DD\=DB,DD\=DC,
DD\=AD,DD\=BD,DD\=CD,

%% DE
(((Isatom=no;Length<29),num(DE));
(Isatom=yes,sub_atom(Sample, 28,1,_,DE),num(DE))),DE\=DA,DE\=DB,DE\=DC,DE\=DD,
DE\=AE,DE\=BE,DE\=CE,

%% DF
(((Isatom=no;Length<30),num(DF));
(Isatom=yes,sub_atom(Sample, 29,1,_,DF),num(DF))),DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,
DF\=AF,DF\=BF,DF\=CF,

%% DG
(((Isatom=no;Length<31),num(DG));
(Isatom=yes,sub_atom(Sample, 30,1,_,DG),num(DG))),DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,
DG\=AG,DG\=BG,DG\=CG,

%% DH
(((Isatom=no;Length<32),num(DH));
(Isatom=yes,sub_atom(Sample, 31,1,_,DH),num(DH))),DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,
DH\=AH,DH\=BH,DH\=CH,


%% EA
(((Isatom=no;Length<33),num(EA));
(Isatom=yes,sub_atom(Sample, 32,1,_,EA),num(EA))),EA\=AA,EA\=BA,EA\=CA,EA\=DA,

%% EB
(((Isatom=no;Length<34),num(EB));
(Isatom=yes,sub_atom(Sample, 33,1,_,EB),num(EB))),EB\=EA,
EB\=AB,EB\=BB,EB\=CB,EB\=DB,

%% EC
(((Isatom=no;Length<35),num(EC));
(Isatom=yes,sub_atom(Sample, 34,1,_,EC),num(EC))),EC\=EA,EC\=EB,
EC\=AC,EC\=BC,EC\=CC,EC\=DC,

%% ED
(((Isatom=no;Length<36),num(ED));
(Isatom=yes,sub_atom(Sample, 35,1,_,ED),num(ED))),ED\=EA,ED\=EB,ED\=EC,
ED\=AD,ED\=BD,ED\=CD,ED\=DD,

%% EE
(((Isatom=no;Length<37),num(EE));
(Isatom=yes,sub_atom(Sample, 36,1,_,EE),num(EE))),EE\=EA,EE\=EB,EE\=EC,EE\=ED,
EE\=AE,EE\=BE,EE\=CE,EE\=DE,

%% EF
(((Isatom=no;Length<38),num(EF));
(Isatom=yes,sub_atom(Sample, 37,1,_,EF),num(EF))),EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,
EF\=AF,EF\=BF,EF\=CF,EF\=DF,

%% EG
(((Isatom=no;Length<39),num(EG));
(Isatom=yes,sub_atom(Sample, 38,1,_,EG),num(EG))),EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,
EG\=AG,EG\=BG,EG\=CG,EG\=DG,

%% EH
(((Isatom=no;Length<40),num(EH));
(Isatom=yes,sub_atom(Sample, 39,1,_,EH),num(EH))),EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,
EH\=AH,EH\=BH,EH\=CH,EH\=DH,


%% FA
(((Isatom=no;Length<41),num(FA));
(Isatom=yes,sub_atom(Sample, 40,1,_,FA),num(FA))),FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,

%% FB
(((Isatom=no;Length<42),num(FB));
(Isatom=yes,sub_atom(Sample, 41,1,_,FB),num(FB))),FB\=FA,
FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,

%% FC
(((Isatom=no;Length<43),num(FC));
(Isatom=yes,sub_atom(Sample, 42,1,_,FC),num(FC))),FC\=FA,FC\=FB,
FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,

%% FD
(((Isatom=no;Length<44),num(FD));
(Isatom=yes,sub_atom(Sample, 43,1,_,FD),num(FD))),FD\=FA,FD\=FB,FD\=FC,
FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,

%% FE
(((Isatom=no;Length<45),num(FE));
(Isatom=yes,sub_atom(Sample, 44,1,_,FE),num(FE))),FE\=FA,FE\=FB,FE\=FC,FE\=FD,
FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,

%% FF
(((Isatom=no;Length<46),num(FF));
(Isatom=yes,sub_atom(Sample, 45,1,_,FF),num(FF))),FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,
FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,

%% FG
(((Isatom=no;Length<47),num(FG));
(Isatom=yes,sub_atom(Sample, 46,1,_,FG),num(FG))),FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,
FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,

%% FH
(((Isatom=no;Length<48),num(FH));
(Isatom=yes,sub_atom(Sample, 47,1,_,FH),num(FH))),FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,
FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,


%% GA
(((Isatom=no;Length<49),num(GA));
(Isatom=yes,sub_atom(Sample, 48,1,_,GA),num(GA))),GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,

%% GB
(((Isatom=no;Length<50),num(GB));
(Isatom=yes,sub_atom(Sample, 49,1,_,GB),num(GB))),GB\=GA,
GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,

%% GC
(((Isatom=no;Length<51),num(GC));
(Isatom=yes,sub_atom(Sample, 50,1,_,GC),num(GC))),GC\=GA,GC\=GB,
GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,

%% GD
(((Isatom=no;Length<52),num(GD));
(Isatom=yes,sub_atom(Sample, 51,1,_,GD),num(GD))),GD\=GA,GD\=GB,GD\=GC,
GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,

%% GE
(((Isatom=no;Length<53),num(GE));
(Isatom=yes,sub_atom(Sample, 52,1,_,GE),num(GE))),GE\=GA,GE\=GB,GE\=GC,GE\=GD,
GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,

%% GF
(((Isatom=no;Length<54),num(GF));
(Isatom=yes,sub_atom(Sample, 53,1,_,GF),num(GF))),GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,
GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,

%% GG
(((Isatom=no;Length<55),num(GG));
(Isatom=yes,sub_atom(Sample, 54,1,_,GG),num(GG))),GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,
GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,

%% GH
(((Isatom=no;Length<56),num(GH));
(Isatom=yes,sub_atom(Sample, 55,1,_,GH),num(GH))),GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,
GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,


%% HA
(((Isatom=no;Length<57),num(HA));
(Isatom=yes,sub_atom(Sample, 56,1,_,HA),num(HA))),HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,

%% HB
(((Isatom=no;Length<58),num(HB));
(Isatom=yes,sub_atom(Sample, 57,1,_,HB),num(HB))),HB\=HA,
HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,

%% HC
(((Isatom=no;Length<59),num(HC));
(Isatom=yes,sub_atom(Sample, 58,1,_,HC),num(HC))),HC\=HA,HC\=HB,
HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,

%% HD
(((Isatom=no;Length<60),num(HD));
(Isatom=yes,sub_atom(Sample, 59,1,_,HD),num(HD))),HD\=HA,HD\=HB,HD\=HC,
HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,

%% HE
(((Isatom=no;Length<61),num(HE));
(Isatom=yes,sub_atom(Sample, 60,1,_,HE),num(HE))),HE\=HA,HE\=HB,HE\=HC,HE\=HD,
HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,

%% HF
(((Isatom=no;Length<62),num(HF));
(Isatom=yes,sub_atom(Sample, 61,1,_,HF),num(HF))),HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,
HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,

%% HG
(((Isatom=no;Length<63),num(HG));
(Isatom=yes,sub_atom(Sample, 62,1,_,HG),num(HG))),HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,
HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,

%% HH
(((Isatom=no;Length<64),num(HH));
(Isatom=yes,sub_atom(Sample, 63,1,_,HH),num(HH))),HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,
HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,










atom_list_concat([AA,AB,AC,AD,AE,AF,AG,AH,BA,BB,BC,BD,BE,BF,BG,BH,CA,CB,CC,CD,CE,CF,CG,CH,DA,DB,DC,DD,DE,DF,DG,DH,EA,EB,EC,ED,EE,EF,EG,EH,FA,FB,FC,FD,FE,FF,FG,FH,GA,GB,GC,GD,GE,GF,GG,GH,HA,HB,HC,HD,HE,HF,HG,HH],LongAtom),
term_string(LongAtom,LongString),
write(Sample),write("="),write(LongString),write("\n"),fail.
