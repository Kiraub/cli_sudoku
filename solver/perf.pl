% init anfang
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
main([_,HC,Arg]):-
    write("Input:<"),
    write(Arg),
    write(">Answer:<"),
    (solver(HC,Arg);write("false")),
    write(">").

write_field(C, CB, RB, IC, [H|T]) :-
    %trace,
    (C>0->(
        RBR is C mod RB, RBR == 0
        ->(
            CBR is C mod (CB*RB), CBR == 0
            ->true%write('\n    ----+-----+----\n    ')
            ;true%write('\n    ')
        )
        ;(
            CBR is C mod CB, CBR == 0
            ->true%write(' | ')
            ;true
        )
    );true),%write('    ')),
    (
        num(H)
        ->true%upcase_atom(H, UH),write(UH)
        ;true%downcase_atom(H, DH),write(DH)
    ),
    D is C+1,
    write_field(D, CB, RB, ICC, T),
    (
        num(H)
        ->IC is ICC+1
        ;IC is ICC
    ).
write_field(_,_,_,0,[]) :- write('\n').

count_bound(BC, [H|T]) :-
    count_bound(BCC, T),
    (num(H)->BC is BCC+1;BC is BCC).
count_bound(0,[]).

solver(HintAmount, Sample) :-
    (not(number(HintAmount))->HintAmount is 0;true),
    (not(atom(Sample))->fail;atom_length(Sample,Length)),
% init ende
% bound anfang
    (Length>0->(sub_atom(Sample, 0,1,_,AAE),not(empty(AAE))->AA=AAE;AAE='x');AAE='x'),
    (Length>1->(sub_atom(Sample, 1,1,_,ABE),not(empty(ABE))->AB=ABE,write('bound 1 to '),write(ABE),write('\n');ABE='x');ABE='x'),
    (Length>2->(sub_atom(Sample, 2,1,_,ACE),not(empty(ACE))->AC=ACE,write('bound 2 to '),write(ACE),write('\n');ACE='x');ACE='x'),
    (Length>3->(sub_atom(Sample, 3,1,_,ADE),not(empty(ADE))->AD=ADE,write('bound 3 to '),write(ADE),write('\n');ADE='x');ADE='x'),
    (Length>4->(sub_atom(Sample, 4,1,_,AEE),not(empty(AEE))->AE=AEE,write('bound 4 to '),write(AEE),write('\n');AEE='x');AEE='x'),
    (Length>5->(sub_atom(Sample, 5,1,_,AFE),not(empty(AFE))->AF=AFE,write('bound 5 to '),write(AFE),write('\n');AFE='x');AFE='x'),
    (Length>6->(sub_atom(Sample, 6,1,_,AGE),not(empty(AGE))->AG=AGE,write('bound 6 to '),write(AGE),write('\n');AGE='x');AGE='x'),
    (Length>7->(sub_atom(Sample, 7,1,_,AHE),not(empty(AHE))->AH=AHE,write('bound 7 to '),write(AHE),write('\n');AHE='x');AHE='x'),
    (Length>8->(sub_atom(Sample, 8,1,_,AIE),not(empty(AIE))->AI=AIE,write('bound 8 to '),write(AIE),write('\n');AIE='x');AIE='x'),
    (Length>9->(sub_atom(Sample, 9,1,_,BAE),not(empty(BAE))->BA=BAE,write('bound 9 to '),write(BAE),write('\n');BAE='x');BAE='x'),
    (Length>10->(sub_atom(Sample, 10,1,_,BBE),not(empty(BBE))->BB=BBE,write('bound 10 to '),write(BBE),write('\n');BBE='x');BBE='x'),
    (Length>11->(sub_atom(Sample, 11,1,_,BCE),not(empty(BCE))->BC=BCE,write('bound 11 to '),write(BCE),write('\n');BCE='x');BCE='x'),
    (Length>12->(sub_atom(Sample, 12,1,_,BDE),not(empty(BDE))->BD=BDE,write('bound 12 to '),write(BDE),write('\n');BDE='x');BDE='x'),
    (Length>13->(sub_atom(Sample, 13,1,_,BEE),not(empty(BEE))->BE=BEE,write('bound 13 to '),write(BEE),write('\n');BEE='x');BEE='x'),
    (Length>14->(sub_atom(Sample, 14,1,_,BFE),not(empty(BFE))->BF=BFE,write('bound 14 to '),write(BFE),write('\n');BFE='x');BFE='x'),
    (Length>15->(sub_atom(Sample, 15,1,_,BGE),not(empty(BGE))->BG=BGE,write('bound 15 to '),write(BGE),write('\n');BGE='x');BGE='x'),
    (Length>16->(sub_atom(Sample, 16,1,_,BHE),not(empty(BHE))->BH=BHE,write('bound 16 to '),write(BHE),write('\n');BHE='x');BHE='x'),
    (Length>17->(sub_atom(Sample, 17,1,_,BIE),not(empty(BIE))->BI=BIE,write('bound 17 to '),write(BIE),write('\n');BIE='x');BIE='x'),
    (Length>18->(sub_atom(Sample, 18,1,_,CAE),not(empty(CAE))->CA=CAE,write('bound 18 to '),write(CAE),write('\n');CAE='x');CAE='x'),
    (Length>19->(sub_atom(Sample, 19,1,_,CBE),not(empty(CBE))->CB=CBE,write('bound 19 to '),write(CBE),write('\n');CBE='x');CBE='x'),
    (Length>20->(sub_atom(Sample, 20,1,_,CCE),not(empty(CCE))->CC=CCE,write('bound 20 to '),write(CCE),write('\n');CCE='x');CCE='x'),
    (Length>21->(sub_atom(Sample, 21,1,_,CDE),not(empty(CDE))->CD=CDE,write('bound 21 to '),write(CDE),write('\n');CDE='x');CDE='x'),
    (Length>22->(sub_atom(Sample, 22,1,_,CEE),not(empty(CEE))->CE=CEE,write('bound 22 to '),write(CEE),write('\n');CEE='x');CEE='x'),
    (Length>23->(sub_atom(Sample, 23,1,_,CFE),not(empty(CFE))->CF=CFE,write('bound 23 to '),write(CFE),write('\n');CFE='x');CFE='x'),
    (Length>24->(sub_atom(Sample, 24,1,_,CGE),not(empty(CGE))->CG=CGE,write('bound 24 to '),write(CGE),write('\n');CGE='x');CGE='x'),
    (Length>25->(sub_atom(Sample, 25,1,_,CHE),not(empty(CHE))->CH=CHE,write('bound 25 to '),write(CHE),write('\n');CHE='x');CHE='x'),
    (Length>26->(sub_atom(Sample, 26,1,_,CIE),not(empty(CIE))->CI=CIE,write('bound 26 to '),write(CIE),write('\n');CIE='x');CIE='x'),
    (Length>27->(sub_atom(Sample, 27,1,_,DAE),not(empty(DAE))->DA=DAE,write('bound 27 to '),write(DAE),write('\n');DAE='x');DAE='x'),
    (Length>28->(sub_atom(Sample, 28,1,_,DBE),not(empty(DBE))->DB=DBE,write('bound 28 to '),write(DBE),write('\n');DBE='x');DBE='x'),
    (Length>29->(sub_atom(Sample, 29,1,_,DCE),not(empty(DCE))->DC=DCE,write('bound 29 to '),write(DCE),write('\n');DCE='x');DCE='x'),
    (Length>30->(sub_atom(Sample, 30,1,_,DDE),not(empty(DDE))->DD=DDE,write('bound 30 to '),write(DDE),write('\n');DDE='x');DDE='x'),
    (Length>31->(sub_atom(Sample, 31,1,_,DEE),not(empty(DEE))->DE=DEE,write('bound 31 to '),write(DEE),write('\n');DEE='x');DEE='x'),
    (Length>32->(sub_atom(Sample, 32,1,_,DFE),not(empty(DFE))->DF=DFE,write('bound 32 to '),write(DFE),write('\n');DFE='x');DFE='x'),
    (Length>33->(sub_atom(Sample, 33,1,_,DGE),not(empty(DGE))->DG=DGE,write('bound 33 to '),write(DGE),write('\n');DGE='x');DGE='x'),
    (Length>34->(sub_atom(Sample, 34,1,_,DHE),not(empty(DHE))->DH=DHE,write('bound 34 to '),write(DHE),write('\n');DHE='x');DHE='x'),
    (Length>35->(sub_atom(Sample, 35,1,_,DIE),not(empty(DIE))->DI=DIE,write('bound 35 to '),write(DIE),write('\n');DIE='x');DIE='x'),
    (Length>36->(sub_atom(Sample, 36,1,_,EAE),not(empty(EAE))->EA=EAE,write('bound 36 to '),write(EAE),write('\n');EAE='x');EAE='x'),
    (Length>37->(sub_atom(Sample, 37,1,_,EBE),not(empty(EBE))->EB=EBE,write('bound 37 to '),write(EBE),write('\n');EBE='x');EBE='x'),
    (Length>38->(sub_atom(Sample, 38,1,_,ECE),not(empty(ECE))->EC=ECE,write('bound 38 to '),write(ECE),write('\n');ECE='x');ECE='x'),
    (Length>39->(sub_atom(Sample, 39,1,_,EDE),not(empty(EDE))->ED=EDE,write('bound 39 to '),write(EDE),write('\n');EDE='x');EDE='x'),
    (Length>40->(sub_atom(Sample, 40,1,_,EEE),not(empty(EEE))->EE=EEE,write('bound 40 to '),write(EEE),write('\n');EEE='x');EEE='x'),
    (Length>41->(sub_atom(Sample, 41,1,_,EFE),not(empty(EFE))->EF=EFE,write('bound 41 to '),write(EFE),write('\n');EFE='x');EFE='x'),
    (Length>42->(sub_atom(Sample, 42,1,_,EGE),not(empty(EGE))->EG=EGE,write('bound 42 to '),write(EGE),write('\n');EGE='x');EGE='x'),
    (Length>43->(sub_atom(Sample, 43,1,_,EHE),not(empty(EHE))->EH=EHE,write('bound 43 to '),write(EHE),write('\n');EHE='x');EHE='x'),
    (Length>44->(sub_atom(Sample, 44,1,_,EIE),not(empty(EIE))->EI=EIE,write('bound 44 to '),write(EIE),write('\n');EIE='x');EIE='x'),
    (Length>45->(sub_atom(Sample, 45,1,_,FAE),not(empty(FAE))->FA=FAE,write('bound 45 to '),write(FAE),write('\n');FAE='x');FAE='x'),
    (Length>46->(sub_atom(Sample, 46,1,_,FBE),not(empty(FBE))->FB=FBE,write('bound 46 to '),write(FBE),write('\n');FBE='x');FBE='x'),
    (Length>47->(sub_atom(Sample, 47,1,_,FCE),not(empty(FCE))->FC=FCE,write('bound 47 to '),write(FCE),write('\n');FCE='x');FCE='x'),
    (Length>48->(sub_atom(Sample, 48,1,_,FDE),not(empty(FDE))->FD=FDE,write('bound 48 to '),write(FDE),write('\n');FDE='x');FDE='x'),
    (Length>49->(sub_atom(Sample, 49,1,_,FEE),not(empty(FEE))->FE=FEE,write('bound 49 to '),write(FEE),write('\n');FEE='x');FEE='x'),
    (Length>50->(sub_atom(Sample, 50,1,_,FFE),not(empty(FFE))->FF=FFE,write('bound 50 to '),write(FFE),write('\n');FFE='x');FFE='x'),
    (Length>51->(sub_atom(Sample, 51,1,_,FGE),not(empty(FGE))->FG=FGE,write('bound 51 to '),write(FGE),write('\n');FGE='x');FGE='x'),
    (Length>52->(sub_atom(Sample, 52,1,_,FHE),not(empty(FHE))->FH=FHE,write('bound 52 to '),write(FHE),write('\n');FHE='x');FHE='x'),
    (Length>53->(sub_atom(Sample, 53,1,_,FIE),not(empty(FIE))->FI=FIE,write('bound 53 to '),write(FIE),write('\n');FIE='x');FIE='x'),
    (Length>54->(sub_atom(Sample, 54,1,_,GAE),not(empty(GAE))->GA=GAE,write('bound 54 to '),write(GAE),write('\n');GAE='x');GAE='x'),
    (Length>55->(sub_atom(Sample, 55,1,_,GBE),not(empty(GBE))->GB=GBE,write('bound 55 to '),write(GBE),write('\n');GBE='x');GBE='x'),
    (Length>56->(sub_atom(Sample, 56,1,_,GCE),not(empty(GCE))->GC=GCE,write('bound 56 to '),write(GCE),write('\n');GCE='x');GCE='x'),
    (Length>57->(sub_atom(Sample, 57,1,_,GDE),not(empty(GDE))->GD=GDE,write('bound 57 to '),write(GDE),write('\n');GDE='x');GDE='x'),
    (Length>58->(sub_atom(Sample, 58,1,_,GEE),not(empty(GEE))->GE=GEE,write('bound 58 to '),write(GEE),write('\n');GEE='x');GEE='x'),
    (Length>59->(sub_atom(Sample, 59,1,_,GFE),not(empty(GFE))->GF=GFE,write('bound 59 to '),write(GFE),write('\n');GFE='x');GFE='x'),
    (Length>60->(sub_atom(Sample, 60,1,_,GGE),not(empty(GGE))->GG=GGE,write('bound 60 to '),write(GGE),write('\n');GGE='x');GGE='x'),
    (Length>61->(sub_atom(Sample, 61,1,_,GHE),not(empty(GHE))->GH=GHE,write('bound 61 to '),write(GHE),write('\n');GHE='x');GHE='x'),
    (Length>62->(sub_atom(Sample, 62,1,_,GIE),not(empty(GIE))->GI=GIE,write('bound 62 to '),write(GIE),write('\n');GIE='x');GIE='x'),
    (Length>63->(sub_atom(Sample, 63,1,_,HAE),not(empty(HAE))->HA=HAE,write('bound 63 to '),write(HAE),write('\n');HAE='x');HAE='x'),
    (Length>64->(sub_atom(Sample, 64,1,_,HBE),not(empty(HBE))->HB=HBE,write('bound 64 to '),write(HBE),write('\n');HBE='x');HBE='x'),
    (Length>65->(sub_atom(Sample, 65,1,_,HCE),not(empty(HCE))->HC=HCE,write('bound 65 to '),write(HCE),write('\n');HCE='x');HCE='x'),
    (Length>66->(sub_atom(Sample, 66,1,_,HDE),not(empty(HDE))->HD=HDE,write('bound 66 to '),write(HDE),write('\n');HDE='x');HDE='x'),
    (Length>67->(sub_atom(Sample, 67,1,_,HEE),not(empty(HEE))->HE=HEE,write('bound 67 to '),write(HEE),write('\n');HEE='x');HEE='x'),
    (Length>68->(sub_atom(Sample, 68,1,_,HFE),not(empty(HFE))->HF=HFE,write('bound 68 to '),write(HFE),write('\n');HFE='x');HFE='x'),
    (Length>69->(sub_atom(Sample, 69,1,_,HGE),not(empty(HGE))->HG=HGE,write('bound 69 to '),write(HGE),write('\n');HGE='x');HGE='x'),
    (Length>70->(sub_atom(Sample, 70,1,_,HHE),not(empty(HHE))->HH=HHE,write('bound 70 to '),write(HHE),write('\n');HHE='x');HHE='x'),
    (Length>71->(sub_atom(Sample, 71,1,_,HIE),not(empty(HIE))->HI=HIE,write('bound 71 to '),write(HIE),write('\n');HIE='x');HIE='x'),
    (Length>72->(sub_atom(Sample, 72,1,_,IAE),not(empty(IAE))->IA=IAE,write('bound 72 to '),write(IAE),write('\n');IAE='x');IAE='x'),
    (Length>73->(sub_atom(Sample, 73,1,_,IBE),not(empty(IBE))->IB=IBE,write('bound 73 to '),write(IBE),write('\n');IBE='x');IBE='x'),
    (Length>74->(sub_atom(Sample, 74,1,_,ICE),not(empty(ICE))->IC=ICE,write('bound 74 to '),write(ICE),write('\n');ICE='x');ICE='x'),
    (Length>75->(sub_atom(Sample, 75,1,_,IDE),not(empty(IDE))->ID=IDE,write('bound 75 to '),write(IDE),write('\n');IDE='x');IDE='x'),
    (Length>76->(sub_atom(Sample, 76,1,_,IEE),not(empty(IEE))->IE=IEE,write('bound 76 to '),write(IEE),write('\n');IEE='x');IEE='x'),
    (Length>77->(sub_atom(Sample, 77,1,_,IFE),not(empty(IFE))->IF=IFE,write('bound 77 to '),write(IFE),write('\n');IFE='x');IFE='x'),
    (Length>78->(sub_atom(Sample, 78,1,_,IGE),not(empty(IGE))->IG=IGE,write('bound 78 to '),write(IGE),write('\n');IGE='x');IGE='x'),
    (Length>79->(sub_atom(Sample, 79,1,_,IHE),not(empty(IHE))->IH=IHE,write('bound 79 to '),write(IHE),write('\n');IHE='x');IHE='x'),
    (Length>80->(sub_atom(Sample, 80,1,_,IIE),not(empty(IIE))->II=IIE/*,write('bound 80 to '),write(IIE),write('\n')*/;IIE='x');IIE='x'),
    !,

    %atom_list_concat([AAE,ABE,ACE,ADE,AEE,AFE,AGE,AHE,AIE,BAE,BBE,BCE,BDE,BEE,BFE,BGE,BHE,BIE,CAE,CBE,CCE,CDE,CEE,CFE,CGE,CHE,CIE,DAE,DBE,DCE,DDE,DEE,DFE,DGE,DHE,DIE,EAE,EBE,ECE,EDE,EEE,EFE,EGE,EHE,EIE,FAE,FBE,FCE,FDE,FEE,FFE,FGE,FHE,FIE,GAE,GBE,GCE,GDE,GEE,GFE,GGE,GHE,GIE,HAE,HBE,HCE,HDE,HEE,HFE,HGE,HHE,HIE,IAE,IBE,ICE,IDE,IEE,IFE,IGE,IHE,IIE],LongAtom),
    %term_string(LongAtom,LongString),
    %write("\nField with un-/bound values:\n"),
    %write_field( 0, 3, 9, BoundCount, [AAE,ABE,ACE,ADE,AEE,AFE,AGE,AHE,AIE,BAE,BBE,BCE,BDE,BEE,BFE,BGE,BHE,BIE,CAE,CBE,CCE,CDE,CEE,CFE,CGE,CHE,CIE,DAE,DBE,DCE,DDE,DEE,DFE,DGE,DHE,DIE,EAE,EBE,ECE,EDE,EEE,EFE,EGE,EHE,EIE,FAE,FBE,FCE,FDE,FEE,FFE,FGE,FHE,FIE,GAE,GBE,GCE,GDE,GEE,GFE,GGE,GHE,GIE,HAE,HBE,HCE,HDE,HEE,HFE,HGE,HHE,HIE,IAE,IBE,ICE,IDE,IEE,IFE,IGE,IHE,IIE]),
    %write("\n  "),
    %write(BoundCount),
    %write(" values bound\n"),
    count_bound(BoundCount, [AAE,ABE,ACE,ADE,AEE,AFE,AGE,AHE,AIE,BAE,BBE,BCE,BDE,BEE,BFE,BGE,BHE,BIE,CAE,CBE,CCE,CDE,CEE,CFE,CGE,CHE,CIE,DAE,DBE,DCE,DDE,DEE,DFE,DGE,DHE,DIE,EAE,EBE,ECE,EDE,EEE,EFE,EGE,EHE,EIE,FAE,FBE,FCE,FDE,FEE,FFE,FGE,FHE,FIE,GAE,GBE,GCE,GDE,GEE,GFE,GGE,GHE,GIE,HAE,HBE,HCE,HDE,HEE,HFE,HGE,HHE,HIE,IAE,IBE,ICE,IDE,IEE,IFE,IGE,IHE,IIE]),
    (
        BoundCount<HintAmount
        -> true%write("not enough values given\nstopping\n")
        ; (
% bound ende
% code anfang
            (empty(AAE)->num(AA);true),
            (empty(ABE)->num(AB);true),
        AB\=AA,
            (empty(ACE)->num(AC);true),
        AC\=AA,AC\=AB,
            (empty(ADE)->num(AD);true),
        AD\=AA,AD\=AB,AD\=AC,
            (empty(AEE)->num(AE);true),
        AE\=AA,AE\=AB,AE\=AC,AE\=AD,
            (empty(AFE)->num(AF);true),
        AF\=AA,AF\=AB,AF\=AC,AF\=AD,AF\=AE,
            (empty(AGE)->num(AG);true),
        AG\=AA,AG\=AB,AG\=AC,AG\=AD,AG\=AE,AG\=AF,
            (empty(AHE)->num(AH);true),
        AH\=AA,AH\=AB,AH\=AC,AH\=AD,AH\=AE,AH\=AF,AH\=AG,
            (empty(AIE)->num(AI);true),
        AI\=AA,AI\=AB,AI\=AC,AI\=AD,AI\=AE,AI\=AF,AI\=AG,AI\=AH,
            
            (empty(BAE)->num(BA);true),
        BA\=AA,BA\=AB,BA\=AC,
            (empty(BBE)->num(BB);true),
        BB\=BA,BB\=AB,BB\=AA,BB\=AC,
            (empty(BCE)->num(BC);true),
        BC\=BA,BC\=BB,BC\=AC,BC\=AA,BC\=AB,
            (empty(BDE)->num(BD);true),
        BD\=BA,BD\=BB,BD\=BC,BD\=AD,BD\=AE,BD\=AF,
            (empty(BEE)->num(BE);true),
        BE\=BA,BE\=BB,BE\=BC,BE\=BD,BE\=AE,BE\=AD,BE\=AF,
            (empty(BFE)->num(BF);true),
        BF\=BA,BF\=BB,BF\=BC,BF\=BD,BF\=BE,BF\=AF,BF\=AD,BF\=AE,
            (empty(BGE)->num(BG);true),
        BG\=BA,BG\=BB,BG\=BC,BG\=BD,BG\=BE,BG\=BF,BG\=AG,BG\=AH,BG\=AI,
            (empty(BHE)->num(BH);true),
        BH\=BA,BH\=BB,BH\=BC,BH\=BD,BH\=BE,BH\=BF,BH\=BG,BH\=AH,BH\=AI,BH\=AG,
            (empty(BIE)->num(BI);true),
        BI\=BA,BI\=BB,BI\=BC,BI\=BD,BI\=BE,BI\=BF,BI\=BG,BI\=BH,BI\=AI,BI\=AG,BI\=AH,
            
            (empty(CAE)->num(CA);true),
        CA\=AA,CA\=BA,CA\=AB,CA\=BB,CA\=AC,CA\=BC,
            (empty(CBE)->num(CB);true),
        CB\=CA,CB\=AB,CB\=BB,CB\=AA,CB\=BA,CB\=AC,CB\=BC,
            (empty(CCE)->num(CC);true),
        CC\=CA,CC\=CB,CC\=AC,CC\=BC,CC\=AA,CC\=BB,CC\=BA,CC\=AB,
            (empty(CDE)->num(CD);true),
        CD\=CA,CD\=CB,CD\=CC,CD\=AD,CD\=BD,CD\=AE,CD\=BE,CD\=AF,CD\=BF,
            (empty(CEE)->num(CE);true),
        CE\=CA,CE\=CB,CE\=CC,CE\=CD,CE\=AE,CE\=BE,CE\=AD,CE\=BD,CE\=AF,CE\=BF,
            (empty(CFE)->num(CF);true),
        CF\=CA,CF\=CB,CF\=CC,CF\=CD,CF\=CE,CF\=AF,CF\=BF,CF\=AD,CF\=BD,CF\=AE,CF\=BE,
            (empty(CGE)->num(CG);true),
        CG\=CA,CG\=CB,CG\=CC,CG\=CD,CG\=CE,CG\=CF,CG\=AG,CG\=BG,CG\=BH,CG\=AI,CG\=AH,CG\=BI,
            (empty(CHE)->num(CH);true),
        CH\=CA,CH\=CB,CH\=CC,CH\=CD,CH\=CE,CH\=CF,CH\=CG,CH\=AH,CH\=BH,CH\=AG,CH\=BG,CH\=AI,CH\=BI,
            (empty(CIE)->num(CI);true),
        CI\=CA,CI\=CB,CI\=CC,CI\=CD,CI\=CE,CI\=CF,CI\=CG,CI\=CH,CI\=AI,CI\=BI,CI\=AG,CI\=BG,CI\=AH,CI\=BH,
            
            (empty(DAE)->num(DA);true),
        DA\=AA,DA\=BA,DA\=CA,
            (empty(DBE)->num(DB);true),
        DB\=DA,DB\=AB,DB\=BB,DB\=CB,
            (empty(DCE)->num(DC);true),
        DC\=DA,DC\=DB,DC\=AC,DC\=BC,DC\=CC,
            (empty(DDE)->num(DD);true),
        DD\=DA,DD\=DB,DD\=DC,DD\=AD,DD\=BD,DD\=CD,DD\=AA,DD\=BB,DD\=CC,
            (empty(DEE)->num(DE);true),
        DE\=DA,DE\=DB,DE\=DC,DE\=DD,DE\=AE,DE\=BE,DE\=CE,
            (empty(DFE)->num(DF);true),
        DF\=DA,DF\=DB,DF\=DC,DF\=DD,DF\=DE,DF\=AF,DF\=BF,DF\=CF,DF\=CG,DF\=BH,DF\=AI,
            (empty(DGE)->num(DG);true),
        DG\=DA,DG\=DB,DG\=DC,DG\=DD,DG\=DE,DG\=DF,DG\=AG,DG\=BG,DG\=CG,
            (empty(DHE)->num(DH);true),
        DH\=DA,DH\=DB,DH\=DC,DH\=DD,DH\=DE,DH\=DF,DH\=DG,DH\=AH,DH\=BH,DH\=CH,
            (empty(DIE)->num(DI);true),
        DI\=DA,DI\=DB,DI\=DC,DI\=DD,DI\=DE,DI\=DF,DI\=DG,DI\=DH,DI\=AI,DI\=BI,DI\=CI,
            
            (empty(EAE)->num(EA);true),
        EA\=AA,EA\=BA,EA\=CA,EA\=DA,EA\=DB,EA\=DC,
            (empty(EBE)->num(EB);true),
        EB\=EA,EB\=AB,EB\=BB,EB\=CB,EB\=DB,EB\=DA,EB\=DC,
            (empty(ECE)->num(EC);true),
        EC\=EA,EC\=EB,EC\=AC,EC\=BC,EC\=CC,EC\=DC,EC\=DA,EC\=DB,
            (empty(EDE)->num(ED);true),
        ED\=EA,ED\=EB,ED\=EC,ED\=AD,ED\=BD,ED\=CD,ED\=DD,ED\=DE,ED\=DF,
            (empty(EEE)->num(EE);true),
        EE\=EA,EE\=EB,EE\=EC,EE\=ED,EE\=AE,EE\=BE,EE\=CE,EE\=DE,EE\=AA,EE\=BB,EE\=CC,EE\=DD,EE\=DF,EE\=CG,EE\=BH,EE\=AI,
            (empty(EFE)->num(EF);true),
        EF\=EA,EF\=EB,EF\=EC,EF\=ED,EF\=EE,EF\=AF,EF\=BF,EF\=CF,EF\=DF,EF\=DD,EF\=DE,
            (empty(EGE)->num(EG);true),
        EG\=EA,EG\=EB,EG\=EC,EG\=ED,EG\=EE,EG\=EF,EG\=AG,EG\=BG,EG\=CG,EG\=DG,EG\=DH,EG\=DI,
            (empty(EHE)->num(EH);true),
        EH\=EA,EH\=EB,EH\=EC,EH\=ED,EH\=EE,EH\=EF,EH\=EG,EH\=AH,EH\=BH,EH\=CH,EH\=DH,EH\=DG,EH\=DI,
            (empty(EIE)->num(EI);true),
        EI\=EA,EI\=EB,EI\=EC,EI\=ED,EI\=EE,EI\=EF,EI\=EG,EI\=EH,EI\=AI,EI\=BI,EI\=CI,EI\=DI,EI\=DG,EI\=DH,
            
            (empty(FAE)->num(FA);true),
        FA\=AA,FA\=BA,FA\=CA,FA\=DA,FA\=EA,FA\=DB,FA\=EB,FA\=DC,FA\=EC,
            (empty(FBE)->num(FB);true),
        FB\=FA,FB\=AB,FB\=BB,FB\=CB,FB\=DB,FB\=EB,FB\=DA,FB\=EA,FB\=DC,FB\=EC,
            (empty(FCE)->num(FC);true),
        FC\=FA,FC\=FB,FC\=AC,FC\=BC,FC\=CC,FC\=DC,FC\=EC,FC\=DA,FC\=EA,FC\=DB,FC\=EB,
            (empty(FDE)->num(FD);true),
        FD\=FA,FD\=FB,FD\=FC,FD\=AD,FD\=BD,FD\=CD,FD\=DD,FD\=ED,FD\=EE,FD\=DF,FD\=CG,FD\=BH,FD\=AI,FD\=DE,FD\=EF,
            (empty(FEE)->num(FE);true),
        FE\=FA,FE\=FB,FE\=FC,FE\=FD,FE\=AE,FE\=BE,FE\=CE,FE\=DE,FE\=EE,FE\=DD,FE\=ED,FE\=DF,FE\=EF,
            (empty(FFE)->num(FF);true),
        FF\=FA,FF\=FB,FF\=FC,FF\=FD,FF\=FE,FF\=AF,FF\=BF,FF\=CF,FF\=DF,FF\=EF,FF\=AA,FF\=BB,FF\=CC,FF\=DD,FF\=EE,FF\=ED,FF\=DE,
            (empty(FGE)->num(FG);true),
        FG\=FA,FG\=FB,FG\=FC,FG\=FD,FG\=FE,FG\=FF,FG\=AG,FG\=BG,FG\=CG,FG\=DG,FG\=EG,FG\=DH,FG\=EH,FG\=DI,FG\=EI,
            (empty(FHE)->num(FH);true),
        FH\=FA,FH\=FB,FH\=FC,FH\=FD,FH\=FE,FH\=FF,FH\=FG,FH\=AH,FH\=BH,FH\=CH,FH\=DH,FH\=EH,FH\=DG,FH\=EG,FH\=DI,FH\=EI,
            (empty(FIE)->num(FI);true),
        FI\=FA,FI\=FB,FI\=FC,FI\=FD,FI\=FE,FI\=FF,FI\=FG,FI\=FH,FI\=AI,FI\=BI,FI\=CI,FI\=DI,FI\=EI,FI\=DG,FI\=EG,FI\=DH,FI\=EH,
            
            (empty(GAE)->num(GA);true),
        GA\=AA,GA\=BA,GA\=CA,GA\=DA,GA\=EA,GA\=FA,
            (empty(GBE)->num(GB);true),
        GB\=GA,GB\=AB,GB\=BB,GB\=CB,GB\=DB,GB\=EB,GB\=FB,
            (empty(GCE)->num(GC);true),
        GC\=GA,GC\=GB,GC\=AC,GC\=BC,GC\=CC,GC\=DC,GC\=EC,GC\=FC,GC\=FD,GC\=EE,GC\=DF,GC\=CG,GC\=BH,GC\=AI,
            (empty(GDE)->num(GD);true),
        GD\=GA,GD\=GB,GD\=GC,GD\=AD,GD\=BD,GD\=CD,GD\=DD,GD\=ED,GD\=FD,
            (empty(GEE)->num(GE);true),
        GE\=GA,GE\=GB,GE\=GC,GE\=GD,GE\=AE,GE\=BE,GE\=CE,GE\=DE,GE\=EE,GE\=FE,
            (empty(GFE)->num(GF);true),
        GF\=GA,GF\=GB,GF\=GC,GF\=GD,GF\=GE,GF\=AF,GF\=BF,GF\=CF,GF\=DF,GF\=EF,GF\=FF,
            (empty(GGE)->num(GG);true),
        GG\=GA,GG\=GB,GG\=GC,GG\=GD,GG\=GE,GG\=GF,GG\=AG,GG\=BG,GG\=CG,GG\=DG,GG\=EG,GG\=FG,GG\=AA,GG\=BB,GG\=CC,GG\=DD,GG\=EE,GG\=FF,
            (empty(GHE)->num(GH);true),
        GH\=GA,GH\=GB,GH\=GC,GH\=GD,GH\=GE,GH\=GF,GH\=GG,GH\=AH,GH\=BH,GH\=CH,GH\=DH,GH\=EH,GH\=FH,
            (empty(GIE)->num(GI);true),
        GI\=GA,GI\=GB,GI\=GC,GI\=GD,GI\=GE,GI\=GF,GI\=GG,GI\=GH,GI\=AI,GI\=BI,GI\=CI,GI\=DI,GI\=EI,GI\=FI,
            
            (empty(HAE)->num(HA);true),
        HA\=AA,HA\=BA,HA\=CA,HA\=DA,HA\=EA,HA\=FA,HA\=GA,HA\=GB,HA\=GC,
            (empty(HBE)->num(HB);true),
        HB\=HA,HB\=AB,HB\=BB,HB\=CB,HB\=DB,HB\=EB,HB\=FB,HB\=GB,HB\=GC,HB\=FD,HB\=EE,HB\=DF,HB\=CG,HB\=BH,HB\=AI,HB\=GA,
            (empty(HCE)->num(HC);true),
        HC\=HA,HC\=HB,HC\=AC,HC\=BC,HC\=CC,HC\=DC,HC\=EC,HC\=FC,HC\=GC,HC\=GA,HC\=GB,
            (empty(HDE)->num(HD);true),
        HD\=HA,HD\=HB,HD\=HC,HD\=AD,HD\=BD,HD\=CD,HD\=DD,HD\=ED,HD\=FD,HD\=GD,HD\=GE,HD\=GF,
            (empty(HEE)->num(HE);true),
        HE\=HA,HE\=HB,HE\=HC,HE\=HD,HE\=AE,HE\=BE,HE\=CE,HE\=DE,HE\=EE,HE\=FE,HE\=GE,HE\=GD,HE\=GF,
            (empty(HFE)->num(HF);true),
        HF\=HA,HF\=HB,HF\=HC,HF\=HD,HF\=HE,HF\=AF,HF\=BF,HF\=CF,HF\=DF,HF\=EF,HF\=FF,HF\=GF,HF\=GD,HF\=GE,
            (empty(HGE)->num(HG);true),
        HG\=HA,HG\=HB,HG\=HC,HG\=HD,HG\=HE,HG\=HF,HG\=AG,HG\=BG,HG\=CG,HG\=DG,HG\=EG,HG\=FG,HG\=GG,HG\=GH,HG\=GI,
            (empty(HHE)->num(HH);true),
        HH\=HA,HH\=HB,HH\=HC,HH\=HD,HH\=HE,HH\=HF,HH\=HG,HH\=AH,HH\=BH,HH\=CH,HH\=DH,HH\=EH,HH\=FH,HH\=GH,HH\=AA,HH\=BB,HH\=CC,HH\=DD,HH\=EE,HH\=FF,HH\=GG,HH\=GI,
            (empty(HIE)->num(HI);true),
        HI\=HA,HI\=HB,HI\=HC,HI\=HD,HI\=HE,HI\=HF,HI\=HG,HI\=HH,HI\=AI,HI\=BI,HI\=CI,HI\=DI,HI\=EI,HI\=FI,HI\=GI,HI\=GG,HI\=GH,
            
            (empty(IAE)->num(IA);true),
        IA\=AA,IA\=BA,IA\=CA,IA\=DA,IA\=EA,IA\=FA,IA\=GA,IA\=HA,IA\=HB,IA\=GC,IA\=FD,IA\=EE,IA\=DF,IA\=CG,IA\=BH,IA\=AI,IA\=GB,IA\=HC,
            (empty(IBE)->num(IB);true),
        IB\=IA,IB\=AB,IB\=BB,IB\=CB,IB\=DB,IB\=EB,IB\=FB,IB\=GB,IB\=HB,IB\=GA,IB\=HA,IB\=GC,IB\=HC,
            (empty(ICE)->num(IC);true),
        IC\=IA,IC\=IB,IC\=AC,IC\=BC,IC\=CC,IC\=DC,IC\=EC,IC\=FC,IC\=GC,IC\=HC,IC\=GA,IC\=HA,IC\=GB,IC\=HB,
            (empty(IDE)->num(ID);true),
        ID\=IA,ID\=IB,ID\=IC,ID\=AD,ID\=BD,ID\=CD,ID\=DD,ID\=ED,ID\=FD,ID\=GD,ID\=HD,ID\=GE,ID\=HE,ID\=GF,ID\=HF,
            (empty(IEE)->num(IE);true),
        IE\=IA,IE\=IB,IE\=IC,IE\=ID,IE\=AE,IE\=BE,IE\=CE,IE\=DE,IE\=EE,IE\=FE,IE\=GE,IE\=HE,IE\=GD,IE\=HD,IE\=GF,IE\=HF,
            (empty(IFE)->num(IF);true),
        IF\=IA,IF\=IB,IF\=IC,IF\=ID,IF\=IE,IF\=AF,IF\=BF,IF\=CF,IF\=DF,IF\=EF,IF\=FF,IF\=GF,IF\=HF,IF\=GD,IF\=HD,IF\=GE,IF\=HE,
            (empty(IGE)->num(IG);true),
        IG\=IA,IG\=IB,IG\=IC,IG\=ID,IG\=IE,IG\=IF,IG\=AG,IG\=BG,IG\=CG,IG\=DG,IG\=EG,IG\=FG,IG\=GG,IG\=HG,IG\=GH,IG\=HH,IG\=GI,IG\=HI,
            (empty(IHE)->num(IH);true),
        IH\=IA,IH\=IB,IH\=IC,IH\=ID,IH\=IE,IH\=IF,IH\=IG,IH\=AH,IH\=BH,IH\=CH,IH\=DH,IH\=EH,IH\=FH,IH\=GH,IH\=HH,IH\=GG,IH\=HG,IH\=GI,IH\=HI,
            (empty(IIE)->num(II);true),
        II\=IA,II\=IB,II\=IC,II\=ID,II\=IE,II\=IF,II\=IG,II\=IH,II\=AI,II\=BI,II\=CI,II\=DI,II\=EI,II\=FI,II\=GI,II\=HI,II\=AA,II\=BB,II\=CC,II\=DD,II\=EE,II\=FF,II\=GG,II\=HH,II\=HG,II\=GH
% code ende
        )
    ),
    write("true").
    %write("Solution with inserted values:\n"),
    %write_field(0, 3, 9, _, [AA,AB,AC,AD,AE,AF,AG,AH,AI,BA,BB,BC,BD,BE,BF,BG,BH,BI,CA,CB,CC,CD,CE,CF,CG,CH,CI,DA,DB,DC,DD,DE,DF,DG,DH,DI,EA,EB,EC,ED,EE,EF,EG,EH,EI,FA,FB,FC,FD,FE,FF,FG,FH,FI,GA,GB,GC,GD,GE,GF,GG,GH,GI,HA,HB,HC,HD,HE,HF,HG,HH,HI,IA,IB,IC,ID,IE,IF,IG,IH,II]),
    %write("\n").
