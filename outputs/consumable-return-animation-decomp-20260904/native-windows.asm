004EE1E0                 sbb     eax, eax
004EE1E2                 add     eax, 1
004EE1E5                 retn
004EE1E5 ; ---------------------------------------------------------------------------
004EE1E6                 align 10h
004EE1F0
004EE1F0 ; =============== S U B R O U T I N E =======================================
004EE1F0
004EE1F0
004EE1F0 sub_4EE1F0      proc near               ; CODE XREF: sub_85BC50+D0Bâ†“p
004EE1F0
004EE1F0 arg_0           = dword ptr  4
004EE1F0
004EE1F0                 mov     eax, [esp+arg_0]
004EE1F4                 add     eax, 0FF757340h
004EE1F9                 mov     ecx, 270Fh
004EE1FE                 cmp     ecx, eax
004EE200                 sbb     eax, eax
004EE202                 add     eax, 1
004EE205                 retn
004EE205 sub_4EE1F0      endp
004EE205
004EE205 ; ---------------------------------------------------------------------------
004EE206                 align 10h
004EE210
004EE210 ; =============== S U B R O U T I N E =======================================
004EE210
004EE210
004EE210 sub_4EE210      proc near               ; CODE XREF: sub_858330+1DAâ†“p
004EE210                                         ; sub_85B160+63â†“p ...
004EE210
004EE210 arg_0           = dword ptr  4
004EE210
004EE210                 mov     eax, [esp+arg_0]
004EE214                 add     eax, 0FF65E2E0h
004EE219                 mov     ecx, 1869Fh
004EE21E                 cmp     ecx, eax
004EE220                 sbb     eax, eax
004EE222                 add     eax, 1
004EE225                 retn
004EE225 sub_4EE210      endp
004EE225
004EE225 ; ---------------------------------------------------------------------------
004EE226                 align 10h
004EE230
004EE230 ; =============== S U B R O U T I N E =======================================
004EE230
004EE230
004EE230 sub_4EE230      proc near               ; CODE XREF: sub_51BA90+3844â†“p
004EE230                                         ; sub_85BC50+125Eâ†“p
004EE230
004EE230 arg_0           = dword ptr  4
004EE230
004EE230                 mov     ecx, [esp+arg_0]
004EE234                 add     ecx, 0FFFFFFFEh ; switch 40 cases
004EE237                 cmp     ecx, 27h
004EE23A                 mov     eax, 0CBh
004EE23F                 ja      short def_4EE248 ; jumptable 004EE248 default case, cases 3,5,6,9-21,24-28,37,38
004EE241                 movzx   ecx, ds:byte_4EE304[ecx]
004EE248                 jmp     ds:jpt_4EE248[ecx*4] ; switch jump
004EE24F ; ---------------------------------------------------------------------------
004EE24F
004EE24F loc_4EE24F:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE24F                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE24F                 mov     eax, 0CEh       ; jumptable 004EE248 case 2
004EE254                 retn
004EE255 ; ---------------------------------------------------------------------------
004EE255
004EE255 loc_4EE255:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE255                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE255                 mov     eax, 0CCh       ; jumptable 004EE248 case 4
004EE25A                 retn
004EE25B ; ---------------------------------------------------------------------------
004EE25B
004EE25B loc_4EE25B:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE25B                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE25B                 mov     eax, 0CFh       ; jumptable 004EE248 case 7
004EE260                 retn
004EE261 ; ---------------------------------------------------------------------------
004EE261
004EE261 loc_4EE261:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE261                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE261                 mov     eax, 0CDh       ; jumptable 004EE248 case 8
004EE266                 retn
004EE267 ; ---------------------------------------------------------------------------
004EE267
004EE267 loc_4EE267:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE267                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE267                 mov     eax, 0EAh       ; jumptable 004EE248 case 23
004EE26C                 retn
004EE26D ; ---------------------------------------------------------------------------
004EE26D
004EE26D loc_4EE26D:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE26D                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE26D                 mov     eax, 0E9h       ; jumptable 004EE248 case 22
004EE272                 retn
004EE273 ; ---------------------------------------------------------------------------
004EE273
004EE273 loc_4EE273:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE273                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE273                 mov     eax, 0D9h       ; jumptable 004EE248 case 39
004EE278                 retn
004EE279 ; ---------------------------------------------------------------------------
004EE279
004EE279 loc_4EE279:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE279                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE279                 mov     eax, 0DAh       ; jumptable 004EE248 case 40
004EE27E                 retn
004EE27F ; ---------------------------------------------------------------------------
004EE27F
004EE27F loc_4EE27F:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE27F                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE27F                 mov     eax, 0DBh       ; jumptable 004EE248 case 41
004EE284                 retn
004EE285 ; ---------------------------------------------------------------------------
004EE285
004EE285 loc_4EE285:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE285                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE285                 mov     eax, 0D4h       ; jumptable 004EE248 case 29
004EE28A                 retn
004EE28B ; ---------------------------------------------------------------------------
004EE28B
004EE28B loc_4EE28B:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE28B                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE28B                 mov     eax, 0D1h       ; jumptable 004EE248 case 30
004EE290                 retn
004EE291 ; ---------------------------------------------------------------------------
004EE291
004EE291 loc_4EE291:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE291                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE291                 mov     eax, 0D8h       ; jumptable 004EE248 case 31
004EE296                 retn
004EE297 ; ---------------------------------------------------------------------------
004EE297
004EE297 loc_4EE297:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE297                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE297                 mov     eax, 0D5h       ; jumptable 004EE248 case 32
004EE29C                 retn
004EE29D ; ---------------------------------------------------------------------------
004EE29D
004EE29D loc_4EE29D:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE29D                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE29D                 mov     eax, 0D3h       ; jumptable 004EE248 case 33
004EE2A2                 retn
004EE2A3 ; ---------------------------------------------------------------------------
004EE2A3
004EE2A3 loc_4EE2A3:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE2A3                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE2A3                 mov     eax, 0D2h       ; jumptable 004EE248 case 34
004EE2A8                 retn
004EE2A9 ; ---------------------------------------------------------------------------
004EE2A9
004EE2A9 loc_4EE2A9:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE2A9                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE2A9                 mov     eax, 0D7h       ; jumptable 004EE248 case 35
004EE2AE                 retn
004EE2AF ; ---------------------------------------------------------------------------
004EE2AF
004EE2AF loc_4EE2AF:                             ; CODE XREF: sub_4EE230+18â†‘j
004EE2AF                                         ; DATA XREF: .text:jpt_4EE248â†“o
004EE2AF                 mov     eax, 0D6h       ; jumptable 004EE248 case 36
004EE2B4
004EE2B4 def_4EE248:                             ; CODE XREF: sub_4EE230+Fâ†‘j
004EE2B4                                         ; sub_4EE230+18â†‘j
004EE2B4                                         ; DATA XREF: ...
004EE2B4                 retn                    ; jumptable 004EE248 default case, cases 3,5,6,9-21,24-28,37,38
004EE2B4 sub_4EE230      endp
004EE2B4
004EE2B4 ; ---------------------------------------------------------------------------
004EE2B5                 align 4
004EE2B8 jpt_4EE248      dd offset loc_4EE24F    ; DATA XREF: sub_4EE230+18â†‘r
004EE2BC                 dd offset def_4EE248    ; jump table for switch statement
004EE2C0                 dd offset loc_4EE255
004EE2C4                 dd offset loc_4EE25B
004EE2C8                 dd offset loc_4EE261
004EE2CC                 dd offset loc_4EE26D
004EE2D0                 dd offset loc_4EE267
004EE2D4                 dd offset loc_4EE285
004EE2D8                 dd offset loc_4EE28B
004EE2DC                 dd offset loc_4EE291
004EE2E0                 dd offset loc_4EE297
004EE2E4                 dd offset loc_4EE29D
004EE2E8                 dd offset loc_4EE2A3
004EE2EC                 dd offset loc_4EE2A9
004EE2F0                 dd offset loc_4EE2AF
004EE2F4                 dd offset loc_4EE273
004EE2F8                 dd offset loc_4EE279
004EE2FC                 dd offset loc_4EE27F
004EE300                 dd offset def_4EE248
004EE304 byte_4EE304     db      0,     1,     2,   12h
004EE304                                         ; DATA XREF: sub_4EE230+11â†‘r
004EE308                 db    12h,     3,     4,   12h ; indirect table for switch statement
004EE30C                 db    12h,   12h,   12h,   12h
004EE310                 db    12h,   12h,   12h,   12h
004EE314                 db    12h,   12h,   12h,   12h
004EE318                 db      5,     6,   12h,   12h
004EE31C                 db    12h,   12h,   12h,     7
004EE320                 db      8,     9,   0Ah,   0Bh
004EE324                 db    0Ch,   0Dh,   0Eh,   12h
004EE328                 db    12h,   0Fh,   10h,   11h
004EE32C                 align 10h
004EE330
004EE330 ; =============== S U B R O U T I N E =======================================
004EE330
004EE330
004EE330 sub_4EE330      proc near               ; CODE XREF: sub_52A080+9Câ†“p
004EE330                                         ; sub_52A320+8Dâ†“p
004EE330                 mov     eax, ecx
004EE332                 xor     ecx, ecx
004EE334                 mov     [eax], ecx
004EE336                 mov     [eax+4], ecx
004EE339                 mov     [eax+8], ecx
004EE33C                 mov     [eax+0Ch], ecx
004EE33F                 mov     [eax+10h], ecx
004EE342                 mov     [eax+14h], ecx
004EE345                 mov     [eax+18h], ecx
004EE348                 mov     [eax+1Ch], ecx
004EE34B                 mov     [eax+20h], ecx
004EE34E                 mov     [eax+24h], ecx
004EE351                 mov     [eax+28h], ecx
004EE354                 mov     [eax+2Ch], ecx
004EE357                 mov     [eax+30h], ecx
004EE35A                 mov     [eax+34h], ecx
004EE35D                 mov     [eax+38h], ecx
004EE360                 mov     [eax+3Ch], ecx
004EE363                 mov     [eax+40h], ecx
004EE366                 mov     [eax+44h], ecx
004EE369                 mov     [eax+48h], ecx
004EE36C                 mov     [eax+4Ch], ecx
004EE36F                 mov     [eax+50h], ecx
004EE372                 mov     [eax+54h], ecx
004EE375                 mov     [eax+58h], ecx
004EE378                 mov     [eax+5Ch], ecx
004EE37B                 mov     [eax+60h], ecx
004EE37E                 mov     [eax+64h], ecx
004EE381                 mov     [eax+68h], ecx
004EE384                 mov     [eax+6Ch], ecx
004EE387                 mov     [eax+70h], ecx
004EE38A                 mov     [eax+74h], ecx
004EE38D                 mov     [eax+78h], ecx
004EE390                 mov     [eax+7Ch], ecx
004EE393                 mov     [eax+80h], ecx
004EE399                 mov     [eax+84h], ecx
004EE39F                 mov     [eax+88h], ecx
004EE3A5                 mov     [eax+8Ch], ecx
004EE3AB                 mov     [eax+90h], ecx
004EE3B1                 mov     [eax+94h], ecx
004EE3B7                 mov     [eax+98h], ecx
004EE3BD                 mov     [eax+9Ch], ecx
004EE3C3                 mov     [eax+0A0h], ecx
004EE3C9                 mov     [eax+0A4h], ecx
004EE3CF                 mov     [eax+0A8h], ecx
004EE3D5                 mov     [eax+0ACh], ecx
004EE3DB                 mov     [eax+0B0h], ecx
004EE3E1                 mov     [eax+0B4h], ecx
004EE3E7                 mov     [eax+0B8h], ecx
004EE3ED                 mov     [eax+0BCh], ecx
004EE3F3                 mov     [eax+0C0h], ecx
004EE3F9                 mov     [eax+0C4h], ecx
004EE3FF                 mov     [eax+0C8h], ecx
004EE405                 mov     [eax+0CCh], ecx
004EE40B                 mov     [eax+0D0h], ecx
004EE411                 mov     [eax+0D4h], ecx
004EE417                 mov     [eax+0D8h], ecx
004EE41D                 mov     [eax+0DCh], ecx
004EE423                 mov     [eax+0E0h], ecx
004EE429                 mov     [eax+0E4h], ecx
004EE42F                 mov     [eax+0E8h], ecx
004EE435                 mov     [eax+0ECh], ecx
004EE43B                 mov     [eax+0F0h], ecx
004EE441                 mov     [eax+0F4h], ecx
004EE447                 mov     [eax+0F8h], ecx
004EE44D                 mov     [eax+0FCh], ecx
004EE453                 mov     [eax+100h], ecx
004EE459                 mov     [eax+104h], ecx
004EE45F                 mov     [eax+108h], ecx
004EE465                 mov     [eax+10Ch], ecx
004EE46B                 mov     [eax+110h], ecx
004EE471                 mov     [eax+114h], ecx
004EE477                 mov     [eax+118h], ecx
004EE47D                 mov     [eax+11Ch], ecx
004EE483                 mov     [eax+120h], ecx
004EE489                 mov     [eax+124h], ecx
004EE48F                 mov     [eax+128h], ecx
004EE495                 mov     [eax+12Ch], ecx
004EE49B                 mov     [eax+130h], ecx
004EE4A1                 mov     [eax+134h], ecx
004EE4A7                 mov     [eax+138h], ecx
004EE4AD                 mov     [eax+13Ch], ecx
004EE4B3                 mov     [eax+140h], ecx
004EE4B9                 mov     [eax+144h], ecx
004EE4BF                 mov     [eax+148h], ecx
004EE4C5                 mov     [eax+14Ch], ecx
004EE4CB                 mov     [eax+150h], ecx
004EE4D1                 mov     [eax+154h], ecx
004EE4D7                 mov     [eax+158h], ecx
004EE4DD                 mov     [eax+15Ch], ecx
004EE4E3                 mov     [eax+160h], ecx
004EE4E9                 mov     [eax+164h], ecx
004EE4EF                 retn
004EE4EF sub_4EE330      endp
004EE4EF
004EE4F0 ; [00000001 BYTES: COLLAPSED FUNCTION nullsub_215. PRESS CTRL-NUMPAD+ TO EXPAND]
004EE4F1                 align 10h
004EE500
004EE500 ; =============== S U B R O U T I N E =======================================
004EE500
004EE500
004EE500 sub_4EE500      proc near               ; CODE XREF: sub_4F7EA0+4Câ†“p
004EE500                                         ; sub_501930+33â†“p ...
004EE500
004EE500 var_4           = dword ptr -4
004EE500
004EE500                 push    ecx
004EE501                 push    esi
004EE502                 push    1
004EE504                 mov     esi, ecx
004EE506                 mov     ecx, [esi+4]
004EE509                 mov     byte ptr [esp+0Ch+var_4], 0
004EE50E                 mov     eax, [esp+0Ch+var_4]
0057ABA0                 mov     large fs:0, ecx
0057ABA7                 pop     ecx
0057ABA8                 add     esp, 10h
0057ABAB                 retn    4
0057ABAB ; } // starts at 57AB60
0057ABAB sub_57AB60      endp
0057ABAB
0057ABAB ; ---------------------------------------------------------------------------
0057ABAE                 align 10h
0057ABB0
0057ABB0 ; =============== S U B R O U T I N E =======================================
0057ABB0
0057ABB0
0057ABB0 sub_57ABB0      proc near               ; CODE XREF: sub_5794C0+2BCâ†‘p
0057ABB0                                         ; sub_5794C0+333â†‘p ...
0057ABB0
0057ABB0 arg_0           = dword ptr  4
0057ABB0
0057ABB0                 mov     eax, [esp+arg_0]
0057ABB4                 cmp     eax, 3FFh       ; switch 1024 cases
0057ABB9                 ja      def_57ABBF      ; jumptable 0057ABBF default case, cases 22-49,151-199,215-224,226-249,270-299,365-399,533-549,733-749,761-799,808-819,915-936
0057ABBF                 jmp     ds:jpt_57ABBF[eax*4] ; switch jump
0057ABC6 ; ---------------------------------------------------------------------------
0057ABC6
0057ABC6 loc_57ABC6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABC6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABC6                 mov     eax, 64h ; 'd'  ; jumptable 0057ABBF case 0
0057ABCB                 retn
0057ABCC ; ---------------------------------------------------------------------------
0057ABCC
0057ABCC loc_57ABCC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABCC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABCC                 mov     eax, 65h ; 'e'  ; jumptable 0057ABBF case 1
0057ABD1                 retn
0057ABD2 ; ---------------------------------------------------------------------------
0057ABD2
0057ABD2 loc_57ABD2:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABD2                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABD2                 mov     eax, 66h ; 'f'  ; jumptable 0057ABBF case 2
0057ABD7                 retn
0057ABD8 ; ---------------------------------------------------------------------------
0057ABD8
0057ABD8 loc_57ABD8:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABD8                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABD8                 mov     eax, 67h ; 'g'  ; jumptable 0057ABBF case 3
0057ABDD                 retn
0057ABDE ; ---------------------------------------------------------------------------
0057ABDE
0057ABDE loc_57ABDE:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABDE                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABDE                 mov     eax, 68h ; 'h'  ; jumptable 0057ABBF case 4
0057ABE3                 retn
0057ABE4 ; ---------------------------------------------------------------------------
0057ABE4
0057ABE4 loc_57ABE4:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABE4                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABE4                 mov     eax, 69h ; 'i'  ; jumptable 0057ABBF case 5
0057ABE9                 retn
0057ABEA ; ---------------------------------------------------------------------------
0057ABEA
0057ABEA loc_57ABEA:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABEA                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABEA                 mov     eax, 6Ah ; 'j'  ; jumptable 0057ABBF case 6
0057ABEF                 retn
0057ABF0 ; ---------------------------------------------------------------------------
0057ABF0
0057ABF0 loc_57ABF0:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABF0                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABF0                 mov     eax, 6Bh ; 'k'  ; jumptable 0057ABBF case 7
0057ABF5                 retn
0057ABF6 ; ---------------------------------------------------------------------------
0057ABF6
0057ABF6 loc_57ABF6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABF6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABF6                 mov     eax, 6Ch ; 'l'  ; jumptable 0057ABBF case 8
0057ABFB                 retn
0057ABFC ; ---------------------------------------------------------------------------
0057ABFC
0057ABFC loc_57ABFC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ABFC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ABFC                 mov     eax, 6Dh ; 'm'  ; jumptable 0057ABBF case 9
0057AC01                 retn
0057AC02 ; ---------------------------------------------------------------------------
0057AC02
0057AC02 loc_57AC02:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC02                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC02                 mov     eax, 6Eh ; 'n'  ; jumptable 0057ABBF case 10
0057AC07                 retn
0057AC08 ; ---------------------------------------------------------------------------
0057AC08
0057AC08 loc_57AC08:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC08                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC08                 mov     eax, 6Fh ; 'o'  ; jumptable 0057ABBF case 11
0057AC0D                 retn
0057AC0E ; ---------------------------------------------------------------------------
0057AC0E
0057AC0E loc_57AC0E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC0E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC0E                 mov     eax, 70h ; 'p'  ; jumptable 0057ABBF case 12
0057AC13                 retn
0057AC14 ; ---------------------------------------------------------------------------
0057AC14
0057AC14 loc_57AC14:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC14                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC14                 mov     eax, 71h ; 'q'  ; jumptable 0057ABBF case 13
0057AC19                 retn
0057AC1A ; ---------------------------------------------------------------------------
0057AC1A
0057AC1A loc_57AC1A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC1A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC1A                 mov     eax, 72h ; 'r'  ; jumptable 0057ABBF case 14
0057AC1F                 retn
0057AC20 ; ---------------------------------------------------------------------------
0057AC20
0057AC20 loc_57AC20:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC20                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC20                 mov     eax, 73h ; 's'  ; jumptable 0057ABBF case 15
0057AC25                 retn
0057AC26 ; ---------------------------------------------------------------------------
0057AC26
0057AC26 loc_57AC26:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC26                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC26                 mov     eax, 74h ; 't'  ; jumptable 0057ABBF case 16
0057AC2B                 retn
0057AC2C ; ---------------------------------------------------------------------------
0057AC2C
0057AC2C loc_57AC2C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC2C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC2C                 mov     eax, 75h ; 'u'  ; jumptable 0057ABBF case 17
0057AC31                 retn
0057AC32 ; ---------------------------------------------------------------------------
0057AC32
0057AC32 loc_57AC32:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC32                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC32                 mov     eax, 76h ; 'v'  ; jumptable 0057ABBF case 21
0057AC37                 retn
0057AC38 ; ---------------------------------------------------------------------------
0057AC38
0057AC38 loc_57AC38:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC38                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC38                 mov     eax, 0C5h       ; jumptable 0057ABBF case 18
0057AC3D                 retn
0057AC3E ; ---------------------------------------------------------------------------
0057AC3E
0057AC3E loc_57AC3E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC3E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC3E                 mov     eax, 0C6h       ; jumptable 0057ABBF case 19
0057AC43                 retn
0057AC44 ; ---------------------------------------------------------------------------
0057AC44
0057AC44 loc_57AC44:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC44                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC44                 mov     eax, 0C7h       ; jumptable 0057ABBF case 20
0057AC49                 retn
0057AC4A ; ---------------------------------------------------------------------------
0057AC4A
0057AC4A loc_57AC4A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC4A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC4A                 mov     eax, 0C8h       ; jumptable 0057ABBF case 50
0057AC4F                 retn
0057AC50 ; ---------------------------------------------------------------------------
0057AC50
0057AC50 loc_57AC50:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC50                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC50                 mov     eax, 0C9h       ; jumptable 0057ABBF case 51
0057AC55                 retn
0057AC56 ; ---------------------------------------------------------------------------
0057AC56
0057AC56 loc_57AC56:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC56                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC56                 mov     eax, 0CAh       ; jumptable 0057ABBF case 52
0057AC5B                 retn
0057AC5C ; ---------------------------------------------------------------------------
0057AC5C
0057AC5C loc_57AC5C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC5C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC5C                 mov     eax, 0CBh       ; jumptable 0057ABBF case 53
0057AC61                 retn
0057AC62 ; ---------------------------------------------------------------------------
0057AC62
0057AC62 loc_57AC62:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC62                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC62                 mov     eax, 0CCh       ; jumptable 0057ABBF case 54
0057AC67                 retn
0057AC68 ; ---------------------------------------------------------------------------
0057AC68
0057AC68 loc_57AC68:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC68                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC68                 mov     eax, 0CDh       ; jumptable 0057ABBF case 55
0057AC6D                 retn
0057AC6E ; ---------------------------------------------------------------------------
0057AC6E
0057AC6E loc_57AC6E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC6E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC6E                 mov     eax, 0CEh       ; jumptable 0057ABBF case 56
0057AC73                 retn
0057AC74 ; ---------------------------------------------------------------------------
0057AC74
0057AC74 loc_57AC74:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC74                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC74                 mov     eax, 0CFh       ; jumptable 0057ABBF case 57
0057AC79                 retn
0057AC7A ; ---------------------------------------------------------------------------
0057AC7A
0057AC7A loc_57AC7A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC7A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC7A                 mov     eax, 0D0h       ; jumptable 0057ABBF case 58
0057AC7F                 retn
0057AC80 ; ---------------------------------------------------------------------------
0057AC80
0057AC80 loc_57AC80:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC80                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC80                 mov     eax, 0D1h       ; jumptable 0057ABBF case 59
0057AC85                 retn
0057AC86 ; ---------------------------------------------------------------------------
0057AC86
0057AC86 loc_57AC86:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC86                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC86                 mov     eax, 0D2h       ; jumptable 0057ABBF case 60
0057AC8B                 retn
0057AC8C ; ---------------------------------------------------------------------------
0057AC8C
0057AC8C loc_57AC8C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC8C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC8C                 mov     eax, 0D3h       ; jumptable 0057ABBF case 61
0057AC91                 retn
0057AC92 ; ---------------------------------------------------------------------------
0057AC92
0057AC92 loc_57AC92:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC92                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC92                 mov     eax, 0D4h       ; jumptable 0057ABBF case 62
0057AC97                 retn
0057AC98 ; ---------------------------------------------------------------------------
0057AC98
0057AC98 loc_57AC98:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC98                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC98                 mov     eax, 0D5h       ; jumptable 0057ABBF case 63
0057AC9D                 retn
0057AC9E ; ---------------------------------------------------------------------------
0057AC9E
0057AC9E loc_57AC9E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AC9E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AC9E                 mov     eax, 0D6h       ; jumptable 0057ABBF case 64
0057ACA3                 retn
0057ACA4 ; ---------------------------------------------------------------------------
0057ACA4
0057ACA4 loc_57ACA4:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACA4                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACA4                 mov     eax, 0D7h       ; jumptable 0057ABBF case 65
0057ACA9                 retn
0057ACAA ; ---------------------------------------------------------------------------
0057ACAA
0057ACAA loc_57ACAA:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACAA                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACAA                 mov     eax, 0D8h       ; jumptable 0057ABBF case 66
0057ACAF                 retn
0057ACB0 ; ---------------------------------------------------------------------------
0057ACB0
0057ACB0 loc_57ACB0:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACB0                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACB0                 mov     eax, 0D9h       ; jumptable 0057ABBF case 67
0057ACB5                 retn
0057ACB6 ; ---------------------------------------------------------------------------
0057ACB6
0057ACB6 loc_57ACB6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACB6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACB6                 mov     eax, 0DAh       ; jumptable 0057ABBF case 68
0057ACBB                 retn
0057ACBC ; ---------------------------------------------------------------------------
0057ACBC
0057ACBC loc_57ACBC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACBC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACBC                 mov     eax, 0DBh       ; jumptable 0057ABBF case 69
0057ACC1                 retn
0057ACC2 ; ---------------------------------------------------------------------------
0057ACC2
0057ACC2 loc_57ACC2:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACC2                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACC2                 mov     eax, 0DCh       ; jumptable 0057ABBF case 70
0057ACC7                 retn
0057ACC8 ; ---------------------------------------------------------------------------
0057ACC8
0057ACC8 loc_57ACC8:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACC8                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACC8                 mov     eax, 0DDh       ; jumptable 0057ABBF case 71
0057ACCD                 retn
0057ACCE ; ---------------------------------------------------------------------------
0057ACCE
0057ACCE loc_57ACCE:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACCE                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACCE                 mov     eax, 0DEh       ; jumptable 0057ABBF case 72
0057ACD3                 retn
0057ACD4 ; ---------------------------------------------------------------------------
0057ACD4
0057ACD4 loc_57ACD4:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACD4                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACD4                 mov     eax, 0DFh       ; jumptable 0057ABBF case 73
0057ACD9                 retn
0057ACDA ; ---------------------------------------------------------------------------
0057ACDA
0057ACDA loc_57ACDA:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACDA                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACDA                 mov     eax, 0E0h       ; jumptable 0057ABBF case 74
0057ACDF                 retn
0057ACE0 ; ---------------------------------------------------------------------------
0057ACE0
0057ACE0 loc_57ACE0:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACE0                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACE0                 mov     eax, 0E1h       ; jumptable 0057ABBF case 75
0057ACE5                 retn
0057ACE6 ; ---------------------------------------------------------------------------
0057ACE6
0057ACE6 loc_57ACE6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACE6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACE6                 mov     eax, 0E2h       ; jumptable 0057ABBF case 76
0057ACEB                 retn
0057ACEC ; ---------------------------------------------------------------------------
0057ACEC
0057ACEC loc_57ACEC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACEC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACEC                 mov     eax, 0E3h       ; jumptable 0057ABBF case 77
0057ACF1                 retn
0057ACF2 ; ---------------------------------------------------------------------------
0057ACF2
0057ACF2 loc_57ACF2:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACF2                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACF2                 mov     eax, 0E4h       ; jumptable 0057ABBF case 78
0057ACF7                 retn
0057ACF8 ; ---------------------------------------------------------------------------
0057ACF8
0057ACF8 loc_57ACF8:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACF8                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACF8                 mov     eax, 0E5h       ; jumptable 0057ABBF case 79
0057ACFD                 retn
0057ACFE ; ---------------------------------------------------------------------------
0057ACFE
0057ACFE loc_57ACFE:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ACFE                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ACFE                 mov     eax, 0E6h       ; jumptable 0057ABBF case 80
0057AD03                 retn
0057AD04 ; ---------------------------------------------------------------------------
0057AD04
0057AD04 loc_57AD04:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD04                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD04                 mov     eax, 0E7h       ; jumptable 0057ABBF case 81
0057AD09                 retn
0057AD0A ; ---------------------------------------------------------------------------
0057AD0A
0057AD0A loc_57AD0A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD0A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD0A                 mov     eax, 0E8h       ; jumptable 0057ABBF case 82
0057AD0F                 retn
0057AD10 ; ---------------------------------------------------------------------------
0057AD10
0057AD10 loc_57AD10:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD10                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD10                 mov     eax, 0E9h       ; jumptable 0057ABBF case 83
0057AD15                 retn
0057AD16 ; ---------------------------------------------------------------------------
0057AD16
0057AD16 loc_57AD16:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD16                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD16                 mov     eax, 0EAh       ; jumptable 0057ABBF case 84
0057AD1B                 retn
0057AD1C ; ---------------------------------------------------------------------------
0057AD1C
0057AD1C loc_57AD1C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD1C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD1C                 mov     eax, 0EBh       ; jumptable 0057ABBF case 85
0057AD21                 retn
0057AD22 ; ---------------------------------------------------------------------------
0057AD22
0057AD22 loc_57AD22:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD22                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD22                 mov     eax, 0ECh       ; jumptable 0057ABBF case 86
0057AD27                 retn
0057AD28 ; ---------------------------------------------------------------------------
0057AD28
0057AD28 loc_57AD28:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD28                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD28                 mov     eax, 0EDh       ; jumptable 0057ABBF case 87
0057AD2D                 retn
0057AD2E ; ---------------------------------------------------------------------------
0057AD2E
0057AD2E loc_57AD2E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD2E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD2E                 mov     eax, 0EEh       ; jumptable 0057ABBF case 88
0057AD33                 retn
0057AD34 ; ---------------------------------------------------------------------------
0057AD34
0057AD34 loc_57AD34:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD34                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD34                 mov     eax, 0EFh       ; jumptable 0057ABBF case 89
0057AD39                 retn
0057AD3A ; ---------------------------------------------------------------------------
0057AD3A
0057AD3A loc_57AD3A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD3A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD3A                 mov     eax, 0F0h       ; jumptable 0057ABBF case 90
0057AD3F                 retn
0057AD40 ; ---------------------------------------------------------------------------
0057AD40
0057AD40 loc_57AD40:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD40                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD40                 mov     eax, 0F1h       ; jumptable 0057ABBF case 91
0057AD45                 retn
0057AD46 ; ---------------------------------------------------------------------------
0057AD46
0057AD46 loc_57AD46:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD46                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD46                 mov     eax, 0F2h       ; jumptable 0057ABBF case 92
0057AD4B                 retn
0057AD4C ; ---------------------------------------------------------------------------
0057AD4C
0057AD4C loc_57AD4C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD4C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD4C                 mov     eax, 0F3h       ; jumptable 0057ABBF case 93
0057AD51                 retn
0057AD52 ; ---------------------------------------------------------------------------
0057AD52
0057AD52 loc_57AD52:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD52                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD52                 mov     eax, 0F4h       ; jumptable 0057ABBF case 94
0057AD57                 retn
0057AD58 ; ---------------------------------------------------------------------------
0057AD58
0057AD58 loc_57AD58:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD58                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD58                 mov     eax, 0F5h       ; jumptable 0057ABBF case 95
0057AD5D                 retn
0057AD5E ; ---------------------------------------------------------------------------
0057AD5E
0057AD5E loc_57AD5E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD5E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD5E                 mov     eax, 0F6h       ; jumptable 0057ABBF case 96
0057AD63                 retn
0057AD64 ; ---------------------------------------------------------------------------
0057AD64
0057AD64 loc_57AD64:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD64                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD64                 mov     eax, 0F7h       ; jumptable 0057ABBF case 97
0057AD69                 retn
0057AD6A ; ---------------------------------------------------------------------------
0057AD6A
0057AD6A loc_57AD6A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD6A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD6A                 mov     eax, 0F8h       ; jumptable 0057ABBF case 98
0057AD6F                 retn
0057AD70 ; ---------------------------------------------------------------------------
0057AD70
0057AD70 loc_57AD70:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD70                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD70                 mov     eax, 0F9h       ; jumptable 0057ABBF case 99
0057AD75                 retn
0057AD76 ; ---------------------------------------------------------------------------
0057AD76
0057AD76 loc_57AD76:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD76                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD76                 mov     eax, 0FAh       ; jumptable 0057ABBF case 100
0057AD7B                 retn
0057AD7C ; ---------------------------------------------------------------------------
0057AD7C
0057AD7C loc_57AD7C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD7C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD7C                 mov     eax, 0FBh       ; jumptable 0057ABBF case 101
0057AD81                 retn
0057AD82 ; ---------------------------------------------------------------------------
0057AD82
0057AD82 loc_57AD82:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD82                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD82                 mov     eax, 0FCh       ; jumptable 0057ABBF case 102
0057AD87                 retn
0057AD88 ; ---------------------------------------------------------------------------
0057AD88
0057AD88 loc_57AD88:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD88                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD88                 mov     eax, 0FDh       ; jumptable 0057ABBF case 103
0057AD8D                 retn
0057AD8E ; ---------------------------------------------------------------------------
0057AD8E
0057AD8E loc_57AD8E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD8E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD8E                 mov     eax, 0FEh       ; jumptable 0057ABBF case 104
0057AD93                 retn
0057AD94 ; ---------------------------------------------------------------------------
0057AD94
0057AD94 loc_57AD94:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD94                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD94                 mov     eax, 0FFh       ; jumptable 0057ABBF case 105
0057AD99                 retn
0057AD9A ; ---------------------------------------------------------------------------
0057AD9A
0057AD9A loc_57AD9A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AD9A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AD9A                 mov     eax, 100h       ; jumptable 0057ABBF case 106
0057AD9F                 retn
0057ADA0 ; ---------------------------------------------------------------------------
0057ADA0
0057ADA0 loc_57ADA0:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADA0                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADA0                 mov     eax, 101h       ; jumptable 0057ABBF case 107
0057ADA5                 retn
0057ADA6 ; ---------------------------------------------------------------------------
0057ADA6
0057ADA6 loc_57ADA6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADA6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADA6                 mov     eax, 102h       ; jumptable 0057ABBF case 108
0057ADAB                 retn
0057ADAC ; ---------------------------------------------------------------------------
0057ADAC
0057ADAC loc_57ADAC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADAC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADAC                 mov     eax, 103h       ; jumptable 0057ABBF case 109
0057ADB1                 retn
0057ADB2 ; ---------------------------------------------------------------------------
0057ADB2
0057ADB2 loc_57ADB2:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADB2                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADB2                 mov     eax, 104h       ; jumptable 0057ABBF case 110
0057ADB7                 retn
0057ADB8 ; ---------------------------------------------------------------------------
0057ADB8
0057ADB8 loc_57ADB8:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADB8                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADB8                 mov     eax, 105h       ; jumptable 0057ABBF case 111
0057ADBD                 retn
0057ADBE ; ---------------------------------------------------------------------------
0057ADBE
0057ADBE loc_57ADBE:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADBE                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADBE                 mov     eax, 106h       ; jumptable 0057ABBF case 112
0057ADC3                 retn
0057ADC4 ; ---------------------------------------------------------------------------
0057ADC4
0057ADC4 loc_57ADC4:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADC4                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADC4                 mov     eax, 107h       ; jumptable 0057ABBF case 113
0057ADC9                 retn
0057ADCA ; ---------------------------------------------------------------------------
0057ADCA
0057ADCA loc_57ADCA:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADCA                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADCA                 mov     eax, 108h       ; jumptable 0057ABBF case 114
0057ADCF                 retn
0057ADD0 ; ---------------------------------------------------------------------------
0057ADD0
0057ADD0 loc_57ADD0:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADD0                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADD0                 mov     eax, 109h       ; jumptable 0057ABBF case 115
0057ADD5                 retn
0057ADD6 ; ---------------------------------------------------------------------------
0057ADD6
0057ADD6 loc_57ADD6:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADD6                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADD6                 mov     eax, 10Ah       ; jumptable 0057ABBF case 116
0057ADDB                 retn
0057ADDC ; ---------------------------------------------------------------------------
0057ADDC
0057ADDC loc_57ADDC:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADDC                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADDC                 mov     eax, 10Bh       ; jumptable 0057ABBF case 117
0057ADE1                 retn
0057ADE2 ; ---------------------------------------------------------------------------
0057ADE2
0057ADE2 loc_57ADE2:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADE2                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADE2                 mov     eax, 10Ch       ; jumptable 0057ABBF case 118
0057ADE7                 retn
0057ADE8 ; ---------------------------------------------------------------------------
0057ADE8
0057ADE8 loc_57ADE8:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADE8                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADE8                 mov     eax, 10Dh       ; jumptable 0057ABBF case 119
0057ADED                 retn
0057ADEE ; ---------------------------------------------------------------------------
0057ADEE
0057ADEE loc_57ADEE:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADEE                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADEE                 mov     eax, 10Eh       ; jumptable 0057ABBF case 120
0057ADF3                 retn
0057ADF4 ; ---------------------------------------------------------------------------
0057ADF4
0057ADF4 loc_57ADF4:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADF4                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADF4                 mov     eax, 10Fh       ; jumptable 0057ABBF case 121
0057ADF9                 retn
0057ADFA ; ---------------------------------------------------------------------------
0057ADFA
0057ADFA loc_57ADFA:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057ADFA                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057ADFA                 mov     eax, 110h       ; jumptable 0057ABBF case 122
0057ADFF                 retn
0057AE00 ; ---------------------------------------------------------------------------
0057AE00
0057AE00 loc_57AE00:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE00                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE00                 mov     eax, 111h       ; jumptable 0057ABBF case 123
0057AE05                 retn
0057AE06 ; ---------------------------------------------------------------------------
0057AE06
0057AE06 loc_57AE06:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE06                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE06                 mov     eax, 112h       ; jumptable 0057ABBF case 124
0057AE0B                 retn
0057AE0C ; ---------------------------------------------------------------------------
0057AE0C
0057AE0C loc_57AE0C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE0C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE0C                 mov     eax, 113h       ; jumptable 0057ABBF case 125
0057AE11                 retn
0057AE12 ; ---------------------------------------------------------------------------
0057AE12
0057AE12 loc_57AE12:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE12                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE12                 mov     eax, 114h       ; jumptable 0057ABBF case 126
0057AE17                 retn
0057AE18 ; ---------------------------------------------------------------------------
0057AE18
0057AE18 loc_57AE18:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE18                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE18                 mov     eax, 115h       ; jumptable 0057ABBF case 127
0057AE1D                 retn
0057AE1E ; ---------------------------------------------------------------------------
0057AE1E
0057AE1E loc_57AE1E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE1E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE1E                 mov     eax, 116h       ; jumptable 0057ABBF case 128
0057AE23                 retn
0057AE24 ; ---------------------------------------------------------------------------
0057AE24
0057AE24 loc_57AE24:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE24                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE24                 mov     eax, 117h       ; jumptable 0057ABBF case 129
0057AE29                 retn
0057AE2A ; ---------------------------------------------------------------------------
0057AE2A
0057AE2A loc_57AE2A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE2A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE2A                 mov     eax, 118h       ; jumptable 0057ABBF case 130
0057AE2F                 retn
0057AE30 ; ---------------------------------------------------------------------------
0057AE30
0057AE30 loc_57AE30:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE30                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE30                 mov     eax, 119h       ; jumptable 0057ABBF case 131
0057AE35                 retn
0057AE36 ; ---------------------------------------------------------------------------
0057AE36
0057AE36 loc_57AE36:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE36                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE36                 mov     eax, 11Ah       ; jumptable 0057ABBF case 132
0057AE3B                 retn
0057AE3C ; ---------------------------------------------------------------------------
0057AE3C
0057AE3C loc_57AE3C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE3C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE3C                 mov     eax, 11Bh       ; jumptable 0057ABBF case 133
0057AE41                 retn
0057AE42 ; ---------------------------------------------------------------------------
0057AE42
0057AE42 loc_57AE42:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE42                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE42                 mov     eax, 11Ch       ; jumptable 0057ABBF case 134
0057AE47                 retn
0057AE48 ; ---------------------------------------------------------------------------
0057AE48
0057AE48 loc_57AE48:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE48                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE48                 mov     eax, 11Dh       ; jumptable 0057ABBF case 135
0057AE4D                 retn
0057AE4E ; ---------------------------------------------------------------------------
0057AE4E
0057AE4E loc_57AE4E:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE4E                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE4E                 mov     eax, 11Eh       ; jumptable 0057ABBF case 136
0057AE53                 retn
0057AE54 ; ---------------------------------------------------------------------------
0057AE54
0057AE54 loc_57AE54:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE54                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE54                 mov     eax, 11Fh       ; jumptable 0057ABBF case 137
0057AE59                 retn
0057AE5A ; ---------------------------------------------------------------------------
0057AE5A
0057AE5A loc_57AE5A:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE5A                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE5A                 mov     eax, 120h       ; jumptable 0057ABBF case 138
0057AE5F                 retn
0057AE60 ; ---------------------------------------------------------------------------
0057AE60
0057AE60 loc_57AE60:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE60                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE60                 mov     eax, 121h       ; jumptable 0057ABBF case 139
0057AE65                 retn
0057AE66 ; ---------------------------------------------------------------------------
0057AE66
0057AE66 loc_57AE66:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE66                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE66                 mov     eax, 122h       ; jumptable 0057ABBF case 140
0057AE6B                 retn
0057AE6C ; ---------------------------------------------------------------------------
0057AE6C
0057AE6C loc_57AE6C:                             ; CODE XREF: sub_57ABB0+Fâ†‘j
0057AE6C                                         ; DATA XREF: .text:jpt_57ABBFâ†“o
0057AE6C                 mov     eax, 123h       ; jumptable 0057ABBF case 141
00798002                 push    ebx
00798003                 push    ebp
00798004                 push    esi
00798005                 push    edi
00798006                 mov     eax, dword_12EA8B0
0079800B                 xor     eax, esp
0079800D                 push    eax
0079800E                 lea     eax, [esp+19Ch+var_C]
00798015                 mov     large fs:0, eax
0079801B                 mov     esi, ecx
0079801D                 xor     ebp, ebp
0079801F                 cmp     [esi+14h], ebp
00798022                 jz      loc_79825E
00798028                 cmp     [esi+18h], ebp
0079802B                 jz      loc_79825E
00798031                 cmp     [esi+1Ch], ebp
00798034                 jz      loc_79825E
0079803A                 mov     eax, [esi+28h]
0079803D                 or      eax, [esi+2Ch]
00798040                 jz      loc_79825E
00798046                 mov     ecx, [esi+0Ch]
00798049                 call    sub_4D7460
0079804E                 mov     ecx, eax
00798050                 mov     eax, [ecx+30Ch]
00798056                 mov     ecx, [ecx+310h]
0079805C                 mov     edx, 3E8h
00798061                 mul     edx
00798063                 xor     edi, edi
00798065                 add     eax, ecx
00798067                 mov     ecx, [esi+2Ch]
0079806A                 adc     edx, edi
0079806C                 mov     edi, [esi+28h]
0079806F                 xor     ebx, ebx
00798071                 cmp     edx, ecx
00798073                 mov     [esp+19Ch+var_184], ebp
00798077                 jb      short loc_798089
00798079                 ja      short loc_79807F
0079807B                 cmp     eax, edi
0079807D                 jb      short loc_798089
0079807F
0079807F loc_79807F:                             ; CODE XREF: sub_797FE0+99â†‘j
0079807F                 sub     eax, edi
00798081                 sbb     edx, ecx
00798083                 mov     ebx, eax
00798085                 mov     [esp+19Ch+var_184], edx
00798089
00798089 loc_798089:                             ; CODE XREF: sub_797FE0+97â†‘j
00798089                                         ; sub_797FE0+9Dâ†‘j
00798089                 movzx   eax, byte ptr [esi+20h]
0079808D                 add     eax, 1
00798090                 imul    eax, 3E8h
00798096                 mov     edi, eax
00798098                 sub     edi, ebx
0079809A                 js      loc_798203
007980A0                 push    1
007980A2                 cmp     edi, eax
007980A4                 push    3
007980A6                 lea     ecx, [esp+1A4h+var_164]
007980AA                 cmova   edi, eax
007980AD                 call    sub_5440F0
007980B2                 mov     [esp+19Ch+var_4], ebp
007980B9                 mov     eax, 10624DD3h
007980BE                 imul    edi
007980C0                 sar     edx, 6
007980C3                 mov     ebx, edx
007980C5                 shr     ebx, 1Fh
007980C8                 add     ebx, edx
007980CA                 movzx   edx, byte ptr [esi+21h]
007980CE                 cmp     edx, ebx
007980D0                 jz      loc_7981DE
007980D6                 cmp     ebx, ebp
007980D8                 lea     ecx, [esp+19Ch+var_15C]
007980DC                 jbe     short loc_7980E6
007980DE                 push    ebx
007980DF                 call    sub_4E75F0
007980E4                 jmp     short loc_7980F3
007980E6 ; ---------------------------------------------------------------------------
007980E6
007980E6 loc_7980E6:                             ; CODE XREF: sub_797FE0+FCâ†‘j
007980E6                 lea     eax, [esi+30h]
007980E9                 push    eax
007980EA                 push    ecx
007980EB                 call    sub_7982B0
007980F0                 add     esp, 8
007980F3
007980F3 loc_7980F3:                             ; CODE XREF: sub_797FE0+104â†‘j
007980F3                 lea     edx, [esp+19Ch+var_180]
007980F7                 push    edx
007980F8                 lea     ecx, [esp+1A0h+var_164]
007980FC                 call    sub_5404E0
00798101                 mov     byte ptr [esp+19Ch+var_4], 1
00798109                 push    eax
0079810A                 lea     ecx, [esp+1A0h+var_DC]
00798111                 call    sub_4473F0
00798116                 mov     byte ptr [esp+19Ch+var_4], 2
0079811E                 mov     ecx, [esi+1Ch]
00798121                 push    1
00798123                 push    ebp
00798124                 lea     eax, [esp+1A4h+var_DC]
0079812B                 push    eax
0079812C                 call    sub_9556A0
00798131                 mov     byte ptr [esp+19Ch+var_4], 1
00798139                 lea     ecx, [esp+19Ch+var_DC] ; void *
00798140                 call    sub_446F50
00798145                 mov     byte ptr [esp+19Ch+var_4], 0
0079814D                 lea     ecx, [esp+19Ch+var_180]
00798151                 call    sub_8F3250
00798156                 push    offset aCountdownpopup ; "CountdownPopupAnime.Start"
0079815B                 lea     ecx, [esp+1A0h+var_64]
00798162                 call    sub_448730
00798167                 mov     byte ptr [esp+19Ch+var_4], 3
0079816F                 lea     ecx, [esp+19Ch+var_64]
00798176                 push    ecx
00798177                 call    sub_928280
0079817C                 mov     edi, eax
0079817E                 add     esp, 4
00798181                 cmp     edi, ebp
00798183                 jz      short loc_7981C7
00798185                 mov     eax, [esi+18h]
00798188                 cmp     eax, ebp
0079818A                 jz      short loc_798192
0079818C                 lea     ebp, [eax+0B4h]
00798192
00798192 loc_798192:                             ; CODE XREF: sub_797FE0+1AAâ†‘j
00798192                 lea     ecx, [esp+19Ch+var_DC]
00798199                 call    sub_52D330
0079819E                 mov     byte ptr [esp+19Ch+var_4], 4
007981A6                 mov     edx, [edi]
007981A8                 push    0
007981AA                 push    ebp
007981AB                 push    eax
007981AC                 mov     eax, [edx+8]
007981AF                 mov     ecx, edi
007981B1                 call    eax
007981B3                 mov     byte ptr [esp+19Ch+var_4], 3
007981BB                 lea     ecx, [esp+19Ch+var_DC] ; void *
007981C2                 call    sub_52CBA0
007981C7
007981C7 loc_7981C7:                             ; CODE XREF: sub_797FE0+1A3â†‘j
007981C7                 mov     [esi+21h], bl
007981CA                 mov     byte ptr [esp+19Ch+var_4], 0
007981D2                 lea     ecx, [esp+19Ch+var_64] ; void *
007981D9                 call    sub_446F50
007981DE
007981DE loc_7981DE:                             ; CODE XREF: sub_797FE0+F0â†‘j
007981DE                 mov     [esp+19Ch+var_4], 0FFFFFFFFh
007981E9                 lea     ecx, [esp+19Ch+var_110]
007981F0                 call    sub_53D300
007981F5                 lea     ecx, [esp+19Ch+var_110]
007981FC                 call    sub_53B870
00798201                 jmp     short loc_79825E
00798203 ; ---------------------------------------------------------------------------
00798203
00798203 loc_798203:                             ; CODE XREF: sub_797FE0+BAâ†‘j
00798203                 mov     [esi+28h], ebp
00798206                 mov     [esi+2Ch], ebp
00798209                 mov     ecx, ds:dword_F67298
0079820F                 push    ecx             ; Size
00798210                 push    (offset off_FE2DC6+1) ; Src
00798215                 lea     ecx, [esp+1A4h+var_64]
0079821C                 call    sub_447260
00798221                 mov     [esp+19Ch+var_4], 5
0079822C                 mov     ecx, [esi+1Ch]
0079822F                 push    1
00798231                 push    ebp
00798232                 lea     edx, [esp+1A4h+var_64]
00798239                 push    edx
0079823A                 call    sub_9556A0
0079823F                 mov     [esp+19Ch+var_4], 0FFFFFFFFh
0079824A                 lea     ecx, [esp+19Ch+var_64] ; void *
00798251                 call    sub_446F50
00798256                 mov     ecx, [esi+14h]
00798259                 call    sub_96DE70
0079825E
0079825E loc_79825E:                             ; CODE XREF: sub_797FE0+42â†‘j
0079825E                                         ; sub_797FE0+4Bâ†‘j ...
0079825E                 mov     ecx, [esp+19Ch+var_C]
00798265                 mov     large fs:0, ecx
0079826C                 pop     ecx
0079826D                 pop     edi
0079826E                 pop     esi
0079826F                 pop     ebp
00798270                 pop     ebx
00798271                 mov     ecx, [esp+188h+var_10]
00798278                 xor     ecx, esp
0079827A                 call    sub_9D20F4
0079827F                 add     esp, 188h
00798285                 retn
00798285 ; } // starts at 797FE0
00798285 sub_797FE0      endp
00798285
00798285 ; ---------------------------------------------------------------------------
00798286                 align 10h
00798290
00798290 loc_798290:                             ; DATA XREF: .rdata:off_FE3100â†“o
00798290                 push    esi
00798291                 mov     esi, ecx
00798293                 call    sub_797A50
00798298                 test    byte ptr [esp+8], 1
0079829D                 jz      short loc_7982A8
0079829F                 push    esi
007982A0                 call    j__free
007982A5                 add     esp, 4
007982A8
007982A8 loc_7982A8:                             ; CODE XREF: .text:0079829Dâ†‘j
007982A8                 mov     eax, esi
007982AA                 pop     esi
007982AB                 retn    4
007982AB ; ---------------------------------------------------------------------------
007982AE                 align 10h
007982B0
007982B0 ; =============== S U B R O U T I N E =======================================
007982B0
007982B0
007982B0 sub_7982B0      proc near               ; CODE XREF: sub_797FE0+10Bâ†‘p
007982B0
007982B0 arg_0           = dword ptr  4
007982B0 arg_4           = dword ptr  8
007982B0
007982B0                 mov     ecx, [esp+arg_4]
007982B4                 push    esi
007982B5                 call    sub_445210
007982BA                 mov     esi, [esp+4+arg_0]
007982BE                 push    eax
007982BF                 push    esi
007982C0                 call    sub_4E7290
007982C5                 add     esp, 8
007982C8                 mov     eax, esi
007982CA                 pop     esi
007982CB                 retn
007982CB sub_7982B0      endp
007982CB
007982CB ; ---------------------------------------------------------------------------
007982CC                 align 10h
007982D0
007982D0 ; =============== S U B R O U T I N E =======================================
007982D0
007982D0
007982D0 sub_7982D0      proc near               ; CODE XREF: sub_585800+8Eâ†‘p
007982D0                                         ; sub_798470+43â†“p
007982D0
007982D0 arg_0           = dword ptr  4
007982D0 arg_4           = dword ptr  8
007982D0 arg_8           = dword ptr  0Ch
007982D0 arg_C           = dword ptr  10h
007982D0
007982D0                 mov     eax, [esp+arg_0]
007982D4                 cmp     eax, 22h ; '"'
007982D7                 jbe     short loc_7982F2
007982D9                 mov     eax, [esp+arg_4]
007982DD                 mov     ecx, [esp+arg_8]
007982E1                 mov     edx, [esp+arg_C]
007982E5                 mov     byte ptr [eax], 0
007982E8                 mov     byte ptr [ecx], 0
007982EB                 mov     dword ptr [edx], 12h
007982F1                 retn
007982F2 ; ---------------------------------------------------------------------------
007982F2
007982F2 loc_7982F2:                             ; CODE XREF: sub_7982D0+7â†‘j
007982F2                 mov     edx, [esp+arg_4]
007982F6                 lea     eax, [eax+eax*2]
007982F9                 add     eax, eax
007982FB                 movzx   ecx, ds:byte_FE32DC[eax+eax]
00798303                 add     eax, eax
00798305                 mov     [edx], cl
00798307                 movzx   ecx, ds:byte_FE32DD[eax]
0079830E                 mov     edx, [esp+arg_8]
00798312                 mov     [edx], cl
00798314                 mov     eax, ds:dword_FE32E0[eax]
0079831A                 mov     ecx, [esp+arg_C]
0079831E                 mov     [ecx], eax
00798320                 retn
00798320 sub_7982D0      endp
00798320
00798320 ; ---------------------------------------------------------------------------
00798321                 align 10h
00798330
00798330 ; =============== S U B R O U T I N E =======================================
00798330
00798330
00798330 sub_798330      proc near               ; CODE XREF: sub_65AAD0+50â†‘p
00798330                                         ; sub_65AB90+63â†‘p ...
00798330
00798330 arg_0           = dword ptr  4
00798330 arg_4           = dword ptr  8
00798330 arg_8           = dword ptr  0Ch
00798330 arg_C           = dword ptr  10h
00798330
00798330                 mov     eax, [esp+arg_4]
00798334                 cmp     eax, 0Bh
00798337                 mov     ecx, [esp+arg_0]
0079833B                 jnz     short loc_79834E
0079833D                 mov     eax, [esp+arg_C]
00798341                 and     eax, offset aQaexpavTlistel ; "@QAEXPAV?$TListElem@PAX@?$TFixedArrayed"...
00798346                 or      eax, 0B000000h
0079834B                 mov     [ecx], eax
0079834D                 retn
0079834E ; ---------------------------------------------------------------------------
0079834E
0079834E loc_79834E:                             ; CODE XREF: sub_798330+Bâ†‘j
0079834E                 mov     edx, [esp+arg_8]
00798352                 and     edx, 0FFFh
00798358                 shl     eax, 0Ch
0079835B                 or      edx, eax
0079835D                 mov     eax, [esp+arg_C]
00798361                 shl     edx, 0Ch
00798364                 and     eax, 0FFFh
00798369                 or      edx, eax
0079836B                 mov     [ecx], edx
0079836D                 retn
0079836D sub_798330      endp
0079836D
0079836D ; ---------------------------------------------------------------------------
0079836E                 align 10h
00798370
00798370 ; =============== S U B R O U T I N E =======================================
00798370
00798370
00798370 sub_798370      proc near               ; CODE XREF: sub_585800+26â†‘p
00798370                                         ; sub_8440A0+32â†“p
00798370
00798370 arg_0           = dword ptr  4
00798370 arg_4           = dword ptr  8
00798370 arg_8           = dword ptr  0Ch
00798370 arg_C           = dword ptr  10h
00798370
00798370                 mov     eax, [esp+arg_0]
00798374                 mov     edx, [esp+arg_4]
00798378                 mov     ecx, eax
0079837A                 shr     ecx, 18h
0079837D                 cmp     ecx, 0Bh
00798380                 mov     [edx], ecx
00798382                 jnz     short loc_79839A
00798384                 mov     ecx, [esp+arg_8]
00798388                 mov     edx, [esp+arg_C]
0079838C                 and     eax, offset aQaexpavTlistel ; "@QAEXPAV?$TListElem@PAX@?$TFixedArrayed"...
00798391                 mov     dword ptr [ecx], 0
00798397                 mov     [edx], eax
00798399                 retn
0079839A ; ---------------------------------------------------------------------------
0079839A
0079839A loc_79839A:                             ; CODE XREF: sub_798370+12â†‘j
0079839A                 mov     edx, [esp+arg_8]
0079839E                 mov     ecx, eax
007983A0                 shr     ecx, 0Ch
007983A3                 and     ecx, 0FFFh
007983A9                 mov     [edx], ecx
007983AB                 mov     ecx, [esp+arg_C]
007983AF                 and     eax, 0FFFh
007983B4                 mov     [ecx], eax
007983B6                 retn
007983B6 sub_798370      endp
007983B6
007983B6 ; ---------------------------------------------------------------------------
007983B7                 align 10h
007983C0
007983C0 ; =============== S U B R O U T I N E =======================================
007983C0
007983C0
007983C0 ; int __stdcall sub_7983C0(int, void *Src)
007983C0 sub_7983C0      proc near               ; CODE XREF: sub_798AA0+34â†“p
007983C0
007983C0 var_10          = dword ptr -10h
007983C0 var_C           = dword ptr -0Ch
007983C0 var_4           = dword ptr -4
007983C0 arg_0           = dword ptr  4
007983C0 Src             = dword ptr  8
007983C0
007983C0 ; FUNCTION CHUNK AT 00EA8320 SIZE 00000023 BYTES
007983C0
007983C0 ; __unwind { // SEH_7983C0
007983C0                 push    0FFFFFFFFh
007983C2                 push    offset SEH_7983C0
007983C7                 mov     eax, large fs:0
007983CD                 push    eax
007983CE                 push    ecx
007983CF                 push    esi
007983D0                 push    edi
007983D1                 mov     eax, dword_12EA8B0
007983D6                 xor     eax, esp
007983D8                 push    eax
007983D9                 lea     eax, [esp+1Ch+var_C]
007983DD                 mov     large fs:0, eax
007983E3                 mov     esi, ecx
007983E5                 mov     [esp+1Ch+var_10], esi
007983E9                 mov     eax, [esp+1Ch+arg_0]
007983ED                 push    0Ah
007983EF                 push    eax
007983F0                 call    sub_631EF0
007983F5                 mov     [esp+1Ch+var_4], 0
007983FD                 push    1A0h            ; Size
00798402                 mov     dword ptr [esi], offset off_FE4434
00798408                 mov     dword ptr [esi+4], offset off_FE4414
0079840F                 lea     edi, [esi+2Ch]
00798412                 push    0               ; Val
00798414                 mov     dword ptr [edi], 0
0079841A                 push    edi             ; void *
0079841B                 mov     dword ptr [esi+28h], 0FFFFFFFFh
00798422                 call    _memset
00798427                 mov     ecx, [esp+28h+Src]
0079842B                 movzx   eax, word ptr [ecx+30h]
0079842F                 lea     edx, [eax+eax*4]
00798432                 lea     eax, ds:38h[edx*4]
00798439                 push    eax             ; Size
0079843A                 push    ecx             ; Src
0079843B                 push    edi             ; void *
0079843C                 call    _memcpy
00798441                 add     esp, 18h
00798444                 mov     dword ptr [esi+1CCh], 0
0079844E                 mov     [esp+1Ch+var_4], 0FFFFFFFFh
00798456                 mov     eax, esi
00798458                 mov     ecx, [esp+1Ch+var_C]
0079845C                 mov     large fs:0, ecx
00798463                 pop     ecx
00798464                 pop     edi
00798465                 pop     esi
00798466                 add     esp, 10h
00798469                 retn    8
00798469 ; } // starts at 7983C0
00798469 sub_7983C0      endp
00798469
00798469 ; ---------------------------------------------------------------------------
0079846C                 align 10h
00798470
00798470 ; =============== S U B R O U T I N E =======================================
00798470
00798470
00798470 sub_798470      proc near               ; DATA XREF: .rdata:00FE4474â†“o
00798470                                         ; .rdata:00FE4584â†“o
00798470
00798470 var_7           = byte ptr -7
00798470 var_6           = byte ptr -6
00798470 var_5           = byte ptr -5
00798470 var_4           = dword ptr -4
00798470
00798470                 sub     esp, 8
00798473                 push    ebx
00798474                 push    ebp
00798475                 push    esi
00798476                 mov     esi, ecx
00798478                 mov     eax, [esi+3Ch]
0079847B                 push    edi
0079847C                 mov     edi, eax
0079847E                 xor     cl, cl
00798480                 shr     edi, 18h
00798483                 cmp     edi, 0Bh
00798486                 mov     [esp+18h+var_7], cl
0079848A                 jnz     loc_798510
00798490                 xor     ebp, ebp
00798492                 and     eax, offset aQaexpavTlistel ; "@QAEXPAV?$TListElem@PAX@?$TFixedArrayed"...
00798497                 mov     ebx, eax
00798499
00798499 loc_798499:                             ; CODE XREF: sub_798470+E1â†“j
00798499                 lea     eax, [esp+18h+var_4]
0079849D                 push    eax
0079849E                 lea     ecx, [esp+1Ch+var_5]
007984A2                 push    ecx
007984A3                 lea     edx, [esp+20h+var_6]
007984A7                 push    edx
007984A8                 push    edi
007984A9                 mov     [esp+28h+var_6], 0
007984AE                 mov     [esp+28h+var_5], 0
007984B3                 call    sub_7982D0
007984B8                 add     esp, 10h
007984BB                 cmp     [esp+18h+var_6], 0
007984C0                 jz      short loc_7984DB
007984C2                 mov     ecx, [esp+18h+var_4]
007984C6                 mov     eax, [esi]
007984C8                 mov     edx, [eax+54h]
007984CB                 push    ecx
007984CC                 push    ebp
007984CD                 push    edi
007984CE                 mov     ecx, esi
007984D0                 call    edx
007984D2                 test    al, al
007984D4                 jz      short loc_7984DB
007984D6                 mov     [esp+18h+var_7], 1
007984DB
007984DB loc_7984DB:                             ; CODE XREF: sub_798470+50â†‘j
007984DB                                         ; sub_798470+64â†‘j
007984DB                 cmp     [esp+18h+var_5], 0
007984E0                 jz      short loc_7984F6
007984E2                 mov     ecx, [esp+18h+var_4]
007984E6                 mov     eax, [esi]
007984E8                 mov     edx, [eax+58h]
007984EB                 push    ecx
007984EC                 push    ebx
007984ED                 push    edi
007984EE                 mov     ecx, esi
007984F0                 call    edx
007984F2                 test    al, al
007984F4                 jnz     short loc_798536
007984F6
007984F6 loc_7984F6:                             ; CODE XREF: sub_798470+70â†‘j
007984F6                 cmp     [esp+18h+var_7], 0
007984FB                 jz      short loc_798504
007984FD                 mov     ecx, esi
007984FF                 call    sub_6323D0
00798504
00798504 loc_798504:                             ; CODE XREF: sub_798470+8Bâ†‘j
00798504                                         ; sub_798470+110â†“j ...
00798504                 mov     al, [esp+18h+var_7]
00798508                 pop     edi
00798509                 pop     esi
0079850A                 pop     ebp
0079850B                 pop     ebx
0079850C                 add     esp, 8
0079850F                 retn
00798510 ; ---------------------------------------------------------------------------
00798510
00798510 loc_798510:                             ; CODE XREF: sub_798470+1Aâ†‘j
00798510                 mov     ebp, eax
00798512                 shr     ebp, 0Ch
00798515                 and     eax, 0FFFh
0079851A                 and     ebp, 0FFFh
00798520                 cmp     edi, 78h ; 'x'
00798523                 mov     ebx, eax
00798525                 jnz     short loc_79854E
00798527                 mov     ecx, [esi+1CCh]
0079852D                 mov     eax, [ecx]
0079852F                 mov     edx, [eax+24h]
00798532                 push    ebx
00798533                 push    ebp
00798534                 call    edx
00798536
00798536 loc_798536:                             ; CODE XREF: sub_798470+84â†‘j
00798536                                         ; sub_798470+132â†“j
00798536                 mov     ecx, esi
00798538                 mov     [esp+18h+var_7], 1
0079853D                 call    sub_6323D0
00798542                 mov     al, [esp+18h+var_7]
00798546                 pop     edi
00798547                 pop     esi
00798548                 pop     ebp
00798549                 pop     ebx
0079854A                 add     esp, 8
0079854D                 retn
0079854E ; ---------------------------------------------------------------------------
0079854E
0079854E loc_79854E:                             ; CODE XREF: sub_798470+B5â†‘j
0079854E                 cmp     edi, 6Fh ; 'o'
00798551                 jl      loc_798499
00798557                 cmp     dword ptr [esi+1CCh], 0
0079855E                 jz      loc_7985F1
00798564                 mov     eax, [esi]
00798566                 mov     edx, [eax+60h]
00798569                 lea     ecx, [esp+18h+var_4]
0079856D                 push    ecx
0079856E                 push    ebx
0079856F                 push    edi
00798570                 mov     ecx, esi
00798572                 mov     [esp+24h+var_4], 0
0079857A                 call    edx
0079857C                 mov     edi, eax
0079857E                 test    edi, edi
00798580                 jz      short loc_798504
00798582                 mov     eax, [esi+1CCh]
00798588                 mov     edx, [esi]
0079858A                 mov     ebx, [eax]
0079858C                 mov     eax, [edx+4Ch]
0079858F                 mov     ecx, esi
00798591                 call    eax
00798593                 mov     ecx, [esi+1CCh]
00798599                 mov     edx, [ebx+1Ch]
0079859C                 push    eax
0079859D                 push    edi
0079859E                 call    edx
007985A0                 test    al, al
007985A2                 jnz     short loc_798536
007985A4                 cmp     [esp+18h+var_4], 0
007985A9                 jz      loc_798504
007985AF                 mov     eax, [esi+1CCh]
007985B5                 mov     edx, [esi]
007985B7                 mov     edi, [eax]
007985B9                 mov     eax, [edx+4Ch]
007985BC                 mov     ecx, esi
007985BE                 call    eax
007985C0                 mov     ecx, [esp+18h+var_4]
007985C4                 mov     edx, [edi+1Ch]
007985C7                 push    eax
007985C8                 push    ecx
007985C9                 mov     ecx, [esi+1CCh]
007985CF                 call    edx
007985D1                 test    al, al
007985D3                 jz      loc_798504
007985D9                 mov     ecx, esi
007985DB                 mov     [esp+18h+var_7], 1
007985E0                 call    sub_6323D0
007985E5                 mov     al, [esp+18h+var_7]
007985E9                 pop     edi
007985EA                 pop     esi
007985EB                 pop     ebp
007985EC                 pop     ebx
007985ED                 add     esp, 8
007985F0                 retn
007985F1 ; ---------------------------------------------------------------------------
007985F1
007985F1 loc_7985F1:                             ; CODE XREF: sub_798470+EEâ†‘j
007985F1                 pop     edi
007985F2                 pop     esi
007985F3                 pop     ebp
007985F4                 mov     al, cl
007985F6                 pop     ebx
007985F7                 add     esp, 8
007985FA                 retn
007985FA sub_798470      endp
007985FA
007985FA ; ---------------------------------------------------------------------------
007985FB                 align 10h
00798600
00798600 ; =============== S U B R O U T I N E =======================================
00798600
00798600 ; Attributes: thunk
00798600
00798600 sub_798600      proc near               ; DATA XREF: .rdata:00FE4478â†“o
00798600                                         ; .rdata:00FE4588â†“o
00798600                 jmp     sub_632750
00798600 sub_798600      endp
00798600
00798600 ; ---------------------------------------------------------------------------
00798605                 align 10h
00798610 ; [00000003 BYTES: COLLAPSED FUNCTION nullsub_556. PRESS CTRL-NUMPAD+ TO EXPAND]
00798613                 align 10h
00798620
00798620 ; =============== S U B R O U T I N E =======================================
00798620
00798620
00798620 sub_798620      proc near               ; DATA XREF: .rdata:00FE4488â†“o
00798620                 xor     al, al
00798622                 retn    0Ch
00798622 sub_798620      endp
00798622
00798622 ; ---------------------------------------------------------------------------
00798625                 align 10h
00798630
00798630 ; =============== S U B R O U T I N E =======================================
00798630
00798630
00798630 sub_798630      proc near               ; DATA XREF: .rdata:00FE448Câ†“o
00798630                 xor     al, al
00798632                 retn    0Ch
00798632 sub_798630      endp
00798632
00798632 ; ---------------------------------------------------------------------------
00798635                 align 10h
00798640
00798640 ; =============== S U B R O U T I N E =======================================
00798640
00798640
00798640 sub_798640      proc near               ; DATA XREF: .rdata:00FE4490â†“o
00798640                                         ; .rdata:00FE45A0â†“o
00798640
00798640 arg_0           = dword ptr  4
00798640
00798640                 mov     eax, [esp+arg_0]
00798644                 cmp     eax, 22h ; '"'
00798647                 jbe     short loc_79864E
00798649                 xor     eax, eax
0079864B                 retn    4
0079864E ; ---------------------------------------------------------------------------
0079864E
0079864E loc_79864E:                             ; CODE XREF: sub_798640+7â†‘j
0079864E                 lea     eax, [eax+eax*2]
00798651                 mov     eax, ds:off_FE32D8[eax*4]
00798658                 retn    4
00798658 sub_798640      endp
00798658
00798658 ; ---------------------------------------------------------------------------
0079865B                 align 10h
00798660
00798660 ; =============== S U B R O U T I N E =======================================
00798660
00798660
00798660 sub_798660      proc near               ; CODE XREF: sub_798A40+Eâ†“p
00798660
00798660 arg_0           = dword ptr  4
00798660
00798660                 mov     edx, [esp+arg_0]
00798664                 push    ebx
00798665                 push    esi
00798666                 push    edi
00798667                 xor     eax, eax
00798669                 xor     edi, edi
0079866B                 xor     ecx, ecx
0079866D                 lea     ecx, [ecx+0]
00798670
00798670 loc_798670:                             ; CODE XREF: sub_798660+2Fâ†“j
00798670                 mov     esi, dword_12C44D4[ecx]
00798676                 cmp     edx, esi
00798678                 jl      short loc_798686
0079867A                 mov     ebx, dword_12C44DC[ecx]
00798680                 add     ebx, esi
00798682                 cmp     edx, ebx
00798684                 jl      short loc_798697
00798686
00798686 loc_798686:                             ; CODE XREF: sub_798660+18â†‘j
00798686                 add     ecx, 0Ch
00798689                 add     edi, 1
0079868C                 cmp     ecx, 0Ch
0079868F                 jb      short loc_798670
00798691                 pop     edi
00798692                 pop     esi
00798693                 pop     ebx
00798694                 retn    4
00798697 ; ---------------------------------------------------------------------------
00798697
00798697 loc_798697:                             ; CODE XREF: sub_798660+24â†‘j
00798697                 lea     eax, [edi+edi*2]
0079869A                 add     eax, eax
0079869C                 sub     edx, dword_12C44D4[eax+eax]
007986A3                 add     eax, eax
007986A5                 mov     eax, off_12C44D8[eax]
007986AB                 mov     eax, [eax+edx*4]
007986AE                 pop     edi
007986AF                 pop     esi
007986B0                 pop     ebx
007986B1                 retn    4
007986B1 sub_798660      endp
007986B1
007986B1 ; ---------------------------------------------------------------------------
007986B4                 align 10h
007986C0
007986C0 ; =============== S U B R O U T I N E =======================================
007986C0
007986C0
007986C0 sub_7986C0      proc near               ; CODE XREF: sub_798A40+20â†“p
007986C0
007986C0 arg_0           = dword ptr  4
007986C0
007986C0                 mov     edx, [esp+arg_0]
007986C4                 push    ebx
007986C5                 push    esi
007986C6                 push    edi
007986C7                 xor     eax, eax
007986C9                 xor     edi, edi
007986CB                 xor     ecx, ecx
007986CD                 lea     ecx, [ecx+0]
007986D0
007986D0 loc_7986D0:                             ; CODE XREF: sub_7986C0+2Fâ†“j
007986D0                 mov     esi, dword_12C4530[ecx]
007986D6                 cmp     edx, esi
007986D8                 jl      short loc_7986E6
007986DA                 mov     ebx, dword_12C4538[ecx]
007986E0                 add     ebx, esi
007986E2                 cmp     edx, ebx
007986E4                 jl      short loc_7986F7
007986E6
007986E6 loc_7986E6:                             ; CODE XREF: sub_7986C0+18â†‘j
007986E6                 add     ecx, 0Ch
007986E9                 add     edi, 1
007986EC                 cmp     ecx, 0Ch
007986EF                 jb      short loc_7986D0
007986F1                 pop     edi
007986F2                 pop     esi
007986F3                 pop     ebx
007986F4                 retn    4
007986F7 ; ---------------------------------------------------------------------------
007986F7
007986F7 loc_7986F7:                             ; CODE XREF: sub_7986C0+24â†‘j
007986F7                 lea     eax, [edi+edi*2]
007986FA                 add     eax, eax
007986FC                 sub     edx, dword_12C4530[eax+eax]
00798703                 add     eax, eax
00798705                 mov     eax, off_12C4534[eax]
0079870B                 mov     eax, [eax+edx*4]
0079870E                 pop     edi
0079870F                 pop     esi
00798710                 pop     ebx
00798711                 retn    4
00798711 sub_7986C0      endp
00798711
00798711 ; ---------------------------------------------------------------------------
00798714                 align 10h
00798720
00798720 ; =============== S U B R O U T I N E =======================================
00798720
00798720
00798720 sub_798720      proc near               ; CODE XREF: sub_798A40+32â†“p
00798720
00798720 arg_0           = dword ptr  4
00798720
00798720                 mov     edx, [esp+arg_0]
00798724                 push    ebx
00798725                 push    esi
00798726                 push    edi
00798727                 xor     eax, eax
00798729                 xor     edi, edi
0079872B                 xor     ecx, ecx
0079872D                 lea     ecx, [ecx+0]
00798730
00798730 loc_798730:                             ; CODE XREF: sub_798720+2Fâ†“j
00798730                 mov     esi, dword_12C4590[ecx]
00798736                 cmp     edx, esi
00798738                 jl      short loc_798746
0079873A                 mov     ebx, dword_12C4598[ecx]
00798740                 add     ebx, esi
00798742                 cmp     edx, ebx
00798744                 jl      short loc_798757
00798746
00798746 loc_798746:                             ; CODE XREF: sub_798720+18â†‘j
00798746                 add     ecx, 0Ch
00798749                 add     edi, 1
0079874C                 cmp     ecx, 0Ch
0079874F                 jb      short loc_798730
00798751                 pop     edi
00798752                 pop     esi
00798753                 pop     ebx
00798754                 retn    4
00798757 ; ---------------------------------------------------------------------------
00798757
00798757 loc_798757:                             ; CODE XREF: sub_798720+24â†‘j
00798757                 lea     eax, [edi+edi*2]
0079875A                 add     eax, eax
0079875C                 sub     edx, dword_12C4590[eax+eax]
00798763                 add     eax, eax
00798765                 mov     eax, off_12C4594[eax]
0079876B                 mov     eax, [eax+edx*4]
0079876E                 pop     edi
0079876F                 pop     esi
00798770                 pop     ebx
00798771                 retn    4
00798771 sub_798720      endp
00798771
00798771 ; ---------------------------------------------------------------------------
00798774                 align 10h
00798780
00798780 ; =============== S U B R O U T I N E =======================================
00798780
00798780
00798780 sub_798780      proc near               ; CODE XREF: sub_798A40+49â†“p
00798780
00798780 arg_0           = dword ptr  4
00798780 arg_4           = dword ptr  8
00798780
00798780                 mov     ecx, [esp+arg_0]
00798784                 mov     eax, 10624DD3h
00798789                 imul    ecx
0079878B                 sar     edx, 5
0079878E                 mov     eax, edx
00798790                 shr     eax, 1Fh
00798793                 add     eax, edx
00798795                 mov     edx, eax
00798797                 imul    edx, 1F4h
0079879D                 sub     ecx, edx
0079879F                 push    ecx
007987A0                 add     eax, 1
007987A3                 push    eax
007987A4                 push    offset a1dvfx03d ; "%1dvfx_%03d"
007987A9                 push    9               ; BufferCount
007987AB                 push    offset qword_134D764 ; Buffer
007987B0                 call    _sprintf_s
007987B5                 mov     al, byte_134D76C
007987BA                 movq    xmm0, qword_134D764
007987C2                 mov     ecx, [esp+14h+arg_4]
007987C6                 movq    qword_134D758, xmm0
007987CE                 mov     byte_134D760, al
007987D3                 mov     byte ptr qword_134D758+7, 61h ; 'a'
007987DA                 add     esp, 14h
007987DD                 mov     dword ptr [ecx], offset qword_134D758
007987E3                 mov     eax, offset qword_134D764
007987E8                 retn    8
007987E8 sub_798780      endp
007987E8
007987E8 ; ---------------------------------------------------------------------------
007987EB                 align 10h
007987F0
007987F0 ; =============== S U B R O U T I N E =======================================
007987F0
007987F0
007987F0 sub_7987F0      proc near               ; CODE XREF: sub_798A40+56â†“p
007987F0
007987F0 arg_0           = dword ptr  4
007987F0
007987F0                 push    esi
007987F1                 push    edi
007987F2                 mov     edi, [esp+8+arg_0]
007987F6                 xor     eax, eax
007987F8                 xor     esi, esi
007987FA                 lea     ebx, [ebx+0]
00798800
00798800 loc_798800:                             ; CODE XREF: sub_7987F0+6Aâ†“j
00798800                 movzx   ecx, ds:word_FE4498[esi]
00798807                 cmp     edi, ecx
00798809                 jl      short loc_798851
0079880B                 mov     edx, ds:dword_FE44A0[esi]
00798811                 add     edx, ecx
00798813                 cmp     edi, edx
00798815                 jnb     short loc_798851
00798817                 mov     eax, edi
00798819                 sub     eax, ecx
0079881B                 mov     ecx, ds:off_FE449C[esi]
00798821                 mov     eax, [ecx+eax*4]
00798824                 movzx   ecx, ds:byte_FE449A[esi]
0079882B                 sub     ecx, 1
0079882E                 jnz     short loc_798851
00798830                 push    eax
00798831                 push    offset aS_9     ; "%s"
00798836                 push    20h ; ' '       ; BufferCount
00798838                 push    offset byte_134D770 ; Buffer
0079883D                 call    _sprintf_s
00798842                 add     esp, 10h
00798845                 mov     byte_134D770, 32h ; '2'
0079884C                 mov     eax, offset byte_134D770
00798851
00798851 loc_798851:                             ; CODE XREF: sub_7987F0+19â†‘j
00798851                                         ; sub_7987F0+25â†‘j ...
00798851                 add     esi, 0Ch
00798854                 cmp     esi, 84h
0079885A                 jb      short loc_798800
0079885C                 test    eax, eax
0079885E                 jnz     short loc_798882
00798860                 cmp     edi, 0FA0h
00798866                 jl      short loc_798882
00798868                 push    edi
00798869                 push    offset aParm04d ; "parm%04d"
0079886E                 push    20h ; ' '       ; BufferCount
00798870                 push    offset byte_134D770 ; Buffer
00798875                 call    _sprintf_s
0079887A                 add     esp, 10h
0079887D                 mov     eax, offset byte_134D770
00798882
00798882 loc_798882:                             ; CODE XREF: sub_7987F0+6Eâ†‘j
00798882                                         ; sub_7987F0+76â†‘j
00798882                 pop     edi
00798883                 pop     esi
00798884                 retn    4
00798884 sub_7987F0      endp
00798884
00798884 ; ---------------------------------------------------------------------------
00798887                 align 10h
00798890
00798890 ; =============== S U B R O U T I N E =======================================
00798890
00798890
00798890 sub_798890      proc near               ; DATA XREF: .rdata:00FE4484â†“o
00798890                                         ; .rdata:00FE4594â†“o
00798890                 push    0
00798892                 call    sub_6312F0
00798897                 retn
00798897 sub_798890      endp
00798897
00798897 ; ---------------------------------------------------------------------------
00798898                 align 10h
007988A0
007988A0 ; =============== S U B R O U T I N E =======================================
007988A0
007988A0
007988A0 sub_7988A0      proc near
007988A0
007988A0 arg_0           = dword ptr  4
007988A0 arg_4           = dword ptr  8
007988A0 arg_8           = dword ptr  0Ch
007988A0 arg_C           = dword ptr  10h
007988A0
007988A0                 mov     eax, [esp+arg_0]
007988A4                 mov     edx, [esp+arg_4]
007988A8                 mov     ecx, eax
007988AA                 and     ecx, 7Fh
007988AD                 mov     [edx], ecx
007988AF                 mov     edx, [esp+arg_8]
007988B3                 mov     ecx, eax
007988B5                 shr     ecx, 7
007988B8                 and     ecx, 0FFh
007988BE                 mov     [edx], ecx
007988C0                 mov     ecx, [esp+arg_C]
007988C4                 shr     eax, 0Fh
007988C7                 and     eax, 1FFh
007988CC                 mov     [ecx], eax
007988CE                 retn
007988CE sub_7988A0      endp
007988CE
007988CE ; ---------------------------------------------------------------------------
007988CF                 align 10h
007988D0                 mov     eax, [esp+10h]
007988D4                 movzx   ecx, byte ptr [esp+0Ch]
007988D9                 mov     edx, [esp+8]
007988DD                 and     eax, 1FFh
007988E2                 shl     eax, 8
007988E5                 or      eax, ecx
007988E7                 mov     ecx, [esp+4]
007988EB                 shl     eax, 7
007988EE                 and     edx, 7Fh
007988F1                 or      eax, edx
007988F3                 mov     [ecx], eax
007988F5                 retn
007988F5 ; ---------------------------------------------------------------------------
007988F6                 align 10h
00798900
00798900 ; =============== S U B R O U T I N E =======================================
00798900
00798900
00798900 sub_798900      proc near               ; DATA XREF: .rdata:00FE4574â†“o
00798900
00798900 arg_4           = dword ptr  8
00798900 arg_8           = dword ptr  0Ch
00798900
00798900                 push    esi
00798901                 mov     esi, ecx
00798903                 cmp     dword ptr [esi+1CCh], 0
0079890A                 jz      loc_7989C1
00798910                 movzx   eax, byte ptr [esi+3Fh]
00798914                 cmp     eax, 22h ; '"'
00798917                 push    edi
00798918                 ja      short loc_79897F
0079891A                 lea     eax, [eax+eax*2]
0079891D                 mov     eax, ds:dword_FE32E0[eax*4]
00798924                 cmp     eax, 0Ah
00798927                 jnz     short loc_798950
00798929                 mov     ecx, [esi+1CCh]
0079892F                 mov     edx, [esi]
00798931                 mov     edi, [ecx]
00798933                 mov     eax, [edx+4Ch]
00798936                 mov     ecx, esi
00798938                 call    eax
0079893A                 mov     ecx, [esi+1CCh]
00798940                 mov     edx, [edi+1Ch]
00798943                 push    eax
00798944                 push    offset aGlmain1 ; "glmain1"
00798949                 call    edx
0079894B                 pop     edi
0079894C                 pop     esi
0079894D                 retn    0Ch
00798950 ; ---------------------------------------------------------------------------
00798950
00798950 loc_798950:                             ; CODE XREF: sub_798900+27â†‘j
00798950                 cmp     eax, 0Bh
00798953                 jnz     short loc_79897A
00798955                 mov     eax, [esi+1CCh]
0079895B                 mov     edx, [esi]
0079895D                 mov     edi, [eax]
0079895F                 mov     eax, [edx+4Ch]
00798962                 call    eax
00798964                 mov     ecx, [esi+1CCh]
0079896A                 mov     edx, [edi+1Ch]
0079896D                 push    eax
0079896E                 push    offset aGlmain2 ; "glmain2"
00798973                 call    edx
00798975                 pop     edi
00798976                 pop     esi
00798977                 retn    0Ch
0079897A ; ---------------------------------------------------------------------------
0079897A
0079897A loc_79897A:                             ; CODE XREF: sub_798900+53â†‘j
0079897A                 cmp     eax, 12h
0079897D                 jnz     short loc_798991
0079897F
0079897F loc_79897F:                             ; CODE XREF: sub_798900+18â†‘j
0079897F                 mov     ecx, [esi+1CCh]
00798985                 mov     eax, [ecx]
00798987                 mov     edx, [eax+18h]
0079898A                 call    edx
0079898C                 pop     edi
0079898D                 pop     esi
0079898E                 retn    0Ch
00798991 ; ---------------------------------------------------------------------------
00798991
00798991 loc_798991:                             ; CODE XREF: sub_798900+7Dâ†‘j
00798991                 mov     eax, [esi+1CCh]
00798997                 mov     edx, [esi]
00798999                 mov     edi, [eax]
0079899B                 mov     eax, [edx+4Ch]
0079899E                 call    eax
007989A0                 push    eax
007989A1                 push    0
007989A3                 mov     ecx, esi
007989A5                 call    sub_6312D0
007989AA                 mov     ecx, [esp+0Ch+arg_8]
007989AE                 mov     edx, [esp+0Ch+arg_4]
007989B2                 push    eax
007989B3                 mov     eax, [edi+20h]
007989B6                 push    ecx
007989B7                 mov     ecx, [esi+1CCh]
007989BD                 push    edx
007989BE                 call    eax
007989C0                 pop     edi
007989C1
007989C1 loc_7989C1:                             ; CODE XREF: sub_798900+Aâ†‘j
007989C1                 pop     esi
007989C2                 retn    0Ch
007989C2 sub_798900      endp
007989C2
007989C2 ; ---------------------------------------------------------------------------
007989C5                 align 10h
007989D0
007989D0 ; =============== S U B R O U T I N E =======================================
007989D0
007989D0
007989D0 sub_7989D0      proc near               ; CODE XREF: sub_798B50+82â†“p
007989D0                                         ; .text:0079A013â†“p ...
007989D0
007989D0 var_10          = dword ptr -10h
007989D0 var_C           = dword ptr -0Ch
007989D0 var_4           = dword ptr -4
007989D0 arg_4           = dword ptr  8
007989D0
007989D0 ; FUNCTION CHUNK AT 00EA8343 SIZE 00000023 BYTES
007989D0
007989D0 ; __unwind { // SEH_7989D0
007989D0                 push    0FFFFFFFFh
007989D2                 push    offset SEH_7989D0
007989D7                 mov     eax, large fs:0
007989DD                 push    eax
007989DE                 push    ecx
007989DF                 push    esi
007989E0                 mov     eax, dword_12EA8B0
007989E5                 xor     eax, esp
007989E7                 push    eax
007989E8                 lea     eax, [esp+18h+var_C]
007989EC                 mov     large fs:0, eax
007989F2                 mov     esi, ecx
007989F4                 mov     [esp+18h+var_10], esi
007989F8                 mov     dword ptr [esi], offset off_FE4434
007989FE                 mov     dword ptr [esi+4], offset off_FE4414
00798A05                 mov     [esp+18h+var_4], 0
00798A0D                 call    sub_632750
00798A12                 mov     [esp+18h+var_4], 0FFFFFFFFh
00798A1A                 mov     ecx, esi
00798A1C                 call    sub_632920
00798A21                 mov     ecx, [esp+18h+var_C]
00798A25                 mov     large fs:0, ecx
00798A2C                 pop     ecx
00798A2D                 pop     esi
00798A2E                 add     esp, 10h
00798A31                 retn
00798A31 ; } // starts at 7989D0
00798A31 sub_7989D0      endp
00798A31
00798A31 ; ---------------------------------------------------------------------------
00798A32                 align 10h
00798A40
00798A40 ; =============== S U B R O U T I N E =======================================
00798A40
00798A40
00798A40 sub_798A40      proc near               ; DATA XREF: .rdata:00FE4494â†“o
00798A40                                         ; .rdata:00FE45A4â†“o
00798A40
00798A40 arg_0           = dword ptr  4
00798A40 arg_4           = dword ptr  8
00798A40 arg_8           = dword ptr  0Ch
00798A40
00798A40                 mov     eax, [esp+arg_0]
00798A44                 cmp     eax, 6Fh ; 'o'
00798A47                 jnz     short loc_798A56
00798A49                 mov     eax, [esp+arg_4]
00798A4D                 push    eax
00798A4E                 call    sub_798660
00798A53                 retn    0Ch
00798A56 ; ---------------------------------------------------------------------------
00798A56
00798A56 loc_798A56:                             ; CODE XREF: sub_798A40+7â†‘j
00798A56                 cmp     eax, 70h ; 'p'
00798A59                 jnz     short loc_798A68
00798A5B                 mov     edx, [esp+arg_4]
00798A5F                 push    edx
00798A60                 call    sub_7986C0
00798A65                 retn    0Ch
00798A68 ; ---------------------------------------------------------------------------
00798A68
00798A68 loc_798A68:                             ; CODE XREF: sub_798A40+19â†‘j
00798A68                 cmp     eax, 71h ; 'q'
00798A6B                 jnz     short loc_798A7A
00798A6D                 mov     eax, [esp+arg_4]
00798A71                 push    eax
00798A72                 call    sub_798720
00798A77                 retn    0Ch
00798A7A ; ---------------------------------------------------------------------------
00798A7A
00798A7A loc_798A7A:                             ; CODE XREF: sub_798A40+2Bâ†‘j
00798A7A                 cmp     eax, 7Eh ; '~'
00798A7D                 jnz     short loc_798A91
00798A7F                 mov     edx, [esp+arg_8]
00798A83                 mov     eax, [esp+arg_4]
00798A87                 push    edx
00798A88                 push    eax
00798A89                 call    sub_798780
00798A8E                 retn    0Ch
00798A91 ; ---------------------------------------------------------------------------
00798A91
00798A91 loc_798A91:                             ; CODE XREF: sub_798A40+3Dâ†‘j
00798A91                 mov     edx, [esp+arg_4]
00798A95                 push    edx
00798A96                 call    sub_7987F0
00798A9B                 retn    0Ch
00798A9B sub_798A40      endp
00798A9B
00798A9B ; ---------------------------------------------------------------------------
00798A9E                 align 10h
00798AA0
00798AA0 ; =============== S U B R O U T I N E =======================================
00798AA0
00798AA0
00798AA0 ; int __stdcall sub_798AA0(int, void *Src)
00798AA0 sub_798AA0      proc near               ; CODE XREF: sub_8438D0+6Bâ†“p
00798AA0                                         ; sub_843B50+93â†“p
00798AA0
00798AA0 var_10          = dword ptr -10h
00798AA0 var_C           = dword ptr -0Ch
00798AA0 var_4           = dword ptr -4
00798AA0 arg_0           = dword ptr  4
00798AA0 Src             = dword ptr  8
00798AA0
00798AA0 ; FUNCTION CHUNK AT 00EA8366 SIZE 0000005B BYTES
00798AA0
00798AA0 ; __unwind { // SEH_798AA0
00798AA0                 push    0FFFFFFFFh
00798AA2                 push    offset SEH_798AA0
00798AA7                 mov     eax, large fs:0
00798AAD                 push    eax
00798AAE                 push    ecx
00798AAF                 push    esi
00798AB0                 mov     eax, dword_12EA8B0
00798AB5                 xor     eax, esp
00798AB7                 push    eax
00798AB8                 lea     eax, [esp+18h+var_C]
00798ABC                 mov     large fs:0, eax
00798AC2                 mov     esi, ecx
00798AC4                 mov     [esp+18h+var_10], esi
00798AC8                 mov     eax, [esp+18h+Src]
00798ACC                 mov     ecx, [esp+18h+arg_0]
00798AD0                 push    eax             ; Src
00798AD1                 push    ecx             ; int
00798AD2                 mov     ecx, esi
00798AD4                 call    sub_7983C0
00798AD9                 mov     [esp+18h+var_4], 0
00798AE1                 lea     ecx, [esi+1D0h] ; void *
00798AE7                 mov     dword ptr [esi], offset off_FE4544
00798AED                 mov     dword ptr [esi+4], offset off_FE4520
00798AF4                 call    sub_445CF0
00798AF9                 mov     byte ptr [esp+18h+var_4], 1
00798AFE                 lea     ecx, [esi+224h] ; void *
00798B04                 call    sub_445CF0
00798B09                 mov     byte ptr [esp+18h+var_4], 2
00798B0E                 lea     ecx, [esi+278h] ; void *
00798B14                 call    sub_445CF0
00798B19                 mov     byte ptr [esp+18h+var_4], 3
00798B1E                 lea     ecx, [esi+2CCh] ; void *
00798B24                 call    sub_445CF0
00798B29                 mov     [esp+18h+var_4], 0FFFFFFFFh
00798B31                 mov     eax, esi
00798B33                 mov     ecx, [esp+18h+var_C]
00798B37                 mov     large fs:0, ecx
00798B3E                 pop     ecx
00798B3F                 pop     esi
00798B40                 add     esp, 10h
00798B43                 retn    8
00798B43 ; } // starts at 798AA0
00798B43 sub_798AA0      endp
00798B43
00798B43 ; ---------------------------------------------------------------------------
00798B46                 align 10h
00798B50
00798B50 ; =============== S U B R O U T I N E =======================================
00798B50
00798B50
00798B50 sub_798B50      proc near               ; CODE XREF: .text:0079A033â†“p
00798B50
00798B50 var_10          = dword ptr -10h
00798B50 var_C           = dword ptr -0Ch
00798B50 var_4           = dword ptr -4
00798B50 arg_4           = dword ptr  8
00798B50
00798B50 ; FUNCTION CHUNK AT 00EA83C1 SIZE 0000005B BYTES
00798B50
00798B50 ; __unwind { // SEH_798B50
00798B50                 push    0FFFFFFFFh
00798B52                 push    offset SEH_798B50
00798B57                 mov     eax, large fs:0
00798B5D                 push    eax
00798B5E                 push    ecx
00798B5F                 push    esi
00798B60                 mov     eax, dword_12EA8B0
00798B65                 xor     eax, esp
00798B67                 push    eax
00798B68                 lea     eax, [esp+18h+var_C]
00798B6C                 mov     large fs:0, eax
00798B72                 mov     esi, ecx
00798B74                 mov     [esp+18h+var_10], esi
00798B78                 mov     dword ptr [esi], offset off_FE4544
00798B7E                 mov     dword ptr [esi+4], offset off_FE4520
00798B85                 mov     [esp+18h+var_4], 3
00798B8D                 lea     ecx, [esi+2CCh] ; void *
00798B93                 call    sub_446F50
00798B98                 mov     byte ptr [esp+18h+var_4], 2
00798B9D                 lea     ecx, [esi+278h] ; void *
00798BA3                 call    sub_446F50
00798BA8                 mov     byte ptr [esp+18h+var_4], 1
00798BAD                 lea     ecx, [esi+224h] ; void *
00798BB3                 call    sub_446F50
00798BB8                 mov     byte ptr [esp+18h+var_4], 0
00798BBD                 lea     ecx, [esi+1D0h] ; void *
00798BC3                 call    sub_446F50
00798BC8                 mov     [esp+18h+var_4], 0FFFFFFFFh
00798BD0                 mov     ecx, esi
00798BD2                 call    sub_7989D0
00798BD7                 mov     ecx, [esp+18h+var_C]
00798BDB                 mov     large fs:0, ecx
00798BE2                 pop     ecx
00798BE3                 pop     esi
00798BE4                 add     esp, 10h
00798BE7                 retn
00798BE7 ; } // starts at 798B50
00798BE7 sub_798B50      endp
00798BE7
00798BE7 ; ---------------------------------------------------------------------------
00798BE8                 align 10h
00798BF0
00798BF0 ; =============== S U B R O U T I N E =======================================
00798BF0
00798BF0
00798BF0 sub_798BF0      proc near               ; DATA XREF: .rdata:00FE4598â†“o
00798BF0
00798BF0 var_ABF         = byte ptr -0ABFh
00798BF0 var_ABE         = byte ptr -0ABEh
00798BF0 var_ABD         = byte ptr -0ABDh
00798BF0 var_ABC         = dword ptr -0ABCh
00798BF0 var_AB8         = dword ptr -0AB8h
00798BF0 var_AB4         = dword ptr -0AB4h
00798BF0 var_AB0         = byte ptr -0AB0h
00798BF0 var_A5C         = byte ptr -0A5Ch
00798BF0 var_A08         = byte ptr -0A08h
00798BF0 var_9B4         = byte ptr -9B4h
00798BF0 var_960         = byte ptr -960h
00798BF0 var_90C         = byte ptr -90Ch
00798BF0 var_8B8         = byte ptr -8B8h
00798BF0 var_864         = byte ptr -864h
00798BF0 var_810         = byte ptr -810h
00798BF0 var_7BC         = byte ptr -7BCh
00798BF0 var_768         = byte ptr -768h
00798BF0 var_714         = byte ptr -714h
00798BF0 var_6C0         = byte ptr -6C0h
00798BF0 var_66C         = byte ptr -66Ch
00798BF0 var_618         = byte ptr -618h
00798BF0 var_5C4         = byte ptr -5C4h
00798BF0 var_570         = byte ptr -570h
00798BF0 var_51C         = byte ptr -51Ch
00798BF0 var_4C8         = byte ptr -4C8h
00798BF0 var_474         = byte ptr -474h
00798BF0 var_420         = byte ptr -420h
00798BF0 var_3CC         = byte ptr -3CCh
00798BF0 var_378         = byte ptr -378h
00798BF0 var_324         = byte ptr -324h
00798BF0 var_2D0         = byte ptr -2D0h
00798BF0 var_27C         = byte ptr -27Ch
00798BF0 var_278         = byte ptr -278h
00798BF0 var_23C         = byte ptr -23Ch
00798BF0 var_1A8         = byte ptr -1A8h
00798BF0 var_174         = byte ptr -174h
00798BF0 var_170         = byte ptr -170h
00798BF0 var_134         = byte ptr -134h
00798BF0 var_A0          = byte ptr -0A0h
00798BF0 var_6C          = byte ptr -6Ch
00798BF0 Buffer          = byte ptr -18h
00798BF0 var_10          = dword ptr -10h
00798BF0 var_C           = byte ptr -0Ch
00798BF0 var_4           = dword ptr -4
00798BF0 arg_0           = dword ptr  4
00798BF0 arg_4           = dword ptr  8
00798BF0 arg_8           = dword ptr  0Ch
00798BF0
00798BF0 ; FUNCTION CHUNK AT 00EA841C SIZE 0000015F BYTES
00798BF0
00798BF0 ; __unwind { // SEH_798BF0
00798BF0                 push    0FFFFFFFFh
00798BF2                 push    offset SEH_798BF0
00798BF7                 mov     eax, large fs:0
00798BFD                 push    eax
00798BFE                 sub     esp, 0AB4h
00798C04                 mov     eax, dword_12EA8B0
00798C09                 xor     eax, esp
00798C0B                 mov     [esp+0AC0h+var_10], eax
00798C12                 push    ebx
00798C13                 push    ebp
00798C14                 push    esi
00798C15                 push    edi
00798C16                 mov     eax, dword_12EA8B0
00798C1B                 xor     eax, esp
00798C1D                 push    eax
00798C1E                 lea     eax, [esp+0AD4h+var_C]
00798C25                 mov     large fs:0, eax
00798C2B                 mov     edi, ecx
00798C2D                 mov     eax, [edi+28h]
00798C30                 push    eax
00798C31                 mov     [esp+0AD8h+var_AB8], edi
00798C35                 mov     [esp+0AD8h+var_ABF], 0
00798C3A                 call    sub_6B71D0
00798C3F                 mov     ebp, [esp+0AD8h+arg_8]
00798C46                 mov     ebx, 1
00798C4B                 add     esp, 4
00798C4E                 cmp     eax, ebx
00798C50                 mov     [esp+0AD4h+var_AB4], eax
00798C54                 setz    [esp+0AD4h+var_ABD]
00798C59                 mov     [esp+0AD4h+var_ABC], 0
00798C61
00798C61 loc_798C61:                             ; CODE XREF: sub_798BF0+AB9â†“j
00798C61                 cmp     [esp+0AD4h+arg_0], 0
00798C69                 jle     loc_799720
00798C6F                 cmp     [esp+0AD4h+arg_4], 0
00798C77                 jle     loc_799720
00798C7D                 push    ebx
00798C7E                 lea     ecx, [esp+0AD8h+var_27C]
00798C85                 call    sub_569500
00798C8A                 mov     [esp+0AD4h+var_4], 0
00798C95                 push    ebx
00798C96                 lea     ecx, [esp+0AD8h+var_174]
00798C9D                 call    sub_569500
00798CA2                 mov     byte ptr [esp+0AD4h+var_4], bl
00798CA9                 lea     ecx, [esp+0AD4h+var_278]
00798CB0                 call    sub_567C10
00798CB5                 lea     eax, [edi+1D0h]
00798CBB                 push    eax
00798CBC                 lea     ecx, [esp+0AD8h+var_23C]
00798CC3                 call    sub_4488F0
00798CC8                 mov     ecx, ds:dword_F67298
00798CCE                 push    ecx             ; Size
00798CCF                 push    offset aAct_1   ; "act/"
00798CD4                 lea     ecx, [esp+0ADCh+var_90C]
00798CDB                 call    sub_447260
00798CE0                 mov     esi, eax
00798CE2                 mov     byte ptr [esp+0AD4h+var_4], 2
00798CEA                 lea     ecx, [esp+0AD4h+var_278]
00798CF1                 call    sub_567C10
00798CF6                 push    esi
00798CF7                 lea     ecx, [esp+0AD8h+var_23C]
00798CFE                 call    sub_4488F0
00798D03                 mov     byte ptr [esp+0AD4h+var_4], bl
00798D0A                 lea     ecx, [esp+0AD4h+var_90C] ; void *
00798D11                 call    sub_446F50
00798D16                 cmp     ebp, ebx
00798D18                 jz      loc_798F9F
00798D1E                 cmp     ebp, 2
00798D21                 jz      loc_798F9F
00798D27                 cmp     ebp, 3
00798D2A                 jz      loc_798F9F
00798D30                 cmp     ebp, 4
00798D33                 jz      loc_798F9F
00798D39                 cmp     ebp, 5
00798D3C                 jz      loc_798F9F
00798D42                 cmp     ebp, 6
00798D45                 jz      loc_798F9F
00798D4B                 cmp     ebp, 7
00798D4E                 jz      loc_798F9F
00798D54                 cmp     ebp, 0Ch
00798D57                 jnz     loc_798E67
00798D5D                 mov     eax, [esp+0AD4h+var_AB4]
00798D61                 sub     eax, ebx
00798D63                 jz      short loc_798DAB
00798D65                 mov     edx, ds:dword_F67298
00798D6B                 push    edx             ; Size
00798D6C                 push    offset off_FE3BA8 ; Src
00798D71                 lea     ecx, [esp+0ADCh+var_51C]
00798D78                 call    sub_447260
00798D7D                 mov     byte ptr [esp+0AD4h+var_4], 5
00798D85                 push    eax
00798D86                 lea     eax, [esp+0AD8h+var_27C]
00798D8D                 push    eax
00798D8E                 call    sub_5C9870
00798D93                 add     esp, 8
00798D96                 mov     byte ptr [esp+0AD4h+var_4], bl
00798D9D                 lea     ecx, [esp+0AD4h+var_51C] ; void *
00798DA4                 call    sub_446F50
00798DA9                 jmp     short loc_798DC2
00798DAB ; ---------------------------------------------------------------------------
00798DAB
00798DAB loc_798DAB:                             ; CODE XREF: sub_798BF0+173â†‘j
00798DAB                 lea     ecx, [edi+224h]
00798DB1                 push    ecx
00798DB2                 lea     edx, [esp+0AD8h+var_27C]
00798DB9                 push    edx
00798DBA                 call    sub_5C9870
00798DBF                 add     esp, 8
00798DC2
00798DC2 loc_798DC2:                             ; CODE XREF: sub_798BF0+1B9â†‘j
00798DC2                 mov     eax, ds:dword_F67298
00798DC7                 push    eax             ; Size
00798DC8                 push    offset unk_FE3BAC ; Src
00798DCD                 lea     ecx, [esp+0ADCh+var_864]
00798DD4                 call    sub_447260
00798DD9                 mov     byte ptr [esp+0AD4h+var_4], 6
00798DE1                 push    eax
00798DE2                 lea     ecx, [esp+0AD8h+var_27C]
00798DE9                 push    ecx
00798DEA                 call    sub_5C9870
00798DEF                 add     esp, 8
00798DF2                 mov     byte ptr [esp+0AD4h+var_4], bl
00798DF9                 lea     ecx, [esp+0AD4h+var_864] ; void *
00798E00                 call    sub_446F50
00798E05
00798E05 loc_798E05:                             ; CODE XREF: sub_798BF0+476â†“j
00798E05                 mov     edx, [edi]
00798E07                 mov     eax, [esp+0AD4h+arg_0]
00798E0E                 mov     edx, [edx+5Ch]
00798E11                 push    eax
00798E12                 mov     ecx, edi
00798E14                 call    edx
00798E16                 mov     esi, eax
00798E18                 test    esi, esi
00798E1A                 jnz     loc_7991EE
00798E20                 mov     byte ptr [esp+0AD4h+var_4], al
00798E27                 lea     ecx, [esp+0AD4h+var_A0]
00798E2E                 call    sub_567D40
00798E33                 lea     ecx, [esp+0AD4h+var_A0]
00798E3A                 call    sub_53B870
00798E3F                 mov     [esp+0AD4h+var_4], 0FFFFFFFFh
00798E4A                 lea     ecx, [esp+0AD4h+var_1A8]
00798E51                 call    sub_567D40
00798E56                 lea     ecx, [esp+0AD4h+var_1A8]
00798E5D                 call    sub_53B870
00798E62                 jmp     loc_79969C
00798E67 ; ---------------------------------------------------------------------------
00798E67
00798E67 loc_798E67:                             ; CODE XREF: sub_798BF0+167â†‘j
00798E67                 lea     ecx, [esp+0AD4h+var_278]
00798E6E                 call    sub_567C10
00798E73                 lea     edx, [esp+0AD4h+var_23C]
00798E7A                 push    edx
00798E7B                 lea     eax, [esp+0AD8h+var_174]
00798E82                 push    eax
00798E83                 call    sub_5C9870
00798E88                 mov     ecx, ds:dword_F67298
00798E8E                 add     esp, 8
00798E91                 push    ecx             ; Size
00798E92                 push    offset off_FE3BB0 ; Src
00798E97                 lea     ecx, [esp+0ADCh+var_324]
00798E9E                 call    sub_447260
00798EA3                 mov     byte ptr [esp+0AD4h+var_4], 7
00798EAB                 push    eax
00798EAC                 lea     edx, [esp+0AD8h+var_174]
00798EB3                 push    edx
00798EB4                 call    sub_5C9870
00798EB9                 add     esp, 8
00798EBC                 mov     byte ptr [esp+0AD4h+var_4], bl
00798EC3                 lea     ecx, [esp+0AD4h+var_324] ; void *
00798ECA                 call    sub_446F50
00798ECF                 mov     eax, [esp+0AD4h+var_AB4]
00798ED3                 cmp     eax, 3          ; switch 4 cases
00798ED6                 ja      short def_798ED8 ; jumptable 00798ED8 default case
00798ED8                 jmp     ds:jpt_798ED8[eax*4] ; switch jump
00798EDF ; ---------------------------------------------------------------------------
00798EDF
00798EDF loc_798EDF:                             ; CODE XREF: sub_798BF0+2E8â†‘j
00798EDF                                         ; DATA XREF: .text:jpt_798ED8â†“o
00798EDF                 lea     eax, [edi+224h] ; jumptable 00798ED8 cases 0,1
00798EE5                 push    eax
00798EE6                 lea     ecx, [esp+0AD8h+var_27C]
00798EED                 push    ecx
00798EEE                 jmp     short loc_798F10
00798EF0 ; ---------------------------------------------------------------------------
00798EF0
00798EF0 loc_798EF0:                             ; CODE XREF: sub_798BF0+2E8â†‘j
00798EF0                                         ; DATA XREF: .text:jpt_798ED8â†“o
00798EF0                 lea     edx, [edi+278h] ; jumptable 00798ED8 case 2
00798EF6                 push    edx
00798EF7                 lea     eax, [esp+0AD8h+var_27C]
00798EFE                 push    eax
00798EFF                 jmp     short loc_798F10
00798F01 ; ---------------------------------------------------------------------------
00798F01
00798F01 loc_798F01:                             ; CODE XREF: sub_798BF0+2E8â†‘j
00798F01                                         ; DATA XREF: .text:jpt_798ED8â†“o
00798F01                 lea     ecx, [edi+2CCh] ; jumptable 00798ED8 case 3
00798F07                 push    ecx
00798F08                 lea     edx, [esp+0AD8h+var_27C]
00798F0F                 push    edx
00798F10
00798F10 loc_798F10:                             ; CODE XREF: sub_798BF0+2FEâ†‘j
00798F10                                         ; sub_798BF0+30Fâ†‘j
00798F10                 call    sub_5C9870
00798F15                 add     esp, 8
00798F18
00798F18 def_798ED8:                             ; CODE XREF: sub_798BF0+2E6â†‘j
00798F18                 mov     eax, ds:dword_F67298 ; jumptable 00798ED8 default case
00798F1D                 push    eax             ; Size
00798F1E                 push    offset unk_FE3BB4 ; Src
00798F23                 lea     ecx, [esp+0ADCh+var_7BC]
00798F2A                 call    sub_447260
00798F2F                 mov     byte ptr [esp+0AD4h+var_4], 8
00798F37                 push    eax
00798F38                 lea     ecx, [esp+0AD8h+var_27C]
00798F3F                 push    ecx
00798F40                 call    sub_5C9870
00798F45                 add     esp, 8
00798F48                 mov     byte ptr [esp+0AD4h+var_4], bl
00798F4F                 lea     ecx, [esp+0AD4h+var_7BC] ; void *
00798F56                 call    sub_446F50
00798F5B                 mov     edx, ds:dword_F67298
00798F61                 push    edx             ; Size
00798F62                 push    offset unk_FE3BB8 ; Src
00798F67                 lea     ecx, [esp+0ADCh+var_474]
00798F6E                 call    sub_447260
00798F73                 mov     byte ptr [esp+0AD4h+var_4], 9
00798F7B                 push    eax
00798F7C                 lea     eax, [esp+0AD8h+var_174]
00798F83                 push    eax
00798F84                 call    sub_5C9870
00798F89                 add     esp, 8
00798F8C                 mov     byte ptr [esp+0AD4h+var_4], bl
00798F93                 lea     ecx, [esp+0AD4h+var_474]
00798F9A                 jmp     loc_79905E
00798F9F ; ---------------------------------------------------------------------------
00798F9F
00798F9F loc_798F9F:                             ; CODE XREF: sub_798BF0+128â†‘j
00798F9F                                         ; sub_798BF0+131â†‘j ...
00798F9F                 mov     eax, [esp+0AD4h+var_AB4]
00798FA3                 sub     eax, ebx
00798FA5                 jz      short loc_798FF7
00798FA7                 mov     ecx, ds:dword_F67298
00798FAD                 push    ecx             ; Size
00798FAE                 push    offset off_FE3BA0 ; Src
00798FB3                 lea     ecx, [esp+0ADCh+var_714]
00798FBA                 call    sub_447260
00798FBF                 mov     esi, eax
00798FC1                 mov     byte ptr [esp+0AD4h+var_4], 3
00798FC9                 lea     ecx, [esp+0AD4h+var_278]
00798FD0                 call    sub_567C10
00798FD5                 push    esi
00798FD6                 lea     ecx, [esp+0AD8h+var_23C]
00798FDD                 call    sub_4488F0
00798FE2                 mov     byte ptr [esp+0AD4h+var_4], bl
00798FE9                 lea     ecx, [esp+0AD4h+var_714] ; void *
00798FF0                 call    sub_446F50
00798FF5                 jmp     short loc_799016
00798FF7 ; ---------------------------------------------------------------------------
00798FF7
00798FF7 loc_798FF7:                             ; CODE XREF: sub_798BF0+3B5â†‘j
00798FF7                 lea     ecx, [esp+0AD4h+var_278]
00798FFE                 call    sub_567C10
00799003                 lea     edx, [edi+224h]
00799009                 push    edx
0079900A                 lea     ecx, [esp+0AD8h+var_23C]
00799011                 call    sub_4488F0
00799016
00799016 loc_799016:                             ; CODE XREF: sub_798BF0+405â†‘j
00799016                 mov     eax, ds:dword_F67298
0079901B                 push    eax             ; Size
0079901C                 push    offset unk_FE3BA4 ; Src
00799021                 lea     ecx, [esp+0ADCh+var_A08]
00799028                 call    sub_447260
0079902D                 mov     esi, eax
0079902F                 mov     byte ptr [esp+0AD4h+var_4], 4
00799037                 lea     ecx, [esp+0AD4h+var_278]
0079903E                 call    sub_567C10
00799043                 push    esi
00799044                 lea     ecx, [esp+0AD8h+var_23C]
0079904B                 call    sub_4488F0
00799050                 mov     byte ptr [esp+0AD4h+var_4], bl
00799057                 lea     ecx, [esp+0AD4h+var_A08] ; void *
0079905E
0079905E loc_79905E:                             ; CODE XREF: sub_798BF0+3AAâ†‘j
0079905E                 call    sub_446F50
00799063                 cmp     ebp, 7
00799066                 jnz     loc_798E05
0079906C                 mov     eax, [edi+28h]
0079906F                 cmp     eax, 5Bh        ; switch 92 cases
00799072                 ja      def_79907F      ; jumptable 0079907F default case, cases 1,3-10,12,16-90
00799078                 movzx   ecx, ds:byte_799748[eax]
0079907F                 jmp     ds:jpt_79907F[ecx*4] ; switch jump
00799086 ; ---------------------------------------------------------------------------
00799086
00799086 loc_799086:                             ; CODE XREF: sub_798BF0+48Fâ†‘j
00799086                                         ; DATA XREF: .text:jpt_79907Fâ†“o
00799086                 mov     edx, ds:dword_F67298 ; jumptable 0079907F cases 0,2,15,91
0079908C                 push    edx             ; Size
0079908D                 push    offset unk_FE3BBC ; Src
00799092                 lea     ecx, [esp+0ADCh+var_66C]
00799099                 call    sub_447260
0079909E                 mov     esi, eax
007990A0                 mov     byte ptr [esp+0AD4h+var_4], 0Ah
007990A8                 lea     ecx, [esp+0AD4h+var_278]
007990AF                 call    sub_567C10
007990B4                 push    esi
007990B5                 lea     ecx, [esp+0AD8h+var_23C]
007990BC                 call    sub_4488F0
007990C1                 mov     byte ptr [esp+0AD4h+var_4], bl
007990C8                 lea     ecx, [esp+0AD4h+var_66C]
007990CF                 jmp     loc_799197
007990D4 ; ---------------------------------------------------------------------------
007990D4
007990D4 loc_7990D4:                             ; CODE XREF: sub_798BF0+48Fâ†‘j
007990D4                                         ; DATA XREF: .text:jpt_79907Fâ†“o
007990D4                 mov     eax, ds:dword_F67298 ; jumptable 0079907F case 11
007990D9                 push    eax             ; Size
007990DA                 push    offset unk_FE3BC0 ; Src
007990DF                 lea     ecx, [esp+0ADCh+var_3CC]
007990E6                 call    sub_447260
007990EB                 mov     byte ptr [esp+0AD4h+var_4], 0Bh
007990F3                 push    eax
007990F4                 lea     ecx, [esp+0AD8h+var_27C]
007990FB                 push    ecx
007990FC                 call    sub_5C9870
00799101                 add     esp, 8
00799104                 mov     byte ptr [esp+0AD4h+var_4], bl
0079910B                 lea     ecx, [esp+0AD4h+var_3CC]
00799112                 jmp     loc_799197
00799117 ; ---------------------------------------------------------------------------
00799117
00799117 loc_799117:                             ; CODE XREF: sub_798BF0+48Fâ†‘j
00799117                                         ; DATA XREF: .text:jpt_79907Fâ†“o
00799117                 mov     edx, ds:dword_F67298 ; jumptable 0079907F case 13
0079911D                 push    edx             ; Size
0079911E                 push    offset unk_FE3BC4 ; Src
00799123                 lea     ecx, [esp+0ADCh+var_5C4]
0079912A                 call    sub_447260
0079912F                 mov     byte ptr [esp+0AD4h+var_4], 0Ch
00799137                 push    eax
00799138                 lea     eax, [esp+0AD8h+var_27C]
0079913F                 push    eax
00799140                 call    sub_5C9870
00799145                 add     esp, 8
00799148                 mov     byte ptr [esp+0AD4h+var_4], bl
0079914F                 lea     ecx, [esp+0AD4h+var_5C4]
00799156                 jmp     short loc_799197
00799158 ; ---------------------------------------------------------------------------
00799158
00799158 loc_799158:                             ; CODE XREF: sub_798BF0+48Fâ†‘j
00799158                                         ; DATA XREF: .text:jpt_79907Fâ†“o
00799158                 mov     ecx, ds:dword_F67298 ; jumptable 0079907F case 14
0079915E                 push    ecx             ; Size
0079915F                 push    offset unk_FE3BC8 ; Src
00799164                 lea     ecx, [esp+0ADCh+var_9B4]
0079916B                 call    sub_447260
00799170                 mov     byte ptr [esp+0AD4h+var_4], 0Dh
00799178                 push    eax
00799179                 lea     edx, [esp+0AD8h+var_27C]
00799180                 push    edx
00799181                 call    sub_5C9870
00799186                 add     esp, 8
00799189                 mov     byte ptr [esp+0AD4h+var_4], bl
00799190                 lea     ecx, [esp+0AD4h+var_9B4] ; void *
00799197
00799197 loc_799197:                             ; CODE XREF: sub_798BF0+4DFâ†‘j
00799197                                         ; sub_798BF0+522â†‘j ...
00799197                 call    sub_446F50
0079919C                 mov     eax, ds:dword_F67298
007991A1                 push    eax             ; Size
007991A2                 push    offset unk_FE3BCC ; Src
007991A7                 lea     ecx, [esp+0ADCh+var_960]
007991AE                 call    sub_447260
007991B3                 mov     esi, eax
007991B5                 mov     byte ptr [esp+0AD4h+var_4], 0Eh
007991BD                 lea     ecx, [esp+0AD4h+var_278]
007991C4                 call    sub_567C10
007991C9                 push    esi
007991CA                 lea     ecx, [esp+0AD8h+var_23C]
007991D1                 call    sub_4488F0
007991D6                 mov     byte ptr [esp+0AD4h+var_4], bl
007991DD                 lea     ecx, [esp+0AD4h+var_960] ; void *
007991E4                 call    sub_446F50
007991E9                 jmp     loc_799320
007991EE ; ---------------------------------------------------------------------------
007991EE
007991EE loc_7991EE:                             ; CODE XREF: sub_798BF0+22Aâ†‘j
007991EE                 mov     eax, ds:dword_F67298
007991F3                 push    eax             ; Size
007991F4                 push    esi             ; Src
007991F5                 lea     ecx, [esp+0ADCh+var_8B8]
007991FC                 call    sub_447260
00799201                 mov     edi, eax
00799203                 mov     byte ptr [esp+0AD4h+var_4], 0Fh
0079920B                 lea     ecx, [esp+0AD4h+var_278]
00799212                 call    sub_567C10
00799217                 push    edi
00799218                 lea     ecx, [esp+0AD8h+var_23C]
0079921F                 call    sub_4488F0
00799224                 mov     byte ptr [esp+0AD4h+var_4], bl
0079922B                 lea     ecx, [esp+0AD4h+var_8B8] ; void *
00799232                 call    sub_446F50
00799237                 mov     ecx, ds:dword_F67298
0079923D                 push    ecx             ; Size
0079923E                 push    offset unk_FE3BD0 ; Src
00799243                 lea     ecx, [esp+0ADCh+var_810]
0079924A                 call    sub_447260
0079924F                 mov     edi, eax
00799251                 mov     byte ptr [esp+0AD4h+var_4], 10h
00799259                 lea     ecx, [esp+0AD4h+var_278]
00799260                 call    sub_567C10
00799265                 push    edi
00799266                 lea     ecx, [esp+0AD8h+var_23C]
0079926D                 call    sub_4488F0
00799272                 mov     byte ptr [esp+0AD4h+var_4], bl
00799279                 lea     ecx, [esp+0AD4h+var_810] ; void *
00799280                 call    sub_446F50
00799285                 mov     edx, ds:dword_F67298
0079928B                 push    edx             ; Size
0079928C                 push    esi             ; Src
0079928D                 lea     ecx, [esp+0ADCh+var_768]
00799294                 call    sub_447260
00799299                 mov     esi, eax
0079929B                 mov     byte ptr [esp+0AD4h+var_4], 11h
007992A3                 lea     ecx, [esp+0AD4h+var_170]
007992AA                 call    sub_567C10
007992AF                 push    esi
007992B0                 lea     ecx, [esp+0AD8h+var_134]
007992B7                 call    sub_4488F0
007992BC                 mov     byte ptr [esp+0AD4h+var_4], bl
007992C3                 lea     ecx, [esp+0AD4h+var_768] ; void *
007992CA                 call    sub_446F50
007992CF                 mov     eax, ds:dword_F67298
007992D4                 push    eax             ; Size
007992D5                 push    offset unk_FE3BD4 ; Src
007992DA                 lea     ecx, [esp+0ADCh+var_6C0]
007992E1                 call    sub_447260
007992E6                 mov     esi, eax
007992E8                 mov     byte ptr [esp+0AD4h+var_4], 12h
007992F0                 lea     ecx, [esp+0AD4h+var_170]
007992F7                 call    sub_567C10
007992FC                 push    esi
007992FD                 lea     ecx, [esp+0AD8h+var_134]
00799304                 call    sub_4488F0
00799309                 mov     byte ptr [esp+0AD4h+var_4], bl
00799310                 lea     ecx, [esp+0AD4h+var_6C0] ; void *
00799317                 call    sub_446F50
0079931C                 mov     edi, [esp+0AD4h+var_AB8]
00799320
00799320 loc_799320:                             ; CODE XREF: sub_798BF0+5F9â†‘j
00799320                 mov     eax, [esp+0AD4h+var_ABC]
00799324                 test    eax, eax
00799326                 jnz     short loc_79932F
00799328                 mov     esi, offset aBase_1 ; "base"
0079932D                 jmp     short loc_799339
0079932F ; ---------------------------------------------------------------------------
0079932F
0079932F loc_79932F:                             ; CODE XREF: sub_798BF0+736â†‘j
0079932F                 add     eax, 0A0h
00799334                 lea     esi, [edi+eax*4]
00799337                 add     esi, eax
00799339
00799339 loc_799339:                             ; CODE XREF: sub_798BF0+73Dâ†‘j
00799339                 mov     ecx, ds:dword_F67298
0079933F                 push    ecx             ; Size
00799340                 push    esi             ; Src
00799341                 lea     ecx, [esp+0ADCh+var_618]
00799348                 call    sub_447260
0079934D                 mov     edi, eax
0079934F                 mov     byte ptr [esp+0AD4h+var_4], 13h
00799357                 lea     ecx, [esp+0AD4h+var_278]
0079935E                 call    sub_567C10
00799363                 push    edi
00799364                 lea     ecx, [esp+0AD8h+var_23C]
0079936B                 call    sub_4488F0
00799370                 mov     byte ptr [esp+0AD4h+var_4], bl
00799377                 lea     ecx, [esp+0AD4h+var_618] ; void *
0079937E                 call    sub_446F50
00799383                 mov     edx, ds:dword_F67298
00799389                 push    edx             ; Size
0079938A                 push    offset asc_FE3BE0 ; "/"
0079938F                 lea     ecx, [esp+0ADCh+var_570]
00799396                 call    sub_447260
0079939B                 mov     edi, eax
0079939D                 mov     byte ptr [esp+0AD4h+var_4], 14h
007993A5                 lea     ecx, [esp+0AD4h+var_278]
007993AC                 call    sub_567C10
007993B1                 push    edi
007993B2                 lea     ecx, [esp+0AD8h+var_23C]
007993B9                 call    sub_4488F0
007993BE                 mov     byte ptr [esp+0AD4h+var_4], bl
007993C5                 lea     ecx, [esp+0AD4h+var_570] ; void *
007993CC                 call    sub_446F50
007993D1                 mov     eax, ds:dword_F67298
007993D6                 push    eax             ; Size
007993D7                 push    esi             ; Src
007993D8                 lea     ecx, [esp+0ADCh+var_4C8]
007993DF                 call    sub_447260
007993E4                 mov     esi, eax
007993E6                 mov     byte ptr [esp+0AD4h+var_4], 15h
007993EE                 lea     ecx, [esp+0AD4h+var_170]
007993F5                 call    sub_567C10
007993FA                 push    esi
007993FB                 lea     ecx, [esp+0AD8h+var_134]
00799402                 call    sub_4488F0
00799407                 mov     byte ptr [esp+0AD4h+var_4], bl
0079940E                 lea     ecx, [esp+0AD4h+var_4C8] ; void *
00799415                 call    sub_446F50
0079941A                 mov     ecx, ds:dword_F67298
00799420                 push    ecx             ; Size
00799421                 push    offset asc_FE3BE4 ; "/"
00799426                 lea     ecx, [esp+0ADCh+var_420]
0079942D                 call    sub_447260
00799432                 mov     esi, eax
00799434                 mov     byte ptr [esp+0AD4h+var_4], 16h
0079943C                 lea     ecx, [esp+0AD4h+var_170]
00799443                 call    sub_567C10
00799448                 push    esi
00799449                 lea     ecx, [esp+0AD8h+var_134]
00799450                 call    sub_4488F0
00799455                 mov     byte ptr [esp+0AD4h+var_4], bl
0079945C                 lea     ecx, [esp+0AD4h+var_420] ; void *
00799463                 call    sub_446F50
00799468                 mov     edx, [esp+0AD4h+arg_4]
0079946F                 push    edx
00799470                 push    offset a04d_0   ; "%04d"
00799475                 lea     eax, [esp+0ADCh+Buffer]
0079947C                 push    5               ; BufferCount
0079947E                 push    eax             ; Buffer
0079947F                 call    _sprintf_s
00799484                 mov     ecx, ds:dword_F67298
0079948A                 add     esp, 10h
0079948D                 push    ecx             ; Size
0079948E                 lea     edx, [esp+0AD8h+Buffer]
00799495                 push    edx             ; Src
00799496                 lea     ecx, [esp+0ADCh+var_378]
0079949D                 call    sub_447260
007994A2                 mov     esi, eax
007994A4                 mov     byte ptr [esp+0AD4h+var_4], 17h
007994AC                 lea     ecx, [esp+0AD4h+var_278]
007994B3                 call    sub_567C10
007994B8                 push    esi
007994B9                 lea     ecx, [esp+0AD8h+var_23C]
007994C0                 call    sub_4488F0
007994C5                 mov     byte ptr [esp+0AD4h+var_4], bl
007994CC                 lea     ecx, [esp+0AD4h+var_378] ; void *
007994D3                 call    sub_446F50
007994D8                 mov     eax, ds:dword_F67298
007994DD                 push    eax             ; Size
007994DE                 lea     ecx, [esp+0AD8h+Buffer]
007994E5                 push    ecx             ; Src
007994E6                 lea     ecx, [esp+0ADCh+var_2D0]
007994ED                 call    sub_447260
007994F2                 mov     esi, eax
007994F4                 mov     byte ptr [esp+0AD4h+var_4], 18h
007994FC                 lea     ecx, [esp+0AD4h+var_170]
00799503                 call    sub_567C10
00799508                 push    esi
00799509                 lea     ecx, [esp+0AD8h+var_134]
00799510                 call    sub_4488F0
00799515                 mov     byte ptr [esp+0AD4h+var_4], bl
0079951C                 lea     ecx, [esp+0AD4h+var_2D0] ; void *
00799523                 call    sub_446F50
00799528                 lea     ecx, [esp+0AD4h+var_6C] ; void *
0079952F                 call    sub_445CF0
00799534                 mov     byte ptr [esp+0AD4h+var_4], 19h
0079953C                 cmp     ebp, 10h
0079953F                 jz      short loc_79954D
00799541                 cmp     [esp+0AD4h+var_ABD], 0
00799546                 jnz     short loc_7995B1
00799548                 cmp     ebp, 9
0079954B                 jnz     short loc_7995B1
0079954D
0079954D loc_79954D:                             ; CODE XREF: sub_798BF0+94Fâ†‘j
0079954D                 mov     edx, ds:dword_F67298
00799553                 push    edx             ; Size
00799554                 push    offset aBin_16  ; ".bin"
00799559                 lea     ecx, [esp+0ADCh+var_AB0]
0079955D                 call    sub_447260
00799562                 mov     byte ptr [esp+0AD4h+var_4], 1Ah
0079956A                 lea     ecx, [esp+0AD4h+var_170]
00799571                 call    sub_567C10
00799576                 push    0
00799578                 lea     eax, [esp+0AD8h+var_AB0]
0079957C                 push    eax
0079957D                 lea     ecx, [esp+0ADCh+var_134]
00799584                 push    ecx
00799585                 lea     edx, [esp+0AE0h+var_6C]
0079958C                 push    edx
0079958D                 call    sub_D39290
00799592                 add     esp, 10h
00799595                 mov     [esp+0AD4h+var_ABE], al
00799599                 mov     byte ptr [esp+0AD4h+var_4], 19h
007995A1                 lea     ecx, [esp+0AD4h+var_AB0] ; void *
007995A5                 call    sub_446F50
007995AA                 cmp     [esp+0AD4h+var_ABE], 0
007995AF                 jnz     short loc_799623
007995B1
007995B1 loc_7995B1:                             ; CODE XREF: sub_798BF0+956â†‘j
007995B1                                         ; sub_798BF0+95Bâ†‘j
007995B1                 cmp     [esp+0AD4h+var_ABF], 0
007995B6                 jnz     loc_799642
007995BC                 mov     edx, ds:dword_F67298
007995C2                 push    edx             ; Size
007995C3                 push    offset aBin_17  ; ".bin"
007995C8                 lea     ecx, [esp+0ADCh+var_A5C]
007995CF                 call    sub_447260
007995D4                 mov     byte ptr [esp+0AD4h+var_4], 1Bh
007995DC                 lea     ecx, [esp+0AD4h+var_278]
007995E3                 call    sub_567C10
007995E8                 push    0
007995EA                 lea     eax, [esp+0AD8h+var_A5C]
007995EE                 push    eax
007995EF                 lea     ecx, [esp+0ADCh+var_23C]
007995F6                 push    ecx
007995F7                 lea     edx, [esp+0AE0h+var_6C]
007995FE                 push    edx
007995FF                 call    sub_D39290
00799604                 add     esp, 10h
00799607                 mov     [esp+0AD4h+var_ABE], al
0079960B                 mov     byte ptr [esp+0AD4h+var_4], 19h
00799613                 lea     ecx, [esp+0AD4h+var_A5C] ; void *
00799617                 call    sub_446F50
0079961C                 cmp     [esp+0AD4h+var_ABE], 0
00799621                 jz      short loc_799642
00799623
00799623 loc_799623:                             ; CODE XREF: sub_798BF0+9BFâ†‘j
00799623                 mov     ecx, [esp+0AD4h+var_ABC]
00799627                 push    0
00799629                 lea     eax, [esp+0AD8h+var_6C]
00799630                 add     ecx, 4
00799633                 push    eax
00799634                 push    ecx
00799635                 mov     ecx, [esp+0AE0h+var_AB8]
00799639                 call    sub_6320C0
0079963E                 mov     [esp+0AD4h+var_ABF], bl
00799642
00799642 loc_799642:                             ; CODE XREF: sub_798BF0+9C6â†‘j
00799642                                         ; sub_798BF0+A31â†‘j
00799642                 mov     byte ptr [esp+0AD4h+var_4], bl
00799649                 lea     ecx, [esp+0AD4h+var_6C] ; void *
00799650                 call    sub_446F50
00799655                 mov     byte ptr [esp+0AD4h+var_4], 0
0079965D                 lea     ecx, [esp+0AD4h+var_A0]
00799664                 call    sub_567D40
00799669                 lea     ecx, [esp+0AD4h+var_A0]
00799670                 call    sub_53B870
00799675                 mov     [esp+0AD4h+var_4], 0FFFFFFFFh
00799680                 lea     ecx, [esp+0AD4h+var_1A8]
00799687                 call    sub_567D40
0079968C                 lea     ecx, [esp+0AD4h+var_1A8]
00799693                 call    sub_53B870
00799698                 mov     edi, [esp+0AD4h+var_AB8]
0079969C
0079969C loc_79969C:                             ; CODE XREF: sub_798BF0+272â†‘j
0079969C                 mov     eax, [esp+0AD4h+var_ABC]
007996A0                 add     eax, ebx
007996A2                 cmp     eax, 5
007996A5                 mov     [esp+0AD4h+var_ABC], eax
007996A9                 jl      loc_798C61
007996AF                 mov     al, [esp+0AD4h+var_ABF]
007996B3
007996B3 loc_7996B3:                             ; CODE XREF: sub_798BF0+B32â†“j
007996B3                 mov     ecx, dword ptr [esp+0AD4h+var_C]
007996BA                 mov     large fs:0, ecx
007996C1                 pop     ecx
007996C2                 pop     edi
007996C3                 pop     esi
007996C4                 pop     ebp
007996C5                 pop     ebx
007996C6                 mov     ecx, [esp+0AC0h+var_10]
007996CD                 xor     ecx, esp
007996CF                 call    sub_9D20F4
007996D4                 add     esp, 0AC0h
007996DA                 retn    0Ch
007996DD ; ---------------------------------------------------------------------------
007996DD
007996DD def_79907F:                             ; CODE XREF: sub_798BF0+482â†‘j
007996DD                                         ; sub_798BF0+48Fâ†‘j
007996DD                                         ; DATA XREF: ...
007996DD                 mov     byte ptr [esp+0AD4h+var_4], 0 ; jumptable 0079907F default case, cases 1,3-10,12,16-90
007996E5                 lea     ecx, [esp+0AD4h+var_A0]
007996EC                 call    sub_567D40
007996F1                 lea     ecx, [esp+0AD4h+var_A0]
007996F8                 call    sub_53B870
007996FD                 mov     [esp+0AD4h+var_4], 0FFFFFFFFh
00799708                 lea     ecx, [esp+0AD4h+var_1A8]
0079970F                 call    sub_567D40
00799714                 lea     ecx, [esp+0AD4h+var_1A8]
0079971B                 call    sub_53B870
00799720
00799720 loc_799720:                             ; CODE XREF: sub_798BF0+79â†‘j
00799720                                         ; sub_798BF0+87â†‘j
00799720                 xor     al, al
00799722                 jmp     short loc_7996B3
00799722 ; } // starts at 798BF0
00799722 sub_798BF0      endp
00799722
00799722 ; ---------------------------------------------------------------------------
00799724 jpt_798ED8      dd offset loc_798EDF    ; DATA XREF: sub_798BF0+2E8â†‘r
00799728                 dd offset loc_798EDF    ; jump table for switch statement
0079972C                 dd offset loc_798EF0
00799730                 dd offset loc_798F01
00799734 jpt_79907F      dd offset loc_799086    ; DATA XREF: sub_798BF0+48Fâ†‘r
00799738                 dd offset loc_7990D4    ; jump table for switch statement
0079973C                 dd offset loc_799117
00799740                 dd offset loc_799158
00799744                 dd offset def_79907F
00799748 byte_799748     db      0,     4,     0,     4
00799748                                         ; DATA XREF: sub_798BF0+488â†‘r
0079974C                 db      4,     4,     4,     4 ; indirect table for switch statement
00799750                 db      4,     4,     4,     1
00799754                 db      4,     2,     3,     0
00799758                 db      4,     4,     4,     4
0079975C                 db      4,     4,     4,     4
00799760                 db      4,     4,     4,     4
00799764                 db      4,     4,     4,     4
00799768                 db      4,     4,     4,     4
0079976C                 db      4,     4,     4,     4
00799770                 db      4,     4,     4,     4
00799774                 db      4,     4,     4,     4
00799778                 db      4,     4,     4,     4
0079977C                 db      4,     4,     4,     4
00799780                 db      4,     4,     4,     4
00799784                 db      4,     4,     4,     4
00799788                 db      4,     4,     4,     4
0079978C                 db      4,     4,     4,     4
00799790                 db      4,     4,     4,     4
00799794                 db      4,     4,     4,     4
00799798                 db      4,     4,     4,     4
0079979C                 db      4,     4,     4,     4
007997A0                 db      4,     4,     4,     0
007997A4                 align 10h
007997B0
007997B0 ; =============== S U B R O U T I N E =======================================
007997B0
007997B0
007997B0 sub_7997B0      proc near               ; CODE XREF: sub_799C90+329â†“p
007997B0
007997B0 var_339         = byte ptr -339h
007997B0 var_338         = dword ptr -338h
007997B0 Buffer          = byte ptr -334h
007997B0 var_330         = dword ptr -330h
007997B0 var_32C         = dword ptr -32Ch
007997B0 var_328         = dword ptr -328h
007997B0 var_324         = dword ptr -324h
007997B0 var_320         = dword ptr -320h
007997B0 var_31C         = dword ptr -31Ch
007997B0 var_318         = byte ptr -318h
007997B0 var_2C4         = byte ptr -2C4h
007997B0 var_270         = byte ptr -270h
007997B0 var_21C         = byte ptr -21Ch
007997B0 var_1C8         = byte ptr -1C8h
007997B0 var_174         = dword ptr -174h
007997B0 var_170         = byte ptr -170h
007997B0 var_134         = byte ptr -134h
007997B0 var_A0          = dword ptr -0A0h
007997B0 var_6C          = byte ptr -6Ch
007997B0 Src             = byte ptr -18h
007997B0 var_10          = dword ptr -10h
007997B0 var_C           = dword ptr -0Ch
007997B0 var_4           = dword ptr -4
007997B0 arg_4           = dword ptr  8
007997B0 arg_8           = dword ptr  0Ch
007997B0
007997B0 ; FUNCTION CHUNK AT 0053B740 SIZE 0000000E BYTES
007997B0 ; FUNCTION CHUNK AT 00EA857B SIZE 000000F2 BYTES
007997B0
007997B0 ; __unwind { // SEH_7997B0
007997B0                 push    0FFFFFFFFh
007997B2                 push    offset SEH_7997B0
007997B7                 mov     eax, large fs:0
007997BD                 push    eax
007997BE                 sub     esp, 330h
007997C4                 mov     eax, dword_12EA8B0
007997C9                 xor     eax, esp
007997CB                 mov     [esp+33Ch+var_10], eax
007997D2                 push    ebx
007997D3                 push    ebp
007997D4                 push    esi
007997D5                 push    edi
007997D6                 mov     eax, dword_12EA8B0
007997DB                 xor     eax, esp
007997DD                 push    eax
007997DE                 lea     eax, [esp+350h+var_C]
007997E5                 mov     large fs:0, eax
007997EB                 mov     eax, [esp+350h+arg_4]
007997F2                 mov     [esp+350h+var_338], ecx
007997F6                 mov     ecx, eax
007997F8                 mov     edx, eax
007997FA                 shr     eax, 0Fh
007997FD                 shr     edx, 7
00799800                 and     eax, 1FFh
00799805                 and     ecx, 7Fh
00799808                 and     edx, 0FFh
0079980E                 mov     [esp+350h+var_324], eax
00799812                 lea     eax, [esp+350h+var_A0]
00799819                 mov     [esp+350h+var_32C], ecx
0079981D                 mov     [esp+350h+var_328], edx
00799821                 lea     ecx, [esp+350h+var_170]
00799828                 mov     edx, eax
0079982A                 xor     ebx, ebx
0079982C                 xor     esi, esi
0079982E                 mov     [esp+350h+var_320], eax
00799832                 mov     [esp+350h+var_31C], ecx
00799836                 mov     [esp+350h+var_330], edx
0079983A                 lea     ebx, [ebx+0]
00799840
00799840 loc_799840:                             ; CODE XREF: sub_7997B0+32Aâ†“j
00799840                 push    1
00799842                 lea     ecx, [esp+354h+var_174]
00799849                 call    sub_569500
0079984E                 mov     [esp+350h+var_4], ebx
00799855                 mov     eax, ds:dword_F67298
0079985A                 push    eax             ; Size
0079985B                 push    offset aClientVfx ; "/client/vfx/"
00799860                 lea     ecx, [esp+358h+var_1C8]
00799867                 call    sub_447260
0079986C                 mov     edi, eax
0079986E                 mov     byte ptr [esp+350h+var_4], 1
00799876                 lea     ecx, [esp+350h+var_170]
0079987D                 call    sub_567C10
00799882                 push    edi
00799883                 lea     ecx, [esp+354h+var_134]
0079988A                 call    sub_4488F0
0079988F                 mov     byte ptr [esp+350h+var_4], bl
00799896                 lea     ecx, [esp+350h+var_1C8] ; void *
0079989D                 call    sub_446F50
007998A2                 lea     edi, [esi+1]
007998A5                 push    edi
007998A6                 push    offset aGl1d    ; "gl%1d"
007998AB                 lea     ecx, [esp+358h+Buffer]
007998AF                 push    4               ; BufferCount
007998B1                 push    ecx             ; Buffer
007998B2                 call    _sprintf_s
007998B7                 mov     edx, ds:dword_F67298
007998BD                 add     esp, 10h
007998C0                 push    edx             ; Size
007998C1                 lea     eax, [esp+354h+Buffer]
007998C5                 push    eax             ; Src
007998C6                 lea     ecx, [esp+358h+var_270]
007998CD                 call    sub_447260
007998D2                 mov     ebp, eax
007998D4                 mov     byte ptr [esp+350h+var_4], 2
007998DC                 lea     ecx, [esp+350h+var_170]
007998E3                 call    sub_567C10
007998E8                 push    ebp
007998E9                 lea     ecx, [esp+354h+var_134]
007998F0                 call    sub_4488F0
007998F5                 mov     byte ptr [esp+350h+var_4], bl
007998FC                 lea     ecx, [esp+350h+var_270] ; void *
00799903                 call    sub_446F50
00799908                 mov     ecx, ds:dword_F67298
0079990E                 push    ecx             ; Size
0079990F                 push    offset asc_FE3C44 ; "/"
00799914                 lea     ecx, [esp+358h+var_21C]
0079991B                 call    sub_447260
00799920                 mov     ebp, eax
00799922                 mov     byte ptr [esp+350h+var_4], 3
0079992A                 lea     ecx, [esp+350h+var_170]
00799931                 call    sub_567C10
00799936                 push    ebp
00799937                 lea     ecx, [esp+354h+var_134]
0079993E                 call    sub_4488F0
00799943                 mov     byte ptr [esp+350h+var_4], bl
0079994A                 lea     ecx, [esp+350h+var_21C] ; void *
00799951                 call    sub_446F50
00799956                 mov     edx, [esp+esi*4+350h+var_32C]
0079995A                 push    edx
0079995B                 push    offset a04d_1   ; "%04d"
00799960                 lea     eax, [esp+358h+Src]
00799967                 push    5               ; BufferCount
00799969                 push    eax             ; Buffer
0079996A                 call    _sprintf_s
0079996F                 mov     ecx, ds:dword_F67298
00799975                 add     esp, 10h
00799978                 push    ecx             ; Size
00799979                 lea     edx, [esp+354h+Src]
00799980                 push    edx             ; Src
00799981                 lea     ecx, [esp+358h+var_2C4]
00799988                 call    sub_447260
0079998D                 mov     ebp, eax
0079998F                 mov     byte ptr [esp+350h+var_4], 4
00799997                 lea     ecx, [esp+350h+var_170]
0079999E                 call    sub_567C10
007999A3                 push    ebp
007999A4                 lea     ecx, [esp+354h+var_134]
007999AB                 call    sub_4488F0
007999B0                 mov     byte ptr [esp+350h+var_4], bl
007999B7                 lea     ecx, [esp+350h+var_2C4] ; void *
007999BE                 call    sub_446F50
007999C3                 lea     ecx, [esp+350h+var_6C] ; void *
007999CA                 call    sub_445CF0
007999CF                 mov     byte ptr [esp+350h+var_4], 5
007999D7                 mov     eax, ds:dword_F67298
007999DC                 push    eax             ; Size
007999DD                 push    offset aBin_18  ; ".bin"
007999E2                 lea     ecx, [esp+358h+var_318]
007999E6                 call    sub_447260
007999EB                 mov     byte ptr [esp+350h+var_4], 6
007999F3                 lea     ecx, [esp+350h+var_170]
007999FA                 call    sub_567C10
007999FF                 push    ebx
00799A00                 lea     ecx, [esp+354h+var_318]
00799A04                 push    ecx
00799A05                 lea     edx, [esp+358h+var_134]
00799A0C                 push    edx
00799A0D                 lea     eax, [esp+35Ch+var_6C]
00799A14                 push    eax
00799A15                 call    sub_D39290
00799A1A                 add     esp, 10h
00799A1D                 mov     [esp+350h+var_339], al
00799A21                 mov     byte ptr [esp+350h+var_4], 5
00799A29                 lea     ecx, [esp+350h+var_318] ; void *
00799A2D                 call    sub_446F50
00799A32                 cmp     [esp+350h+var_339], bl
00799A36                 jz      short loc_799A4B
00799A38                 push    ebx
00799A39                 lea     ecx, [esp+354h+var_6C]
00799A40                 push    ecx
00799A41                 mov     ecx, [esp+358h+var_338]
00799A45                 push    esi
00799A46                 call    sub_6320C0
00799A4B
00799A4B loc_799A4B:                             ; CODE XREF: sub_7997B0+286â†‘j
00799A4B                 mov     byte ptr [esp+350h+var_4], bl
00799A52                 lea     ecx, [esp+350h+var_6C] ; void *
00799A59                 call    sub_446F50
00799A5E                 mov     [esp+350h+var_4], 9
00799A69                 lea     ecx, [esp+350h+var_134] ; void *
00799A70                 call    sub_446F50
00799A75                 mov     byte ptr [esp+350h+var_4], 7
00799A7D                 lea     ecx, [esp+350h+var_170]
00799A84                 call    sub_53C3B0
00799A89                 or      eax, 0FFFFFFFFh
00799A8C                 mov     [esp+350h+var_4], eax
00799A93                 mov     edx, [esp+350h+var_174]
00799A9A                 mov     ecx, [edx+4]
00799A9D                 mov     [esp+ecx+350h+var_174], offset off_FA09E0
00799AA8                 mov     [esp+350h+var_A0], offset off_FA09E8
00799AB3                 mov     [esp+350h+var_4], eax
00799ABA                 lea     edx, [esp+350h+var_A0]
00799AC1                 push    edx             ; struct std::ios_base *
00799AC2                 mov     [esp+354h+var_A0], offset off_FA09D8
00799ACD                 call    ?_Ios_base_dtor@ios_base@std@@CAXPAV12@@Z ; std::ios_base::_Ios_base_dtor(std::ios_base *)
00799AD2                 mov     esi, edi
00799AD4                 add     esp, 4
00799AD7                 cmp     esi, 3
00799ADA                 jl      loc_799840
00799AE0                 cmp     [esp+350h+arg_8], 0Ah
00799AE8                 jnz     loc_799C5E
00799AEE                 push    1
00799AF0                 lea     ecx, [esp+354h+var_174]
00799AF7                 call    sub_569500
00799AFC                 mov     [esp+350h+var_4], 0Ch
00799B07                 lea     ecx, [esp+350h+var_170]
00799B0E                 call    sub_567C10
00799B13                 mov     edi, [esp+350h+var_338]
00799B17                 lea     eax, [edi+1D0h]
00799B1D                 push    eax
00799B1E                 lea     ecx, [esp+354h+var_134]
00799B25                 call    sub_4488F0
00799B2A                 mov     ecx, ds:dword_F67298
00799B30                 push    ecx             ; Size
00799B31                 push    offset aActCmnEm1Base4 ; "act/cmn/em1/base/4001"
00799B36                 lea     ecx, [esp+358h+var_2C4]
00799B3D                 call    sub_447260
00799B42                 mov     esi, eax
00799B44                 mov     byte ptr [esp+350h+var_4], 0Dh
00799B4C                 lea     ecx, [esp+350h+var_170]
00799B53                 call    sub_567C10
00799B58                 push    esi
00799B59                 lea     ecx, [esp+354h+var_134]
00799B60                 call    sub_4488F0
00799B65                 mov     byte ptr [esp+350h+var_4], 0Ch
00799B6D                 lea     ecx, [esp+350h+var_2C4] ; void *
00799B74                 call    sub_446F50
00799B79                 lea     ecx, [esp+350h+var_6C] ; void *
00799B80                 call    sub_445CF0
00799B85                 mov     byte ptr [esp+350h+var_4], 0Eh
00799B8D                 mov     edx, ds:dword_F67298
00799B93                 push    edx             ; Size
00799B94                 push    offset aBin_19  ; ".bin"
00799B99                 lea     ecx, [esp+358h+var_318]
00799B9D                 call    sub_447260
00799BA2                 mov     byte ptr [esp+350h+var_4], 0Fh
00799BAA                 lea     ecx, [esp+350h+var_170]
00799BB1                 call    sub_567C10
00799BB6                 push    ebx
00799BB7                 lea     eax, [esp+354h+var_318]
00799BBB                 push    eax
00799BBC                 lea     ecx, [esp+358h+var_134]
00799BC3                 push    ecx
00799BC4                 lea     edx, [esp+35Ch+var_6C]
00799BCB                 push    edx
00799BCC                 call    sub_D39290
00799BD1                 add     esp, 10h
00799BD4                 mov     [esp+350h+var_339], al
00799BD8                 mov     byte ptr [esp+350h+var_4], 0Eh
00799BE0                 lea     ecx, [esp+350h+var_318] ; void *
00799BE4                 call    sub_446F50
00799BE9                 cmp     [esp+350h+var_339], bl
00799BED                 jz      short loc_799C01
00799BEF                 push    ebx
00799BF0                 lea     eax, [esp+354h+var_6C]
00799BF7                 push    eax
00799BF8                 push    4
00799BFA                 mov     ecx, edi
00799BFC                 call    sub_6320C0
00799C01
00799C01 loc_799C01:                             ; CODE XREF: sub_7997B0+43Dâ†‘j
00799C01                 mov     byte ptr [esp+350h+var_4], 0Ch
00799C09                 lea     ecx, [esp+350h+var_6C] ; void *
00799C10                 call    sub_446F50
00799C15                 or      esi, 0FFFFFFFFh
00799C18                 mov     [esp+350h+var_4], esi
00799C1F                 lea     ecx, [esp+350h+var_A0]
00799C26                 call    sub_567D40
00799C2B                 lea     ecx, [esp+350h+var_A0]
00799C32                 mov     [esp+350h+var_330], ecx
00799C36                 mov     [esp+350h+var_A0], offset off_FA09E8
00799C41                 mov     [esp+350h+var_4], esi
00799C48                 mov     edx, ecx
00799C4A                 push    edx             ; struct std::ios_base *
00799C4B                 mov     [esp+354h+var_A0], offset off_FA09D8
00799C56                 call    ?_Ios_base_dtor@ios_base@std@@CAXPAV12@@Z ; std::ios_base::_Ios_base_dtor(std::ios_base *)
00799C5B                 add     esp, 4
00799C5E
00799C5E loc_799C5E:                             ; CODE XREF: sub_7997B0+338â†‘j
00799C5E                 mov     al, 1
00799C60                 mov     ecx, [esp+350h+var_C]
00799C67                 mov     large fs:0, ecx
00799C6E                 pop     ecx
00799C6F                 pop     edi
00799C70                 pop     esi
00799C71                 pop     ebp
00799C72                 pop     ebx
00799C73                 mov     ecx, [esp+33Ch+var_10]
00799C7A                 xor     ecx, esp
00799C7C                 call    sub_9D20F4
00799C81                 add     esp, 33Ch
00799C87                 retn    0Ch
00799C87 ; } // starts at 7997B0
00799C87 sub_7997B0      endp
00799C87
00799C87 ; ---------------------------------------------------------------------------
00799C8A                 align 10h
00799C90
00799C90 ; =============== S U B R O U T I N E =======================================
00799C90
00799C90
00799C90 sub_799C90      proc near               ; DATA XREF: .rdata:00FE459Câ†“o
00799C90
00799C90 var_1C8         = byte ptr -1C8h
00799C90 var_174         = byte ptr -174h
00799C90 var_120         = byte ptr -120h
00799C90 var_11C         = byte ptr -11Ch
00799C90 var_E0          = byte ptr -0E0h
00799C90 var_4C          = byte ptr -4Ch
00799C90 Buffer          = byte ptr -18h
00799C90 var_10          = dword ptr -10h
00799C90 var_C           = byte ptr -0Ch
00799C90 var_4           = dword ptr -4
00799C90 arg_0           = dword ptr  4
00799C90 arg_4           = dword ptr  8
00799C90 arg_8           = dword ptr  0Ch
00799C90
00799C90 ; FUNCTION CHUNK AT 00EA866D SIZE 00000091 BYTES
00799C90
00799C90 ; __unwind { // SEH_799C90
00799C90                 push    0FFFFFFFFh
00799C92                 push    offset SEH_799C90
00799C97                 mov     eax, large fs:0
00799C9D                 push    eax
00799C9E                 sub     esp, 1BCh
00799CA4                 mov     eax, dword_12EA8B0
00799CA9                 xor     eax, esp
00799CAB                 mov     [esp+1C8h+var_10], eax
00799CB2                 push    ebx
00799CB3                 push    ebp
00799CB4                 push    esi
00799CB5                 push    edi
00799CB6                 mov     eax, dword_12EA8B0
00799CBB                 xor     eax, esp
00799CBD                 push    eax
00799CBE                 lea     eax, [esp+1DCh+var_C]
00799CC5                 mov     large fs:0, eax
00799CCB                 mov     edi, [esp+1DCh+arg_0]
00799CD2                 test    edi, edi
00799CD4                 mov     ebp, ecx
00799CD6                 jle     loc_799DBA
00799CDC                 mov     ebx, [esp+1DCh+arg_4]
00799CE3                 test    ebx, ebx
00799CE5                 jle     loc_799DBA
00799CEB                 mov     esi, [esp+1DCh+arg_8]
00799CF2                 cmp     esi, 0Ah
00799CF5                 jz      loc_799FB6
00799CFB                 cmp     esi, 0Bh
00799CFE                 jz      loc_799FB6
00799D04                 push    1
00799D06                 lea     ecx, [esp+1E0h+var_120]
00799D0D                 call    sub_569500
00799D12                 mov     [esp+1DCh+var_4], 0
00799D1D                 mov     eax, ds:dword_F67298
00799D22                 push    eax             ; Size
00799D23                 push    offset aClientVfx_0 ; "/client/vfx/"
00799D28                 lea     ecx, [esp+1E4h+var_1C8]
00799D2C                 call    sub_447260
00799D31                 mov     byte ptr [esp+1DCh+var_4], 1
00799D39                 push    eax
00799D3A                 lea     ecx, [esp+1E0h+var_120]
00799D41                 push    ecx
00799D42                 call    sub_5C9870
00799D47                 add     esp, 8
00799D4A                 mov     byte ptr [esp+1DCh+var_4], 0
00799D52                 lea     ecx, [esp+1DCh+var_1C8] ; void *
00799D56                 call    sub_446F50
00799D5B                 cmp     esi, 6
00799D5E                 jz      loc_799E15
00799D64                 cmp     esi, 7
00799D67                 jz      loc_799E15
00799D6D                 cmp     esi, 0Ch
00799D70                 jnz     short loc_799D94
00799D72                 mov     edx, ds:dword_F67298
00799D78                 push    edx             ; Size
00799D79                 push    offset aAbl     ; "abl"
00799D7E                 lea     ecx, [esp+1E4h+var_1C8]
00799D82                 call    sub_447260
00799D87                 mov     byte ptr [esp+1DCh+var_4], 3
00799D8F                 jmp     loc_799E32
00799D94 ; ---------------------------------------------------------------------------
00799D94
00799D94 loc_799D94:                             ; CODE XREF: sub_799C90+E0â†‘j
00799D94                 mov     edx, [ebp+0]
00799D97                 mov     eax, [edx+5Ch]
00799D9A                 push    edi
00799D9B                 mov     ecx, ebp
00799D9D                 call    eax
00799D9F                 test    eax, eax
00799DA1                 jnz     short loc_799DE6
00799DA3                 mov     [esp+1DCh+var_4], 0FFFFFFFFh
00799DAE                 lea     ecx, [esp+1DCh+var_120]
00799DB5                 call    sub_5681C0
00799DBA
00799DBA loc_799DBA:                             ; CODE XREF: sub_799C90+46â†‘j
00799DBA                                         ; sub_799C90+55â†‘j
00799DBA                 xor     al, al
00799DBC
00799DBC loc_799DBC:                             ; CODE XREF: sub_799C90+321â†“j
00799DBC                                         ; sub_799C90+32Eâ†“j
00799DBC                 mov     ecx, dword ptr [esp+1DCh+var_C]
00799DC3                 mov     large fs:0, ecx
00799DCA                 pop     ecx
00799DCB                 pop     edi
00799DCC                 pop     esi
00799DCD                 pop     ebp
00799DCE                 pop     ebx
00799DCF                 mov     ecx, [esp+1C8h+var_10]
00799DD6                 xor     ecx, esp
00799DD8                 call    sub_9D20F4
00799DDD                 add     esp, 1C8h
00799DE3                 retn    0Ch
00799DE6 ; ---------------------------------------------------------------------------
00799DE6
00799DE6 loc_799DE6:                             ; CODE XREF: sub_799C90+111â†‘j
00799DE6                 mov     ecx, ds:dword_F67298
00799DEC                 mov     edx, [ebp+0]
00799DEF                 mov     eax, [edx+5Ch]
00799DF2                 push    ecx             ; Size
00799DF3                 push    edi
00799DF4                 mov     ecx, ebp
00799DF6                 call    eax
00799DF8                 push    eax             ; Src
00799DF9                 lea     ecx, [esp+1E4h+var_1C8]
00799DFD                 call    sub_447260
00799E02                 mov     byte ptr [esp+1DCh+var_4], 4
00799E0A                 push    eax
00799E0B                 lea     ecx, [esp+1E0h+var_120]
00799E12                 push    ecx
00799E13                 jmp     short loc_799E3B
00799E15 ; ---------------------------------------------------------------------------
00799E15
00799E15 loc_799E15:                             ; CODE XREF: sub_799C90+CEâ†‘j
00799E15                                         ; sub_799C90+D7â†‘j
00799E15                 mov     edx, ds:dword_F67298
00799E1B                 push    edx             ; Size
00799E1C                 push    offset aItm     ; "itm"
00799E21                 lea     ecx, [esp+1E4h+var_1C8]
00799E25                 call    sub_447260
00799E2A                 mov     byte ptr [esp+1DCh+var_4], 2
00799E32
00799E32 loc_799E32:                             ; CODE XREF: sub_799C90+FFâ†‘j
00799E32                 push    eax
00799E33                 lea     eax, [esp+1E0h+var_120]
00799E3A                 push    eax
00799E3B
00799E3B loc_799E3B:                             ; CODE XREF: sub_799C90+183â†‘j
00799E3B                 call    sub_5C9870
00799E40                 add     esp, 8
00799E43                 mov     byte ptr [esp+1DCh+var_4], 0
00799E4B                 lea     ecx, [esp+1DCh+var_1C8] ; void *
00799E4F                 call    sub_446F50
00799E54                 mov     ecx, ds:dword_F67298
00799E5A                 push    ecx             ; Size
00799E5B                 push    offset asc_FE3C18 ; "/"
00799E60                 lea     ecx, [esp+1E4h+var_1C8]
00799E64                 call    sub_447260
00799E69                 mov     byte ptr [esp+1DCh+var_4], 5
00799E71                 push    eax
00799E72                 lea     edx, [esp+1E0h+var_120]
00799E79                 push    edx
00799E7A                 call    sub_5C9870
00799E7F                 add     esp, 8
00799E82                 mov     byte ptr [esp+1DCh+var_4], 0
00799E8A                 lea     ecx, [esp+1DCh+var_1C8] ; void *
00799E8E                 call    sub_446F50
00799E93                 cmp     edi, 11h
00799E96                 jnz     short loc_799EA4
00799E98                 cmp     ebx, 1
00799E9B                 jz      short loc_799EA2
00799E9D                 cmp     ebx, 2
00799EA0                 jnz     short loc_799EA4
00799EA2
00799EA2 loc_799EA2:                             ; CODE XREF: sub_799C90+20Bâ†‘j
00799EA2                 xor     ebx, ebx
00799EA4
00799EA4 loc_799EA4:                             ; CODE XREF: sub_799C90+206â†‘j
00799EA4                                         ; sub_799C90+210â†‘j
00799EA4                 push    ebx
00799EA5                 push    offset a04d_2   ; "%04d"
00799EAA                 lea     eax, [esp+1E4h+Buffer]
00799EB1                 push    5               ; BufferCount
00799EB3                 push    eax             ; Buffer
00799EB4                 call    _sprintf_s
00799EB9                 mov     ecx, ds:dword_F67298
00799EBF                 add     esp, 10h
00799EC2                 push    ecx             ; Size
00799EC3                 lea     edx, [esp+1E0h+Buffer]
00799ECA                 push    edx             ; Src
00799ECB                 lea     ecx, [esp+1E4h+var_1C8]
00799ECF                 call    sub_447260
00799ED4                 mov     byte ptr [esp+1DCh+var_4], 6
00799EDC                 push    eax
00799EDD                 lea     eax, [esp+1E0h+var_120]
00799EE4                 push    eax
00799EE5                 call    sub_5C9870
00799EEA                 add     esp, 8
00799EED                 mov     byte ptr [esp+1DCh+var_4], 0
00799EF5                 lea     ecx, [esp+1DCh+var_1C8] ; void *
00799EF9                 call    sub_446F50
00799EFE                 lea     ecx, [esp+1DCh+var_174] ; void *
00799F02                 call    sub_445CF0
00799F07                 mov     byte ptr [esp+1DCh+var_4], 7
00799F0F                 mov     ecx, ds:dword_F67298
00799F15                 push    ecx             ; Size
00799F16                 push    offset aBin_20  ; ".bin"
00799F1B                 lea     ecx, [esp+1E4h+var_1C8]
00799F1F                 call    sub_447260
00799F24                 mov     byte ptr [esp+1DCh+var_4], 8
00799F2C                 lea     ecx, [esp+1DCh+var_11C]
00799F33                 call    sub_567C10
00799F38                 push    0
00799F3A                 lea     edx, [esp+1E0h+var_1C8]
00799F3E                 push    edx
00799F3F                 lea     eax, [esp+1E4h+var_E0]
00799F46                 push    eax
00799F47                 lea     ecx, [esp+1E8h+var_174]
00799F4B                 push    ecx
00799F4C                 call    sub_D39290
00799F51                 add     esp, 10h
00799F54                 mov     bl, al
00799F56                 mov     byte ptr [esp+1DCh+var_4], 7
00799F5E                 lea     ecx, [esp+1DCh+var_1C8] ; void *
00799F62                 call    sub_446F50
00799F67                 test    bl, bl
00799F69                 jz      short loc_799F7B
00799F6B                 push    0
00799F6D                 lea     edx, [esp+1E0h+var_174]
00799F71                 push    edx
00799F72                 push    0
00799F74                 mov     ecx, ebp
00799F76                 call    sub_6320C0
00799F7B
00799F7B loc_799F7B:                             ; CODE XREF: sub_799C90+2D9â†‘j
00799F7B                 mov     byte ptr [esp+1DCh+var_4], 0
00799F83                 lea     ecx, [esp+1DCh+var_174] ; void *
00799F87                 call    sub_446F50
00799F8C                 mov     [esp+1DCh+var_4], 0FFFFFFFFh
00799F97                 lea     ecx, [esp+1DCh+var_4C]
00799F9E                 call    sub_567D40
00799FA3                 lea     ecx, [esp+1DCh+var_4C]
00799FAA                 call    sub_53B870
00799FAF                 mov     al, 1
00799FB1                 jmp     loc_799DBC
00799FB6 ; ---------------------------------------------------------------------------
00799FB6
00799FB6 loc_799FB6:                             ; CODE XREF: sub_799C90+65â†‘j
00799FB6                                         ; sub_799C90+6Eâ†‘j
00799FB6                 push    esi
00799FB7                 push    ebx
00799FB8                 push    edi
00799FB9                 call    sub_7997B0
00799FBE                 jmp     loc_799DBC
00799FBE ; } // starts at 799C90
00799FBE sub_799C90      endp
00799FBE
00799FBE ; ---------------------------------------------------------------------------
00799FC3                 align 10h
00799FD0
00799FD0 ; =============== S U B R O U T I N E =======================================
00799FD0
00799FD0
00799FD0 sub_799FD0      proc near               ; DATA XREF: .rdata:00FE447Câ†“o
00799FD0                                         ; .rdata:00FE458Câ†“o
00799FD0
00799FD0 arg_0           = byte ptr  4
00799FD0
00799FD0                 movsx   eax, [esp+arg_0]
00799FD5                 mov     [ecx+28h], eax
00799FD8                 retn    4
00799FD8 sub_799FD0      endp
00799FD8
00799FD8 ; ---------------------------------------------------------------------------
00799FDB                 align 10h
00799FE0
00799FE0 ; =============== S U B R O U T I N E =======================================
00799FE0
00799FE0
00799FE0 sub_799FE0      proc near               ; DATA XREF: .rdata:00FE4480â†“o
00799FE0                                         ; .rdata:00FE4590â†“o
00799FE0                 lea     eax, [ecx+2Ch]
00799FE3                 retn
00799FE3 sub_799FE0      endp
00799FE3
00799FE3 ; ---------------------------------------------------------------------------
00799FE4                 align 10h
00799FF0
00799FF0 loc_799FF0:                             ; DATA XREF: .rdata:off_FE4414â†“o
00799FF0                 sub     ecx, 4
00799FF3                 jmp     loc_79A010
00799FF3 ; ---------------------------------------------------------------------------
00799FF8                 align 10h
0079A000
0079A000 loc_79A000:                             ; DATA XREF: .rdata:off_FE4520â†“o
0079A000                 sub     ecx, 4
0079A003                 jmp     loc_79A030
0079A003 ; ---------------------------------------------------------------------------
0079A008                 align 10h
0079A010
0079A010 loc_79A010:                             ; CODE XREF: .text:00799FF3â†‘j
0079A010                                         ; DATA XREF: .rdata:off_FE4434â†“o
0079A010                 push    esi
0079A011                 mov     esi, ecx
0079A013                 call    sub_7989D0
0079A018                 test    byte ptr [esp+8], 1
0079A01D                 jz      short loc_79A028
0079A01F                 push    esi
0079A020                 call    j__free
0079A025                 add     esp, 4
0079A028
0079A028 loc_79A028:                             ; CODE XREF: .text:0079A01Dâ†‘j
0079A028                 mov     eax, esi
0079A02A                 pop     esi
0079A02B                 retn    4
0079A02B ; ---------------------------------------------------------------------------
0079A02E                 align 10h
0079A030
0079A030 loc_79A030:                             ; CODE XREF: .text:0079A003â†‘j
0079A030                                         ; DATA XREF: .rdata:off_FE4544â†“o
0079A030                 push    esi
0079A031                 mov     esi, ecx
0079A033                 call    sub_798B50
0079A038                 test    byte ptr [esp+8], 1
0079A03D                 jz      short loc_79A048
0079A03F                 push    esi
0079A040                 call    j__free
0079A045                 add     esp, 4
0079A048
0079A048 loc_79A048:                             ; CODE XREF: .text:0079A03Dâ†‘j
0079A048                 mov     eax, esi
0079A04A                 pop     esi
0079A04B                 retn    4
0079A04B ; ---------------------------------------------------------------------------
0079A04E                 align 10h
0079A050
0079A050 ; =============== S U B R O U T I N E =======================================
0079A050
0079A050
0079A050 sub_79A050      proc near
0079A050
0079A050 var_10          = dword ptr -10h
0079A050 var_C           = dword ptr -0Ch
0079A050 var_4           = dword ptr -4
0079A050 arg_4           = dword ptr  8
0079A050
0079A050 ; FUNCTION CHUNK AT 00EA8700 SIZE 00000023 BYTES
0079A050
0079A050 ; __unwind { // SEH_79A050
0079A050                 push    0FFFFFFFFh
0079A052                 push    offset SEH_79A050
0079A057                 mov     eax, large fs:0
0079A05D                 push    eax
0079A05E                 push    ecx
0079A05F                 mov     eax, dword_12EA8B0
0079A064                 xor     eax, esp
0079A066                 push    eax
0079A067                 lea     eax, [esp+14h+var_C]
0079A06B                 mov     large fs:0, eax
0079A071                 mov     [esp+14h+var_10], ecx
0079A075                 mov     dword ptr [ecx], offset off_FE4974
0079A07B                 mov     [esp+14h+var_4], 0FFFFFFFFh
0079A083                 call    sub_694FA0
0079A088                 mov     ecx, [esp+14h+var_C]
0079A08C                 mov     large fs:0, ecx
0079A093                 pop     ecx
0079A094                 add     esp, 10h
0079A097                 retn
0079A097 ; } // starts at 79A050
0079A097 sub_79A050      endp
0079A097
0079A097 ; ---------------------------------------------------------------------------
0079A098                 align 10h
0079A0A0
0079A0A0 ; =============== S U B R O U T I N E =======================================
0079A0A0
0079A0A0
0079A0A0 sub_79A0A0      proc near               ; CODE XREF: sub_58E0C0+1DEâ†‘p
0079A0A0
0079A0A0 arg_0           = dword ptr  4
0079A0A0
0079A0A0                 push    esi
0079A0A1                 push    edi
0079A0A2                 mov     edi, [esp+8+arg_0]
0079A0A6                 cmp     edi, 5
0079A0A9                 push    1
0079A0AB                 mov     esi, ecx
0079A0AD                 push    0
0079A0AF                 jnz     short loc_79A0C8
0079A0B1                 mov     ecx, [esi+20h]
0079A0B4                 mov     byte ptr [esp+10h+arg_0], 0
0079A0B9                 mov     eax, [esp+10h+arg_0]
0079A0BD                 push    eax
0079A0BE                 call    sub_93C2A0
0079A0C3                 pop     edi
0079A0C4                 pop     esi
0079A0C5                 retn    4
0079A0C8 ; ---------------------------------------------------------------------------
0079A0C8
0079A0C8 loc_79A0C8:                             ; CODE XREF: sub_79A0A0+Fâ†‘j
0079A0C8                 mov     byte ptr [esp+10h+arg_0], 2
0079A0CD                 mov     ecx, [esp+10h+arg_0]
0079A0D1                 push    ecx
0079A0D2                 mov     ecx, [esi+20h]
0079A0D5                 call    sub_93C2A0
0079A0DA                 mov     edx, [esi+20h]
0079A0DD                 add     edi, 3B2h
0079A0E3                 push    edi
0079A0E4                 push    edx
0079A0E5                 mov     ecx, esi
0079A0E7                 call    sub_695470
0079A0EC                 pop     edi
0079A0ED                 pop     esi
0079A0EE                 retn    4
0079A0EE sub_79A0A0      endp
0079A0EE
0079A0EE ; ---------------------------------------------------------------------------
0079A0F1                 align 10h
0079A100
0079A100 ; =============== S U B R O U T I N E =======================================
0079A100
0079A100
0079A100 sub_79A100      proc near               ; CODE XREF: sub_8748E0+183â†“p
0079A100
0079A100 var_64          = dword ptr -64h
0079A100 var_60          = byte ptr -60h
0079A100 var_C           = dword ptr -0Ch
0079A100 var_4           = dword ptr -4
0079A100 arg_0           = dword ptr  4
0079A100 arg_4           = dword ptr  8
0079A100 arg_8           = dword ptr  0Ch
0079A100
0079A100 ; FUNCTION CHUNK AT 00EA8723 SIZE 0000002B BYTES
0079A100
0079A100 ; __unwind { // SEH_79A100
0079A100                 push    0FFFFFFFFh
0079A102                 push    offset SEH_79A100
0079A107                 mov     eax, large fs:0
0079A10D                 push    eax
0079A10E                 sub     esp, 58h
0079A111                 push    esi
0079A112                 mov     eax, dword_12EA8B0
0079A117                 xor     eax, esp
0079A119                 push    eax
0079A11A                 lea     eax, [esp+6Ch+var_C]
0079A11E                 mov     large fs:0, eax
0079A124                 mov     esi, ecx
0079A126                 mov     [esp+6Ch+var_64], esi
0079A12A                 mov     eax, [esp+6Ch+arg_8]
0079A12E                 mov     ecx, [esp+6Ch+arg_4]
0079A132                 mov     edx, [esp+6Ch+arg_0]
0079A136                 push    eax
0079A137                 push    ecx
0079A138                 push    edx
0079A139                 mov     ecx, esi
0079A13B                 call    sub_694F50
0079A140                 mov     [esp+6Ch+var_4], 0
0079A148                 mov     dword ptr [esi], offset off_FE4974
0079A14E                 mov     byte ptr [esi+8], 0
0079A152                 mov     eax, ds:dword_F67298
0079A157                 push    eax             ; Size
0079A158                 push    offset aIconcontrolMov ; "IconControl_MoveMode"
0079A15D                 lea     ecx, [esp+74h+var_60]
0079A161                 call    sub_447260
0079A166                 mov     byte ptr [esp+6Ch+var_4], 1
0079A16B                 lea     ecx, [esp+6Ch+var_60]
0079A16F                 push    ecx
0079A170                 mov     ecx, esi
0079A172                 call    sub_696030
0079A177                 mov     [esi+20h], eax
0079A17A                 mov     byte ptr [esp+6Ch+var_4], 0
0079A17F                 lea     ecx, [esp+6Ch+var_60] ; void *
0079A183                 call    sub_446F50
0079A188                 mov     ecx, [esi+20h]
0079A18B                 push    1
0079A18D                 mov     byte ptr [esp+70h+arg_8], 2
0079A192                 mov     edx, [esp+70h+arg_8]
0079A196                 push    0
0079A198                 push    edx
0079A199                 call    sub_93C2A0
0079A19E                 mov     eax, [esi+20h]
0079A1A1                 push    3B2h
0079A1A6                 push    eax
0079A1A7                 mov     ecx, esi
0079A1A9                 call    sub_695470
0079A1AE                 mov     [esp+6Ch+var_4], 0FFFFFFFFh
0079A1B6                 mov     eax, esi
0079A1B8                 mov     ecx, [esp+6Ch+var_C]
0079A1BC                 mov     large fs:0, ecx
0079A1C3                 pop     ecx
0079A1C4                 pop     esi
0079A1C5                 add     esp, 64h
0079A1C8                 retn    0Ch
0079A1C8 ; } // starts at 79A100
0079A1C8 sub_79A100      endp
0079A1C8
0079A1C8 ; ---------------------------------------------------------------------------
0079A1CB                 align 10h
0079A1D0
0079A1D0 ; =============== S U B R O U T I N E =======================================
0079A1D0
0079A1D0
0079A1D0 ; int __thiscall sub_79A1D0(void *Block, char)
0079A1D0 sub_79A1D0      proc near               ; DATA XREF: .rdata:off_FE4974â†“o
0079A1D0
0079A1D0 var_10          = dword ptr -10h
0079A1D0 var_C           = dword ptr -0Ch
0079A1D0 var_4           = dword ptr -4
0079A1D0 arg_0           = byte ptr  4
0079A1D0 arg_4           = dword ptr  8
0079A1D0
0079A1D0 ; FUNCTION CHUNK AT 00EC4720 SIZE 00000023 BYTES
0079A1D0
0079A1D0 ; __unwind { // SEH_8D9D40
0079A1D0                 push    0FFFFFFFFh
0079A1D2                 push    offset SEH_8D9C20
0079A1D7                 mov     eax, large fs:0
0079A1DD                 push    eax
0079A1DE                 push    ecx
0079A1DF                 push    esi
0079A1E0                 mov     eax, dword_12EA8B0
0079A1E5                 xor     eax, esp
0079A1E7                 push    eax
0079A1E8                 lea     eax, [esp+18h+var_C]
0079A1EC                 mov     large fs:0, eax
0079A1F2                 mov     esi, ecx
0079A1F4                 mov     [esp+18h+var_10], esi
0079A1F8                 mov     dword ptr [esi], offset off_FE4974
0079A1FE                 mov     [esp+18h+var_4], 0FFFFFFFFh
0079A206                 call    sub_694FA0
0079A20B                 test    [esp+18h+arg_0], 1
0079A210                 jz      short loc_79A21B
0079A212                 push    esi             ; Block
0079A213                 call    j__free
0079A218                 add     esp, 4
0079A21B
0079A21B loc_79A21B:                             ; CODE XREF: sub_79A1D0+40â†‘j
0079A21B                 mov     eax, esi
0079A21D                 mov     ecx, [esp+18h+var_C]
0079A221                 mov     large fs:0, ecx
0079A228                 pop     ecx
0079A229                 pop     esi
0079A22A                 add     esp, 10h
0079A22D                 retn    4
0079A22D ; } // starts at 79A1D0
0079A22D sub_79A1D0      endp
0079A22D
0079A230
0079A230 ; =============== S U B R O U T I N E =======================================
0079A230
0079A230
0079A230 ; int __thiscall sub_79A230(void *Block, char)
0079A230 sub_79A230      proc near               ; DATA XREF: .rdata:off_FE5434â†“o
0079A230
0079A230 arg_0           = byte ptr  4
0079A230
0079A230                 push    esi
0079A231                 mov     esi, ecx
0079A233                 mov     eax, [esi+0Ch]
0079A236                 test    eax, eax
0079A238                 mov     dword ptr [esi], offset off_FE5434
0079A23E                 jz      short loc_79A250
0079A240                 push    eax             ; Block
0079A241                 call    j_j__free
0079A246                 add     esp, 4
0079A249                 mov     dword ptr [esi+0Ch], 0
0079A250
0079A250 loc_79A250:                             ; CODE XREF: sub_79A230+Eâ†‘j
0079A250                 mov     ecx, [esi+8]
0079A253                 test    ecx, ecx
0079A255                 jz      short loc_79A266
0079A257                 mov     eax, [ecx]
0079A259                 mov     edx, [eax]
0079A25B                 push    1
0079A25D                 call    edx
0079A25F                 mov     dword ptr [esi+8], 0
0079A266
0079A266 loc_79A266:                             ; CODE XREF: sub_79A230+25â†‘j
0079A266                 test    [esp+4+arg_0], 1
0079A26B                 jz      short loc_79A276
0079A26D                 push    esi             ; Block
0079A26E                 call    j__free
0079A273                 add     esp, 4
0079A276
0079A276 loc_79A276:                             ; CODE XREF: sub_79A230+3Bâ†‘j
0079A276                 mov     eax, esi
0079A278                 pop     esi
0079A279                 retn    4
0079A279 sub_79A230      endp
0079A279
0079A279 ; ---------------------------------------------------------------------------
0079A27C                 align 10h
0079A280
0079A280 ; =============== S U B R O U T I N E =======================================
0079A280
0079A280
0079A280 ; int __stdcall sub_79A280(int, void *Src, int, int, int)
0079A280 sub_79A280      proc near               ; CODE XREF: sub_79D900+230â†“p
0079A280
0079A280 var_10          = dword ptr -10h
0079A280 var_C           = dword ptr -0Ch
0079A280 var_4           = dword ptr -4
0079A280 arg_0           = dword ptr  4
0079A280 Src             = dword ptr  8
0079A280 arg_8           = dword ptr  0Ch
0079A280 arg_C           = dword ptr  10h
0079A280 arg_10          = dword ptr  14h
0079A280
0079A280 ; FUNCTION CHUNK AT 00EA8750 SIZE 00000026 BYTES
0079A280
0079A280 ; __unwind { // SEH_79A280
0079A280                 push    0FFFFFFFFh
0079A282                 push    offset SEH_79A280
0079A287                 mov     eax, large fs:0
0079A28D                 push    eax
0079A28E                 push    ecx
0079A28F                 push    esi
0079A290                 mov     eax, dword_12EA8B0
0079A295                 xor     eax, esp
0079A297                 push    eax
0079A298                 lea     eax, [esp+18h+var_C]
0079A29C                 mov     large fs:0, eax
0079A2A2                 mov     esi, ecx
0079A2A4                 mov     [esp+18h+var_10], esi
0079A2A8                 mov     eax, [esp+18h+Src]
0079A2AC                 push    0Fh             ; Size
0079A2AE                 push    eax             ; Src
0079A2AF                 lea     ecx, [esi+4]
0079A2B2                 mov     dword ptr [esi], offset off_FE543C
0079A2B8                 call    sub_447260
0079A2BD                 mov     [esp+18h+var_4], 0
0079A2C5                 mov     ecx, [esp+18h+arg_0]
0079A2C9                 mov     edx, [esp+18h+arg_8]
0079A2CD                 mov     eax, [esp+18h+arg_C]
0079A2D1                 mov     [esi+58h], ecx
0079A2D4                 mov     ecx, [esp+18h+arg_10]
0079A2D8                 mov     [esi+5Ch], edx
0079A2DB                 mov     [esi+60h], eax
0079A2DE                 mov     [esi+64h], ecx
0079A2E1                 mov     [esp+18h+var_4], 0FFFFFFFFh
0079A2E9                 mov     eax, esi
0079A2EB                 mov     ecx, [esp+18h+var_C]
0079A2EF                 mov     large fs:0, ecx
0079A2F6                 pop     ecx
0079A2F7                 pop     esi
0079A2F8                 add     esp, 10h
0079A2FB                 retn    14h
0079A2FB ; } // starts at 79A280
0079A2FB sub_79A280      endp
0079A2FB
0079A2FB ; ---------------------------------------------------------------------------
0079A2FE                 align 10h
0079A300                 xor     eax, eax
0079A302                 cmp     dword ptr [esp+4], 1000h
0079A30A                 setz    al
0079A30D                 retn
0079A30D ; ---------------------------------------------------------------------------
0079A30E                 align 10h
0079A310                 mov     eax, [esp+4]
0079A314                 test    eax, eax
0079A316                 jz      short loc_79A320
0079A318                 cmp     eax, 1
0079A31B                 jz      short loc_79A320
0079A31D                 xor     eax, eax
0079A31F                 retn
0079A320 ; ---------------------------------------------------------------------------
0079A320
0079A320 loc_79A320:                             ; CODE XREF: .text:0079A316â†‘j
0079A320                                         ; .text:0079A31Bâ†‘j
0079A320                 mov     eax, 1
0079A325                 retn
0079A325 ; ---------------------------------------------------------------------------
0079A326                 align 10h
0079A330
0079A330 ; =============== S U B R O U T I N E =======================================
0079A330
0079A330
0079A330 ; int __cdecl sub_79A330(char *Str2)
0079A330 sub_79A330      proc near               ; CODE XREF: sub_626E80+BBâ†‘p
0079A330                                         ; sub_629890+2A5â†‘p ...
0079A330
0079A330 Str2            = dword ptr  4
0079A330
0079A330                 push    esi
0079A331                 mov     esi, [esp+4+Str2]
0079A335                 push    4               ; MaxCount
0079A337                 push    esi             ; Str2
0079A338                 push    offset Str1     ; "sky_"
0079A33D                 call    _strncmp
0079A342                 add     esp, 0Ch
0079A345                 test    eax, eax
0079A347                 jnz     short loc_79A350
0079A349                 mov     eax, 1
0079A34E                 pop     esi
0079A34F                 retn
0079A350 ; ---------------------------------------------------------------------------
0079A350
0079A350 loc_79A350:                             ; CODE XREF: sub_79A330+17â†‘j
0079A350                 push    4               ; MaxCount
0079A352                 push    esi             ; Str2
0079A353                 push    offset aWtr     ; "wtr_"
0079A358                 call    _strncmp
0079A35D                 add     esp, 0Ch
0079A360                 test    eax, eax
0079A362                 jnz     short loc_79A366
0079A364                 pop     esi
0079A365                 retn
0079A366 ; ---------------------------------------------------------------------------
0079A366
0079A366 loc_79A366:                             ; CODE XREF: sub_79A330+32â†‘j
0079A366                 push    offset aLow     ; "_low"
0079A36B                 push    esi             ; Str
0079A36C                 call    _strstr
0079A371                 add     esp, 8
0079A374                 test    eax, eax
0079A376                 jz      short loc_79A37F
0079A378                 mov     eax, 1000h
0079A37D                 pop     esi
0079A37E                 retn
0079A37F ; ---------------------------------------------------------------------------
0079A37F
0079A37F loc_79A37F:                             ; CODE XREF: sub_79A330+46â†‘j
0079A37F                 push    offset aFld     ; "_fld"
0079A384                 push    esi             ; Str
0079A385                 call    _strstr
0079A38A                 add     esp, 8
0079A38D                 test    eax, eax
0079A38F                 jz      short loc_79A398
0079A391                 mov     eax, 2000h
0079A396                 pop     esi
0079A397                 retn
0079A398 ; ---------------------------------------------------------------------------
0079A398
0079A398 loc_79A398:                             ; CODE XREF: sub_79A330+5Fâ†‘j
0079A398                 push    offset aTwn     ; "_twn"
0079A39D                 push    esi             ; Str
0079A39E                 call    _strstr
0079A3A3                 add     esp, 8
0079A3A6                 test    eax, eax
0079A3A8                 jz      short loc_79A3B1
0079A3AA                 mov     eax, 2001h
0079A3AF                 pop     esi
0079A3B0                 retn
0079A3B1 ; ---------------------------------------------------------------------------
0079A3B1
0079A3B1 loc_79A3B1:                             ; CODE XREF: sub_79A330+78â†‘j
0079A3B1                 push    offset aDun     ; "_dun"
0079A3B6                 push    esi             ; Str
0079A3B7                 call    _strstr
0079A3BC                 add     esp, 8
0079A3BF                 test    eax, eax
0079A3C1                 jz      short loc_79A3CA
0079A3C3                 mov     eax, 2002h
0079A3C8                 pop     esi
0079A3C9                 retn
0079A3CA ; ---------------------------------------------------------------------------
0079A3CA
0079A3CA loc_79A3CA:                             ; CODE XREF: sub_79A330+91â†‘j
0079A3CA                 push    offset aInd     ; "_ind"
0079A3CF                 push    esi             ; Str
0079A3D0                 call    _strstr
0079A3D5                 add     esp, 8
0079A3D8                 test    eax, eax
0079A3DA                 jz      short loc_79A3E3
0079A3DC                 mov     eax, 2003h
0079A3E1                 pop     esi
0079A3E2                 retn
0079A3E3 ; ---------------------------------------------------------------------------
0079A3E3
0079A3E3 loc_79A3E3:                             ; CODE XREF: sub_79A330+AAâ†‘j
0079A3E3                 push    offset aLin     ; "_lin"
0079A3E8                 push    esi             ; Str
0079A3E9                 call    _strstr
0079A3EE                 add     esp, 8
0079A3F1                 test    eax, eax
0079A3F3                 jz      short loc_79A3FC
0079A3F5                 mov     eax, 4001h
0079A3FA                 pop     esi
0079A3FB                 retn
0079A3FC ; ---------------------------------------------------------------------------
0079A3FC
0079A3FC loc_79A3FC:                             ; CODE XREF: sub_79A330+C3â†‘j
0079A3FC                 push    offset aAir     ; "_air"
0079A401                 push    esi             ; Str
0079A402                 call    _strstr
0079A407                 add     esp, 8
0079A40A                 test    eax, eax
0079A40C                 jz      short loc_79A415
0079A40E                 mov     eax, 4000h
0079A413                 pop     esi
0079A414                 retn
0079A415 ; ---------------------------------------------------------------------------
0079A415
0079A415 loc_79A415:                             ; CODE XREF: sub_79A330+DCâ†‘j
0079A415                 push    offset aCsc     ; "_csc"
0079A41A                 push    esi             ; Str
0079A41B                 call    _strstr
0079A420                 add     esp, 8
0079A423                 neg     eax
0079A425                 sbb     eax, eax
0079A427                 and     eax, 1002h
0079A42C                 add     eax, 3000h
0079A431                 pop     esi
0079A432                 retn
0079A432 sub_79A330      endp
0079A432
0079A432 ; ---------------------------------------------------------------------------
0079A433                 align 10h
0079A440
0079A440 ; =============== S U B R O U T I N E =======================================
0079A440
0079A440
0079A440 sub_79A440      proc near
0079A440                 xor     eax, eax
0079A442                 retn    4
0079A442 sub_79A440      endp
0079A442
0079A442 ; ---------------------------------------------------------------------------
0079A445                 align 10h
0079A450                 push    esi
0079A451                 mov     esi, [ecx+0Ch]
0079A454                 xor     eax, eax
0079A456                 test    esi, esi
0079A458                 push    edi
0079A459                 jbe     short loc_79A477
0079A45B                 mov     edx, [ecx+8]
0079A45E                 mov     edi, [esp+0Ch]
0079A462
0079A462 loc_79A462:                             ; CODE XREF: .text:0079A475â†“j
0079A462                 mov     ecx, [edx+18h]
0079A465                 test    ecx, ecx
0079A467                 jz      short loc_79A46D
0079A469                 cmp     ecx, edi
0079A46B                 jz      short loc_79A47E
0079A46D
0079A46D loc_79A46D:                             ; CODE XREF: .text:0079A467â†‘j
0079A46D                 add     eax, 1
0079A470                 add     edx, 24h ; '$'
0079A473                 cmp     eax, esi
0079A475                 jb      short loc_79A462
0079A477
0079A477 loc_79A477:                             ; CODE XREF: .text:0079A459â†‘j
0079A477                 pop     edi
0079A478                 xor     eax, eax
0079A47A                 pop     esi
0079A47B                 retn    4
0079A47E ; ---------------------------------------------------------------------------
0079A47E
0079A47E loc_79A47E:                             ; CODE XREF: .text:0079A46Bâ†‘j
0079A47E                 pop     edi
0079A47F                 lea     eax, [edx+4]
0079A482                 pop     esi
0079A483                 retn    4
0079A483 ; ---------------------------------------------------------------------------
0079A486                 align 10h
0079A490
0079A490 ; =============== S U B R O U T I N E =======================================
0079A490
0079A490
0079A490 sub_79A490      proc near               ; CODE XREF: sub_64CA70+BAâ†‘p
0079A490                                         ; sub_64EDC0+48â†‘p
0079A490
0079A490 arg_0           = dword ptr  4
0079A490 arg_4           = dword ptr  8
0079A490
0079A490                 push    ebx
0079A491                 mov     ebx, [ecx+0Ch]
0079A494                 push    ebp
0079A495                 push    esi
0079A496                 push    edi
0079A497                 xor     edi, edi
0079A499                 test    ebx, ebx
0079A49B                 jbe     short loc_79A4EB
0079A49D                 mov     esi, [ecx+8]
0079A4A0                 mov     ebp, [esp+10h+arg_0]
0079A4A4
0079A4A4 loc_79A4A4:                             ; CODE XREF: sub_79A490+59â†“j
0079A4A4                 cmp     dword ptr [esi+18h], 0
0079A4A8                 jz      short loc_79A4E1
0079A4AA                 mov     eax, [esp+10h+arg_4]
0079A4AE                 cmp     [esi+1Ch], eax
0079A4B1                 jnz     short loc_79A4E1
0079A4B3                 mov     ecx, ebp
0079A4B5                 lea     eax, [esi+4]
0079A4B8
0079A4B8 loc_79A4B8:                             ; CODE XREF: sub_79A490+42â†“j
0079A4B8                 mov     dl, [eax]
0079A4BA                 cmp     dl, [ecx]
0079A4BC                 jnz     short loc_79A4D8
0079A4BE                 test    dl, dl
0079A4C0                 jz      short loc_79A4D4
0079A4C2                 mov     dl, [eax+1]
0079A4C5                 cmp     dl, [ecx+1]
0079A4C8                 jnz     short loc_79A4D8
0079A4CA                 add     eax, 2
0079A4CD                 add     ecx, 2
0079A4D0                 test    dl, dl
0079A4D2                 jnz     short loc_79A4B8
0079A4D4
0079A4D4 loc_79A4D4:                             ; CODE XREF: sub_79A490+30â†‘j
0079A4D4                 xor     eax, eax
0079A4D6                 jmp     short loc_79A4DD
0079A4D8 ; ---------------------------------------------------------------------------
0079A4D8
0079A4D8 loc_79A4D8:                             ; CODE XREF: sub_79A490+2Câ†‘j
0079A4D8                                         ; sub_79A490+38â†‘j
0079A4D8                 sbb     eax, eax
0079A4DA                 sbb     eax, 0FFFFFFFFh
0079A4DD
0079A4DD loc_79A4DD:                             ; CODE XREF: sub_79A490+46â†‘j
0079A4DD                 test    eax, eax
0079A4DF                 jz      short loc_79A4F4
0079A4E1
0079A4E1 loc_79A4E1:                             ; CODE XREF: sub_79A490+18â†‘j
0079A4E1                                         ; sub_79A490+21â†‘j
0079A4E1                 add     edi, 1
0079A4E4                 add     esi, 24h ; '$'
0079A4E7                 cmp     edi, ebx
0079A4E9                 jb      short loc_79A4A4
0079A4EB
0079A4EB loc_79A4EB:                             ; CODE XREF: sub_79A490+Bâ†‘j
0079A4EB                 pop     edi
0079A4EC                 pop     esi
0079A4ED                 pop     ebp
0079A4EE                 xor     eax, eax
0079A4F0                 pop     ebx
0079A4F1                 retn    0Ch
0079A4F4 ; ---------------------------------------------------------------------------
0079A4F4
0079A4F4 loc_79A4F4:                             ; CODE XREF: sub_79A490+4Fâ†‘j
0079A4F4                 mov     eax, [esi+18h]
0079A4F7                 pop     edi
0079A4F8                 pop     esi
0079A4F9                 pop     ebp
0079A4FA                 pop     ebx
0079A4FB                 retn    0Ch
0079A4FB sub_79A490      endp
0079A4FB
0079A4FB ; ---------------------------------------------------------------------------
0079A4FE                 align 10h
0079A500
0079A500 ; =============== S U B R O U T I N E =======================================
0079A500
0079A500
0079A500 sub_79A500      proc near               ; CODE XREF: .text:0064106Câ†‘p
0079A500                                         ; sub_641090â†‘j
0079A500
0079A500 var_10C         = byte ptr -10Ch
0079A500 var_B8          = byte ptr -0B8h
0079A500 var_64          = byte ptr -64h
0079A500 var_10          = dword ptr -10h
0079A500 var_C           = dword ptr -0Ch
0079A500 var_4           = dword ptr -4
0079A500 arg_0           = dword ptr  4
0079A500 arg_4           = dword ptr  8
0079A500
0079A500 ; FUNCTION CHUNK AT 00EA8776 SIZE 0000004C BYTES
0079A500
0079A500 ; __unwind { // SEH_79A500
0079A500                 push    0FFFFFFFFh
0079A502                 push    offset SEH_79A500
0079A507                 mov     eax, large fs:0
0079A50D                 push    eax
0079A50E                 sub     esp, 100h
0079A514                 mov     eax, dword_12EA8B0
0079A519                 xor     eax, esp
0079A51B                 mov     [esp+10Ch+var_10], eax
0079A522                 push    esi
0079A523                 push    edi
0079A524                 mov     eax, dword_12EA8B0
0079A529                 xor     eax, esp
0079A52B                 push    eax
0079A52C                 lea     eax, [esp+118h+var_C]
0079A533                 mov     large fs:0, eax
0079A539                 mov     edi, [esp+118h+arg_4]
0079A540                 lea     ecx, [esp+118h+var_64] ; void *
0079A547                 call    sub_445CF0
0079A54C                 mov     [esp+118h+var_4], 0
0079A557                 mov     eax, [esp+118h+arg_0]
0079A55E                 push    eax
0079A55F                 lea     ecx, [esp+11Ch+var_64]
0079A566                 push    ecx
0079A567                 call    sub_44B3A0
0079A56C                 mov     edx, ds:dword_F67298
0079A572                 add     esp, 8
0079A575                 push    edx             ; Size
0079A576                 push    offset aMap     ; "map/"
0079A57B                 lea     ecx, [esp+120h+var_10C]
0079A57F                 call    sub_447260
0079A584                 mov     byte ptr [esp+118h+var_4], 1
0079A58C                 push    0
0079A58E                 lea     eax, [esp+11Ch+var_10C]
0079A592                 push    eax
0079A593                 lea     ecx, [esp+120h+var_64]
0079A59A                 call    sub_446F70
0079A59F                 mov     esi, eax
0079A5A1                 add     esi, 4
0079A5A4                 mov     byte ptr [esp+118h+var_4], 0
0079A5AC                 lea     ecx, [esp+118h+var_10C] ; void *
0079A5B0                 call    sub_446F50
0079A5B5                 mov     ecx, ds:dword_F67298
0079A5BB                 push    ecx             ; Size
0079A5BC                 lea     ecx, [esp+11Ch+var_64]
0079A5C3                 call    sub_445210
0079A5C8                 add     eax, esi
0079A5CA                 push    eax             ; Src
0079A5CB                 lea     ecx, [esp+120h+var_B8]
0079A5CF                 call    sub_447260
0079A5D4                 mov     byte ptr [esp+118h+var_4], 2
0079A5DC                 push    eax
0079A5DD                 mov     ecx, edi
0079A5DF                 call    sub_447450
0079A5E4                 mov     byte ptr [esp+118h+var_4], 0
0079A5EC                 lea     ecx, [esp+118h+var_B8] ; void *
0079A5F0                 call    sub_446F50
0079A5F5                 mov     [esp+118h+var_4], 0FFFFFFFFh
0079A600                 lea     ecx, [esp+118h+var_64] ; void *
0079A607                 call    sub_446F50
0079A60C                 mov     ecx, [esp+118h+var_C]
0079A613                 mov     large fs:0, ecx
0079A61A                 pop     ecx
0079A61B                 pop     edi
0079A61C                 pop     esi
0079A61D                 mov     ecx, [esp+10Ch+var_10]
0079A624                 xor     ecx, esp
0079A626                 call    sub_9D20F4
0079A62B                 add     esp, 10Ch
0079A631                 retn
0079A631 ; } // starts at 79A500
0079A631 sub_79A500      endp
0079A631
0079A631 ; ---------------------------------------------------------------------------
0079A632                 align 10h
0079A640
0079A640 ; =============== S U B R O U T I N E =======================================
0079A640
0079A640
0079A640 ; int __cdecl sub_79A640(void *Block)
0079A640 sub_79A640      proc near               ; DATA XREF: sub_79A9C0+65â†“o
0079A640
0079A640 Block           = dword ptr  4
0079A640
0079A640                 push    esi
0079A641                 mov     esi, [esp+4+Block]
0079A645                 mov     ecx, [esi]
0079A647                 test    ecx, ecx
0079A649                 jz      short loc_79A664
0079A64B                 mov     eax, [ecx]
0079A64D                 mov     edx, [eax+18h]
0079A650                 call    edx
0079A652                 mov     ecx, [esi]
0079A654                 mov     edx, [eax]
0079A656                 mov     edx, [edx+10h]
0079A659                 push    ecx
0079A65A                 mov     ecx, eax
0079A65C                 call    edx
0079A65E                 mov     dword ptr [esi], 0
0079A664
0079A664 loc_79A664:                             ; CODE XREF: sub_79A640+9â†‘j
0079A664                 mov     ecx, [esi+4]
0079A667                 test    ecx, ecx
0079A669                 jz      short loc_79A686
0079A66B                 mov     eax, [ecx]
0079A66D                 mov     edx, [eax+18h]
0079A670                 call    edx
0079A672                 mov     ecx, [esi+4]
0079A675                 mov     edx, [eax]
0079A677                 mov     edx, [edx+10h]
0079A67A                 push    ecx
0079A67B                 mov     ecx, eax
0079A67D                 call    edx
0079A67F                 mov     dword ptr [esi+4], 0
0079A686
0079A686 loc_79A686:                             ; CODE XREF: sub_79A640+29â†‘j
0079A686                 mov     ecx, [esi+8]
0079A689                 test    ecx, ecx
0079A68B                 jz      short loc_79A6A8
0079A68D                 mov     eax, [ecx]
0079A68F                 mov     edx, [eax+18h]
0079A692                 call    edx
0079A694                 mov     ecx, [esi+8]
0079A697                 mov     edx, [eax]
0079A699                 mov     edx, [edx+10h]
0079A69C                 push    ecx
0079A69D                 mov     ecx, eax
0079A69F                 call    edx
0079A6A1                 mov     dword ptr [esi+8], 0
0079A6A8
0079A6A8 loc_79A6A8:                             ; CODE XREF: sub_79A640+4Bâ†‘j
0079A6A8                 push    esi             ; Block
0079A6A9                 call    j__free
0079A6AE                 add     esp, 4
0079A6B1                 pop     esi
0079A6B2                 retn
0079A6B2 sub_79A640      endp
0079A6B2
0079A6B2 ; ---------------------------------------------------------------------------
0079A6B3                 align 10h
0079A6C0
0079A6C0 ; =============== S U B R O U T I N E =======================================
0079A6C0
0079A6C0
0079A6C0 sub_79A6C0      proc near               ; DATA XREF: .rdata:00FE5458â†“o
0079A6C0
0079A6C0 arg_0           = dword ptr  4
0079A6C0 arg_4           = dword ptr  8
0079A6C0
0079A6C0                 push    ebx
0079A6C1                 mov     ebx, ecx
0079A6C3                 mov     ecx, [ebx+14h]
0079A6C6                 push    ebp
0079A6C7                 mov     byte ptr [ebx+10h], 1
0079A6CB                 mov     eax, [ecx]
0079A6CD                 mov     edx, [eax+4]
0079A6D0                 push    esi
0079A6D1                 push    edi
0079A6D2                 call    edx
0079A6D4                 test    eax, eax
0079A6D6                 jz      short loc_79A754
0079A6D8                 mov     edi, eax
0079A6DA                 mov     esi, offset aResBgeffect_0 ; "Res.BgEffect"
0079A6DF                 mov     ecx, 0Dh
0079A6E4                 xor     eax, eax
0079A6E6                 repe cmpsb
0079A6E8                 jnz     short loc_79A754
0079A6EA                 mov     edi, dword_133DCEC
0079A6F0                 mov     edx, [edi]
0079A6F2                 mov     ebp, [esp+10h+arg_4]
0079A6F6                 mov     eax, [edx+4]
0079A6F9                 push    ebp
0079A6FA                 mov     ecx, edi
0079A6FC                 call    eax
0079A6FE                 cmp     al, 1
0079A700                 jnz     short loc_79A741
0079A702                 mov     ecx, [ebx+14h]
0079A705                 mov     edx, [ecx]
0079A707                 mov     eax, [edx+4]
0079A70A                 mov     esi, dword_1327C24
0079A710                 call    eax
0079A712                 mov     edx, [esi]
0079A714                 push    eax
0079A715                 mov     eax, [edx+0Ch]
0079A718                 push    10h
0079A71A                 push    ebp
0079A71B                 mov     ecx, esi
0079A71D                 call    eax
0079A71F                 test    eax, eax
0079A721                 mov     [ebx+4], eax
0079A724                 mov     ecx, edi
0079A726                 jz      short loc_79A730
0079A728                 push    eax
0079A729                 call    sub_609000
0079A72E                 jmp     short loc_79A778
0079A730 ; ---------------------------------------------------------------------------
0079A730
0079A730 loc_79A730:                             ; CODE XREF: sub_79A6C0+66â†‘j
0079A730                 mov     edx, [edi]
0079A732                 mov     eax, [esp+10h+arg_0]
0079A736                 mov     edx, [edx+10h]
0079A739                 push    0
0079A73B                 push    ebp
0079A73C                 push    eax
0079A73D                 call    edx
0079A73F                 jmp     short loc_79A778
0079A741 ; ---------------------------------------------------------------------------
0079A741
0079A741 loc_79A741:                             ; CODE XREF: sub_79A6C0+40â†‘j
0079A741                 mov     ecx, [esp+10h+arg_0]
0079A745                 mov     eax, [edi]
0079A747                 mov     edx, [eax+10h]
0079A74A                 push    0
0079A74C                 push    ebp
0079A74D                 push    ecx
0079A74E                 mov     ecx, edi
0079A750                 call    edx
0079A752                 jmp     short loc_79A778
0079A754 ; ---------------------------------------------------------------------------
0079A754
0079A754 loc_79A754:                             ; CODE XREF: sub_79A6C0+16â†‘j
0079A754                                         ; sub_79A6C0+28â†‘j
0079A754                 mov     ecx, [ebx+14h]
0079A757                 mov     eax, [ecx]
0079A759                 mov     edx, [eax+4]
0079A75C                 mov     esi, dword_1327C24
0079A762                 call    edx
0079A764                 mov     edx, [esi]
0079A766                 mov     edx, [edx+0Ch]
0079A769                 push    eax
0079A76A                 mov     eax, [esp+14h+arg_4]
0079A76E                 push    10h
0079A770                 push    eax
0079A771                 mov     ecx, esi
0079A773                 call    edx
0079A775                 mov     [ebx+4], eax
0079A778
0079A778 loc_79A778:                             ; CODE XREF: sub_79A6C0+6Eâ†‘j
0079A778                                         ; sub_79A6C0+7Fâ†‘j ...
0079A778                 cmp     dword ptr [ebx+4], 0
0079A77C                 jnz     short loc_79A787
0079A77E                 pop     edi
0079A77F                 pop     esi
0079A780                 pop     ebp
0079A781                 xor     eax, eax
0079A783                 pop     ebx
0079A784                 retn    8
0079A787 ; ---------------------------------------------------------------------------
0079A787
0079A787 loc_79A787:                             ; CODE XREF: sub_79A6C0+BCâ†‘j
0079A787                 lea     eax, [ebx+3Ch]
0079A78A                 push    eax             ; lpAddend
0079A78B                 call    ds:InterlockedIncrement
0079A791                 mov     ecx, [ebx+4]
0079A794                 mov     edx, [ecx]
0079A796                 mov     eax, [edx+1Ch]
0079A799                 call    eax
0079A79B                 mov     ecx, [ebx+4]
0079A79E                 mov     edx, [ecx]
0079A7A0                 mov     eax, [edx+4]
0079A7A3                 call    eax
0079A7A5                 pop     edi
0079A7A6                 pop     esi
0079A7A7                 pop     ebp
0079A7A8                 pop     ebx
0079A7A9                 retn    8
0079A7A9 sub_79A6C0      endp
0079A7A9
0079A7A9 ; ---------------------------------------------------------------------------
0079A7AC                 align 10h
0079A7B0
0079A7B0 ; =============== S U B R O U T I N E =======================================
0079A7B0
0079A7B0
0079A7B0 sub_79A7B0      proc near               ; DATA XREF: .rdata:00FE545Câ†“o
0079A7B0
0079A7B0 arg_4           = dword ptr  8
0079A7B0
0079A7B0                 push    esi
0079A7B1                 mov     esi, ecx
0079A7B3                 mov     ecx, [esi+14h]
0079A7B6                 mov     byte ptr [esi+11h], 1
0079A7BA                 mov     eax, [ecx]
0079A7BC                 mov     edx, [eax+4]
0079A7BF                 push    edi
0079A7C0                 mov     edi, dword_134DB0C
0079A7C6                 call    edx
0079A7C8                 mov     edx, [edi]
0079A7CA                 mov     edx, [edx+0Ch]
0079A7CD                 push    eax
0079A7CE                 mov     eax, [esp+0Ch+arg_4]
0079A7D2                 push    10h
0079A7D4                 push    eax
0079A7D5                 mov     ecx, edi
0079A7D7                 call    edx
0079A7D9                 test    eax, eax
0079A7DB                 mov     [esi+8], eax
0079A7DE                 jnz     short loc_79A7E5
0079A7E0                 pop     edi
0079A7E1                 pop     esi
0079A7E2                 retn    8
0079A7E5 ; ---------------------------------------------------------------------------
0079A7E5
0079A7E5 loc_79A7E5:                             ; CODE XREF: sub_79A7B0+2Eâ†‘j
0079A7E5                 lea     eax, [esi+40h]
0079A7E8                 push    eax             ; lpAddend
0079A7E9                 call    ds:InterlockedIncrement
0079A7EF                 mov     ecx, [esi+8]
0079A7F2                 mov     edx, [ecx]
0079A7F4                 mov     eax, [edx+1Ch]
0079A7F7                 call    eax
0079A7F9                 mov     ecx, [esi+8]
0079A7FC                 mov     edx, [ecx]
0079A7FE                 mov     eax, [edx+4]
0079A801                 call    eax
0079A803                 pop     edi
0079A804                 pop     esi
0079A805                 retn    8
0079A805 sub_79A7B0      endp
0079A805
0079A805 ; ---------------------------------------------------------------------------
0079A808                 align 10h
0079A810
0079A810 ; =============== S U B R O U T I N E =======================================
0079A810
0079A810
0079A810 sub_79A810      proc near               ; DATA XREF: .rdata:00FE5464â†“o
0079A810                 push    esi
0079A811                 mov     esi, ecx
0079A813                 cmp     dword ptr [esi+4], 0
0079A817                 push    edi
0079A818                 mov     edi, ds:InterlockedDecrement
0079A81E                 jz      short loc_79A830
0079A820                 lea     eax, [esi+3Ch]
0079A823                 push    eax             ; lpAddend
0079A824                 call    edi ; InterlockedDecrement
0079A826                 mov     ecx, [esi+4]
0079A829                 mov     edx, [ecx]
0079A82B                 mov     eax, [edx+20h]
0079A82E                 call    eax
0079A830
0079A830 loc_79A830:                             ; CODE XREF: sub_79A810+Eâ†‘j
0079A830                 cmp     dword ptr [esi+8], 0
0079A834                 jz      short loc_79A846
0079A836                 lea     ecx, [esi+40h]
0079A839                 push    ecx             ; lpAddend
0079A83A                 call    edi ; InterlockedDecrement
0079A83C                 mov     ecx, [esi+8]
0079A83F                 mov     edx, [ecx]
0079A841                 mov     eax, [edx+20h]
0079A844                 call    eax
0079A846
0079A846 loc_79A846:                             ; CODE XREF: sub_79A810+24â†‘j
0079A846                 pop     edi
0079A847                 pop     esi
0079A848                 retn    8
0079A848 sub_79A810      endp
0079A848
0079A848 ; ---------------------------------------------------------------------------
0079A84B                 align 10h
0079A850
0079A850 ; =============== S U B R O U T I N E =======================================
0079A850
0079A850
0079A850 sub_79A850      proc near               ; CODE XREF: sub_79B9A0+ADâ†“p
0079A850
0079A850 arg_0           = dword ptr  4
0079A850
0079A850                 push    ebx
0079A851                 push    ebp
0079A852                 push    esi
0079A853                 push    edi
0079A854                 mov     edi, [esp+10h+arg_0]
0079A858                 mov     ebx, ecx
0079A85A                 xor     ebp, ebp
0079A85C                 lea     esp, [esp+0]
0079A860
0079A860 loc_79A860:                             ; CODE XREF: sub_79A850+4Bâ†“j
0079A860                 mov     ecx, [ebx+14h]
0079A863                 mov     eax, [ecx]
0079A865                 mov     edx, [eax+4]
0079A868                 mov     esi, dword_1327C24
0079A86E                 call    edx
0079A870                 mov     edx, [esi]
0079A872                 push    eax
0079A873                 mov     eax, [edx+0Ch]
0079A876                 push    10h
0079A878                 push    edi
0079A879                 mov     ecx, esi
0079A87B                 call    eax
0079A87D                 mov     esi, eax
0079A87F                 test    esi, esi
0079A881                 jnz     short loc_79A89D
0079A883                 call    ds:SwitchToThread
0079A889                 test    eax, eax
0079A88B                 jnz     short loc_79A895
0079A88D                 push    1               ; dwMilliseconds
0079A88F                 call    ds:__imp_Sleep
0079A895
0079A895 loc_79A895:                             ; CODE XREF: sub_79A850+3Bâ†‘j
0079A895                 add     ebp, 1
0079A898                 cmp     ebp, 0Ah
0079A89B                 jb      short loc_79A860
0079A89D
0079A89D loc_79A89D:                             ; CODE XREF: sub_79A850+31â†‘j
0079A89D                 pop     edi
0079A89E                 mov     eax, esi
0079A8A0                 pop     esi
0079A8A1                 pop     ebp
0079A8A2                 pop     ebx
0079A8A3                 retn    4
0079A8A3 sub_79A850      endp
0079A8A3
0079A8A3 ; ---------------------------------------------------------------------------
0079A8A6                 align 10h
0079A8B0
0079A8B0 ; =============== S U B R O U T I N E =======================================
0079A8B0
0079A8B0
0079A8B0 sub_79A8B0      proc near               ; CODE XREF: sub_79B9A0+F5â†“p
0079A8B0
0079A8B0 arg_0           = dword ptr  4
0079A8B0
0079A8B0                 push    ebx
0079A8B1                 push    ebp
0079A8B2                 push    esi
0079A8B3                 push    edi
0079A8B4                 mov     edi, [esp+10h+arg_0]
0079A8B8                 mov     ebx, ecx
0079A8BA                 xor     ebp, ebp
0079A8BC                 lea     esp, [esp+0]
0079A8C0
0079A8C0 loc_79A8C0:                             ; CODE XREF: sub_79A8B0+4Bâ†“j
0079A8C0                 mov     ecx, [ebx+14h]
0079A8C3                 mov     eax, [ecx]
0079A8C5                 mov     edx, [eax+4]
0079A8C8                 mov     esi, dword_1327C40
0079A8CE                 call    edx
0079A8D0                 mov     edx, [esi]
0079A8D2                 push    eax
0079A8D3                 mov     eax, [edx+0Ch]
0079A8D6                 push    10h
0079A8D8                 push    edi
0079A8D9                 mov     ecx, esi
0079A8DB                 call    eax
0079A8DD                 mov     esi, eax
0079A8DF                 test    esi, esi
0079A8E1                 jnz     short loc_79A8FD
0079A8E3                 call    ds:SwitchToThread
0079A8E9                 test    eax, eax
0079A8EB                 jnz     short loc_79A8F5
0079A8ED                 push    1               ; dwMilliseconds
0079A8EF                 call    ds:__imp_Sleep
0079A8F5
0079A8F5 loc_79A8F5:                             ; CODE XREF: sub_79A8B0+3Bâ†‘j
0079A8F5                 add     ebp, 1
0079A8F8                 cmp     ebp, 0Ah
0079A8FB                 jb      short loc_79A8C0
0079A8FD
0079A8FD loc_79A8FD:                             ; CODE XREF: sub_79A8B0+31â†‘j
0079A8FD                 pop     edi
0079A8FE                 mov     eax, esi
0079A900                 pop     esi
0079A901                 pop     ebp
0079A902                 pop     ebx
0079A903                 retn    4
0079A903 sub_79A8B0      endp
0079A903
0079A903 ; ---------------------------------------------------------------------------
0079A906                 align 10h
0079A910
0079A910 ; =============== S U B R O U T I N E =======================================
0079A910
0079A910
0079A910 sub_79A910      proc near               ; CODE XREF: sub_648310+F0â†‘p
0079A910                                         ; sub_79B9A0+103â†“p ...
0079A910                 push    esi
0079A911                 mov     esi, ecx
0079A913                 cmp     dword ptr [esi+4], 0
0079A917                 jz      short loc_79A94B
0079A919                 push    0               ; Value
0079A91B                 lea     eax, [esi+3Ch]
0079A91E                 push    eax             ; Addend
0079A91F                 call    ds:InterlockedExchangeAdd
0079A925                 test    eax, eax
0079A927                 jnz     short loc_79A94B
0079A929                 mov     ecx, [esi+4]
0079A92C                 mov     edx, [ecx]
0079A92E                 mov     eax, [edx+18h]
0079A931                 call    eax
0079A933                 mov     ecx, [esi+4]
0079A936                 mov     edx, [eax]
0079A938                 mov     edx, [edx+10h]
0079A93B                 push    ecx
0079A93C                 mov     ecx, eax
0079A93E                 call    edx
0079A940                 mov     dword ptr [esi+4], 0
0079A947                 mov     byte ptr [esi+10h], 0
0079A94B
0079A94B loc_79A94B:                             ; CODE XREF: sub_79A910+7â†‘j
0079A94B                                         ; sub_79A910+17â†‘j
0079A94B                 pop     esi
0079A94C                 retn
0079A94C sub_79A910      endp
0079A94C
0079A94C ; ---------------------------------------------------------------------------
0079A94D                 align 10h
0079A950
0079A950 ; =============== S U B R O U T I N E =======================================
0079A950
0079A950
0079A950 sub_79A950      proc near               ; CODE XREF: sub_649160+51Bâ†‘p
0079A950                 push    esi
0079A951                 mov     esi, ecx
0079A953                 cmp     dword ptr [esi+8], 0
0079A957                 jz      short loc_79A98B
0079A959                 push    0               ; Value
0079A95B                 lea     eax, [esi+40h]
0079A95E                 push    eax             ; Addend
0079A95F                 call    ds:InterlockedExchangeAdd
0079A965                 test    eax, eax
0079A967                 jnz     short loc_79A98B
0079A969                 mov     ecx, [esi+8]
0079A96C                 mov     edx, [ecx]
0079A96E                 mov     eax, [edx+18h]
0079A971                 call    eax
0079A973                 mov     ecx, [esi+8]
0079A976                 mov     edx, [eax]
0079A978                 mov     edx, [edx+10h]
0079A97B                 push    ecx
0079A97C                 mov     ecx, eax
0079A97E                 call    edx
0079A980                 mov     dword ptr [esi+8], 0
0079A987                 mov     byte ptr [esi+11h], 0
0079A98B
0079A98B loc_79A98B:                             ; CODE XREF: sub_79A950+7â†‘j
0079A98B                                         ; sub_79A950+17â†‘j
0079A98B                 pop     esi
0079A98C                 retn
0079A98C sub_79A950      endp
0079A98C
0079A98C ; ---------------------------------------------------------------------------
0079A98D                 align 10h
0079A990
0079A990 ; =============== S U B R O U T I N E =======================================
0079A990
0079A990
0079A990 sub_79A990      proc near               ; CODE XREF: sub_79B9A0+148â†“p
0079A990                 push    esi
0079A991                 mov     esi, ecx
0079A993                 mov     ecx, [esi+0Ch]
0079A996                 test    ecx, ecx
0079A998                 jz      short loc_79A9B5
0079A99A                 mov     eax, [ecx]
0079A99C                 mov     edx, [eax+18h]
0079A99F                 call    edx
0079A9A1                 mov     ecx, [esi+0Ch]
0079A9A4                 mov     edx, [eax]
0079A9A6                 mov     edx, [edx+10h]
0079A9A9                 push    ecx
0079A9AA                 mov     ecx, eax
0079A9AC                 call    edx
0079A9AE                 mov     dword ptr [esi+0Ch], 0
0079A9B5
0079A9B5 loc_79A9B5:                             ; CODE XREF: sub_79A990+8â†‘j
0079A9B5                 pop     esi
0079A9B6                 retn
0079A9B6 sub_79A990      endp
0079A9B6
0079A9B6 ; ---------------------------------------------------------------------------
0079A9B7                 align 10h
0079A9C0
0079A9C0 ; =============== S U B R O U T I N E =======================================
0079A9C0
0079A9C0
0079A9C0 sub_79A9C0      proc near               ; CODE XREF: sub_79BB20+3Câ†“p
0079A9C0                                         ; sub_79D280+5Fâ†“p
0079A9C0
0079A9C0 var_10          = dword ptr -10h
0079A9C0 var_C           = byte ptr -0Ch
0079A9C0 var_4           = dword ptr -4
0079A9C0 arg_0           = dword ptr  4
0079A9C0 arg_4           = dword ptr  8
0079A9C0
0079A9C0 ; FUNCTION CHUNK AT 00EA87C2 SIZE 00000026 BYTES
0079A9C0
0079A9C0 ; __unwind { // SEH_79A9C0
0079A9C0                 push    0FFFFFFFFh
0079A9C2                 push    offset SEH_79A9C0
0079A9C7                 mov     eax, large fs:0
0079A9CD                 push    eax
0079A9CE                 push    ecx
0079A9CF                 push    ebx
0079A9D0                 push    esi
0079A9D1                 push    edi
0079A9D2                 mov     eax, dword_12EA8B0
0079A9D7                 xor     eax, esp
0079A9D9                 push    eax
0079A9DA                 lea     eax, [esp+20h+var_C]
0079A9DE                 mov     large fs:0, eax
0079A9E4                 mov     esi, ecx
0079A9E6                 push    0Ch             ; Size
0079A9E8                 call    ??2@YAPAXI@Z    ; operator new(uint)
0079A9ED                 add     esp, 4
0079A9F0                 mov     [esp+20h+var_10], eax
0079A9F4                 xor     ebx, ebx
0079A9F6                 mov     [esp+20h+var_4], ebx
0079A9FA                 cmp     eax, ebx
0079A9FC                 jz      short loc_79AA11
0079A9FE                 mov     ecx, [esi+0Ch]
0079AA01                 mov     edx, [esi+8]
0079AA04                 mov     edi, [esi+4]
0079AA07                 mov     [eax], edi
0079AA09                 mov     [eax+4], edx
0079AA0C                 mov     [eax+8], ecx
0079AA0F                 jmp     short loc_79AA13
0079AA11 ; ---------------------------------------------------------------------------
0079AA11
0079AA11 loc_79AA11:                             ; CODE XREF: sub_79A9C0+3Câ†‘j
0079AA11                 xor     eax, eax
0079AA13
0079AA13 loc_79AA13:                             ; CODE XREF: sub_79A9C0+4Fâ†‘j
0079AA13                 mov     [esp+20h+var_4], 0FFFFFFFFh
0079AA1B                 mov     edi, [esp+20h+arg_0]
0079AA1F                 mov     edx, [edi]
0079AA21                 push    eax
0079AA22                 mov     eax, [edx+2Ch]
0079AA25                 push    offset sub_79A640
0079AA2A                 mov     ecx, edi
0079AA2C                 call    eax
0079AA2E                 mov     edx, [edi]
0079AA30                 mov     eax, [edx+14h]
0079AA33                 push    ebx
0079AA34                 push    1
0079AA36                 push    ebx
0079AA37                 push    ebx
0079AA38                 mov     ecx, edi
0079AA3A                 call    eax
0079AA3C                 mov     [esi+4], ebx
0079AA3F                 mov     [esi+8], ebx
0079AA42                 mov     [esi+0Ch], ebx
0079AA45                 mov     ecx, dword ptr [esp+20h+var_C]
0079AA49                 mov     large fs:0, ecx
0079AA50                 pop     ecx
0079AA51                 pop     edi
0079AA52                 pop     esi
0079AA53                 pop     ebx
0079AA54                 add     esp, 10h
0079AA57                 retn    4
0079AA57 ; } // starts at 79A9C0
0079AA57 sub_79A9C0      endp
0079AA57
0079AA57 ; ---------------------------------------------------------------------------
0079AA5A                 align 10h
0079AA60
0079AA60 ; =============== S U B R O U T I N E =======================================
0079AA60
0079AA60
0079AA60 sub_79AA60      proc near               ; CODE XREF: sub_648310+43â†‘p
0079AA60                                         ; sub_648F20+19Aâ†‘p
0079AA60
0079AA60 arg_0           = dword ptr  4
0079AA60
0079AA60                 mov     ecx, [esp+arg_0]
0079AA64                 cmp     ecx, 0Ah        ; switch 11 cases
0079AA67                 mov     al, 1
0079AA69                 ja      short def_79AA6B ; jumptable 0079AA6B default case, cases 3,6,8-10
0079AA6B                 jmp     ds:jpt_79AA6B[ecx*4] ; switch jump
0079AA72 ; ---------------------------------------------------------------------------
0079AA72
0079AA72 def_79AA6B:                             ; CODE XREF: sub_79AA60+9â†‘j
0079AA72                                         ; sub_79AA60+Bâ†‘j
0079AA72                                         ; DATA XREF: ...
0079AA72                 xor     al, al          ; jumptable 0079AA6B default case, cases 3,6,8-10
0079AA74
0079AA74 locret_79AA74:                          ; CODE XREF: sub_79AA60+Bâ†‘j
0079AA74                                         ; DATA XREF: .text:jpt_79AA6Bâ†“o
0079AA74                 retn                    ; jumptable 0079AA6B cases 0-2,4,5,7
0079AA74 sub_79AA60      endp
0079AA74
0079AA74 ; ---------------------------------------------------------------------------
0079AA75                 align 4
0079AA78 jpt_79AA6B      dd offset locret_79AA74 ; DATA XREF: sub_79AA60+Bâ†‘r
0079AA7C                 dd offset locret_79AA74 ; jump table for switch statement
0079AA80                 dd offset locret_79AA74
0079AA84                 dd offset def_79AA6B
0079AA88                 dd offset locret_79AA74
0079AA8C                 dd offset locret_79AA74
0079AA90                 dd offset def_79AA6B
0079AA94                 dd offset locret_79AA74
0079AA98                 dd offset def_79AA6B
0079AA9C                 dd offset def_79AA6B
0079AAA0                 dd offset def_79AA6B
0079AAA4                 align 10h
0079AAB0
0079AAB0 ; =============== S U B R O U T I N E =======================================
0079AAB0
0079AAB0
0079AAB0 sub_79AAB0      proc near
0079AAB0
0079AAB0 arg_0           = dword ptr  4
0079AAB0
0079AAB0                 push    ebx
0079AAB1                 mov     ebx, [esp+4+arg_0]
0079AAB5                 push    esi
0079AAB6                 mov     esi, [ebx+18h]
0079AAB9                 test    esi, esi
0079AABB                 jz      short loc_79AADA
0079AABD                 mov     ecx, [ecx+4]
0079AAC0                 push    edi
0079AAC1                 call    sub_60B370
0079AAC6                 mov     edi, eax
0079AAC8
0079AAC8 loc_79AAC8:                             ; CODE XREF: sub_79AAB0+27â†“j
0079AAC8                 mov     eax, [edi]
0079AACA                 mov     edx, [eax+20h]
0079AACD                 push    esi
0079AACE                 mov     ecx, edi
0079AAD0                 call    edx
0079AAD2                 mov     esi, [ebx+18h]
0079AAD5                 test    esi, esi
0079AAD7                 jnz     short loc_79AAC8
0079AAD9                 pop     edi
0079AADA
0079AADA loc_79AADA:                             ; CODE XREF: sub_79AAB0+Bâ†‘j
0079AADA                 pop     esi
0079AADB                 pop     ebx
0079AADC                 retn    8
0079AADC sub_79AAB0      endp
0079AADC
0079AADC ; ---------------------------------------------------------------------------
0079AADF                 align 10h
0079AAE0                 mov     eax, [esp+4]
0079AAE4                 push    eax
0079AAE5                 call    sub_79A330
0079AAEA                 xor     ecx, ecx
0079AAEC                 add     esp, 4
0079AAEF                 cmp     eax, 1000h
0079AAF4                 setz    cl
0079AAF7                 mov     al, cl
0079AAF9                 retn
0079AAF9 ; ---------------------------------------------------------------------------
0079AAFA                 align 10h
0079AB00                 mov     eax, [esp+4]
0079AB04                 push    eax
0079AB05                 call    sub_79A330
0079AB0A                 add     esp, 4
0079AB0D                 test    eax, eax
0079AB0F                 jz      short loc_79AB19
0079AB11                 cmp     eax, 1
0079AB14                 jz      short loc_79AB19
0079AB16                 xor     eax, eax
0079AB18                 retn
0079AB19 ; ---------------------------------------------------------------------------
0079AB19
0079AB19 loc_79AB19:                             ; CODE XREF: .text:0079AB0Fâ†‘j
0079AB19                                         ; .text:0079AB14â†‘j
0079AB19                 mov     eax, 1
0079AB1E                 retn
0079AB1E ; ---------------------------------------------------------------------------
0079AB1F                 align 10h
0079AB20                 cmp     dword ptr [esp+4], 4003h
0079AB28                 push    esi
0079AB29                 mov     esi, ecx
0079AB2B                 jnz     short loc_79AB4C
0079AB2D                 mov     ecx, [esi+0C0h]
0079AB33                 test    ecx, ecx
0079AB35                 jnz     short loc_79AB3D
0079AB37                 xor     eax, eax
0079AB39                 pop     esi
0079AB3A                 retn    4
0079AB3D ; ---------------------------------------------------------------------------
0079AB3D
0079AB3D loc_79AB3D:                             ; CODE XREF: .text:0079AB35â†‘j
0079AB3D                 mov     eax, [esi+0C4h]
0079AB43                 sub     eax, ecx
0079AB45                 sar     eax, 2
0079AB48                 pop     esi
0079AB49                 retn    4
0079AB4C ; ---------------------------------------------------------------------------
0079AB4C
0079AB4C loc_79AB4C:                             ; CODE XREF: .text:0079AB2Bâ†‘j
0079AB4C                 mov     eax, [esi+0C0h]
0079AB52                 push    ebx
0079AB53                 push    ebp
0079AB54                 xor     ebp, ebp
0079AB56                 test    eax, eax
0079AB58                 push    edi
0079AB59                 jnz     short loc_79AB5F
0079AB5B                 xor     ebx, ebx
0079AB5D                 jmp     short loc_79AB6A
0079AB5F ; ---------------------------------------------------------------------------
0079AB5F
0079AB5F loc_79AB5F:                             ; CODE XREF: .text:0079AB59â†‘j
0079AB5F                 mov     ebx, [esi+0C4h]
0079AB65                 sub     ebx, eax
0079AB67                 sar     ebx, 2
0079AB6A
0079AB6A loc_79AB6A:                             ; CODE XREF: .text:0079AB5Dâ†‘j
0079AB6A                 xor     edi, edi
0079AB6C                 test    ebx, ebx
0079AB6E                 jbe     short loc_79ABAA
0079AB70
0079AB70 loc_79AB70:                             ; CODE XREF: .text:0079ABA8â†“j
0079AB70                 mov     ecx, [esi+0C0h]
0079AB76                 test    ecx, ecx
0079AB78                 jz      short loc_79AB89
0079AB7A                 mov     eax, [esi+0C4h]
0079AB80                 sub     eax, ecx
0079AB82                 sar     eax, 2
0079AB85                 cmp     edi, eax
0079AB87                 jb      short loc_79AB8E
0079AB89
0079AB89 loc_79AB89:                             ; CODE XREF: .text:0079AB78â†‘j
0079AB89                 call    __invalid_parameter_noinfo
0079AB8E
0079AB8E loc_79AB8E:                             ; CODE XREF: .text:0079AB87â†‘j
0079AB8E                 mov     eax, [esi+0C0h]
0079AB94                 mov     ecx, [eax+edi*4]
0079AB97                 mov     edx, [esp+14h]
0079AB9B                 cmp     edx, [ecx+5Ch]
0079AB9E                 jnz     short loc_79ABA3
0079ABA0                 add     ebp, 1
0079ABA3
0079ABA3 loc_79ABA3:                             ; CODE XREF: .text:0079AB9Eâ†‘j
0079ABA3                 add     edi, 1
0079ABA6                 cmp     edi, ebx
0079ABA8                 jb      short loc_79AB70
0079ABAA
0079ABAA loc_79ABAA:                             ; CODE XREF: .text:0079AB6Eâ†‘j
0079ABAA                 pop     edi
0079ABAB                 mov     eax, ebp
0079ABAD                 pop     ebp
0079ABAE                 pop     ebx
0079ABAF                 pop     esi
0079ABB0                 retn    4
0079ABB0 ; ---------------------------------------------------------------------------
0079ABB3                 align 10h
0079ABC0
0079ABC0 ; =============== S U B R O U T I N E =======================================
0079ABC0
0079ABC0
0079ABC0 sub_79ABC0      proc near               ; CODE XREF: sub_64C750+2Câ†‘p
0079ABC0
0079ABC0 var_4           = dword ptr -4
0079ABC0 arg_0           = dword ptr  4
0079ABC0
0079ABC0                 push    ecx
0079ABC1                 push    ebx
0079ABC2                 push    ebp
0079ABC3                 push    esi
0079ABC4                 mov     ebx, ecx
0079ABC6                 mov     eax, [ebx+0C0h]
0079ABCC                 push    edi
0079ABCD                 xor     edi, edi
0079ABCF                 cmp     eax, edi
0079ABD1                 jnz     short loc_79ABD9
0079ABD3                 mov     [esp+14h+var_4], edi
0079ABD7                 jmp     short loc_79ABE8
0079ABD9 ; ---------------------------------------------------------------------------
0079ABD9
0079ABD9 loc_79ABD9:                             ; CODE XREF: sub_79ABC0+11â†‘j
0079ABD9                 mov     ecx, [ebx+0C4h]
0079ABDF                 sub     ecx, eax
0079ABE1                 sar     ecx, 2
0079ABE4                 mov     [esp+14h+var_4], ecx
0079ABE8
0079ABE8 loc_79ABE8:                             ; CODE XREF: sub_79ABC0+17â†‘j
0079ABE8                 cmp     [esp+14h+var_4], edi
0079ABEC                 jbe     short loc_79AC55
0079ABEE                 mov     edi, edi
0079ABF0
0079ABF0 loc_79ABF0:                             ; CODE XREF: sub_79ABC0+93â†“j
0079ABF0                 mov     ecx, [ebx+0C0h]
0079ABF6                 test    ecx, ecx
0079ABF8                 jz      short loc_79AC09
0079ABFA                 mov     eax, [ebx+0C4h]
0079AC00                 sub     eax, ecx
0079AC02                 sar     eax, 2
0079AC05                 cmp     edi, eax
0079AC07                 jb      short loc_79AC0E
0079AC09
0079AC09 loc_79AC09:                             ; CODE XREF: sub_79ABC0+38â†‘j
0079AC09                 call    __invalid_parameter_noinfo
0079AC0E
0079AC0E loc_79AC0E:                             ; CODE XREF: sub_79ABC0+47â†‘j
0079AC0E                 mov     eax, [ebx+0C0h]
0079AC14                 mov     ebp, [eax+edi*4]
0079AC17                 mov     esi, [esp+14h+arg_0]
0079AC1B                 lea     ecx, [ebp+4]
0079AC1E                 call    sub_445210
0079AC23
0079AC23 loc_79AC23:                             ; CODE XREF: sub_79ABC0+7Dâ†“j
0079AC23                 mov     cl, [eax]
0079AC25                 cmp     cl, [esi]
0079AC27                 jnz     short loc_79AC43
0079AC29                 test    cl, cl
0079AC2B                 jz      short loc_79AC3F
0079AC2D                 mov     cl, [eax+1]
0079AC30                 cmp     cl, [esi+1]
0079AC33                 jnz     short loc_79AC43
0079AC35                 add     eax, 2
0079AC38                 add     esi, 2
0079AC3B                 test    cl, cl
0079AC3D                 jnz     short loc_79AC23
0079AC3F
0079AC3F loc_79AC3F:                             ; CODE XREF: sub_79ABC0+6Bâ†‘j
0079AC3F                 xor     eax, eax
0079AC41                 jmp     short loc_79AC48
0079AC43 ; ---------------------------------------------------------------------------
0079AC43
0079AC43 loc_79AC43:                             ; CODE XREF: sub_79ABC0+67â†‘j
0079AC43                                         ; sub_79ABC0+73â†‘j
0079AC43                 sbb     eax, eax
0079AC45                 sbb     eax, 0FFFFFFFFh
0079AC48
0079AC48 loc_79AC48:                             ; CODE XREF: sub_79ABC0+81â†‘j
0079AC48                 test    eax, eax
0079AC4A                 jz      short loc_79AC5F
0079AC4C                 add     edi, 1
0079AC4F                 cmp     edi, [esp+14h+var_4]
0079AC53                 jb      short loc_79ABF0
0079AC55
0079AC55 loc_79AC55:                             ; CODE XREF: sub_79ABC0+2Câ†‘j
0079AC55                 pop     edi
0079AC56                 pop     esi
0079AC57                 pop     ebp
0079AC58                 xor     eax, eax
0079AC5A                 pop     ebx
0079AC5B                 pop     ecx
0079AC5C                 retn    4
0079AC5F ; ---------------------------------------------------------------------------
0079AC5F
0079AC5F loc_79AC5F:                             ; CODE XREF: sub_79ABC0+8Aâ†‘j
0079AC5F                 pop     edi
0079AC60                 pop     esi
0079AC61                 mov     eax, ebp
0079AC63                 pop     ebp
0079AC64                 pop     ebx
0079AC65                 pop     ecx
0079AC66                 retn    4
0079AC66 sub_79ABC0      endp
0079AC66
0079AC66 ; ---------------------------------------------------------------------------
0079AC69                 align 10h
0079AC70
0079AC70 ; =============== S U B R O U T I N E =======================================
0079AC70
0079AC70
0079AC70 sub_79AC70      proc near               ; CODE XREF: sub_79B6C0+45â†“p
0079AC70
0079AC70 arg_0           = dword ptr  4
0079AC70
0079AC70                 push    ebx
0079AC71                 push    ebp
0079AC72                 push    esi
0079AC73                 push    edi
0079AC74                 mov     edi, ecx
0079AC76                 mov     eax, [edi+0C0h]
0079AC7C                 test    eax, eax
0079AC7E                 jnz     short loc_79AC84
0079AC80                 xor     ebx, ebx
0079AC82                 jmp     short loc_79AC8F
0079AC84 ; ---------------------------------------------------------------------------
0079AC84
0079AC84 loc_79AC84:                             ; CODE XREF: sub_79AC70+Eâ†‘j
0079AC84                 mov     ebx, [edi+0C4h]
0079AC8A                 sub     ebx, eax
0079AC8C                 sar     ebx, 2
0079AC8F
0079AC8F loc_79AC8F:                             ; CODE XREF: sub_79AC70+12â†‘j
0079AC8F                 xor     esi, esi
0079AC91                 test    ebx, ebx
0079AC93                 jbe     short loc_79ACD3
0079AC95                 mov     ebp, [esp+10h+arg_0]
0079AC99                 lea     esp, [esp+0]
0079ACA0
0079ACA0 loc_79ACA0:                             ; CODE XREF: sub_79AC70+61â†“j
0079ACA0                 mov     ecx, [edi+0C0h]
0079ACA6                 test    ecx, ecx
0079ACA8                 jz      short loc_79ACB9
0079ACAA                 mov     eax, [edi+0C4h]
0079ACB0                 sub     eax, ecx
0079ACB2                 sar     eax, 2
0079ACB5                 cmp     esi, eax
0079ACB7                 jb      short loc_79ACBE
0079ACB9
0079ACB9 loc_79ACB9:                             ; CODE XREF: sub_79AC70+38â†‘j
0079ACB9                 call    __invalid_parameter_noinfo
0079ACBE
0079ACBE loc_79ACBE:                             ; CODE XREF: sub_79AC70+47â†‘j
0079ACBE                 mov     eax, [edi+0C0h]
0079ACC4                 mov     ecx, [eax+esi*4]
0079ACC7                 cmp     [ecx+60h], ebp
0079ACCA                 jz      short loc_79ACDC
0079ACCC                 add     esi, 1
0079ACCF                 cmp     esi, ebx
0079ACD1                 jb      short loc_79ACA0
0079ACD3
0079ACD3 loc_79ACD3:                             ; CODE XREF: sub_79AC70+23â†‘j
0079ACD3                 pop     edi
0079ACD4                 pop     esi
0079ACD5                 pop     ebp
0079ACD6                 xor     al, al
0079ACD8                 pop     ebx
0079ACD9                 retn    4
0079ACDC ; ---------------------------------------------------------------------------
0079ACDC
0079ACDC loc_79ACDC:                             ; CODE XREF: sub_79AC70+5Aâ†‘j
0079ACDC                 pop     edi
0079ACDD                 pop     esi
0079ACDE                 pop     ebp
0079ACDF                 mov     al, 1
0079ACE1                 pop     ebx
0079ACE2                 retn    4
0079ACE2 sub_79AC70      endp
0079ACE2
0079ACE2 ; ---------------------------------------------------------------------------
0079ACE5                 align 10h
0079ACF0
0079ACF0 ; =============== S U B R O U T I N E =======================================
0079ACF0
0079ACF0
0079ACF0 sub_79ACF0      proc near               ; CODE XREF: sub_59DF90+48â†‘p
0079ACF0                                         ; sub_79B660+44â†“p
0079ACF0
0079ACF0 arg_0           = dword ptr  4
0079ACF0
0079ACF0                 push    ebx
0079ACF1                 push    ebp
0079ACF2                 push    esi
0079ACF3                 push    edi
0079ACF4                 mov     edi, ecx
0079ACF6                 mov     eax, [edi+0C0h]
0079ACFC                 test    eax, eax
0079ACFE                 jnz     short loc_79AD04
0079AD00                 xor     ebx, ebx
0079AD02                 jmp     short loc_79AD0F
0079AD04 ; ---------------------------------------------------------------------------
0079AD04
0079AD04 loc_79AD04:                             ; CODE XREF: sub_79ACF0+Eâ†‘j
0079AD04                 mov     ebx, [edi+0C4h]
0079AD0A                 sub     ebx, eax
0079AD0C                 sar     ebx, 2
0079AD0F
0079AD0F loc_79AD0F:                             ; CODE XREF: sub_79ACF0+12â†‘j
0079AD0F                 xor     esi, esi
0079AD11                 test    ebx, ebx
0079AD13                 jbe     short loc_79AD53
0079AD15                 mov     ebp, [esp+10h+arg_0]
0079AD19                 lea     esp, [esp+0]
0079AD20
0079AD20 loc_79AD20:                             ; CODE XREF: sub_79ACF0+61â†“j
0079AD20                 mov     ecx, [edi+0C0h]
0079AD26                 test    ecx, ecx
0079AD28                 jz      short loc_79AD39
0079AD2A                 mov     eax, [edi+0C4h]
0079AD30                 sub     eax, ecx
0079AD32                 sar     eax, 2
0079AD35                 cmp     esi, eax
0079AD37                 jb      short loc_79AD3E
0079AD39
0079AD39 loc_79AD39:                             ; CODE XREF: sub_79ACF0+38â†‘j
0079AD39                 call    __invalid_parameter_noinfo
0079AD3E
0079AD3E loc_79AD3E:                             ; CODE XREF: sub_79ACF0+47â†‘j
0079AD3E                 mov     eax, [edi+0C0h]
0079AD44                 mov     eax, [eax+esi*4]
0079AD47                 cmp     [eax+58h], ebp
0079AD4A                 jz      short loc_79AD5C
0079AD4C                 add     esi, 1
0079AD4F                 cmp     esi, ebx
0079AD51                 jb      short loc_79AD20
0079AD53
0079AD53 loc_79AD53:                             ; CODE XREF: sub_79ACF0+23â†‘j
0079AD53                 pop     edi
0079AD54                 pop     esi
0079AD55                 pop     ebp
0079AD56                 xor     eax, eax
0079AD58                 pop     ebx
0079AD59                 retn    4
0079AD5C ; ---------------------------------------------------------------------------
0079AD5C
0079AD5C loc_79AD5C:                             ; CODE XREF: sub_79ACF0+5Aâ†‘j
0079AD5C                 lea     ecx, [eax+4]
0079AD5F                 call    sub_445210
0079AD64                 pop     edi
0079AD65                 pop     esi
0079AD66                 pop     ebp
0079AD67                 pop     ebx
0079AD68                 retn    4
0079AD68 sub_79ACF0      endp
0079AD68
0079AD68 ; ---------------------------------------------------------------------------
0079AD6B                 align 10h
0079AD70
0079AD70 loc_79AD70:                             ; CODE XREF: .text:0059E084â†‘j
0079AD70                 push    ebx
0079AD71                 push    ebp
0079AD72                 push    esi
0079AD73                 push    edi
0079AD74                 mov     edi, ecx
0079AD76                 mov     eax, [edi+0C0h]
0079AD7C                 test    eax, eax
0079AD7E                 jnz     short loc_79AD84
0079AD80                 xor     ebx, ebx
0079AD82                 jmp     short loc_79AD8F
0079AD84 ; ---------------------------------------------------------------------------
0079AD84
0079AD84 loc_79AD84:                             ; CODE XREF: .text:0079AD7Eâ†‘j
0079AD84                 mov     ebx, [edi+0C4h]
0079AD8A                 sub     ebx, eax
0079AD8C                 sar     ebx, 2
0079AD8F
0079AD8F loc_79AD8F:                             ; CODE XREF: .text:0079AD82â†‘j
0079AD8F                 xor     esi, esi
0079AD91                 test    ebx, ebx
0079AD93                 jbe     short loc_79ADD3
0079AD95                 mov     ebp, [esp+14h]
0079AD99                 lea     esp, [esp+0]
0079ADA0
0079ADA0 loc_79ADA0:                             ; CODE XREF: .text:0079ADD1â†“j
0079ADA0                 mov     ecx, [edi+0C0h]
0079ADA6                 test    ecx, ecx
0079ADA8                 jz      short loc_79ADB9
0079ADAA                 mov     eax, [edi+0C4h]
0079ADB0                 sub     eax, ecx
0079ADB2                 sar     eax, 2
0079ADB5                 cmp     esi, eax
0079ADB7                 jb      short loc_79ADBE
0079ADB9
0079ADB9 loc_79ADB9:                             ; CODE XREF: .text:0079ADA8â†‘j
0079ADB9                 call    __invalid_parameter_noinfo
0079ADBE
0079ADBE loc_79ADBE:                             ; CODE XREF: .text:0079ADB7â†‘j
0079ADBE                 mov     eax, [edi+0C0h]
0079ADC4                 mov     eax, [eax+esi*4]
0079ADC7                 cmp     [eax+58h], ebp
0079ADCA                 jz      short loc_79ADDF
0079ADCC                 add     esi, 1
0079ADCF                 cmp     esi, ebx
0079ADD1                 jb      short loc_79ADA0
0079ADD3
0079ADD3 loc_79ADD3:                             ; CODE XREF: .text:0079AD93â†‘j
0079ADD3                 pop     edi
0079ADD4                 pop     esi
0079ADD5                 pop     ebp
0079ADD6                 mov     eax, 3000h
0079ADDB                 pop     ebx
0079ADDC                 retn    4
0079ADDF ; ---------------------------------------------------------------------------
0079ADDF
0079ADDF loc_79ADDF:                             ; CODE XREF: .text:0079ADCAâ†‘j
0079ADDF                 mov     eax, [eax+5Ch]
0079ADE2                 pop     edi
0079ADE3                 pop     esi
0079ADE4                 pop     ebp
0079ADE5                 pop     ebx
0079ADE6                 retn    4
0079ADE6 ; ---------------------------------------------------------------------------
0079ADE9                 align 10h
0079ADF0
0079ADF0 ; =============== S U B R O U T I N E =======================================
0079ADF0
0079ADF0
0079ADF0 sub_79ADF0      proc near               ; CODE XREF: sub_79B540+1Fâ†“p
0079ADF0                                         ; sub_79B540+68â†“p
0079ADF0
0079ADF0 arg_0           = dword ptr  4
0079ADF0
0079ADF0                 push    ebx
0079ADF1                 push    ebp
0079ADF2                 push    esi
0079ADF3                 push    edi
0079ADF4                 mov     edi, ecx
0079ADF6                 mov     eax, [edi+0C0h]
0079ADFC                 test    eax, eax
0079ADFE                 jnz     short loc_79AE04
0079AE00                 xor     ebx, ebx
0079AE02                 jmp     short loc_79AE0F
0079AE04 ; ---------------------------------------------------------------------------
0079AE04
0079AE04 loc_79AE04:                             ; CODE XREF: sub_79ADF0+Eâ†‘j
0079AE04                 mov     ebx, [edi+0C4h]
0079AE0A                 sub     ebx, eax
0079AE0C                 sar     ebx, 2
0079AE0F
0079AE0F loc_79AE0F:                             ; CODE XREF: sub_79ADF0+12â†‘j
0079AE0F                 xor     esi, esi
0079AE11                 test    ebx, ebx
0079AE13                 jbe     short loc_79AE53
0079AE15                 mov     ebp, [esp+10h+arg_0]
0079AE19                 lea     esp, [esp+0]
0079AE20
0079AE20 loc_79AE20:                             ; CODE XREF: sub_79ADF0+61â†“j
0079AE20                 mov     ecx, [edi+0C0h]
0079AE26                 test    ecx, ecx
0079AE28                 jz      short loc_79AE39
0079AE2A                 mov     eax, [edi+0C4h]
0079AE30                 sub     eax, ecx
0079AE32                 sar     eax, 2
0079AE35                 cmp     esi, eax
0079AE37                 jb      short loc_79AE3E
0079AE39
0079AE39 loc_79AE39:                             ; CODE XREF: sub_79ADF0+38â†‘j
0079AE39                 call    __invalid_parameter_noinfo
0079AE3E
0079AE3E loc_79AE3E:                             ; CODE XREF: sub_79ADF0+47â†‘j
0079AE3E                 mov     eax, [edi+0C0h]
0079AE44                 mov     eax, [eax+esi*4]
0079AE47                 cmp     [eax+60h], ebp
0079AE4A                 jz      short loc_79AE5C
0079AE4C                 add     esi, 1
0079AE4F                 cmp     esi, ebx
0079AE51                 jb      short loc_79AE20
0079AE53
0079AE53 loc_79AE53:                             ; CODE XREF: sub_79ADF0+23â†‘j
0079AE53                 pop     edi
0079AE54                 pop     esi
0079AE55                 pop     ebp
0079AE56                 xor     eax, eax
0079AE58                 pop     ebx
0079AE59                 retn    4
0079AE5C ; ---------------------------------------------------------------------------
0079AE5C
0079AE5C loc_79AE5C:                             ; CODE XREF: sub_79ADF0+5Aâ†‘j
0079AE5C                 mov     eax, [eax+58h]
0079AE5F                 pop     edi
0079AE60                 pop     esi
0079AE61                 pop     ebp
0079AE62                 pop     ebx
0079AE63                 retn    4
0079AE63 sub_79ADF0      endp
0079AE63
0079AE63 ; ---------------------------------------------------------------------------
0079AE66                 align 10h
0079AE70
0079AE70 ; =============== S U B R O U T I N E =======================================
0079AE70
0079AE70
0079AE70 sub_79AE70      proc near               ; CODE XREF: sub_79B5D0+1Fâ†“p
0079AE70                                         ; sub_79B5D0+68â†“p
0079AE70
0079AE70 var_4           = dword ptr -4
0079AE70 arg_0           = dword ptr  4
0079AE70
0079AE70                 push    ecx
0079AE71                 push    ebx
0079AE72                 push    ebp
0079AE73                 push    esi
0079AE74                 mov     ebx, ecx
0079AE76                 mov     eax, [ebx+0C0h]
0079AE7C                 push    edi
0079AE7D                 xor     edi, edi
0079AE7F                 cmp     eax, edi
0079AE81                 jnz     short loc_79AE89
0079AE83                 mov     [esp+14h+var_4], edi
0079AE87                 jmp     short loc_79AE98
0079AE89 ; ---------------------------------------------------------------------------
0079AE89
0079AE89 loc_79AE89:                             ; CODE XREF: sub_79AE70+11â†‘j
0079AE89                 mov     ecx, [ebx+0C4h]
0079AE8F                 sub     ecx, eax
0079AE91                 sar     ecx, 2
0079AE94                 mov     [esp+14h+var_4], ecx
0079AE98
0079AE98 loc_79AE98:                             ; CODE XREF: sub_79AE70+17â†‘j
0079AE98                 cmp     [esp+14h+var_4], edi
0079AE9C                 jbe     short loc_79AF05
0079AE9E                 mov     edi, edi
0079AEA0
0079AEA0 loc_79AEA0:                             ; CODE XREF: sub_79AE70+93â†“j
0079AEA0                 mov     ecx, [ebx+0C0h]
0079AEA6                 test    ecx, ecx
0079AEA8                 jz      short loc_79AEB9
0079AEAA                 mov     eax, [ebx+0C4h]
0079AEB0                 sub     eax, ecx
0079AEB2                 sar     eax, 2
0079AEB5                 cmp     edi, eax
0079AEB7                 jb      short loc_79AEBE
0079AEB9
0079AEB9 loc_79AEB9:                             ; CODE XREF: sub_79AE70+38â†‘j
0079AEB9                 call    __invalid_parameter_noinfo
0079AEBE
0079AEBE loc_79AEBE:                             ; CODE XREF: sub_79AE70+47â†‘j
0079AEBE                 mov     eax, [ebx+0C0h]
0079AEC4                 mov     ebp, [eax+edi*4]
0079AEC7                 mov     esi, [esp+14h+arg_0]
0079AECB                 lea     ecx, [ebp+4]
0079AECE                 call    sub_445210
0079AED3
0079AED3 loc_79AED3:                             ; CODE XREF: sub_79AE70+7Dâ†“j
0079AED3                 mov     cl, [eax]
0079AED5                 cmp     cl, [esi]
0079AED7                 jnz     short loc_79AEF3
0079AED9                 test    cl, cl
0079AEDB                 jz      short loc_79AEEF
0079AEDD                 mov     cl, [eax+1]
0079AEE0                 cmp     cl, [esi+1]
0079AEE3                 jnz     short loc_79AEF3
0079AEE5                 add     eax, 2
0079AEE8                 add     esi, 2
0079AEEB                 test    cl, cl
0079AEED                 jnz     short loc_79AED3
0079AEEF
0079AEEF loc_79AEEF:                             ; CODE XREF: sub_79AE70+6Bâ†‘j
0079AEEF                 xor     eax, eax
0079AEF1                 jmp     short loc_79AEF8
0079AEF3 ; ---------------------------------------------------------------------------
0079AEF3
0079AEF3 loc_79AEF3:                             ; CODE XREF: sub_79AE70+67â†‘j
0079AEF3                                         ; sub_79AE70+73â†‘j
0079AEF3                 sbb     eax, eax
0079AEF5                 sbb     eax, 0FFFFFFFFh
0079AEF8
0079AEF8 loc_79AEF8:                             ; CODE XREF: sub_79AE70+81â†‘j
0079AEF8                 test    eax, eax
0079AEFA                 jz      short loc_79AF0F
0079AEFC                 add     edi, 1
0079AEFF                 cmp     edi, [esp+14h+var_4]
0079AF03                 jb      short loc_79AEA0
0079AF05
0079AF05 loc_79AF05:                             ; CODE XREF: sub_79AE70+2Câ†‘j
0079AF05                 pop     edi
0079AF06                 pop     esi
0079AF07                 pop     ebp
0079AF08                 xor     eax, eax
0079AF0A                 pop     ebx
0079AF0B                 pop     ecx
0079AF0C                 retn    4
0079AF0F ; ---------------------------------------------------------------------------
0079AF0F
0079AF0F loc_79AF0F:                             ; CODE XREF: sub_79AE70+8Aâ†‘j
0079AF0F                 mov     eax, [ebp+58h]
0079AF12                 pop     edi
0079AF13                 pop     esi
0079AF14                 pop     ebp
0079AF15                 pop     ebx
0079AF16                 pop     ecx
0079AF17                 retn    4
0079AF17 sub_79AE70      endp
0079AF17
0079AF17 ; ---------------------------------------------------------------------------
0079AF1A                 align 10h
0079AF20
0079AF20 ; =============== S U B R O U T I N E =======================================
0079AF20
0079AF20
0079AF20 sub_79AF20      proc near               ; CODE XREF: sub_79B420+1Fâ†“p
0079AF20                                         ; sub_79B420+68â†“p
0079AF20
0079AF20 arg_0           = dword ptr  4
0079AF20
0079AF20                 push    ebx
0079AF21                 push    ebp
0079AF22                 push    esi
0079AF23                 push    edi
0079AF24                 mov     edi, ecx
0079AF26                 mov     eax, [edi+0C0h]
0079AF2C                 test    eax, eax
0079AF2E                 jnz     short loc_79AF34
0079AF30                 xor     ebx, ebx
0079AF32                 jmp     short loc_79AF3F
0079AF34 ; ---------------------------------------------------------------------------
0079AF34
0079AF34 loc_79AF34:                             ; CODE XREF: sub_79AF20+Eâ†‘j
0079AF34                 mov     ebx, [edi+0C4h]
0079AF3A                 sub     ebx, eax
0079AF3C                 sar     ebx, 2
0079AF3F
0079AF3F loc_79AF3F:                             ; CODE XREF: sub_79AF20+12â†‘j
0079AF3F                 xor     esi, esi
0079AF41                 test    ebx, ebx
0079AF43                 jbe     short loc_79AF83
0079AF45                 mov     ebp, [esp+10h+arg_0]
0079AF49                 lea     esp, [esp+0]
0079AF50
0079AF50 loc_79AF50:                             ; CODE XREF: sub_79AF20+61â†“j
0079AF50                 mov     ecx, [edi+0C0h]
0079AF56                 test    ecx, ecx
0079AF58                 jz      short loc_79AF69
0079AF5A                 mov     eax, [edi+0C4h]
0079AF60                 sub     eax, ecx
0079AF62                 sar     eax, 2
0079AF65                 cmp     esi, eax
0079AF67                 jb      short loc_79AF6E
0079AF69
0079AF69 loc_79AF69:                             ; CODE XREF: sub_79AF20+38â†‘j
0079AF69                 call    __invalid_parameter_noinfo
0079AF6E
0079AF6E loc_79AF6E:                             ; CODE XREF: sub_79AF20+47â†‘j
0079AF6E                 mov     eax, [edi+0C0h]
0079AF74                 mov     eax, [eax+esi*4]
0079AF77                 cmp     [eax+60h], ebp
0079AF7A                 jz      short loc_79AF8C
0079AF7C                 add     esi, 1
0079AF7F                 cmp     esi, ebx
0079AF81                 jb      short loc_79AF50
0079AF83
0079AF83 loc_79AF83:                             ; CODE XREF: sub_79AF20+23â†‘j
0079AF83                 pop     edi
0079AF84                 pop     esi
0079AF85                 pop     ebp
0079AF86                 xor     eax, eax
0079AF88                 pop     ebx
0079AF89                 retn    4
0079AF8C ; ---------------------------------------------------------------------------
0079AF8C
0079AF8C loc_79AF8C:                             ; CODE XREF: sub_79AF20+5Aâ†‘j
0079AF8C                 lea     ecx, [eax+4]
0079AF8F                 call    sub_445210
0079AF94                 pop     edi
0079AF95                 pop     esi
0079AF96                 pop     ebp
0079AF97                 pop     ebx
0079AF98                 retn    4
0079AF98 sub_79AF20      endp
0079AF98
0079AF98 ; ---------------------------------------------------------------------------
0079AF9B                 align 10h
0079AFA0
0079AFA0 ; =============== S U B R O U T I N E =======================================
0079AFA0
0079AFA0
0079AFA0 sub_79AFA0      proc near               ; CODE XREF: .text:0079B4CFâ†“p
0079AFA0                                         ; .text:0079B518â†“p
0079AFA0
0079AFA0 var_4           = dword ptr -4
0079AFA0 arg_0           = dword ptr  4
0079AFA0
0079AFA0                 push    ecx
0079AFA1                 push    ebx
0079AFA2                 push    ebp
0079AFA3                 push    esi
0079AFA4                 mov     ebx, ecx
0079AFA6                 mov     eax, [ebx+0C0h]
0079AFAC                 push    edi
0079AFAD                 xor     edi, edi
0079AFAF                 cmp     eax, edi
0079AFB1                 jnz     short loc_79AFB9
0079AFB3                 mov     [esp+14h+var_4], edi
0079AFB7                 jmp     short loc_79AFC8
0079AFB9 ; ---------------------------------------------------------------------------
0079AFB9
0079AFB9 loc_79AFB9:                             ; CODE XREF: sub_79AFA0+11â†‘j
0079AFB9                 mov     ecx, [ebx+0C4h]
0079AFBF                 sub     ecx, eax
0079AFC1                 sar     ecx, 2
0079AFC4                 mov     [esp+14h+var_4], ecx
0079AFC8
0079AFC8 loc_79AFC8:                             ; CODE XREF: sub_79AFA0+17â†‘j
0079AFC8                 cmp     [esp+14h+var_4], edi
0079AFCC                 jbe     short loc_79B035
0079AFCE                 mov     edi, edi
0079AFD0
0079AFD0 loc_79AFD0:                             ; CODE XREF: sub_79AFA0+93â†“j
0079AFD0                 mov     ecx, [ebx+0C0h]
0079AFD6                 test    ecx, ecx
0079AFD8                 jz      short loc_79AFE9
0079AFDA                 mov     eax, [ebx+0C4h]
0079AFE0                 sub     eax, ecx
0079AFE2                 sar     eax, 2
0079AFE5                 cmp     edi, eax
0079AFE7                 jb      short loc_79AFEE
0079AFE9
0079AFE9 loc_79AFE9:                             ; CODE XREF: sub_79AFA0+38â†‘j
0079AFE9                 call    __invalid_parameter_noinfo
0079AFEE
0079AFEE loc_79AFEE:                             ; CODE XREF: sub_79AFA0+47â†‘j
0079AFEE                 mov     eax, [ebx+0C0h]
0079AFF4                 mov     ebp, [eax+edi*4]
0079AFF7                 mov     esi, [esp+14h+arg_0]
0079AFFB                 lea     ecx, [ebp+4]
0079AFFE                 call    sub_445210
00844001                 fstp    [esp+8+var_8]
00844004                 call    edx
00844006                 mov     eax, [esi]
00844008                 mov     edx, [eax+0C8h]
0084400E                 mov     ecx, esi
00844010                 call    edx
00844012                 test    eax, eax
00844014                 pop     esi
00844015                 jz      short locret_844031
00844017                 mov     edx, [eax]
00844019                 mov     ecx, eax
0084401B                 mov     eax, [edx+6Ch]
0084401E                 call    eax
00844020                 mov     eax, [eax]
00844022                 test    eax, eax
00844024                 jz      short locret_844031
00844026                 movss   xmm0, [esp+arg_4]
0084402C                 movss   dword ptr [eax+10h], xmm0
00844031
00844031 locret_844031:                          ; CODE XREF: sub_843FF0+25â†‘j
00844031                                         ; sub_843FF0+34â†‘j
00844031                 retn    8
00844031 sub_843FF0      endp
00844031
00844031 ; ---------------------------------------------------------------------------
00844034                 align 10h
00844040
00844040 ; =============== S U B R O U T I N E =======================================
00844040
00844040
00844040 sub_844040      proc near
00844040
00844040 arg_0           = dword ptr  4
00844040
00844040                 mov     eax, [esp+arg_0]
00844044                 shl     eax, 5
00844047                 xor     eax, [ecx+0Ch]
0084404A                 and     eax, 0E0h
0084404F                 xor     [ecx+0Ch], eax
00844052                 retn    4
00844052 sub_844040      endp
00844052
00844052 ; ---------------------------------------------------------------------------
00844055                 align 10h
00844060
00844060 ; =============== S U B R O U T I N E =======================================
00844060
00844060
00844060 sub_844060      proc near               ; DATA XREF: .rdata:0103E418â†“o
00844060                 mov     dword ptr [ecx-4], 3
00844067                 mov     dword ptr [ecx+8], 0
0084406E                 retn    4
0084406E sub_844060      endp
0084406E
0084406E ; ---------------------------------------------------------------------------
00844071                 align 10h
00844080 ; [00000001 BYTES: COLLAPSED FUNCTION nullsub_595. PRESS CTRL-NUMPAD+ TO EXPAND]
00844081                 align 10h
00844090 ; [00000001 BYTES: COLLAPSED FUNCTION nullsub_596. PRESS CTRL-NUMPAD+ TO EXPAND]
00844091                 align 10h
008440A0
008440A0 ; =============== S U B R O U T I N E =======================================
008440A0
008440A0
008440A0 sub_8440A0      proc near               ; CODE XREF: sub_845E80+82â†“p
008440A0
008440A0 var_C           = dword ptr -0Ch
008440A0 var_8           = dword ptr -8
008440A0 var_4           = dword ptr -4
008440A0 arg_0           = dword ptr  4
008440A0
008440A0                 sub     esp, 0Ch
008440A3                 lea     eax, [esp+0Ch+var_4]
008440A7                 push    eax
008440A8                 mov     eax, [esp+10h+arg_0]
008440AC                 lea     ecx, [esp+10h+var_8]
008440B0                 push    ecx
008440B1                 mov     ecx, [eax+10h]
008440B4                 lea     edx, [esp+14h+var_C]
008440B8                 push    edx
008440B9                 push    ecx
008440BA                 mov     [esp+1Ch+var_C], 0
008440C2                 mov     [esp+1Ch+var_8], 0
008440CA                 mov     [esp+1Ch+var_4], 0
008440D2                 call    sub_798370
008440D7                 add     esp, 10h
008440DA                 cmp     [esp+0Ch+var_C], 7Fh
008440DE                 jnz     short loc_8440FB
008440E0                 cmp     [esp+0Ch+var_8], 0
008440E5                 jnz     short loc_8440FB
008440E7                 mov     edx, [esp+0Ch+var_4]
008440EB                 add     edx, 0FFFFFF9Ch
008440EE                 cmp     edx, 63h ; 'c'
008440F1                 ja      short loc_8440FB
008440F3                 mov     al, 1
008440F5                 add     esp, 0Ch
008440F8                 retn    4
008440FB ; ---------------------------------------------------------------------------
008440FB
008440FB loc_8440FB:                             ; CODE XREF: sub_8440A0+3Eâ†‘j
008440FB                                         ; sub_8440A0+45â†‘j ...
008440FB                 xor     al, al
008440FD                 add     esp, 0Ch
00844100                 retn    4
00844100 sub_8440A0      endp
00844100
00844100 ; ---------------------------------------------------------------------------
00844103                 align 10h
00844110
00844110 ; =============== S U B R O U T I N E =======================================
00844110
00844110
00844110 sub_844110      proc near               ; CODE XREF: .text:0065D726â†‘j
00844110                                         ; sub_65EDC0+24â†‘p
00844110
00844110 arg_0           = dword ptr  4
00844110
00844110                 cvtsi2ss xmm0, [esp+arg_0]
00844116                 movss   dword ptr [ecx+22Ch], xmm0
0084411E                 retn    4
0084411E sub_844110      endp
0084411E
0084411E ; ---------------------------------------------------------------------------
00844121                 align 10h
00844130
00844130 ; =============== S U B R O U T I N E =======================================
00844130
00844130
00844130 sub_844130      proc near               ; CODE XREF: sub_7ADEB0+5Câ†‘p
00844130                                         ; sub_7C21B0+6B8â†‘p
00844130                 movss   xmm0, dword ptr [ecx+22Ch]
00844138                 comiss  xmm0, ds:SrcStr
0084413F                 jbe     short loc_844147
00844141                 mov     eax, 1
00844146                 retn
00844147 ; ---------------------------------------------------------------------------
00844147
00844147 loc_844147:                             ; CODE XREF: sub_844130+Fâ†‘j
00844147                 xor     eax, eax
00844149                 retn
00844149 sub_844130      endp
00844149
00844149 ; ---------------------------------------------------------------------------
0084414A                 align 10h
00844150
00844150 ; =============== S U B R O U T I N E =======================================
00844150
00844150
00844150 sub_844150      proc near               ; DATA XREF: .rdata:0103E434â†“o
00844150                 push    esi
00844151                 mov     esi, ecx
00844153                 test    byte ptr [esi+0Ch], 2
00844157                 jz      short loc_84417B
00844159                 mov     ecx, [esi+18h]
0084415C                 add     ecx, 590h
00844162                 call    sub_7A3A10
00844167                 test    al, al
00844169                 jnz     short loc_8441A4
0084416B                 mov     ecx, [esi+10h]
0084416E                 mov     eax, [ecx]
00844170                 mov     edx, [eax+2Ch]
00844173                 call    edx
00844175                 and     dword ptr [esi+0Ch], 0FFFFFFFDh
00844179                 pop     esi
0084417A                 retn
0084417B ; ---------------------------------------------------------------------------
0084417B
0084417B loc_84417B:                             ; CODE XREF: sub_844150+7â†‘j
0084417B                 mov     eax, [esi+18h]
0084417E                 mov     ecx, [eax+12F0h]
00844184                 test    ecx, ecx
00844186                 jz      short loc_844197
00844188                 mov     edx, [ecx]
0084418A                 mov     eax, [esi+10h]
0084418D                 mov     edx, [edx+18h]
00844190                 push    eax
00844191                 call    edx
00844193                 test    al, al
00844195                 jnz     short loc_8441A4
00844197
00844197 loc_844197:                             ; CODE XREF: sub_844150+36â†‘j
00844197                 test    byte ptr [esi+0Ch], 1
0084419B                 jz      short loc_8441A4
0084419D                 mov     dword ptr [esi+4], 2
008441A4
008441A4 loc_8441A4:                             ; CODE XREF: sub_844150+19â†‘j
008441A4                                         ; sub_844150+45â†‘j ...
008441A4                 pop     esi
008441A5                 retn
008441A5 sub_844150      endp
008441A5
008441A5 ; ---------------------------------------------------------------------------
008441A6                 align 10h
008441B0
008441B0 ; =============== S U B R O U T I N E =======================================
008441B0
008441B0
008441B0 sub_8441B0      proc near               ; DATA XREF: .rdata:0103E438â†“o
008441B0                 push    esi
008441B1                 mov     esi, ecx
008441B3                 mov     eax, [esi+10h]
008441B6                 test    eax, eax
008441B8                 jz      short loc_8441F4
008441BA                 mov     ecx, [esi+18h]
008441BD                 mov     ecx, [ecx+12F0h]
008441C3                 test    ecx, ecx
008441C5                 jz      short loc_8441F4
008441C7                 mov     edx, [ecx]
008441C9                 push    eax
008441CA                 mov     eax, [edx+18h]
008441CD                 call    eax
008441CF                 test    al, al
008441D1                 jz      short loc_8441F4
008441D3                 mov     ecx, [esi+10h]
008441D6                 mov     edx, [ecx]
008441D8                 mov     eax, [edx+34h]
008441DB                 call    eax
008441DD                 mov     ecx, [esi+14h]
008441E0                 mov     edx, [ecx]
008441E2                 mov     eax, [edx+4Ch]
008441E5                 call    eax
008441E7                 mov     ecx, [esi+18h]
008441EA                 push    eax
008441EB                 call    sub_65A960
008441F0                 or      dword ptr [esi+0Ch], 18h
008441F4
008441F4 loc_8441F4:                             ; CODE XREF: sub_8441B0+8â†‘j
008441F4                                         ; sub_8441B0+15â†‘j ...
008441F4                 pop     esi
008441F5                 retn
008441F5 sub_8441B0      endp
008441F5
008441F5 ; ---------------------------------------------------------------------------
008441F6                 align 10h
00844200
00844200 ; =============== S U B R O U T I N E =======================================
00844200
00844200
00844200 sub_844200      proc near               ; DATA XREF: .rdata:0103E43Câ†“o
00844200                 push    esi
00844201                 mov     esi, ecx
00844203                 mov     eax, [esi+10h]
00844206                 test    eax, eax
00844208                 jz      short loc_84422A
0084420A                 mov     ecx, [esi+18h]
0084420D                 mov     ecx, [ecx+12F0h]
00844213                 test    ecx, ecx
00844215                 jz      short loc_844223
00844217                 mov     edx, [ecx]
00844219                 push    eax
0084421A                 mov     eax, [edx+18h]
0084421D                 call    eax
0084421F                 test    al, al
00844221                 jnz     short loc_844248
00844223
00844223 loc_844223:                             ; CODE XREF: sub_844200+15â†‘j
00844223                 mov     dword ptr [esi+10h], 0
0084422A
0084422A loc_84422A:                             ; CODE XREF: sub_844200+8â†‘j
0084422A                 mov     eax, [esi+0Ch]
0084422D                 mov     ecx, eax
0084422F                 shr     ecx, 3
00844232                 test    cl, 3
00844235                 jz      short loc_84424C
00844237                 lea     ecx, ds:0FFFFFFF8h[ecx*8]
0084423E                 xor     ecx, eax
00844240                 and     ecx, 18h
00844243                 xor     ecx, eax
00844245                 mov     [esi+0Ch], ecx
00844248
00844248 loc_844248:                             ; CODE XREF: sub_844200+21â†‘j
00844248                 xor     al, al
0084424A                 pop     esi
0084424B                 retn
0084424C ; ---------------------------------------------------------------------------
0084424C
0084424C loc_84424C:                             ; CODE XREF: sub_844200+35â†‘j
0084424C                 mov     al, 1
0084424E                 pop     esi
0084424F                 retn
0084424F sub_844200      endp
0084424F
00844250
00844250 ; =============== S U B R O U T I N E =======================================
00844250
00844250
00844250 sub_844250      proc near               ; CODE XREF: sub_844660+104â†“p
00844250
00844250 arg_0           = dword ptr  4
00844250 arg_4           = dword ptr  8
00844250 arg_8           = dword ptr  0Ch
00844250 arg_C           = dword ptr  10h
00844250 arg_10          = dword ptr  14h
00844250
00844250                 push    esi
00844251                 mov     esi, ecx
00844253                 mov     eax, [esi+18h]
00844256                 mov     ecx, [eax+12F0h]
0084425C                 test    ecx, ecx
0084425E                 push    edi
0084425F                 jz      short loc_8442B2
00844261                 mov     edx, [esp+8+arg_10]
00844265                 mov     eax, [esp+8+arg_C]
00844269                 push    edx
0084426A                 mov     edx, [esp+0Ch+arg_8]
0084426E                 push    eax
0084426F                 mov     eax, [esp+10h+arg_4]
00844273                 push    edx
00844274                 mov     edx, [esp+14h+arg_0]
00844278                 push    eax
00844279                 push    edx
0084427A                 call    sub_80E070
0084427F                 mov     edi, eax
00844281                 test    edi, edi
00844283                 jz      short loc_8442B2
00844285                 mov     eax, [esi+0Ch]
00844288                 shr     eax, 5
0084428B                 and     eax, 7
0084428E                 push    eax
0084428F                 push    edi
00844290                 mov     ecx, esi
00844292                 call    sub_843F40
00844297                 mov     [esi+10h], edi
0084429A                 mov     edx, [edi]
0084429C                 mov     edx, [edx+0ECh]
008442A2                 lea     eax, [esi+8]
008442A5                 push    eax
008442A6                 mov     ecx, edi
008442A8                 call    edx
008442AA                 mov     eax, [esi+10h]
008442AD                 pop     edi
008442AE                 pop     esi
008442AF                 retn    14h
008442B2 ; ---------------------------------------------------------------------------
008442B2
008442B2 loc_8442B2:                             ; CODE XREF: sub_844250+Fâ†‘j
008442B2                                         ; sub_844250+33â†‘j
008442B2                 pop     edi
008442B3                 xor     eax, eax
008442B5                 pop     esi
008442B6                 retn    14h
008442B6 sub_844250      endp
008442B6
008442B6 ; ---------------------------------------------------------------------------
008442B9                 align 10h
008442C0                 push    esi
008442C1                 mov     esi, ecx
008442C3                 mov     ecx, [esi+14h]
008442C6                 mov     eax, [ecx]
008442C8                 mov     edx, [eax+4Ch]
008442CB                 call    edx
008442CD                 mov     eax, [eax+10h]
008442D0                 cmp     eax, [esp+8]
008442D4                 jnz     short loc_8442F8
008442D6                 mov     ecx, [esi+18h]
008442D9                 mov     ecx, [ecx+12F0h]
008442DF                 test    ecx, ecx
008442E1                 jz      short loc_8442F8
008442E3                 mov     edx, [ecx]
008442E5                 mov     eax, [esi+10h]
008442E8                 mov     edx, [edx+18h]
008442EB                 push    eax
008442EC                 call    edx
008442EE                 test    al, al
008442F0                 jz      short loc_8442F8
008442F2                 mov     al, 1
008442F4                 pop     esi
008442F5                 retn    4
008442F8 ; ---------------------------------------------------------------------------
008442F8
008442F8 loc_8442F8:                             ; CODE XREF: .text:008442D4â†‘j
008442F8                                         ; .text:008442E1â†‘j ...
008442F8                 xor     al, al
008442FA                 pop     esi
008442FB                 retn    4
008442FB ; ---------------------------------------------------------------------------
008442FE                 align 10h
00844300                 mov     eax, [esp+4]
00844304                 lea     eax, [eax+eax*4+5]
00844308                 xor     edx, edx
0084430A                 cmp     [ecx+eax*4], edx
0084430D                 setz    dl
00844310                 mov     al, dl
00844312                 retn    4
00844312 ; ---------------------------------------------------------------------------
00844315                 align 10h
00844320
00844320 ; =============== S U B R O U T I N E =======================================
00844320
00844320
00844320 sub_844320      proc near               ; CODE XREF: .text:0065AF8Dâ†‘j
00844320                                         ; .text:0065B048â†‘p ...
00844320
00844320 arg_0           = dword ptr  4
00844320
00844320                 mov     eax, [esp+arg_0]
00844324                 lea     eax, [eax+eax*4+5]
00844328                 mov     eax, [ecx+eax*4]
0084432B                 retn    4
0084432B sub_844320      endp
0084432B
0084432B ; ---------------------------------------------------------------------------
0084432E                 align 10h
00844330
00844330 ; =============== S U B R O U T I N E =======================================
00844330
00844330 ; Attributes: bp-based frame fuzzy-sp
00844330
00844330 sub_844330      proc near               ; DATA XREF: .rdata:0103E448â†“o
00844330
00844330 var_50          = dword ptr -50h
00844330 var_38          = dword ptr -38h
00844330 var_34          = dword ptr -34h
00844330 var_30          = dword ptr -30h
00844330 var_2C          = dword ptr -2Ch
00844330 var_28          = dword ptr -28h
00844330 var_24          = dword ptr -24h
00844330 var_20          = byte ptr -20h
00844330 var_11          = byte ptr -11h
00844330 var_C           = dword ptr -0Ch
00844330 var_4           = dword ptr -4
00844330 arg_0           = dword ptr  8
00844330 arg_4           = dword ptr  0Ch
00844330 arg_8           = dword ptr  10h
00844330 arg_C           = dword ptr  14h
00844330
00844330 ; FUNCTION CHUNK AT 00EB481A SIZE 0000002B BYTES
00844330
00844330 ; __unwind { // SEH_844330
00844330                 push    ebp
00844331                 mov     ebp, esp
00844333                 and     esp, 0FFFFFFF8h
00844336                 push    0FFFFFFFFh
00844338                 push    offset SEH_844330
0084433D                 mov     eax, large fs:0
00844343                 push    eax
00844344                 sub     esp, 30h
00844347                 push    ebx
00844348                 push    esi
00844349                 push    edi
0084434A                 mov     eax, dword_12EA8B0
0084434F                 xor     eax, esp
00844351                 push    eax
00844352                 lea     eax, [esp+4Ch+var_C]
00844356                 mov     large fs:0, eax
0084435C                 mov     esi, ecx
0084435E                 mov     [esp+4Ch+var_38], esi
00844362                 mov     ecx, [esi+18h]
00844365                 or      dword ptr [esi+0Ch], 1
00844369                 call    sub_65DF20
0084436E                 test    al, al
00844370                 jnz     loc_84461E
00844376                 mov     ecx, [esi+14h]
00844379                 add     ecx, 224h
0084437F                 mov     [esp+4Ch+var_28], offset aMain ; "main"
00844387                 call    sub_445210
0084438C                 mov     [esp+4Ch+var_24], eax
00844390                 xor     eax, eax
00844392                 mov     [esp+4Ch+var_30], eax
00844396
00844396 loc_844396:                             ; CODE XREF: sub_844330+127â†“j
00844396                 cmp     [ebp+arg_4], 0
0084439A                 mov     ebx, [esp+eax*4+4Ch+var_28]
0084439E                 mov     [esp+4Ch+var_34], 0
008443A6                 jle     loc_84444D
008443AC                 lea     esp, [esp+0]
008443B0
008443B0 loc_8443B0:                             ; CODE XREF: sub_844330+10Fâ†“j
008443B0                 mov     eax, ebx
008443B2                 mov     esi, ebx
008443B4                 lea     ecx, [esp+4Ch+var_20]
008443B8                 lea     edi, [eax+1]
008443BB                 jmp     short loc_8443C0
008443BB ; ---------------------------------------------------------------------------
008443BD                 align 10h
008443C0
008443C0 loc_8443C0:                             ; CODE XREF: sub_844330+8Bâ†‘j
008443C0                                         ; sub_844330+97â†“j
008443C0                 mov     dl, [eax]
008443C2                 add     eax, 1
008443C5                 test    dl, dl
008443C7                 jnz     short loc_8443C0
008443C9                 sub     eax, edi
008443CB                 cmp     eax, 0Fh
008443CE                 jbe     short loc_8443E4
008443D0                 mov     eax, ebx
008443D2                 lea     esi, [eax+1]
008443D5
008443D5 loc_8443D5:                             ; CODE XREF: sub_844330+ACâ†“j
008443D5                 mov     dl, [eax]
008443D7                 add     eax, 1
008443DA                 test    dl, dl
008443DC                 jnz     short loc_8443D5
008443DE                 sub     eax, esi
008443E0                 lea     esi, [eax+ebx-0Fh]
008443E4
008443E4 loc_8443E4:                             ; CODE XREF: sub_844330+9Eâ†‘j
008443E4                 mov     edx, 10h
008443E9                 lea     esp, [esp+0]
008443F0
008443F0 loc_8443F0:                             ; CODE XREF: sub_844330+D8â†“j
008443F0                 mov     al, [esi]
008443F2                 test    al, al
008443F4                 jnz     short loc_8443FD
008443F6                 mov     [ecx], al
008443F8                 add     ecx, 1
008443FB                 jmp     short loc_844405
008443FD ; ---------------------------------------------------------------------------
008443FD
008443FD loc_8443FD:                             ; CODE XREF: sub_844330+C4â†‘j
008443FD                 mov     [ecx], al
008443FF                 add     ecx, 1
00844402                 add     esi, 1
00844405
00844405 loc_844405:                             ; CODE XREF: sub_844330+CBâ†‘j
00844405                 sub     edx, 1
00844408                 jnz     short loc_8443F0
0084440A                 mov     esi, [esp+4Ch+var_34]
0084440E                 push    1
00844410                 lea     eax, [esp+50h+var_20]
00844414                 mov     [esp+50h+var_11], dl
00844418                 mov     edx, [ebp+arg_0]
0084441B                 push    eax
0084441C                 lea     ecx, [esp+54h+var_2C]
00844420                 push    ecx
00844421                 mov     ecx, [edx+esi*4]
00844424                 mov     [esp+58h+var_2C], (offset loc_73635F+3)
0084442C                 call    sub_A3DEE0
00844431                 test    eax, eax
00844433                 jnz     short loc_844462
00844435                 add     esi, 1
00844438                 cmp     esi, [ebp+arg_4]
0084443B                 mov     [esp+4Ch+var_34], esi
0084443F                 jl      loc_8443B0
00844445                 mov     eax, [esp+4Ch+var_30]
00844449                 mov     esi, [esp+4Ch+var_38]
0084444D
0084444D loc_84444D:                             ; CODE XREF: sub_844330+76â†‘j
0084444D                 add     eax, 1
00844450                 cmp     eax, 2
00844453                 mov     [esp+4Ch+var_30], eax
00844457                 jb      loc_844396
0084445D                 jmp     loc_84461E
00844462 ; ---------------------------------------------------------------------------
00844462
00844462 loc_844462:                             ; CODE XREF: sub_844330+103â†‘j
00844462                 mov     ecx, [esp+4Ch+var_38]
00844466                 mov     ecx, [ecx+18h]
00844469                 mov     edx, [ecx+0DCh]
0084446F                 mov     ecx, [ecx+12F0h]
00844475                 test    ecx, ecx
00844477                 jz      loc_84461A
0084447D                 mov     edi, [ebp+arg_C]
00844480                 push    0
00844482                 push    edi
00844483                 push    eax
00844484                 mov     eax, [ebp+arg_8]
00844487                 push    eax
00844488                 push    edx
00844489                 call    sub_80E070
0084448E                 mov     esi, eax
00844490                 test    esi, esi
00844492                 jz      loc_84461A
00844498                 mov     ebx, [esp+4Ch+var_38]
0084449C                 mov     ecx, [ebx+0Ch]
0084449F                 shr     ecx, 5
008444A2                 and     ecx, 7
008444A5                 push    ecx
008444A6                 push    esi
008444A7                 mov     ecx, ebx
008444A9                 call    sub_843F40
008444AE                 mov     [ebx+10h], esi
008444B1                 mov     edx, [esi]
008444B3                 mov     edx, [edx+0ECh]
008444B9                 lea     eax, [ebx+8]
008444BC                 push    eax
008444BD                 mov     ecx, esi
008444BF                 call    edx
008444C1                 mov     esi, [ebx+10h]
008444C4                 test    esi, esi
008444C6                 jz      loc_84461A
008444CC                 mov     ecx, ebx
008444CE                 mov     eax, [ecx+0Ch]
008444D1                 shr     eax, 5
008444D4                 and     eax, 7
008444D7                 push    eax
008444D8                 push    esi
008444D9                 call    sub_843F40
008444DE                 push    edi
008444DF                 lea     ecx, [esp+50h+var_2C]
008444E3                 call    unknown_libname_15 ; Microsoft VisualC 2-14/net runtime
008444E8                 mov     [esp+4Ch+var_4], 0
008444F0                 mov     ecx, eax
008444F2                 call    sub_7A0FC0
008444F7                 mov     ebx, eax
008444F9                 mov     [esp+4Ch+var_4], 0FFFFFFFFh
00844501                 lea     ecx, [esp+4Ch+var_2C]
00844505                 call    nullsub_26
0084450A                 lea     eax, [ebx-1]    ; switch 20 cases
0084450D                 cmp     eax, 13h
00844510                 ja      def_84451D      ; jumptable 0084451D default case, cases 2,3,5-15,17,19
00844516                 movzx   ecx, ds:byte_84464C[eax]
0084451D                 jmp     ds:jpt_84451D[ecx*4] ; switch jump
00844524 ; ---------------------------------------------------------------------------
00844524
00844524 loc_844524:                             ; CODE XREF: sub_844330+1EDâ†‘j
00844524                                         ; DATA XREF: .text:jpt_84451Dâ†“o
00844524                 mov     ebx, [esp+4Ch+var_38] ; jumptable 0084451D cases 1,18
00844528                 mov     eax, [ebx+18h]
0084452B                 mov     ecx, [eax+114h]
00844531                 push    edi
00844532                 push    eax
00844533                 call    sub_60B5D0
00844538                 jmp     loc_8445D2
0084453D ; ---------------------------------------------------------------------------
0084453D
0084453D loc_84453D:                             ; CODE XREF: sub_844330+1EDâ†‘j
0084453D                                         ; DATA XREF: .text:jpt_84451Dâ†“o
0084453D                 mov     edx, [esi]      ; jumptable 0084451D cases 16,20
0084453F                 fld     ds:flt_103E460
00844545                 mov     eax, [edx+60h]
00844548                 push    ecx
00844549                 mov     ecx, esi
0084454B                 fstp    [esp+50h+var_50]
0084454E                 call    eax
00844550                 mov     edx, [esi]
00844552                 mov     eax, [edx+0C8h]
00844558                 mov     ecx, esi
0084455A                 call    eax
0084455C                 test    eax, eax
0084455E                 jz      short def_84451D ; jumptable 0084451D default case, cases 2,3,5-15,17,19
00844560                 mov     edx, [eax]
00844562                 mov     ecx, eax
00844564                 mov     eax, [edx+6Ch]
00844567                 call    eax
00844569                 mov     eax, [eax]
0084456B                 test    eax, eax
0084456D                 jz      short def_84451D ; jumptable 0084451D default case, cases 2,3,5-15,17,19
0084456F                 movss   xmm0, ds:flt_103E460
00844577                 movss   dword ptr [eax+10h], xmm0
0084457C                 jmp     short def_84451D ; jumptable 0084451D default case, cases 2,3,5-15,17,19
0084457E ; ---------------------------------------------------------------------------
0084457E
0084457E loc_84457E:                             ; CODE XREF: sub_844330+1EDâ†‘j
0084457E                                         ; DATA XREF: .text:jpt_84451Dâ†“o
0084457E                 push    edi             ; jumptable 0084451D case 4
0084457F                 lea     ecx, [esp+50h+var_30]
00844583                 call    unknown_libname_15 ; Microsoft VisualC 2-14/net runtime
00844588                 mov     [esp+4Ch+var_4], 1
00844590                 mov     ecx, eax
00844592                 call    sub_7A0FB0
00844597                 mov     edi, eax
00844599                 mov     [esp+4Ch+var_4], 0FFFFFFFFh
008445A1                 lea     ecx, [esp+4Ch+var_30]
008445A5                 call    nullsub_26
008445AA                 cmp     edi, 0FA0h
008445B0                 jb      short def_84451D ; jumptable 0084451D default case, cases 2,3,5-15,17,19
008445B2                 cmp     edi, 0FA2h
008445B8                 ja      short def_84451D ; jumptable 0084451D default case, cases 2,3,5-15,17,19
008445BA                 fld     ds:flt_103E460
008445C0                 push    ecx
008445C1                 mov     ecx, [esp+50h+var_38]
008445C5                 fstp    [esp+50h+var_50] ; float
008445C8                 push    esi             ; int
008445C9                 call    sub_843FF0
008445CE
008445CE def_84451D:                             ; CODE XREF: sub_844330+1E0â†‘j
008445CE                                         ; sub_844330+1EDâ†‘j ...
008445CE                 mov     ebx, [esp+4Ch+var_38] ; jumptable 0084451D default case, cases 2,3,5-15,17,19
008445D2
008445D2 loc_8445D2:                             ; CODE XREF: sub_844330+208â†‘j
008445D2                 mov     eax, [ebx+0Ch]
008445D5                 test    al, 4
008445D7                 jz      short loc_8445F6
008445D9                 or      eax, 2
008445DC                 mov     [ebx+0Ch], eax
008445DF                 mov     al, 1
008445E1                 mov     ecx, [esp+4Ch+var_C]
008445E5                 mov     large fs:0, ecx
008445EC                 pop     ecx
008445ED                 pop     edi
008445EE                 pop     esi
008445EF                 pop     ebx
008445F0                 mov     esp, ebp
008445F2                 pop     ebp
008445F3                 retn    10h
008445F6 ; ---------------------------------------------------------------------------
008445F6
008445F6 loc_8445F6:                             ; CODE XREF: sub_844330+2A7â†‘j
008445F6                 mov     edx, [esi]
008445F8                 mov     eax, [edx+2Ch]
008445FB                 mov     ecx, esi
008445FD                 call    eax
008445FF                 and     dword ptr [ebx+0Ch], 0FFFFFFFDh
00844603                 mov     al, 1
00844605                 mov     ecx, [esp+4Ch+var_C]
00844609                 mov     large fs:0, ecx
00844610                 pop     ecx
00844611                 pop     edi
00844612                 pop     esi
00844613                 pop     ebx
00844614                 mov     esp, ebp
00844616                 pop     ebp
00844617                 retn    10h
0084461A ; ---------------------------------------------------------------------------
0084461A
0084461A loc_84461A:                             ; CODE XREF: sub_844330+147â†‘j
0084461A                                         ; sub_844330+162â†‘j ...
0084461A                 mov     esi, [esp+4Ch+var_38]
0084461E
0084461E loc_84461E:                             ; CODE XREF: sub_844330+40â†‘j
0084461E                                         ; sub_844330+12Dâ†‘j
0084461E                 mov     dword ptr [esi+4], 2
00844625                 xor     al, al
00844627                 mov     ecx, [esp+4Ch+var_C]
0084462B                 mov     large fs:0, ecx
00844632                 pop     ecx
00844633                 pop     edi
00844634                 pop     esi
00844635                 pop     ebx
00844636                 mov     esp, ebp
00844638                 pop     ebp
00844639                 retn    10h
00844639 ; } // starts at 844330
00844639 sub_844330      endp
00844639
00844639 ; ---------------------------------------------------------------------------
0084463C jpt_84451D      dd offset loc_844524    ; DATA XREF: sub_844330+1EDâ†‘r
00844640                 dd offset loc_84457E    ; jump table for switch statement
00844644                 dd offset loc_84453D
00844648                 dd offset def_84451D
0084464C byte_84464C     db      0,     3,     3,     1
0084464C                                         ; DATA XREF: sub_844330+1E6â†‘r
00844650                 db      3,     3,     3,     3 ; indirect table for switch statement
00844654                 db      3,     3,     3,     3
00844658                 db      3,     3,     3,     2
0084465C                 db      3,     0,     3,     2
00844660
00844660 ; =============== S U B R O U T I N E =======================================
00844660
00844660 ; Attributes: bp-based frame fuzzy-sp
00844660
00844660 sub_844660      proc near               ; DATA XREF: .rdata:0103E444â†“o
00844660
00844660 var_78          = dword ptr -78h
00844660 var_64          = dword ptr -64h
00844660 var_60          = dword ptr -60h
00844660 var_5C          = byte ptr -5Ch
00844660 var_58          = byte ptr -58h
00844660 var_44          = qword ptr -44h
00844660 var_3C          = word ptr -3Ch
00844660 var_3A          = byte ptr -3Ah
00844660 var_38          = qword ptr -38h
00844660 var_30          = word ptr -30h
00844660 var_2E          = byte ptr -2Eh
00844660 var_2C          = qword ptr -2Ch
00844660 var_24          = word ptr -24h
00844660 var_22          = byte ptr -22h
00844660 var_20          = qword ptr -20h
00844660 var_18          = word ptr -18h
00844660 var_16          = byte ptr -16h
00844660 var_14          = dword ptr -14h
00844660 var_C           = dword ptr -0Ch
00844660 var_4           = dword ptr -4
00844660 arg_0           = dword ptr  8
00844660 arg_4           = dword ptr  0Ch
00844660
00844660 ; FUNCTION CHUNK AT 00EB4845 SIZE 00000038 BYTES
00844660
00844660 ; __unwind { // SEH_844660
00844660                 push    ebp
00844661                 mov     ebp, esp
00844663                 and     esp, 0FFFFFFF8h
00844666                 push    0FFFFFFFFh
00844668                 push    offset SEH_844660
0084466D                 mov     eax, large fs:0
00844673                 push    eax
00844674                 sub     esp, 58h
00844677                 mov     eax, dword_12EA8B0
0084467C                 xor     eax, esp
0084467E                 mov     [esp+64h+var_14], eax
00844682                 push    ebx
00844683                 push    esi
00844684                 push    edi
00844685                 mov     eax, dword_12EA8B0
0084468A                 xor     eax, esp
0084468C                 push    eax
0084468D                 lea     eax, [esp+74h+var_C]
00844691                 mov     large fs:0, eax
00844697                 mov     edi, [ebp+arg_4]
0084469A                 mov     esi, [ebp+arg_0]
0084469D                 mov     ebx, ecx
0084469F                 mov     ecx, [ebx+18h]
008446A2                 or      dword ptr [ebx+0Ch], 1
008446A6                 mov     [esp+74h+var_60], edi
008446AA                 call    sub_65DF20
008446AF                 test    al, al
008446B1                 jnz     loc_844901
008446B7                 test    esi, esi
008446B9                 jz      loc_844901
008446BF                 cmp     byte ptr [esi], 40h ; '@'
008446C2                 jnz     short loc_84471F
008446C4                 movsx   eax, byte ptr [esi+1]
008446C8                 sub     eax, 30h ; '0'
008446CB                 sub     eax, 0
008446CE                 jz      loc_844851
008446D4                 sub     eax, 1
008446D7                 jz      loc_8447D1
008446DD                 sub     eax, 1
008446E0                 jnz     short loc_84471F
008446E2                 mov     cl, ds:byte_103DBCA
008446E8                 mov     ax, ds:word_103DBC8
008446EE                 movq    xmm0, ds:qword_103DBC0
008446F6                 push    0
008446F8                 push    1
008446FA                 mov     [esp+7Ch+var_3A], cl
008446FE                 mov     ecx, [ebx+18h]
00844701                 lea     edx, [esp+7Ch+var_44]
00844705                 push    1
00844707                 movq    [esp+80h+var_44], xmm0
0084470D                 mov     [esp+80h+var_3C], ax
00844712                 mov     [esp+80h+var_64], edx
00844716                 call    sub_65BF60
0084471B
0084471B loc_84471B:                             ; CODE XREF: sub_844660+1E0â†“j
0084471B                 mov     esi, [esp+74h+var_64]
0084471F
0084471F loc_84471F:                             ; CODE XREF: sub_844660+62â†‘j
0084471F                                         ; sub_844660+80â†‘j ...
0084471F                 push    10h
00844721                 lea     edx, [esp+78h+var_58]
00844725                 push    esi
00844726                 push    edx
00844727                 mov     ecx, edx
00844729                 call    sub_62E2D0
0084472E                 mov     ecx, [ebx+18h]
00844731                 lea     edx, [esp+74h+var_58]
00844735                 push    edx
00844736                 mov     [esp+78h+var_60], (offset loc_73635F+3)
0084473E                 mov     eax, [ecx]
00844740                 mov     eax, [eax+10h]
00844743                 lea     edx, [esp+78h+var_60]
00844747                 push    edx
00844748                 call    eax
0084474A                 test    eax, eax
0084474C                 jz      loc_844901
00844752                 mov     ecx, [ebx+18h]
00844755                 mov     ecx, [ecx+0DCh]
0084475B                 push    0
0084475D                 push    edi
0084475E                 push    eax
0084475F                 push    0
00844761                 push    ecx
00844762                 mov     ecx, ebx
00844764                 call    sub_844250
00844769                 mov     esi, eax
0084476B                 test    esi, esi
0084476D                 jz      loc_844901
00844773                 mov     edx, [ebx+0Ch]
00844776                 shr     edx, 5
00844779                 and     edx, 7
0084477C                 push    edx
0084477D                 push    esi
0084477E                 mov     ecx, ebx
00844780                 call    sub_843F40
00844785                 push    edi
00844786                 lea     ecx, [esp+78h+var_60]
0084478A                 call    unknown_libname_15 ; Microsoft VisualC 2-14/net runtime
0084478F                 mov     [esp+74h+var_4], 0
00844797                 mov     ecx, eax
00844799                 call    sub_7A0FC0
0084479E                 mov     [esp+74h+var_64], eax
008447A2                 mov     [esp+74h+var_4], 0FFFFFFFFh
008447AA                 lea     ecx, [esp+74h+var_60]
008447AE                 call    nullsub_26
008447B3                 mov     eax, [esp+74h+var_64]
008447B7                 add     eax, 0FFFFFFFFh ; switch 20 cases
008447BA                 cmp     eax, 13h
008447BD                 ja      def_8447CA      ; jumptable 008447CA default case, cases 2,3,5-17,19
008447C3                 movzx   eax, ds:byte_84493C[eax]
008447CA                 jmp     ds:jpt_8447CA[eax*4] ; switch jump
008447D1 ; ---------------------------------------------------------------------------
008447D1
008447D1 loc_8447D1:                             ; CODE XREF: sub_844660+77â†‘j
008447D1                 mov     dx, ds:word_103DBB8
008447D8                 mov     ax, ds:word_103DBAC
008447DE                 mov     cl, ds:byte_103DBAE
008447E4                 movq    xmm0, ds:qword_103DBA4
008447EC                 mov     [esp+74h+var_16], cl
008447F0                 mov     [esp+74h+var_24], dx
008447F5                 mov     edx, [ebx+18h]
008447F8                 mov     esi, [edx+2B5Ch]
008447FE                 mov     [esp+74h+var_18], ax
00844803                 mov     al, ds:byte_103DBBA
00844808                 lea     ecx, [esp+74h+var_20]
0084480C                 mov     [esp+74h+var_64], ecx
00844810                 add     esi, 2F0h
00844816                 mov     [esp+74h+var_22], al
0084481A                 mov     edi, offset off_103DBBC
0084481F                 mov     ecx, 4
00844824                 xor     eax, eax
00844826                 movq    [esp+74h+var_20], xmm0
0084482C                 movq    xmm0, ds:qword_103DBB0
00844834                 repe cmpsb
00844836                 mov     edi, [esp+74h+var_60]
0084483A                 movq    [esp+74h+var_2C], xmm0
00844840                 jnz     loc_84471B
00844846                 lea     ecx, [esp+74h+var_2C]
0084484A                 mov     esi, ecx
0084484C                 jmp     loc_84471F
00844851 ; ---------------------------------------------------------------------------
00844851
00844851 loc_844851:                             ; CODE XREF: sub_844660+6Eâ†‘j
00844851                 mov     dx, ds:word_103DBA0
00844858                 mov     al, ds:byte_103DBA2
0084485D                 movq    xmm0, ds:qword_103DB98
00844865                 lea     ecx, [esp+74h+var_38]
00844869                 movq    [esp+74h+var_38], xmm0
0084486F                 mov     [esp+74h+var_30], dx
00844874                 mov     [esp+74h+var_2E], al
00844878                 mov     esi, ecx
0084487A                 jmp     loc_84471F
0084487F ; ---------------------------------------------------------------------------
0084487F
0084487F loc_84487F:                             ; CODE XREF: sub_844660+16Aâ†‘j
0084487F                                         ; DATA XREF: .text:jpt_8447CAâ†“o
0084487F                 mov     eax, [ebx+18h]  ; jumptable 008447CA cases 1,18
00844882                 mov     ecx, [eax+114h]
00844888                 push    edi
00844889                 push    eax
0084488A                 call    sub_60B5D0
0084488F                 jmp     short def_8447CA ; jumptable 008447CA default case, cases 2,3,5-17,19
00844891 ; ---------------------------------------------------------------------------
00844891
00844891 loc_844891:                             ; CODE XREF: sub_844660+16Aâ†‘j
00844891                                         ; DATA XREF: .text:jpt_8447CAâ†“o
00844891                 push    edi             ; jumptable 008447CA case 4
00844892                 lea     ecx, [esp+78h+var_5C]
00844896                 call    unknown_libname_15 ; Microsoft VisualC 2-14/net runtime
0084489B                 mov     [esp+74h+var_4], 1
008448A3                 mov     ecx, eax
008448A5                 call    sub_7A0FB0
008448AA                 mov     edi, eax
008448AC                 mov     [esp+74h+var_4], 0FFFFFFFFh
008448B4                 lea     ecx, [esp+74h+var_5C]
008448B8                 call    nullsub_26
008448BD                 cmp     edi, 0FA0h
008448C3                 jb      short def_8447CA ; jumptable 008447CA default case, cases 2,3,5-17,19
008448C5                 cmp     edi, 0FA2h
008448CB                 ja      short def_8447CA ; jumptable 008447CA default case, cases 2,3,5-17,19
008448CD
008448CD loc_8448CD:                             ; CODE XREF: sub_844660+16Aâ†‘j
008448CD                                         ; DATA XREF: .text:jpt_8447CAâ†“o
008448CD                 fld     ds:flt_103E460  ; jumptable 008447CA case 20
008448D3                 push    ecx
008448D4                 fstp    [esp+78h+var_78] ; float
008448D7                 push    esi             ; int
008448D8                 mov     ecx, ebx
008448DA                 call    sub_843FF0
008448DF
008448DF def_8447CA:                             ; CODE XREF: sub_844660+15Dâ†‘j
008448DF                                         ; sub_844660+16Aâ†‘j ...
008448DF                 mov     eax, [ebx+0Ch]  ; jumptable 008447CA default case, cases 2,3,5-17,19
008448E2                 test    al, 4
008448E4                 jz      short loc_8448F0
008448E6                 or      eax, 2
008448E9                 mov     [ebx+0Ch], eax
008448EC                 mov     al, 1
008448EE                 jmp     short loc_84490A
008448F0 ; ---------------------------------------------------------------------------
008448F0
008448F0 loc_8448F0:                             ; CODE XREF: sub_844660+284â†‘j
008448F0                 mov     edx, [esi]
008448F2                 mov     eax, [edx+2Ch]
008448F5                 mov     ecx, esi
008448F7                 call    eax
008448F9                 and     dword ptr [ebx+0Ch], 0FFFFFFFDh
008448FD                 mov     al, 1
008448FF                 jmp     short loc_84490A
00844901 ; ---------------------------------------------------------------------------
00844901
00844901 loc_844901:                             ; CODE XREF: sub_844660+51â†‘j
00844901                                         ; sub_844660+59â†‘j ...
00844901                 mov     dword ptr [ebx+4], 2
00844908                 xor     al, al
0084490A
0084490A loc_84490A:                             ; CODE XREF: sub_844660+28Eâ†‘j
0084490A                                         ; sub_844660+29Fâ†‘j
0084490A                 mov     ecx, [esp+74h+var_C]
0084490E                 mov     large fs:0, ecx
00844915                 pop     ecx
00844916                 pop     edi
00844917                 pop     esi
00844918                 pop     ebx
00844919                 mov     ecx, [esp+64h+var_14]
0084491D                 xor     ecx, esp
0084491F                 call    sub_9D20F4
00844924                 mov     esp, ebp
00844926                 pop     ebp
00844927                 retn    8
00844927 ; } // starts at 844660
00844927 sub_844660      endp
00844927
00844927 ; ---------------------------------------------------------------------------
0084492A                 align 4
0084492C jpt_8447CA      dd offset loc_84487F    ; DATA XREF: sub_844660+16Aâ†‘r
00844930                 dd offset loc_844891    ; jump table for switch statement
00844934                 dd offset loc_8448CD
00844938                 dd offset def_8447CA
0084493C byte_84493C     db      0,     3,     3,     1
0084493C                                         ; DATA XREF: sub_844660+163â†‘r
00844940                 db      3,     3,     3,     3 ; indirect table for switch statement
00844944                 db      3,     3,     3,     3
00844948                 db      3,     3,     3,     3
0084494C                 db      3,     0,     3,     2
00844950
00844950 ; =============== S U B R O U T I N E =======================================
00844950
00844950
00844950 sub_844950      proc near
00844950
00844950 var_4           = dword ptr -4
00844950 arg_0           = dword ptr  4
00844950 arg_4           = dword ptr  8
00844950
00844950                 mov     eax, [esp+arg_0]
00844954                 sub     esp, 0Ch
00844957                 push    ebx
00844958                 push    ebp
00844959                 push    esi
0084495A                 lea     eax, [eax+eax*4]
0084495D                 mov     ebx, [ecx+eax*4+10h]
00844961                 lea     esi, [ecx+eax*4+4]
00844965                 mov     ecx, [esi+10h]
00844968                 add     ecx, ebx
0084496A                 cmp     ebx, ecx
0084496C                 push    edi
0084496D                 jbe     short loc_844974
0084496F                 call    __invalid_parameter_noinfo
00844974
00844974 loc_844974:                             ; CODE XREF: sub_844950+1Dâ†‘j
00844974                 mov     [esp+1Ch+var_4], ebx
00844978
00844978 loc_844978:                             ; CODE XREF: sub_844950+D4â†“j
00844978                 mov     eax, [esi+0Ch]
0084497B                 mov     edi, [esi+10h]
0084497E                 add     edi, eax
00844980                 cmp     eax, edi
00844982                 jbe     short loc_844989
00844984                 call    __invalid_parameter_noinfo
00844989
00844989 loc_844989:                             ; CODE XREF: sub_844950+32â†‘j
00844989                 cmp     esi, esi
0084498B                 jz      short loc_844992
0084498D                 call    __invalid_parameter_noinfo
00844992
00844992 loc_844992:                             ; CODE XREF: sub_844950+3Bâ†‘j
00844992                 cmp     ebx, edi
00844994                 jz      loc_844A35
0084499A                 mov     edx, [esi+0Ch]
0084499D                 add     edx, [esi+10h]
008449A0                 mov     edi, ebx
008449A2                 shr     edi, 2
008449A5                 and     ebx, 3
008449A8                 cmp     [esp+1Ch+var_4], edx
008449AC                 mov     ebp, edi
008449AE                 jb      short loc_8449B5
008449B0                 call    __invalid_parameter_noinfo
008449B5
008449B5 loc_8449B5:                             ; CODE XREF: sub_844950+5Eâ†‘j
008449B5                 mov     eax, [esi+8]
008449B8                 cmp     eax, ebp
008449BA                 ja      short loc_8449BE
008449BC                 sub     ebp, eax
008449BE
008449BE loc_8449BE:                             ; CODE XREF: sub_844950+6Aâ†‘j
008449BE                 mov     eax, [esi+4]
008449C1                 mov     ecx, [eax+ebp*4]
008449C4                 mov     ecx, [ecx+ebx*4]
008449C7                 mov     edx, [ecx]
008449C9                 mov     eax, [edx+2Ch]
008449CC                 push    1
008449CE                 call    eax
008449D0                 test    al, al
008449D2                 jz      short loc_844A0A
008449D4                 mov     ecx, [esi+0Ch]
008449D7                 add     ecx, [esi+10h]
008449DA                 cmp     [esp+1Ch+var_4], ecx
008449DE                 jb      short loc_8449E5
008449E0                 call    __invalid_parameter_noinfo
008449E5
008449E5 loc_8449E5:                             ; CODE XREF: sub_844950+8Eâ†‘j
008449E5                 mov     eax, [esi+8]
008449E8                 cmp     eax, edi
008449EA                 ja      short loc_8449EE
008449EC                 sub     edi, eax
008449EE
008449EE loc_8449EE:                             ; CODE XREF: sub_844950+9Aâ†‘j
008449EE                 mov     edx, [esi+4]
008449F1                 mov     eax, [edx+edi*4]
008449F4                 mov     ebx, [eax+ebx*4]
008449F7                 mov     ecx, [ebx+14h]
008449FA                 mov     edx, [ecx]
008449FC                 mov     eax, [edx+4Ch]
008449FF                 call    eax
00844A01                 mov     ecx, [esp+1Ch+arg_4]
00844A05                 cmp     [eax+10h], ecx
00844A08                 jz      short loc_844A29
00844A0A
00844A0A loc_844A0A:                             ; CODE XREF: sub_844950+82â†‘j
00844A0A                 mov     edx, [esi+0Ch]
00844A0D                 add     edx, [esi+10h]
00844A10                 cmp     [esp+1Ch+var_4], edx
00844A14                 jb      short loc_844A1B
00844A16                 call    __invalid_parameter_noinfo
00844A1B
00844A1B loc_844A1B:                             ; CODE XREF: sub_844950+C4â†‘j
00844A1B                 add     [esp+1Ch+var_4], 1
00844A20                 mov     ebx, [esp+1Ch+var_4]
00844A24                 jmp     loc_844978
00844A29 ; ---------------------------------------------------------------------------
00844A29
00844A29 loc_844A29:                             ; CODE XREF: sub_844950+B8â†‘j
00844A29                 pop     edi
00844A2A                 pop     esi
00844A2B                 pop     ebp
00844A2C                 mov     eax, ebx
00844A2E                 pop     ebx
00844A2F                 add     esp, 0Ch
00844A32                 retn    8
00844A35 ; ---------------------------------------------------------------------------
00844A35
00844A35 loc_844A35:                             ; CODE XREF: sub_844950+44â†‘j
00844A35                 pop     edi
00844A36                 pop     esi
00844A37                 pop     ebp
00844A38                 xor     eax, eax
00844A3A                 pop     ebx
00844A3B                 add     esp, 0Ch
00844A3E                 retn    8
00844A3E sub_844950      endp
00844A3E
00844A3E ; ---------------------------------------------------------------------------
00844A41                 align 10h
00844A50
00844A50 ; =============== S U B R O U T I N E =======================================
00844A50
00844A50
00844A50 sub_844A50      proc near
00844A50
00844A50 var_4           = dword ptr -4
00844A50 arg_0           = dword ptr  4
00844A50 arg_4           = dword ptr  8
00844A50
00844A50                 mov     eax, [esp+arg_0]
00844A54                 sub     esp, 0Ch
00844A57                 push    ebx
00844A58                 push    ebp
00844A59                 push    esi
00844A5A                 lea     eax, [eax+eax*4]
00844A5D                 mov     ebx, [ecx+eax*4+10h]
00844A61                 lea     esi, [ecx+eax*4+4]
00844A65                 mov     ecx, [esi+10h]
00844A68                 add     ecx, ebx
00844A6A                 cmp     ebx, ecx
00844A6C                 push    edi
00844A6D                 jbe     short loc_844A74
00844A6F                 call    __invalid_parameter_noinfo
00844A74
00844A74 loc_844A74:                             ; CODE XREF: sub_844A50+1Dâ†‘j
00844A74                 mov     [esp+1Ch+var_4], ebx
00844A78
00844A78 loc_844A78:                             ; CODE XREF: sub_844A50+F0â†“j
00844A78                 mov     eax, [esi+0Ch]
00844A7B                 mov     edi, [esi+10h]
00844A7E                 add     edi, eax
00844A80                 cmp     eax, edi
00844A82                 jbe     short loc_844A89
00844A84                 call    __invalid_parameter_noinfo
00844A89
00844A89 loc_844A89:                             ; CODE XREF: sub_844A50+32â†‘j
00844A89                 cmp     esi, esi
00844A8B                 jz      short loc_844A92
00844A8D                 call    __invalid_parameter_noinfo
00844A92
00844A92 loc_844A92:                             ; CODE XREF: sub_844A50+3Bâ†‘j
00844A92                 cmp     ebx, edi
00844A94                 jz      loc_844B51
00844A9A                 mov     edx, [esi+0Ch]
00844A9D                 add     edx, [esi+10h]
00844AA0                 mov     edi, ebx
00844AA2                 shr     edi, 2
00844AA5                 and     ebx, 3
00844AA8                 cmp     [esp+1Ch+var_4], edx
00844AAC                 mov     ebp, edi
00844AAE                 jb      short loc_844AB5
00844AB0                 call    __invalid_parameter_noinfo
00844AB5
00844AB5 loc_844AB5:                             ; CODE XREF: sub_844A50+5Eâ†‘j
00844AB5                 mov     eax, [esi+8]
00844AB8                 cmp     eax, ebp
00844ABA                 ja      short loc_844ABE
00844ABC                 sub     ebp, eax
00844ABE
00844ABE loc_844ABE:                             ; CODE XREF: sub_844A50+6Aâ†‘j
00844ABE                 mov     eax, [esi+4]
00844AC1                 mov     ecx, [eax+ebp*4]
00844AC4                 mov     ecx, [ecx+ebx*4]
00844AC7                 mov     edx, [ecx]
00844AC9                 mov     eax, [edx+2Ch]
00844ACC                 push    1
00844ACE                 call    eax
00844AD0                 test    al, al
00844AD2                 jz      short loc_844B26
00844AD4                 mov     ecx, [esi+0Ch]
00844AD7                 add     ecx, [esi+10h]
00844ADA                 cmp     [esp+1Ch+var_4], ecx
00844ADE                 jb      short loc_844AE5
00844AE0                 call    __invalid_parameter_noinfo
00844AE5
00844AE5 loc_844AE5:                             ; CODE XREF: sub_844A50+8Eâ†‘j
00844AE5                 mov     eax, [esi+8]
00844AE8                 cmp     eax, edi
00844AEA                 ja      short loc_844AEE
00844AEC                 sub     edi, eax
00844AEE
00844AEE loc_844AEE:                             ; CODE XREF: sub_844A50+9Aâ†‘j
00844AEE                 mov     edx, [esi+4]
00844AF1                 mov     eax, [edx+edi*4]
00844AF4                 mov     edi, [eax+ebx*4]
00844AF7                 mov     ecx, [edi+14h]
00844AFA                 mov     edx, [ecx]
00844AFC                 mov     eax, [edx+4Ch]
00844AFF                 call    eax
00FE3200                 db  11h
00FE3201                 db  11h
00FE3202                 db  11h
00FE3203                 db    8
00FE3204                 db  11h
00FE3205                 db    6
00FE3206                 db  11h
00FE3207                 db    7
00FE3208                 db  11h
00FE3209                 db  11h
00FE320A                 db  11h
00FE320B                 db  11h
00FE320C                 db  11h
00FE320D                 db  11h
00FE320E                 db  11h
00FE320F                 db    5
00FE3210                 db  11h
00FE3211                 db  11h
00FE3212                 db  11h
00FE3213                 db  11h
00FE3214                 db  11h
00FE3215                 db  11h
00FE3216                 db  11h
00FE3217                 db  11h
00FE3218                 db    0
00FE3219                 db    0
00FE321A                 db    1
00FE321B                 db    0
00FE321C                 db    3
00FE321D                 db    0
00FE321E                 db  0Ah
00FE321F                 db    0
00FE3220                 db  0Ah
00FE3221                 db    1
00FE3222                 db  0Bh
00FE3223                 db    0
00FE3224                 db    4
00FE3225                 db    0
00FE3226                 db    2
00FE3227                 db    0
00FE3228                 db    5
00FE3229                 db    0
00FE322A                 db    5
00FE322B                 db    1
00FE322C                 db    5
00FE322D                 db    2
00FE322E                 db    5
00FE322F                 db    3
00FE3230                 db    5
00FE3231                 db    4
00FE3232                 db    5
00FE3233                 db    5
00FE3234                 db    5
00FE3235                 db    6
00FE3236                 db    5
00FE3237                 db    7
00FE3238                 db    6
00FE3239                 db    0
00FE323A                 db    7
00FE323B                 db    0
00FE323C                 db    0
00FE323D                 db    0
00FE323E                 db  80h
00FE323F                 db 0BFh
00FE3240                 db  53h ; S
00FE3241                 db  63h ; c
00FE3242                 db  68h ; h
00FE3243                 db  65h ; e
00FE3244                 db  64h ; d
00FE3245                 db  75h ; u
00FE3246                 db  6Ch ; l
00FE3247                 db  65h ; e
00FE3248                 db  72h ; r
00FE3249                 db    0
00FE324A                 db    0
00FE324B                 db    0
00FE324C                 db 0DBh
00FE324D                 db  0Fh
00FE324E                 db  49h ; I
00FE324F                 db  40h ; @
00FE3250 off_FE3250      dd offset loc_6E6D63    ; DATA XREF: .rdata:off_FE32D8â†“o
00FE3254 off_FE3254      dd offset loc_63676D    ; DATA XREF: .rdata:00FE32E4â†“o
00FE3258                 db  73h ; s
00FE3259                 db  79h ; y
00FE325A                 db  73h ; s
00FE325B                 db    0
00FE325C                 db  65h ; e
00FE325D                 db  74h ; t
00FE325E                 db  63h ; c
00FE325F                 db    0
00FE3260                 db  6Ch ; l
00FE3261                 db  69h ; i
00FE3262                 db  62h ; b
00FE3263                 db    0
00FE3264                 db  65h ; e
00FE3265                 db  6Dh ; m
00FE3266                 db  74h ; t
00FE3267                 db    0
00FE3268                 db  65h ; e
00FE3269                 db  6Dh ; m
00FE326A                 db  31h ; 1
00FE326B                 db    0
00FE326C                 db  65h ; e
00FE326D                 db  6Dh ; m
00FE326E                 db  32h ; 2
00FE326F                 db    0
00FE3270                 db  65h ; e
00FE3271                 db  6Dh ; m
00FE3272                 db  33h ; 3
00FE3273                 db    0
00FE3274                 db  65h ; e
00FE3275                 db  6Dh ; m
00FE3276                 db  34h ; 4
00FE3277                 db    0
00FE3278                 db  6Bh ; k
00FE3279                 db  61h ; a
00FE327A                 db  6Fh ; o
00FE327B                 db    0
00FE327C                 db  67h ; g
00FE327D                 db  6Ch ; l
00FE327E                 db  78h ; x
00FE327F                 db    0
00FE3280                 db  67h ; g
00FE3281                 db  6Ch ; l
00FE3282                 db  79h ; y
00FE3283                 db    0
00FE3284                 db  63h ; c
00FE3285                 db  62h ; b
00FE3286                 db  69h ; i
00FE3287                 db    0
00FE3288                 db  6Dh ; m
00FE3289                 db  67h ; g
00FE328A                 db  63h ; c
00FE328B                 db    0
00FE328C                 db  70h ; p
00FE328D                 db  6Fh ; o
00FE328E                 db  70h ; p
00FE328F                 db    0
00FE3290                 db  63h ; c
00FE3291                 db  66h ; f
00FE3292                 db  74h ; t
00FE3293                 db    0
00FE3294                 db  62h ; b
00FE3295                 db  74h ; t
00FE3296                 db  6Ch ; l
00FE3297                 db    0
00FE3298                 db  77h ; w
00FE3299                 db  73h ; s
00FE329A                 db  63h ; c
00FE329B                 db    0
00FE329C                 db  77h ; w
00FE329D                 db  73h ; s
00FE329E                 db  73h ; s
00FE329F                 db    0
00FE32A0                 db  70h ; p
00FE32A1                 db  69h ; i
00FE32A2                 db  63h ; c
00FE32A3                 db    0
00FE32A4                 db  6Ch ; l
00FE32A5                 db  69h ; i
00FE32A6                 db  75h ; u
00FE32A7                 db    0
00FE32A8                 db  6Ch ; l
00FE32A9                 db  69h ; i
00FE32AA                 db  6Eh ; n
00FE32AB                 db    0
00FE32AC                 db  6Ch ; l
00FE32AD                 db  69h ; i
00FE32AE                 db  66h ; f
00FE32AF                 db    0
00FE32B0                 db  6Ch ; l
00FE32B1                 db  69h ; i
00FE32B2                 db  6Ch ; l
00FE32B3                 db    0
00FE32B4                 db  61h ; a
00FE32B5                 db  74h ; t
00FE32B6                 db  6Bh ; k
00FE32B7                 db    0
00FE32B8                 db  63h ; c
00FE32B9                 db  6Dh ; m
00FE32BA                 db  6Eh ; n
00FE32BB                 db    0
00FE32BC                 db  63h ; c
00FE32BD                 db  6Dh ; m
00FE32BE                 db  6Eh ; n
00FE32BF                 db    0
00FE32C0                 db  63h ; c
00FE32C1                 db  6Dh ; m
00FE32C2                 db  6Eh ; n
00FE32C3                 db    0
00FE32C4                 db  63h ; c
00FE32C5                 db  6Dh ; m
00FE32C6                 db  6Eh ; n
00FE32C7                 db    0
00FE32C8                 db  63h ; c
00FE32C9                 db  6Dh ; m
00FE32CA                 db  6Eh ; n
00FE32CB                 db    0
00FE32CC                 db  63h ; c
00FE32CD                 db  6Dh ; m
00FE32CE                 db  6Eh ; n
00FE32CF                 db    0
00FE32D0                 db  63h ; c
00FE32D1                 db  6Dh ; m
00FE32D2                 db  6Eh ; n
00FE32D3                 db    0
00FE32D4                 db  77h ; w
00FE32D5                 db  73h ; s
00FE32D6                 db  73h ; s
00FE32D7                 db    0
00FE32D8 off_FE32D8      dd offset off_FE3250    ; DATA XREF: sub_798640+11â†‘r
00FE32DC byte_FE32DC     db 0                    ; DATA XREF: sub_7982D0+2Bâ†‘r
00FE32DD byte_FE32DD     db 0                    ; DATA XREF: sub_7982D0+37â†‘r
00FE32DE                 align 10h
00FE32E0 dword_FE32E0    dd 0                    ; DATA XREF: sub_7982D0+44â†‘r
00FE32E0                                         ; sub_798900+1Dâ†‘r
00FE32E4                 dd offset off_FE3254
00FE32E8                 db    1
00FE32E9                 db    1
00FE32EA                 db    0
00FE32EB                 db    0
00FE32EC                 db    9
00FE32ED                 db    0
00FE32EE                 db    0
00FE32EF                 db    0
00FE32F0                 db  58h ; X
00FE32F1                 db  32h ; 2
00FE32F2                 db 0FEh
00FE32F3                 db    0
00FE32F4                 db    0
00FE32F5                 db    1
00FE32F6                 db    0
00FE32F7                 db    0
00FE32F8                 db    0
00FE32F9                 db    0
00FE32FA                 db    0
00FE32FB                 db    0
00FE32FC                 db  5Ch ; \
00FE32FD                 db  32h ; 2
00FE32FE                 db 0FEh
00FE32FF                 db    0
00FE3300                 db    0
00FE3301                 db    1
00FE3302                 db    0
00FE3303                 db    0
00FE3304                 db    0
00FE3305                 db    0
00FE3306                 db    0
00FE3307                 db    0
00FE3308                 db  60h ; `
00FE3309                 db  32h ; 2
00FE330A                 db 0FEh
00FE330B                 db    0
00FE330C                 db    1
00FE330D                 db    1
00FE330E                 db    0
00FE330F                 db    0
00FE3310                 db    1
00FE3311                 db    0
00FE3312                 db    0
00FE3313                 db    0
00FE3314                 db  64h ; d
00FE3315                 db  32h ; 2
00FE3316                 db 0FEh
00FE3317                 db    0
00FE3318                 db    1
00FE3319                 db    1
00FE331A                 db    0
00FE331B                 db    0
00FE331C                 db    7
00FE331D                 db    0
00FE331E                 db    0
00FE331F                 db    0
00FE3320                 db  68h ; h
00FE3321                 db  32h ; 2
00FE3322                 db 0FEh
00FE3323                 db    0
00FE3324                 db    1
00FE3325                 db    1
00FE3326                 db    0
00FE3327                 db    0
00FE3328                 db    6
00FE3329                 db    0
00FE332A                 db    0
00FE332B                 db    0
00FE332C                 db  6Ch ; l
00FE332D                 db  32h ; 2
00FE332E                 db 0FEh
00FE332F                 db    0
00FE3330                 db    1
00FE3331                 db    1
00FE3332                 db    0
00FE3333                 db    0
00FE3334                 db    6
00FE3335                 db    0
00FE3336                 db    0
00FE3337                 db    0
00FE3338                 db  70h ; p
00FE3339                 db  32h ; 2
00FE333A                 db 0FEh
00FE333B                 db    0
00FE333C                 db    1
00FE333D                 db    1
00FE333E                 db    0
00FE333F                 db    0
00FE3340                 db    6
00FE3341                 db    0
00FE3342                 db    0
00FE3343                 db    0
00FE3344                 db  74h ; t
00FE3345                 db  32h ; 2
00FE3346                 db 0FEh
00FE3347                 db    0
00FE3348                 db    1
00FE3349                 db    1
00FE334A                 db    0
00FE334B                 db    0
00FE334C                 db    6
00FE334D                 db    0
00FE334E                 db    0
00FE334F                 db    0
00FE3350                 db  78h ; x
00FE3351                 db  32h ; 2
00FE3352                 db 0FEh
00FE3353                 db    0
00FE3354                 db    0
00FE3355                 db    1
00FE3356                 db    0
00FE3357                 db    0
00FE3358                 db    8
00FE3359                 db    0
00FE335A                 db    0
00FE335B                 db    0
00FE335C                 db  7Ch ; |
00FE335D                 db  32h ; 2
00FE335E                 db 0FEh
00FE335F                 db    0
00FE3360                 db    0
00FE3361                 db    1
00FE3362                 db    0
00FE3363                 db    0
00FE3364                 db  0Ah
00FE3365                 db    0
00FE3366                 db    0
00FE3367                 db    0
00FE3368                 db  80h
00FE3369                 db  32h ; 2
00FE336A                 db 0FEh
00FE336B                 db    0
00FE336C                 db    0
00FE336D                 db    1
00FE336E                 db    0
00FE336F                 db    0
00FE3370                 db  0Bh
00FE3371                 db    0
00FE3372                 db    0
00FE3373                 db    0
00FE3374                 db  84h
00FE3375                 db  32h ; 2
00FE3376                 db 0FEh
00FE3377                 db    0
00FE3378                 db    0
00FE3379                 db    1
00FE337A                 db    0
00FE337B                 db    0
00FE337C                 db    0
00FE337D                 db    0
00FE337E                 db    0
00FE337F                 db    0
00FE3380                 db  88h
00FE3381                 db  32h ; 2
00FE3382                 db 0FEh
00FE3383                 db    0
00FE3384                 db    1
00FE3385                 db    1
00FE3386                 db    0
00FE3387                 db    0
00FE3388                 db  0Ch
00FE3389                 db    0
00FE338A                 db    0
00FE338B                 db    0
00FE338C                 db  8Ch
00FE338D                 db  32h ; 2
00FE338E                 db 0FEh
00FE338F                 db    0
00FE3390                 db    0
00FE3391                 db    1
00FE3392                 db    0
00FE3393                 db    0
00FE3394                 db  0Dh
00FE3395                 db    0
00FE3396                 db    0
00FE3397                 db    0
00FE3398                 db  90h
00FE3399                 db  32h ; 2
00FE339A                 db 0FEh
00FE339B                 db    0
00FE339C                 db    1
00FE339D                 db    1
00FE339E                 db    0
00FE339F                 db    0
00FE33A0                 db    0
00FE33A1                 db    0
00FE33A2                 db    0
00FE33A3                 db    0
00FE33A4                 db  94h
00FE33A5                 db  32h ; 2
00FE33A6                 db 0FEh
00FE33A7                 db    0
00FE33A8                 db    1
00FE33A9                 db    1
00FE33AA                 db    0
00FE33AB                 db    0
00FE33AC                 db    0
00FE33AD                 db    0
00FE33AE                 db    0
00FE33AF                 db    0
00FE33B0                 db  98h
00FE33B1                 db  32h ; 2
00FE33B2                 db 0FEh
00FE33B3                 db    0
00FE33B4                 db    1
00FE33B5                 db    1
00FE33B6                 db    0
00FE33B7                 db    0
00FE33B8                 db    0
00FE33B9                 db    0
00FE33BA                 db    0
00FE33BB                 db    0
00FE33BC                 db  9Ch
00FE33BD                 db  32h ; 2
00FE33BE                 db 0FEh
00FE33BF                 db    0
00FE33C0                 db    1
00FE33C1                 db    1
00FE33C2                 db    0
00FE33C3                 db    0
00FE33C4                 db    0
00FE33C5                 db    0
00FE33C6                 db    0
00FE33C7                 db    0
00FE33C8                 db 0A0h
00FE33C9                 db  32h ; 2
00FE33CA                 db 0FEh
00FE33CB                 db    0
00FE33CC                 db    1
00FE33CD                 db    1
00FE33CE                 db    0
00FE33CF                 db    0
00FE33D0                 db    0
00FE33D1                 db    0
00FE33D2                 db    0
00FE33D3                 db    0
00FE33D4                 db 0A4h
00FE33D5                 db  32h ; 2
00FE33D6                 db 0FEh
00FE33D7                 db    0
00FE33D8                 db    1
00FE33D9                 db    1
00FE33DA                 db    0
00FE33DB                 db    0
00FE33DC                 db    2
00FE33DD                 db    0
00FE33DE                 db    0
00FE33DF                 db    0
00FE33E0                 db 0A8h
00FE33E1                 db  32h ; 2
00FE33E2                 db 0FEh
00FE33E3                 db    0
00FE33E4                 db    1
00FE33E5                 db    1
00FE33E6                 db    0
00FE33E7                 db    0
00FE33E8                 db    3
00FE33E9                 db    0
00FE33EA                 db    0
00FE33EB                 db    0
00FE33EC                 db 0ACh
00FE33ED                 db  32h ; 2
00FE33EE                 db 0FEh
00FE33EF                 db    0
00FE33F0                 db    1
00FE33F1                 db    1
00FE33F2                 db    0
00FE33F3                 db    0
00FE33F4                 db    4
00FE33F5                 db    0
00FE33F6                 db    0
00FE33F7                 db    0
00FE33F8                 db 0B0h
00FE33F9                 db  32h ; 2
00FE33FA                 db 0FEh
00FE33FB                 db    0
00FE33FC                 db    1
00FE33FD                 db    1
00FE33FE                 db    0
00FE33FF                 db    0
00FE3400                 db    5
00FE3401                 db    0
00FE3402                 db    0
00FE3403                 db    0
00FE3404                 db 0B4h
00FE3405                 db  32h ; 2
00FE3406                 db 0FEh
00FE3407                 db    0
00FE3408                 db    1
00FE3409                 db    1
00FE340A                 db    0
00FE340B                 db    0
00FE340C                 db  11h
00FE340D                 db    0
00FE340E                 db    0
00FE340F                 db    0
00FE3410                 db 0B8h
00FE3411                 db  32h ; 2
00FE3412                 db 0FEh
00FE3413                 db    0
00FE3414                 db    0
00FE3415                 db    0
00FE3416                 db    0
00FE3417                 db    0
00FE3418                 db    0
00FE3419                 db    0
00FE341A                 db    0
00FE341B                 db    0
00FE341C                 db 0BCh
00FE341D                 db  32h ; 2
00FE341E                 db 0FEh
00FE341F                 db    0
00FE3420                 db    0
00FE3421                 db    0
00FE3422                 db    0
00FE3423                 db    0
00FE3424                 db    0
00FE3425                 db    0
00FE3426                 db    0
00FE3427                 db    0
00FE3428                 db 0C0h
00FE3429                 db  32h ; 2
00FE342A                 db 0FEh
00FE342B                 db    0
00FE342C                 db    0
00FE342D                 db    0
00FE342E                 db    0
00FE342F                 db    0
00FE3430                 db    0
00FE3431                 db    0
00FE3432                 db    0
00FE3433                 db    0
00FE3434                 db 0C4h
00FE3435                 db  32h ; 2
00FE3436                 db 0FEh
00FE3437                 db    0
00FE3438                 db    0
00FE3439                 db    0
00FE343A                 db    0
00FE343B                 db    0
00FE343C                 db    0
00FE343D                 db    0
00FE343E                 db    0
00FE343F                 db    0
00FE3440                 db 0C8h
00FE3441                 db  32h ; 2
00FE3442                 db 0FEh
00FE3443                 db    0
00FE3444                 db    0
00FE3445                 db    0
00FE3446                 db    0
00FE3447                 db    0
00FE3448                 db    0
00FE3449                 db    0
00FE344A                 db    0
00FE344B                 db    0
00FE344C                 db 0CCh
00FE344D                 db  32h ; 2
00FE344E                 db 0FEh
00FE344F                 db    0
00FE3450                 db    0
00FE3451                 db    0
00FE3452                 db    0
00FE3453                 db    0
00FE3454                 db    0
00FE3455                 db    0
00FE3456                 db    0
00FE3457                 db    0
00FE3458                 db 0D0h
00FE3459                 db  32h ; 2
00FE345A                 db 0FEh
00FE345B                 db    0
00FE345C                 db    0
00FE345D                 db    0
00FE345E                 db    0
00FE345F                 db    0
00FE3460                 db    0
00FE3461                 db    0
00FE3462                 db    0
00FE3463                 db    0
00FE3464                 db 0D4h
00FE3465                 db  32h ; 2
00FE3466                 db 0FEh
00FE3467                 db    0
00FE3468                 db    1
00FE3469                 db    0
00FE346A                 db    0
00FE346B                 db    0
00FE346C                 db  10h
00FE346D                 db    0
00FE346E                 db    0
00FE346F                 db    0
00FE3470 aCastMon19      db 'cast_mon_19',0      ; DATA XREF: .data:012C452Câ†“o
00FE347C aCastMon18      db 'cast_mon_18',0      ; DATA XREF: .data:012C4528â†“o
00FE3488 aCastMon17      db 'cast_mon_17',0      ; DATA XREF: .data:012C4524â†“o
00FE3494 aCastMon16      db 'cast_mon_16',0      ; DATA XREF: .data:012C4520â†“o
00FE34A0 aCastMon15      db 'cast_mon_15',0      ; DATA XREF: .data:012C451Câ†“o
00FE34AC aCastMon14      db 'cast_mon_14',0      ; DATA XREF: .data:012C4518â†“o
00FE34B8 aCastMon13      db 'cast_mon_13',0      ; DATA XREF: .data:012C4514â†“o
00FE34C4 aCastMon12      db 'cast_mon_12',0      ; DATA XREF: .data:012C4510â†“o
00FE34D0 aCastMon11      db 'cast_mon_11',0      ; DATA XREF: .data:012C450Câ†“o
00FE34DC unk_FE34DC      db  2Ah ; *             ; DATA XREF: .data:012C4508â†“o
00FE34DD                 db    0
00FE34DE                 db    0
00FE34DF                 db    0
00FE34E0 unk_FE34E0      db  2Ah ; *             ; DATA XREF: .data:012C4504â†“o
00FE34E1                 db    0
00FE34E2                 db    0
00FE34E3                 db    0
00FE34E4 aCastSon1       db 'cast_son_1',0       ; DATA XREF: .data:012C4500â†“o
00FE34EF                 db    0
00FE34F0 aCastItm1       db 'cast_itm_1',0       ; DATA XREF: .data:012C44FCâ†“o
00FE34FB                 db    0
00FE34FC unk_FE34FC      db  2Ah ; *             ; DATA XREF: .data:012C44F8â†“o
00FE34FD                 db    0
00FE34FE                 db    0
00FE34FF                 db    0
00FE3500 aCastWs1        db 'cast_ws_1',0        ; DATA XREF: .data:012C44F4â†“o
00FE350A                 db    0
00FE350B                 db    0
00FE350C aCastSou1       db 'cast_sou_1',0       ; DATA XREF: .data:012C44F0â†“o
00FE3517                 db    0
00FE3518 aCastGen1       db 'cast_gen_1',0       ; DATA XREF: .data:012C44ECâ†“o
00FE3523                 db    0
00FE3524 aCastJyu1       db 'cast_jyu_1',0       ; DATA XREF: .data:012C44E8â†“o
00FE352F                 db    0
00FE3530 aCastHou1       db 'cast_hou_1',0       ; DATA XREF: .data:012C44E4â†“o
00FE353B                 db    0
00FE353C unk_FE353C      db  2Ah ; *             ; DATA XREF: .data:off_12C44E0â†“o
00FE353D                 db    0
00FE353E                 db    0
00FE353F                 db    0
00FE3540 aCastMon29      db 'cast_mon_29',0      ; DATA XREF: .data:012C458Câ†“o
00FE354C aCastMon28      db 'cast_mon_28',0      ; DATA XREF: .data:012C4588â†“o
00FE3558 aCastMon27      db 'cast_mon_27',0      ; DATA XREF: .data:012C4584â†“o
00FE3564 aCastMon26      db 'cast_mon_26',0      ; DATA XREF: .data:012C4580â†“o
00FE3570 aCastMon25      db 'cast_mon_25',0      ; DATA XREF: .data:012C457Câ†“o
00FE357C aCastMon24      db 'cast_mon_24',0      ; DATA XREF: .data:012C4578â†“o
00FE3588 aCastMon23      db 'cast_mon_23',0      ; DATA XREF: .data:012C4574â†“o
00FE3594 aCastMon22      db 'cast_mon_22',0      ; DATA XREF: .data:012C4570â†“o
00FE35A0 aCastMon21      db 'cast_mon_21',0      ; DATA XREF: .data:012C456Câ†“o
00FE35AC unk_FE35AC      db  2Ah ; *             ; DATA XREF: .data:012C4568â†“o
00FE35AD                 db    0
00FE35AE                 db    0
00FE35AF                 db    0
00FE35B0 unk_FE35B0      db  2Ah ; *             ; DATA XREF: .data:012C4564â†“o
00FE35B1                 db    0
00FE35B2                 db    0
00FE35B3                 db    0
00FE35B4 unk_FE35B4      db  2Ah ; *             ; DATA XREF: .data:012C4560â†“o
00FE35B5                 db    0
00FE35B6                 db    0
00FE35B7                 db    0
00FE35B8 unk_FE35B8      db  2Ah ; *             ; DATA XREF: .data:012C455Câ†“o
00FE35B9                 db    0
00FE35BA                 db    0
00FE35BB                 db    0
00FE35BC unk_FE35BC      db  2Ah ; *             ; DATA XREF: .data:012C4558â†“o
00FE35BD                 db    0
00FE35BE                 db    0
00FE35BF                 db    0
00FE35C0 aCastWs2        db 'cast_ws_2',0        ; DATA XREF: .data:012C4554â†“o
00FE35CA                 db    0
00FE35CB                 db    0
00FE35CC aCastSou2       db 'cast_sou_2',0       ; DATA XREF: .data:012C4550â†“o
00FE35D7                 db    0
00FE35D8 aCastGen2       db 'cast_gen_2',0       ; DATA XREF: .data:012C454Câ†“o
00FE35E3                 db    0
00FE35E4 aCastJyu2       db 'cast_jyu_2',0       ; DATA XREF: .data:012C4548â†“o
00FE35EF                 db    0
00FE35F0 aCastHou2       db 'cast_hou_2',0       ; DATA XREF: .data:012C4544â†“o
00FE35FB                 db    0
00FE35FC unk_FE35FC      db  2Ah ; *             ; DATA XREF: .data:off_12C4540â†“o
00FE35FD                 db    0
00FE35FE                 db    0
00FE35FF                 db    0
00FE3600 aMatBelt_0      db 'mat_belt',0         ; DATA XREF: .data:012C45BCâ†“o
00FE3609                 db    0
00FE360A                 db    0
00FE360B                 db    0
00FE360C aMatFoot_0      db 'mat_foot',0         ; DATA XREF: .data:012C45B8â†“o
00FE3615                 db    0
00FE3616                 db    0
00FE3617                 db    0
00FE3618 aMatLeg_0       db 'mat_leg',0          ; DATA XREF: .data:012C45B4â†“o
00FE3620 aMatHand_0      db 'mat_hand',0         ; DATA XREF: .data:012C45B0â†“o
00FE3629                 db    0
00FE362A                 db    0
00FE362B                 db    0
00FE362C aMatBody_0      db 'mat_body',0         ; DATA XREF: .data:012C45ACâ†“o
00FE3635                 db    0
00FE3636                 db    0
00FE3637                 db    0
00FE3638 aMatHead_0      db 'mat_head',0         ; DATA XREF: .data:012C45A8â†“o
00FE3641                 db    0
00FE3642                 db    0
00FE3643                 db    0
00FE3644 aMatShld_0      db 'mat_shld',0         ; DATA XREF: .data:012C45A4â†“o
00FE364D                 db    0
00FE364E                 db    0
00FE364F                 db    0
00FE3650 aMatMwep_0      db 'mat_mwep',0         ; DATA XREF: .data:012C45A0â†“o
00FE3659                 db    0
00FE365A                 db    0
00FE365B                 db    0
00FE365C unk_FE365C      db  2Ah ; *             ; DATA XREF: .data:off_12C459Câ†“o
00FE365D                 db    0
00FE365E                 db    0
00FE365F                 db    0
00FE3660 ; const char a1dvfx03d[]
00FE3660 a1dvfx03d       db '%1dvfx_%03d',0      ; DATA XREF: sub_798780+24â†‘o
00FE366C aStopMcast      db 'stop_mcast',0       ; DATA XREF: .data:012C4894â†“o
00FE3677                 align 4
00FE3678 aPutMes         db 'put_mes',0          ; DATA XREF: .data:012C4890â†“o
00FE3680 asc_FE3680      db '*',0                ; DATA XREF: .data:012C488Câ†“o
00FE3682                 align 4
00FE3684 asc_FE3684      db '*',0                ; DATA XREF: .data:012C4888â†“o
00FE3686                 align 4
00FE3688 asc_FE3688      db '*',0                ; DATA XREF: .data:012C4884â†“o
00FE368A                 align 4
00FE368C asc_FE368C      db '*',0                ; DATA XREF: .data:012C4880â†“o
00FE368E                 align 10h
00FE3690 asc_FE3690      db '*',0                ; DATA XREF: .data:012C487Câ†“o
00FE3692                 align 4
00FE3694 asc_FE3694      db '*',0                ; DATA XREF: .data:012C4878â†“o
00FE3696                 align 4
00FE3698 asc_FE3698      db '*',0                ; DATA XREF: .data:012C4874â†“o
00FE369A                 align 4
00FE369C asc_FE369C      db '*',0                ; DATA XREF: .data:012C4870â†“o
00FE369E                 align 10h
00FE36A0 asc_FE36A0      db '*',0                ; DATA XREF: .data:012C486Câ†“o
00FE36A2                 align 4
00FE36A4 asc_FE36A4      db '*',0                ; DATA XREF: .data:012C4868â†“o
00FE36A6                 align 4
00FE36A8 asc_FE36A8      db '*',0                ; DATA XREF: .data:012C4864â†“o
00FE36AA                 align 4
00FE36AC asc_FE36AC      db '*',0                ; DATA XREF: .data:012C4860â†“o
00FE36AE                 align 10h
00FE36B0 asc_FE36B0      db '*',0                ; DATA XREF: .data:012C485Câ†“o
00FE36B2                 align 4
00FE36B4 asc_FE36B4      db '*',0                ; DATA XREF: .data:012C4858â†“o
00FE36B6                 align 4
00FE36B8 asc_FE36B8      db '*',0                ; DATA XREF: .data:012C4854â†“o
00FE36BA                 align 4
00FE36BC asc_FE36BC      db '*',0                ; DATA XREF: .data:012C4850â†“o
00FE36BE                 align 10h
00FE36C0 asc_FE36C0      db '*',0                ; DATA XREF: .data:012C484Câ†“o
00FE36C2                 align 4
00FE36C4 asc_FE36C4      db '*',0                ; DATA XREF: .data:012C4848â†“o
00FE36C6                 align 4
00FE36C8 asc_FE36C8      db '*',0                ; DATA XREF: .data:012C4844â†“o
00FE36CA                 align 4
00FE36CC asc_FE36CC      db '*',0                ; DATA XREF: .data:012C4840â†“o
00FE36CE                 align 10h
00FE36D0 asc_FE36D0      db '*',0                ; DATA XREF: .data:012C483Câ†“o
00FE36D2                 align 4
00FE36D4 asc_FE36D4      db '*',0                ; DATA XREF: .data:012C4838â†“o
00FE36D6                 align 4
00FE36D8 asc_FE36D8      db '*',0                ; DATA XREF: .data:012C4834â†“o
00FE36DA                 align 4
00FE36DC asc_FE36DC      db '*',0                ; DATA XREF: .data:012C4830â†“o
00FE36DE                 align 10h
00FE36E0 asc_FE36E0      db '*',0                ; DATA XREF: .data:012C482Câ†“o
00FE36E2                 align 4
00FE36E4 asc_FE36E4      db '*',0                ; DATA XREF: .data:012C4828â†“o
00FE36E6                 align 4
00FE36E8 asc_FE36E8      db '*',0                ; DATA XREF: .data:012C4824â†“o
00FE36EA                 align 4
00FE36EC asc_FE36EC      db '*',0                ; DATA XREF: .data:012C4820â†“o
00FE36EE                 align 10h
00FE36F0 asc_FE36F0      db '*',0                ; DATA XREF: .data:012C481Câ†“o
00FE36F2                 align 4
00FE36F4 asc_FE36F4      db '*',0                ; DATA XREF: .data:012C4818â†“o
00FE36F6                 align 4
00FE36F8 asc_FE36F8      db '*',0                ; DATA XREF: .data:012C4814â†“o
00FE36FA                 align 4
00FE36FC asc_FE36FC      db '*',0                ; DATA XREF: .data:012C4810â†“o
00FE36FE                 align 10h
00FE3700 asc_FE3700      db '*',0                ; DATA XREF: .data:012C480Câ†“o
00FE3702                 align 4
00FE3704 asc_FE3704      db '*',0                ; DATA XREF: .data:012C4808â†“o
00FE3706                 align 4
00FE3708 asc_FE3708      db '*',0                ; DATA XREF: .data:012C4804â†“o
00FE370A                 align 4
00FE370C asc_FE370C      db '*',0                ; DATA XREF: .data:012C4800â†“o
00FE370E                 align 10h
00FE3710 asc_FE3710      db '*',0                ; DATA XREF: .data:012C47FCâ†“o
00FE3712                 align 4
00FE3714 asc_FE3714      db '*',0                ; DATA XREF: .data:012C47F8â†“o
00FE3716                 align 4
00FE3718 asc_FE3718      db '*',0                ; DATA XREF: .data:012C47F4â†“o
00FE371A                 align 4
00FE371C asc_FE371C      db '*',0                ; DATA XREF: .data:012C47F0â†“o
00FE371E                 align 10h
00FE3720 asc_FE3720      db '*',0                ; DATA XREF: .data:012C47ECâ†“o
00FE3722                 align 4
00FE3724 asc_FE3724      db '*',0                ; DATA XREF: .data:012C47E8â†“o
00FE3726                 align 4
00FE3728 asc_FE3728      db '*',0                ; DATA XREF: .data:012C47E4â†“o
00FE372A                 align 4
00FE372C asc_FE372C      db '*',0                ; DATA XREF: .data:012C47E0â†“o
00FE372E                 align 10h
00FE3730 asc_FE3730      db '*',0                ; DATA XREF: .data:012C47DCâ†“o
00FE3732                 align 4
00FE3734 asc_FE3734      db '*',0                ; DATA XREF: .data:012C47D8â†“o
00FE3736                 align 4
00FE3738 asc_FE3738      db '*',0                ; DATA XREF: .data:012C47D4â†“o
00FE373A                 align 4
00FE373C asc_FE373C      db '*',0                ; DATA XREF: .data:012C47D0â†“o
00FE373E                 align 10h
00FE3740 asc_FE3740      db '*',0                ; DATA XREF: .data:012C47CCâ†“o
00FE3742                 align 4
00FE3744 asc_FE3744      db '*',0                ; DATA XREF: .data:012C47C8â†“o
00FE3746                 align 4
00FE3748 asc_FE3748      db '*',0                ; DATA XREF: .data:012C47C4â†“o
00FE374A                 align 4
00FE374C asc_FE374C      db '*',0                ; DATA XREF: .data:012C47C0â†“o
00FE374E                 align 10h
00FE3750 asc_FE3750      db '*',0                ; DATA XREF: .data:012C47BCâ†“o
00FE3752                 align 4
00FE3754 asc_FE3754      db '*',0                ; DATA XREF: .data:012C47B8â†“o
00FE3756                 align 4
00FE3758 asc_FE3758      db '*',0                ; DATA XREF: .data:012C47B4â†“o
00FE375A                 align 4
00FE375C asc_FE375C      db '*',0                ; DATA XREF: .data:012C47B0â†“o
00FE375E                 align 10h
00FE3760 asc_FE3760      db '*',0                ; DATA XREF: .data:012C47ACâ†“o
00FE3762                 align 4
00FE3764 asc_FE3764      db '*',0                ; DATA XREF: .data:012C47A8â†“o
00FE3766                 align 4
00FE3768 asc_FE3768      db '*',0                ; DATA XREF: .data:012C47A4â†“o
00FE376A                 align 4
00FE376C asc_FE376C      db '*',0                ; DATA XREF: .data:012C47A0â†“o
00FE376E                 align 10h
00FE3770 asc_FE3770      db '*',0                ; DATA XREF: .data:012C479Câ†“o
00FE3772                 align 4
00FE3774 asc_FE3774      db '*',0                ; DATA XREF: .data:012C4798â†“o
00FE3776                 align 4
00FE3778 asc_FE3778      db '*',0                ; DATA XREF: .data:012C4794â†“o
00FE377A                 align 4
00FE377C asc_FE377C      db '*',0                ; DATA XREF: .data:012C4790â†“o
00FE377E                 align 10h
00FE3780 asc_FE3780      db '*',0                ; DATA XREF: .data:012C478Câ†“o
00FE3782                 align 4
00FE3784 aGuardOff2      db 'guard_off_2',0      ; DATA XREF: .data:012C4788â†“o
00FE3790 aGuardOn2       db 'guard_on_2',0       ; DATA XREF: .data:012C4784â†“o
00FE379B                 align 4
00FE379C asc_FE379C      db '*',0                ; DATA XREF: .data:012C4780â†“o
00FE379E                 align 10h
00FE37A0 asc_FE37A0      db '*',0                ; DATA XREF: .data:012C477Câ†“o
00FE37A2                 align 4
00FE37A4 asc_FE37A4      db '*',0                ; DATA XREF: .data:012C4778â†“o
00FE37A6                 align 4
00FE37A8 asc_FE37A8      db '*',0                ; DATA XREF: .data:012C4774â†“o
00FE37AA                 align 4
00FE37AC asc_FE37AC      db '*',0                ; DATA XREF: .data:012C4770â†“o
00FE37AE                 align 10h
00FE37B0 asc_FE37B0      db '*',0                ; DATA XREF: .data:012C476Câ†“o
00FE37B2                 align 4
00FE37B4 asc_FE37B4      db '*',0                ; DATA XREF: .data:012C4768â†“o
00FE37B6                 align 4
00FE37B8 asc_FE37B8      db '*',0                ; DATA XREF: .data:012C4764â†“o
00FE37BA                 align 4
00FE37BC aCastStop2      db 'cast_stop_2',0      ; DATA XREF: .data:012C4760â†“o
00FE37C8 asc_FE37C8      db '*',0                ; DATA XREF: .data:012C475Câ†“o
00FE37CA                 align 4
00FE37CC asc_FE37CC      db '*',0                ; DATA XREF: .data:012C4758â†“o
00FE37CE                 align 10h
00FE37D0 asc_FE37D0      db '*',0                ; DATA XREF: .data:012C4754â†“o
00FE37D2                 align 4
00FE37D4 asc_FE37D4      db '*',0                ; DATA XREF: .data:012C4750â†“o
00FE37D6                 align 4
00FE37D8 asc_FE37D8      db '*',0                ; DATA XREF: .data:012C474Câ†“o
00FE37DA                 align 4
00FE37DC asc_FE37DC      db '*',0                ; DATA XREF: .data:012C4748â†“o
00FE37DE                 align 10h
00FE37E0 asc_FE37E0      db '*',0                ; DATA XREF: .data:012C4744â†“o
00FE37E2                 align 4
00FE37E4 asc_FE37E4      db '*',0                ; DATA XREF: .data:012C4740â†“o
00FE37E6                 align 4
00FE37E8 asc_FE37E8      db '*',0                ; DATA XREF: .data:012C473Câ†“o
00FE37EA                 align 4
00FE37EC aGuardOff1      db 'guard_off_1',0      ; DATA XREF: .data:012C4738â†“o
00FE37F8 aGuardOn1       db 'guard_on_1',0       ; DATA XREF: .data:012C4734â†“o
00FE3803                 align 4
00FE3804 asc_FE3804      db '*',0                ; DATA XREF: .data:012C4730â†“o
00FE3806                 align 4
00FE3808 asc_FE3808      db '*',0                ; DATA XREF: .data:012C472Câ†“o
00FE380A                 align 4
00FE380C asc_FE380C      db '*',0                ; DATA XREF: .data:012C4728â†“o
00FE380E                 align 10h
00FE3810 asc_FE3810      db '*',0                ; DATA XREF: .data:012C4724â†“o
00FE3812                 align 4
00FE3814 asc_FE3814      db '*',0                ; DATA XREF: .data:012C4720â†“o
00FE3816                 align 4
00FE3818 asc_FE3818      db '*',0                ; DATA XREF: .data:012C471Câ†“o
00FE381A                 align 4
00FE381C asc_FE381C      db '*',0                ; DATA XREF: .data:012C4718â†“o
00FE381E                 align 10h
00FE3820 asc_FE3820      db '*',0                ; DATA XREF: .data:012C4714â†“o
00FE3822                 align 4
00FE3824 aCastStop1      db 'cast_stop_1',0      ; DATA XREF: .data:012C4710â†“o
00FE3830 aDkOnly         db 'dk_only',0          ; DATA XREF: .data:012C470Câ†“o
00FE3838 asc_FE3838      db '*',0                ; DATA XREF: .data:012C4708â†“o
00FE383A                 align 4
00FE383C aVfxSpot        db 'vfx_spot',0         ; DATA XREF: .data:012C4704â†“o
00FE3845                 align 4
00FE3848 aVfxScr01       db 'vfx_scr01',0        ; DATA XREF: .data:012C4700â†“o
00FE3852                 align 4
00FE3854 aVfxPbuff       db 'vfx_pbuff',0        ; DATA XREF: .data:012C46FCâ†“o
00FE385E                 align 10h
00FE3860 asc_FE3860      db '*',0                ; DATA XREF: .data:012C46F8â†“o
00FE3862                 align 4
00FE3864 aInitfRidd      db 'initf_ridd',0       ; DATA XREF: .data:012C4650â†“o
00FE386F                 align 10h
00FE3870 aAms2fRidd      db 'ams2f_ridd',0       ; DATA XREF: .data:012C464Câ†“o
00FE387B                 align 4
00FE387C aInitbChob      db 'initb_chob',0       ; DATA XREF: .data:012C4648â†“o
00FE3887                 align 4
00FE3888 aAms2bChob      db 'ams2b_chob',0       ; DATA XREF: .data:012C4644â†“o
00FE3893                 align 4
00FE3894 aInitbIdle      db 'initb_idle',0       ; DATA XREF: .data:012C4640â†“o
00FE389F                 align 10h
00FE38A0 aAms2bIdle      db 'ams2b_idle',0       ; DATA XREF: .data:012C463Câ†“o
00FE38AB                 align 4
00FE38AC aInitwIdle      db 'initw_idle',0       ; DATA XREF: .data:012C4638â†“o
00FE38B7                 align 4
00FE38B8 aAms2wIdle      db 'ams2w_idle',0       ; DATA XREF: .data:012C4634â†“o
00FE38C3                 align 4
00FE38C4 a0_33           db '@0',0               ; DATA XREF: .data:012C4630â†“o
00FE38C7                 align 4
00FE38C8 aAms2nIdle      db 'ams2n_idle',0       ; DATA XREF: .data:012C462Câ†“o
00FE38D3                 align 4
00FE38D4 a2_3            db '@2',0               ; DATA XREF: .data:012C4628â†“o
00FE38D7                 align 4
00FE38D8 aAms2pIdle      db 'ams2p_idle',0       ; DATA XREF: .data:012C4624â†“o
00FE38E3                 align 4
00FE38E4 aInitcIdS       db 'initc_id_s',0       ; DATA XREF: .data:012C4620â†“o
00FE38EF                 align 10h
00FE38F0 aAms2cIdS       db 'ams2c_id_s',0       ; DATA XREF: .data:012C461Câ†“o
00FE38FB                 align 4
00FE38FC aInitcIdM       db 'initc_id_m',0       ; DATA XREF: .data:012C4618â†“o
00FE3907                 align 4
00FE3908 aAms2cIdM       db 'ams2c_id_m',0       ; DATA XREF: .data:012C4614â†“o
00FE3913                 align 4
00FE3914 aInitcIdle      db 'initc_idle',0       ; DATA XREF: .data:012C4610â†“o
00FE391F                 align 10h
00FE3920 aAms2cIdle      db 'ams2c_idle',0       ; DATA XREF: .data:012C460Câ†“o
00FE392B                 align 4
00FE392C aInitfRide      db 'initf_ride',0       ; DATA XREF: .data:012C4608â†“o
00FE3937                 align 4
00FE3938 aAms2fRide      db 'ams2f_ride',0       ; DATA XREF: .data:012C4604â†“o
00FE3943                 align 4
00FE3944 aInitfWall      db 'initf_wall',0       ; DATA XREF: .data:012C4600â†“o
00FE394F                 align 10h
00FE3950 aAms2fWall      db 'ams2f_wall',0       ; DATA XREF: .data:012C45FCâ†“o
00FE395B                 align 4
00FE395C aInitfGrnd      db 'initf_grnd',0       ; DATA XREF: .data:012C45F8â†“o
00FE3967                 align 4
00FE3968 aAms2fGrnd      db 'ams2f_grnd',0       ; DATA XREF: .data:012C45F4â†“o
00FE3973                 align 4
00FE3974 aInitfHeal      db 'initf_heal',0       ; DATA XREF: .data:012C45F0â†“o
00FE397F                 align 10h
00FE3980 aAms2fHeal      db 'ams2f_heal',0       ; DATA XREF: .data:012C45ECâ†“o
00FE398B                 align 4
00FE398C aInitfSit       db 'initf_sit',0        ; DATA XREF: .data:012C45E8â†“o
00FE3996                 align 4
00FE3998 aAms2fSit       db 'ams2f_sit',0        ; DATA XREF: .data:012C45E4â†“o
00FE39A2                 align 4
00FE39A4 aInitfIdle      db 'initf_idle',0       ; DATA XREF: .data:012C45E0â†“o
00FE39AF                 align 10h
00FE39B0 aAms2fIdle      db 'ams2f_idle',0       ; DATA XREF: .data:012C45DCâ†“o
00FE39BB                 align 4
00FE39BC a1_6            db '@1',0               ; DATA XREF: .data:012C45D8â†“o
00FE39BF                 align 10h
00FE39C0 aAms2bDead      db 'ams2b_dead',0       ; DATA XREF: .data:012C45D4â†“o
00FE39CB                 align 4
00FE39CC aInitfDead      db 'initf_dead',0       ; DATA XREF: .data:012C45D0â†“o
00FE39D7                 align 4
00FE39D8 aAms2fDead      db 'ams2f_dead',0       ; DATA XREF: .data:012C45CCâ†“o
00FE39E3                 align 4
00FE39E4 aInitdead       db 'initdead',0         ; DATA XREF: .data:012C45C8â†“o
00FE39ED                 align 10h
00FE39F0 aAms2dead       db 'ams2dead',0         ; DATA XREF: .data:012C45C4â†“o
00FE39F9                 align 4
00FE39FC aFxpfIdle       db 'fxpf_idle',0        ; DATA XREF: .data:off_12C45C0â†“o
00FE3A06                 align 4
00FE3A08 aW0Ams2fIdle    db 'w0_ams2f_idle',0    ; DATA XREF: .data:012C46F4â†“o
00FE3A16                 align 4
00FE3A18 aW0Initdead     db 'w0_initdead',0      ; DATA XREF: .data:012C46F0â†“o
00FE3A24 aW0Ams2dead     db 'w0_ams2dead',0      ; DATA XREF: .data:012C46ECâ†“o
00FE3A30 asc_FE3A30      db '*',0                ; DATA XREF: .data:012C46E8â†“o
00FE3A32                 align 4
00FE3A34 aW1Ams2fIdle    db 'w1_ams2f_idle',0    ; DATA XREF: .data:012C46E4â†“o
00FE3A42                 align 4
00FE3A44 aW1Initdead     db 'w1_initdead',0      ; DATA XREF: .data:012C46E0â†“o
00FE3A50 aW1Ams2dead     db 'w1_ams2dead',0      ; DATA XREF: .data:012C46DCâ†“o
00FE3A5C asc_FE3A5C      db '*',0                ; DATA XREF: .data:012C46D8â†“o
00FE3A5E                 align 10h
00FE3A60 aW2Ams2fIdle    db 'w2_ams2f_idle',0    ; DATA XREF: .data:012C46D4â†“o
00FE3A6E                 align 10h
00FE3A70 aW2Initdead     db 'w2_initdead',0      ; DATA XREF: .data:012C46D0â†“o
00FE3A7C aW2Ams2dead     db 'w2_ams2dead',0      ; DATA XREF: .data:012C46CCâ†“o
00FE3A88 asc_FE3A88      db '*',0                ; DATA XREF: .data:012C46C8â†“o
00FE3A8A                 align 4
00FE3A8C asc_FE3A8C      db '*',0                ; DATA XREF: .data:012C46C4â†“o
00FE3A8E                 align 10h
00FE3A90 asc_FE3A90      db '*',0                ; DATA XREF: .data:012C46C0â†“o
00FE3A92                 align 4
00FE3A94 asc_FE3A94      db '*',0                ; DATA XREF: .data:012C46BCâ†“o
00FE3A96                 align 4
00FE3A98 aDmstPois       db 'dmst_pois',0        ; DATA XREF: .data:012C46B8â†“o
00FE3AA2                 align 4
00FE3AA4 asc_FE3AA4      db '*',0                ; DATA XREF: .data:012C46B4â†“o
00FE3AA6                 align 4
00FE3AA8 asc_FE3AA8      db '*',0                ; DATA XREF: .data:012C46B0â†“o
00FE3AAA                 align 4
00FE3AAC asc_FE3AAC      db '*',0                ; DATA XREF: .data:012C46ACâ†“o
00FE3AAE                 align 10h
00FE3AB0 asc_FE3AB0      db '*',0                ; DATA XREF: .data:012C46A8â†“o
00FE3AB2                 align 4
00FE3AB4 asc_FE3AB4      db '*',0                ; DATA XREF: .data:012C46A4â†“o
00FE3AB6                 align 4
00FE3AB8 asc_FE3AB8      db '*',0                ; DATA XREF: .data:012C46A0â†“o
00FE3ABA                 align 4
00FE3ABC asc_FE3ABC      db '*',0                ; DATA XREF: .data:012C469Câ†“o
00FE3ABE                 align 10h
00FE3AC0 aGkabLigh       db 'gkab_ligh',0        ; DATA XREF: .data:012C4698â†“o
00FE3ACA                 align 4
00FE3ACC aGkabLigh_0     db 'gkab_ligh',0        ; DATA XREF: .data:012C4694â†“o
00FE3AD6                 align 4
00FE3AD8 aGkabWate       db 'gkab_wate',0        ; DATA XREF: .data:012C4690â†“o
00FE3AE2                 align 4
00FE3AE4 aGkabThun       db 'gkab_thun',0        ; DATA XREF: .data:012C468Câ†“o
00FE3AEE                 align 10h
00FE3AF0 aGkabEart       db 'gkab_eart',0        ; DATA XREF: .data:012C4688â†“o
00FE3AFA                 align 4
00FE3AFC aGkabWind       db 'gkab_wind',0        ; DATA XREF: .data:012C4684â†“o
00FE3B06                 align 4
00FE3B08 aGkabIce        db 'gkab_ice',0         ; DATA XREF: .data:012C4680â†“o
00FE3B11                 align 4
00FE3B14 aGkabFire       db 'gkab_fire',0        ; DATA XREF: .data:012C467Câ†“o
00FE3B1E                 align 10h
00FE3B20 aGkrsGg         db 'gkrs_gg',0          ; DATA XREF: .data:012C4678â†“o
00FE3B28 aGkrsBg         db 'gkrs_bg',0          ; DATA XREF: .data:012C4674â†“o
00FE3B30 aGkrsMd         db 'gkrs_md',0          ; DATA XREF: .data:012C4670â†“o
00FE3B38 aCftBaseCh      db 'cft_base_ch',0      ; DATA XREF: .data:012C466Câ†“o
00FE3B44 aCftBaseLg      db 'cft_base_lg',0      ; DATA XREF: .data:012C4668â†“o
00FE3B50 aCftBaseMd      db 'cft_base_md',0      ; DATA XREF: .data:012C4664â†“o
00FE3B5C aCftBase        db 'cft_base',0         ; DATA XREF: .data:012C4660â†“o
00FE3B65                 align 4
00FE3B68 aSzActMes       db 'sz_act_mes',0       ; DATA XREF: .data:012C465Câ†“o
00FE3B73                 align 4
00FE3B74 asc_FE3B74      db '*',0                ; DATA XREF: .data:012C4658â†“o
00FE3B76                 align 4
00FE3B78 ; const char aS_9[3]
00FE3B78 aS_9            db '%s',0               ; DATA XREF: sub_7987F0+41â†‘o
00FE3B7B                 align 4
00FE3B7C ; const char aParm04d[]
00FE3B7C aParm04d        db 'parm%04d',0         ; DATA XREF: sub_7987F0+79â†‘o
00FE3B85                 align 4
00FE3B88 aGlmain1        db 'glmain1',0          ; DATA XREF: sub_798900+44â†‘o
00FE3B90 aGlmain2        db 'glmain2',0          ; DATA XREF: sub_798900+6Eâ†‘o
00FE3B98 aAct_1          db 'act/',0             ; DATA XREF: sub_798BF0+DFâ†‘o
00FE3B9D                 align 10h
00FE3BA0 off_FE3BA0      dd offset loc_6E6D63    ; DATA XREF: sub_798BF0+3BEâ†‘o
00FE3BA4 unk_FE3BA4      db  2Fh ; /             ; DATA XREF: sub_798BF0+42Câ†‘o
00FE3BA5                 db    0
00FE3BA6                 db    0
00FE3BA7                 db    0
00FE3BA8 off_FE3BA8      dd offset loc_6E6D63    ; DATA XREF: sub_798BF0+17Câ†‘o
00FE3BAC unk_FE3BAC      db  2Fh ; /             ; DATA XREF: sub_798BF0+1D8â†‘o
00FE3BAD                 db    0
00FE3BAE                 db    0
00FE3BAF                 db    0
00FE3BB0 off_FE3BB0      dd offset loc_6E6D63    ; DATA XREF: sub_798BF0+2A2â†‘o
00FE3BB4 unk_FE3BB4      db  2Fh ; /             ; DATA XREF: sub_798BF0+32Eâ†‘o
00FE3BB5                 db    0
00FE3BB6                 db    0
00FE3BB7                 db    0
00FE3BB8 unk_FE3BB8      db  2Fh ; /             ; DATA XREF: sub_798BF0+372â†‘o
00FE3BB9                 db    0
00FE3BBA                 db    0
00FE3BBB                 db    0
00FE3BBC unk_FE3BBC      db  65h ; e             ; DATA XREF: sub_798BF0+49Dâ†‘o
00FE3BBD                 db  6Dh ; m
00FE3BBE                 db  31h ; 1
00FE3BBF                 db    0
00FE3BC0 unk_FE3BC0      db  65h ; e             ; DATA XREF: sub_798BF0+4EAâ†‘o
00FE3BC1                 db  6Dh ; m
00FE3BC2                 db  32h ; 2
00FE3BC3                 db    0
00FE3BC4 unk_FE3BC4      db  65h ; e             ; DATA XREF: sub_798BF0+52Eâ†‘o
00FE3BC5                 db  6Dh ; m
00FE3BC6                 db  33h ; 3
00FE3BC7                 db    0
00FE3BC8 unk_FE3BC8      db  65h ; e             ; DATA XREF: sub_798BF0+56Fâ†‘o
00FE3BC9                 db  6Dh ; m
00FE3BCA                 db  33h ; 3
00FE3BCB                 db    0
00FE3BCC unk_FE3BCC      db  2Fh ; /             ; DATA XREF: sub_798BF0+5B2â†‘o
00FE3BCD                 db    0
00FE3BCE                 db    0
00FE3BCF                 db    0
00FE3BD0 unk_FE3BD0      db  2Fh ; /             ; DATA XREF: sub_798BF0+64Eâ†‘o
00FE3BD1                 db    0
00FE3BD2                 db    0
00FE3BD3                 db    0
00FE3BD4 unk_FE3BD4      db  2Fh ; /             ; DATA XREF: sub_798BF0+6E5â†‘o
00FE3BD5                 db    0
00FE3BD6                 db    0
00FE3BD7                 db    0
00FE3BD8 aBase_1         db 'base',0             ; DATA XREF: sub_798BF0+738â†‘o
00FE3BDD                 align 10h
00FE3BE0 asc_FE3BE0      db '/',0                ; DATA XREF: sub_798BF0+79Aâ†‘o
00FE3BE2                 align 4
00FE3BE4 asc_FE3BE4      db '/',0                ; DATA XREF: sub_798BF0+831â†‘o
00FE3BE6                 align 4
00FE3BE8 ; const char a04d_0[]
00FE3BE8 a04d_0          db '%04d',0             ; DATA XREF: sub_798BF0+880â†‘o
00FE3BED                 align 10h
00FE3BF0 aBin_16         db '.bin',0             ; DATA XREF: sub_798BF0+964â†‘o
00FE3BF5                 align 4
00FE3BF8 aBin_17         db '.bin',0             ; DATA XREF: sub_798BF0+9D3â†‘o
00FE3BFD                 align 10h
00FE3C00 aClientVfx_0    db '/client/vfx/',0     ; DATA XREF: sub_799C90+93â†‘o
00FE3C0D                 align 10h
00FE3C10 aItm            db 'itm',0              ; DATA XREF: sub_799C90+18Câ†‘o
00FE3C14 aAbl            db 'abl',0              ; DATA XREF: sub_799C90+E9â†‘o
00FE3C18 asc_FE3C18      db '/',0                ; DATA XREF: sub_799C90+1CBâ†‘o
00FE3C1A                 align 4
00FE3C1C ; const char a04d_2[]
00FE3C1C a04d_2          db '%04d',0             ; DATA XREF: sub_799C90+215â†‘o
00FE3C21                 align 4
00FE3C24 aBin_20         db '.bin',0             ; DATA XREF: sub_799C90+286â†‘o
00FE3C29                 align 4
00FE3C2C aClientVfx      db '/client/vfx/',0     ; DATA XREF: sub_7997B0+ABâ†‘o
00FE3C39                 align 4
00FE3C3C ; const char aGl1d[]
00FE3C3C aGl1d           db 'gl%1d',0            ; DATA XREF: sub_7997B0+F6â†‘o
00FE3C42                 align 4
00FE3C44 asc_FE3C44      db '/',0                ; DATA XREF: sub_7997B0+15Fâ†‘o
00FE3C46                 align 4
00FE3C48 ; const char a04d_1[]
00FE3C48 a04d_1          db '%04d',0             ; DATA XREF: sub_7997B0+1ABâ†‘o
00FE3C4D                 align 10h
00FE3C50 aBin_18         db '.bin',0             ; DATA XREF: sub_7997B0+22Dâ†‘o
00FE3C55                 align 4
00FE3C58 aActCmnEm1Base4 db 'act/cmn/em1/base/4001',0
00FE3C58                                         ; DATA XREF: sub_7997B0+381â†‘o
00FE3C6E                 align 10h
00FE3C70 aBin_19         db '.bin',0             ; DATA XREF: sub_7997B0+3E4â†‘o
00FE3C75                 align 4
00FE3C78 a0Tdynamicarray_11 db '??0?$TDynamicArray@GV?$DefaultDynamicArrayAllocatorMalloc@G@Commo'
00FE3CB9                 db 'n@Stella@Lay@Engine@CDev@SQEX@@@Common@Stella@Lay@Engine@CDev@SQE'
00FE3CFA                 db 'X@@QAE@XZ',0
00FE3D04                 db  82h
00FE3D05                 db 0A8h
00FE3D06                 db  82h
00FE3D07                 db 0A9h
00FE3D08                 db  82h
00FE3D09                 db 0B5h
00FE3D0A                 db  82h
00FE3D0B                 db 0A2h
00FE3D0C                 db  2Eh ; .
00FE3D0D                 db  2Eh ; .
00FE3D0E                 db  2Eh ; .
00FE3D0F                 db    0
00FE3D10                 db  64h ; d
00FE3D11                 db  3Ah ; :
00FE3D12                 db  5Ch ; \
00FE3D13                 db  72h ; r
00FE3D14                 db  61h ; a
00FE3D15                 db  70h ; p
00FE3D16                 db  74h ; t
00FE3D17                 db  75h ; u
00FE3D18                 db  72h ; r
00FE3D19                 db  65h ; e
00FE3D1A                 db  5Ch ; \
00FE3D1B                 db  73h ; s
00FE3D1C                 db  72h ; r
00FE3D1D                 db  63h ; c
00FE3D1E                 db  5Ch ; \
00FE3D1F                 db  65h ; e
00FE3D20                 db  78h ; x
00FE3D21                 db  74h ; t
00FE3D22                 db  65h ; e
00FE3D23                 db  72h ; r
00FE3D24                 db  6Eh ; n
00FE3D25                 db  61h ; a
00FE3D26                 db  6Ch ; l
00FE3D27                 db  73h ; s
00FE3D28                 db  64h ; d
00FE3D29                 db  6Bh ; k
00FE3D2A                 db  5Ch ; \
00FE3D2B                 db  63h ; c
00FE3D2C                 db  64h ; d
00FE3D2D                 db  65h ; e
00FE3D2E                 db  76h ; v
00FE3D2F                 db  5Ch ; \
00FE3D30                 db  69h ; i
00FE3D31                 db  6Eh ; n
00FE3D32                 db  63h ; c
00FE3D33                 db  6Ch ; l
00FE3D34                 db  75h ; u
00FE3D35                 db  64h ; d
00FE3D36                 db  65h ; e
00FE3D37                 db  5Ch ; \
00FE3D38                 db  63h ; c
00FE3D39                 db  64h ; d
00FE3D3A                 db  65h ; e
00FE3D3B                 db  76h ; v
00FE3D3C                 db  5Ch ; \
00FE3D3D                 db  65h ; e
00FE3D3E                 db  6Eh ; n
00FE3D3F                 db  67h ; g
00FE3D40                 db  69h ; i
00FE3D41                 db  6Eh ; n
00FE3D42                 db  65h ; e
00FE3D43                 db  5Ch ; \
00FE3D44                 db  6Ch ; l
00FE3D45                 db  61h ; a
00FE3D46                 db  79h ; y
00FE3D47                 db  5Ch ; \
00FE3D48                 db  73h ; s
00FE3D49                 db  74h ; t
00FE3D4A                 db  65h ; e
00FE3D4B                 db  6Ch ; l
00FE3D4C                 db  6Ch ; l
00FE3D4D                 db  61h ; a
00FE3D4E                 db  5Ch ; \
00FE3D4F                 db  63h ; c
00FE3D50                 db  6Fh ; o
00FE3D51                 db  6Dh ; m
00FE3D52                 db  6Dh ; m
00FE3D53                 db  6Fh ; o
00FE3D54                 db  6Eh ; n
00FE3D55                 db  5Ch ; \
00FE3D56                 db  44h ; D
00FE3D57                 db  79h ; y
00FE3D58                 db  6Eh ; n
00FE3D59                 db  61h ; a
00FE3D5A                 db  6Dh ; m
00FE3D5B                 db  69h ; i
00FE3D5C                 db  63h ; c
00FE3D5D                 db  41h ; A
00FE3D5E                 db  72h ; r
00FE3D5F                 db  72h ; r
00FE3D60                 db  61h ; a
00FE3D61                 db  79h ; y
00FE3D62                 db  2Eh ; .
00FE3D63                 db  69h ; i
00FE3D64                 db  6Eh ; n
00FE3D65                 db  6Ch ; l
00FE3D66                 db    0
00FE3D67                 db    0
00FE3D68                 db  6Eh ; n
00FE3D69                 db  6Fh ; o
00FE3D6A                 db  6Eh ; n
00FE3D6B                 db  65h ; e
00FE3D6C                 db    0
00FE3D6D                 db    0
00FE3D6E                 db    0
00FE3D6F                 db    0
00FE3D70                 db  28h ; (
00FE3D71                 db  21h ; !
00FE3D72                 db  20h
00FE3D73                 db  74h ; t
00FE3D74                 db  68h ; h
00FE3D75                 db  69h ; i
00FE3D76                 db  73h ; s
00FE3D77                 db  2Dh ; -
00FE3D78                 db  3Eh ; >
00FE3D79                 db  49h ; I
00FE3D7A                 db  73h ; s
00FE3D7B                 db  46h ; F
00FE3D7C                 db  69h ; i
00FE3D7D                 db  78h ; x
00FE3D7E                 db  65h ; e
00FE3D7F                 db  64h ; d
00FE3D80                 db  42h ; B
00FE3D81                 db  75h ; u
00FE3D82                 db  66h ; f
00FE3D83                 db  66h ; f
00FE3D84                 db  65h ; e
00FE3D85                 db  72h ; r
00FE3D86                 db  41h ; A
00FE3D87                 db  72h ; r
00FE3D88                 db  72h ; r
00FE3D89                 db  61h ; a
00FE3D8A                 db  79h ; y
00FE3D8B                 db  28h ; (
00FE3D8C                 db  29h ; )
00FE3D8D                 db  29h ; )
00FE3D8E                 db  20h
00FE3D8F                 db  26h ; &
00FE3D90                 db  26h ; &
00FE3D91                 db  20h
00FE3D92                 db  22h ; "
00FE3D93                 db  82h
00FE3D94                 db 0A8h
00FE3D95                 db  82h
00FE3D96                 db 0A9h
00FE3D97                 db  82h
00FE3D98                 db 0B5h
00FE3D99                 db  82h
00FE3D9A                 db 0A2h
00FE3D9B                 db  2Eh ; .
00FE3D9C                 db  2Eh ; .
00FE3D9D                 db  2Eh ; .
00FE3D9E                 db  22h ; "
00FE3D9F                 db    0
00FE3DA0                 db  3Fh ; ?
00FE3DA1                 db  3Fh ; ?
00FE3DA2                 db  30h ; 0
00FE3DA3                 db  3Fh ; ?
00FE3DA4                 db  24h ; $
00FE3DA5                 db  54h ; T
00FE3DA6                 db  44h ; D
00FE3DA7                 db  79h ; y
00FE3DA8                 db  6Eh ; n
00FE3DA9                 db  61h ; a
00FE3DAA                 db  6Dh ; m
00FE3DAB                 db  69h ; i
00FE3DAC                 db  63h ; c
00FE3DAD                 db  41h ; A
00FE3DAE                 db  72h ; r
00FE3DAF                 db  72h ; r
00FE3DB0                 db  61h ; a
00FE3DB1                 db  79h ; y
00FE3DB2                 db  40h ; @
00FE3DB3                 db  55h ; U
00FE3DB4                 db  54h ; T
00FE3DB5                 db  72h ; r
00FE3DB6                 db  69h ; i
00FE3DB7                 db  61h ; a
00FE3DB8                 db  6Eh ; n
00FE3DB9                 db  67h ; g
00FE3DBA                 db  6Ch ; l
00FE3DBB                 db  65h ; e
00FE3DBC                 db  40h ; @
00FE3DBD                 db  43h ; C
00FE3DBE                 db  6Fh ; o
00FE3DBF                 db  6Ch ; l
00FE3DC0                 db  6Ch ; l
00FE3DC1                 db  69h ; i
00FE3DC2                 db  73h ; s
00FE3DC3                 db  69h ; i
00FE3DC4                 db  6Fh ; o
00FE3DC5                 db  6Eh ; n
00FE3DC6                 db  40h ; @
00FE3DC7                 db  50h ; P
00FE3DC8                 db  68h ; h
00FE3DC9                 db  69h ; i
00FE3DCA                 db  65h ; e
00FE3DCB                 db  67h ; g
00FE3DCC                 db  40h ; @
00FE3DCD                 db  45h ; E
00FE3DCE                 db  6Eh ; n
00FE3DCF                 db  67h ; g
00FE3DD0                 db  69h ; i
00FE3DD1                 db  6Eh ; n
00FE3DD2                 db  65h ; e
00FE3DD3                 db  40h ; @
00FE3DD4                 db  43h ; C
00FE3DD5                 db  44h ; D
00FE3DD6                 db  65h ; e
00FE3DD7                 db  76h ; v
00FE3DD8                 db  40h ; @
00FE3DD9                 db  53h ; S
00FE3DDA                 db  51h ; Q
00FE3DDB                 db  45h ; E
00FE3DDC                 db  58h ; X
00FE3DDD                 db  40h ; @
00FE3DDE                 db  40h ; @
00FE3DDF                 db  56h ; V
00FE3DE0                 db  3Fh ; ?
00FE3DE1                 db  24h ; $
00FE3DE2                 db  44h ; D
00FE3DE3                 db  65h ; e
00FE3DE4                 db  66h ; f
00FE3DE5                 db  61h ; a
00FE3DE6                 db  75h ; u
00FE3DE7                 db  6Ch ; l
00FE3DE8                 db  74h ; t
00FE3DE9                 db  44h ; D
00FE3DEA                 db  79h ; y
00FE3DEB                 db  6Eh ; n
00FE3DEC                 db  61h ; a
00FE3DED                 db  6Dh ; m
00FE3DEE                 db  69h ; i
00FE3DEF                 db  63h ; c
00FE3DF0                 db  41h ; A
00FE3DF1                 db  72h ; r
00FE3DF2                 db  72h ; r
00FE3DF3                 db  61h ; a
00FE3DF4                 db  79h ; y
00FE3DF5                 db  41h ; A
00FE3DF6                 db  6Ch ; l
00FE3DF7                 db  6Ch ; l
00FE3DF8                 db  6Fh ; o
00FE3DF9                 db  63h ; c
00FE3DFA                 db  61h ; a
00FE3DFB                 db  74h ; t
00FE3DFC                 db  6Fh ; o
00FE3DFD                 db  72h ; r
00FE3DFE                 db  4Dh ; M
00FE3DFF                 db  61h ; a
00FE3E00                 db  6Ch ; l
00FE3E01                 db  6Ch ; l
00FE3E02                 db  6Fh ; o
00FE3E03                 db  63h ; c
00FE3E04                 db  40h ; @
00FE3E05                 db  55h ; U
00FE3E06                 db  54h ; T
00FE3E07                 db  72h ; r
00FE3E08                 db  69h ; i
00FE3E09                 db  61h ; a
00FE3E0A                 db  6Eh ; n
00FE3E0B                 db  67h ; g
00FE3E0C                 db  6Ch ; l
00FE3E0D                 db  65h ; e
00FE3E0E                 db  40h ; @
00FE3E0F                 db  43h ; C
00FE3E10                 db  6Fh ; o
00FE3E11                 db  6Ch ; l
00FE3E12                 db  6Ch ; l
00FE3E13                 db  69h ; i
00FE3E14                 db  73h ; s
00FE3E15                 db  69h ; i
00FE3E16                 db  6Fh ; o
00FE3E17                 db  6Eh ; n
00FE3E18                 db  40h ; @
00FE3E19                 db  50h ; P
00FE3E1A                 db  68h ; h
00FE3E1B                 db  69h ; i
00FE3E1C                 db  65h ; e
00FE3E1D                 db  67h ; g
00FE3E1E                 db  40h ; @
00FE3E1F                 db  45h ; E
00FE3E20                 db  6Eh ; n
00FE3E21                 db  67h ; g
00FE3E22                 db  69h ; i
00FE3E23                 db  6Eh ; n
00FE3E24                 db  65h ; e
00FE3E25                 db  40h ; @
00FE3E26                 db  43h ; C
00FE3E27                 db  44h ; D
00FE3E28                 db  65h ; e
00FE3E29                 db  76h ; v
00FE3E2A                 db  40h ; @
00FE3E2B                 db  53h ; S
00FE3E2C                 db  51h ; Q
00FE3E2D                 db  45h ; E
00FE3E2E                 db  58h ; X
00FE3E2F                 db  40h ; @
00FE3E30                 db  40h ; @
00FE3E31                 db  40h ; @
00FE3E32                 db  43h ; C
00FE3E33                 db  6Fh ; o
00FE3E34                 db  6Dh ; m
00FE3E35                 db  6Dh ; m
00FE3E36                 db  6Fh ; o
00FE3E37                 db  6Eh ; n
00FE3E38                 db  40h ; @
00FE3E39                 db  53h ; S
00FE3E3A                 db  74h ; t
00FE3E3B                 db  65h ; e
00FE3E3C                 db  6Ch ; l
00FE3E3D                 db  6Ch ; l
00FE3E3E                 db  61h ; a
00FE3E3F                 db  40h ; @
00FE3E40                 db  4Ch ; L
00FE3E41                 db  61h ; a
00FE3E42                 db  79h ; y
00FE3E43                 db  40h ; @
00FE3E44                 db  34h ; 4
00FE3E45                 db  35h ; 5
00FE3E46                 db  36h ; 6
00FE3E47                 db  40h ; @
00FE3E48                 db  40h ; @
00FE3E49                 db  43h ; C
00FE3E4A                 db  6Fh ; o
00FE3E4B                 db  6Dh ; m
00FE3E4C                 db  6Dh ; m
00FE3E4D                 db  6Fh ; o
00FE3E4E                 db  6Eh ; n
00FE3E4F                 db  40h ; @
00FE3E50                 db  53h ; S
00FE3E51                 db  74h ; t
00FE3E52                 db  65h ; e
00FE3E53                 db  6Ch ; l
00FE3E54                 db  6Ch ; l
00FE3E55                 db  61h ; a
00FE3E56                 db  40h ; @
00FE3E57                 db  4Ch ; L
00FE3E58                 db  61h ; a
00FE3E59                 db  79h ; y
00FE3E5A                 db  40h ; @
00FE3E5B                 db  45h ; E
00FE3E5C                 db  6Eh ; n
00FE3E5D                 db  67h ; g
00FE3E5E                 db  69h ; i
00FE3E5F                 db  6Eh ; n
00FE3E60                 db  65h ; e
00FE3E61                 db  40h ; @
00FE3E62                 db  43h ; C
00FE3E63                 db  44h ; D
00FE3E64                 db  65h ; e
00FE3E65                 db  76h ; v
00FE3E66                 db  40h ; @
00FE3E67                 db  53h ; S
00FE3E68                 db  51h ; Q
00FE3E69                 db  45h ; E
00FE3E6A                 db  58h ; X
00FE3E6B                 db  40h ; @
00FE3E6C                 db  40h ; @
00FE3E6D                 db  51h ; Q
00FE3E6E                 db  41h ; A
00FE3E6F                 db  45h ; E
00FE3E70                 db  40h ; @
00FE3E71                 db  58h ; X
00FE3E72                 db  5Ah ; Z
00FE3E73                 db    0
00FE3E74                 db  82h
00FE3E75                 db 0A8h
00FE3E76                 db  82h
00FE3E77                 db 0A9h
00FE3E78                 db  82h
00FE3E79                 db 0B5h
00FE3E7A                 db  82h
00FE3E7B                 db 0A2h
00FE3E7C                 db  2Eh ; .
00FE3E7D                 db  2Eh ; .
00FE3E7E                 db  2Eh ; .
00FE3E7F                 db    0
00FE3E80                 db  64h ; d
00FE3E81                 db  3Ah ; :
00FE3E82                 db  5Ch ; \
00FE3E83                 db  72h ; r
00FE3E84                 db  61h ; a
00FE3E85                 db  70h ; p
00FE3E86                 db  74h ; t
00FE3E87                 db  75h ; u
00FE3E88                 db  72h ; r
00FE3E89                 db  65h ; e
00FE3E8A                 db  5Ch ; \
00FE3E8B                 db  73h ; s
00FE3E8C                 db  72h ; r
00FE3E8D                 db  63h ; c
00FE3E8E                 db  5Ch ; \
00FE3E8F                 db  65h ; e
00FE3E90                 db  78h ; x
00FE3E91                 db  74h ; t
00FE3E92                 db  65h ; e
00FE3E93                 db  72h ; r
00FE3E94                 db  6Eh ; n
00FE3E95                 db  61h ; a
00FE3E96                 db  6Ch ; l
00FE3E97                 db  73h ; s
00FE3E98                 db  64h ; d
00FE3E99                 db  6Bh ; k
00FE3E9A                 db  5Ch ; \
00FE3E9B                 db  63h ; c
00FE3E9C                 db  64h ; d
00FE3E9D                 db  65h ; e
00FE3E9E                 db  76h ; v
00FE3E9F                 db  5Ch ; \
00FE3EA0                 db  69h ; i
00FE3EA1                 db  6Eh ; n
00FE3EA2                 db  63h ; c
00FE3EA3                 db  6Ch ; l
00FE3EA4                 db  75h ; u
00FE3EA5                 db  64h ; d
00FE3EA6                 db  65h ; e
00FE3EA7                 db  5Ch ; \
00FE3EA8                 db  63h ; c
00FE3EA9                 db  64h ; d
00FE3EAA                 db  65h ; e
00FE3EAB                 db  76h ; v
00FE3EAC                 db  5Ch ; \
00FE3EAD                 db  65h ; e
00FE3EAE                 db  6Eh ; n
00FE3EAF                 db  67h ; g
00FE3EB0                 db  69h ; i
00FE3EB1                 db  6Eh ; n
00FE3EB2                 db  65h ; e
00FE3EB3                 db  5Ch ; \
00FE3EB4                 db  6Ch ; l
00FE3EB5                 db  61h ; a
00FE3EB6                 db  79h ; y
00FE3EB7                 db  5Ch ; \
00FE3EB8                 db  73h ; s
00FE3EB9                 db  74h ; t
00FE3EBA                 db  65h ; e
00FE3EBB                 db  6Ch ; l
00FE3EBC                 db  6Ch ; l
00FE3EBD                 db  61h ; a
00FE3EBE                 db  5Ch ; \
00FE3EBF                 db  63h ; c
00FE3EC0                 db  6Fh ; o
00FE3EC1                 db  6Dh ; m
00FE3EC2                 db  6Dh ; m
00FE3EC3                 db  6Fh ; o
00FE3EC4                 db  6Eh ; n
00FE3EC5                 db  5Ch ; \
00FE3EC6                 db  44h ; D
00FE3EC7                 db  79h ; y
00FE3EC8                 db  6Eh ; n
00FE3EC9                 db  61h ; a
00FE3ECA                 db  6Dh ; m
00FE3ECB                 db  69h ; i
00FE3ECC                 db  63h ; c
00FE3ECD                 db  41h ; A
00FE3ECE                 db  72h ; r
00FE3ECF                 db  72h ; r
00FE3ED0                 db  61h ; a
00FE3ED1                 db  79h ; y
00FE3ED2                 db  2Eh ; .
00FE3ED3                 db  69h ; i
00FE3ED4                 db  6Eh ; n
00FE3ED5                 db  6Ch ; l
00FE3ED6                 db    0
00FE3ED7                 db    0
00FE3ED8                 db  6Eh ; n
00FE3ED9                 db  6Fh ; o
00FE3EDA                 db  6Eh ; n
00FE3EDB                 db  65h ; e
00FE3EDC                 db    0
00FE3EDD                 db    0
00FE3EDE                 db    0
00FE3EDF                 db    0
00FE3EE0                 db  28h ; (
00FE3EE1                 db  21h ; !
00FE3EE2                 db  20h
00FE3EE3                 db  74h ; t
00FE3EE4                 db  68h ; h
00FE3EE5                 db  69h ; i
00FE3EE6                 db  73h ; s
00FE3EE7                 db  2Dh ; -
00FE3EE8                 db  3Eh ; >
00FE3EE9                 db  49h ; I
00FE3EEA                 db  73h ; s
00FE3EEB                 db  46h ; F
00FE3EEC                 db  69h ; i
00FE3EED                 db  78h ; x
00FE3EEE                 db  65h ; e
00FE3EEF                 db  64h ; d
00FE3EF0                 db  42h ; B
00FE3EF1                 db  75h ; u
00FE3EF2                 db  66h ; f
00FE3EF3                 db  66h ; f
00FE3EF4                 db  65h ; e
00FE3EF5                 db  72h ; r
00FE3EF6                 db  41h ; A
00FE3EF7                 db  72h ; r
00FE3EF8                 db  72h ; r
00FE3EF9                 db  61h ; a
00FE3EFA                 db  79h ; y
00FE3EFB                 db  28h ; (
00FE3EFC                 db  29h ; )
00FE3EFD                 db  29h ; )
00FE3EFE                 db  20h
00FE3EFF                 db  26h ; &
00FE3F00                 db  26h ; &
00FE3F01                 db  20h
00FE3F02                 db  22h ; "
00FE3F03                 db  82h
00FE3F04                 db 0A8h
00FE3F05                 db  82h
00FE3F06                 db 0A9h
00FE3F07                 db  82h
00FE3F08                 db 0B5h
00FE3F09                 db  82h
00FE3F0A                 db 0A2h
00FE3F0B                 db  2Eh ; .
00FE3F0C                 db  2Eh ; .
00FE3F0D                 db  2Eh ; .
00FE3F0E                 db  22h ; "
00FE3F0F                 db    0
00FE3F10                 db  25h ; %
00FE3F11                 db  73h ; s
00FE3F12                 db  28h ; (
00FE3F13                 db  25h ; %
00FE3F14                 db  64h ; d
00FE3F15                 db  29h ; )
00FE3F16                 db  3Ah ; :
00FE3F17                 db  5Bh ; [
00FE3F18                 db  25h ; %
00FE3F19                 db  73h ; s
00FE3F1A                 db  5Dh ; ]
00FE3F1B                 db  20h
00FE3F1C                 db  3Ch ; <
00FE3F1D                 db  61h ; a
00FE3F1E                 db  73h ; s
00FE3F1F                 db  73h ; s
00FE3F20                 db  65h ; e
00FE3F21                 db  72h ; r
00FE3F22                 db  74h ; t
00FE3F23                 db  3Eh ; >
00FE3F24                 db  20h
00FE3F25                 db  28h ; (
00FE3F26                 db  25h ; %
00FE3F27                 db  73h ; s
00FE3F28                 db  29h ; )
00FE3F29                 db  20h
00FE3F2A                 db  25h ; %
00FE3F2B                 db  73h ; s
00FE3F2C                 db  0Ah
00FE3F2D                 db    0
00FE3F2E                 db    0
00FE3F2F                 db    0
00FE3F30                 db  25h ; %
00FE3F31                 db  73h ; s
00FE3F32                 db  28h ; (
00FE3F33                 db  25h ; %
00FE3F34                 db  64h ; d
00FE3F35                 db  29h ; )
00FE3F36                 db  3Ah ; :
00FE3F37                 db  20h
00FE3F38                 db  3Ch ; <
00FE3F39                 db  61h ; a
00FE3F3A                 db  73h ; s
00FE3F3B                 db  73h ; s
00FE3F3C                 db  65h ; e
00FE3F3D                 db  72h ; r
00FE3F3E                 db  74h ; t
00FE3F3F                 db  3Eh ; >
00FE3F40                 db  20h
00FE3F41                 db  28h ; (
00FE3F42                 db  25h ; %
00FE3F43                 db  73h ; s
00FE3F44                 db  29h ; )
00FE3F45                 db  20h
00FE3F46                 db  25h ; %
00FE3F47                 db  73h ; s
00FE3F48                 db  0Ah
00FE3F49                 db    0
00FE3F4A                 db    0
00FE3F4B                 db    0
00FE3F4C                 db  43h ; C
00FE3F4D                 db  44h ; D
00FE3F4E                 db  65h ; e
00FE3F4F                 db  76h ; v
00FE3F50                 db  2Eh ; .
00FE3F51                 db  45h ; E
00FE3F52                 db  6Eh ; n
00FE3F53                 db  67h ; g
00FE3F54                 db  69h ; i
00FE3F55                 db  6Eh ; n
00FE3F56                 db  65h ; e
00FE3F57                 db  2Eh ; .
00FE3F58                 db  4Ch ; L
00FE3F59                 db  61h ; a
00FE3F5A                 db  79h ; y
00FE3F5B                 db  2Eh ; .
00FE3F5C                 db  43h ; C
00FE3F5D                 db  6Fh ; o
00FE3F5E                 db  6Dh ; m
00FE3F5F                 db  6Dh ; m
00FE3F60                 db  6Fh ; o
00FE3F61                 db  6Eh ; n
00FE3F62                 db  2Eh ; .
00FE3F63                 db  65h ; e
00FE3F64                 db  74h ; t
00FE3F65                 db  63h ; c
00FE3F66                 db    0
00FE3F67                 db    0
00FE3F68                 db  3Fh ; ?
00FE3F69                 db  52h ; R
00FE3F6A                 db  65h ; e
00FE3F6B                 db  73h ; s
00FE3F6C                 db  65h ; e
00FE3F6D                 db  74h ; t
00FE3F6E                 db  40h ; @
00FE3F6F                 db  3Fh ; ?
00FE3F70                 db  24h ; $
00FE3F71                 db  54h ; T
00FE3F72                 db  46h ; F
00FE3F73                 db  69h ; i
00FE3F74                 db  78h ; x
00FE3F75                 db  65h ; e
00FE3F76                 db  64h ; d
00FE3F77                 db  4Dh ; M
00FE3F78                 db  65h ; e
00FE3F79                 db  6Dh ; m
00FE3F7A                 db  6Fh ; o
00FE3F7B                 db  72h ; r
00FE3F7C                 db  79h ; y
00FE3F7D                 db  40h ; @
00FE3F7E                 db  56h ; V
00FE3F7F                 db  3Fh ; ?
00FE3F80                 db  24h ; $
00FE3F81                 db  54h ; T
00FE3F82                 db  4Ch ; L
00FE3F83                 db  69h ; i
00FE3F84                 db  73h ; s
00FE3F85                 db  74h ; t
00FE3F86                 db  45h ; E
00FE3F87                 db  6Ch ; l
00FE3F88                 db  65h ; e
00FE3F89                 db  6Dh ; m
00FE3F8A                 db  40h ; @
00FE3F8B                 db  50h ; P
00FE3F8C                 db  41h ; A
00FE3F8D                 db  58h ; X
00FE3F8E                 db  40h ; @
00FE3F8F                 db  3Fh ; ?
00FE3F90                 db  24h ; $
00FE3F91                 db  54h ; T
00FE3F92                 db  46h ; F
00FE3F93                 db  69h ; i
00FE3F94                 db  78h ; x
00FE3F95                 db  65h ; e
00FE3F96                 db  64h ; d
00FE3F97                 db  41h ; A
00FE3F98                 db  72h ; r
00FE3F99                 db  72h ; r
00FE3F9A                 db  61h ; a
00FE3F9B                 db  79h ; y
00FE3F9C                 db  65h ; e
00FE3F9D                 db  64h ; d
00FE3F9E                 db  4Ch ; L
00FE3F9F                 db  69h ; i
00FE3FA0                 db  73h ; s
00FE3FA1                 db  74h ; t
00FE3FA2                 db  40h ; @
00FE3FA3                 db  50h ; P
00FE3FA4                 db  41h ; A
00FE3FA5                 db  58h ; X
00FE3FA6                 db  40h ; @
00FE3FA7                 db  43h ; C
00FE3FA8                 db  6Fh ; o
00FE3FA9                 db  6Dh ; m
00FE3FAA                 db  6Dh ; m
00FE3FAB                 db  6Fh ; o
00FE3FAC                 db  6Eh ; n
00FE3FAD                 db  40h ; @
00FE3FAE                 db  53h ; S
00FE3FAF                 db  74h ; t
00FE3FB0                 db  65h ; e
00FE3FB1                 db  6Ch ; l
00FE3FB2                 db  6Ch ; l
00FE3FB3                 db  61h ; a
00FE3FB4                 db  40h ; @
00FE3FB5                 db  4Ch ; L
00FE3FB6                 db  61h ; a
00FE3FB7                 db  79h ; y
00FE3FB8                 db  40h ; @
00FE3FB9                 db  45h ; E
00FE3FBA                 db  6Eh ; n
00FE3FBB                 db  67h ; g
00FE3FBC                 db  69h ; i
00FE3FBD                 db  6Eh ; n
00FE3FBE                 db  65h ; e
00FE3FBF                 db  40h ; @
00FE3FC0                 db  43h ; C
00FE3FC1                 db  44h ; D
00FE3FC2                 db  65h ; e
00FE3FC3                 db  76h ; v
00FE3FC4                 db  40h ; @
00FE3FC5                 db  53h ; S
00FE3FC6                 db  51h ; Q
00FE3FC7                 db  45h ; E
00FE3FC8                 db  58h ; X
00FE3FC9                 db  40h ; @
00FE3FCA                 db  40h ; @
00FE3FCB                 db  40h ; @
00FE3FCC                 db  43h ; C
00FE3FCD                 db  6Fh ; o
00FE3FCE                 db  6Dh ; m
00FE3FCF                 db  6Dh ; m
00FE3FD0                 db  6Fh ; o
00FE3FD1                 db  6Eh ; n
00FE3FD2                 db  40h ; @
00FE3FD3                 db  53h ; S
00FE3FD4                 db  74h ; t
00FE3FD5                 db  65h ; e
00FE3FD6                 db  6Ch ; l
00FE3FD7                 db  6Ch ; l
00FE3FD8                 db  61h ; a
00FE3FD9                 db  40h ; @
00FE3FDA                 db  4Ch ; L
00FE3FDB                 db  61h ; a
00FE3FDC                 db  79h ; y
00FE3FDD                 db  40h ; @
00FE3FDE                 db  45h ; E
00FE3FDF                 db  6Eh ; n
00FE3FE0                 db  67h ; g
00FE3FE1                 db  69h ; i
00FE3FE2                 db  6Eh ; n
00FE3FE3                 db  65h ; e
00FE3FE4                 db  40h ; @
00FE3FE5                 db  43h ; C
00FE3FE6                 db  44h ; D
00FE3FE7                 db  65h ; e
00FE3FE8                 db  76h ; v
00FE3FE9                 db  40h ; @
00FE3FEA                 db  53h ; S
00FE3FEB                 db  51h ; Q
00FE3FEC                 db  45h ; E
00FE3FED                 db  58h ; X
00FE3FEE                 db  40h ; @
00FE3FEF                 db  40h ; @
00FE3FF0                 db  51h ; Q
00FE3FF1                 db  41h ; A
00FE3FF2                 db  45h ; E
00FE3FF3                 db  58h ; X
00FE3FF4                 db  50h ; P
00FE3FF5                 db  41h ; A
00FE3FF6                 db  56h ; V
00FE3FF7                 db  3Fh ; ?
00FE3FF8                 db  24h ; $
00FE3FF9                 db  54h ; T
00FE3FFA                 db  4Ch ; L
00FE3FFB                 db  69h ; i
00FE3FFC                 db  73h ; s
00FE3FFD                 db  74h ; t
00FE3FFE                 db  45h ; E
00FE3FFF                 db  6Ch ; l
00FE4000                 db  65h ; e
00FE4001                 db  6Dh ; m
00FE4002                 db  40h ; @
00FE4003                 db  50h ; P
00FE4004                 db  41h ; A
00FE4005                 db  58h ; X
00FE4006                 db  40h ; @
00FE4007                 db  3Fh ; ?
00FE4008                 db  24h ; $
00FE4009                 db  54h ; T
00FE400A                 db  46h ; F
00FE400B                 db  69h ; i
00FE400C                 db  78h ; x
00FE400D                 db  65h ; e
00FE400E                 db  64h ; d
00FE400F                 db  41h ; A
00FE4010                 db  72h ; r
00FE4011                 db  72h ; r
00FE4012                 db  61h ; a
00FE4013                 db  79h ; y
00FE4014                 db  65h ; e
00FE4015                 db  64h ; d
00FE4016                 db  4Ch ; L
00FE4017                 db  69h ; i
00FE4018                 db  73h ; s
00FE4019                 db  74h ; t
00FE401A                 db  40h ; @
00FE401B                 db  50h ; P
00FE401C                 db  41h ; A
00FE401D                 db  58h ; X
00FE401E                 db  40h ; @
00FE401F                 db  32h ; 2
00FE4020                 db  33h ; 3
00FE4021                 db  34h ; 4
00FE4022                 db  35h ; 5
00FE4023                 db  36h ; 6
00FE4024                 db  37h ; 7
00FE4025                 db  40h ; @
00FE4026                 db  50h ; P
00FE4027                 db  41h ; A
00FE4028                 db  47h ; G
00FE4029                 db  47h ; G
00FE402A                 db  40h ; @
00FE402B                 db  5Ah ; Z
00FE402C                 db    0
00FE402D                 db    0
00FE402E                 db    0
00FE402F                 db    0
00FE4030                 db  64h ; d
00FE4031                 db  3Ah ; :
00FE4032                 db  5Ch ; \
00FE4033                 db  72h ; r
00FE4034                 db  61h ; a
00FE4035                 db  70h ; p
00FE4036                 db  74h ; t
00FE4037                 db  75h ; u
00FE4038                 db  72h ; r
00FE4039                 db  65h ; e
00FE403A                 db  5Ch ; \
00FE403B                 db  73h ; s
00FE403C                 db  72h ; r
00FE403D                 db  63h ; c
00FE403E                 db  5Ch ; \
00FE403F                 db  65h ; e
00FE4040                 db  78h ; x
00FE4041                 db  74h ; t
00FE4042                 db  65h ; e
00FE4043                 db  72h ; r
00FE4044                 db  6Eh ; n
00FE4045                 db  61h ; a
00FE4046                 db  6Ch ; l
00FE4047                 db  73h ; s
00FE4048                 db  64h ; d
00FE4049                 db  6Bh ; k
00FE404A                 db  5Ch ; \
00FE404B                 db  63h ; c
00FE404C                 db  64h ; d
00FE404D                 db  65h ; e
00FE404E                 db  76h ; v
00FE404F                 db  5Ch ; \
00FE4050                 db  69h ; i
00FE4051                 db  6Eh ; n
00FE4052                 db  63h ; c
00FE4053                 db  6Ch ; l
00FE4054                 db  75h ; u
00FE4055                 db  64h ; d
00FE4056                 db  65h ; e
00FE4057                 db  5Ch ; \
00FE4058                 db  63h ; c
00FE4059                 db  64h ; d
00FE405A                 db  65h ; e
00FE405B                 db  76h ; v
00FE405C                 db  5Ch ; \
00FE405D                 db  65h ; e
00FE405E                 db  6Eh ; n
00FE405F                 db  67h ; g
00FE4060                 db  69h ; i
00FE4061                 db  6Eh ; n
00FE4062                 db  65h ; e
00FE4063                 db  5Ch ; \
00FE4064                 db  6Ch ; l
00FE4065                 db  61h ; a
00FE4066                 db  79h ; y
00FE4067                 db  5Ch ; \
00FE4068                 db  73h ; s
00FE4069                 db  74h ; t
00FE406A                 db  65h ; e
00FE406B                 db  6Ch ; l
00FE406C                 db  6Ch ; l
00FE406D                 db  61h ; a
00FE406E                 db  5Ch ; \
00FE406F                 db  63h ; c
00FE4070                 db  6Fh ; o
00FE4071                 db  6Dh ; m
00FE4072                 db  6Dh ; m
00FE4073                 db  6Fh ; o
00FE4074                 db  6Eh ; n
00FE4075                 db  5Ch ; \
00FE4076                 db  46h ; F
00FE4077                 db  69h ; i
00FE4078                 db  78h ; x
00FE4079                 db  65h ; e
00FE407A                 db  64h ; d
00FE407B                 db  4Dh ; M
00FE407C                 db  65h ; e
00FE407D                 db  6Dh ; m
00FE407E                 db  6Fh ; o
00FE407F                 db  72h ; r
00FE4080                 db  79h ; y
00FE4081                 db  2Eh ; .
00FE4082                 db  69h ; i
00FE4083                 db  6Eh ; n
00FE4084                 db  6Ch ; l
00FE4085                 db    0
00FE4086                 db    0
00FE4087                 db    0
00FE4088                 db  6Eh ; n
00FE4089                 db  6Fh ; o
00FE408A                 db  6Eh ; n
00FE408B                 db  65h ; e
00FE408C                 db    0
00FE408D                 db    0
00FE408E                 db    0
00FE408F                 db    0
00FE4090                 db  6Dh ; m
00FE4091                 db  5Fh ; _
00FE4092                 db  61h ; a
00FE4093                 db  44h ; D
00FE4094                 db  61h ; a
00FE4095                 db  74h ; t
00FE4096                 db  61h ; a
00FE4097                 db  20h
00FE4098                 db  26h ; &
00FE4099                 db  26h ; &
00FE409A                 db  20h
00FE409B                 db  22h ; "
00FE409C                 db  83h
00FE409D                 db  66h ; f
00FE409E                 db  81h
00FE409F                 db  5Bh ; [
00FE40A0                 db  83h
00FE40A1                 db  5Eh ; ^
00FE40A2                 db  83h
00FE40A3                 db  81h
00FE40A4                 db  83h
00FE40A5                 db  82h
00FE40A6                 db  83h
00FE40A7                 db  8Ah
00FE40A8                 db  82h
00FE40A9                 db 0AAh
00FE40AA                 db  90h
00FE40AB                 db 0DDh
00FE40AC                 db  92h
00FE40AD                 db 0E8h
00FE40AE                 db  82h
00FE40AF                 db 0B3h
00FE40B0                 db  82h
00FE40B1                 db 0EAh
00FE40B2                 db  82h
00FE40B3                 db 0DCh
00FE40B4                 db  82h
00FE40B5                 db 0B9h
00FE40B6                 db  82h
00FE40B7                 db 0F1h
00FE40B8                 db  82h
00FE40B9                 db 0C5h
00FE40BA                 db  82h
00FE40BB                 db 0B5h
00FE40BC                 db  82h
00FE40BD                 db 0BDh
00FE40BE                 db  22h ; "
00FE40BF                 db    0
00FE40C0                 db  83h
00FE40C1                 db  66h ; f
00FE40C2                 db  81h
00FE40C3                 db  5Bh ; [
00FE40C4                 db  83h
00FE40C5                 db  5Eh ; ^
00FE40C6                 db  83h
00FE40C7                 db  81h
00FE40C8                 db  83h
00FE40C9                 db  82h
00FE40CA                 db  83h
00FE40CB                 db  8Ah
00FE40CC                 db  82h
00FE40CD                 db 0AAh
00FE40CE                 db  90h
00FE40CF                 db 0DDh
00FE40D0                 db  92h
00FE40D1                 db 0E8h
00FE40D2                 db  82h
00FE40D3                 db 0B3h
00FE40D4                 db  82h
00FE40D5                 db 0EAh
00FE40D6                 db  82h
00FE40D7                 db 0DCh
00FE40D8                 db  82h
00FE40D9                 db 0B9h
00FE40DA                 db  82h
00FE40DB                 db 0F1h
00FE40DC                 db  82h
00FE40DD                 db 0C5h
00FE40DE                 db  82h
00FE40DF                 db 0B5h
00FE40E0                 db  82h
00FE40E1                 db 0BDh
00FE40E2                 db    0
00FE40E3                 db    0
00FE40E4                 db    0
00FE40E5                 db    0
00FE40E6                 db    0
00FE40E7                 db    0
00FE40E8                 db  3Fh ; ?
00FE40E9                 db  52h ; R
00FE40EA                 db  65h ; e
00FE40EB                 db  73h ; s
00FE40EC                 db  65h ; e
00FE40ED                 db  74h ; t
00FE40EE                 db  40h ; @
00FE40EF                 db  3Fh ; ?
00FE40F0                 db  24h ; $
00FE40F1                 db  54h ; T
00FE40F2                 db  46h ; F
00FE40F3                 db  69h ; i
00FE40F4                 db  78h ; x
00FE40F5                 db  65h ; e
00FE40F6                 db  64h ; d
00FE40F7                 db  4Dh ; M
00FE40F8                 db  65h ; e
00FE40F9                 db  6Dh ; m
00FE40FA                 db  6Fh ; o
00FE40FB                 db  72h ; r
00FE40FC                 db  79h ; y
00FE40FD                 db  40h ; @
00FE40FE                 db  56h ; V
00FE40FF                 db  3Fh ; ?
00FE4100                 db  24h ; $
00FE4101                 db  54h ; T
00FE4102                 db  4Ch ; L
00FE4103                 db  69h ; i
00FE4104                 db  73h ; s
00FE4105                 db  74h ; t
00FE4106                 db  45h ; E
00FE4107                 db  6Ch ; l
00FE4108                 db  65h ; e
00FE4109                 db  6Dh ; m
00FE410A                 db  40h ; @
00FE410B                 db  50h ; P
00FE410C                 db  41h ; A
00FE410D                 db  58h ; X
00FE410E                 db  40h ; @
00FE410F                 db  3Fh ; ?
00FE4110                 db  24h ; $
00FE4111                 db  54h ; T
00FE4112                 db  46h ; F
00FE4113                 db  69h ; i
00FE4114                 db  78h ; x
00FE4115                 db  65h ; e
00FE4116                 db  64h ; d
00FE4117                 db  41h ; A
00FE4118                 db  72h ; r
00FE4119                 db  72h ; r
00FE411A                 db  61h ; a
00FE411B                 db  79h ; y
00FE411C                 db  65h ; e
00FE411D                 db  64h ; d
00FE411E                 db  4Ch ; L
00FE411F                 db  69h ; i
00FE4120                 db  73h ; s
00FE4121                 db  74h ; t
00FE4122                 db  40h ; @
00FE4123                 db  50h ; P
00FE4124                 db  41h ; A
00FE4125                 db  58h ; X
00FE4126                 db  40h ; @
00FE4127                 db  43h ; C
00FE4128                 db  6Fh ; o
00FE4129                 db  6Dh ; m
00FE412A                 db  6Dh ; m
00FE412B                 db  6Fh ; o
00FE412C                 db  6Eh ; n
00FE412D                 db  40h ; @
00FE412E                 db  53h ; S
00FE412F                 db  74h ; t
00FE4130                 db  65h ; e
00FE4131                 db  6Ch ; l
00FE4132                 db  6Ch ; l
00FE4133                 db  61h ; a
00FE4134                 db  40h ; @
00FE4135                 db  4Ch ; L
00FE4136                 db  61h ; a
00FE4137                 db  79h ; y
00FE4138                 db  40h ; @
00FE4139                 db  45h ; E
00FE413A                 db  6Eh ; n
00FE413B                 db  67h ; g
00FE413C                 db  69h ; i
00FE413D                 db  6Eh ; n
00FE413E                 db  65h ; e
00FE413F                 db  40h ; @
00FE4140                 db  43h ; C
00FE4141                 db  44h ; D
00FE4142                 db  65h ; e
00FE4143                 db  76h ; v
00FE4144                 db  40h ; @
00FE4145                 db  53h ; S
00FE4146                 db  51h ; Q
00FE4147                 db  45h ; E
00FE4148                 db  58h ; X
00FE4149                 db  40h ; @
00FE414A                 db  40h ; @
00FE414B                 db  40h ; @
00FE414C                 db  43h ; C
00FE414D                 db  6Fh ; o
00FE414E                 db  6Dh ; m
00FE414F                 db  6Dh ; m
00FE4150                 db  6Fh ; o
00FE4151                 db  6Eh ; n
00FE4152                 db  40h ; @
00FE4153                 db  53h ; S
00FE4154                 db  74h ; t
00FE4155                 db  65h ; e
00FE4156                 db  6Ch ; l
00FE4157                 db  6Ch ; l
00FE4158                 db  61h ; a
00FE4159                 db  40h ; @
00FE415A                 db  4Ch ; L
00FE415B                 db  61h ; a
00FE415C                 db  79h ; y
00FE415D                 db  40h ; @
00FE415E                 db  45h ; E
00FE415F                 db  6Eh ; n
00FE4160                 db  67h ; g
00FE4161                 db  69h ; i
00FE4162                 db  6Eh ; n
00FE4163                 db  65h ; e
00FE4164                 db  40h ; @
00FE4165                 db  43h ; C
00FE4166                 db  44h ; D
00FE4167                 db  65h ; e
00FE4168                 db  76h ; v
00FE4169                 db  40h ; @
00FE416A                 db  53h ; S
00FE416B                 db  51h ; Q
00FE416C                 db  45h ; E
00FE416D                 db  58h ; X
00FE416E                 db  40h ; @
00FE416F                 db  40h ; @
00FE4170                 db  51h ; Q
00FE4171                 db  41h ; A
00FE4172                 db  45h ; E
00FE4173                 db  58h ; X
00FE4174                 db  50h ; P
00FE4175                 db  41h ; A
00FE4176                 db  56h ; V
00FE4177                 db  3Fh ; ?
00FE4178                 db  24h ; $
00FE4179                 db  54h ; T
00FE417A                 db  4Ch ; L
00FE417B                 db  69h ; i
00FE417C                 db  73h ; s
00FE417D                 db  74h ; t
00FE417E                 db  45h ; E
00FE417F                 db  6Ch ; l
00FE4180                 db  65h ; e
00FE4181                 db  6Dh ; m
00FE4182                 db  40h ; @
00FE4183                 db  50h ; P
00FE4184                 db  41h ; A
00FE4185                 db  58h ; X
00FE4186                 db  40h ; @
00FE4187                 db  3Fh ; ?
00FE4188                 db  24h ; $
00FE4189                 db  54h ; T
00FE418A                 db  46h ; F
00FE418B                 db  69h ; i
00FE418C                 db  78h ; x
00FE418D                 db  65h ; e
00FE418E                 db  64h ; d
00FE418F                 db  41h ; A
00FE4190                 db  72h ; r
00FE4191                 db  72h ; r
00FE4192                 db  61h ; a
00FE4193                 db  79h ; y
00FE4194                 db  65h ; e
00FE4195                 db  64h ; d
00FE4196                 db  4Ch ; L
00FE4197                 db  69h ; i
00FE4198                 db  73h ; s
00FE4199                 db  74h ; t
00FE419A                 db  40h ; @
00FE419B                 db  50h ; P
00FE419C                 db  41h ; A
00FE419D                 db  58h ; X
00FE419E                 db  40h ; @
00FE419F                 db  32h ; 2
00FE41A0                 db  33h ; 3
00FE41A1                 db  34h ; 4
00FE41A2                 db  35h ; 5
00FE41A3                 db  36h ; 6
00FE41A4                 db  37h ; 7
00FE41A5                 db  40h ; @
00FE41A6                 db  50h ; P
00FE41A7                 db  41h ; A
00FE41A8                 db  47h ; G
00FE41A9                 db  47h ; G
00FE41AA                 db  40h ; @
00FE41AB                 db  5Ah ; Z
00FE41AC                 db    0
00FE41AD                 db    0
00FE41AE                 db    0
00FE41AF                 db    0
00FE41B0                 db  64h ; d
00FE41B1                 db  3Ah ; :
00FE41B2                 db  5Ch ; \
00FE41B3                 db  72h ; r
00FE41B4                 db  61h ; a
00FE41B5                 db  70h ; p
00FE41B6                 db  74h ; t
00FE41B7                 db  75h ; u
00FE41B8                 db  72h ; r
00FE41B9                 db  65h ; e
00FE41BA                 db  5Ch ; \
00FE41BB                 db  73h ; s
00FE41BC                 db  72h ; r
00FE41BD                 db  63h ; c
00FE41BE                 db  5Ch ; \
00FE41BF                 db  65h ; e
00FE41C0                 db  78h ; x
00FE41C1                 db  74h ; t
00FE41C2                 db  65h ; e
00FE41C3                 db  72h ; r
00FE41C4                 db  6Eh ; n
00FE41C5                 db  61h ; a
00FE41C6                 db  6Ch ; l
00FE41C7                 db  73h ; s
00FE41C8                 db  64h ; d
00FE41C9                 db  6Bh ; k
00FE41CA                 db  5Ch ; \
00FE41CB                 db  63h ; c
00FE41CC                 db  64h ; d
00FE41CD                 db  65h ; e
00FE41CE                 db  76h ; v
00FE41CF                 db  5Ch ; \
00FE41D0                 db  69h ; i
00FE41D1                 db  6Eh ; n
00FE41D2                 db  63h ; c
00FE41D3                 db  6Ch ; l
00FE41D4                 db  75h ; u
00FE41D5                 db  64h ; d
00FE41D6                 db  65h ; e
00FE41D7                 db  5Ch ; \
00FE41D8                 db  63h ; c
00FE41D9                 db  64h ; d
00FE41DA                 db  65h ; e
00FE41DB                 db  76h ; v
00FE41DC                 db  5Ch ; \
00FE41DD                 db  65h ; e
00FE41DE                 db  6Eh ; n
00FE41DF                 db  67h ; g
00FE41E0                 db  69h ; i
00FE41E1                 db  6Eh ; n
00FE41E2                 db  65h ; e
00FE41E3                 db  5Ch ; \
00FE41E4                 db  6Ch ; l
00FE41E5                 db  61h ; a
00FE41E6                 db  79h ; y
00FE41E7                 db  5Ch ; \
00FE41E8                 db  73h ; s
00FE41E9                 db  74h ; t
00FE41EA                 db  65h ; e
00FE41EB                 db  6Ch ; l
00FE41EC                 db  6Ch ; l
00FE41ED                 db  61h ; a
00FE41EE                 db  5Ch ; \
00FE41EF                 db  63h ; c
00FE41F0                 db  6Fh ; o
00FE41F1                 db  6Dh ; m
00FE41F2                 db  6Dh ; m
00FE41F3                 db  6Fh ; o
00FE41F4                 db  6Eh ; n
00FE41F5                 db  5Ch ; \
00FE41F6                 db  46h ; F
00FE41F7                 db  69h ; i
00FE41F8                 db  78h ; x
00FE41F9                 db  65h ; e
00FE41FA                 db  64h ; d
00FE41FB                 db  4Dh ; M
00FE41FC                 db  65h ; e
00FE41FD                 db  6Dh ; m
00FE41FE                 db  6Fh ; o
00FE41FF                 db  72h ; r
00FE4200                 db  79h ; y
00FE4201                 db  2Eh ; .
00FE4202                 db  69h ; i
00FE4203                 db  6Eh ; n
00FE4204                 db  6Ch ; l
00FE4205                 db    0
00FE4206                 db    0
00FE4207                 db    0
00FE4208                 db  6Eh ; n
00FE4209                 db  6Fh ; o
00FE420A                 db  6Eh ; n
00FE420B                 db  65h ; e
00FE420C                 db    0
00FE420D                 db    0
00FE420E                 db    0
00FE420F                 db    0
00FE4210                 db  6Dh ; m
00FE4211                 db  5Fh ; _
00FE4212                 db  61h ; a
00FE4213                 db  75h ; u
00FE4214                 db  46h ; F
00FE4215                 db  72h ; r
00FE4216                 db  65h ; e
00FE4217                 db  65h ; e
00FE4218                 db  44h ; D
00FE4219                 db  61h ; a
00FE421A                 db  74h ; t
00FE421B                 db  61h ; a
00FE421C                 db  49h ; I
00FE421D                 db  6Eh ; n
00FE421E                 db  64h ; d
00FE421F                 db  69h ; i
00FE4220                 db  63h ; c
00FE4221                 db  65h ; e
00FE4222                 db  73h ; s
00FE4223                 db  20h
00FE4224                 db  26h ; &
00FE4225                 db  26h ; &
00FE4226                 db  20h
00FE4227                 db  22h ; "
00FE4228                 db  46h ; F
00FE4229                 db  72h ; r
00FE422A                 db  65h ; e
00FE422B                 db  65h ; e
00FE422C                 db  4Ch ; L
00FE422D                 db  69h ; i
00FE422E                 db  73h ; s
00FE422F                 db  74h ; t
00FE4230                 db  20h
00FE4231                 db  49h ; I
00FE4232                 db  6Eh ; n
00FE4233                 db  64h ; d
00FE4234                 db  65h ; e
00FE4235                 db  78h ; x
00FE4236                 db  97h
00FE4237                 db  70h ; p
00FE4238                 db  82h
00FE4239                 db 0CCh
00FE423A                 db  83h
00FE423B                 db  81h
00FE423C                 db  83h
00FE423D                 db  82h
00FE423E                 db  83h
00FE423F                 db  8Ah
00FE4240                 db  82h
00FE4241                 db 0AAh
00FE4242                 db  90h
00FE4243                 db 0DDh
00FE4244                 db  92h
00FE4245                 db 0E8h
00FE4246                 db  82h
00FE4247                 db 0B3h
00FE4248                 db  82h
00FE4249                 db 0EAh
00FE424A                 db  82h
00FE424B                 db 0DCh
00FE424C                 db  82h
00FE424D                 db 0B9h
00FE424E                 db  82h
00FE424F                 db 0F1h
00FE4250                 db  82h
00FE4251                 db 0C5h
00FE4252                 db  82h
00FE4253                 db 0B5h
00FE4254                 db  82h
00FE4255                 db 0BDh
00FE4256                 db  22h ; "
00FE4257                 db    0
00FE4258                 db  46h ; F
00FE4259                 db  72h ; r
00FE425A                 db  65h ; e
00FE425B                 db  65h ; e
00FE425C                 db  4Ch ; L
00FE425D                 db  69h ; i
00FE425E                 db  73h ; s
00FE425F                 db  74h ; t
00FE4260                 db  20h
00FE4261                 db  49h ; I
00FE4262                 db  6Eh ; n
00FE4263                 db  64h ; d
00FE4264                 db  65h ; e
00FE4265                 db  78h ; x
00FE4266                 db  97h
00FE4267                 db  70h ; p
00FE4268                 db  82h
00FE4269                 db 0CCh
00FE426A                 db  83h
00FE426B                 db  81h
00FE426C                 db  83h
00FE426D                 db  82h
00FE426E                 db  83h
00FE426F                 db  8Ah
00FE4270                 db  82h
00FE4271                 db 0AAh
00FE4272                 db  90h
00FE4273                 db 0DDh
00FE4274                 db  92h
00FE4275                 db 0E8h
00FE4276                 db  82h
00FE4277                 db 0B3h
00FE4278                 db  82h
00FE4279                 db 0EAh
00FE427A                 db  82h
00FE427B                 db 0DCh
00FE427C                 db  82h
00FE427D                 db 0B9h
00FE427E                 db  82h
00FE427F                 db 0F1h
00FE4280                 db  82h
00FE4281                 db 0C5h
00FE4282                 db  82h
00FE4283                 db 0B5h
00FE4284                 db  82h
00FE4285                 db 0BDh
00FE4286                 db    0
00FE4287                 db    0
00FE4288                 db  3Fh ; ?
00FE4289                 db  52h ; R
00FE428A                 db  65h ; e
00FE428B                 db  73h ; s
00FE428C                 db  65h ; e
00FE428D                 db  74h ; t
00FE428E                 db  40h ; @
00FE428F                 db  3Fh ; ?
00FE4290                 db  24h ; $
00FE4291                 db  54h ; T
00FE4292                 db  46h ; F
00FE4293                 db  69h ; i
00FE4294                 db  78h ; x
00FE4295                 db  65h ; e
00FE4296                 db  64h ; d
00FE4297                 db  4Dh ; M
00FE4298                 db  65h ; e
00FE4299                 db  6Dh ; m
00FE429A                 db  6Fh ; o
00FE429B                 db  72h ; r
00FE429C                 db  79h ; y
00FE429D                 db  40h ; @
00FE429E                 db  56h ; V
00FE429F                 db  3Fh ; ?
00FE42A0                 db  24h ; $
00FE42A1                 db  54h ; T
00FE42A2                 db  4Ch ; L
00FE42A3                 db  69h ; i
00FE42A4                 db  73h ; s
00FE42A5                 db  74h ; t
00FE42A6                 db  45h ; E
00FE42A7                 db  6Ch ; l
00FE42A8                 db  65h ; e
00FE42A9                 db  6Dh ; m
00FE42AA                 db  40h ; @
00FE42AB                 db  50h ; P
00FE42AC                 db  41h ; A
00FE42AD                 db  58h ; X
00FE42AE                 db  40h ; @
00FE42AF                 db  3Fh ; ?
00FE42B0                 db  24h ; $
00FE42B1                 db  54h ; T
00FE42B2                 db  46h ; F
00FE42B3                 db  69h ; i
00FE42B4                 db  78h ; x
00FE42B5                 db  65h ; e
00FE42B6                 db  64h ; d
00FE42B7                 db  41h ; A
00FE42B8                 db  72h ; r
00FE42B9                 db  72h ; r
00FE42BA                 db  61h ; a
00FE42BB                 db  79h ; y
00FE42BC                 db  65h ; e
00FE42BD                 db  64h ; d
00FE42BE                 db  4Ch ; L
00FE42BF                 db  69h ; i
00FE42C0                 db  73h ; s
00FE42C1                 db  74h ; t
00FE42C2                 db  40h ; @
00FE42C3                 db  50h ; P
00FE42C4                 db  41h ; A
00FE42C5                 db  58h ; X
00FE42C6                 db  40h ; @
00FE42C7                 db  43h ; C
00FE42C8                 db  6Fh ; o
00FE42C9                 db  6Dh ; m
00FE42CA                 db  6Dh ; m
00FE42CB                 db  6Fh ; o
00FE42CC                 db  6Eh ; n
00FE42CD                 db  40h ; @
00FE42CE                 db  53h ; S
00FE42CF                 db  74h ; t
00FE42D0                 db  65h ; e
00FE42D1                 db  6Ch ; l
00FE42D2                 db  6Ch ; l
00FE42D3                 db  61h ; a
00FE42D4                 db  40h ; @
00FE42D5                 db  4Ch ; L
00FE42D6                 db  61h ; a
00FE42D7                 db  79h ; y
00FE42D8                 db  40h ; @
00FE42D9                 db  45h ; E
00FE42DA                 db  6Eh ; n
00FE42DB                 db  67h ; g
00FE42DC                 db  69h ; i
00FE42DD                 db  6Eh ; n
00FE42DE                 db  65h ; e
00FE42DF                 db  40h ; @
00FE42E0                 db  43h ; C
00FE42E1                 db  44h ; D
00FE42E2                 db  65h ; e
00FE42E3                 db  76h ; v
00FE42E4                 db  40h ; @
00FE42E5                 db  53h ; S
00FE42E6                 db  51h ; Q
00FE42E7                 db  45h ; E
00FE42E8                 db  58h ; X
00FE42E9                 db  40h ; @
00FE42EA                 db  40h ; @
00FE42EB                 db  40h ; @
00FE42EC                 db  43h ; C
00FE42ED                 db  6Fh ; o
00FE42EE                 db  6Dh ; m
00FE42EF                 db  6Dh ; m
00FE42F0                 db  6Fh ; o
00FE42F1                 db  6Eh ; n
00FE42F2                 db  40h ; @
00FE42F3                 db  53h ; S
00FE42F4                 db  74h ; t
00FE42F5                 db  65h ; e
00FE42F6                 db  6Ch ; l
00FE42F7                 db  6Ch ; l
00FE42F8                 db  61h ; a
00FE42F9                 db  40h ; @
00FE42FA                 db  4Ch ; L
00FE42FB                 db  61h ; a
00FE42FC                 db  79h ; y
00FE42FD                 db  40h ; @
00FE42FE                 db  45h ; E
00FE42FF                 db  6Eh ; n
00FE4300                 db  67h ; g
00FE4301                 db  69h ; i
00FE4302                 db  6Eh ; n
00FE4303                 db  65h ; e
00FE4304                 db  40h ; @
00FE4305                 db  43h ; C
00FE4306                 db  44h ; D
00FE4307                 db  65h ; e
00FE4308                 db  76h ; v
00FE4309                 db  40h ; @
00FE430A                 db  53h ; S
00FE430B                 db  51h ; Q
00FE430C                 db  45h ; E
00FE430D                 db  58h ; X
00FE430E                 db  40h ; @
00FE430F                 db  40h ; @
00FE4310                 db  51h ; Q
00FE4311                 db  41h ; A
00FE4312                 db  45h ; E
00FE4313                 db  58h ; X
00FE4314                 db  50h ; P
00FE4315                 db  41h ; A
00FE4316                 db  56h ; V
00FE4317                 db  3Fh ; ?
00FE4318                 db  24h ; $
00FE4319                 db  54h ; T
00FE431A                 db  4Ch ; L
00FE431B                 db  69h ; i
00FE431C                 db  73h ; s
00FE431D                 db  74h ; t
00FE431E                 db  45h ; E
00FE431F                 db  6Ch ; l
00FE4320                 db  65h ; e
00FE4321                 db  6Dh ; m
00FE4322                 db  40h ; @
00FE4323                 db  50h ; P
00FE4324                 db  41h ; A
00FE4325                 db  58h ; X
00FE4326                 db  40h ; @
00FE4327                 db  3Fh ; ?
00FE4328                 db  24h ; $
00FE4329                 db  54h ; T
00FE432A                 db  46h ; F
00FE432B                 db  69h ; i
00FE432C                 db  78h ; x
00FE432D                 db  65h ; e
00FE432E                 db  64h ; d
00FE432F                 db  41h ; A
00FE4330                 db  72h ; r
00FE4331                 db  72h ; r
00FE4332                 db  61h ; a
00FE4333                 db  79h ; y
00FE4334                 db  65h ; e
00FE4335                 db  64h ; d
00FE4336                 db  4Ch ; L
00FE4337                 db  69h ; i
00FE4338                 db  73h ; s
00FE4339                 db  74h ; t
00FE433A                 db  40h ; @
00FE433B                 db  50h ; P
00FE433C                 db  41h ; A
00FE433D                 db  58h ; X
00FE433E                 db  40h ; @
00FE433F                 db  32h ; 2
00FE4340                 db  33h ; 3
00FE4341                 db  34h ; 4
00FE4342                 db  35h ; 5
00FE4343                 db  36h ; 6
00FE4344                 db  37h ; 7
00FE4345                 db  40h ; @
00FE4346                 db  50h ; P
00FE4347                 db  41h ; A
00FE4348                 db  47h ; G
00FE4349                 db  47h ; G
00FE434A                 db  40h ; @
00FE434B                 db  5Ah ; Z
00FE434C                 db    0
00FE434D                 db    0
00FE434E                 db    0
00FE434F                 db    0
00FE4350                 db  64h ; d
00FE4351                 db  3Ah ; :
00FE4352                 db  5Ch ; \
00FE4353                 db  72h ; r
00FE4354                 db  61h ; a
00FE4355                 db  70h ; p
00FE4356                 db  74h ; t
00FE4357                 db  75h ; u
00FE4358                 db  72h ; r
00FE4359                 db  65h ; e
00FE435A                 db  5Ch ; \
00FE435B                 db  73h ; s
00FE435C                 db  72h ; r
00FE435D                 db  63h ; c
00FE435E                 db  5Ch ; \
00FE435F                 db  65h ; e
00FE4360                 db  78h ; x
00FE4361                 db  74h ; t
00FE4362                 db  65h ; e
00FE4363                 db  72h ; r
00FE4364                 db  6Eh ; n
00FE4365                 db  61h ; a
00FE4366                 db  6Ch ; l
00FE4367                 db  73h ; s
00FE4368                 db  64h ; d
00FE4369                 db  6Bh ; k
00FE436A                 db  5Ch ; \
00FE436B                 db  63h ; c
00FE436C                 db  64h ; d
00FE436D                 db  65h ; e
00FE436E                 db  76h ; v
00FE436F                 db  5Ch ; \
00FE4370                 db  69h ; i
00FE4371                 db  6Eh ; n
00FE4372                 db  63h ; c
00FE4373                 db  6Ch ; l
00FE4374                 db  75h ; u
00FE4375                 db  64h ; d
00FE4376                 db  65h ; e
00FE4377                 db  5Ch ; \
00FE4378                 db  63h ; c
00FE4379                 db  64h ; d
00FE437A                 db  65h ; e
00FE437B                 db  76h ; v
00FE437C                 db  5Ch ; \
00FE437D                 db  65h ; e
00FE437E                 db  6Eh ; n
00FE437F                 db  67h ; g
00FE4380                 db  69h ; i
00FE4381                 db  6Eh ; n
00FE4382                 db  65h ; e
00FE4383                 db  5Ch ; \
00FE4384                 db  6Ch ; l
00FE4385                 db  61h ; a
00FE4386                 db  79h ; y
00FE4387                 db  5Ch ; \
00FE4388                 db  73h ; s
00FE4389                 db  74h ; t
00FE438A                 db  65h ; e
00FE438B                 db  6Ch ; l
00FE438C                 db  6Ch ; l
00FE438D                 db  61h ; a
00FE438E                 db  5Ch ; \
00FE438F                 db  63h ; c
00FE4390                 db  6Fh ; o
00FE4391                 db  6Dh ; m
00FE4392                 db  6Dh ; m
00FE4393                 db  6Fh ; o
00FE4394                 db  6Eh ; n
00FE4395                 db  5Ch ; \
00FE4396                 db  46h ; F
00FE4397                 db  69h ; i
00FE4398                 db  78h ; x
00FE4399                 db  65h ; e
00FE439A                 db  64h ; d
00FE439B                 db  4Dh ; M
00FE439C                 db  65h ; e
00FE439D                 db  6Dh ; m
00FE439E                 db  6Fh ; o
00FE439F                 db  72h ; r
00FE43A0                 db  79h ; y
00FE43A1                 db  2Eh ; .
00FE43A2                 db  69h ; i
00FE43A3                 db  6Eh ; n
00FE43A4                 db  6Ch ; l
00FE43A5                 db    0
00FE43A6                 db    0
00FE43A7                 db    0
00FE43A8                 db  6Eh ; n
00FE43A9                 db  6Fh ; o
00FE43AA                 db  6Eh ; n
00FE43AB                 db  65h ; e
00FE43AC                 db    0
00FE43AD                 db    0
00FE43AE                 db    0
00FE43AF                 db    0
00FE43B0                 db  28h ; (
00FE43B1                 db  30h ; 0
00FE43B2                 db  20h
00FE43B3                 db  3Ch ; <
00FE43B4                 db  20h
00FE43B5                 db  6Dh ; m
00FE43B6                 db  5Fh ; _
00FE43B7                 db  75h ; u
00FE43B8                 db  44h ; D
00FE43B9                 db  61h ; a
00FE43BA                 db  74h ; t
00FE43BB                 db  61h ; a
00FE43BC                 db  43h ; C
00FE43BD                 db  6Fh ; o
00FE43BE                 db  75h ; u
00FE43BF                 db  6Eh ; n
00FE43C0                 db  74h ; t
00FE43C1                 db  29h ; )
00FE43C2                 db  20h
00FE43C3                 db  26h ; &
00FE43C4                 db  26h ; &
00FE43C5                 db  20h
00FE43C6                 db  22h ; "
00FE43C7                 db  83h
00FE43C8                 db  66h ; f
00FE43C9                 db  81h
00FE43CA                 db  5Bh ; [
00FE43CB                 db  83h
00FE43CC                 db  5Eh ; ^
00FE43CD                 db  8Ch
00FE43CE                 db 0C2h
00FE43CF                 db  90h
00FE43D0                 db  94h
00FE43D1                 db  82h
00FE43D2                 db 0AAh
00FE43D3                 db  30h ; 0
00FE43D4                 db  82h
00FE43D5                 db 0C5h
00FE43D6                 db  82h
00FE43D7                 db 0CDh
00FE43D8                 db  88h
00FE43D9                 db 0D3h
00FE43DA                 db  96h
00FE43DB                 db 0A1h
00FE43DC                 db  82h
00FE43DD                 db 0AAh
00FE43DE                 db  82h
00FE43DF                 db 0A0h
00FE43E0                 db  82h
00FE43E1                 db 0E8h
00FE43E2                 db  82h
00FE43E3                 db 0DCh
00FE43E4                 db  82h
00FE43E5                 db 0B9h
00FE43E6                 db  82h
00FE43E7                 db 0F1h
00FE43E8                 db  22h ; "
00FE43E9                 db    0
00FE43EA                 db    0
00FE43EB                 db    0
00FE43EC                 db  83h
00FE43ED                 db  66h ; f
00FE43EE                 db  81h
00FE43EF                 db  5Bh ; [
00FE43F0                 db  83h
00FE43F1                 db  5Eh ; ^
00FE43F2                 db  8Ch
00FE43F3                 db 0C2h
00FE43F4                 db  90h
00FE43F5                 db  94h
00FE43F6                 db  82h
00FE43F7                 db 0AAh
00FE43F8                 db  30h ; 0
00FE43F9                 db  82h
00FE43FA                 db 0C5h
00FE43FB                 db  82h
00FE43FC                 db 0CDh
00FE43FD                 db  88h
00FE43FE                 db 0D3h
00FE43FF                 db  96h
00FE4400                 db 0A1h
00FE4401                 db  82h
00FE4402                 db 0AAh
00FE4403                 db  82h
00FE4404                 db 0A0h
00FE4405                 db  82h
00FE4406                 db 0E8h
00FE4407                 db  82h
00FE4408                 db 0DCh
00FE4409                 db  82h
00FE440A                 db 0B9h
00FE440B                 db  82h
00FE440C                 db 0F1h
00FE440D                 db    0
00FE440E                 db    0
00FE440F                 db    0
00FE4410                 db  3Ch ; <
00FE4411                 db  0Dh
00FE4412                 db  16h
00FE4413                 db    1
00FE4414 off_FE4414      dd offset loc_799FF0    ; DATA XREF: sub_7983C0+48â†‘o
00FE4414                                         ; sub_7989D0+2Eâ†‘o
00FE4418                 dd offset sub_846210
00FE441C                 dd offset sub_4105B0
00FE4420                 dd offset sub_6311A0
00FE4424                 dd offset sub_6311F0
00FE4428                 dd offset sub_631240
00FE442C                 dd offset sub_631290
00FE4430                 dd offset unk_1160CE0
00FE4434 off_FE4434      dd offset loc_79A010    ; DATA XREF: sub_7983C0+42â†‘o
00FE4434                                         ; sub_7989D0+28â†‘o
00FE4438                 dd offset sub_631C70
00FE443C                 dd offset sub_4437D0
00FE4440                 dd offset sub_631370
00FE4444                 dd offset sub_632760
00FE4448                 dd offset sub_631390
00FE444C                 dd offset sub_632440
00FE4450                 dd offset sub_631440
00FE4454                 dd offset sub_632AD0
00FE4458                 dd offset sub_6313C0
00FE445C                 dd offset sub_6313E0
00FE4460                 dd offset sub_631400
00FE4464                 dd offset nullsub_556
00FE4468                 dd offset nullsub_16
00FE446C                 dd offset sub_6D6F80
00FE4470                 dd offset nullsub_16
00FE4474                 dd offset sub_798470
00FE4478                 dd offset sub_798600
00FE447C                 dd offset sub_799FD0
00FE4480                 dd offset sub_799FE0
00FE4484                 dd offset sub_798890
00FE4488                 dd offset sub_798620
00FE448C                 dd offset sub_798630
00FE4490                 dd offset sub_798640
00FE4494                 dd offset sub_798A40
00FE4498 word_FE4498     dw 4B0h                 ; DATA XREF: sub_7987F0:loc_798800â†‘r
00FE449A byte_FE449A     db 1                    ; DATA XREF: sub_7987F0+34â†‘r
00FE449B                 align 4
00FE449C off_FE449C      dd offset off_12C45C0   ; DATA XREF: sub_7987F0+2Bâ†‘r
00FE449C                                         ; "fxpf_idle"
00FE44A0 dword_FE44A0    dd 25h                  ; DATA XREF: sub_7987F0+1Bâ†‘r
00FE44A4                 db  84h
00FE44A5                 db    3
00FE44A6                 db    0
00FE44A7                 db    0
00FE44A8                 db  58h ; X
00FE44A9                 db  46h ; F
00FE44AA                 db  2Ch ; ,
00FE44AB                 db    1
00FE44AC                 db  19h
00FE44AD                 db    0
00FE44AE                 db    0
00FE44AF                 db    0
00FE44B0                 db  20h
00FE44B1                 db    3
00FE44B2                 db    0
00FE44B3                 db    0
00FE44B4                 db 0BCh
00FE44B5                 db  46h ; F
00FE44B6                 db  2Ch ; ,
00FE44B7                 db    1
00FE44B8                 db    1
00FE44B9                 db    0
00FE44BA                 db    0
00FE44BB                 db    0
00FE44BC                 db 0BCh
00FE44BD                 db    2
00FE44BE                 db    0
00FE44BF                 db    0
00FE44C0                 db 0C0h
00FE44C1                 db  46h ; F
00FE44C2                 db  2Ch ; ,
00FE44C3                 db    1
00FE44C4                 db    1
00FE44C5                 db    0
00FE44C6                 db    0
00FE44C7                 db    0
00FE44C8                 db  58h ; X
00FE44C9                 db    2
00FE44CA                 db    0
00FE44CB                 db    0
00FE44CC                 db 0C4h
00FE44CD                 db  46h ; F
00FE44CE                 db  2Ch ; ,
00FE44CF                 db    1
00FE44D0                 db    1
00FE44D1                 db    0
00FE44D2                 db    0
00FE44D3                 db    0
00FE44D4                 db 0F4h
00FE44D5                 db    1
00FE44D6                 db    0
00FE44D7                 db    0
00FE44D8                 db 0C8h
00FE44D9                 db  46h ; F
00FE44DA                 db  2Ch ; ,
00FE44DB                 db    1
00FE44DC                 db    4
00FE44DD                 db    0
00FE44DE                 db    0
00FE44DF                 db    0
00FE44E0                 db  90h
00FE44E1                 db    1
00FE44E2                 db    0
00FE44E3                 db    0
00FE44E4                 db 0D8h
00FE44E5                 db  46h ; F
00FE44E6                 db  2Ch ; ,
00FE44E7                 db    1
00FE44E8                 db    4
00FE44E9                 db    0
00FE44EA                 db    0
00FE44EB                 db    0
00FE44EC                 db  2Ch ; ,
00FE44ED                 db    1
00FE44EE                 db    0
00FE44EF                 db    0
00FE44F0                 db 0E8h
00FE44F1                 db  46h ; F
00FE44F2                 db  2Ch ; ,
00FE44F3                 db    1
00FE44F4                 db    4
00FE44F5                 db    0
00FE44F6                 db    0
00FE44F7                 db    0
00FE44F8                 db 0C8h
00FE44F9                 db    0
00FE44FA                 db    0
00FE44FB                 db    0
00FE44FC                 db 0C0h
00FE44FD                 db  45h ; E
00FE44FE                 db  2Ch ; ,
00FE44FF                 db    1
00FE4500                 db  25h ; %
00FE4501                 db    0
00FE4502                 db    0
00FE4503                 db    0
00FE4504                 db  64h ; d
00FE4505                 db    0
00FE4506                 db    0
00FE4507                 db    0
00FE4508                 db 0F8h
00FE4509                 db  46h ; F
00FE450A                 db  2Ch ; ,
00FE450B                 db    1
00FE450C                 db    4
00FE450D                 db    0
00FE450E                 db    0
00FE450F                 db    0
00FE4510                 db    0
00FE4511                 db    0
00FE4512                 db    0
00FE4513                 db    0
00FE4514                 db    8
00FE4515                 db  47h ; G
00FE4516                 db  2Ch ; ,
00FE4517                 db    1
00FE4518                 db  64h ; d
00FE4519                 db    0
00FE451A                 db    0
00FE451B                 db    0
00FE451C                 db 0B0h
00FE451D                 db  0Dh
00FE451E                 db  16h
00FE451F                 db    1
00FE4520 off_FE4520      dd offset loc_79A000    ; DATA XREF: sub_798AA0+4Dâ†‘o
00FE4520                                         ; sub_798B50+2Eâ†‘o
00FE4524                 dd offset sub_846210
00FE4528                 dd offset sub_4105B0
00FE452C                 dd offset sub_6311A0
00FE4530                 dd offset sub_6311F0
00FE4534                 dd offset sub_631240
00FE4538                 dd offset sub_631290
00FE453C                 align 10h
00FE4540                 dd offset unk_1160D50
00FE4544 off_FE4544      dd offset loc_79A030    ; DATA XREF: sub_798AA0+47â†‘o
00FE4544                                         ; sub_798B50+28â†‘o
00FE4548                 dd offset sub_631C70
00FE454C                 dd offset sub_4437D0
00FE4550                 dd offset sub_631370
00FE4554                 dd offset sub_632760
00FE4558                 dd offset sub_631390
00FE455C                 dd offset sub_632440
00FE4560                 dd offset sub_631440
00FE4564                 dd offset sub_632AD0
00FE4568                 dd offset sub_6313C0
00FE456C                 dd offset sub_6313E0
00FE4570                 dd offset sub_631400
00FE4574                 dd offset sub_798900
00FE4578                 dd offset nullsub_16
00FE457C                 dd offset sub_6D6F80
00FE4580                 dd offset nullsub_16
00FE4584                 dd offset sub_798470
00FE4588                 dd offset sub_798600
00FE458C                 dd offset sub_799FD0
00FE4590                 dd offset sub_799FE0
00FE4594                 dd offset sub_798890
00FE4598                 dd offset sub_798BF0
00FE459C                 dd offset sub_799C90
00FE45A0                 dd offset sub_798640
00FE45A4                 dd offset sub_798A40
00FE45A8                 db  80h
00FE45A9                 db  96h
00FE45AA                 db  98h
00FE45AB                 db 0CBh
00FE45AC                 db  80h
00FE45AD                 db  96h
00FE45AE                 db  18h
00FE45AF                 db  4Bh ; K
00FE45B0                 db 0DBh
00FE45B1                 db  0Fh
00FE45B2                 db  49h ; I
00FE45B3                 db  40h ; @
00FE45B4                 db  77h ; w
00FE45B5                 db 0BEh
00FE45B6                 db  7Fh ; 
00FE45B7                 db  3Fh ; ?
00FE45B8                 db    0
00FE45B9                 db    0
00FE45BA                 db    0
00FE45BB                 db    0
00FE45BC                 db  18h
00FE45BD                 db    0
00FE45BE                 db    0
00FE45BF                 db    0
00FE45C0                 db  17h
00FE45C1                 db    0
00FE45C2                 db    0
00FE45C3                 db    0
00FE45C4                 db  16h
00FE45C5                 db    0
00FE45C6                 db    0
00FE45C7                 db    0
00FE45C8                 db  15h
00FE45C9                 db    0
00FE45CA                 db    0
00FE45CB                 db    0
00FE45CC                 db  32h ; 2
00FE45CD                 db    0
00FE45CE                 db    0
00FE45CF                 db    0
00FE45D0                 db    0
00FE45D1                 db    0
00FE45D2                 db    0
00FE45D3                 db    0
00FE45D4                 db  71h ; q
00FE45D5                 db    0
00FE45D6                 db    0
00FE45D7                 db    0
00FE45D8                 db  74h ; t
00FE45D9                 db    0
00FE45DA                 db    0
00FE45DB                 db    0
00FE45DC                 db  72h ; r
00FE45DD                 db    0
00FE45DE                 db    0
00FE45DF                 db    0
00FE45E0                 db  21h ; !
00FE45E1                 db    0
00FE45E2                 db    0
00FE45E3                 db    0
00FE45E4                 db  20h
00FE45E5                 db    0
00FE45E6                 db    0
00FE45E7                 db    0
00FE45E8                 db  50h ; P
00FE45E9                 db    0
00FE45EA                 db    0
00FE45EB                 db    0
00FE45EC                 db  50h ; P
00FE45ED                 db    0
00FE45EE                 db    0
00FE45EF                 db    0
00FE45F0                 db  4Dh ; M
00FE45F1                 db    0
00FE45F2                 db    0
00FE45F3                 db    0
00FE45F4                 db  4Bh ; K
00FE45F5                 db    0
00FE45F6                 db    0
00FE45F7                 db    0
00FE45F8                 db  53h ; S
00FE45F9                 db    0
00FE45FA                 db    0
00FE45FB                 db    0
00FE45FC                 db    0
00FE45FD                 db    0
00FE45FE                 db    0
00FE45FF                 db    0
