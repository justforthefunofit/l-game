7�� *********************************************** e��        L-GAME BY JUST FOR THE FUN OF IT ���            (C) SJEF VAN WEZEL 2023 �� *********************************************** �� ��            THIS MAY BE USED FREELY. '	$�      INFORM ME ON USAGE WILL BE APPRICIATED. ]	.� JUST SEND ME A E-MAIL INFO@JUSTFORTHEFUNOFIT.NL �	8� *********************************************** �	=� CHANGE HISTORY: �	>� 25-9-2023 �	@� - CORRECTED THE RULES (MOVE COIN AS STEP 2) 
A� - CORRECTED THE STARTING POSITION I
B� *********************************************** f
L� �(147) :� CLEAR SCREEN �
V� 5750     :� SHOW INTRO SCREEN �
`� 5310     :� VARIABLE DEFINITIONS AND INITIALISATIONS �
j� 5660     :� BOARD AND GAME INITIALISATIONS %t� **************************************** C~� NOW MAIN LOOP CAN START r�� **************************************** ��� 5170                : � ATTENTION SOUND KEY PRESS / NEXT PLAYER ��� PM�1 � 1230         : � PLAYMODE IS MOVE COIN $�� 3870                : � UNION FILL CURRENT PLAYER \�� 2020                : � REPLACE TEXT WITH  MOVE L ��� 1250                 : � SKIP COIN ACTIONS ��CC�2:SC��1                : � INITALISE COIN MOVEMENT VARIABLES �� 1890                : � REPLACE TEXT WITH MOVE COIN E�� 1560                : � READ JOYSTICK (OR KEYBOARD) ��:  � 2510             : � MOVE POINTER ON JOYSTICK INPUT � � FY�0 � 1250         : � NO FIRE THEN JUST HANDLE JOYSTICK INPUT 
� 2240                : � FIRE PRESSED SO COLOR CELL (COIN OR PLAY) R� PM�2 � CC�4 � 1330: � CHECK IF L-SHAPE IS CREATED BY PLAYER �� PM�1          � 1380: � PLAYER IS MOVING A COIN �(� 1250                 : � JUST AWAIT PLAYER MOVEMENTS 	2� 2710                : � CHECK IF L-SHAPE IS CREATED DURING PLAY O<� LL���1 � 1250       : � NO L-SHAPE YET JUST AWAIT NEXT MOVEMENT ~>� 4520                : � REMOVE TMP CELLS �A� 1790                : � REPLACE TEXT TO F1 OR F3 �B� 1480                : � ASK TO PLAY COIN OF NEXT PLAYER (E� PM�2 � � 1400: � 1170 :� NEXT PLAYER REDO LOOP RP� 1230                 : �  MOVE COIN �[� ******************************************** �\� SET VARIABLES BEFORE COIN HANDLING CHECK �]� ******************************************** d� CC�2 � SC�0 � PM�2:� 1400:� 2020:CC�0:� 1190 Bn� 1250:� JUST AWAIT PLAYER MOVEMENT qx� **************************************** ��� CHANGE PLAYER ��� **************************************** ��� AP�1 � AP�2:PM�2:CC�0:LL�0:� 1990:� ��AP�1:PM�2:CC�0:LL�0:� 1990:� .�� **************************************** \�� GET PLAYER GAME SELLECTION PLAY OR COIN ��� **************************************** ��KP$�"":� KP$:� KP$�"" � 1480:� WAIT ��� �(KP$)��133 � � �(KP$)��134 � 1480 �� �(KP$)� 134 � PM�1:CC�0:LL�0:� F3 MOVE COIN MODE FIRST \�� �(KP$)� 133 � PM�2:CC�0:LL�0:� F1 SKIP COIN MOVE NEXT PLAYER b�� ��� **************************************** �� END GAME LOOP, START PROCEDURE SECTION �� **************************************** !� ********************************************* >"� READ JOYSTICK PORT (1) r,� ********************************************* �6J�255��(56321):FY�0 �@� (J �16) � FY��1 �J� (J � 1) � MY�MY�5:� UP �T� (J � 2) � MY�MY�5:� DOWN �^� (J � 4) � MX�MX�5:� LEFT h� (J � 8) � MX�MX�5:� RIGHT !r� N|� ************************************** j�� INITIALIZE GAME BOARD ��� ************************************** ��� �(147);:�646,1:� 53280,6 ��� " JUST FOR THE FUN OF IT PRESENTS L-GAME":�  �� 646,0:� I � 1 � 4 &���LM)�"�������������������������" L���LM)�"�     �     �     �     �" r���LM)�"�     �     �     �     �" ����LM)�"�     �     �     �     �" ����LM)�"�     �     �     �     �":� I ����LM)�"�������������������������" ��� �� ************************************** D� HANDLE PLAYER BUTTON F1/F3 IF PM=0 q� ************************************** �PM�0:� 646,AP:PL$�"ONE": � AP�2 � PL$�"TWO" �&�214, 1:�:�211,26:���(18)�"�������������"��(146) 0�214, 2:�:�211,26:���(18)�"�PLAYER  "�PL$�"�"��(146) D:�214, 3:�:�211,26:���(18)�"�MOVE COIN? �"��(146) yD�214, 4:�:�211,26:���(18)�"� F1=N F3=Y �"��(146) �N�214, 5:�:�211,26:���(18)�"�������������"��(146) �X� �b� ************************************** l� HANDLE PLAYER BUTTON MOVE COIN IF PM=1 ;v� ************************************** f�� 646,AP:PL$�"ONE": � AP�2 � PL$�"TWO" ���214, 1:�:�211,26:���(18)�"�������������"��(146) ���214, 2:�:�211,26:���(18)�"�PLAYER  "�PL$�"�"��(146) 	��214, 3:�:�211,26:���(18)�"� NOW MOVE  �"��(146) >��214, 4:�:�211,26:���(18)�"� A COIN    �"��(146) s��214, 5:�:�211,26:���(18)�"�������������"��(146) y�� ��� ************************************** ��� HANDLE PLAYER BUTTON L IF PM=2 ��� ************************************** #�� 646,AP:PL$�"ONE": � AP�2 � PL$�"TWO" X��214, 1:�:�211,26:���(18)�"�������������"��(146) ���214, 2:�:�211,26:���(18)�"�PLAYER  "�PL$�"�"��(146) ��214, 3:�:�211,26:���(18)�"�UP TO YOU  �"��(146) ��214, 4:�:�211,26:���(18)�"�MOVE THE L �"��(146) 0�214, 5:�:�211,26:���(18)�"�������������"��(146) 6 � [*� ****************************** 4� DETERMINE MX OF CELL SELECTED �>� ****************************** �H� MX� 50�20 � � MX�� 50�20 � CX�1 �R� MX�100�20 � � MX��100�20 � CX�2 \� MX�150�20 � � MX��150�20 � CX�3 <f� MX�200�20 � � MX��200�20 � CX�4 ap� ****************************** �z� DETERMINE MY OF CELL SELECTED ��� ****************************** ��� MY� 68 � � MY��105 � CY�1 ��� MY�105 � � MY��145 � CY�2 
�� MY�145 � � MY��180 � CY�3 *�� MY�180 � � MY��228 � CY�4 0�� U�� ****************************** {�� IF FIRE PRESSED THEN COLOR CELL ��� ****************************** ��� 2090: � DETERMINE CELL SELECTED ��� 3250: � COLOR THE CELL ��� �� ************************************ *	� SHOW DEBUG INFO U	� ************************************ �	� 646,1 : � CHANGE PRINT COLOR TO WHITE �$	�214,22:�:�211,1:��5)�"                             " �.	�214,22:�:�211,1:��5)�"MXMYPM";MX,MY,PM �8	�  B	� **************************************** D L	� CREATE MOUSEPOINTER IN GAME FIELD s V	� **************************************** � `	� 53285,8: � MULTICOLOR 1 � j	� 53286,6: � MULTICOLOR 2 � t	� 53269,255 : � SET ALL 8 SPRITES VISIBLE � ~	� 53287,7: � COLOR = 7 !�	� 2040,PS: � POINTER 2!�	MX�100:� 53248, MX: � MX POS S!�	MY� 80:� 53249, MY: � MY POS p!�	� 53276, 0: � MULTICOLOR �!�	� 53277, �(53277) � (255�2�0): � WIDTH SMALL OS SPRITE 0 �!�	� 53271, �(53271)� (255�2�0): � HEIGHT SMALL OF SPRITE 0 "�	:: � SPRITE 0 / SINGLECOLOR / COLOR: 7 >"�	� ********************************** a"�	� PLACE AND MOVE MOUSE POINTER �"�	� ********************************** �"�	� MX �  24 � MX �  24 �"�	� MX � 296 � MX � 296 �" 
� MY �  50 � MY �  50 �"

� MY � 208 � MY � 208 #
� CHECK SPRITE MX HORIZONTAL OVERFLOW U#
� MX �  255 � � 53264, �(53264) � 1    : � MX (HIGH) �#(
� MX �� 255 � � 53264, �(53264) � 254 : � MX (HIGH) �#2
� SET NEW COORDINATES ON OVERFLOW �#<
� 53248, MX � 255: � SET NEX MX SPRITE COORDINATE (LOW) '$F
� 53249, MY        : � SET NEW MY SPRITE COORDINATE -$P
� X$Z
� ************************************ v$d
� PRINT MATRIX, TEST ONLY �$n
� ************************************ �$x
� "CURRENT CP":� Y�1�4:� X�1�4:�CP(X,Y);:� X:�:� Y %�
� "NEW PP    ":� Y�1�4:� X�1�4:�PP(X,Y);:� X:�:� Y %�
� :%�
� ****************************** Q%�
� CHECK HORIZONTAL k%�
� - FIRST FOLD IN STR �%�
� - CONVERT TO DECIMAL �%�
� - VALIDATE AGAINS PATTERN �%�
� ****************************** �%�
� 3060:� COPY CP TO TRANPOSED VALUES &�
� S � 0 � 2 L&�
PL$�"1":P$�"":T�1:� AP�2� PL$�"2":� INITIALISE FOR HORIZONTAL CHECK v&�
� 3150: � FOLD 2 LINES TO BYTE STRING �&�
� 2910: � CONVERT STR TO DECIMAL �&� 2990: � CHECK AGAINST PATTERNS �&� LL��1 � S�2 : � 2890: � EXIT NEXT LOOP 'P$�"":T�2:� INITIALISE FOR TRANSPOSED CHECK G'"� 3150: � FOLD 2 LINES TO BYTE STRING l',� 2910: � CONVERT STR TO DECIMAL �'6� 2990: � CHECK AGAINST PATTERNS �'@� LL��1 � S�2: � EXIT NEXT LOOP �'J�S: � PROCES NEXT TWO LINES OF MATRIX �'T� 
(^� ****************************** #(h� CONVERT TO DECIMAL H(r� ****************************** X(|V�0:� N�8�1 d(�� N�1�8 �(�� �(P$,N,1)� PL$ � V�V�(2�(8�N)) �(�� N �(�� �(�� ****************************** �(�� VALIDATE WITH PATTERN VALUES )�� ****************************** )�LL�0:� I�1 � 8 -)�� PV(I)�V � LL��1 5)�� I ;)�� `)�� ****************************** �)�� TRANSPOSE MATRIX PLAYFIELD �)� ****************************** �)� Y�4 � 1 � �1 �)� I�1 � 4 �)&TP(5�Y,I)�CP(I,Y) �)0� I �):� Y �)D� *N� ****************************** =*X� FOLD 2 LINES OF CUBE TO STRING b*b� ****************************** p*l� L�1 � 2 ~*v� I�1 � 4 �*�� T�1 � P$�P$��(48�CP(I,L�S)) �*�� T�2 � P$�P$��(48�TP(I,L�S)) �*�� I �*�� L �*�� +�� ************************************* 0+�� HANDLE COIN AND PLAYER CELL PLACEMENT \+�� ************************************* �+�� PM � 1 � 3330:� PLAYMODE 1 THEN MOVE COIN �+�� PM � 2 � 3370:� PLAYMODE 2 THEN MOVE TO CREATE AN L SHAPE �+�� ************************************* ,�� HANDLE COIN MOVEMENT ?,�� ************************************* �,� CP(CX,CY)�1 � 3410,3500,3500,3540:� EMPTY=0,PLAY=1,PLAY=2,COIN=3 �,� ************************************* �,� HANDLE PLAYER MOVEMENT �, � ************************************* B-*� CP(CX,CY)�1 � 3620,3710,3710,3470:� EMPTY=0,PLAY=1,PLAY=2,COIN=3 n-4� ************************************* �->� CELL WAS EMPTY SO COIN CAN BE PLACED �-H� ************************************* �-R� CC�2 � � :� FIRST REMOVE A COIN 1.\SC�0                :� A COINT WAS REMOVED SO START COUNTING THEM _.fCP(CX,CY)� 3        :� PLACE COIN IN CELL �.pCC�CC�1             :� COIN COUNT PLACED �.z� 4620          :� PLACE COIN GRAPHIC IN CELL �.�� �.�� ************************************* /�� OCCUPIED BY A PLAYER COIN NOT ALLOWED H/�� ************************************* _/��: � SO DO NOTHING �/�� ************************************* �/�� CLEAR CELL A COIN IS ALREADY THERE �/�� ************************************* 0�CP(CX,CY)�0 : � CLEAR CELL VALUE 20�CC�CC�1     : � NUMBER OF COINS ONE DOWN `0�� 646, BC: � SET BACKGROUND COLOR TO BACK �0�� 3770  : � FILL CELL WITH SPACES �0�� �0� ************************************* �0� CELL WAS EMPTY SO PLAYER BE PLACED 1� ************************************* K1$� CC�4 � � :� MAX CELLS REACHED FIRST CLEAN A PLAYER CELL �1.CP(CX,CY)� AP       :� PLACE ACTIVE PLAYER VALUE IN CELL �18� 646, AP        :� SET COLOR TO ACTIVE PLAYER �1BCC�CC�1             :� COUNT CELLS FILLED BY PLAYER ,2L� 3770          :� COLOR THE CELL USING PLAYER COLOR 22V� ]2`� ************************************ �2j� CHECK IF CELL IS CURRENT PLAYER �2t� ************************************ �2~� CP(CX,CY)��AP � �:� OCCUPIED DO NOTHING 3�CP(CX,CY)�0                 : � CLEAR CELL J3�� 646, BC                : � SET COLOR TO BACKGROUND COLOR �3�� 3770                  : � FILL CELL WITH SPACES �3�CC�CC�1                     : � LOWER CURRENT PLAYER CELL COUNT �3�� �3�� **************************** 4�� FILL CELL WITH COLOR SPACES 24�� **************************** @4�� I�1 � 4 V4�� 214,�4�(CY�5)�I \4�� }4�� 211,LM�1�(CX�1)�((CX�1)�5) �4 � IB$ �4
� I �4� �4� **************************** �4(� UNION SKIN CURRENT PLAYER �42� **************************** 5<� AP IS ACTIVE PLAYER A5F� WALK TROUGH MATRIX TO DETERMINE CELLS h5P� 4200: � SAVE ALL POSITIONS TO PP w5Z� IY�1 � 4 �5d:  � IX�1 � 4 �5n� CP(IX,IY) � AP � CY�IY:CX�IX:� 3990:CP(IX,IY)�0 �5x� IX �5�� IY �5�� �5�� **************************** 6�� FILL CELL WITH UNION SKIN =6�� **************************** ~6��646,P2:� AP�1 � �646,P1:� SET CELL COLOR TO ACTIVER  PLAYER �6�� II�1�4 �6�� 214,�4�(CY�5)�II �6�� �6�� 211,LM�1�(CX�1)�((CX�1)�5) �6�� IC$ �6�� II �6�� 7� **************************** )7� COPY OPPONENT AND COINS TO CP L7� **************************** Y7"� LY�1�4 f7,� LX�1�4 �76� PP(LX,LY)��AP � CP(LX,LY)�PP(LX,LY) �7@� PP(LX,LY)�AP � CP(LX,LY)�0 �7J� LX �7T� LY �7^� �7h� **************************** 	8r� COPY CP TO PP COPY ALL ,8|� **************************** 98�� NY�1�4 F8�� NX�1�4 ^8�PP(NX,NY)�CP(NX,NY) g8�� NX p8�� NY v8�� �8�� **************************** �8�� COPY PP TO CP (ALL) �8�� **************************** �8�� NY�1�4 �8�� NX�1�4 9�CP(NX,NY)�PP(NX,NY) 9�� NX 9� NY  9� E9� ****************************** a9&� SET INITIAL PLAYFIELD �90� ****************************** �9:� Y�1 � 4 �9D� X�1 � 4 �9NCP(X,Y)� �(�(X$(Y),X,1)) �9XCX�X:CY�Y :b� CP(X,Y)� 0 � � 646,BC          :� SET COLOR CELL TO BLUE F:l� CP(X,Y)��0 � � 646,CP(X,Y)     :� SET COLOR OF CELL u:v� CP(X,Y)�� 3 � � 4650:� 4490:� PLACE COIN �:�� 3770                              :� CELL TO ACTIVE PLAYER COLOR �:�� X �:�� Y �:�� �:�� ***************************** ;�� CLEAN PLAYING FIELD 4;�� ***************************** B;�� Y�1 � 4 P;�� X�1 � 4 _;�CV�CP(X,Y) �;�� CV�0 � �646,BC:CX�X:CY�Y:� 3770: � HIDE CELL �;�� X �;�� Y �;� �;� **************************** �;� PLACE A COIN IN THE CELL < � **************************** <*�646,7 %<4� II�1�4 <<>� 214,�4�(CY�5)�II B<H� c<R� 211,LM�1�(CX�1)�((CX�1)�5) �<\� II�1 � � �(18)�"�����"��(146) �<f� II�2 � � �(18)�"�����"��(146) �<p� II�3 � � �(18)�"�����"��(146) �<z� II�4 � � �(18)�"�����"��(146) �<�� II =�� %=�� **************************** G=�� READING DEFINITIONS OF DATA j=�� **************************** �=�: � SPRITE 0 INITIALISATION �=�� X�MS � MS�63: � Y: � X,Y: � X: � SPRITE GENERATION �=�� **************************** >�� SPRITE DATA DEFINITION &>�� **************************** L>�� 0,0,0,0,0,0,4,0,0,6,0,0,7,0,0,7 ~>�� 128,0,7,192,0,7,224,0,7,240,0,7,248,0,7,252 �>�� 0,7,254,0,7,254,0,7,240,0,7,240,0,6,112,0 �>� 4,120,0,0,56,0,0,24,0,0,0,0,0,0,0,7 �>� ****************************** "?� READ INITIAL PLAYFIELD PATTERN G?$� ****************************** b?.� Y�1 � 4: � X$(Y):� Y �?8� ****************************** �?B� PLAYFIELD PATTERN DATA �?L� ****************************** �?V� "3220" �?`� "0120" �?j� "0120" �?t� "0113" "@~� ****************************** G@�� INITIALIZE PATTERN AND COMPARE l@�� ****************************** �@�� D�1 � 8:� PV(D):� D �@�� 232,226,142,46,113,71,116,23 �@�� ****************************** �@�� READ SOUND EFFECT DATA A�� ****************************** AA�� S�1 � 3 : � SL(S),SH(S): � S :� READ TONES fA�� ****************************** ~A�� SIMPLE TONES DATA �A�� ****************************** �A�� 208,18,160,30,208,18 �A � �A
� ****************************** B� END OF DATA DEFINITIONS ,B� ****************************** 2B(� WB2� ****************************** hB<� PLAY SOUND �BF� ****************************** �BP� R�54272 � 54296: � R,0 : � : � CLEAR SOUND REGISTERS �BZ� 54296,15 : � TURN ON VOLUME 'Cd� 54275,8:� 54277, 0:� 54278,240 :� INITIALIZE REGISTERS 7Cn� S � 1 � 3 {Cx� 54272,SL(S): � 54273, SH(S) : � POKE TONE VALUES INTO VOICE 1 �C�� 54276,65 :� ENABLE TONE REGISTER �C�� R�0 � 62: � R : � PLAY TONE FOR 1/4 SECOND �C�� S D�� 54276,64 : � TURN SOUND REGISTER OFF )D�� 54296,0  : � TURN VOLUME OFF /D�� [D�� ************************************* �D�� VARIABLE INITIALISATION / DEFINITIONS �D�� ************************************* �D�� CP(4,4) :� CURRENT PLAYFIELD (DURING TURN) E�� PP(4,4) :� PREVIOUS PLAYFIELD (BEFORE TURN) ?E�� SL(4)   :� SOUND EFFECT LOW VALUES iE�� SH(4)   :� SOUND EFFECT HIGH VALUES �E� X$(4)   :� TO STORE INITIAL PLAYFIELD PATTERN �ELM�1        :� LEFT MARGIN OF SCREEN  FPM�2        :� PLAY MODE (MOVE-L PM=2 OR MOVE C PM=1) DF"LL�.        :� VARIABLE FOR DETECTION OF THE L-FORM IN THE PLAY kF,MX�.        :� JOYSTICK X POSITION �F6MY�.        :� JOYSTICK Y POSITION �F@FY�0        :� JOYSTICK FIRE-PRESSED �FJKP$�""      :� VARIABLE TO CHECK PRESSED KEY GTDB�0        :� SET 1 FOR DEBUG MODE UG^PC�.        :� COUNTER FOR NUMBER OF CELLS DRAWN IN ONE TRUN {GhP1�1        :� COLOR OF PLAYERS 1 �GrP2�2        :� COLOR OF PLAYERS 2 �G|AP�1        :� ACTIVE PLAYER START WITH PLAYER ONE H�IU�AP       :� INDICATOR FOR MARKING CURRENT POSITONS OF PLAYER ]H�BC�6        :� COLOR OF BLANK CELL EQUAL TO BACKGROUND COLOR �H�CC�.        :� CELL COUNT (VALUE TO COUNT ID 5 CELLS ARE MARKED) �H�MS�832      :� SPRITE MEMORY STARTADRES 
I�PS�13       :� SPRITE POINTER TO STARTADRES (13X64=832) 9I�IC$� �(18)�" "��(166)��(166)��(166)��(166) mI�IB$� �(18)�"     ":� CELL ROWS 5 INVERSE SPACES �I�� **************************************** �I�� VARIABLES L-SHAPE VALIDATION ROUTINES �I�� **************************************** 1J�� TP(4,4):� TRANSPOSED PLAYFIELD FOR PATTERN MATCHING RJ�� PL$    :� PLAYER INDICATOR qJ�� PV(8)  :� PATTERN VALUES �J� T      :� TRANSPOSE 1=NORMAL 2=TRANSPOSED �J� �J� **************************************** �J&� PROGRAM GAME BORD INITIALISATION ,K0� **************************************** tK:� 4760:� READ ALL DATA DEFINITIONS (SPRITE,SOUND,PLAYFIELD,PATTERN) �KD� 1660:� INITIALISE GAME BORD �KN� 2370:� CREATE MOUSE POINTER AND PLACE ON GAMEBORD �KX� 4380:� SET START POSITIONS OF L SHAPES  Lb� 1990:� START WITH MOVE L SHAPE &Ll� ULv� **************************************** zL�� INSTRUCTION PART OF THE L-GAME �L�� **************************************** �L���(147):�:�646,1 �L��" ��������������������������������������" M��" ��� � � ���   �   ����  �  �   � ��� " GM��"  �  � � �     �   �    � � ����� � " sM��"  �  ��� ��    � � � �� ��� � � � ��" �M��"  �  � � �     �   �  � � � �   � �" �M��"  �  � � ���   ��� ���� � � �   � ���" N��" ��������������������������������������":�646,8 )N��"      BY: SJEF VAN WEZEL (C)2023" WN��"       WWW.JUSTFORTHEFUNOFIT.NL":�646,1 �N��" ��������������������������������������" �N�" GAMEPLAY:" �N� �N�" THIS L-GAME IS A TWO-PLAYER GAME" �N �" EACH PLAYER HAS 4 PIECES THAT NEEDS TO " &O*�" FORM A L-SHAPE. THERE ARE 2 COINS THAT" TO4�" CAN BE USED TO BLOCK THE OTHER PLAYER" �O>�" ONLY ONE COIN CAN BE MOVED IN A TURN." �OH�" A MOVE IS ONLY VALID IF A L-SHAPE IS" �OR�" FORMED AND AT LEAST ONE CELL IN THAT" �O\�" MOVE IS CHANGED." :� Pf�646,0 6Pp�"   PRESS ANY KEY TO START THE GAME":�646,1:� fPz�" ORIGINAL GAME IDEA EDWARD DE BONE 1967"; �P�KP$�"":� KP$:� KP$�"" � 6020:� WAIT ON A KEY �P��   