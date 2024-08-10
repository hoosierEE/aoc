\d d1
input:0:"1/input.txt"
f1:{+/({.(*x),*|x}("0:"')_)'x}
`0:"d1/p1: ",$f1 input
d:" "\"one two three four five six seven eight nine"
di: d!$!9
f2:{a:x;(b;c):{i:&/x;j:*d@<x;(i,i+#j;di@j)}{*#'x\y}\:[d;]a;:[(#a)>&/b;?[a;b;c];a]}
`0:"d1/p2: ",($f1@f2/'input)," (too low)" /56001 "too low"

ss:{&y~/:(#y)':x} /string search


/ f1@" "\{"1"/"one"\"2"/"two"\"3"/"three"\"4"/"four"\"5"/"five"\"6"/"six"\"7"/"seven"\"8"/"eight"\"9"/"nine"\x}@" "/input
/ {($di x)/x\e}'d

t:"two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen"
s:"eightwothree"

`0:"example: ",$f1@f2/'" "\t

/ discodoug's solution
ds:"/"\"zero/one/two/three/four/five/six/seven/eight/nine"
fln:{ds{+|&x{x~/:(#x)':y}\:y}/:x}
fld:{+&"0123456789"=/:x}'
+/(10/*|+*'1|:\@/1<:\)'fld@input
+/(10/*|+*'1|:\@/1<:\)','/(fld;fln)@\:input
