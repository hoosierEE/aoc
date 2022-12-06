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


\d d4
p1: +/({(((#y)=+/~^x?y)|(#x)=+/~^y?x)}/({x+!(y+1-x)}/ .' "-"\)'","\)'0:"4.txt"
p2: +/({|/~^x?y}/(({x+!(y+1-x)}/.' "-"\)'","\)@)'0:"4.txt"
\d .


\d d5
s: 1_?{x^" []"}'+9#0:"5.txt" /stacks
i: 10_0:"5.txt" /instructions
d:((-1#)'s)!-1_'s
e:((-1#)'s)!-1_'s
m1: {(N;a;b):(" "\x)@1 3 5;N:.N;t:|N#d[a];d[a]:N_d[a];d[b]:t,d[b]}
m2: {(N;a;b):(" "\x)@1 3 5;N:.N;t: N#e[a];e[a]:N_e[a];e[b]:t,e[b]}
m1'i;m2'i /update dict for each line of instructions
(p1;p2): (*'.d;*'.e) /top of each stack
\d .


\d d6
/initial solution with (':) based on ngn's suggestion:
n:4
p1: n++/~|\n{n=#?x}':*0:"6.txt"
n:14;
p2: n++/~|\n{n=#?x}':*0:"6.txt"

/after reading some APL Farm inspiration (ColTim)
f:{y++/~|\y{x~?x}':*0:x}["6.txt";]
(p1;p2): f' 4 14
\d .
