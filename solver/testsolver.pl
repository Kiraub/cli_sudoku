num('a').
num('b').
num('c').
num('d').
num('e').
num('f').
num('g').
num('h').
num('i').

solver(Sample):-
    not(atom(Sample)),
    %% set as number
    num(AA),
    write("First letter: "),
    write(AA),
    write("\n"),
    %% same row:
    %% same column:
    %% tl-dr diagonal:

    %% same-box:

    %% set as number
    num(AB),
    %% same row:
    AB\=AA,
    %% same column:
    %% same-box:

    %% set as number
    num(AC),
    %% same row:
    AC\=AA,AC\=AB,
    %% same column:
    %% same-box:

    %% set as number
    num(AD),
    %% same row:
    AD\=AA,AD\=AB,AD\=AC,
    %% same column:
    %% same-box:

    %% set as number
    num(AE),
    %% same row:
    AE\=AA,AE\=AB,AE\=AC,AE\=AD,
    %% same column:
    %% same-box:

    %% set as number
    num(AF),
    %% same row:
    AF\=AA,AF\=AB,AF\=AC,AF\=AD,AF\=AE,
    %% same column:
    %% same-box:

    %% set as number
    num(AG),
    %% same row:
    AG\=AA,AG\=AB,AG\=AC,AG\=AD,AG\=AE,AG\=AF,
    %% same column:
    %% same-box:

    %% set as number
    num(AH),
    %% same row:
    AH\=AA,AH\=AB,AH\=AC,AH\=AD,AH\=AE,AH\=AF,AH\=AG,
    %% same column:
    %% same-box:

    %% set as number
    num(AI),
    %% same row:
    AI\=AA,AI\=AB,AI\=AC,AI\=AD,AI\=AE,AI\=AF,AI\=AG,AI\=AH,
    %% same column:
    %% dl-tr diagonal:

    %% same-box:


    %% set as number
    num(BA),
    %% same row:
    %% same column:
    BA\=AA,
    %% same-box:
    BA\=AB,BA\=AC,
    %% set as number
    num(BB),
    %% same row:
    BB\=BA,
    %% same column:
    BB\=AB,
    %% tl-dr diagonal:
    BB\=AA,
    %% same-box:
    BB\=AC,
    %% set as number
    num(BC),
    %% same row:
    BC\=BA,BC\=BB,
    %% same column:
    BC\=AC,
    %% same-box:
    BC\=AA,BC\=AB,
    %% set as number
    num(BD),
    %% same row:
    BD\=BA,BD\=BB,BD\=BC,
    %% same column:
    BD\=AD,
    %% same-box:
    BD\=AE,BD\=AF,
    %% set as number
    num(BE),
    %% same row:
    BE\=BA,BE\=BB,BE\=BC,BE\=BD,
    %% same column:
    BE\=AE,
    %% same-box:
    BE\=AD,BE\=AF,
    %% set as number
    num(BF),
    %% same row:
    BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,
    %% same column:
    BF\=AF,
    %% same-box:
    BF\=AD,BF\=AE,
    %% set as number
    num(BG),
    %% same row:
    BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,
    %% same column:
    BG\=AG,
    %% same-box:
    BG\=AH,BG\=AI,
    %% set as number
    num(BH),
    %% same row:
    BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,
    %% same column:
    BH\=AH,
    %% dl-tr diagonal:
    BH\=AI,
    %% same-box:
    BH\=AG,
    %% set as number
    num(BI),
    %% same row:
    BI\=BA,BI\=BB,BI\=BC,BI\=BD,BI\=BE,BI\=BF,BI\=BG,BI\=BH,
    %% same column:
    BI\=AI,
    %% same-box:
    BI\=AG,BI\=AH,

    %% set as number
    num(CA),
    %% same row:
    %% same column:
    CA\=AA,CA\=BA,
    %% same-box:
    CA\=AB,CA\=BB,CA\=AC,CA\=BC,
    %% set as number
    num(CB),
    %% same row:
    CB\=CA,
    %% same column:
    CB\=AB,CB\=BB,
    %% same-box:
    CB\=AA,CB\=BA,CB\=AC,CB\=BC,
    %% set as number
    num(CC),
    %% same row:
    CC\=CA,CC\=CB,
    %% same column:
    CC\=AC,CC\=BC,
    %% tl-dr diagonal:
    CC\=AA,CC\=BB,
    %% same-box:
    CC\=BA,CC\=AB,
    %% set as number
    num(CD),
    %% same row:
    CD\=CA,CD\=CB,CD\=CC,
    %% same column:
    CD\=AD,CD\=BD,
    %% same-box:
    CD\=AE,CD\=BE,CD\=AF,CD\=BF,
    %% set as number
    num(CE),
    %% same row:
    CE\=CA,CE\=CB,CE\=CC,CE\=CD,
    %% same column:
    CE\=AE,CE\=BE,
    %% same-box:
    CE\=AD,CE\=BD,CE\=AF,CE\=BF,
    %% set as number
    num(CF),
    %% same row:
    CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,
    %% same column:
    CF\=AF,CF\=BF,
    %% same-box:
    CF\=AD,CF\=BD,CF\=AE,CF\=BE,
    %% set as number
    num(CG),
    %% same row:
    CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,
    %% same column:
    CG\=AG,CG\=BG,
    %% dl-tr diagonal:
    CG\=BH,CG\=AI,
    %% same-box:
    CG\=AH,CG\=BI,
    %% set as number
    num(CH),
    %% same row:
    CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,
    %% same column:
    CH\=AH,CH\=BH,
    %% same-box:
    CH\=AG,CH\=BG,CH\=AI,CH\=BI,
    %% set as number
    num(CI),
    %% same row:
    CI\=CA,CI\=CB,CI\=CC,CI\=CD,CI\=CE,CI\=CF,CI\=CG,CI\=CH,
    %% same column:
    CI\=AI,CI\=BI,
    %% same-box:
    CI\=AG,CI\=BG,CI\=AH,CI\=BH,

    %% set as number
    num(DA),
    %% same row:
    %% same column:
    DA\=AA,DA\=BA,DA\=CA,
    %% same-box:

    %% set as number
    num(DB),
    %% same row:
    DB\=DA,
    %% same column:
    DB\=AB,DB\=BB,DB\=CB,
    %% same-box:

    %% set as number
    num(DC),
    %% same row:
    DC\=DA,DC\=DB,
    %% same column:
    DC\=AC,DC\=BC,DC\=CC,
    %% same-box:

    %% set as number
    num(DD),
    %% same row:
    DD\=DA,DD\=DB,DD\=DC,
    %% same column:
    DD\=AD,DD\=BD,DD\=CD,
    %% tl-dr diagonal:
    DD\=AA,DD\=BB,DD\=CC,
    %% same-box:

    %% set as number
    num(DE),
    %% same row:
    DE\=DA,DE\=DB,DE\=DC,DE\=DD,
    %% same column:
    DE\=AE,DE\=BE,DE\=CE,
    %% same-box:

    %% set as number
    num(DF),
    %% same row:
    DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,
    %% same column:
    DF\=AF,DF\=BF,DF\=CF,
    %% dl-tr diagonal:
    DF\=CG,DF\=BH,DF\=AI,
    %% same-box:

    %% set as number
    num(DG),
    %% same row:
    DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,
    %% same column:
    DG\=AG,DG\=BG,DG\=CG,
    %% same-box:

    %% set as number
    num(DH),
    %% same row:
    DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,
    %% same column:
    DH\=AH,DH\=BH,DH\=CH,
    %% same-box:

    %% set as number
    num(DI),
    %% same row:
    DI\=DA,DI\=DB,DI\=DC,DI\=DD,DI\=DE,DI\=DF,DI\=DG,DI\=DH,
    %% same column:
    DI\=AI,DI\=BI,DI\=CI,
    %% same-box:


    %% set as number
    num(EA),
    %% same row:
    %% same column:
    EA\=AA,EA\=BA,EA\=CA,EA\=DA,
    %% same-box:
    EA\=DB,EA\=DC,
    %% set as number
    num(EB),
    %% same row:
    EB\=EA,
    %% same column:
    EB\=AB,EB\=BB,EB\=CB,EB\=DB,
    %% same-box:
    EB\=DA,EB\=DC,
    %% set as number
    num(EC),
    %% same row:
    EC\=EA,EC\=EB,
    %% same column:
    EC\=AC,EC\=BC,EC\=CC,EC\=DC,
    %% same-box:
    EC\=DA,EC\=DB,
    %% set as number
    num(ED),
    %% same row:
    ED\=EA,ED\=EB,ED\=EC,
    %% same column:
    ED\=AD,ED\=BD,ED\=CD,ED\=DD,
    %% same-box:
    ED\=DE,ED\=DF,
    %% set as number
    num(EE),
    %% same row:
    EE\=EA,EE\=EB,EE\=EC,EE\=ED,
    %% same column:
    EE\=AE,EE\=BE,EE\=CE,EE\=DE,
    %% tl-dr diagonal:
    EE\=AA,EE\=BB,EE\=CC,EE\=DD,
    %% dl-tr diagonal:
    EE\=DF,EE\=CG,EE\=BH,EE\=AI,
    %% same-box:

    %% set as number
    num(EF),
    %% same row:
    EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,
    %% same column:
    EF\=AF,EF\=BF,EF\=CF,EF\=DF,
    %% same-box:
    EF\=DD,EF\=DE,
    %% set as number
    num(EG),
    %% same row:
    EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,
    %% same column:
    EG\=AG,EG\=BG,EG\=CG,EG\=DG,
    %% same-box:
    EG\=DH,EG\=DI,
    %% set as number
    num(EH),
    %% same row:
    EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,
    %% same column:
    EH\=AH,EH\=BH,EH\=CH,EH\=DH,
    %% same-box:
    EH\=DG,EH\=DI,
    %% set as number
    num(EI),
    %% same row:
    EI\=EA,EI\=EB,EI\=EC,EI\=ED,EI\=EE,EI\=EF,EI\=EG,EI\=EH,
    %% same column:
    EI\=AI,EI\=BI,EI\=CI,EI\=DI,
    %% same-box:
    EI\=DG,EI\=DH,

    %% set as number
    num(FA),
    %% same row:
    %% same column:
    FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,
    %% same-box:
    FA\=DB,FA\=EB,FA\=DC,FA\=EC,
    %% set as number
    num(FB),
    %% same row:
    FB\=FA,
    %% same column:
    FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,
    %% same-box:
    FB\=DA,FB\=EA,FB\=DC,FB\=EC,
    %% set as number
    num(FC),
    %% same row:
    FC\=FA,FC\=FB,
    %% same column:
    FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,
    %% same-box:
    FC\=DA,FC\=EA,FC\=DB,FC\=EB,
    %% set as number
    num(FD),
    %% same row:
    FD\=FA,FD\=FB,FD\=FC,
    %% same column:
    FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,
    %% dl-tr diagonal:
    FD\=EE,FD\=DF,FD\=CG,FD\=BH,FD\=AI,
    %% same-box:
    FD\=DE,FD\=EF,
    %% set as number
    num(FE),
    %% same row:
    FE\=FA,FE\=FB,FE\=FC,FE\=FD,
    %% same column:
    FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,
    %% same-box:
    FE\=DD,FE\=ED,FE\=DF,FE\=EF,
    %% set as number
    num(FF),
    %% same row:
    FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,
    %% same column:
    FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,
    %% tl-dr diagonal:
    FF\=AA,FF\=BB,FF\=CC,FF\=DD,FF\=EE,
    %% same-box:
    FF\=ED,FF\=DE,
    %% set as number
    num(FG),
    %% same row:
    FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,
    %% same column:
    FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,
    %% same-box:
    FG\=DH,FG\=EH,FG\=DI,FG\=EI,
    %% set as number
    num(FH),
    %% same row:
    FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,
    %% same column:
    FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,
    %% same-box:
    FH\=DG,FH\=EG,FH\=DI,FH\=EI,
    %% set as number
    num(FI),
    %% same row:
    FI\=FA,FI\=FB,FI\=FC,FI\=FD,FI\=FE,FI\=FF,FI\=FG,FI\=FH,
    %% same column:
    FI\=AI,FI\=BI,FI\=CI,FI\=DI,FI\=EI,
    %% same-box:
    FI\=DG,FI\=EG,FI\=DH,FI\=EH,

    %% set as number
    num(GA),
    %% same row:
    %% same column:
    GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,
    %% same-box:

    %% set as number
    num(GB),
    %% same row:
    GB\=GA,
    %% same column:
    GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,
    %% same-box:

    %% set as number
    num(GC),
    %% same row:
    GC\=GA,GC\=GB,
    %% same column:
    GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,
    %% dl-tr diagonal:
    GC\=FD,GC\=EE,GC\=DF,GC\=CG,GC\=BH,GC\=AI,
    %% same-box:

    %% set as number
    num(GD),
    %% same row:
    GD\=GA,GD\=GB,GD\=GC,
    %% same column:
    GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,
    %% same-box:

    %% set as number
    num(GE),
    %% same row:
    GE\=GA,GE\=GB,GE\=GC,GE\=GD,
    %% same column:
    GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,
    %% same-box:

    %% set as number
    num(GF),
    %% same row:
    GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,
    %% same column:
    GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,
    %% same-box:

    %% set as number
    num(GG),
    %% same row:
    GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,
    %% same column:
    GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,
    %% tl-dr diagonal:
    GG\=AA,GG\=BB,GG\=CC,GG\=DD,GG\=EE,GG\=FF,
    %% same-box:

    %% set as number
    num(GH),
    %% same row:
    GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,
    %% same column:
    GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,
    %% same-box:

    %% set as number
    num(GI),
    %% same row:
    GI\=GA,GI\=GB,GI\=GC,GI\=GD,GI\=GE,GI\=GF,GI\=GG,GI\=GH,
    %% same column:
    GI\=AI,GI\=BI,GI\=CI,GI\=DI,GI\=EI,GI\=FI,
    %% same-box:


    %% set as number
    num(HA),
    %% same row:
    %% same column:
    HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,
    %% same-box:
    HA\=GB,HA\=GC,
    %% set as number
    num(HB),
    %% same row:
    HB\=HA,
    %% same column:
    HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,
    %% dl-tr diagonal:
    HB\=GC,HB\=FD,HB\=EE,HB\=DF,HB\=CG,HB\=BH,HB\=AI,
    %% same-box:
    HB\=GA,
    %% set as number
    num(HC),
    %% same row:
    HC\=HA,HC\=HB,
    %% same column:
    HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,
    %% same-box:
    HC\=GA,HC\=GB,
    %% set as number
    num(HD),
    %% same row:
    HD\=HA,HD\=HB,HD\=HC,
    %% same column:
    HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,
    %% same-box:
    HD\=GE,HD\=GF,
    %% set as number
    num(HE),
    %% same row:
    HE\=HA,HE\=HB,HE\=HC,HE\=HD,
    %% same column:
    HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,
    %% same-box:
    HE\=GD,HE\=GF,
    %% set as number
    num(HF),
    %% same row:
    HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,
    %% same column:
    HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,
    %% same-box:
    HF\=GD,HF\=GE,
    %% set as number
    num(HG),
    %% same row:
    HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,
    %% same column:
    HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,
    %% same-box:
    HG\=GH,HG\=GI,
    %% set as number
    num(HH),
    %% same row:
    HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,
    %% same column:
    HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,
    %% tl-dr diagonal:
    HH\=AA,HH\=BB,HH\=CC,HH\=DD,HH\=EE,HH\=FF,HH\=GG,
    %% same-box:
    HH\=GI,
    %% set as number
    num(HI),
    %% same row:
    HI\=HA,HI\=HB,HI\=HC,HI\=HD,HI\=HE,HI\=HF,HI\=HG,HI\=HH,
    %% same column:
    HI\=AI,HI\=BI,HI\=CI,HI\=DI,HI\=EI,HI\=FI,HI\=GI,
    %% same-box:
    HI\=GG,HI\=GH,

    %% set as number
    num(IA),
    %% same row:
    %% same column:
    IA\=AA,IA\=BA,IA\=CA,IA\=DA,IA\=EA,IA\=FA,IA\=GA,IA\=HA,
    %% dl-tr diagonal:
    IA\=HB,IA\=GC,IA\=FD,IA\=EE,IA\=DF,IA\=CG,IA\=BH,IA\=AI,
    %% same-box:
    IA\=GB,IA\=HC,
    %% set as number
    num(IB),
    %% same row:
    IB\=IA,
    %% same column:
    IB\=AB,IB\=BB,IB\=CB,IB\=DB,IB\=EB,IB\=FB,IB\=GB,IB\=HB,
    %% same-box:
    IB\=GA,IB\=HA,IB\=GC,IB\=HC,
    %% set as number
    num(IC),
    %% same row:
    IC\=IA,IC\=IB,
    %% same column:
    IC\=AC,IC\=BC,IC\=CC,IC\=DC,IC\=EC,IC\=FC,IC\=GC,IC\=HC,
    %% same-box:
    IC\=GA,IC\=HA,IC\=GB,IC\=HB,
    %% set as number
    num(ID),
    %% same row:
    ID\=IA,ID\=IB,ID\=IC,
    %% same column:
    ID\=AD,ID\=BD,ID\=CD,ID\=DD,ID\=ED,ID\=FD,ID\=GD,ID\=HD,
    %% same-box:
    ID\=GE,ID\=HE,ID\=GF,ID\=HF,
    %% set as number
    num(IE),
    %% same row:
    IE\=IA,IE\=IB,IE\=IC,IE\=ID,
    %% same column:
    IE\=AE,IE\=BE,IE\=CE,IE\=DE,IE\=EE,IE\=FE,IE\=GE,IE\=HE,
    %% same-box:
    IE\=GD,IE\=HD,IE\=GF,IE\=HF,
    %% set as number
    num(IF),
    %% same row:
    IF\=IA,IF\=IB,IF\=IC,IF\=ID,IF\=IE,
    %% same column:
    IF\=AF,IF\=BF,IF\=CF,IF\=DF,IF\=EF,IF\=FF,IF\=GF,IF\=HF,
    %% same-box:
    IF\=GD,IF\=HD,IF\=GE,IF\=HE,
    %% set as number
    num(IG),
    %% same row:
    IG\=IA,IG\=IB,IG\=IC,IG\=ID,IG\=IE,IG\=IF,
    %% same column:
    IG\=AG,IG\=BG,IG\=CG,IG\=DG,IG\=EG,IG\=FG,IG\=GG,IG\=HG,
    %% same-box:
    IG\=GH,IG\=HH,IG\=GI,IG\=HI,
    %% set as number
    num(IH),
    %% same row:
    IH\=IA,IH\=IB,IH\=IC,IH\=ID,IH\=IE,IH\=IF,IH\=IG,
    %% same column:
    IH\=AH,IH\=BH,IH\=CH,IH\=DH,IH\=EH,IH\=FH,IH\=GH,IH\=HH,
    %% same-box:
    IH\=GG,IH\=HG,IH\=GI,IH\=HI,
    %% set as number
    num(II),
    %% same row:
    II\=IA,II\=IB,II\=IC,II\=ID,II\=IE,II\=IF,II\=IG,II\=IH,
    %% same column:
    II\=AI,II\=BI,II\=CI,II\=DI,II\=EI,II\=FI,II\=GI,II\=HI,
    %% tl-dr diagonal:
    II\=AA,II\=BB,II\=CC,II\=DD,II\=EE,II\=FF,II\=GG,II\=HH,
    %% same-box:
    II\=HG,II\=GH,

    %write("###Start\n"),
    %write(AA),write(AB),write(AC),write(AD),write(AE),write(AF),write(AG),write(AH),write(AI),%write("\n"),
    %write(BA),write(BB),write(BC),write(BD),write(BE),write(BF),write(BG),write(BH),write(BI),%write("\n"),
    %write(CA),write(CB),write(CC),write(CD),write(CE),write(CF),write(CG),write(CH),write(CI),%write("\n"),
    %write(DA),write(DB),write(DC),write(DD),write(DE),write(DF),write(DG),write(DH),write(DI),%write("\n"),
    %write(EA),write(EB),write(EC),write(ED),write(EE),write(EF),write(EG),write(EH),write(EI),%write("\n"),
    %write(FA),write(FB),write(FC),write(FD),write(FE),write(FF),write(FG),write(FH),write(FI),%write("\n"),
    %write(GA),write(GB),write(GC),write(GD),write(GE),write(GF),write(GG),write(GH),write(GI),%write("\n"),
    %write(HA),write(HB),write(HC),write(HD),write(HE),write(HF),write(HG),write(HH),write(HI),%write("\n"),
    %write(IA),write(IB),write(IC),write(ID),write(IE),write(IF),write(IG),write(IH),write(II),write("\n"),
    %write("###End\n"),

    term_string(AA, AAstring),
    term_string(AB, ABstring),
    string_concat(AAstring, ABstring, Longstring),
    %write("\nLongstring: "),
    %write(Longstring),
    %write("\n"),
    term_string(Sample, Longstring ),
    write("\nSample: "),
    write(Sample),
    write("\n").
