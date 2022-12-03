/
https://adventofcode.com/2022/
\

\d d1
/everything right of the first dot (.) is from Garklein on The APL Farm discord:
/https://discord.com/channels/821509511977762827/821511172305846322/1048000541722165338
p1:    *{x@>x}(.'"++"\"+"/0:"1.txt")
p2: +/3#{x@>x}(.'"++"\"+"/0:"1.txt")
\d .


\d d2
/using a very dict-oriented approach for part 1
s: "XYZ"!1 2 3 /shape score dictionary
w: ("A Y";"B Z";"C X")!1 /winning moves
d: "XYZ"!"ABC" /draw
p1: +/{p:*|x;((+/s x)+(3*(*x)~d@p)+6*w x)}'0:"2.txt"

/for part 2, (X:lose Y:draw Z:win), choose your play accordingly
s: "ABC"!1 2 3 /shape score
g: "XYZ"!(("ABC"!"CAB");("ABC"!"ABC");("ABC"!"BCA")) /game: g["X"]["A"] means "lose against A" thus returns C
w: "XYZ"!0 3 6 /lose win draw dict
p2: +/{w[p]+s(g p:*|x)@*x}'0:"2.txt"
\d .


\d d3
p: {$[x<"a";x-38;x-96]} /case-based score
p1: +/{p@{*(^x?)_y}/2 0N#x}'0:"3.txt" /common letter in each line
p2: +/(p@*{x(0N=)_x?y}/)'0N 3#0:"3.txt"
\d .
