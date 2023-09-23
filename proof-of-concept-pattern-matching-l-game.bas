100 rem *****************************
110 rem variable definitions 
120 rem *****************************
130 dim cp(4,4):rem game matrix 
140 dim tp(4,4):rem transposed matrix 
150 dim pl$    :rem player indicator
160 dim pl(8)  :rem pattern values
170 dim trp    :rem 1=norm 2=transposed
180 dim row    :rem row indicator
190 dim pc     :rem player indicator
200 dim dv     :rem decimal bit pattern
210 dim bp$    :rem bit string pattern
220 dim l,i,x,y:rem a few counters
230 :
1150 rem ******************************
1160 rem set initial playfield
1170 rem ******************************
1180 for y = 1 to 4 : read x$
1190 :  for x = 1 to 4
1200 :    cp(x,y) = val (mid$ (x$,x,1))
1210 :  next x
1220 next y
1240 data "0220"
1250 data "0020"
1260 data "1020"
1270 data "1110"
1280 :
1300 rem ******************************
1310 rem initialize pattern compare
1320 rem ******************************
1330 for i = 1 to 8 :read pl(i):next i
1340 data 232,226,142,46,113,71,116,23
1350 :
1400 rem ******************************
1410 rem print pattern to visualise it
1420 rem ******************************
1430 for y = 1 to 4 
1440 :  for x = 1 to 4
1450 :    print cp(x,y);
1460 :  next x
1470 :  print
1480 next y 
1490 print
1500 :
1505 rem ******************************
1510 rem transpose matrix playfield
1520 rem ******************************
1530 for y = 4 to 1 step - 1
1540 :  for x = 1 to 4
1550 :     tp(5-y,x) = cp(x,y)
1560 :   next x
1570 next y
1580 :
1600 rem *****************************
1610 rem print pattern to visualise it
1620 rem *****************************
1630 for y = 1 to 4 
1640 :  for x = 1 to 4
1650 :    print tp(x,y);
1660 :  next x
1670 :  print
1680 next y 
1690 print
1700 :
!-
2050 rem *****************************
2060 rem this is the main routine to
2065 rem validate the matrix, then
2068 rem validate horizontal patterns. 
2069 rem for both players.
2070 rem then in transposed matrix.
2100 rem *****************************

!-
2110 for trp=1 to 2     :rem current and transposed matrix
2120 : for row = 0 to 2 :rem check rows in matrix
2130 :   gosub 2690     :rem fold 2 lines to byte string
2140 :   for pc=1 to 2  :rem do this for player one and two
2150 :      gosub 2210  :rem convert str to decimal
2160 :      gosub 2310  :rem check against all possible l-patterns
2170 :   next pc        :rem next player 
2180 : next row         :rem next two rows in matrix
2190 next trp           :rem validate again in transposed matrix
2200 end                   

!-
2210 rem *****************************
2220 rem set bit pattern to decimal
2230 rem *****************************
2240 pl$ =  chr$(48+pc) : rem set player string
2250 print:print"play:";pl$;" pattern:";bp$;" val:";  
2260 dv = 0 
2270 for i = 1 to 8
2280 :  if mid$ (bp$,i,1) = pl$ then dv=dv+(2^(8-i))
2290 next i
2300 print dv; 
2305 return

!-
2310 rem *****************************
2320 rem validate folded against value
2330 rem *****************************
2340 for i = 1 to 8
2350 :  if pl(i) = dv then print "match";
2360 next i
2370 return


!-
2690 rem *****************************
2700 rem fold the 2 lines to string
2710 rem *****************************
2720 bp$ = ""
2730 for l = 1 to 2
2740 :  for x = 1 to 4
2750 :    if trp = 1 then bp$ = bp$ + chr$ (48 + cp(x,l+row))
2760 :    if trp = 2 then bp$ = bp$ + chr$ (48 + tp(x,l+row))
2770 :  next x
2780 next l
2790 return

