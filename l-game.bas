100 rem ***********************************************
110 rem        l-game by just for the fun of it
120 rem            (c) sjef van wezel 2023
130 rem ***********************************************
140 rem
150 rem            this may be used freely.
160 rem      inform me on usage will be appriciated.
170 rem just send me a e-mail info@justforthefunofit.nl
180 rem
190 rem ***********************************************
!-
1020 print chr$(147) :rem clear screen
1021 gosub 10700     :rem show intro screen
1023 gosub 10000     :rem variable definitions and initialisations
1024 gosub 10600     :rem board and game initialisations
!-
1151 rem ****************************************
1152 rem now main loop can start
1153 rem ****************************************
!-
1156 gosub 9900                :rem attention sound key press / next player
1157 gosub 1300                :rem wait on f1 or f3 key set playmodes (pm)
!-
1158 if pm=1 then 1162         : rem playmode is move coin
1159 gosub 7000                : rem union fill current player
1160 gosub 2010                : rem replace button to move L
1161 goto 1164                 : rem skip pm=2 actions
!-
1162 cc=2:sc=-1                :rem initalise coin movement variables
1163 gosub 2000                :rem replace button to move coin
!-
1164 gosub 1520                : rem read joystick (or keyboard)
1165 if db=-1 then gosub 2490  : rem show debug information
1166 gosub 2890                : rem move pointer on Joystick input
!-
1167 if fy=0 then 1164         : rem just handle joystick input
1169 gosub 2220                : rem if fire pressed color cell (coin or play)
1170 if pm=2 and cc=4 then 1173: rem check if l-shape is created by player
1171 if pm=1          then 1178: rem player is moving a coin
1172 goto 1164                 : rem just await player movements
!-
1173 gosub 5150                : rem check if l-shape is created during play
1174 if ll<>-1 then 1164       : rem no l-shape yet just await next movement
1175 gosub 1280                : rem a l-shape was formed so change player
1176 gosub 8600                : rem remove tmp cells
1177 goto 1156                 : rem start next player
!-
!-   ********************************************
!-   set variables before coin handling check
!-   ********************************************
1178 if cc=2 and sc=0 then pm=2:gosub 2010:cc=0:goto 1158
1179 goto 1164:rem just await player movement
!-
1280 rem ****************************************
1281 rem change player
1282 rem ****************************************
1283 if ap=1 then ap=2:pm=0:cc=0:ll=0:gosub 1870:return
1284 ap=1:pm=0:cc=0:ll=0:gosub1870:return
!-
1290 rem ****************************************
1291 rem get player game sellection play or coin
1292 rem ****************************************
1300 kp$="":get kp$:if kp$="" then 1300:rem wait
1310 if asc(kp$)<>133 then if asc(kp$)<>134 then 1300
1315 if asc(kp$)= 134 then pm=1:cc=0:ll=0:rem f3 move coin mode
1320 if asc(kp$)= 133 then pm=2:cc=0:ll=0:rem f1 move l mode
1340 return
!-
1510 rem ****************************************
1511 rem end game loop, start procedure section
1512 rem ****************************************
!-
1520 rem *********************************************
1530 rem read joystick port (1)
1540 rem *********************************************
1550 j=255-peek(56321):fy=0
1560 if (j and16) then fy=-1
1570 if (j and 1) then my=my-5:rem up
1580 if (j and 2) then my=my+5:rem down
1590 if (j and 4) then mx=mx-5:rem left
1600 if (j and 8) then mx=mx+5:rem right
1610 return
!-
1620 rem **************************************
1630 rem initialize game board
1640 rem **************************************
1650 print chr$(147);:poke646,1:poke 53280,6
1655 print " just for the fun of it presents l-game":print
1660 poke 646,0:for i = 1 to 4
1670 printspc(lm)+"UCCCCCUCCCCCUCCCCCUCCCCCI"
1680 printspc(lm)+"B     B     B     B     B"
1690 printspc(lm)+"B     B     B     B     B"
1700 printspc(lm)+"B     B     B     B     B"
1710 printspc(lm)+"B     B     B     B     B":next i
1720 printspc(lm)+"JCCCCCJCCCCCJCCCCCJCCCCCK"
1730 return
!-
1800 rem **************************************
1810 rem handle player button F1/F3 if pm=0
1820 rem **************************************
1870 pm=0:poke 646,ap:pl$="one": if ap=2 then pl$="two"
1874 poke214, 1:print:poke211,27:print+chr$(18)+"UCCCCCCCCCCI"+chr$(146)
1876 poke214, 2:print:poke211,27:print+chr$(18)+"Bplayer "+pl$+"B"+chr$(146)
1878 poke214, 3:print:poke211,27:print+chr$(18)+"B f1=play lB"+chr$(146)
1880 poke214, 4:print:poke211,27:print+chr$(18)+"B f3=coin  B"+chr$(146)
1882 poke214, 5:print:poke211,27:print+chr$(18)+"JCCCCCCCCCCK"+chr$(146)
1892 return
!-
1900 rem **************************************
1910 rem handle player button move coin if pm=1
1920 rem **************************************
2000 poke 646,ap:pl$="one": if ap=2 then pl$="two"
2001 poke214, 1:print:poke211,27:print+chr$(18)+"UCCCCCCCCCCI"+chr$(146)
2002 poke214, 2:print:poke211,27:print+chr$(18)+"Bplayer "+pl$+""+chr$(146)
2003 poke214, 3:print:poke211,27:print+chr$(18)+"B now move B"+chr$(146)
2004 poke214, 4:print:poke211,27:print+chr$(18)+"B a coin   B"+chr$(146)
2005 poke214, 5:print:poke211,27:print+chr$(18)+"JCCCCCCCCCCK"+chr$(146)
2006 return
!-
2007 rem **************************************
2008 rem handle player button L if pm=2
2009 rem **************************************
2010 poke 646,ap:pl$="one": if ap=2 then pl$="two"
2011 poke214, 1:print:poke211,27:print+chr$(18)+"UCCCCCCCCCCI"+chr$(146)
2012 poke214, 2:print:poke211,27:print+chr$(18)+"Bplayer "+pl$+"B"+chr$(146)
2013 poke214, 3:print:poke211,27:print+chr$(18)+"Bup to you B"+chr$(146)
2014 poke214, 4:print:poke211,27:print+chr$(18)+"Bmove the lB"+chr$(146)
2015 poke214, 5:print:poke211,27:print+chr$(18)+"JCCCCCCCCCCK"+chr$(146)
2016 return
!-
2080 rem ******************************
2090 rem determine mx of cell selected
2100 rem ******************************
2110 if mx> 50-20 then if mx<= 50+20 then cx=1
2120 if mx>100-20 then if mx<=100+20 then cx=2
2130 if mx>150-20 then if mx<=150+20 then cx=3
2140 if mx>200-20 then if mx<=200+20 then cx=4
2150 rem ******************************
2160 rem determine my of cell selected
2170 rem ******************************
2180 if my> 68 then if my<=105 then cy=1
2190 if my>105 then if my<=145 then cy=2
2200 if my>145 then if my<=180 then cy=3
2210 if my>180 then if my<=228 then cy=4
2215 return
!-
2220 rem ******************************
2230 rem if fire pressed then color cell
2240 rem ******************************
2255 gosub 2080: rem determine cell selected
2260 gosub 6000: rem color the cell
2270 return
!-
2490 rem ************************************
2500 rem show debug info
2510 rem ************************************
2520 poke 646,1 : rem change print color to white
2540 poke214,22:print:poke211,1:printspc(5)+"                             "
2550 poke214,22:print:poke211,1:printspc(5)+"mxmypm";mx,my,pm
2560 return
!-
2680 rem ****************************************
2690 rem create mousepointer in game field
2700 rem ****************************************
2710 poke 53285,8: rem multicolor 1
2720 poke 53286,6: rem multicolor 2
2730 poke 53269,255 : rem set all 8 sprites visible
2760 poke 53287,7: rem color = 7
2770 poke 2040,ps: rem pointer
2780 mx=100:poke 53248, mx: rem mx pos
2790 my= 80:poke 53249, my: rem my pos
2800 poke 53276, 0: rem multicolor
2810 poke 53277, peek(53277) and (255-2^0): rem width small os sprite 0
2820 poke 53271, peek(53271)and (255-2^0): rem height small of sprite 0
2830 :: rem sprite 0 / singlecolor / color: 7
!-
2890 rem **********************************
2900 rem place and move mouse pointer
2910 rem **********************************
2920 if mx <  24 then mx =  24
2930 if mx > 296 then mx = 296
2940 if my <  50 then my =  50
2950 if my > 208 then my = 208
2960 rem check sprite mx horizontal overflow
2970 if mx >  255 then poke 53264, peek(53264) or 1    : rem mx (high)
2980 if mx <= 255 then poke 53264, peek(53264) and 254 : rem mx (high)
2990 rem set new coordinates on overflow
3000 poke 53248, mx and 255: rem set nex mx sprite coordinate (low)
3010 poke 53249, my        : rem set new my sprite coordinate
3015 return
!-
3140 rem ************************************
3150 rem print matrix, test only
3160 rem ************************************
3170 print "current cp":for y=1to4:for x=1to4:printcp(x,y);:next x:print:next y
3175 print "new pp    ":for y=1to4:for x=1to4:printpp(x,y);:next x:print:next y
3180 end
!-
5150 rem ******************************
5160 rem check horizontal
5170 rem - first fold in str
5180 rem - convert to decimal
5190 rem - validate agains pattern
5200 rem ******************************
5210 gosub 5550:rem copy cp to tranposed values
!-
5220 for s = 0 to 2
5230 pl$="1":p$="":t=1:if ap=2then pl$="2":rem initialise for horizontal check
5240 gosub 5860: rem fold 2 lines to byte string
5250 gosub 5390: rem convert str to decimal
5260 gosub 5470: rem check against patterns
!-
5265 if ll=-1 then s=2 : goto 5380: rem exit next loop
5300 p$="":t=2:rem initialise for transposed check
5310 gosub 5860: rem fold 2 lines to byte string
5320 gosub 5390: rem convert str to decimal
5330 gosub 5470: rem check against patterns
!-
5335 if ll=-1 then s=2: rem exit next loop
5380 nexts: rem proces next two lines of matrix
5385 return
!-
5390 rem ******************************
5400 rem convert to decimal
5410 rem ******************************
5420 v=0:for n=8to1
5430 for n=1to8
5440 if mid$(p$,n,1)= pl$ then v=v+(2^(8-n))
5450 next n
5460 return
!-
5470 rem ******************************
5480 rem validate with pattern values
5490 rem ******************************
5510 ll=0:for i=1 to 8
5520 if pv(i)=v then ll=-1
5530 next i
5540 return
!-
5550 rem ******************************
5560 rem transpose matrix playfield
5570 rem ******************************
5580 for y=4 to 1 step -1
5590 for i=1 to 4
5600 tp(5-y,i)=cp(i,y)
5610 next i
5620 next y
5630 return
!-
5860 rem ******************************
5870 rem fold 2 lines of cube to string
5880 rem ******************************
5900 for l=1 to 2
5910 for i=1 to 4
5920 if t=1 then p$=p$+chr$(48+cp(i,l+s))
5930 if t=2 then p$=p$+chr$(48+tp(i,l+s))
5940 next i
5950 next l
5970 return
!-
6000 rem *************************************
6010 rem handle coin and player cell placement
6020 rem *************************************
6080 if pm = 1 then 6091:rem playmode 1 then move coin
6081 if pm = 2 then 6101:rem playmode 2 then move to create an L shape
!-
6085 rem *************************************
6086 rem handle coin movement
6087 rem *************************************
6091 on cp(cx,cy)+1 goto 6110,6155,6155,6170:rem empty=0,play=1,play=2,coin=3 
!-
6095 rem *************************************
6096 rem handle player movement
6097 rem *************************************
6101 on cp(cx,cy)+1 goto 6230,6270,6270,6145:rem empty=0,play=1,play=2,coin=3 
!-
6104 rem *************************************
6105 rem cell was empty so coin can be placed
6106 rem *************************************
6110 if cc=2 then return :rem first remove a coin
6111 sc=0                :rem a coint was removed so start counting them
6112 cp(cx,cy)= 3        :rem place coin in cell
6120 cc=cc+1             :rem coin count placed
6130 gosub 8700          :rem place coin graphic in cell
6140 return
!-
6145 rem *************************************
6146 rem occupied by a player coin not allowed
6150 rem *************************************
6155 return: rem so do nothing
!-
6165 rem *************************************
6166 rem Clear cell a coin is already there
6167 rem *************************************
6170 cp(cx,cy)=0 : rem clear cell value
6180 cc=cc-1     : rem number of coins one down
6190 poke 646, bc: rem set background color to back
6200 gosub 6300  : rem fill cell with spaces
6210 return
!-
6220 rem *************************************
6221 rem cell was empty so player be placed
6222 rem *************************************
6230 if cc=4 then return :rem max cells reached first clean a player cell
6231 cp(cx,cy)= ap       :rem place active player value in cell
6240 poke 646, ap        :rem set color to active player
6245 cc=cc+1             :rem count cells filled by player
6250 gosub 6300          :rem color the cell using player color
6260 return
!-
6261 rem ************************************
6262 rem check if cell is current player
6263 rem ************************************
6270 if cp(cx,cy)<>ap then return:rem occupied do nothing
6281 cp(cx,cy)=0                 : rem clear cell
6282 poke 646, bc                : rem set color to background color
6283 gosub 6300                  : rem fill cell with spaces
6284 cc=cc-1                     : rem lower current player cell count
6285 return
!-
6300 rem ****************************
6310 rem fill cell with color spaces
6320 rem ****************************
6330 for i=1 to 4
6335 poke 214,-4+(cy*5)+i
6340 print
6350 poke 211,lm+1+(cx-1)+((cx-1)*5)
6360 print ib$
6370 next i
6380 return
!-
7000 rem ****************************
7010 rem union skin current player
7020 rem ****************************
7030 rem ap is active player
7040 rem walk trough matrix to determine cells
7045 gosub 7600: rem save all positions to pp
7050 for iy=1 to 4
7060 :  for ix=1 to 4
7070 if cp(ix,iy) = ap then cy=iy:cx=ix:gosub 7200:cp(ix,iy)=0
7080 next ix
7090 next iy
7110 return
!-
7200 rem ****************************
7210 rem fill cell with union skin
7220 rem ****************************
7230 poke646,p2:if ap=1 then poke646,p1:rem set cell color to activer  player
7240 for ii=1to4
7250 poke 214,-4+(cy*5)+ii
7260 print
7270 poke 211,lm+1+(cx-1)+((cx-1)*5)
7280 print ic$
7290 next ii
7300 return
!-
7500 rem ****************************
7510 rem copy opponent and coins to cp
7520 rem ****************************
7530 for ly=1to4
7540 for lx=1to4
7550 if pp(lx,ly)<>ap then cp(lx,ly)=pp(lx,ly)
7555 if pp(lx,ly)=ap then cp(lx,ly)=0
7560 next lx
7570 next ly
7580 return
!-
7600 rem ****************************
7610 rem copy cp to pp copy all
7620 rem ****************************
7630 for ny=1to4
7640 for nx=1to4
7650 pp(nx,ny)=cp(nx,ny)
7660 next nx
7670 next ny
7680 return
!-
7700 rem ****************************
7710 rem copy pp to cp (all)
7720 rem ****************************
7730 for ny=1to4
7740 for nx=1to4
7750 cp(nx,ny)=pp(nx,ny)
7760 next nx
7770 next ny
7780 return
!-
8500 rem ******************************
8510 rem set initial playfield
8520 rem ******************************
8530 for y=1 to 4
8540 for x=1 to 4
8542 cp(x,y)= val(mid$(x$(y),x,1))
8543 cx=x:cy=y
8544 if cp(x,y)= 0 then poke 646,bc          :rem set color cell to blue
8545 if cp(x,y)<>0 then poke 646,cp(x,y)     :rem set color of cell
8546 if cp(x,y)>= 3 then gosub 8730:goto 8560:rem place coin
8553 gosub 6300                              :rem cell to active player color
8560 next x
8570 next y
8580 return
!-
8600 rem *****************************
8610 rem clean playing field
8620 rem *****************************
8630 for y=1 to 4
8640 for x=1 to 4
8645 cv=cp(x,y)
8650 if cv=0 then poke646,bc:cx=x:cy=y:gosub 6300: rem hide cell
8660 next x
8670 next y
8680 return
!-
8700 rem ****************************
8710 rem place a coin in the cell
8720 rem ****************************
8730 poke646,7
8740 for ii=1to4
8750 poke 214,-4+(cy*5)+ii
8760 print
8770 poke 211,lm+1+(cx-1)+((cx-1)*5)
8780 if ii=1 then print chr$(18)+"UCCCI"+chr$(146) 
8790 if ii=2 then print chr$(18)+"BUCIB"+chr$(146) 
8800 if ii=3 then print chr$(18)+"BJCKB"+chr$(146) 
8810 if ii=4 then print chr$(18)+"JCCCK"+chr$(146) 
8820 next ii
8830 return
!-
9500 rem ****************************
9510 rem reading definitions of data
9520 rem ****************************
9530 : rem sprite 0 initialisation
9540 for x=ms to ms+63: read y: poke x,y: next x: rem sprite generation
9545 rem ****************************
9548 rem sprite data definition
9549 rem ****************************
9550 data 0,0,0,0,0,0,4,0,0,6,0,0,7,0,0,7
9560 data 128,0,7,192,0,7,224,0,7,240,0,7,248,0,7,252
9570 data 0,7,254,0,7,254,0,7,240,0,7,240,0,6,112,0
9580 data 4,120,0,0,56,0,0,24,0,0,0,0,0,0,0,7
9600 rem ******************************
9610 rem read initial playfield pattern
9620 rem ******************************
9630 for y=1 to 4: read x$(y):next y
9640 rem ******************************
9650 rem playfield pattern data
9660 rem ******************************
9670 data "0223"
9680 data "0120"
9690 data "0120"
9700 data "3110"
!-
9710 rem ******************************
9720 rem initialize pattern and compare
9730 rem ******************************
9740 for d=1 to 8:read pv(d):next d
9750 data 232,226,142,46,113,71,116,23
!-
9800 rem ******************************
9810 rem read sound effect data
9820 rem ******************************
9830 for s=1 to 3 : read sl(s),sh(s): next s :rem read tones
9835 rem ******************************
9838 rem simple tones data
9839 rem ******************************
9840 data 208,18,160,30,208,18
9850 rem
9860 rem ******************************
9870 rem end of data definitions
9880 rem ******************************
9890 return
!-
9900 rem ******************************
9902 rem play sound
9904 rem ******************************
9906 for r=54272 to 54296: poke r,0 : next : rem clear sound registers
9908 poke 54296,15 : rem turn on volume
9910 poke 54275,8:poke 54277, 0:poke 54278,240 :rem initialize registers
9912 for s = 1 to 3
9914 poke 54272,sl(s): poke 54273, sh(s) : rem poke tone values into voice 1
9916 poke 54276,65 :rem enable tone register
9918 for r=0 to 62: next r : rem play tone for 1/4 second
9920 next s
9922 poke 54276,64 : rem turn sound register off
9924 poke 54296,0  : rem turn volume off
9926 return

10000 rem *************************************
10010 rem Variable initialisation / definitions
10020 rem *************************************
!-
10030 dim cp(4,4) :rem current playfield (during turn)
10040 dim pp(4,4) :rem previous playfield (before turn)
10050 dim sl(4)   :rem sound effect low values
10055 dim sh(4)   :rem sound effect high values
10060 dim x$(4)   :rem to store initial playfield pattern

!-
10070 lm=1        :rem left margin of screen
10080 pm=.        :rem play mode (move l=1 or move c=2, 0=undetermined)
10090 ll=.        :rem variable for detection of the l-form in the play
10100 mx=.        :rem joystick x position
10110 my=.        :rem joystick y position
10120 fy=0        :rem joystick fire-pressed
10130 kp$=""      :rem variable to check pressed key
10140 db=0        :rem set 1 for debug mode
10150 pc=.        :rem counter for number of cells drawn in one trun
10160 p1=1        :rem color of players 1
10170 p2=2        :rem color of players 2
10180 ap=1        :rem active player start with player one
10190 iu=ap       :rem indicator for marking current positons of player
10210 bc=6        :rem color of blank cell equal to background color
10220 cc=.        :rem cell count (value to count id 5 cells are marked)
10222 ms=832      :rem sprite memory startadres
10224 ps=13       :rem sprite pointer to startadres (13x64=832)
!-
10230 ic$= chr$(18)+" "+chr$(166)+chr$(166)+chr$(166)+chr$(166)
10240 ib$= chr$(18)+"     ":rem cell rows 5 inverse spaces
!-
10270 rem ****************************************
10280 rem variables l-shape validation routines
10290 rem ****************************************
10300 dim tp(4,4):rem transposed playfield for pattern matching
10310 dim pl$    :rem player indicator
10320 dim pv(8)  :rem pattern values
10330 dim t      :rem transpose 1=normal 2=transposed
!-
10500 return
!-
10600 rem ****************************************
10610 rem Program game bord initialisation
10620 rem ****************************************
10630 gosub 9500:rem read all data definitions (sprite,sound,playfield,pattern)
10640 gosub 1620:rem initialise game bord
10650 gosub 2680:rem create mouse pointer and place on gamebord
10660 gosub 8500:rem set start positions of L shapes 
10670 gosub 1870:rem place action info button (f1=play, f3=move coin)
10680 return

10700 rem ****************************************
10710 rem instruction part of the l-game
10720 rem ****************************************
!-
10730?chr$(147):?:poke646,1
10740?" EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
10750?" VVV V V VVV   V   VVVV  V  V   V VVV "
10760?"  V  V V V     V   V    V V VVVVV V "
10770?"  V  VVV VV    V V V VV VVV V V V VV"
10780?"  V  V V V     V   V  V V V V   V V"
10790?"  V  V V VVV   VVV VVVV V V V   V VVV"
10800?" RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR":poke646,8
10810?"      by: sjef van wezel (c)2023"
10820?"       www.justforthefunofit.nl":poke646,1
10830?" EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
10840?" gameplay:"
10850?
10860?" this l-game is a two-player game"
10870?" each player has 4 pieces that needs to "
10880?" form a l-shape. there are 2 coins that"
10890?" can be used to block the other player"
10900?" only one coin can be moved in a turn."
10910?" a move is only valid if a l-shape is"
10920?" formed and at least one cell in that"
10930?" move is changed." :?
10940 poke646,0
10950?"   press any key to start the game":poke646,1:?
10960?" original game idea edward de bone 1967";
10970 kp$="":get kp$:if kp$="" then 10970:rem wait on a key
10980 return

