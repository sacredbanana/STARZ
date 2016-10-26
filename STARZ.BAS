'STARZ by Cameron Armstrong

gosub setup

label loop
gosub drawstars
gosub setstars
goto loop

label setup
open window 640,512
window origin "lb"
'MAX STARS=76573
numstars=20
starsize=1
dim x(numstars),y(numstars),z(numstars),zz(numstars),zzz(numstars)
for a=1 to numstars
x(a)=ran(640)-320
y(a)=ran(512)-256
z(a)=ran(10)-5
zz(a)=ran(1000)
next a
return

label drawstars
setdrawbuf dw
clear window
for a=1 to numstars
setrgb 1,2000/zz(a)+100,2000/zz(a)+100,2000/zz(a)+100
fill rectangle cos(angle)*(20*x(a)*z(a)/zz(a))+320-(20/zz(a)),cos(angle)*(20*y(a)*z(a)/zz(a))+256-(20/zz(a)) to cos(angle)*(20*x(a)*z(a)/zz(a))+starsize+320+(20/zz(a)),cos(angle)*(20*y(a)*z(a)/zz(a))+starsize+256+(20/zz(a))
next a
setdispbuf dw
dw=1-dw
return

label setstars
for a=1 to numstars
zz(a)=zz(a)-1-speed
if peek("port1")=16 speed=speed+.01
if peek("port1")=64 speed=speed-.01
if peek("port1")=128 angle=angle-.001
if peek("port1")=32 angle=angle+.001
if zz(a)>1000 zz(a)=0
if x(a)*z(a)*20/zz(a)+320>640 or x(a)*z(a)*20/zz(a)+320<0 or 20*y(a)*z(a)/zz(a)+256>512 or 20*y(a)*z(a)/zz(a)+256<0 then
x(a)=ran(640)-320
y(a)=ran(512)-256
z(a)=ran(10)
zz(a)=ran(1000)
fi
next a
return




