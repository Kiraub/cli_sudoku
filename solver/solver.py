startletter = 'A'
endletter = 'I'
samebox = [ ['A','B','C'], ['D','E','F'], ['G','H','I'] ]
init = ""
for l in range( ord(startletter),ord(endletter)+1 ):
    letter = chr(l)
    init += "num('"+letter.lower()+"').\n"
init += "\nsolver :-\n"
for x in range( ord(startletter),ord(endletter)+1 ):
    for y in range( ord(startletter),ord(endletter)+1 ):
        varname = chr(x)+chr(y)
        xbox = []
        ybox = []
        same = []
        init += ("%% set as number\n")
        init += "num("+varname+"),\n"
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
init += "write(\"###Start\\n\"),\n"
for x in range( ord(startletter),ord(endletter)+1 ):
    for y in range( ord(startletter),ord(endletter)+1 ):
        varname = chr(x)+chr(y)
        init += "write("+varname+"),"
    init += "write(\"\\n\"),\n"
init += "write(\"###End\\n\"),\n"
init += "\nfail."
print(init)