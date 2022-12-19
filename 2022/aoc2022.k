/
https://adventofcode.com/2022/
ProTip: "script, read thyself"
https://ngn.codeberg.page/k/#eJzT5zI2MDY35jIyNTU04jIzNTY24jI2NjWx5DI2NbY04Irh4jKM1zWM16iJqVO2UteMN7BKSCxKL1Mw5AIATgoMlg==
\

\d d1
/everything right of the first dot (.) is from Garklein on The APL Farm discord:
/https://discord.com/channels/821509511977762827/821511172305846322/1048000541722165338
p1:    *{x@>x}(.'"++"\"+"/0:"1.txt")
p2: +/3#{x@>x}(.'"++"\"+"/0:"1.txt")


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


\d d3
p: {$[x<"a";x-38;x-96]} /case-based score
p1: +/{p@{*(^x?)_y}/2 0N#x}'0:"3.txt" /common letter in each line
p2: +/(p@*{x(0N=)_x?y}/)'0N 3#0:"3.txt"


\d d4
p1: +/({(((#y)=+/~^x?y)|(#x)=+/~^y?x)}/({x+!(y+1-x)}/ .' "-"\)'","\)'0:"4.txt"
p2: +/({|/~^x?y}/(({x+!(y+1-x)}/.' "-"\)'","\)@)'0:"4.txt"


\d d5
s: 1_?{x^" []"}'+9#0:"5.txt" /stacks
i: 10_0:"5.txt" /instructions
d: ((-1#)'s)!-1_'s
m: {(N;a;b):(" "\y)@1 3 5;N:.N;t:x N#e[a];e[a]:N_e[a];e[b]:t,e[b]} /more help from ColTim
e:d;m[|:;]'i; p1: *'.e
e:d;m[::;]'i; p2: *'.e


\d d6
/initial solution with (':) based on ngn's suggestion:
n:4
p1:n++/~|\n{n=#?x}':*0:"6.txt"
n:14;
p2:n++/~|\n{n=#?x}':*0:"6.txt"
f:{y++/~|\y{x~?x}':*0:x}["6.txt";] /after reading some APL Farm inspiration (ColTim)
(p1;p2): f'4 14


\d d7
/I still feel like it should be possible to sum the sub-directories and somehow
/add them to their parent, but things I tried didn't work so well.
nope: (,0;!0){$["."=*x;(-1_s;t,-1#s);(t;+/0^`I$" "\x)]}/"cd "\ " "/0:"7.txt" /didn't work
/This solution does work, but credit is due mostly to shadowninja55 and ngn.
/https://github.com/shadowninja55/advent-of-code/blob/main/2022/07/7.k (shadowninja's solution)
/https://codeberg.org/ngn/k/src/branch/master/aoc/22/07.k (ngn's solution)
/with minor optimizations (no "cd /")
f: {(s;t):x; $["$ cd .."~y;(-1_s;t,-1#s); "$ cd"~4#y;(s,0;t); (s+0^`I$*" "\y;t)]}
t: ,/(,0;!0)f/i:0:"7.txt"
p1: +/(1e5>)#t
p2: &/((-4e7+|/t)>)_t


\d d8
i: .''0:"8.txt" /actual input
e: .''5 5#"3037325512653323354935390" /example input
g: {>':'|\'x}
e1: {~~+/{x{|+x}/g x{+|x}/y}[;x]'!4}e /inner mask for example input
e2: {4{1,'+|x}/(({-2+(#x),#*x}x)#0)}e /outer mask for example input

m1: {~~+/{x{|+x}/g x{+|x}/y}[;x]'!4}i /inner mask
m2: {4{1,'+|x}/(({-2+(#x),#*x}x)#0)}i /outer mask
p1: +//(m1*~m2)+~~m2

/part 2 seems to need a very different approach
/looking to the right of coordinate (x,y) can be
/ e[;y] /column
/ e[x;] /row
/but I can get all the (row;column) from the inner mask e1:
/ &~e2 /rows;columns
/ ((r1;c1);(r2;c2);...): {(e[x 0;];e[;x 1])}'+&~e2
/once you have a (row;col) and the index of the tree in question,
/compute its scenic score
/ |/(*/'({(-1+#x)&/1+&~1_x<*x}''{(r;c):y;(R;C):(x[r;];x[;c]);(|(c+1)#R;c_R;|(r+1)#C;r_C)}[e;]'+&~e2))@!9
rc: {(r;c):y;(R;C):(x[r;];x[;c]);(|(c+1)#R;c_R;|(r+1)#C;r_C)}[i;]'+&~m2 /get (i,row;i,col) for each index
p2: |/*/'({(-1+#x)&/1+&~1_x<*x}''rc) /compute scenic score given (index;row;col)


\d d9
s: 5 5#0 /initial state - H and T start in its center (2;2)
R: {&x="H"} /within grid x, move H right by y
shp: {-1_#:'*:\x} /shape of x
b:5 6#"........................s.TH.." /example board
e:";"\"R 4;U 4;L 3;D 1;R 4;D 1;L 5;R 2" /example moves


\d d10
n:0
/prepared example input (compressed to fit ngn/k repl size limit)
e:";"\"15;-11;6;-3;5;-1;-8;13;4;n;-1;5;-1;5;-1;5;-1;5;-1;-35;1;24;-19;1;16;-11;n;n;21;-15;n;n;-3;9;1;-3;8;1;5;n;n;n;n;n;-36;n;1;7;n;n;n;2;6;n;n;n;n;n;1;n;n;7;1;n;-13;13;7;n;1;-33;n;n;n;2;n;n;n;8;n;-1;2;1;n;17;-9;1;1;-3;11;n;n;1;n;1;n;n;-13;-19;1;3;26;-30;12;-1;3;1;n;n;n;-9;18;1;2;n;n;9;n;n;n;-1;2;-37;1;3;n;15;-21;22;-6;1;n;2;1;n;-10;n;n;20;1;2;2;-6;-11;n;n;n"
X:.'e     /raw values
c:+\1+~~X /cycles
+/{x*-1#1+\(*&~x>c)#X}'20 60 100 140 180 220 /example

p: {+/0^`I$" "\x} /parse the real deal
X: p'0:"10.txt" /parsed values
c: +\1+~~X /cycles
p1: +/{x*-1#1+\(*&~x>c)#X}'20 60 100 140 180 220

/part2 - draw pixels on a grid
X:.'e     /raw (example) values
c: -1_1,/#/'+((1+~~X);1+\X) /sprite position at each cycle
/do any of the 3 sprite pixels (centered on current position) overlap with current pixel?
e2: ".#"0N 40#{+/'x='(!3)+/:40!!#x}@c

/now for the real deal - it's off by 1 for some reason, but still legible.
X: p'0:"10.txt" /parsed values
c: -1_1,/#/'+((1+~~X);1+\X) /sprite position at each cycle
p2: ".#"0N 40#{+/'x='(!3)+/:40!!#x}@c


\d d11
\d d12
\d d13
\d d14
\d d15
\d d16
\d d17
\d d18

g: {(3#2+|//x)#0} /make a grid
d3: {(x;+'x;++'x)}
s: {+/~~-':'x}
sim: {.[x;y;:;1]} /3d grid with 1 at each xyz cube location
e:.'" "\"2,2,2 1,2,2 3,2,2 2,1,2 2,3,2 2,2,1 2,2,3 2,2,4 2,2,6 1,2,5 3,2,5 2,1,5 2,3,5"
+//s'd3 sim/[g e+1;e]

data: .'0:"18.txt"

/ sim: {.[x;y;:;1]}/[gd;data] /simulated environment, each cube location contains a 1
p1: +//s'd3 sim/[g data+1;data]



\d d19
\d d20
\d d21
\d d22
\d d23
\d d24
\d d25
