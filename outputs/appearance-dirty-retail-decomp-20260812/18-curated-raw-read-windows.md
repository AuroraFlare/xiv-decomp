# Curated raw read/branch windows

These short windows preserve instruction bytes and base registers around the
critical reads. Full listings are in files 03, 06, 11, 13, and 16.

## First per-frame owner and sole B20 reader

`FUN_0058DF90` calls the dirty reader every frame after its local `+0x26D`
flag handling:

```asm
0058DF90  83 EC 14                SUB  ESP,14h
0058DF93  56                      PUSH ESI
0058DF94  8B F1                   MOV  ESI,ECX
0058DF96  8A 86 6D020000          MOV  AL,[ESI+26Dh]
0058DF9C  A8 40                   TEST AL,40h
0058DFA1  A8 04                   TEST AL,4
0058DFA5  E8 A681FFFF             CALL 00586150
0058DFAA  80 A6 6D020000 BF       AND  byte ptr [ESI+26Dh],BFh
0058DFB1  8B CE                   MOV  ECX,ESI
0058DFB3  E8 B87DFFFF             CALL 00585D70
```

The only actor-layout B20 read is the `CMP` at `0x00585DD8`. EBP is the
actor throughout `FUN_00585D70`:

```asm
00585DC1  5E                      POP  ESI
00585DC2  C6 85 200B0000 01       MOV  byte ptr [EBP+0B20h],1
00585DC9  C7 85 240B0000 00000000 MOV  dword ptr [EBP+0B24h],0
00585DD3  5D                      POP  EBP
00585DD4  83 C4 74                ADD  ESP,74h
00585DD7  C3                      RET
00585DD8  80 BD 200B0000 00       CMP  byte ptr [EBP+0B20h],0
00585DDF  74 36                   JE   00585E17
00585DE1  6A 74                   PUSH 74h
00585DE3  8D 95 AC0A0000          LEA  EDX,[EBP+0AACh]
00585DE9  52                      PUSH EDX
00585DEA  6A 08                   PUSH 8
00585DEC  8B CD                   MOV  ECX,EBP
00585DEE  E8 8D1BF5FF             CALL 004D7980
00585DF3  D9 EE                   FLDZ
00585DF5  80 A5 6D020000 FB       AND  byte ptr [EBP+26Dh],FBh
00585DFC  6A 01                   PUSH 1
00585DFE  51                      PUSH ECX
00585DFF  8B CD                   MOV  ECX,EBP
00585E01  D9 1C24                 FSTP dword ptr [ESP]
00585E04  E8 27FBFFFF             CALL 00585930
00585E09  80 8D 6D020000 40       OR   byte ptr [EBP+26Dh],40h
00585E10  C6 85 200B0000 00       MOV  byte ptr [EBP+0B20h],0
```

## D6/D7 call arguments and actor B1C writes

This is the complete post-entry-loop sequence that establishes the flag
state. EDI is the actor:

```asm
0058D0F0  8B 14F3                MOV   EDX,[EBX+ESI*8]       ; value
0058D0F3  0F B6 44F3 04          MOVZX EAX,byte ptr [EBX+ESI*8+4] ; wire field
0058D0F8  52                     PUSH  EDX
0058D0F9  50                     PUSH  EAX
0058D0FA  8B CF                  MOV   ECX,EDI
0058D0FC  E8 6F97FFFF            CALL  00586870
0058D10A  6A 01                  PUSH  1
0058D10C  8B CF                  MOV   ECX,EDI
0058D10E  E8 BD1A0000            CALL  0058EBD0
0058D113  83 A7 1C0B0000 FB      AND   dword ptr [EDI+0B1Ch],FFFFFFFBh
0058D125  C6 87 200B0000 01      MOV   byte ptr [EDI+0B20h],1
0058D136  8B 4F 7C               MOV   ECX,[EDI+7Ch]
0058D139  E8 72A2F4FF            CALL  004D73B0
0058D13E  6A 00                  PUSH  0
0058D140  6A 1E                  PUSH  1Eh
0058D142  6A 07                  PUSH  7
0058D144  8B C8                  MOV   ECX,EAX
0058D146  E8 F56CEBFF            CALL  00443E40
0058D14B  50                     PUSH  EAX
0058D14C  8B CF                  MOV   ECX,EDI
0058D14E  E8 5D1A0000            CALL  0058EBB0
```

Both target helpers are leaves:

```asm
0058EBB0  8B 81 1C0B0000        MOV  EAX,[ECX+0B1Ch]
0058EBB6  33 44 24 04           XOR  EAX,[ESP+4]
0058EBBA  C6 81 200B0000 01     MOV  byte ptr [ECX+0B20h],1
0058EBC1  83 E0 01              AND  EAX,1
0058EBC4  31 81 1C0B0000        XOR  [ECX+0B1Ch],EAX
0058EBCA  C2 0400               RET  4

0058EBD0  8B 44 24 04           MOV  EAX,[ESP+4]
0058EBD4  8D 14 00              LEA  EDX,[EAX+EAX]
0058EBD7  33 91 1C0B0000        XOR  EDX,[ECX+0B1Ch]
0058EBDD  C6 81 200B0000 01     MOV  byte ptr [ECX+0B20h],1
0058EBE4  83 E2 02              AND  EDX,2
0058EBE7  31 91 1C0B0000        XOR  [ECX+0B1Ch],EDX
0058EBED  C2 0400               RET  4
```

## Event-8 renderer copy

The dispatch case and whole-bank setter show that the actor block is not
reinterpreted by the B20 reader itself:

```asm
00663808  56                     PUSH ESI                 ; payload
00663809  8B CF                  MOV  ECX,EDI              ; renderer actor
0066380B  E8 E0EBFFFF            CALL 006623F0

006623F0  56                     PUSH ESI
006623F1  8B 74 24 08            MOV  ESI,[ESP+8]
006623F8  8D B8 C8130000         LEA  EDI,[EAX+13C8h]
006623FE  B9 1D000000            MOV  ECX,1Dh
00662403  F3 A5                  REP MOVSD
00662407  E8 24B3FFFF            CALL 0065D730
```

## Copied B1C bit 0/1 branches

Renderer first-bank flags are at `+0x13C4`; requested flags (copied actor
B1C) are at `+0x1438`. This routine only backfills first-bank bits that are
not already set:

```asm
0065D97C  8B 81 C4130000         MOV  EAX,[ECX+13C4h]
0065D982  A8 01                  TEST AL,1
0065D984  75 13                  JNE  0065D999
0065D986  8B 91 38140000         MOV  EDX,[ECX+1438h]
0065D98C  33 D0                  XOR  EDX,EAX
0065D98E  83 E2 01              AND  EDX,1
0065D991  33 D0                  XOR  EDX,EAX
0065D993  89 91 C4130000         MOV  [ECX+13C4h],EDX
0065D999  8B 81 C4130000         MOV  EAX,[ECX+13C4h]
0065D99F  A8 02                  TEST AL,2
0065D9A1  75 13                  JNE  0065D9B6
0065D9A3  8B 91 38140000         MOV  EDX,[ECX+1438h]
0065D9A9  33 D0                  XOR  EDX,EAX
0065D9AB  83 E2 02              AND  EDX,2
0065D9AE  33 D0                  XOR  EDX,EAX
0065D9B0  89 91 C4130000         MOV  [ECX+13C4h],EDX
0065D9B6  8B 81 702B0000         MOV  EAX,[ECX+2B70h]
0065D9BC  83 E0 F1              AND  EAX,FFFFFFF1h
0065D9BF  83 C8 01              OR   EAX,1
0065D9C2  89 81 702B0000         MOV  [ECX+2B70h],EAX
```

## Ultimate flag apply

`EBP` is the one requested/ready 0x74-byte bank. B1C is its last dword at
`EBP+0x70`:

```asm
00665E90  8B 45 70               MOV  EAX,[EBP+70h]
00665E93  83 E0 01               AND  EAX,1
00665E96  50                     PUSH EAX
00665E97  56                     PUSH ESI
00665E98  8D 8B 60190000         LEA  ECX,[EBX+1960h]
00665E9E  E8 ED061E00            CALL 00846590
00665EA3  8B 0F                  MOV  ECX,[EDI]
00665EA7  8D 8B 60190000         LEA  ECX,[EBX+1960h]
00665EAD  E8 0E071E00            CALL 008465C0
00665EB8  83 FE 07               CMP  ESI,7
00665EBB  7C D3                  JL   00665E90
00665EBD  8B 93 30280000         MOV  EDX,[EBX+2830h]
00665EC3  33 55 70               XOR  EDX,[EBP+70h]
00665ECC  83 E2 02               AND  EDX,2
00665ECF  31 93 30280000         XOR  [EBX+2830h],EDX
```

The function then copies one bank to the stack and calls one model-helper
appearance method:

```asm
00665EF0  B9 1D000000            MOV  ECX,1Dh
00665EF5  8B F5                  MOV  ESI,EBP
00665EF7  8D 7C 24 14            LEA  EDI,[ESP+14h]
00665EFB  F3 A5                  REP MOVSD
00665EFD  8B 8B 5C2B0000         MOV  ECX,[EBX+2B5Ch]
00665F03  8B 01                  MOV  EAX,[ECX]
00665F05  8B 40 64               MOV  EAX,[EAX+64h]
00665F0D  FF D0                  CALL EAX                  ; 006B7840
```

## Bit 0 and bit 2 model-helper mapping

```asm
006B786A  8B 48 70               MOV  ECX,[EAX+70h]
006B786D  C1 E1 0D               SHL  ECX,0Dh
006B7870  33 4E 40               XOR  ECX,[ESI+40h]
006B7873  81 E1 00200000         AND  ECX,2000h
006B7879  31 4E 40               XOR  [ESI+40h],ECX        ; B1C bit0
006B787C  8B 50 70               MOV  EDX,[EAX+70h]
006B787F  80 66 4C FE            AND  byte ptr [ESI+4Ch],FEh
006B7883  8B 4E 40               MOV  ECX,[ESI+40h]
006B7886  C1 E2 0C               SHL  EDX,0Ch
006B7889  33 D1                  XOR  EDX,ECX
006B788B  81 E2 00400000         AND  EDX,4000h
006B7891  33 D1                  XOR  EDX,ECX
006B7893  89 56 40               MOV  [ESI+40h],EDX        ; B1C bit2
```

## Bit 1 getter and sole direct consumer

```asm
0065BB20  8B 81 30280000         MOV  EAX,[ECX+2830h]
0065BB26  D1 E8                  SHR  EAX,1
0065BB28  83 E0 01               AND  EAX,1
0065BB2B  C3                     RET

00832466  85 F6                  TEST ESI,ESI
00832468  0F84 32010000          JE   008325A0
0083246E  8B CE                  MOV  ECX,ESI
00832470  E8 AB96E2FF            CALL 0065BB20
00832475  85 C0                  TEST EAX,EAX
00832477  0F84 23010000          JE   008325A0
0083249A  8B 74 24 10            MOV  ESI,[ESP+10h]
0083249E  68 F4710301            PUSH 010371F4h            ; "b_base_kami"
008324A3  56                     PUSH ESI
008324A4  E8 E73B1A00            CALL 009D6090
```

The same function also compares against strings at `0x01037244`,
`0x01037254`, and `0x01037264`: `b_base_skirt`, `b_base_maedare`, and
`b_base_pch`.

## Bit 2 supplemental-resource branches

The model-helper bit `0x4000` derived from B1C bit 2 gates two `%s9998.bin`
resource attempts:

```asm
006B5D41  F7 46 40 00400000      TEST dword ptr [ESI+40h],4000h
006B5D48  0F84 B5000000          JE   006B5E03
006B5D56  68 BC2BFD00            PUSH 00FD2BBCh            ; "%s9998"
006B5D68  E8 16F23100            CALL 009D4F83
006B5D76  68 C42BFD00            PUSH 00FD2BC4h            ; ".bin"

006B60D9  F7 46 40 00400000      TEST dword ptr [ESI+40h],4000h
006B60E0  0F84 B3000000          JE   006B6199
006B60EE  68 982CFD00            PUSH 00FD2C98h            ; "%s9998"
006B6100  E8 7EEE3100            CALL 009D4F83
006B610E  68 A02CFD00            PUSH 00FD2CA0h            ; ".bin"
```

## BODYGEAR and queue phase

The adjacent dwords prove the field-14 BODYGEAR mapping. `+0x13FC/+0x1388`
is the preceding field; BODYGEAR is `+0x1400/+0x138C`:

```asm
0065D841  83 B9 88130000 00      CMP  dword ptr [ECX+1388h],0
0065D84A  8B 91 FC130000         MOV  EDX,[ECX+13FCh]
0065D850  89 91 88130000         MOV  [ECX+1388h],EDX
0065D856  83 B9 8C130000 00      CMP  dword ptr [ECX+138Ch],0
0065D85F  8B 81 00140000         MOV  EAX,[ECX+1400h]
0065D865  89 81 8C130000         MOV  [ECX+138Ch],EAX

006B78EF  8B 50 34               MOV  EDX,[EAX+34h]
006B78F2  89 96 98000000         MOV  [ESI+98h],EDX
006B78F8  8B 48 38               MOV  ECX,[EAX+38h]
006B78FB  89 8E 9C000000         MOV  [ESI+9Ch],ECX
```

The renderer state machine decrements the low nibble from 1 to 0, submits
one requested bank, and later applies one ready bank:

```asm
00666749  8B 8E 702B0000         MOV  ECX,[ESI+2B70h]
0066675C  F6 C1 0F               TEST CL,0Fh
00666761  8D 41 FF               LEA  EAX,[ECX-1]
00666766  83 E0 0F               AND  EAX,0Fh
0066676D  89 86 702B0000         MOV  [ESI+2B70h],EAX
0066677F  8B 86 DC000000         MOV  EAX,[ESI+0DCh]
00666785  8D 9E C8130000         LEA  EBX,[ESI+13C8h]
0066678F  E8 ECB41600            CALL 007D1C80
0066679B  E8 A0F6FFFF            CALL 00665E40             ; fallback
006667AA  E8 41B31600            CALL 007D1AF0
006667C1  E8 6AB31600            CALL 007D1B30
006667E2  E8 59F6FFFF            CALL 00665E40             ; ready bank
```
