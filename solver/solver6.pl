num('a').
num('b').
num('c').
num('d').
num('e').
num('f').
num('g').
num('h').
num('i').
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
(
    (
        not(atom(Sample)),
        Isatom=no,
        Length=0
    );
    (
        atom(Sample),
        atom_length(Sample,Length),
        Isatom=yes
    )
),



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


%% AI
(((Isatom=no;Length<9),num(AI));
(Isatom=yes,sub_atom(Sample, 8,1,_,AI),num(AI))),AI\=AA,AI\=AB,AI\=AC,AI\=AD,AI\=AE,AI\=AF,AI\=AG,AI\=AH,




%% BA
(((Isatom=no;Length<10),num(BA));
(Isatom=yes,sub_atom(Sample, 9,1,_,BA),num(BA))),BA\=AA,
BA\=AB,BA\=AC,

%% BB
(((Isatom=no;Length<11),num(BB));
(Isatom=yes,sub_atom(Sample, 10,1,_,BB),num(BB))),BB\=BA,
BB\=AB,
BB\=AA,
BB\=AC,

%% BC
(((Isatom=no;Length<12),num(BC));
(Isatom=yes,sub_atom(Sample, 11,1,_,BC),num(BC))),BC\=BA,BC\=BB,
BC\=AC,
BC\=AA,BC\=AB,

%% BD
(((Isatom=no;Length<13),num(BD));
(Isatom=yes,sub_atom(Sample, 12,1,_,BD),num(BD))),BD\=BA,BD\=BB,BD\=BC,
BD\=AD,
BD\=AE,BD\=AF,

%% BE
(((Isatom=no;Length<14),num(BE));
(Isatom=yes,sub_atom(Sample, 13,1,_,BE),num(BE))),BE\=BA,BE\=BB,BE\=BC,BE\=BD,
BE\=AE,
BE\=AD,BE\=AF,

%% BF
(((Isatom=no;Length<15),num(BF));
(Isatom=yes,sub_atom(Sample, 14,1,_,BF),num(BF))),BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,
BF\=AF,
BF\=AD,BF\=AE,

%% BG
(((Isatom=no;Length<16),num(BG));
(Isatom=yes,sub_atom(Sample, 15,1,_,BG),num(BG))),BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,
BG\=AG,
BG\=AH,BG\=AI,

%% BH
(((Isatom=no;Length<17),num(BH));
(Isatom=yes,sub_atom(Sample, 16,1,_,BH),num(BH))),BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,
BH\=AH,
BH\=AI,
BH\=AG,

%% BI
(((Isatom=no;Length<18),num(BI));
(Isatom=yes,sub_atom(Sample, 17,1,_,BI),num(BI))),BI\=BA,BI\=BB,BI\=BC,BI\=BD,BI\=BE,BI\=BF,BI\=BG,BI\=BH,
BI\=AI,
BI\=AG,BI\=AH,


%% CA
(((Isatom=no;Length<19),num(CA));
(Isatom=yes,sub_atom(Sample, 18,1,_,CA),num(CA))),CA\=AA,CA\=BA,
CA\=AB,CA\=BB,CA\=AC,CA\=BC,

%% CB
(((Isatom=no;Length<20),num(CB));
(Isatom=yes,sub_atom(Sample, 19,1,_,CB),num(CB))),CB\=CA,
CB\=AB,CB\=BB,
CB\=AA,CB\=BA,CB\=AC,CB\=BC,

%% CC
(((Isatom=no;Length<21),num(CC));
(Isatom=yes,sub_atom(Sample, 20,1,_,CC),num(CC))),CC\=CA,CC\=CB,
CC\=AC,CC\=BC,
CC\=AA,CC\=BB,
CC\=BA,CC\=AB,

%% CD
(((Isatom=no;Length<22),num(CD));
(Isatom=yes,sub_atom(Sample, 21,1,_,CD),num(CD))),CD\=CA,CD\=CB,CD\=CC,
CD\=AD,CD\=BD,
CD\=AE,CD\=BE,CD\=AF,CD\=BF,

%% CE
(((Isatom=no;Length<23),num(CE));
(Isatom=yes,sub_atom(Sample, 22,1,_,CE),num(CE))),CE\=CA,CE\=CB,CE\=CC,CE\=CD,
CE\=AE,CE\=BE,
CE\=AD,CE\=BD,CE\=AF,CE\=BF,

%% CF
(((Isatom=no;Length<24),num(CF));
(Isatom=yes,sub_atom(Sample, 23,1,_,CF),num(CF))),CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,
CF\=AF,CF\=BF,
CF\=AD,CF\=BD,CF\=AE,CF\=BE,

%% CG
(((Isatom=no;Length<25),num(CG));
(Isatom=yes,sub_atom(Sample, 24,1,_,CG),num(CG))),CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,
CG\=AG,CG\=BG,
CG\=BH,CG\=AI,
CG\=AH,CG\=BI,

%% CH
(((Isatom=no;Length<26),num(CH));
(Isatom=yes,sub_atom(Sample, 25,1,_,CH),num(CH))),CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,
CH\=AH,CH\=BH,
CH\=AG,CH\=BG,CH\=AI,CH\=BI,

%% CI
(((Isatom=no;Length<27),num(CI));
(Isatom=yes,sub_atom(Sample, 26,1,_,CI),num(CI))),CI\=CA,CI\=CB,CI\=CC,CI\=CD,CI\=CE,CI\=CF,CI\=CG,CI\=CH,
CI\=AI,CI\=BI,
CI\=AG,CI\=BG,CI\=AH,CI\=BH,


%% DA
(((Isatom=no;Length<28),num(DA));
(Isatom=yes,sub_atom(Sample, 27,1,_,DA),num(DA))),DA\=AA,DA\=BA,DA\=CA,


%% DB
(((Isatom=no;Length<29),num(DB));
(Isatom=yes,sub_atom(Sample, 28,1,_,DB),num(DB))),DB\=DA,
DB\=AB,DB\=BB,DB\=CB,


%% DC
(((Isatom=no;Length<30),num(DC));
(Isatom=yes,sub_atom(Sample, 29,1,_,DC),num(DC))),DC\=DA,DC\=DB,
DC\=AC,DC\=BC,DC\=CC,


%% DD
(((Isatom=no;Length<31),num(DD));
(Isatom=yes,sub_atom(Sample, 30,1,_,DD),num(DD))),DD\=DA,DD\=DB,DD\=DC,
DD\=AD,DD\=BD,DD\=CD,
DD\=AA,DD\=BB,DD\=CC,


%% DE
(((Isatom=no;Length<32),num(DE));
(Isatom=yes,sub_atom(Sample, 31,1,_,DE),num(DE))),DE\=DA,DE\=DB,DE\=DC,DE\=DD,
DE\=AE,DE\=BE,DE\=CE,


%% DF
(((Isatom=no;Length<33),num(DF));
(Isatom=yes,sub_atom(Sample, 32,1,_,DF),num(DF))),DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,
DF\=AF,DF\=BF,DF\=CF,
DF\=CG,DF\=BH,DF\=AI,


%% DG
(((Isatom=no;Length<34),num(DG));
(Isatom=yes,sub_atom(Sample, 33,1,_,DG),num(DG))),DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,
DG\=AG,DG\=BG,DG\=CG,


%% DH
(((Isatom=no;Length<35),num(DH));
(Isatom=yes,sub_atom(Sample, 34,1,_,DH),num(DH))),DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,
DH\=AH,DH\=BH,DH\=CH,


%% DI
(((Isatom=no;Length<36),num(DI));
(Isatom=yes,sub_atom(Sample, 35,1,_,DI),num(DI))),DI\=DA,DI\=DB,DI\=DC,DI\=DD,DI\=DE,DI\=DF,DI\=DG,DI\=DH,
DI\=AI,DI\=BI,DI\=CI,



%% EA
(((Isatom=no;Length<37),num(EA));
(Isatom=yes,sub_atom(Sample, 36,1,_,EA),num(EA))),EA\=AA,EA\=BA,EA\=CA,EA\=DA,
EA\=DB,EA\=DC,

%% EB
(((Isatom=no;Length<38),num(EB));
(Isatom=yes,sub_atom(Sample, 37,1,_,EB),num(EB))),EB\=EA,
EB\=AB,EB\=BB,EB\=CB,EB\=DB,
EB\=DA,EB\=DC,

%% EC
(((Isatom=no;Length<39),num(EC));
(Isatom=yes,sub_atom(Sample, 38,1,_,EC),num(EC))),EC\=EA,EC\=EB,
EC\=AC,EC\=BC,EC\=CC,EC\=DC,
EC\=DA,EC\=DB,

%% ED
(((Isatom=no;Length<40),num(ED));
(Isatom=yes,sub_atom(Sample, 39,1,_,ED),num(ED))),ED\=EA,ED\=EB,ED\=EC,
ED\=AD,ED\=BD,ED\=CD,ED\=DD,
ED\=DE,ED\=DF,

%% EE
(((Isatom=no;Length<41),num(EE));
(Isatom=yes,sub_atom(Sample, 40,1,_,EE),num(EE))),EE\=EA,EE\=EB,EE\=EC,EE\=ED,
EE\=AE,EE\=BE,EE\=CE,EE\=DE,
EE\=AA,EE\=BB,EE\=CC,EE\=DD,
EE\=DF,EE\=CG,EE\=BH,EE\=AI,


%% EF
(((Isatom=no;Length<42),num(EF));
(Isatom=yes,sub_atom(Sample, 41,1,_,EF),num(EF))),EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,
EF\=AF,EF\=BF,EF\=CF,EF\=DF,
EF\=DD,EF\=DE,

%% EG
(((Isatom=no;Length<43),num(EG));
(Isatom=yes,sub_atom(Sample, 42,1,_,EG),num(EG))),EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,
EG\=AG,EG\=BG,EG\=CG,EG\=DG,
EG\=DH,EG\=DI,

%% EH
(((Isatom=no;Length<44),num(EH));
(Isatom=yes,sub_atom(Sample, 43,1,_,EH),num(EH))),EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,
EH\=AH,EH\=BH,EH\=CH,EH\=DH,
EH\=DG,EH\=DI,

%% EI
(((Isatom=no;Length<45),num(EI));
(Isatom=yes,sub_atom(Sample, 44,1,_,EI),num(EI))),EI\=EA,EI\=EB,EI\=EC,EI\=ED,EI\=EE,EI\=EF,EI\=EG,EI\=EH,
EI\=AI,EI\=BI,EI\=CI,EI\=DI,
EI\=DG,EI\=DH,


%% FA
(((Isatom=no;Length<46),num(FA));
(Isatom=yes,sub_atom(Sample, 45,1,_,FA),num(FA))),FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,
FA\=DB,FA\=EB,FA\=DC,FA\=EC,

%% FB
(((Isatom=no;Length<47),num(FB));
(Isatom=yes,sub_atom(Sample, 46,1,_,FB),num(FB))),FB\=FA,
FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,
FB\=DA,FB\=EA,FB\=DC,FB\=EC,

%% FC
(((Isatom=no;Length<48),num(FC));
(Isatom=yes,sub_atom(Sample, 47,1,_,FC),num(FC))),FC\=FA,FC\=FB,
FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,
FC\=DA,FC\=EA,FC\=DB,FC\=EB,

%% FD
(((Isatom=no;Length<49),num(FD));
(Isatom=yes,sub_atom(Sample, 48,1,_,FD),num(FD))),FD\=FA,FD\=FB,FD\=FC,
FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,
FD\=EE,FD\=DF,FD\=CG,FD\=BH,FD\=AI,
FD\=DE,FD\=EF,

%% FE
(((Isatom=no;Length<50),num(FE));
(Isatom=yes,sub_atom(Sample, 49,1,_,FE),num(FE))),FE\=FA,FE\=FB,FE\=FC,FE\=FD,
FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,
FE\=DD,FE\=ED,FE\=DF,FE\=EF,

%% FF
(((Isatom=no;Length<51),num(FF));
(Isatom=yes,sub_atom(Sample, 50,1,_,FF),num(FF))),FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,
FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,
FF\=AA,FF\=BB,FF\=CC,FF\=DD,FF\=EE,
FF\=ED,FF\=DE,

%% FG
(((Isatom=no;Length<52),num(FG));
(Isatom=yes,sub_atom(Sample, 51,1,_,FG),num(FG))),FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,
FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,
FG\=DH,FG\=EH,FG\=DI,FG\=EI,

%% FH
(((Isatom=no;Length<53),num(FH));
(Isatom=yes,sub_atom(Sample, 52,1,_,FH),num(FH))),FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,
FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,
FH\=DG,FH\=EG,FH\=DI,FH\=EI,

%% FI
(((Isatom=no;Length<54),num(FI));
(Isatom=yes,sub_atom(Sample, 53,1,_,FI),num(FI))),FI\=FA,FI\=FB,FI\=FC,FI\=FD,FI\=FE,FI\=FF,FI\=FG,FI\=FH,
FI\=AI,FI\=BI,FI\=CI,FI\=DI,FI\=EI,
FI\=DG,FI\=EG,FI\=DH,FI\=EH,


%% GA
(((Isatom=no;Length<55),num(GA));
(Isatom=yes,sub_atom(Sample, 54,1,_,GA),num(GA))),GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,


%% GB
(((Isatom=no;Length<56),num(GB));
(Isatom=yes,sub_atom(Sample, 55,1,_,GB),num(GB))),GB\=GA,
GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,


%% GC
(((Isatom=no;Length<57),num(GC));
(Isatom=yes,sub_atom(Sample, 56,1,_,GC),num(GC))),GC\=GA,GC\=GB,
GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,
GC\=FD,GC\=EE,GC\=DF,GC\=CG,GC\=BH,GC\=AI,


%% GD
(((Isatom=no;Length<58),num(GD));
(Isatom=yes,sub_atom(Sample, 57,1,_,GD),num(GD))),GD\=GA,GD\=GB,GD\=GC,
GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,


%% GE
(((Isatom=no;Length<59),num(GE));
(Isatom=yes,sub_atom(Sample, 58,1,_,GE),num(GE))),GE\=GA,GE\=GB,GE\=GC,GE\=GD,
GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,


%% GF
(((Isatom=no;Length<60),num(GF));
(Isatom=yes,sub_atom(Sample, 59,1,_,GF),num(GF))),GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,
GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,


%% GG
(((Isatom=no;Length<61),num(GG));
(Isatom=yes,sub_atom(Sample, 60,1,_,GG),num(GG))),GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,
GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,
GG\=AA,GG\=BB,GG\=CC,GG\=DD,GG\=EE,GG\=FF,


%% GH
(((Isatom=no;Length<62),num(GH));
(Isatom=yes,sub_atom(Sample, 61,1,_,GH),num(GH))),GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,
GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,


%% GI
(((Isatom=no;Length<63),num(GI));
(Isatom=yes,sub_atom(Sample, 62,1,_,GI),num(GI))),GI\=GA,GI\=GB,GI\=GC,GI\=GD,GI\=GE,GI\=GF,GI\=GG,GI\=GH,
GI\=AI,GI\=BI,GI\=CI,GI\=DI,GI\=EI,GI\=FI,



%% HA
(((Isatom=no;Length<64),num(HA));
(Isatom=yes,sub_atom(Sample, 63,1,_,HA),num(HA))),HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,
HA\=GB,HA\=GC,

%% HB
(((Isatom=no;Length<65),num(HB));
(Isatom=yes,sub_atom(Sample, 64,1,_,HB),num(HB))),HB\=HA,
HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,
HB\=GC,HB\=FD,HB\=EE,HB\=DF,HB\=CG,HB\=BH,HB\=AI,
HB\=GA,

%% HC
(((Isatom=no;Length<66),num(HC));
(Isatom=yes,sub_atom(Sample, 65,1,_,HC),num(HC))),HC\=HA,HC\=HB,
HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,
HC\=GA,HC\=GB,

%% HD
(((Isatom=no;Length<67),num(HD));
(Isatom=yes,sub_atom(Sample, 66,1,_,HD),num(HD))),HD\=HA,HD\=HB,HD\=HC,
HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,
HD\=GE,HD\=GF,

%% HE
(((Isatom=no;Length<68),num(HE));
(Isatom=yes,sub_atom(Sample, 67,1,_,HE),num(HE))),HE\=HA,HE\=HB,HE\=HC,HE\=HD,
HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,
HE\=GD,HE\=GF,

%% HF
(((Isatom=no;Length<69),num(HF));
(Isatom=yes,sub_atom(Sample, 68,1,_,HF),num(HF))),HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,
HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,
HF\=GD,HF\=GE,

%% HG
(((Isatom=no;Length<70),num(HG));
(Isatom=yes,sub_atom(Sample, 69,1,_,HG),num(HG))),HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,
HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,
HG\=GH,HG\=GI,

%% HH
(((Isatom=no;Length<71),num(HH));
(Isatom=yes,sub_atom(Sample, 70,1,_,HH),num(HH))),HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,
HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,
HH\=AA,HH\=BB,HH\=CC,HH\=DD,HH\=EE,HH\=FF,HH\=GG,
HH\=GI,

%% HI
(((Isatom=no;Length<72),num(HI));
(Isatom=yes,sub_atom(Sample, 71,1,_,HI),num(HI))),HI\=HA,HI\=HB,HI\=HC,HI\=HD,HI\=HE,HI\=HF,HI\=HG,HI\=HH,
HI\=AI,HI\=BI,HI\=CI,HI\=DI,HI\=EI,HI\=FI,HI\=GI,
HI\=GG,HI\=GH,


%% IA
(((Isatom=no;Length<73),num(IA));
(Isatom=yes,sub_atom(Sample, 72,1,_,IA),num(IA))),IA\=AA,IA\=BA,IA\=CA,IA\=DA,IA\=EA,IA\=FA,IA\=GA,IA\=HA,
IA\=HB,IA\=GC,IA\=FD,IA\=EE,IA\=DF,IA\=CG,IA\=BH,IA\=AI,
IA\=GB,IA\=HC,

%% IB
(((Isatom=no;Length<74),num(IB));
(Isatom=yes,sub_atom(Sample, 73,1,_,IB),num(IB))),IB\=IA,
IB\=AB,IB\=BB,IB\=CB,IB\=DB,IB\=EB,IB\=FB,IB\=GB,IB\=HB,
IB\=GA,IB\=HA,IB\=GC,IB\=HC,

%% IC
(((Isatom=no;Length<75),num(IC));
(Isatom=yes,sub_atom(Sample, 74,1,_,IC),num(IC))),IC\=IA,IC\=IB,
IC\=AC,IC\=BC,IC\=CC,IC\=DC,IC\=EC,IC\=FC,IC\=GC,IC\=HC,
IC\=GA,IC\=HA,IC\=GB,IC\=HB,

%% ID
(((Isatom=no;Length<76),num(ID));
(Isatom=yes,sub_atom(Sample, 75,1,_,ID),num(ID))),ID\=IA,ID\=IB,ID\=IC,
ID\=AD,ID\=BD,ID\=CD,ID\=DD,ID\=ED,ID\=FD,ID\=GD,ID\=HD,
ID\=GE,ID\=HE,ID\=GF,ID\=HF,

%% IE
(((Isatom=no;Length<77),num(IE));
(Isatom=yes,sub_atom(Sample, 76,1,_,IE),num(IE))),IE\=IA,IE\=IB,IE\=IC,IE\=ID,
IE\=AE,IE\=BE,IE\=CE,IE\=DE,IE\=EE,IE\=FE,IE\=GE,IE\=HE,
IE\=GD,IE\=HD,IE\=GF,IE\=HF,

%% IF
(((Isatom=no;Length<78),num(IF));
(Isatom=yes,sub_atom(Sample, 77,1,_,IF),num(IF))),IF\=IA,IF\=IB,IF\=IC,IF\=ID,IF\=IE,
IF\=AF,IF\=BF,IF\=CF,IF\=DF,IF\=EF,IF\=FF,IF\=GF,IF\=HF,
IF\=GD,IF\=HD,IF\=GE,IF\=HE,

%% IG
(((Isatom=no;Length<79),num(IG));
(Isatom=yes,sub_atom(Sample, 78,1,_,IG),num(IG))),IG\=IA,IG\=IB,IG\=IC,IG\=ID,IG\=IE,IG\=IF,
IG\=AG,IG\=BG,IG\=CG,IG\=DG,IG\=EG,IG\=FG,IG\=GG,IG\=HG,
IG\=GH,IG\=HH,IG\=GI,IG\=HI,

%% IH
(((Isatom=no;Length<80),num(IH));
(Isatom=yes,sub_atom(Sample, 79,1,_,IH),num(IH))),IH\=IA,IH\=IB,IH\=IC,IH\=ID,IH\=IE,IH\=IF,IH\=IG,
IH\=AH,IH\=BH,IH\=CH,IH\=DH,IH\=EH,IH\=FH,IH\=GH,IH\=HH,
IH\=GG,IH\=HG,IH\=GI,IH\=HI,

%% II
(((Isatom=no;Length<81),num(II));
(Isatom=yes,sub_atom(Sample, 80,1,_,II),num(II))),II\=IA,II\=IB,II\=IC,II\=ID,II\=IE,II\=IF,II\=IG,II\=IH,
II\=AI,II\=BI,II\=CI,II\=DI,II\=EI,II\=FI,II\=GI,II\=HI,
II\=AA,II\=BB,II\=CC,II\=DD,II\=EE,II\=FF,II\=GG,II\=HH,
II\=HG,II\=GH,











atom_list_concat([AA,AB,AC,AD,AE,AF,AG,AH,AI,BA,BB,BC,BD,BE,BF,BG,BH,BI,CA,CB,CC,CD,CE,CF,CG,CH,CI,DA,DB,DC,DD,DE,DF,DG,DH,DI,EA,EB,EC,ED,EE,EF,EG,EH,EI,FA,FB,FC,FD,FE,FF,FG,FH,FI,GA,GB,GC,GD,GE,GF,GG,GH,GI,HA,HB,HC,HD,HE,HF,HG,HH,HI,IA,IB,IC,ID,IE,IF,IG,IH,II],LongString),
term_string(Sample,LongString),
write(Sample),write("="),write(LongString).
