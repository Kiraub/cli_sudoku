startletter = 'A'
endletter = 'I'
samebox = [ ['A','B','C'], ['D','E','F'], ['G','H','I'] ]
init = ""
counter = 0
init += "empty('x').\n"
for l in range( ord(startletter),ord(endletter)+1 ):
    letter = chr(l)
    init += "num('"+letter.lower()+"').\n"
init += "\
atom_list_concat([H|T], Cat):-\n\
    atom_list_concat(H,T,Cat).\n\
atom_list_concat(Cat,[],Cat).\n\
atom_list_concat(A,[H|T],Cat) :-\n\
    atom_concat(A,H,ACat),\n\
    atom_list_concat(ACat,T,Cat).\n\
"
init += "\nsolver(Sample) :-\n((not(atom(Sample)),Isatom=no,Length=0);(atom(Sample),atom_length(Sample,Length),Isatom=yes)),"
for x in range( ord(startletter),ord(endletter)+1 ):
    for y in range( ord(startletter),ord(endletter)+1 ):
        varname = chr(x)+chr(y)
        xbox = []
        ybox = []
        same = []
        init += "\n%% "+varname+"\n"
        init += "num("+varname+"),\n"
        init += "((Isatom=yes,Length>0,sub_atom(Sample, "+str(counter)+",1,_,"+varname+"));(Isatom=no;Length<"+str(counter+1)+");(sub_atom(Sample, "+str(counter)+",1,_,"+varname+"E),empty("+varname+"E))),\n"
        #init += ("\n%% set as number\n")
        #init += ");(Isatom=yes,sub_atom(Sample, "+str(counter)+",1,_,"+varname+"),num("+varname+"))),\n"
        counter += 1
        init += ("%% same row:\n")
        for yn in range( ord(startletter), y):
            init += varname+"\\="+chr(x)+chr(yn)+","
            same.append(chr(x)+chr(yn))
        if y > ord(startletter):
            init += '\n'
        init += ("%% same column:\n")
        for xn in range( ord(startletter), x):
            init += varname+"\\="+chr(xn)+chr(y)+","
            same.append(chr(xn)+chr(y))
        if x > ord(startletter):
            init += '\n'
        if endletter != 'I':
            continue
        if x==y:
            init += ("%% tl-dr diagonal:\n")
            for dn in range(ord(startletter), x):
                init += varname+"\\="+chr(dn)+chr(dn)+","
                same.append(chr(dn)+chr(dn))
            init += '\n'
        if x+y-ord(startletter) == ord(endletter):
            init += ("%% dl-tr diagonal:\n")
            for dy in range(y+1, ord(endletter)+1):
                dx = ord(endletter)-(dy-ord(startletter))
                init += varname+"\\="+chr(dx)+chr(dy)+","
                same.append(chr(dx)+chr(dy))
            init += '\n'
        init += ("%% same-box:\n")
        for box in samebox:
            if chr(x) in box:
                xbox = box
            if chr(y) in box:
                ybox = box
        for yb in ybox:
                for xb in xbox:
                    if x >= ord(xb) and (chr(y) != yb and chr(x) != xb) and str(xb+yb) not in same:
                        init += varname+"\\="+xb+yb+","
        init += '\n'
    init += '\n'
init += "write(\"Found valid solution.\").\n"
#init += "write(\"###Start\\n\"),\n"
"""
string_list = "atom_list_concat(["
for x in range( ord(startletter),ord(endletter)+1 ):
    for y in range( ord(startletter),ord(endletter)+1 ):
        varname = chr(x)+chr(y)
        #init += "write("+varname+"),"
        #init += "term_string("+varname+","+varname+"string),"
        if x != ord(startletter) or y > ord(startletter):
            string_list += ","
        string_list += varname
    #init += "\n"
string_list += "],LongAtom),\nterm_string(LongAtom,LongString),\nwrite(\"Solution\\n\\t\"),\nwrite(LongString),\nwrite(\"\\n\"),\nfail."
"""
#init += "write(\"###End\\n\"),\n"
#init += "\nfail."

print(init)
#print(string_list)