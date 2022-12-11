/
https://adventofcode.com/2022/

ProTip:
"script, read thyself"
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
d:((-1#)'s)!-1_'s
m: {(N;a;b):(" "\y)@1 3 5;N:.N;t:x N#e[a];e[a]:N_e[a];e[b]:t,e[b]} /more help from ColTim
e:d;m[|:;]'i; p1: *'.e
e:d;m[::;]'i; p2: *'.e


\d d6
/initial solution with (':) based on ngn's suggestion:
n:4
p1: n++/~|\n{n=#?x}':*0:"6.txt"
n:14;
p2: n++/~|\n{n=#?x}':*0:"6.txt"
f:{y++/~|\y{x~?x}':*0:x}["6.txt";] /after reading some APL Farm inspiration (ColTim)
(p1;p2): f'4 14


\d d7
/TODO
/ e:("$ cd /";"$ ls";"dir a";"14848514 b.txt";"8504156 c.dat";"dir d";"$ cd a";"$ ls";"dir e";"29116 f";"2557 g";"62596 h.lst";"$ cd e";"$ ls";"584 i";"$ cd ..";"$ cd ..";"$ cd d";"$ ls";"4060174 j";"8033020 d.log";"5626152 d.ext";"7214296 k")
/
/ my original attempt - may not account for nested directories
cut:{"cd "\ " "/x}
f:{$["."=*x;[v,:-1#s;s::-1_s];s,:+/0^`I$" "\x]}
v:,0; s:!0; f'cut@e
v:,0; s:!0; f'cut@0:"7.txt"
\

/
/ ngn's solution from https://codeberg.org/ngn/k/raw/branch/master/aoc/22/07.k
/ #!/usr/bin/env k
i:0:"7.txt"
s:,0 /stack: current sizes of ancestors of current directory
t:!0 /total sizes of already visited directories
/ {$["$ cd .."~x;[t,:-1#s;s::-1_s]; "$ cd "~5#x;s,:0; ~"0:"'*x;s+:.*" "\x]}'i;
{$["$ cd .."~x;[t,:-1#s;s::-1_s]; "$ cd "~5#x;s,:0; s+:+/0^`I$" "\x]}'i;

{$["$ cd .."~x;[t,:-1#s;s::-1_s] /up a directory, t,:s.pop()
   "$ cd /" ~x;[t,: 1_s;s:: 1#s] /root
   "$ cd "~5#x;s,:0              /any other directory, s,:0
   ~"0:"'*x;s+:.*" "\x]}'i;      /file, add this file's size to whole stack
t,:s / 25094 25094 238081 997631 156396 156396 230981 508888 279834 395875 33372 1106626 34310 1839741 2046254 3739140 102403 219183 219183 141177 495281 5336501 312723 6390337 271008 119088 390096 608354 183661 85871 85871 577608 2135512 58678 58678 58678 436155 1165981 622624 127844 127844 2297271 15229 185362 290023 12772 12772 12772 674735 48696 124670 194548 193706 90049 283755 1048772 2198892 498936 121726 108233 183892 34417 34417 224596 224596 551807 408203 36358 7924 190752 1375469 417697 164446 3113872 3903058 4212300 6495349 141492 141492 1037605 487638 776573 269563 198725 799927 59244 552790 126255 1045454 270481 289817 2647196 479129 249569 232389 328734 316145 316145 446294 1827527 247235 2553891 117412 301735 466990 466990 3788101 603334 98744 98744 294624 4827179 497443 305042 8679207 953933 21420854 30005381 252054 299381 222662 522043 138921 224805 1164439 60445 60445 165502 1885602 239139 239139 505240 792678 143929 128440 272369 124512 339337 463849 1768035 3785411 34676561 376261 198026 574287 119834 320007 43395 188462 199814 305736 366178 954599 132083 730062 66475 555011 224155 2392959 214776 73557 128962 260384 1520301 255325 244185 140890 140890 660778 415928 276847 1140916 3949162 572715 98803 326788 534993 253884 1176081 290671 2985130 18543
+/(1e5>)#t       /part1 (1449447)
&/((-4e7+*s)>)_t /part2 (8679207)
\

/ s:,0;t:!0;{$["$ cd .."~x;[t,:-1#s;s::-1_s];"$ cd "~5#x;s,:0;~"0:"'*x;s+:.*" "\x;]}'i;

/https://github.com/shadowninja55/advent-of-code/blob/main/2022/07/7.k (shadowninja's solution)
/ with minor optimizations (no "cd /")
f:{(s;t):x; $["$ cd .."~y;(-1_s;t,-1#s); "$ cd"~4#y;(s,0;t); (s+0^`I$*" "\y;t)]}
t:,/(,0;!0)f/i:0:"7.txt"
p1:+/(1e5>)#t
p2:&/((-4e7+|/t)>)_t

/ stuff that didn't work...
/ /sliding window(2), if last=0 push first
/ s:1_" $ "\'"$ cd "\" "/e /split when changing directories (discard first because it is empty)
/ / cd X => push sum of X's contents
/ / cd .. => top of stack += pop()
/ k:() /empty stack
/ p: {k:((*x;0);k)} /push (name;0) on stack (name ; sum of sizes so far)
/ m: {k[0]+:(" "\x[1])} /sum contents of current folder
/ {} /pop (cd ..)

/ s: {~^.(*x)^"$dir"}'i:" "\'0:"7.txt" /input, indices of sizes
/ d: (*|)'(i@&~s)@-1+&{"ls"~*|x}'i@&~s /directories


\d d8
i:.''0:"8.txt" /actual input
e:.''5 5#"3037325512653323354935390" /example input
r:4{(+|x)}\e /all rotations


\d d9
\d d10
\d d11
\d d12
\d d13
\d d14
\d d15
\d d16
\d d17
\d d18
\d d19
\d d20
\d d21
\d d22
\d d23
\d d24
\d d25
