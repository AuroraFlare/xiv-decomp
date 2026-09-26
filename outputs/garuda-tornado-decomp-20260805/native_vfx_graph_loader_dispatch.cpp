program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BAC8D0 =====
entry=00bac8d0
body=[[00bac8d0, 00bac8d3]]
completed=true
message=

undefined4 __fastcall FUN_00bac8d0(int param_1)

{
  return *(undefined4 *)(param_1 + 0x1c);
}


-- listing --
00bac8d0  MOV EAX,dword ptr [ECX + 0x1c]
00bac8d3  RET

===== 00BAC8E0 =====
entry=00bac8e0
body=[[00bac8e0, 00bac8e3]]
completed=true
message=

undefined4 __fastcall FUN_00bac8e0(int param_1)

{
  return *(undefined4 *)(param_1 + 0x1c);
}


-- listing --
00bac8e0  MOV EAX,dword ptr [ECX + 0x1c]
00bac8e3  RET

===== 00BAC930 =====
entry=00bac930
body=[[00bac930, 00bac933]]
completed=true
message=

undefined4 __fastcall FUN_00bac930(int param_1)

{
  return *(undefined4 *)(param_1 + 0xc);
}


-- listing --
00bac930  MOV EAX,dword ptr [ECX + 0xc]
00bac933  RET

===== 00BAC940 =====
entry=00bac940
body=[[00bac940, 00bac943]]
completed=true
message=

undefined4 __fastcall FUN_00bac940(int param_1)

{
  return *(undefined4 *)(param_1 + 0x10);
}


-- listing --
00bac940  MOV EAX,dword ptr [ECX + 0x10]
00bac943  RET

===== 00BE7CE0 =====
entry=00be7ce0
body=[[00be7ce0, 00be7d43]]
completed=true
message=

int FUN_00be7ce0(undefined4 param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  iVar1 = param_3;
  uVar2 = (uint)*(ushort *)(param_3 + 8);
  if (uVar2 != 0) {
    iVar6 = 0;
    iVar5 = uVar2 * 4;
    if (uVar2 != 0) {
      iVar4 = 0;
      do {
        iVar3 = FUN_00be7a40(param_1,param_2,*(int *)(iVar1 + 4) + iVar4,&param_3);
        iVar6 = iVar6 + 1;
        iVar5 = (param_3 + -1 + iVar5 & ~(param_3 - 1U)) + iVar3;
        iVar4 = iVar4 + 0xc;
      } while (iVar6 < (int)(uint)*(ushort *)(iVar1 + 8));
    }
    return iVar5;
  }
  return 0;
}


-- listing --
00be7ce0  PUSH EBP
00be7ce1  MOV EBP,dword ptr [ESP + 0x10]
00be7ce5  MOVZX EAX,word ptr [EBP + 0x8]
00be7ce9  TEST EAX,EAX
00be7ceb  JNZ 0x00be7cef
00be7ced  POP EBP
00be7cee  RET
00be7cef  PUSH ESI
00be7cf0  PUSH EDI
00be7cf1  XOR EDI,EDI
00be7cf3  TEST EAX,EAX
00be7cf5  LEA ESI,[EAX*0x4 + 0x0]
00be7cfc  JLE 0x00be7d3e
00be7cfe  PUSH EBX
00be7cff  XOR EBX,EBX
00be7d01  MOV EAX,dword ptr [EBP + 0x4]
00be7d04  MOV EDX,dword ptr [ESP + 0x18]
00be7d08  LEA ECX,[ESP + 0x1c]
00be7d0c  PUSH ECX
00be7d0d  ADD EAX,EBX
00be7d0f  PUSH EAX
00be7d10  MOV EAX,dword ptr [ESP + 0x1c]
00be7d14  PUSH EDX
00be7d15  PUSH EAX
00be7d16  CALL 0x00be7a40
00be7d1b  MOV ECX,dword ptr [ESP + 0x2c]
00be7d1f  LEA ESI,[ECX + ESI*0x1 + -0x1]
00be7d23  ADD ECX,-0x1
00be7d26  NOT ECX
00be7d28  AND ESI,ECX
00be7d2a  MOVZX ECX,word ptr [EBP + 0x8]
00be7d2e  ADD EDI,0x1
00be7d31  ADD ESP,0x10
00be7d34  ADD ESI,EAX
00be7d36  ADD EBX,0xc
00be7d39  CMP EDI,ECX
00be7d3b  JL 0x00be7d01
00be7d3d  POP EBX
00be7d3e  POP EDI
00be7d3f  MOV EAX,ESI
00be7d41  POP ESI
00be7d42  POP EBP
00be7d43  RET

===== 00BE7D50 =====
entry=00be7d50
body=[[00be7d50, 00be7db6]]
completed=true
message=

int * __thiscall
FUN_00be7d50(int *param_1,int param_2,int param_3,int param_4,int param_5,int param_6,int param_7)

{
  byte bVar1;
  undefined4 uVar2;
  
  param_1[2] = param_3;
  param_1[6] = param_4;
  param_1[7] = param_5;
  *param_1 = param_2;
  *(undefined1 *)(param_1 + 1) = 1;
  param_1[8] = param_6;
  param_1[3] = param_7;
  bVar1 = *(byte *)(param_2 + 2);
  *(byte *)(param_1 + 9) = bVar1;
  if (1 < bVar1) {
    uVar2 = func_0x00415c90(2,&UNK_010cee1c);
    func_0x004160e0(uVar2);
    *(undefined1 *)(param_1 + 9) = 0;
  }
  FUN_00be7bc0();
  FUN_00be7c10();
  return param_1;
}


-- listing --
00be7d50  MOV EDX,dword ptr [ESP + 0xc]
00be7d54  MOV EAX,dword ptr [ESP + 0x4]
00be7d58  PUSH ESI
00be7d59  MOV ESI,ECX
00be7d5b  MOV ECX,dword ptr [ESP + 0xc]
00be7d5f  MOV dword ptr [ESI + 0x8],ECX
00be7d62  MOV ECX,dword ptr [ESP + 0x14]
00be7d66  MOV dword ptr [ESI + 0x18],EDX
00be7d69  MOV EDX,dword ptr [ESP + 0x18]
00be7d6d  MOV dword ptr [ESI + 0x1c],ECX
00be7d70  MOV ECX,dword ptr [ESP + 0x1c]
00be7d74  MOV dword ptr [ESI],EAX
00be7d76  MOV byte ptr [ESI + 0x4],0x1
00be7d7a  MOV dword ptr [ESI + 0x20],EDX
00be7d7d  MOV dword ptr [ESI + 0xc],ECX
00be7d80  MOV AL,byte ptr [EAX + 0x2]
00be7d83  CMP AL,0x2
00be7d85  MOV byte ptr [ESI + 0x24],AL
00be7d88  JC 0x00be7da3
00be7d8a  PUSH 0x10cee1c
00be7d8f  PUSH 0x2
00be7d91  CALL 0x00415c90
00be7d96  PUSH EAX
00be7d97  CALL 0x004160e0
00be7d9c  ADD ESP,0xc
00be7d9f  MOV byte ptr [ESI + 0x24],0x0
00be7da3  MOV ECX,ESI
00be7da5  CALL 0x00be7bc0
00be7daa  MOV ECX,ESI
00be7dac  CALL 0x00be7c10
00be7db1  MOV EAX,ESI
00be7db3  POP ESI
00be7db4  RET 0x18

===== 00BD2100 =====
entry=00bd2100
body=[[00bd2100, 00bd2103]]
completed=true
message=

undefined4 __fastcall FUN_00bd2100(int param_1)

{
  return *(undefined4 *)(param_1 + 8);
}


-- listing --
00bd2100  MOV EAX,dword ptr [ECX + 0x8]
00bd2103  RET

===== 00BD2220 =====
entry=00bd2220
body=[[00bd2220, 00bd2288]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bd2220(int param_1,undefined4 param_2)

{
  undefined4 unaff_retaddr;
  
  if (*(int *)(param_1 + 0xc) != 0) {
    func_0x00415c90(100);
    func_0x00415a00();
    if ((_DAT_01323910 & 1) == 0) {
      _DAT_01323910 = _DAT_01323910 | 1;
      _DAT_0132390c = (code *)&UNK_00bd2110;
    }
    (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c722c,0x60,&UNK_010c72b0);
    *(undefined4 *)(param_1 + 0xc) = unaff_retaddr;
    return;
  }
  *(undefined4 *)(param_1 + 0xc) = param_2;
  return;
}


-- listing --
00bd2220  PUSH ESI
00bd2221  MOV ESI,ECX
00bd2223  CMP dword ptr [ESI + 0xc],0x0
00bd2227  JZ 0x00bd227e
00bd2229  PUSH 0x64
00bd222b  CALL 0x00415c90
00bd2230  MOV ECX,EAX
00bd2232  CALL 0x00415a00
00bd2237  MOV EAX,0x1
00bd223c  TEST byte ptr [0x01323910],AL
00bd2242  JNZ 0x00bd2254
00bd2244  OR dword ptr [0x01323910],EAX
00bd224a  MOV dword ptr [0x0132390c],0xbd2110
00bd2254  PUSH 0x10c72b0
00bd2259  PUSH 0x60
00bd225b  PUSH 0x10c722c
00bd2260  PUSH 0xf54d48
00bd2265  PUSH 0xf56510
00bd226a  CALL dword ptr [0x0132390c]
00bd2270  MOV EAX,dword ptr [ESP + 0x1c]
00bd2274  ADD ESP,0x14
00bd2277  MOV dword ptr [ESI + 0xc],EAX
00bd227a  POP ESI
00bd227b  RET 0x4
00bd227e  MOV ECX,dword ptr [ESP + 0x8]
00bd2282  MOV dword ptr [ESI + 0xc],ECX
00bd2285  POP ESI
00bd2286  RET 0x4

===== 00BD22F0 =====
entry=00bd22f0
body=[[00bd22f0, 00bd2358]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00bd22f0(int param_1,undefined4 param_2)

{
  undefined4 unaff_retaddr;
  
  if (*(int *)(param_1 + 0x10) != 0) {
    func_0x00415c90(100);
    func_0x00415a00();
    if ((_DAT_01323910 & 1) == 0) {
      _DAT_01323910 = _DAT_01323910 | 1;
      _DAT_0132390c = (code *)&UNK_00bd2110;
    }
    (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c722c,0x76,&UNK_010c7378);
    *(undefined4 *)(param_1 + 0x10) = unaff_retaddr;
    return;
  }
  *(undefined4 *)(param_1 + 0x10) = param_2;
  return;
}


-- listing --
00bd22f0  PUSH ESI
00bd22f1  MOV ESI,ECX
00bd22f3  CMP dword ptr [ESI + 0x10],0x0
00bd22f7  JZ 0x00bd234e
00bd22f9  PUSH 0x64
00bd22fb  CALL 0x00415c90
00bd2300  MOV ECX,EAX
00bd2302  CALL 0x00415a00
00bd2307  MOV EAX,0x1
00bd230c  TEST byte ptr [0x01323910],AL
00bd2312  JNZ 0x00bd2324
00bd2314  OR dword ptr [0x01323910],EAX
00bd231a  MOV dword ptr [0x0132390c],0xbd2110
00bd2324  PUSH 0x10c7378
00bd2329  PUSH 0x76
00bd232b  PUSH 0x10c722c
00bd2330  PUSH 0xf54d48
00bd2335  PUSH 0xf56510
00bd233a  CALL dword ptr [0x0132390c]
00bd2340  MOV EAX,dword ptr [ESP + 0x1c]
00bd2344  ADD ESP,0x14
00bd2347  MOV dword ptr [ESI + 0x10],EAX
00bd234a  POP ESI
00bd234b  RET 0x4
00bd234e  MOV ECX,dword ptr [ESP + 0x8]
00bd2352  MOV dword ptr [ESI + 0x10],ECX
00bd2355  POP ESI
00bd2356  RET 0x4
