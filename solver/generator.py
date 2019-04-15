fail_if_not_atom = True
print_sudoku_if_found = False

startletter = 'A'
endletter = 'I'
samebox = [ ['A','B','C'], ['D','E','F'], ['G','H','I'] ]
init = ""
code = ""
string_list = ""
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
main([_|H]):-\n\
    write(\"Input:<\"),\n\
    write(H),\n\
    write(\">Answer:<\"),\n\
    (H=[Arg|_],solver(Arg);write(\"false\")),\n\
    write(\">\").\n\
"
init += "\nsolver(Sample) :-\n\
    (not(atom(Sample))->"
if fail_if_not_atom:
    init += "fail"
else:
    init += "Length=0"
init += ";atom_length(Sample,Length)),\n    "
for x in range( ord(startletter),ord(endletter)+1 ):
    for y in range( ord(startletter),ord(endletter)+1 ):
        varname = chr(x)+chr(y)
        xbox = []
        ybox = []
        same = []
        #code += "\n%% "+varname+"\n"
        #code += "num("+varname+"),\n"
        #code += "((Isatom=yes,Length>"+str(counter)+",sub_atom(Sample, "+str(counter)+",1,_,"+varname+"E),((num("+varname+"E),"+varname+"="+varname+"E);(empty("+varname+"E),num("+varname+"))));(Isatom=no;Length<"+str(counter+1)+")),\n"
        code += "(Length>"+str(counter)
        code += "->(sub_atom(Sample, "+str(counter)+",1,_,"+varname+"E),"
        code += "not(empty("+varname+"E))"
        code += "->"+varname+"="+varname+"E;num("+varname+"))"
        code += ";num("+varname+")),\n"
        #code += ("\n%% set as number\n")
        #code += ");(Isatom=yes,sub_atom(Sample, "+str(counter)+",1,_,"+varname+"),num("+varname+"))),\n"
        counter += 1
        #code += ("%% same row:\n")
        for yn in range( ord(startletter), y):
            code += varname+"\\="+chr(x)+chr(yn)+","
            same.append(chr(x)+chr(yn))
        #if y > ord(startletter):
        #    code += '\n'
        #code += ("%% same column:\n")
        for xn in range( ord(startletter), x):
            code += varname+"\\="+chr(xn)+chr(y)+","
            same.append(chr(xn)+chr(y))
        #if x > ord(startletter):
        #    code += '\n'
        if endletter != 'I':
            continue
        if x==y:
            #code += ("%% tl-dr diagonal:\n")
            for dn in range(ord(startletter), x):
                code += varname+"\\="+chr(dn)+chr(dn)+","
                same.append(chr(dn)+chr(dn))
            #code += '\n'
        if x+y-ord(startletter) == ord(endletter):
            #code += ("%% dl-tr diagonal:\n")
            for dy in range(y+1, ord(endletter)+1):
                dx = ord(endletter)-(dy-ord(startletter))
                code += varname+"\\="+chr(dx)+chr(dy)+","
                same.append(chr(dx)+chr(dy))
            #code += '\n'
        #code += ("%% same-box:\n")
        for box in samebox:
            if chr(x) in box:
                xbox = box
            if chr(y) in box:
                ybox = box
        for yb in ybox:
                for xb in xbox:
                    if x >= ord(xb) and (chr(y) != yb and chr(x) != xb) and str(xb+yb) not in same:
                        code += varname+"\\="+xb+yb+","
        code += '\n'
    code += '\n'

if print_sudoku_if_found:
    #code += "write(\"###Start\\n\"),\n"
    
    string_list = "atom_list_concat(["
    for x in range( ord(startletter),ord(endletter)+1 ):
        for y in range( ord(startletter),ord(endletter)+1 ):
            varname = chr(x)+chr(y)
            #code += "write("+varname+"),"
            #code += "term_string("+varname+","+varname+"string),"
            if x != ord(startletter) or y > ord(startletter):
                string_list += ","
            string_list += varname
        #code += "\n"
    string_list += "],LongAtom),\nterm_string(LongAtom,LongString),\nwrite(\"Solution\\n\\t\"),\nwrite(LongString),\nwrite(\"\\n\"),\nfail."
    
    #code += "write(\"###End\\n\"),\n"
    #code += "\nfail."
else:
    code += "write(\"true\")."

print(init, end="")
print(code.replace("\n","\n    "), end="")
print(string_list)