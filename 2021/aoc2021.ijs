NB. https://adventofcode.com/2021
d01p1=:+/2</\    ".&>cutLF fread'1.txt'
d01p2=:+/2</\3+/\".&>cutLF fread'1.txt'

d02p1=:x:*/+/+.+/                   (".@{:*(0j1^i:1)*'ufd'={.);._2]1!:1<'2.txt'
d02p2=:x:*/+/a,.a*+/\b+c['a b c'=:|:(".@{:*1 _1 1*'fud'={.);._2]1!:1<'2.txt'

d03p1=:*/#.(,:-.)>/(+/"2@,:-.)"."0;._2]1!:1<'3.txt'
d03p2=:{{c=.{{while.1<#y do.y=.y#~(x{"1 y)=x{u/(+/"2@,:-.)y
 x=.>:x end.#.y}}
((0>:c])*0<c])"."0;._2 y}}1!:1<'3.txt'

m =: ".>{.f =: cutLF fread'4.txt'
b =: >>L:1]_5<\".&.>}.f
mm =: m{{q=.0$0 for_i.i.#x do.q=.q,<(,(1)=+/)+./"1((5=+/"1)+.5=+/"2)+/(i{.x)="0 _ y end.>q}}b
wb =: b{~{.I.-.*/}:"1 mm{~(,<:)w=:{.I.{:"1 mm
d04p2 =: ((<:w){m)*+/,wb*-.+/(w{.m)="0 _ wb

f =: ".,>cutLF fread'7.txt'
d07p1 =: {{<./+/y(|@-)"0 1 y}}f
ii =: [:+/>:@i.
d07p2 =: {{+/ii"0|y-{./:+/y ii@|@-"0 _ i.>./y}}f