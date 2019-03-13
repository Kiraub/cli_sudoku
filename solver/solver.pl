empty('x').
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

%:- initialization(main, main).
main([_|H]):-
    write("Input:<"),
    write(H),
    write(">Answer:<"),
    (H=[Arg|_],solver(Arg);write("false")),
    write(">").

solver(Sample) :-
((not(atom(Sample)),Isatom=no,Length=0);(atom(Sample),atom_length(Sample,Length),Isatom=yes)),


%% AA
((Isatom=yes,Length>0,sub_atom(Sample, 0,1,_,AAE),(num(AAE),AA=AAE);(num(AA)));(Isatom=no;Length<1)),
%% same row:
%% same column:
%% tl-dr diagonal:

%% same-box:


%% AB
((Isatom=yes,Length>1,sub_atom(Sample, 1,1,_,ABE),(num(ABE),AB=ABE);(num(AB)));(Isatom=no;Length<2)),
%% same row:
AB\=AA,
%% same column:
%% same-box:


%% AC
((Isatom=yes,Length>2,sub_atom(Sample, 2,1,_,ACE),(num(ACE),AC=ACE);(num(AC)));(Isatom=no;Length<3)),
%% same row:
AC\=AA,AC\=AB,
%% same column:
%% same-box:


%% AD
((Isatom=yes,Length>3,sub_atom(Sample, 3,1,_,ADE),(num(ADE),AD=ADE);(num(AD)));(Isatom=no;Length<4)),
%% same row:
AD\=AA,AD\=AB,AD\=AC,
%% same column:
%% same-box:


%% AE
((Isatom=yes,Length>4,sub_atom(Sample, 4,1,_,AEE),(num(AEE),AE=AEE);(num(AE)));(Isatom=no;Length<5)),
%% same row:
AE\=AA,AE\=AB,AE\=AC,AE\=AD,
%% same column:
%% same-box:


%% AF
((Isatom=yes,Length>5,sub_atom(Sample, 5,1,_,AFE),(num(AFE),AF=AFE);(num(AF)));(Isatom=no;Length<6)),
%% same row:
AF\=AA,AF\=AB,AF\=AC,AF\=AD,AF\=AE,
%% same column:
%% same-box:


%% AG
((Isatom=yes,Length>6,sub_atom(Sample, 6,1,_,AGE),(num(AGE),AG=AGE);(num(AG)));(Isatom=no;Length<7)),
%% same row:
AG\=AA,AG\=AB,AG\=AC,AG\=AD,AG\=AE,AG\=AF,
%% same column:
%% same-box:


%% AH
((Isatom=yes,Length>7,sub_atom(Sample, 7,1,_,AHE),(num(AHE),AH=AHE);(num(AH)));(Isatom=no;Length<8)),
%% same row:
AH\=AA,AH\=AB,AH\=AC,AH\=AD,AH\=AE,AH\=AF,AH\=AG,
%% same column:
%% same-box:


%% AI
((Isatom=yes,Length>8,sub_atom(Sample, 8,1,_,AIE),(num(AIE),AI=AIE);(num(AI)));(Isatom=no;Length<9)),
%% same row:
AI\=AA,AI\=AB,AI\=AC,AI\=AD,AI\=AE,AI\=AF,AI\=AG,AI\=AH,
%% same column:
%% dl-tr diagonal:

%% same-box:



%% BA
((Isatom=yes,Length>9,sub_atom(Sample, 9,1,_,BAE),(num(BAE),BA=BAE);(num(BA)));(Isatom=no;Length<10)),
%% same row:
%% same column:
BA\=AA,
%% same-box:
BA\=AB,BA\=AC,

%% BB
((Isatom=yes,Length>10,sub_atom(Sample, 10,1,_,BBE),(num(BBE),BB=BBE);(num(BB)));(Isatom=no;Length<11)),
%% same row:
BB\=BA,
%% same column:
BB\=AB,
%% tl-dr diagonal:
BB\=AA,
%% same-box:
BB\=AC,

%% BC
((Isatom=yes,Length>11,sub_atom(Sample, 11,1,_,BCE),(num(BCE),BC=BCE);(num(BC)));(Isatom=no;Length<12)),
%% same row:
BC\=BA,BC\=BB,
%% same column:
BC\=AC,
%% same-box:
BC\=AA,BC\=AB,

%% BD
((Isatom=yes,Length>12,sub_atom(Sample, 12,1,_,BDE),(num(BDE),BD=BDE);(num(BD)));(Isatom=no;Length<13)),
%% same row:
BD\=BA,BD\=BB,BD\=BC,
%% same column:
BD\=AD,
%% same-box:
BD\=AE,BD\=AF,

%% BE
((Isatom=yes,Length>13,sub_atom(Sample, 13,1,_,BEE),(num(BEE),BE=BEE);(num(BE)));(Isatom=no;Length<14)),
%% same row:
BE\=BA,BE\=BB,BE\=BC,BE\=BD,
%% same column:
BE\=AE,
%% same-box:
BE\=AD,BE\=AF,

%% BF
((Isatom=yes,Length>14,sub_atom(Sample, 14,1,_,BFE),(num(BFE),BF=BFE);(num(BF)));(Isatom=no;Length<15)),
%% same row:
BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,
%% same column:
BF\=AF,
%% same-box:
BF\=AD,BF\=AE,

%% BG
((Isatom=yes,Length>15,sub_atom(Sample, 15,1,_,BGE),(num(BGE),BG=BGE);(num(BG)));(Isatom=no;Length<16)),
%% same row:
BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,
%% same column:
BG\=AG,
%% same-box:
BG\=AH,BG\=AI,

%% BH
((Isatom=yes,Length>16,sub_atom(Sample, 16,1,_,BHE),(num(BHE),BH=BHE);(num(BH)));(Isatom=no;Length<17)),
%% same row:
BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,
%% same column:
BH\=AH,
%% dl-tr diagonal:
BH\=AI,
%% same-box:
BH\=AG,

%% BI
((Isatom=yes,Length>17,sub_atom(Sample, 17,1,_,BIE),(num(BIE),BI=BIE);(num(BI)));(Isatom=no;Length<18)),
%% same row:
BI\=BA,BI\=BB,BI\=BC,BI\=BD,BI\=BE,BI\=BF,BI\=BG,BI\=BH,
%% same column:
BI\=AI,
%% same-box:
BI\=AG,BI\=AH,


%% CA
((Isatom=yes,Length>18,sub_atom(Sample, 18,1,_,CAE),(num(CAE),CA=CAE);(num(CA)));(Isatom=no;Length<19)),
%% same row:
%% same column:
CA\=AA,CA\=BA,
%% same-box:
CA\=AB,CA\=BB,CA\=AC,CA\=BC,

%% CB
((Isatom=yes,Length>19,sub_atom(Sample, 19,1,_,CBE),(num(CBE),CB=CBE);(num(CB)));(Isatom=no;Length<20)),
%% same row:
CB\=CA,
%% same column:
CB\=AB,CB\=BB,
%% same-box:
CB\=AA,CB\=BA,CB\=AC,CB\=BC,

%% CC
((Isatom=yes,Length>20,sub_atom(Sample, 20,1,_,CCE),(num(CCE),CC=CCE);(num(CC)));(Isatom=no;Length<21)),
%% same row:
CC\=CA,CC\=CB,
%% same column:
CC\=AC,CC\=BC,
%% tl-dr diagonal:
CC\=AA,CC\=BB,
%% same-box:
CC\=BA,CC\=AB,

%% CD
((Isatom=yes,Length>21,sub_atom(Sample, 21,1,_,CDE),(num(CDE),CD=CDE);(num(CD)));(Isatom=no;Length<22)),
%% same row:
CD\=CA,CD\=CB,CD\=CC,
%% same column:
CD\=AD,CD\=BD,
%% same-box:
CD\=AE,CD\=BE,CD\=AF,CD\=BF,

%% CE
((Isatom=yes,Length>22,sub_atom(Sample, 22,1,_,CEE),(num(CEE),CE=CEE);(num(CE)));(Isatom=no;Length<23)),
%% same row:
CE\=CA,CE\=CB,CE\=CC,CE\=CD,
%% same column:
CE\=AE,CE\=BE,
%% same-box:
CE\=AD,CE\=BD,CE\=AF,CE\=BF,

%% CF
((Isatom=yes,Length>23,sub_atom(Sample, 23,1,_,CFE),(num(CFE),CF=CFE);(num(CF)));(Isatom=no;Length<24)),
%% same row:
CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,
%% same column:
CF\=AF,CF\=BF,
%% same-box:
CF\=AD,CF\=BD,CF\=AE,CF\=BE,

%% CG
((Isatom=yes,Length>24,sub_atom(Sample, 24,1,_,CGE),(num(CGE),CG=CGE);(num(CG)));(Isatom=no;Length<25)),
%% same row:
CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,
%% same column:
CG\=AG,CG\=BG,
%% dl-tr diagonal:
CG\=BH,CG\=AI,
%% same-box:
CG\=AH,CG\=BI,

%% CH
((Isatom=yes,Length>25,sub_atom(Sample, 25,1,_,CHE),(num(CHE),CH=CHE);(num(CH)));(Isatom=no;Length<26)),
%% same row:
CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,
%% same column:
CH\=AH,CH\=BH,
%% same-box:
CH\=AG,CH\=BG,CH\=AI,CH\=BI,

%% CI
((Isatom=yes,Length>26,sub_atom(Sample, 26,1,_,CIE),(num(CIE),CI=CIE);(num(CI)));(Isatom=no;Length<27)),
%% same row:
CI\=CA,CI\=CB,CI\=CC,CI\=CD,CI\=CE,CI\=CF,CI\=CG,CI\=CH,
%% same column:
CI\=AI,CI\=BI,
%% same-box:
CI\=AG,CI\=BG,CI\=AH,CI\=BH,


%% DA
((Isatom=yes,Length>27,sub_atom(Sample, 27,1,_,DAE),(num(DAE),DA=DAE);(num(DA)));(Isatom=no;Length<28)),
%% same row:
%% same column:
DA\=AA,DA\=BA,DA\=CA,
%% same-box:


%% DB
((Isatom=yes,Length>28,sub_atom(Sample, 28,1,_,DBE),(num(DBE),DB=DBE);(num(DB)));(Isatom=no;Length<29)),
%% same row:
DB\=DA,
%% same column:
DB\=AB,DB\=BB,DB\=CB,
%% same-box:


%% DC
((Isatom=yes,Length>29,sub_atom(Sample, 29,1,_,DCE),(num(DCE),DC=DCE);(num(DC)));(Isatom=no;Length<30)),
%% same row:
DC\=DA,DC\=DB,
%% same column:
DC\=AC,DC\=BC,DC\=CC,
%% same-box:


%% DD
((Isatom=yes,Length>30,sub_atom(Sample, 30,1,_,DDE),(num(DDE),DD=DDE);(num(DD)));(Isatom=no;Length<31)),
%% same row:
DD\=DA,DD\=DB,DD\=DC,
%% same column:
DD\=AD,DD\=BD,DD\=CD,
%% tl-dr diagonal:
DD\=AA,DD\=BB,DD\=CC,
%% same-box:


%% DE
((Isatom=yes,Length>31,sub_atom(Sample, 31,1,_,DEE),(num(DEE),DE=DEE);(num(DE)));(Isatom=no;Length<32)),
%% same row:
DE\=DA,DE\=DB,DE\=DC,DE\=DD,
%% same column:
DE\=AE,DE\=BE,DE\=CE,
%% same-box:


%% DF
((Isatom=yes,Length>32,sub_atom(Sample, 32,1,_,DFE),(num(DFE),DF=DFE);(num(DF)));(Isatom=no;Length<33)),
%% same row:
DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,
%% same column:
DF\=AF,DF\=BF,DF\=CF,
%% dl-tr diagonal:
DF\=CG,DF\=BH,DF\=AI,
%% same-box:


%% DG
((Isatom=yes,Length>33,sub_atom(Sample, 33,1,_,DGE),(num(DGE),DG=DGE);(num(DG)));(Isatom=no;Length<34)),
%% same row:
DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,
%% same column:
DG\=AG,DG\=BG,DG\=CG,
%% same-box:


%% DH
((Isatom=yes,Length>34,sub_atom(Sample, 34,1,_,DHE),(num(DHE),DH=DHE);(num(DH)));(Isatom=no;Length<35)),
%% same row:
DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,
%% same column:
DH\=AH,DH\=BH,DH\=CH,
%% same-box:


%% DI
((Isatom=yes,Length>35,sub_atom(Sample, 35,1,_,DIE),(num(DIE),DI=DIE);(num(DI)));(Isatom=no;Length<36)),
%% same row:
DI\=DA,DI\=DB,DI\=DC,DI\=DD,DI\=DE,DI\=DF,DI\=DG,DI\=DH,
%% same column:
DI\=AI,DI\=BI,DI\=CI,
%% same-box:



%% EA
((Isatom=yes,Length>36,sub_atom(Sample, 36,1,_,EAE),(num(EAE),EA=EAE);(num(EA)));(Isatom=no;Length<37)),
%% same row:
%% same column:
EA\=AA,EA\=BA,EA\=CA,EA\=DA,
%% same-box:
EA\=DB,EA\=DC,

%% EB
((Isatom=yes,Length>37,sub_atom(Sample, 37,1,_,EBE),(num(EBE),EB=EBE);(num(EB)));(Isatom=no;Length<38)),
%% same row:
EB\=EA,
%% same column:
EB\=AB,EB\=BB,EB\=CB,EB\=DB,
%% same-box:
EB\=DA,EB\=DC,

%% EC
((Isatom=yes,Length>38,sub_atom(Sample, 38,1,_,ECE),(num(ECE),EC=ECE);(num(EC)));(Isatom=no;Length<39)),
%% same row:
EC\=EA,EC\=EB,
%% same column:
EC\=AC,EC\=BC,EC\=CC,EC\=DC,
%% same-box:
EC\=DA,EC\=DB,

%% ED
((Isatom=yes,Length>39,sub_atom(Sample, 39,1,_,EDE),(num(EDE),ED=EDE);(num(ED)));(Isatom=no;Length<40)),
%% same row:
ED\=EA,ED\=EB,ED\=EC,
%% same column:
ED\=AD,ED\=BD,ED\=CD,ED\=DD,
%% same-box:
ED\=DE,ED\=DF,

%% EE
((Isatom=yes,Length>40,sub_atom(Sample, 40,1,_,EEE),(num(EEE),EE=EEE);(num(EE)));(Isatom=no;Length<41)),
%% same row:
EE\=EA,EE\=EB,EE\=EC,EE\=ED,
%% same column:
EE\=AE,EE\=BE,EE\=CE,EE\=DE,
%% tl-dr diagonal:
EE\=AA,EE\=BB,EE\=CC,EE\=DD,
%% dl-tr diagonal:
EE\=DF,EE\=CG,EE\=BH,EE\=AI,
%% same-box:


%% EF
((Isatom=yes,Length>41,sub_atom(Sample, 41,1,_,EFE),(num(EFE),EF=EFE);(num(EF)));(Isatom=no;Length<42)),
%% same row:
EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,
%% same column:
EF\=AF,EF\=BF,EF\=CF,EF\=DF,
%% same-box:
EF\=DD,EF\=DE,

%% EG
((Isatom=yes,Length>42,sub_atom(Sample, 42,1,_,EGE),(num(EGE),EG=EGE);(num(EG)));(Isatom=no;Length<43)),
%% same row:
EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,
%% same column:
EG\=AG,EG\=BG,EG\=CG,EG\=DG,
%% same-box:
EG\=DH,EG\=DI,

%% EH
((Isatom=yes,Length>43,sub_atom(Sample, 43,1,_,EHE),(num(EHE),EH=EHE);(num(EH)));(Isatom=no;Length<44)),
%% same row:
EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,
%% same column:
EH\=AH,EH\=BH,EH\=CH,EH\=DH,
%% same-box:
EH\=DG,EH\=DI,

%% EI
((Isatom=yes,Length>44,sub_atom(Sample, 44,1,_,EIE),(num(EIE),EI=EIE);(num(EI)));(Isatom=no;Length<45)),
%% same row:
EI\=EA,EI\=EB,EI\=EC,EI\=ED,EI\=EE,EI\=EF,EI\=EG,EI\=EH,
%% same column:
EI\=AI,EI\=BI,EI\=CI,EI\=DI,
%% same-box:
EI\=DG,EI\=DH,


%% FA
((Isatom=yes,Length>45,sub_atom(Sample, 45,1,_,FAE),(num(FAE),FA=FAE);(num(FA)));(Isatom=no;Length<46)),
%% same row:
%% same column:
FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,
%% same-box:
FA\=DB,FA\=EB,FA\=DC,FA\=EC,

%% FB
((Isatom=yes,Length>46,sub_atom(Sample, 46,1,_,FBE),(num(FBE),FB=FBE);(num(FB)));(Isatom=no;Length<47)),
%% same row:
FB\=FA,
%% same column:
FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,
%% same-box:
FB\=DA,FB\=EA,FB\=DC,FB\=EC,

%% FC
((Isatom=yes,Length>47,sub_atom(Sample, 47,1,_,FCE),(num(FCE),FC=FCE);(num(FC)));(Isatom=no;Length<48)),
%% same row:
FC\=FA,FC\=FB,
%% same column:
FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,
%% same-box:
FC\=DA,FC\=EA,FC\=DB,FC\=EB,

%% FD
((Isatom=yes,Length>48,sub_atom(Sample, 48,1,_,FDE),(num(FDE),FD=FDE);(num(FD)));(Isatom=no;Length<49)),
%% same row:
FD\=FA,FD\=FB,FD\=FC,
%% same column:
FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,
%% dl-tr diagonal:
FD\=EE,FD\=DF,FD\=CG,FD\=BH,FD\=AI,
%% same-box:
FD\=DE,FD\=EF,

%% FE
((Isatom=yes,Length>49,sub_atom(Sample, 49,1,_,FEE),(num(FEE),FE=FEE);(num(FE)));(Isatom=no;Length<50)),
%% same row:
FE\=FA,FE\=FB,FE\=FC,FE\=FD,
%% same column:
FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,
%% same-box:
FE\=DD,FE\=ED,FE\=DF,FE\=EF,

%% FF
((Isatom=yes,Length>50,sub_atom(Sample, 50,1,_,FFE),(num(FFE),FF=FFE);(num(FF)));(Isatom=no;Length<51)),
%% same row:
FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,
%% same column:
FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,
%% tl-dr diagonal:
FF\=AA,FF\=BB,FF\=CC,FF\=DD,FF\=EE,
%% same-box:
FF\=ED,FF\=DE,

%% FG
((Isatom=yes,Length>51,sub_atom(Sample, 51,1,_,FGE),(num(FGE),FG=FGE);(num(FG)));(Isatom=no;Length<52)),
%% same row:
FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,
%% same column:
FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,
%% same-box:
FG\=DH,FG\=EH,FG\=DI,FG\=EI,

%% FH
((Isatom=yes,Length>52,sub_atom(Sample, 52,1,_,FHE),(num(FHE),FH=FHE);(num(FH)));(Isatom=no;Length<53)),
%% same row:
FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,
%% same column:
FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,
%% same-box:
FH\=DG,FH\=EG,FH\=DI,FH\=EI,

%% FI
((Isatom=yes,Length>53,sub_atom(Sample, 53,1,_,FIE),(num(FIE),FI=FIE);(num(FI)));(Isatom=no;Length<54)),
%% same row:
FI\=FA,FI\=FB,FI\=FC,FI\=FD,FI\=FE,FI\=FF,FI\=FG,FI\=FH,
%% same column:
FI\=AI,FI\=BI,FI\=CI,FI\=DI,FI\=EI,
%% same-box:
FI\=DG,FI\=EG,FI\=DH,FI\=EH,


%% GA
((Isatom=yes,Length>54,sub_atom(Sample, 54,1,_,GAE),(num(GAE),GA=GAE);(num(GA)));(Isatom=no;Length<55)),
%% same row:
%% same column:
GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,
%% same-box:


%% GB
((Isatom=yes,Length>55,sub_atom(Sample, 55,1,_,GBE),(num(GBE),GB=GBE);(num(GB)));(Isatom=no;Length<56)),
%% same row:
GB\=GA,
%% same column:
GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,
%% same-box:


%% GC
((Isatom=yes,Length>56,sub_atom(Sample, 56,1,_,GCE),(num(GCE),GC=GCE);(num(GC)));(Isatom=no;Length<57)),
%% same row:
GC\=GA,GC\=GB,
%% same column:
GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,
%% dl-tr diagonal:
GC\=FD,GC\=EE,GC\=DF,GC\=CG,GC\=BH,GC\=AI,
%% same-box:


%% GD
((Isatom=yes,Length>57,sub_atom(Sample, 57,1,_,GDE),(num(GDE),GD=GDE);(num(GD)));(Isatom=no;Length<58)),
%% same row:
GD\=GA,GD\=GB,GD\=GC,
%% same column:
GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,
%% same-box:


%% GE
((Isatom=yes,Length>58,sub_atom(Sample, 58,1,_,GEE),(num(GEE),GE=GEE);(num(GE)));(Isatom=no;Length<59)),
%% same row:
GE\=GA,GE\=GB,GE\=GC,GE\=GD,
%% same column:
GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,
%% same-box:


%% GF
((Isatom=yes,Length>59,sub_atom(Sample, 59,1,_,GFE),(num(GFE),GF=GFE);(num(GF)));(Isatom=no;Length<60)),
%% same row:
GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,
%% same column:
GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,
%% same-box:


%% GG
((Isatom=yes,Length>60,sub_atom(Sample, 60,1,_,GGE),(num(GGE),GG=GGE);(num(GG)));(Isatom=no;Length<61)),
%% same row:
GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,
%% same column:
GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,
%% tl-dr diagonal:
GG\=AA,GG\=BB,GG\=CC,GG\=DD,GG\=EE,GG\=FF,
%% same-box:


%% GH
((Isatom=yes,Length>61,sub_atom(Sample, 61,1,_,GHE),(num(GHE),GH=GHE);(num(GH)));(Isatom=no;Length<62)),
%% same row:
GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,
%% same column:
GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,
%% same-box:


%% GI
((Isatom=yes,Length>62,sub_atom(Sample, 62,1,_,GIE),(num(GIE),GI=GIE);(num(GI)));(Isatom=no;Length<63)),
%% same row:
GI\=GA,GI\=GB,GI\=GC,GI\=GD,GI\=GE,GI\=GF,GI\=GG,GI\=GH,
%% same column:
GI\=AI,GI\=BI,GI\=CI,GI\=DI,GI\=EI,GI\=FI,
%% same-box:



%% HA
((Isatom=yes,Length>63,sub_atom(Sample, 63,1,_,HAE),(num(HAE),HA=HAE);(num(HA)));(Isatom=no;Length<64)),
%% same row:
%% same column:
HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,
%% same-box:
HA\=GB,HA\=GC,

%% HB
((Isatom=yes,Length>64,sub_atom(Sample, 64,1,_,HBE),(num(HBE),HB=HBE);(num(HB)));(Isatom=no;Length<65)),
%% same row:
HB\=HA,
%% same column:
HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,
%% dl-tr diagonal:
HB\=GC,HB\=FD,HB\=EE,HB\=DF,HB\=CG,HB\=BH,HB\=AI,
%% same-box:
HB\=GA,

%% HC
((Isatom=yes,Length>65,sub_atom(Sample, 65,1,_,HCE),(num(HCE),HC=HCE);(num(HC)));(Isatom=no;Length<66)),
%% same row:
HC\=HA,HC\=HB,
%% same column:
HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,
%% same-box:
HC\=GA,HC\=GB,

%% HD
((Isatom=yes,Length>66,sub_atom(Sample, 66,1,_,HDE),(num(HDE),HD=HDE);(num(HD)));(Isatom=no;Length<67)),
%% same row:
HD\=HA,HD\=HB,HD\=HC,
%% same column:
HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,
%% same-box:
HD\=GE,HD\=GF,

%% HE
((Isatom=yes,Length>67,sub_atom(Sample, 67,1,_,HEE),(num(HEE),HE=HEE);(num(HE)));(Isatom=no;Length<68)),
%% same row:
HE\=HA,HE\=HB,HE\=HC,HE\=HD,
%% same column:
HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,
%% same-box:
HE\=GD,HE\=GF,

%% HF
((Isatom=yes,Length>68,sub_atom(Sample, 68,1,_,HFE),(num(HFE),HF=HFE);(num(HF)));(Isatom=no;Length<69)),
%% same row:
HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,
%% same column:
HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,
%% same-box:
HF\=GD,HF\=GE,

%% HG
((Isatom=yes,Length>69,sub_atom(Sample, 69,1,_,HGE),(num(HGE),HG=HGE);(num(HG)));(Isatom=no;Length<70)),
%% same row:
HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,
%% same column:
HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,
%% same-box:
HG\=GH,HG\=GI,

%% HH
((Isatom=yes,Length>70,sub_atom(Sample, 70,1,_,HHE),(num(HHE),HH=HHE);(num(HH)));(Isatom=no;Length<71)),
%% same row:
HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,
%% same column:
HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,
%% tl-dr diagonal:
HH\=AA,HH\=BB,HH\=CC,HH\=DD,HH\=EE,HH\=FF,HH\=GG,
%% same-box:
HH\=GI,

%% HI
((Isatom=yes,Length>71,sub_atom(Sample, 71,1,_,HIE),(num(HIE),HI=HIE);(num(HI)));(Isatom=no;Length<72)),
%% same row:
HI\=HA,HI\=HB,HI\=HC,HI\=HD,HI\=HE,HI\=HF,HI\=HG,HI\=HH,
%% same column:
HI\=AI,HI\=BI,HI\=CI,HI\=DI,HI\=EI,HI\=FI,HI\=GI,
%% same-box:
HI\=GG,HI\=GH,


%% IA
((Isatom=yes,Length>72,sub_atom(Sample, 72,1,_,IAE),(num(IAE),IA=IAE);(num(IA)));(Isatom=no;Length<73)),
%% same row:
%% same column:
IA\=AA,IA\=BA,IA\=CA,IA\=DA,IA\=EA,IA\=FA,IA\=GA,IA\=HA,
%% dl-tr diagonal:
IA\=HB,IA\=GC,IA\=FD,IA\=EE,IA\=DF,IA\=CG,IA\=BH,IA\=AI,
%% same-box:
IA\=GB,IA\=HC,

%% IB
((Isatom=yes,Length>73,sub_atom(Sample, 73,1,_,IBE),(num(IBE),IB=IBE);(num(IB)));(Isatom=no;Length<74)),
%% same row:
IB\=IA,
%% same column:
IB\=AB,IB\=BB,IB\=CB,IB\=DB,IB\=EB,IB\=FB,IB\=GB,IB\=HB,
%% same-box:
IB\=GA,IB\=HA,IB\=GC,IB\=HC,

%% IC
((Isatom=yes,Length>74,sub_atom(Sample, 74,1,_,ICE),(num(ICE),IC=ICE);(num(IC)));(Isatom=no;Length<75)),
%% same row:
IC\=IA,IC\=IB,
%% same column:
IC\=AC,IC\=BC,IC\=CC,IC\=DC,IC\=EC,IC\=FC,IC\=GC,IC\=HC,
%% same-box:
IC\=GA,IC\=HA,IC\=GB,IC\=HB,

%% ID
((Isatom=yes,Length>75,sub_atom(Sample, 75,1,_,IDE),(num(IDE),ID=IDE);(num(ID)));(Isatom=no;Length<76)),
%% same row:
ID\=IA,ID\=IB,ID\=IC,
%% same column:
ID\=AD,ID\=BD,ID\=CD,ID\=DD,ID\=ED,ID\=FD,ID\=GD,ID\=HD,
%% same-box:
ID\=GE,ID\=HE,ID\=GF,ID\=HF,

%% IE
((Isatom=yes,Length>76,sub_atom(Sample, 76,1,_,IEE),(num(IEE),IE=IEE);(num(IE)));(Isatom=no;Length<77)),
%% same row:
IE\=IA,IE\=IB,IE\=IC,IE\=ID,
%% same column:
IE\=AE,IE\=BE,IE\=CE,IE\=DE,IE\=EE,IE\=FE,IE\=GE,IE\=HE,
%% same-box:
IE\=GD,IE\=HD,IE\=GF,IE\=HF,

%% IF
((Isatom=yes,Length>77,sub_atom(Sample, 77,1,_,IFE),(num(IFE),IF=IFE);(num(IF)));(Isatom=no;Length<78)),
%% same row:
IF\=IA,IF\=IB,IF\=IC,IF\=ID,IF\=IE,
%% same column:
IF\=AF,IF\=BF,IF\=CF,IF\=DF,IF\=EF,IF\=FF,IF\=GF,IF\=HF,
%% same-box:
IF\=GD,IF\=HD,IF\=GE,IF\=HE,

%% IG
((Isatom=yes,Length>78,sub_atom(Sample, 78,1,_,IGE),(num(IGE),IG=IGE);(num(IG)));(Isatom=no;Length<79)),
%% same row:
IG\=IA,IG\=IB,IG\=IC,IG\=ID,IG\=IE,IG\=IF,
%% same column:
IG\=AG,IG\=BG,IG\=CG,IG\=DG,IG\=EG,IG\=FG,IG\=GG,IG\=HG,
%% same-box:
IG\=GH,IG\=HH,IG\=GI,IG\=HI,

%% IH
((Isatom=yes,Length>79,sub_atom(Sample, 79,1,_,IHE),(num(IHE),IH=IHE);(num(IH)));(Isatom=no;Length<80)),
%% same row:
IH\=IA,IH\=IB,IH\=IC,IH\=ID,IH\=IE,IH\=IF,IH\=IG,
%% same column:
IH\=AH,IH\=BH,IH\=CH,IH\=DH,IH\=EH,IH\=FH,IH\=GH,IH\=HH,
%% same-box:
IH\=GG,IH\=HG,IH\=GI,IH\=HI,

%% II
((Isatom=yes,Length>80,sub_atom(Sample, 80,1,_,IIE),(num(IIE),II=IIE);(num(II)));(Isatom=no;Length<81)),
%% same row:
II\=IA,II\=IB,II\=IC,II\=ID,II\=IE,II\=IF,II\=IG,II\=IH,
%% same column:
II\=AI,II\=BI,II\=CI,II\=DI,II\=EI,II\=FI,II\=GI,II\=HI,
%% tl-dr diagonal:
II\=AA,II\=BB,II\=CC,II\=DD,II\=EE,II\=FF,II\=GG,II\=HH,
%% same-box:
II\=HG,II\=GH,

write("true").

