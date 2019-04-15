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
main([_|H]):-
    write("Input:<"),
    write(H),
    write(">Answer:<"),
    (H=[Arg|_],solver(Arg);write("false")),
    write(">").

solver(Sample) :-
    (
        not(atom(Sample))
        -> Length=0
        ; atom_length(Sample,Length)
    ),
    %
    (Length>0
        ->(
            sub_atom(Sample, 0,1,_,AAE),
            not(empty(AAE))
            -> AA=AAE
            ; num(AA)
        )
        ;num(AA)
    ),
    
    ((Isatom=yes,Length>1,sub_atom(Sample, 1,1,_,ABE),((num(ABE),AB=ABE);(empty(ABE),num(AB))));(Isatom=no;Length<2)),
    AB\=AA,
    ((Isatom=yes,Length>2,sub_atom(Sample, 2,1,_,ACE),((num(ACE),AC=ACE);(empty(ACE),num(AC))));(Isatom=no;Length<3)),
    AC\=AA,AC\=AB,
    ((Isatom=yes,Length>3,sub_atom(Sample, 3,1,_,ADE),((num(ADE),AD=ADE);(empty(ADE),num(AD))));(Isatom=no;Length<4)),
    AD\=AA,AD\=AB,AD\=AC,
    ((Isatom=yes,Length>4,sub_atom(Sample, 4,1,_,AEE),((num(AEE),AE=AEE);(empty(AEE),num(AE))));(Isatom=no;Length<5)),
    AE\=AA,AE\=AB,AE\=AC,AE\=AD,
    ((Isatom=yes,Length>5,sub_atom(Sample, 5,1,_,AFE),((num(AFE),AF=AFE);(empty(AFE),num(AF))));(Isatom=no;Length<6)),
    AF\=AA,AF\=AB,AF\=AC,AF\=AD,AF\=AE,
    ((Isatom=yes,Length>6,sub_atom(Sample, 6,1,_,AGE),((num(AGE),AG=AGE);(empty(AGE),num(AG))));(Isatom=no;Length<7)),
    AG\=AA,AG\=AB,AG\=AC,AG\=AD,AG\=AE,AG\=AF,
    ((Isatom=yes,Length>7,sub_atom(Sample, 7,1,_,AHE),((num(AHE),AH=AHE);(empty(AHE),num(AH))));(Isatom=no;Length<8)),
    AH\=AA,AH\=AB,AH\=AC,AH\=AD,AH\=AE,AH\=AF,AH\=AG,
    ((Isatom=yes,Length>8,sub_atom(Sample, 8,1,_,AIE),((num(AIE),AI=AIE);(empty(AIE),num(AI))));(Isatom=no;Length<9)),
    AI\=AA,AI\=AB,AI\=AC,AI\=AD,AI\=AE,AI\=AF,AI\=AG,AI\=AH,
    
    ((Isatom=yes,Length>9,sub_atom(Sample, 9,1,_,BAE),((num(BAE),BA=BAE);(empty(BAE),num(BA))));(Isatom=no;Length<10)),
    BA\=AA,BA\=AB,BA\=AC,
    ((Isatom=yes,Length>10,sub_atom(Sample, 10,1,_,BBE),((num(BBE),BB=BBE);(empty(BBE),num(BB))));(Isatom=no;Length<11)),
    BB\=BA,BB\=AB,BB\=AA,BB\=AC,
    ((Isatom=yes,Length>11,sub_atom(Sample, 11,1,_,BCE),((num(BCE),BC=BCE);(empty(BCE),num(BC))));(Isatom=no;Length<12)),
    BC\=BA,BC\=BB,BC\=AC,BC\=AA,BC\=AB,
    ((Isatom=yes,Length>12,sub_atom(Sample, 12,1,_,BDE),((num(BDE),BD=BDE);(empty(BDE),num(BD))));(Isatom=no;Length<13)),
    BD\=BA,BD\=BB,BD\=BC,BD\=AD,BD\=AE,BD\=AF,
    ((Isatom=yes,Length>13,sub_atom(Sample, 13,1,_,BEE),((num(BEE),BE=BEE);(empty(BEE),num(BE))));(Isatom=no;Length<14)),
    BE\=BA,BE\=BB,BE\=BC,BE\=BD,BE\=AE,BE\=AD,BE\=AF,
    ((Isatom=yes,Length>14,sub_atom(Sample, 14,1,_,BFE),((num(BFE),BF=BFE);(empty(BFE),num(BF))));(Isatom=no;Length<15)),
    BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,BF\=AF,BF\=AD,BF\=AE,
    ((Isatom=yes,Length>15,sub_atom(Sample, 15,1,_,BGE),((num(BGE),BG=BGE);(empty(BGE),num(BG))));(Isatom=no;Length<16)),
    BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,BG\=AG,BG\=AH,BG\=AI,
    ((Isatom=yes,Length>16,sub_atom(Sample, 16,1,_,BHE),((num(BHE),BH=BHE);(empty(BHE),num(BH))));(Isatom=no;Length<17)),
    BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,BH\=AH,BH\=AI,BH\=AG,
    ((Isatom=yes,Length>17,sub_atom(Sample, 17,1,_,BIE),((num(BIE),BI=BIE);(empty(BIE),num(BI))));(Isatom=no;Length<18)),
    BI\=BA,BI\=BB,BI\=BC,BI\=BD,BI\=BE,BI\=BF,BI\=BG,BI\=BH,BI\=AI,BI\=AG,BI\=AH,
    
    ((Isatom=yes,Length>18,sub_atom(Sample, 18,1,_,CAE),((num(CAE),CA=CAE);(empty(CAE),num(CA))));(Isatom=no;Length<19)),
    CA\=AA,CA\=BA,CA\=AB,CA\=BB,CA\=AC,CA\=BC,
    ((Isatom=yes,Length>19,sub_atom(Sample, 19,1,_,CBE),((num(CBE),CB=CBE);(empty(CBE),num(CB))));(Isatom=no;Length<20)),
    CB\=CA,CB\=AB,CB\=BB,CB\=AA,CB\=BA,CB\=AC,CB\=BC,
    ((Isatom=yes,Length>20,sub_atom(Sample, 20,1,_,CCE),((num(CCE),CC=CCE);(empty(CCE),num(CC))));(Isatom=no;Length<21)),
    CC\=CA,CC\=CB,CC\=AC,CC\=BC,CC\=AA,CC\=BB,CC\=BA,CC\=AB,
    ((Isatom=yes,Length>21,sub_atom(Sample, 21,1,_,CDE),((num(CDE),CD=CDE);(empty(CDE),num(CD))));(Isatom=no;Length<22)),
    CD\=CA,CD\=CB,CD\=CC,CD\=AD,CD\=BD,CD\=AE,CD\=BE,CD\=AF,CD\=BF,
    ((Isatom=yes,Length>22,sub_atom(Sample, 22,1,_,CEE),((num(CEE),CE=CEE);(empty(CEE),num(CE))));(Isatom=no;Length<23)),
    CE\=CA,CE\=CB,CE\=CC,CE\=CD,CE\=AE,CE\=BE,CE\=AD,CE\=BD,CE\=AF,CE\=BF,
    ((Isatom=yes,Length>23,sub_atom(Sample, 23,1,_,CFE),((num(CFE),CF=CFE);(empty(CFE),num(CF))));(Isatom=no;Length<24)),
    CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,CF\=AF,CF\=BF,CF\=AD,CF\=BD,CF\=AE,CF\=BE,
    ((Isatom=yes,Length>24,sub_atom(Sample, 24,1,_,CGE),((num(CGE),CG=CGE);(empty(CGE),num(CG))));(Isatom=no;Length<25)),
    CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,CG\=AG,CG\=BG,CG\=BH,CG\=AI,CG\=AH,CG\=BI,
    ((Isatom=yes,Length>25,sub_atom(Sample, 25,1,_,CHE),((num(CHE),CH=CHE);(empty(CHE),num(CH))));(Isatom=no;Length<26)),
    CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,CH\=AH,CH\=BH,CH\=AG,CH\=BG,CH\=AI,CH\=BI,
    ((Isatom=yes,Length>26,sub_atom(Sample, 26,1,_,CIE),((num(CIE),CI=CIE);(empty(CIE),num(CI))));(Isatom=no;Length<27)),
    CI\=CA,CI\=CB,CI\=CC,CI\=CD,CI\=CE,CI\=CF,CI\=CG,CI\=CH,CI\=AI,CI\=BI,CI\=AG,CI\=BG,CI\=AH,CI\=BH,
    
    ((Isatom=yes,Length>27,sub_atom(Sample, 27,1,_,DAE),((num(DAE),DA=DAE);(empty(DAE),num(DA))));(Isatom=no;Length<28)),
    DA\=AA,DA\=BA,DA\=CA,
    ((Isatom=yes,Length>28,sub_atom(Sample, 28,1,_,DBE),((num(DBE),DB=DBE);(empty(DBE),num(DB))));(Isatom=no;Length<29)),
    DB\=DA,DB\=AB,DB\=BB,DB\=CB,
    ((Isatom=yes,Length>29,sub_atom(Sample, 29,1,_,DCE),((num(DCE),DC=DCE);(empty(DCE),num(DC))));(Isatom=no;Length<30)),
    DC\=DA,DC\=DB,DC\=AC,DC\=BC,DC\=CC,
    ((Isatom=yes,Length>30,sub_atom(Sample, 30,1,_,DDE),((num(DDE),DD=DDE);(empty(DDE),num(DD))));(Isatom=no;Length<31)),
    DD\=DA,DD\=DB,DD\=DC,DD\=AD,DD\=BD,DD\=CD,DD\=AA,DD\=BB,DD\=CC,
    ((Isatom=yes,Length>31,sub_atom(Sample, 31,1,_,DEE),((num(DEE),DE=DEE);(empty(DEE),num(DE))));(Isatom=no;Length<32)),
    DE\=DA,DE\=DB,DE\=DC,DE\=DD,DE\=AE,DE\=BE,DE\=CE,
    ((Isatom=yes,Length>32,sub_atom(Sample, 32,1,_,DFE),((num(DFE),DF=DFE);(empty(DFE),num(DF))));(Isatom=no;Length<33)),
    DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,DF\=AF,DF\=BF,DF\=CF,DF\=CG,DF\=BH,DF\=AI,
    ((Isatom=yes,Length>33,sub_atom(Sample, 33,1,_,DGE),((num(DGE),DG=DGE);(empty(DGE),num(DG))));(Isatom=no;Length<34)),
    DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,DG\=AG,DG\=BG,DG\=CG,
    ((Isatom=yes,Length>34,sub_atom(Sample, 34,1,_,DHE),((num(DHE),DH=DHE);(empty(DHE),num(DH))));(Isatom=no;Length<35)),
    DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,DH\=AH,DH\=BH,DH\=CH,
    ((Isatom=yes,Length>35,sub_atom(Sample, 35,1,_,DIE),((num(DIE),DI=DIE);(empty(DIE),num(DI))));(Isatom=no;Length<36)),
    DI\=DA,DI\=DB,DI\=DC,DI\=DD,DI\=DE,DI\=DF,DI\=DG,DI\=DH,DI\=AI,DI\=BI,DI\=CI,
    
    ((Isatom=yes,Length>36,sub_atom(Sample, 36,1,_,EAE),((num(EAE),EA=EAE);(empty(EAE),num(EA))));(Isatom=no;Length<37)),
    EA\=AA,EA\=BA,EA\=CA,EA\=DA,EA\=DB,EA\=DC,
    ((Isatom=yes,Length>37,sub_atom(Sample, 37,1,_,EBE),((num(EBE),EB=EBE);(empty(EBE),num(EB))));(Isatom=no;Length<38)),
    EB\=EA,EB\=AB,EB\=BB,EB\=CB,EB\=DB,EB\=DA,EB\=DC,
    ((Isatom=yes,Length>38,sub_atom(Sample, 38,1,_,ECE),((num(ECE),EC=ECE);(empty(ECE),num(EC))));(Isatom=no;Length<39)),
    EC\=EA,EC\=EB,EC\=AC,EC\=BC,EC\=CC,EC\=DC,EC\=DA,EC\=DB,
    ((Isatom=yes,Length>39,sub_atom(Sample, 39,1,_,EDE),((num(EDE),ED=EDE);(empty(EDE),num(ED))));(Isatom=no;Length<40)),
    ED\=EA,ED\=EB,ED\=EC,ED\=AD,ED\=BD,ED\=CD,ED\=DD,ED\=DE,ED\=DF,
    ((Isatom=yes,Length>40,sub_atom(Sample, 40,1,_,EEE),((num(EEE),EE=EEE);(empty(EEE),num(EE))));(Isatom=no;Length<41)),
    EE\=EA,EE\=EB,EE\=EC,EE\=ED,EE\=AE,EE\=BE,EE\=CE,EE\=DE,EE\=AA,EE\=BB,EE\=CC,EE\=DD,EE\=DF,EE\=CG,EE\=BH,EE\=AI,
    ((Isatom=yes,Length>41,sub_atom(Sample, 41,1,_,EFE),((num(EFE),EF=EFE);(empty(EFE),num(EF))));(Isatom=no;Length<42)),
    EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,EF\=AF,EF\=BF,EF\=CF,EF\=DF,EF\=DD,EF\=DE,
    ((Isatom=yes,Length>42,sub_atom(Sample, 42,1,_,EGE),((num(EGE),EG=EGE);(empty(EGE),num(EG))));(Isatom=no;Length<43)),
    EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,EG\=AG,EG\=BG,EG\=CG,EG\=DG,EG\=DH,EG\=DI,
    ((Isatom=yes,Length>43,sub_atom(Sample, 43,1,_,EHE),((num(EHE),EH=EHE);(empty(EHE),num(EH))));(Isatom=no;Length<44)),
    EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,EH\=AH,EH\=BH,EH\=CH,EH\=DH,EH\=DG,EH\=DI,
    ((Isatom=yes,Length>44,sub_atom(Sample, 44,1,_,EIE),((num(EIE),EI=EIE);(empty(EIE),num(EI))));(Isatom=no;Length<45)),
    EI\=EA,EI\=EB,EI\=EC,EI\=ED,EI\=EE,EI\=EF,EI\=EG,EI\=EH,EI\=AI,EI\=BI,EI\=CI,EI\=DI,EI\=DG,EI\=DH,
    
    ((Isatom=yes,Length>45,sub_atom(Sample, 45,1,_,FAE),((num(FAE),FA=FAE);(empty(FAE),num(FA))));(Isatom=no;Length<46)),
    FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,FA\=DB,FA\=EB,FA\=DC,FA\=EC,
    ((Isatom=yes,Length>46,sub_atom(Sample, 46,1,_,FBE),((num(FBE),FB=FBE);(empty(FBE),num(FB))));(Isatom=no;Length<47)),
    FB\=FA,FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,FB\=DA,FB\=EA,FB\=DC,FB\=EC,
    ((Isatom=yes,Length>47,sub_atom(Sample, 47,1,_,FCE),((num(FCE),FC=FCE);(empty(FCE),num(FC))));(Isatom=no;Length<48)),
    FC\=FA,FC\=FB,FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,FC\=DA,FC\=EA,FC\=DB,FC\=EB,
    ((Isatom=yes,Length>48,sub_atom(Sample, 48,1,_,FDE),((num(FDE),FD=FDE);(empty(FDE),num(FD))));(Isatom=no;Length<49)),
    FD\=FA,FD\=FB,FD\=FC,FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,FD\=EE,FD\=DF,FD\=CG,FD\=BH,FD\=AI,FD\=DE,FD\=EF,
    ((Isatom=yes,Length>49,sub_atom(Sample, 49,1,_,FEE),((num(FEE),FE=FEE);(empty(FEE),num(FE))));(Isatom=no;Length<50)),
    FE\=FA,FE\=FB,FE\=FC,FE\=FD,FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,FE\=DD,FE\=ED,FE\=DF,FE\=EF,
    ((Isatom=yes,Length>50,sub_atom(Sample, 50,1,_,FFE),((num(FFE),FF=FFE);(empty(FFE),num(FF))));(Isatom=no;Length<51)),
    FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,FF\=AA,FF\=BB,FF\=CC,FF\=DD,FF\=EE,FF\=ED,FF\=DE,
    ((Isatom=yes,Length>51,sub_atom(Sample, 51,1,_,FGE),((num(FGE),FG=FGE);(empty(FGE),num(FG))));(Isatom=no;Length<52)),
    FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,FG\=DH,FG\=EH,FG\=DI,FG\=EI,
    ((Isatom=yes,Length>52,sub_atom(Sample, 52,1,_,FHE),((num(FHE),FH=FHE);(empty(FHE),num(FH))));(Isatom=no;Length<53)),
    FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,FH\=DG,FH\=EG,FH\=DI,FH\=EI,
    ((Isatom=yes,Length>53,sub_atom(Sample, 53,1,_,FIE),((num(FIE),FI=FIE);(empty(FIE),num(FI))));(Isatom=no;Length<54)),
    FI\=FA,FI\=FB,FI\=FC,FI\=FD,FI\=FE,FI\=FF,FI\=FG,FI\=FH,FI\=AI,FI\=BI,FI\=CI,FI\=DI,FI\=EI,FI\=DG,FI\=EG,FI\=DH,FI\=EH,
    
    ((Isatom=yes,Length>54,sub_atom(Sample, 54,1,_,GAE),((num(GAE),GA=GAE);(empty(GAE),num(GA))));(Isatom=no;Length<55)),
    GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,
    ((Isatom=yes,Length>55,sub_atom(Sample, 55,1,_,GBE),((num(GBE),GB=GBE);(empty(GBE),num(GB))));(Isatom=no;Length<56)),
    GB\=GA,GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,
    ((Isatom=yes,Length>56,sub_atom(Sample, 56,1,_,GCE),((num(GCE),GC=GCE);(empty(GCE),num(GC))));(Isatom=no;Length<57)),
    GC\=GA,GC\=GB,GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,GC\=FD,GC\=EE,GC\=DF,GC\=CG,GC\=BH,GC\=AI,
    ((Isatom=yes,Length>57,sub_atom(Sample, 57,1,_,GDE),((num(GDE),GD=GDE);(empty(GDE),num(GD))));(Isatom=no;Length<58)),
    GD\=GA,GD\=GB,GD\=GC,GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,
    ((Isatom=yes,Length>58,sub_atom(Sample, 58,1,_,GEE),((num(GEE),GE=GEE);(empty(GEE),num(GE))));(Isatom=no;Length<59)),
    GE\=GA,GE\=GB,GE\=GC,GE\=GD,GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,
    ((Isatom=yes,Length>59,sub_atom(Sample, 59,1,_,GFE),((num(GFE),GF=GFE);(empty(GFE),num(GF))));(Isatom=no;Length<60)),
    GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,
    ((Isatom=yes,Length>60,sub_atom(Sample, 60,1,_,GGE),((num(GGE),GG=GGE);(empty(GGE),num(GG))));(Isatom=no;Length<61)),
    GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,GG\=AA,GG\=BB,GG\=CC,GG\=DD,GG\=EE,GG\=FF,
    ((Isatom=yes,Length>61,sub_atom(Sample, 61,1,_,GHE),((num(GHE),GH=GHE);(empty(GHE),num(GH))));(Isatom=no;Length<62)),
    GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,
    ((Isatom=yes,Length>62,sub_atom(Sample, 62,1,_,GIE),((num(GIE),GI=GIE);(empty(GIE),num(GI))));(Isatom=no;Length<63)),
    GI\=GA,GI\=GB,GI\=GC,GI\=GD,GI\=GE,GI\=GF,GI\=GG,GI\=GH,GI\=AI,GI\=BI,GI\=CI,GI\=DI,GI\=EI,GI\=FI,
    
    ((Isatom=yes,Length>63,sub_atom(Sample, 63,1,_,HAE),((num(HAE),HA=HAE);(empty(HAE),num(HA))));(Isatom=no;Length<64)),
    HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,HA\=GB,HA\=GC,
    ((Isatom=yes,Length>64,sub_atom(Sample, 64,1,_,HBE),((num(HBE),HB=HBE);(empty(HBE),num(HB))));(Isatom=no;Length<65)),
    HB\=HA,HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,HB\=GC,HB\=FD,HB\=EE,HB\=DF,HB\=CG,HB\=BH,HB\=AI,HB\=GA,
    ((Isatom=yes,Length>65,sub_atom(Sample, 65,1,_,HCE),((num(HCE),HC=HCE);(empty(HCE),num(HC))));(Isatom=no;Length<66)),
    HC\=HA,HC\=HB,HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,HC\=GA,HC\=GB,
    ((Isatom=yes,Length>66,sub_atom(Sample, 66,1,_,HDE),((num(HDE),HD=HDE);(empty(HDE),num(HD))));(Isatom=no;Length<67)),
    HD\=HA,HD\=HB,HD\=HC,HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,HD\=GE,HD\=GF,
    ((Isatom=yes,Length>67,sub_atom(Sample, 67,1,_,HEE),((num(HEE),HE=HEE);(empty(HEE),num(HE))));(Isatom=no;Length<68)),
    HE\=HA,HE\=HB,HE\=HC,HE\=HD,HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,HE\=GD,HE\=GF,
    ((Isatom=yes,Length>68,sub_atom(Sample, 68,1,_,HFE),((num(HFE),HF=HFE);(empty(HFE),num(HF))));(Isatom=no;Length<69)),
    HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,HF\=GD,HF\=GE,
    ((Isatom=yes,Length>69,sub_atom(Sample, 69,1,_,HGE),((num(HGE),HG=HGE);(empty(HGE),num(HG))));(Isatom=no;Length<70)),
    HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,HG\=GH,HG\=GI,
    ((Isatom=yes,Length>70,sub_atom(Sample, 70,1,_,HHE),((num(HHE),HH=HHE);(empty(HHE),num(HH))));(Isatom=no;Length<71)),
    HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,HH\=AA,HH\=BB,HH\=CC,HH\=DD,HH\=EE,HH\=FF,HH\=GG,HH\=GI,
    ((Isatom=yes,Length>71,sub_atom(Sample, 71,1,_,HIE),((num(HIE),HI=HIE);(empty(HIE),num(HI))));(Isatom=no;Length<72)),
    HI\=HA,HI\=HB,HI\=HC,HI\=HD,HI\=HE,HI\=HF,HI\=HG,HI\=HH,HI\=AI,HI\=BI,HI\=CI,HI\=DI,HI\=EI,HI\=FI,HI\=GI,HI\=GG,HI\=GH,
    
    ((Isatom=yes,Length>72,sub_atom(Sample, 72,1,_,IAE),((num(IAE),IA=IAE);(empty(IAE),num(IA))));(Isatom=no;Length<73)),
    IA\=AA,IA\=BA,IA\=CA,IA\=DA,IA\=EA,IA\=FA,IA\=GA,IA\=HA,IA\=HB,IA\=GC,IA\=FD,IA\=EE,IA\=DF,IA\=CG,IA\=BH,IA\=AI,IA\=GB,IA\=HC,
    ((Isatom=yes,Length>73,sub_atom(Sample, 73,1,_,IBE),((num(IBE),IB=IBE);(empty(IBE),num(IB))));(Isatom=no;Length<74)),
    IB\=IA,IB\=AB,IB\=BB,IB\=CB,IB\=DB,IB\=EB,IB\=FB,IB\=GB,IB\=HB,IB\=GA,IB\=HA,IB\=GC,IB\=HC,
    ((Isatom=yes,Length>74,sub_atom(Sample, 74,1,_,ICE),((num(ICE),IC=ICE);(empty(ICE),num(IC))));(Isatom=no;Length<75)),
    IC\=IA,IC\=IB,IC\=AC,IC\=BC,IC\=CC,IC\=DC,IC\=EC,IC\=FC,IC\=GC,IC\=HC,IC\=GA,IC\=HA,IC\=GB,IC\=HB,
    ((Isatom=yes,Length>75,sub_atom(Sample, 75,1,_,IDE),((num(IDE),ID=IDE);(empty(IDE),num(ID))));(Isatom=no;Length<76)),
    ID\=IA,ID\=IB,ID\=IC,ID\=AD,ID\=BD,ID\=CD,ID\=DD,ID\=ED,ID\=FD,ID\=GD,ID\=HD,ID\=GE,ID\=HE,ID\=GF,ID\=HF,
    ((Isatom=yes,Length>76,sub_atom(Sample, 76,1,_,IEE),((num(IEE),IE=IEE);(empty(IEE),num(IE))));(Isatom=no;Length<77)),
    IE\=IA,IE\=IB,IE\=IC,IE\=ID,IE\=AE,IE\=BE,IE\=CE,IE\=DE,IE\=EE,IE\=FE,IE\=GE,IE\=HE,IE\=GD,IE\=HD,IE\=GF,IE\=HF,
    ((Isatom=yes,Length>77,sub_atom(Sample, 77,1,_,IFE),((num(IFE),IF=IFE);(empty(IFE),num(IF))));(Isatom=no;Length<78)),
    IF\=IA,IF\=IB,IF\=IC,IF\=ID,IF\=IE,IF\=AF,IF\=BF,IF\=CF,IF\=DF,IF\=EF,IF\=FF,IF\=GF,IF\=HF,IF\=GD,IF\=HD,IF\=GE,IF\=HE,
    ((Isatom=yes,Length>78,sub_atom(Sample, 78,1,_,IGE),((num(IGE),IG=IGE);(empty(IGE),num(IG))));(Isatom=no;Length<79)),
    IG\=IA,IG\=IB,IG\=IC,IG\=ID,IG\=IE,IG\=IF,IG\=AG,IG\=BG,IG\=CG,IG\=DG,IG\=EG,IG\=FG,IG\=GG,IG\=HG,IG\=GH,IG\=HH,IG\=GI,IG\=HI,
    ((Isatom=yes,Length>79,sub_atom(Sample, 79,1,_,IHE),((num(IHE),IH=IHE);(empty(IHE),num(IH))));(Isatom=no;Length<80)),
    IH\=IA,IH\=IB,IH\=IC,IH\=ID,IH\=IE,IH\=IF,IH\=IG,IH\=AH,IH\=BH,IH\=CH,IH\=DH,IH\=EH,IH\=FH,IH\=GH,IH\=HH,IH\=GG,IH\=HG,IH\=GI,IH\=HI,
    ((Isatom=yes,Length>80,sub_atom(Sample, 80,1,_,IIE),((num(IIE),II=IIE);(empty(IIE),num(II))));(Isatom=no;Length<81)),
    II\=IA,II\=IB,II\=IC,II\=ID,II\=IE,II\=IF,II\=IG,II\=IH,II\=AI,II\=BI,II\=CI,II\=DI,II\=EI,II\=FI,II\=GI,II\=HI,II\=AA,II\=BB,II\=CC,II\=DD,II\=EE,II\=FF,II\=GG,II\=HH,II\=HG,II\=GH,
    
    write("true").