1000 rem ***********************************************
1010 rem        l-game by just for the fun of it
1020 rem            (c) sjef van wezel 2023 
1030 rem ***********************************************
1040 rem      (code for use via cbm prg studio )
1050 rem            this may be used freely.
1060 rem      inform me on usage will be appriciated.
1070 rem just send me a e-mail info@justforthefunofit.nl
1072 rem
1075 rem use l-game-6.prg to run directly on commodore 64
1080 rem ***********************************************
1085 rem change history:
1086 rem 25-9-2023
1088 rem - corrected the rules (move coin as step 2)
1089 rem - corrected the starting position
1090 rem ***********************************************
!-
1100 print chr$(147) :rem clear screen
1110 gosub 5750     :rem show intro screen
1120 gosub 5310     :rem variable definitions and initialisations
1130 gosub 5660     :rem board and game initialisations
!-
1140 rem ****************************************
1150 rem now main loop can start
1160 rem ****************************************
!-
1170 gosub 5170                : rem attention sound key press / next player
1190 if pm=1 then 1230         : rem playmode is move coin
1200 gosub 3870                : rem union fill current player
1210 gosub 2020                : rem replace text with  move L
1220 goto 1250                 : rem skip coin actions
1230 cc=2:sc=-1                : rem initalise coin movement variables
1240 gosub 1890                : rem replace text with move coin
!- 
1250 gosub 1560                : rem read joystick (or keyboard)
1270 :  gosub 2510             : rem move pointer on Joystick input
1280 if fy=0 then 1250         : rem no fire then just handle joystick input
!-
1290 gosub 2240                : rem fire pressed so color cell (coin or play)
1300 if pm=2 and cc=4 then 1330: rem check if l-shape is created by player
1310 if pm=1          then 1380: rem player is moving a coin
1320 goto 1250                 : rem just await player movements
!-
1330 gosub 2710                : rem check if l-shape is created during play
1340 if ll<>-1 then 1250       : rem no l-shape yet just await next movement
1342 gosub 4520                : rem remove tmp cells
!-
1345 gosub 1790                : rem replace text to f1 or f3 
1346 gosub 1480                : rem ask to play coin of next player
!-
1349 if pm=2 then gosub 1400: goto 1170 :rem next player redo loop
1360 goto 1230                 : rem  move coin
!-
1371 rem ********************************************
1372 rem set variables before coin handling check
1373 rem ********************************************
1380 if cc=2 and sc=0 then pm=2:gosub 1400:gosub 2020:cc=0:goto 1190
1390 goto 1250:rem just await player movement
!-
1400 rem ****************************************
1410 rem change player
1420 rem ****************************************
1430 if ap=1 then ap=2:pm=2:cc=0:ll=0:gosub 1990:return
1440 ap=1:pm=2:cc=0:ll=0:gosub 1990:return
!-
1450 rem ****************************************
1460 rem get player game sellection play or coin
1470 rem ****************************************
1480 kp$="":get kp$:if kp$="" then 1480:rem wait
1490 if asc(kp$)<>133 then if asc(kp$)<>134 then 1480
1500 if asc(kp$)= 134 then pm=1:cc=0:ll=0:rem f3 move coin mode first
1510 if asc(kp$)= 133 then pm=2:cc=0:ll=0:rem f1 skip coin move next player
1520 return
!-
1530 rem ****************************************
1540 rem end game loop, start procedure section
1550 rem ****************************************
!-
1560 rem *********************************************
1570 rem read joystick port (1)
1580 rem *********************************************
1590 j=255-peek(56321):fy=0
1600 if (j and16) then fy=-1
1610 if (j and 1) then my=my-5:rem up
1620 if (j and 2) then my=my+5:rem down
1630 if (j and 4) then mx=mx-5:rem left
1640 if (j and 8) then mx=mx+5:rem right
1650 return
!-
1660 rem **************************************
1670 rem initialize game board
1680 rem **************************************
1690 print chr$(147);:poke646,1:poke 53280,6
1700 print " just for the fun of it presents l-game":print
1710 poke 646,0:for i = 1 to 4
1720 printspc(lm)+"UCCCCCUCCCCCUCCCCCUCCCCCI"
1730 printspc(lm)+"B     B     B     B     B"
1740 printspc(lm)+"B     B     B     B     B"
1750 printspc(lm)+"B     B     B     B     B"
1760 printspc(lm)+"B     B     B     B     B":next i
1770 printspc(lm)+"JCCCCCJCCCCCJCCCCCJCCCCCK"
1780 return
!-
1790 rem **************************************
1800 rem handle player button F1/F3 if pm=0
1810 rem **************************************
1820 pm=0:poke 646,ap:pl$="one": if ap=2 then pl$="two"
1830 poke214, 1:print:poke211,26:print+chr$(18)+"UCCCCCCCCCCCI"+chr$(146)
1840 poke214, 2:print:poke211,26:print+chr$(18)+"Bplayer  "+pl$+"B"+chr$(146)
1850 poke214, 3:print:poke211,26:print+chr$(18)+"Bmove coin? B"+chr$(146)
1860 poke214, 4:print:poke211,26:print+chr$(18)+"B f1=n f3=y B"+chr$(146)
1870 poke214, 5:print:poke211,26:print+chr$(18)+"JCCCCCCCCCCCK"+chr$(146)
1880 return
!-
1890 rem **************************************
1900 rem handle player button move coin if pm=1
1910 rem **************************************
1920 poke 646,ap:pl$="one": if ap=2 then pl$="two"
1930 poke214, 1:print:poke211,26:print+chr$(18)+"UCCCCCCCCCCCI"+chr$(146)
1940 poke214, 2:print:poke211,26:print+chr$(18)+"Bplayer  "+pl$+"B"+chr$(146)
1950 poke214, 3:print:poke211,26:print+chr$(18)+"B now move  B"+chr$(146)
1960 poke214, 4:print:poke211,26:print+chr$(18)+"B a coin    B"+chr$(146)
1970 poke214, 5:print:poke211,26:print+chr$(18)+"JCCCCCCCCCCCK"+chr$(146)
1980 return
!-
1990 rem **************************************
2000 rem handle player button L if pm=2
2010 rem **************************************
2020 poke 646,ap:pl$="one": if ap=2 then pl$="two"
2030 poke214, 1:print:poke211,26:print+chr$(18)+"UCCCCCCCCCCCI"+chr$(146)
2040 poke214, 2:print:poke211,26:print+chr$(18)+"Bplayer  "+pl$+"B"+chr$(146)
2050 poke214, 3:print:poke211,26:print+chr$(18)+"Bup to you  B"+chr$(146)
2060 poke214, 4:print:poke211,26:print+chr$(18)+"Bmove the l B"+chr$(146)
2070 poke214, 5:print:poke211,26:print+chr$(18)+"JCCCCCCCCCCCK"+chr$(146)
2080 return
!-
2090 rem ******************************
2100 rem determine mx of cell selected
2110 rem ******************************
2120 if mx> 50-20 then if mx<= 50+20 then cx=1
2130 if mx>100-20 then if mx<=100+20 then cx=2
2140 if mx>150-20 then if mx<=150+20 then cx=3
2150 if mx>200-20 then if mx<=200+20 then cx=4
2160 rem ******************************
2170 rem determine my of cell selected
2180 rem ******************************
2190 if my> 68 then if my<=105 then cy=1
2200 if my>105 then if my<=145 then cy=2
2210 if my>145 then if my<=180 then cy=3
2220 if my>180 then if my<=228 then cy=4
2230 return
!-
2240 rem ******************************
2250 rem if fire pressed then color cell
2260 rem ******************************
2270 gosub 2090: rem determine cell selected
2280 gosub 3250: rem color the cell
2290 return
!-
2300 rem ************************************
2310 rem show debug info
2320 rem ************************************
2330 poke 646,1 : rem change print color to white
2340 poke214,22:print:poke211,1:printspc(5)+"                             "
2350 poke214,22:print:poke211,1:printspc(5)+"mxmypm";mx,my,pm
2360 return
!-
2370 rem ****************************************
2380 rem create mousepointer in game field
2390 rem ****************************************
2400 poke 53285,8: rem multicolor 1
2410 poke 53286,6: rem multicolor 2
2420 poke 53269,255 : rem set all 8 sprites visible
2430 poke 53287,7: rem color = 7
2440 poke 2040,ps: rem pointer
2450 mx=100:poke 53248, mx: rem mx pos
2460 my= 80:poke 53249, my: rem my pos
2470 poke 53276, 0: rem multicolor
2480 poke 53277, peek(53277) and (255-2^0): rem width small os sprite 0
2490 poke 53271, peek(53271)and (255-2^0): rem height small of sprite 0
2500 :: rem sprite 0 / singlecolor / color: 7
!-
2510 rem **********************************
2520 rem place and move mouse pointer
2530 rem **********************************
2540 if mx <  24 then mx =  24
2550 if mx > 296 then mx = 296
2560 if my <  50 then my =  50
2570 if my > 208 then my = 208
2580 rem check sprite mx horizontal overflow
2590 if mx >  255 then poke 53264, peek(53264) or 1    : rem mx (high)
2600 if mx <= 255 then poke 53264, peek(53264) and 254 : rem mx (high)
2610 rem set new coordinates on overflow
2620 poke 53248, mx and 255: rem set nex mx sprite coordinate (low)
2630 poke 53249, my        : rem set new my sprite coordinate
2640 return
!-
2650 rem ************************************
2660 rem print matrix, test only
2670 rem ************************************
2680 print "current cp":for y=1to4:for x=1to4:printcp(x,y);:next x:print:next y
2690 print "new pp    ":for y=1to4:for x=1to4:printpp(x,y);:next x:print:next y
2700 end
!-
2710 rem ******************************
2720 rem check horizontal
2730 rem - first fold in str
2740 rem - convert to decimal
2750 rem - validate agains pattern
2760 rem ******************************
2770 gosub 3060:rem copy cp to tranposed values
!-
2780 for s = 0 to 2
2790 pl$="1":p$="":t=1:if ap=2then pl$="2":rem initialise for horizontal check
2800 gosub 3150: rem fold 2 lines to byte string
2810 gosub 2910: rem convert str to decimal
2820 gosub 2990: rem check against patterns
!-
2830 if ll=-1 then s=2 : goto 2890: rem exit next loop
2840 p$="":t=2:rem initialise for transposed check
2850 gosub 3150: rem fold 2 lines to byte string
2860 gosub 2910: rem convert str to decimal
2870 gosub 2990: rem check against patterns
!-
2880 if ll=-1 then s=2: rem exit next loop
2890 nexts: rem proces next two lines of matrix
2900 return
!-
2910 rem ******************************
2920 rem convert to decimal
2930 rem ******************************
2940 v=0:for n=8to1
2950 for n=1to8
2960 if mid$(p$,n,1)= pl$ then v=v+(2^(8-n))
2970 next n
2980 return
!-
2990 rem ******************************
3000 rem validate with pattern values
3010 rem ******************************
3020 ll=0:for i=1 to 8
3030 if pv(i)=v then ll=-1
3040 next i
3050 return
!-
3060 rem ******************************
3070 rem transpose matrix playfield
3080 rem ******************************
3090 for y=4 to 1 step -1
3100 for i=1 to 4
3110 tp(5-y,i)=cp(i,y)
3120 next i
3130 next y
3140 return
!-
3150 rem ******************************
3160 rem fold 2 lines of cube to string
3170 rem ******************************
3180 for l=1 to 2
3190 for i=1 to 4
3200 if t=1 then p$=p$+chr$(48+cp(i,l+s))
3210 if t=2 then p$=p$+chr$(48+tp(i,l+s))
3220 next i
3230 next l
3240 return
!-
3250 rem *************************************
3260 rem handle coin and player cell placement
3270 rem *************************************
3280 if pm = 1 then 3330:rem playmode 1 then move coin
3290 if pm = 2 then 3370:rem playmode 2 then move to create an L shape
!-
3300 rem *************************************
3310 rem handle coin movement
3320 rem *************************************
3330 on cp(cx,cy)+1 goto 3410,3500,3500,3540:rem empty=0,play=1,play=2,coin=3
!-
3340 rem *************************************
3350 rem handle player movement
3360 rem *************************************
3370 on cp(cx,cy)+1 goto 3620,3710,3710,3470:rem empty=0,play=1,play=2,coin=3
!-
3380 rem *************************************
3390 rem cell was empty so coin can be placed
3400 rem *************************************
3410 if cc=2 then return :rem first remove a coin
3420 sc=0                :rem a coint was removed so start counting them
3430 cp(cx,cy)= 3        :rem place coin in cell
3440 cc=cc+1             :rem coin count placed
3450 gosub 4620          :rem place coin graphic in cell
3460 return
!-
3470 rem *************************************
3480 rem occupied by a player coin not allowed
3490 rem *************************************
3500 return: rem so do nothing
!-
3510 rem *************************************
3520 rem Clear cell a coin is already there
3530 rem *************************************
3540 cp(cx,cy)=0 : rem clear cell value
3550 cc=cc-1     : rem number of coins one down
3560 poke 646, bc: rem set background color to back
3570 gosub 3770  : rem fill cell with spaces
3580 return
!-
3590 rem *************************************
3600 rem cell was empty so player be placed
3610 rem *************************************
3620 if cc=4 then return :rem max cells reached first clean a player cell
3630 cp(cx,cy)= ap       :rem place active player value in cell
3640 poke 646, ap        :rem set color to active player
3650 cc=cc+1             :rem count cells filled by player
3660 gosub 3770          :rem color the cell using player color
3670 return
!-
3680 rem ************************************
3690 rem check if cell is current player
3700 rem ************************************
3710 if cp(cx,cy)<>ap then return:rem occupied do nothing
3720 cp(cx,cy)=0                 : rem clear cell
3730 poke 646, bc                : rem set color to background color
3740 gosub 3770                  : rem fill cell with spaces
3750 cc=cc-1                     : rem lower current player cell count
3760 return
!-
3770 rem ****************************
3780 rem fill cell with color spaces
3790 rem ****************************
3800 for i=1 to 4
3810 poke 214,-4+(cy*5)+i
3820 print
3830 poke 211,lm+1+(cx-1)+((cx-1)*5)
3840 print ib$
3850 next i
3860 return
!-
3870 rem ****************************
3880 rem union skin current player
3890 rem ****************************
3900 rem ap is active player
3910 rem walk trough matrix to determine cells
3920 gosub 4200: rem save all positions to pp
3930 for iy=1 to 4
3940 :  for ix=1 to 4
3950 if cp(ix,iy) = ap then cy=iy:cx=ix:gosub 3990:cp(ix,iy)=0
3960 next ix
3970 next iy
3980 return
!-
3990 rem ****************************
4000 rem fill cell with union skin
4010 rem ****************************
4020 poke646,p2:if ap=1 then poke646,p1:rem set cell color to activer  player
4030 for ii=1to4
4040 poke 214,-4+(cy*5)+ii
4050 print
4060 poke 211,lm+1+(cx-1)+((cx-1)*5)
4070 print ic$
4080 next ii
4090 return
!-
4100 rem ****************************
4110 rem copy opponent and coins to cp
4120 rem ****************************
4130 for ly=1to4
4140 for lx=1to4
4150 if pp(lx,ly)<>ap then cp(lx,ly)=pp(lx,ly)
4160 if pp(lx,ly)=ap then cp(lx,ly)=0
4170 next lx
4180 next ly
4190 return
!-
4200 rem ****************************
4210 rem copy cp to pp copy all
4220 rem ****************************
4230 for ny=1to4
4240 for nx=1to4
4250 pp(nx,ny)=cp(nx,ny)
4260 next nx
4270 next ny
4280 return
!-
4290 rem ****************************
4300 rem copy pp to cp (all)
4310 rem ****************************
4320 for ny=1to4
4330 for nx=1to4
4340 cp(nx,ny)=pp(nx,ny)
4350 next nx
4360 next ny
4370 return
!-
4380 rem ******************************
4390 rem set initial playfield
4400 rem ******************************
4410 for y=1 to 4
4420 for x=1 to 4
4430 cp(x,y)= val(mid$(x$(y),x,1))
4440 cx=x:cy=y
4450 if cp(x,y)= 0 then poke 646,bc          :rem set color cell to blue
4460 if cp(x,y)<>0 then poke 646,cp(x,y)     :rem set color of cell
4470 if cp(x,y)>= 3 then gosub 4650:goto 4490:rem place coin
4480 gosub 3770                              :rem cell to active player color
4490 next x
4500 next y
4510 return
!-
4520 rem *****************************
4530 rem clean playing field
4540 rem *****************************
4550 for y=1 to 4
4560 for x=1 to 4
4570 cv=cp(x,y)
4580 if cv=0 then poke646,bc:cx=x:cy=y:gosub 3770: rem hide cell
4590 next x
4600 next y
4610 return
!-
4620 rem ****************************
4630 rem place a coin in the cell
4640 rem ****************************
4650 poke646,7
4660 for ii=1to4
4670 poke 214,-4+(cy*5)+ii
4680 print
4690 poke 211,lm+1+(cx-1)+((cx-1)*5)
4700 if ii=1 then print chr$(18)+"UCCCI"+chr$(146) 
4710 if ii=2 then print chr$(18)+"BUCIB"+chr$(146) 
4720 if ii=3 then print chr$(18)+"BJCKB"+chr$(146) 
4730 if ii=4 then print chr$(18)+"JCCCK"+chr$(146) 
4740 next ii
4750 return
!-
4760 rem ****************************
4770 rem reading definitions of data
4780 rem ****************************
4790 : rem sprite 0 initialisation
4800 for x=ms to ms+63: read y: poke x,y: next x: rem sprite generation
4810 rem ****************************
4820 rem sprite data definition
4830 rem ****************************
4840 data 0,0,0,0,0,0,4,0,0,6,0,0,7,0,0,7
4850 data 128,0,7,192,0,7,224,0,7,240,0,7,248,0,7,252
4860 data 0,7,254,0,7,254,0,7,240,0,7,240,0,6,112,0
4870 data 4,120,0,0,56,0,0,24,0,0,0,0,0,0,0,7
4880 rem ******************************
4890 rem read initial playfield pattern
4900 rem ******************************
4910 for y=1 to 4: read x$(y):next y
4920 rem ******************************
4930 rem playfield pattern data
4940 rem ******************************
4950 data "3220"
4960 data "0120"
4970 data "0120"
4980 data "0113"
4990 rem ******************************
5000 rem initialize pattern and compare
5010 rem ******************************
5020 for d=1 to 8:read pv(d):next d
5030 data 232,226,142,46,113,71,116,23
5040 rem ******************************
5050 rem read sound effect data
5060 rem ******************************
5070 for s=1 to 3 : read sl(s),sh(s): next s :rem read tones
5080 rem ******************************
5090 rem simple tones data
5100 rem ******************************
5110 data 208,18,160,30,208,18
5120 rem
5130 rem ******************************
5140 rem end of data definitions
5150 rem ******************************
5160 return
!-
5170 rem ******************************
5180 rem play sound
5190 rem ******************************
5200 for r=54272 to 54296: poke r,0 : next : rem clear sound registers
5210 poke 54296,15 : rem turn on volume
5220 poke 54275,8:poke 54277, 0:poke 54278,240 :rem initialize registers
5230 for s = 1 to 3
5240 poke 54272,sl(s): poke 54273, sh(s) : rem poke tone values into voice 1
5250 poke 54276,65 :rem enable tone register
5260 for r=0 to 62: next r : rem play tone for 1/4 second
5270 next s
5280 poke 54276,64 : rem turn sound register off
5290 poke 54296,0  : rem turn volume off
5300 return
!-
5310 rem *************************************
5320 rem Variable initialisation / definitions
5330 rem *************************************
5340 dim cp(4,4) :rem current playfield (during turn)
5350 dim pp(4,4) :rem previous playfield (before turn)
5360 dim sl(4)   :rem sound effect low values
5370 dim sh(4)   :rem sound effect high values
5380 dim x$(4)   :rem to store initial playfield pattern
5390 lm=1        :rem left margin of screen
5400 pm=2        :rem play mode (move-l pm=2 or move c pm=1)
5410 ll=.        :rem variable for detection of the l-form in the play
5420 mx=.        :rem joystick x position
5430 my=.        :rem joystick y position
5440 fy=0        :rem joystick fire-pressed
5450 kp$=""      :rem variable to check pressed key
5460 db=0        :rem set 1 for debug mode
5470 pc=.        :rem counter for number of cells drawn in one trun
5480 p1=1        :rem color of players 1
5490 p2=2        :rem color of players 2
5500 ap=1        :rem active player start with player one
5510 iu=ap       :rem indicator for marking current positons of player
5520 bc=6        :rem color of blank cell equal to background color
5530 cc=.        :rem cell count (value to count id 5 cells are marked)
5540 ms=832      :rem sprite memory startadres
5550 ps=13       :rem sprite pointer to startadres (13x64=832)
5560 ic$= chr$(18)+" "+chr$(166)+chr$(166)+chr$(166)+chr$(166)
5570 ib$= chr$(18)+"     ":rem cell rows 5 inverse spaces
5580 rem ****************************************
5590 rem variables l-shape validation routines
5600 rem ****************************************
5610 dim tp(4,4):rem transposed playfield for pattern matching
5620 dim pl$    :rem player indicator
5630 dim pv(8)  :rem pattern values
5640 dim t      :rem transpose 1=normal 2=transposed
5650 return
!-
5660 rem ****************************************
5670 rem Program game bord initialisation
5680 rem ****************************************
5690 gosub 4760:rem read all data definitions (sprite,sound,playfield,pattern)
5700 gosub 1660:rem initialise game bord
5710 gosub 2370:rem create mouse pointer and place on gamebord
5720 gosub 4380:rem set start positions of L shapes 
5730 gosub 1990:rem start with move L shape
5740 return
!-
5750 rem ****************************************
5760 rem instruction part of the l-game
5770 rem ****************************************
5780?chr$(147):?:poke646,1
5790?" EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
5800?" VVV V V VVV   V   VVVV  V  V   V VVV "
5810?"  V  V V V     V   V    V V VVVVV V "
5820?"  V  VVV VV    V V V VV VVV V V V VV"
5830?"  V  V V V     V   V  V V V V   V V"
5840?"  V  V V VVV   VVV VVVV V V V   V VVV"
5850?" RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR":poke646,8
5860?"      by: sjef van wezel (c)2023"
5870?"       www.justforthefunofit.nl":poke646,1
5880?" EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
5890?" gameplay:"
5900?
5910?" this l-game is a two-player game"
5920?" each player has 4 pieces that needs to "
5930?" form a l-shape. there are 2 coins that"
5940?" can be used to block the other player"
5950?" only one coin can be moved in a turn."
5960?" a move is only valid if a l-shape is"
5970?" formed and at least one cell in that"
5980?" move is changed." :?
5990 poke646,0
6000?"   press any key to start the game":poke646,1:?
6010?" original game idea edward de bone 1967";
6020 kp$="":get kp$:if kp$="" then 6020:rem wait on a key
6030 return
