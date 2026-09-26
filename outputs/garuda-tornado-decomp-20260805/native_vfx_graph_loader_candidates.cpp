program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BAD864 =====
entry=00bad5d0
body=[[00bad5d0, 00bad951]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __fastcall FUN_00bad5d0(undefined4 *param_1)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 *unaff_FS_OFFSET;
  undefined4 uVar4;
  int iStack_10;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eea8fd;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  uVar4 = 0xc;
  *param_1 = &UNK_010bbbd4;
  func_0x009d61d6(param_1 + 10,0xc,8,&UNK_00bafb80,&UNK_00bafb60);
  param_1[0x23] = 0;
  param_1[0x22] = &UNK_010bbb8c;
  param_1[0x24] = param_1 + 0x23;
  func_0x00bd5760();
  param_1[0x2f] = iStack_10;
  param_1[0x42] = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[6] = 0;
  param_1[3] = 0;
  param_1[4] = 0;
  param_1[5] = 0;
  param_1[7] = 0;
  param_1[8] = 0;
  param_1[0x2a] = 0;
  param_1[0x2b] = 0;
  *(undefined1 *)(param_1 + 0x4a) = 0;
  param_1[0x45] = 0;
  uVar3 = *(undefined4 *)(iStack_10 + 0xa8);
  iVar2 = func_0x00416480(0xa0,1,0x10,&UNK_010bbba0,&UNK_010bbb60,0x13e);
  if (iVar2 == 0) {
    iVar2 = 0;
  }
  else {
    iVar2 = func_0x00bd6d00(param_1,uVar3);
  }
  param_1[0x29] = iVar2;
  uVar3 = *(undefined4 *)(iStack_10 + 8);
  uVar1 = *(undefined4 *)(iStack_10 + 0xc);
  *(byte *)(iVar2 + 0x9c) = *(byte *)(iVar2 + 0x9c) & 0xef | 8;
  *(undefined4 *)(iVar2 + 8) = uVar3;
  *(undefined4 *)(iVar2 + 0xc) = uVar1;
  if ((*(uint *)(iStack_10 + 0x10) >> 2 & 1) != 0) {
    func_0x00bd6750();
  }
  iVar2 = func_0x00416480(0x2c8,1,0x10,&UNK_010bbba0,&UNK_010bbb60,0x146);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00bcb430(param_1);
  }
  param_1[0x32] = uVar3;
  uVar3 = func_0x0040e2d0(0x10,&UNK_00f57168);
  if (_DAT_0132807c == 0) {
    _DAT_0132807c = func_0x0040e500();
  }
  iVar2 = func_0x0040e110(0x150,uVar3);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00c387e0();
  }
  param_1[0x35] = uVar3;
  uVar3 = func_0x0040e2d0(0x10,&UNK_00f57168);
  if (_DAT_0132807c == 0) {
    _DAT_0132807c = func_0x0040e500();
  }
  iVar2 = func_0x0040e110(0x150,uVar3);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00c387e0();
  }
  param_1[0x39] = uVar3;
  param_1[0x37] = 5000;
  *(undefined1 *)((int)param_1 + 0x129) = 1;
  param_1[0x25] = 0;
  param_1[0x26] = 0;
  param_1[0x38] = 0;
  iVar2 = func_0x00416480(8,1,0x10,&UNK_010bbba0,&UNK_010bbb60,0x158);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00bd4f30();
  }
  param_1[0x31] = uVar3;
  param_1[3] = 0x1304350;
  param_1[4] = 0x1304f50;
  param_1[7] = 0x40;
  uVar3 = func_0x00bd3090();
  param_1[9] = uVar3;
  iVar2 = func_0x00416480(0x1c,1,0x10,&UNK_010bbba0,&UNK_010bbb60,0x15c);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00bd4cf0(0x1000,0x400);
  }
  param_1[0x36] = uVar3;
  iVar2 = func_0x00416480(0x84,1,0x10,&UNK_010bbba0,&UNK_010bbb60,0x15e);
  if (iVar2 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x00bb91c0(param_1,0);
  }
  param_1[0x33] = uVar3;
  func_0x00bb9720();
  param_1[0x34] = 0;
  param_1[0x27] = 0;
  param_1[0x28] = 0;
  param_1[8] = 0;
  param_1[0x30] = 0;
  param_1[0x43] = 0;
  param_1[0x44] = 0;
  *unaff_FS_OFFSET = uVar4;
  return param_1;
}


-- listing --
00bad5d0  PUSH -0x1
00bad5d2  PUSH 0xeea8fd
00bad5d7  MOV EAX,FS:[0x0]
00bad5dd  PUSH EAX
00bad5de  MOV dword ptr FS:[0x0],ESP
00bad5e5  SUB ESP,0x14
00bad5e8  PUSH EBX
00bad5e9  PUSH EBP
00bad5ea  PUSH ESI
00bad5eb  PUSH EDI
00bad5ec  PUSH 0xbafb60
00bad5f1  PUSH 0xbafb80
00bad5f6  MOV ESI,ECX
00bad5f8  PUSH 0x8
00bad5fa  PUSH 0xc
00bad5fc  LEA EAX,[ESI + 0x28]
00bad5ff  PUSH EAX
00bad600  MOV dword ptr [ESP + 0x24],ESI
00bad604  MOV dword ptr [ESI],0x10bbbd4
00bad60a  CALL 0x009d61d6
00bad60f  XOR EBX,EBX
00bad611  LEA EAX,[ESI + 0x8c]
00bad617  MOV dword ptr [ESP + 0x2c],EBX
00bad61b  MOV dword ptr [EAX],EBX
00bad61d  MOV dword ptr [ESI + 0x88],0x10bbb8c
00bad627  MOV dword ptr [ESI + 0x90],EAX
00bad62d  LEA ECX,[ESI + 0xe8]
00bad633  MOV byte ptr [ESP + 0x2c],0x1
00bad638  CALL 0x00bd5760
00bad63d  MOV EDI,dword ptr [ESP + 0x34]
00bad641  PUSH 0x13e
00bad646  PUSH 0x10bbb60
00bad64b  PUSH 0x10bbba0
00bad650  PUSH 0x10
00bad652  PUSH 0x1
00bad654  MOV dword ptr [ESI + 0xbc],EDI
00bad65a  MOV dword ptr [ESI + 0x108],EBX
00bad660  MOV dword ptr [ESI + 0x4],EBX
00bad663  MOV dword ptr [ESI + 0x8],EBX
00bad666  MOV dword ptr [ESI + 0x18],EBX
00bad669  MOV dword ptr [ESI + 0xc],EBX
00bad66c  MOV dword ptr [ESI + 0x10],EBX
00bad66f  MOV dword ptr [ESI + 0x14],EBX
00bad672  MOV dword ptr [ESI + 0x1c],EBX
00bad675  MOV dword ptr [ESI + 0x20],EBX
00bad678  MOV dword ptr [ESI + 0xa8],EBX
00bad67e  MOV dword ptr [ESI + 0xac],EBX
00bad684  MOV byte ptr [ESI + 0x128],BL
00bad68a  MOV dword ptr [ESI + 0x114],EBX
00bad690  MOV EBP,dword ptr [EDI + 0xa8]
00bad696  PUSH 0xa0
00bad69b  MOV byte ptr [ESP + 0x44],0x2
00bad6a0  CALL 0x00416480
00bad6a5  ADD ESP,0x18
00bad6a8  MOV dword ptr [ESP + 0x34],EAX
00bad6ac  CMP EAX,EBX
00bad6ae  MOV byte ptr [ESP + 0x2c],0x3
00bad6b3  JZ 0x00bad6c0
00bad6b5  PUSH EBP
00bad6b6  PUSH ESI
00bad6b7  MOV ECX,EAX
00bad6b9  CALL 0x00bd6d00
00bad6be  JMP 0x00bad6c2
00bad6c0  XOR EAX,EAX
00bad6c2  MOV dword ptr [ESI + 0xa4],EAX
00bad6c8  MOV DL,byte ptr [EAX + 0x9c]
00bad6ce  MOV EBP,dword ptr [EDI + 0x8]
00bad6d1  MOV ECX,dword ptr [EDI + 0xc]
00bad6d4  AND DL,0xef
00bad6d7  OR DL,0x8
00bad6da  MOV byte ptr [EAX + 0x9c],DL
00bad6e0  MOV dword ptr [EAX + 0x8],EBP
00bad6e3  MOV dword ptr [EAX + 0xc],ECX
00bad6e6  MOV EAX,dword ptr [EDI + 0x10]
00bad6e9  SHR EAX,0x2
00bad6ec  TEST AL,0x1
00bad6ee  MOV byte ptr [ESP + 0x2c],0x2
00bad6f3  JZ 0x00bad700
00bad6f5  MOV ECX,dword ptr [ESI + 0xa4]
00bad6fb  CALL 0x00bd6750
00bad700  PUSH 0x146
00bad705  PUSH 0x10bbb60
00bad70a  PUSH 0x10bbba0
00bad70f  PUSH 0x10
00bad711  PUSH 0x1
00bad713  PUSH 0x2c8
00bad718  CALL 0x00416480
00bad71d  ADD ESP,0x18
00bad720  MOV dword ptr [ESP + 0x34],EAX
00bad724  CMP EAX,EBX
00bad726  MOV byte ptr [ESP + 0x2c],0x4
00bad72b  JZ 0x00bad737
00bad72d  PUSH ESI
00bad72e  MOV ECX,EAX
00bad730  CALL 0x00bcb430
00bad735  JMP 0x00bad739
00bad737  XOR EAX,EAX
00bad739  PUSH 0xf57168
00bad73e  PUSH 0x10
00bad740  LEA ECX,[ESP + 0x24]
00bad744  MOV byte ptr [ESP + 0x34],0x2
00bad749  MOV dword ptr [ESI + 0xc8],EAX
00bad74f  CALL 0x0040e2d0
00bad754  MOV EDI,EAX
00bad756  MOV EAX,[0x0132807c]
00bad75b  CMP EAX,EBX
00bad75d  MOV dword ptr [ESP + 0x34],EDI
00bad761  JNZ 0x00bad76d
00bad763  CALL 0x0040e500
00bad768  MOV [0x0132807c],EAX
00bad76d  PUSH EDI
00bad76e  PUSH 0x150
00bad773  MOV ECX,EAX
00bad775  MOV dword ptr [ESP + 0x1c],EAX
00bad779  CALL 0x0040e110
00bad77e  MOV dword ptr [ESP + 0x18],EAX
00bad782  CMP EAX,EBX
00bad784  MOV byte ptr [ESP + 0x2c],0x5
00bad789  JZ 0x00bad794
00bad78b  MOV ECX,EAX
00bad78d  CALL 0x00c387e0
00bad792  JMP 0x00bad796
00bad794  XOR EAX,EAX
00bad796  PUSH 0xf57168
00bad79b  PUSH 0x10
00bad79d  LEA ECX,[ESP + 0x24]
00bad7a1  MOV byte ptr [ESP + 0x34],0x2
00bad7a6  MOV dword ptr [ESI + 0xd4],EAX
00bad7ac  CALL 0x0040e2d0
00bad7b1  MOV EDI,EAX
00bad7b3  MOV EAX,[0x0132807c]
00bad7b8  CMP EAX,EBX
00bad7ba  MOV dword ptr [ESP + 0x34],EDI
00bad7be  JNZ 0x00bad7ca
00bad7c0  CALL 0x0040e500
00bad7c5  MOV [0x0132807c],EAX
00bad7ca  PUSH EDI
00bad7cb  PUSH 0x150
00bad7d0  MOV ECX,EAX
00bad7d2  MOV dword ptr [ESP + 0x20],EAX
00bad7d6  CALL 0x0040e110
00bad7db  MOV dword ptr [ESP + 0x14],EAX
00bad7df  CMP EAX,EBX
00bad7e1  MOV byte ptr [ESP + 0x2c],0x6
00bad7e6  JZ 0x00bad7f1
00bad7e8  MOV ECX,EAX
00bad7ea  CALL 0x00c387e0
00bad7ef  JMP 0x00bad7f3
00bad7f1  XOR EAX,EAX
00bad7f3  PUSH 0x158
00bad7f8  PUSH 0x10bbb60
00bad7fd  PUSH 0x10bbba0
00bad802  PUSH 0x10
00bad804  PUSH 0x1
00bad806  PUSH 0x8
00bad808  MOV byte ptr [ESP + 0x44],0x2
00bad80d  MOV dword ptr [ESI + 0xe4],EAX
00bad813  MOV dword ptr [ESI + 0xdc],0x1388
00bad81d  MOV byte ptr [ESI + 0x129],0x1
00bad824  MOV dword ptr [ESI + 0x94],EBX
00bad82a  MOV dword ptr [ESI + 0x98],EBX
00bad830  MOV dword ptr [ESI + 0xe0],EBX
00bad836  CALL 0x00416480
00bad83b  ADD ESP,0x18
00bad83e  MOV dword ptr [ESP + 0x34],EAX
00bad842  CMP EAX,EBX
00bad844  MOV byte ptr [ESP + 0x2c],0x7
00bad849  JZ 0x00bad854
00bad84b  MOV ECX,EAX
00bad84d  CALL 0x00bd4f30
00bad852  JMP 0x00bad856
00bad854  XOR EAX,EAX
00bad856  MOV byte ptr [ESP + 0x2c],0x2
00bad85b  MOV dword ptr [ESI + 0xc4],EAX
00bad861  MOV dword ptr [ESI + 0xc],0x1304350
00bad868  MOV dword ptr [ESI + 0x10],0x1304f50
00bad86f  MOV dword ptr [ESI + 0x1c],0x40
00bad876  CALL 0x00bd3090
00bad87b  PUSH 0x15c
00bad880  PUSH 0x10bbb60
00bad885  PUSH 0x10bbba0
00bad88a  PUSH 0x10
00bad88c  PUSH 0x1
00bad88e  PUSH 0x1c
00bad890  MOV dword ptr [ESI + 0x24],EAX
00bad893  CALL 0x00416480
00bad898  ADD ESP,0x18
00bad89b  MOV dword ptr [ESP + 0x34],EAX
00bad89f  CMP EAX,EBX
00bad8a1  MOV byte ptr [ESP + 0x2c],0x8
00bad8a6  JZ 0x00bad8bb
00bad8a8  PUSH 0x400
00bad8ad  PUSH 0x1000
00bad8b2  MOV ECX,EAX
00bad8b4  CALL 0x00bd4cf0
00bad8b9  JMP 0x00bad8bd
00bad8bb  XOR EAX,EAX
00bad8bd  PUSH 0x15e
00bad8c2  PUSH 0x10bbb60
00bad8c7  PUSH 0x10bbba0
00bad8cc  PUSH 0x10
00bad8ce  PUSH 0x1
00bad8d0  PUSH 0x84
00bad8d5  MOV byte ptr [ESP + 0x44],0x2
00bad8da  MOV dword ptr [ESI + 0xd8],EAX
00bad8e0  CALL 0x00416480
00bad8e5  ADD ESP,0x18
00bad8e8  MOV dword ptr [ESP + 0x34],EAX
00bad8ec  CMP EAX,EBX
00bad8ee  MOV byte ptr [ESP + 0x2c],0x9
00bad8f3  JZ 0x00bad900
00bad8f5  PUSH EBX
00bad8f6  PUSH ESI
00bad8f7  MOV ECX,EAX
00bad8f9  CALL 0x00bb91c0
00bad8fe  JMP 0x00bad902
00bad900  XOR EAX,EAX
00bad902  MOV ECX,EAX
00bad904  MOV byte ptr [ESP + 0x2c],0x2
00bad909  MOV dword ptr [ESI + 0xcc],EAX
00bad90f  CALL 0x00bb9720
00bad914  MOV ECX,dword ptr [ESP + 0x24]
00bad918  POP EDI
00bad919  MOV dword ptr [ESI + 0xd0],EBX
00bad91f  MOV dword ptr [ESI + 0x9c],EBX
00bad925  MOV dword ptr [ESI + 0xa0],EBX
00bad92b  MOV dword ptr [ESI + 0x20],EBX
00bad92e  MOV dword ptr [ESI + 0xc0],EBX
00bad934  MOV dword ptr [ESI + 0x10c],EBX
00bad93a  MOV dword ptr [ESI + 0x110],EBX
00bad940  MOV EAX,ESI
00bad942  POP ESI
00bad943  POP EBP
00bad944  POP EBX
00bad945  MOV dword ptr FS:[0x0],ECX
00bad94c  ADD ESP,0x20
00bad94f  RET 0x4

===== 00BD278D =====
entry=00bd2660
body=[[00bd2660, 00bd2859] [00bd2860, 00bd28b1] [00bd2bf0, 00bd2bfc]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __thiscall
FUN_00bd2660(int param_1,undefined4 *param_2,undefined4 param_3,undefined4 *param_4,
            undefined4 param_5,int *param_6,int param_7,int param_8,int *param_9,int param_10,
            int param_11,int param_12,int *param_13,int param_14,int *param_15)

{
  int iVar1;
  uint uVar2;
  int *piVar3;
  int iVar4;
  ushort *puVar5;
  undefined4 uVar6;
  ushort *puVar7;
  uint uVar8;
  undefined4 *unaff_FS_OFFSET;
  int *piStack_28;
  int *piStack_20;
  undefined2 uStack_1c;
  ushort uStack_18;
  ushort uStack_14;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eeb816;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  *(undefined4 *)(param_1 + 0x30) = 0;
  uVar8 = 0x118;
  if (param_4[5] == 0) {
    uStack_1c = 0;
  }
  else {
    uStack_1c = 0x118;
    uVar8 = param_4[5] + 0x118;
  }
  iVar1 = param_4[1];
  if (iVar1 < 1) {
    piStack_20 = (int *)0x0;
    uStack_18 = 0;
  }
  else {
    uStack_18 = (ushort)(uVar8 + 3) & 0xfffc;
    puVar5 = (ushort *)*param_4;
    puVar7 = puVar5 + iVar1;
    uVar8 = (uVar8 + 3 & 0xfffffffc) + iVar1 * 0x24;
    piStack_20 = param_13;
    for (; puVar5 != puVar7; puVar5 = puVar5 + 1) {
      *param_13 = param_12 + (uint)*puVar5 * 0x1c;
      iVar1 = FUN_00bd2100();
      iVar1 = *(int *)(iVar1 + 8);
      *(uint *)(param_1 + 0x30) = *(uint *)(param_1 + 0x30) | *(uint *)(iVar1 + 0x18);
      uVar2 = *(int *)(iVar1 + 0x20) - 1;
      uVar8 = uVar8 + uVar2 & ~uVar2;
      func_0x00bd2220(uVar8);
      uVar8 = *(int *)(iVar1 + 0x1c) + 0xf + uVar8 & 0xfffffff0;
      func_0x00bd22f0(uVar8);
      piVar3 = (int *)FUN_00bd2100();
      iVar1 = *(int *)*piVar3;
      iVar4 = ((int *)*piVar3)[1] * 0x10 + iVar1;
      for (; iVar1 != iVar4; iVar1 = iVar1 + 0x10) {
        if (*(byte *)(iVar1 + 0xb) != 0xff) {
          uVar2 = *(ushort *)(param_4[8] + (uint)*(byte *)(iVar1 + 0xb) * 0xc) & 0xf;
          if ((uVar2 == 5) || (uVar2 == 6)) {
            uVar2 = 1;
          }
          uVar8 = uVar8 + (*(byte *)((uVar2 | (uint)*(byte *)(iVar1 + 4) << 4) * 0x18 + 0x1305b52) +
                           0xf & 0xfffffff0);
        }
      }
      param_13 = param_13 + 1;
    }
  }
  if ((int)param_4[3] < 1) {
    piStack_28 = (int *)0x0;
  }
  else {
    puVar5 = (ushort *)param_4[2];
    puVar7 = puVar5 + param_4[3];
    piStack_28 = param_15;
    for (; puVar5 != puVar7; puVar5 = puVar5 + 1) {
      *param_15 = (uint)*puVar5 * 0x2c + param_14;
      param_15 = param_15 + 1;
    }
  }
  param_15 = (int *)param_4[7];
  param_13 = (int *)0x0;
  if ((int)param_15 < 1) {
    param_14 = 0;
    uStack_14 = 0;
  }
  else {
    param_14 = *param_6;
    puVar7 = (ushort *)param_4[6];
    uStack_14 = (ushort)(uVar8 + 3) & 0xfffc;
    param_13 = (int *)((int)param_15 * 0x18);
    uVar8 = (uVar8 + 3 & 0xfffffffc) + (int)param_13;
    param_12 = 0;
    if (0 < (int)param_15) {
      do {
        uVar2 = FUN_00bac8d0();
        if (uVar2 <= *puVar7) {
          uVar6 = func_0x00415c90(0,&UNK_010c758c);
          func_0x004160e0(uVar6);
          func_0x00415c90(100);
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c7538,0x13e,&UNK_010c7554);
        }
        iVar1 = FUN_00bac930();
        iVar1 = (uint)*puVar7 * 0x30 + iVar1;
        if (*(short *)(iVar1 + 6) == 0) {
          uVar6 = func_0x00415c90(0,&UNK_010c7508);
          func_0x004160e0(uVar6);
          func_0x00415c90(100);
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c7538,0x141,&UNK_010c7554);
        }
        uVar2 = uVar8 + 0xf & 0xfffffff0;
        iVar4 = FUN_00be7ce0(0,iVar1,puVar7);
        param_13 = (int *)((int)param_13 + iVar4);
        uVar8 = iVar4 + uVar2;
        uStack_4 = 0;
        if (*param_6 != 0) {
          FUN_00be7d50(puVar7,iVar1,uVar2,param_7 + param_12 * 2,param_8 + param_12 * 2,0);
        }
        param_12 = param_12 + (uint)puVar7[4];
        *param_6 = *param_6 + 0x28;
        puVar7 = puVar7 + 6;
        param_15 = (int *)((int)param_15 + -1);
        uStack_4 = 0xffffffff;
      } while (param_15 != (int *)0x0);
    }
  }
  param_12 = param_4[9];
  if (param_12 < 1) {
    param_15 = (int *)0x0;
    param_8._0_2_ = 0;
  }
  else {
    param_15 = (int *)*param_9;
    puVar7 = (ushort *)param_4[8];
    param_13 = (int *)((int)param_13 + param_12 * 0x18);
    param_8._0_2_ = (ushort)(uVar8 + 3) & 0xfffc;
    uVar8 = (uVar8 + 3 & 0xfffffffc) + param_12 * 0x18;
    param_6 = (int *)0x0;
    if (0 < param_12) {
      do {
        uVar2 = FUN_00bac8e0();
        if (uVar2 <= *puVar7) {
          uVar6 = func_0x00415c90(0,&UNK_010c758c);
          func_0x004160e0(uVar6);
          func_0x00415c90(100);
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c7538,0x16d,&UNK_010c7554);
        }
        iVar1 = FUN_00bac940();
        iVar1 = (uint)*puVar7 * 0x30 + iVar1;
        if (*(short *)(iVar1 + 6) == 0) {
          uVar6 = func_0x00415c90(0,&UNK_010c7508);
          func_0x004160e0(uVar6);
          func_0x00415c90(100);
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c7538,0x170,&UNK_010c7554);
        }
        uVar2 = uVar8 + 0xf & 0xfffffff0;
        iVar4 = FUN_00be7ce0(1,iVar1,puVar7);
        param_13 = (int *)((int)param_13 + iVar4);
        uVar8 = iVar4 + uVar2;
        uStack_4 = 1;
        if (*param_9 != 0) {
          FUN_00be7d50(puVar7,iVar1,uVar2,param_10 + (int)param_6 * 2,param_11 + (int)param_6 * 2,1)
          ;
        }
        param_6 = (int *)((int)param_6 + (uint)puVar7[4]);
        *param_9 = *param_9 + 0x28;
        puVar7 = puVar7 + 6;
        param_12 = param_12 + -1;
        uStack_4 = 0xffffffff;
      } while (param_12 != 0);
    }
  }
  if (param_2 != (undefined4 *)0x0) {
    *param_2 = param_5;
    param_2[3] = piStack_20;
    param_2[4] = piStack_28;
    param_2[5] = param_14;
    param_2[6] = param_15;
    param_2[8] = param_13;
    *(undefined2 *)(param_2 + 9) = uStack_1c;
    *(ushort *)((int)param_2 + 0x26) = uStack_18;
    param_2[1] = param_4;
    param_2[7] = uVar8;
    *(ushort *)(param_2 + 10) = uStack_14;
    *(ushort *)((int)param_2 + 0x2a) = (ushort)param_8;
    *(undefined1 *)(param_2 + 2) = 1;
  }
  *unaff_FS_OFFSET = uStack_c;
  return param_1;
}


-- listing --
00bd2660  PUSH -0x1
00bd2662  PUSH 0xeeb816
00bd2667  MOV EAX,FS:[0x0]
00bd266d  PUSH EAX
00bd266e  MOV dword ptr FS:[0x0],ESP
00bd2675  SUB ESP,0x1c
00bd2678  PUSH EBX
00bd2679  MOV EBX,dword ptr [ESP + 0x38]
00bd267d  PUSH ESI
00bd267e  XOR ESI,ESI
00bd2680  MOV dword ptr [ECX + 0x30],ESI
00bd2683  MOV EAX,dword ptr [EBX + 0x14]
00bd2686  CMP EAX,ESI
00bd2688  PUSH EDI
00bd2689  MOV dword ptr [ESP + 0x10],ECX
00bd268d  MOV EDI,0x118
00bd2692  JZ 0x00bd26a0
00bd2694  MOV dword ptr [ESP + 0x18],EDI
00bd2698  LEA EDI,[EAX + 0x118]
00bd269e  JMP 0x00bd26a4
00bd26a0  MOV dword ptr [ESP + 0x18],ESI
00bd26a4  MOV ECX,dword ptr [EBX + 0x4]
00bd26a7  CMP ECX,ESI
00bd26a9  PUSH EBP
00bd26aa  JLE 0x00bd27c5
00bd26b0  ADD EDI,0x3
00bd26b3  AND EDI,0xfffffffc
00bd26b6  MOVZX EAX,DI
00bd26b9  LEA EDX,[ECX + ECX*0x8]
00bd26bc  MOV dword ptr [ESP + 0x20],EAX
00bd26c0  MOV EAX,dword ptr [EBX]
00bd26c2  LEA ECX,[EAX + ECX*0x2]
00bd26c5  CMP EAX,ECX
00bd26c7  LEA EDI,[EDI + EDX*0x4]
00bd26ca  MOV EDX,dword ptr [ESP + 0x68]
00bd26ce  MOV dword ptr [ESP + 0x10],EAX
00bd26d2  MOV dword ptr [ESP + 0x24],ECX
00bd26d6  MOV dword ptr [ESP + 0x18],EDX
00bd26da  JZ 0x00bd27cd
00bd26e0  JMP 0x00bd26e6
00bd26e2  MOV EAX,dword ptr [ESP + 0x10]
00bd26e6  MOVZX EAX,word ptr [EAX]
00bd26e9  MOV EDX,dword ptr [ESP + 0x64]
00bd26ed  LEA ECX,[EAX*0x8 + 0x0]
00bd26f4  SUB ECX,EAX
00bd26f6  MOV EAX,dword ptr [ESP + 0x68]
00bd26fa  LEA ESI,[EDX + ECX*0x4]
00bd26fd  MOV ECX,ESI
00bd26ff  MOV dword ptr [EAX],ESI
00bd2701  CALL 0x00bd2100
00bd2706  MOV EBP,dword ptr [EAX + 0x8]
00bd2709  MOV ECX,dword ptr [EBP + 0x18]
00bd270c  MOV EAX,dword ptr [ESP + 0x14]
00bd2710  OR dword ptr [EAX + 0x30],ECX
00bd2713  MOV EAX,dword ptr [EBP + 0x20]
00bd2716  SUB EAX,0x1
00bd2719  ADD EDI,EAX
00bd271b  NOT EAX
00bd271d  AND EDI,EAX
00bd271f  PUSH EDI
00bd2720  MOV ECX,ESI
00bd2722  CALL 0x00bd2220
00bd2727  MOV EDX,dword ptr [EBP + 0x1c]
00bd272a  LEA EDI,[EDX + EDI*0x1 + 0xf]
00bd272e  AND EDI,0xfffffff0
00bd2731  PUSH EDI
00bd2732  MOV ECX,ESI
00bd2734  CALL 0x00bd22f0
00bd2739  MOV ECX,ESI
00bd273b  CALL 0x00bd2100
00bd2740  MOV ECX,dword ptr [EAX]
00bd2742  MOV EAX,dword ptr [ECX + 0x4]
00bd2745  MOV ECX,dword ptr [ECX]
00bd2747  SHL EAX,0x4
00bd274a  ADD EAX,ECX
00bd274c  MOV EBP,EAX
00bd274e  CMP ECX,EBP
00bd2750  JZ 0x00bd27a7
00bd2752  MOV AL,byte ptr [ECX + 0xb]
00bd2755  CMP AL,0xff
00bd2757  JZ 0x00bd27a0
00bd2759  MOV ESI,dword ptr [EBX + 0x20]
00bd275c  MOVZX EDX,byte ptr [ECX + 0x4]
00bd2760  MOVZX EAX,AL
00bd2763  LEA EAX,[EAX + EAX*0x2]
00bd2766  LEA EAX,[ESI + EAX*0x4]
00bd2769  MOVZX EAX,word ptr [EAX]
00bd276c  MOVZX EAX,AX
00bd276f  AND EAX,0xf
00bd2772  CMP EAX,0x5
00bd2775  JZ 0x00bd277c
00bd2777  CMP EAX,0x6
00bd277a  JNZ 0x00bd2781
00bd277c  MOV EAX,0x1
00bd2781  SHL EDX,0x4
00bd2784  OR EAX,EDX
00bd2786  LEA EAX,[EAX + EAX*0x2]
00bd2789  MOVZX EDX,byte ptr [EAX*0x8 + 0x1305b52]
00bd2791  LEA EAX,[EAX*0x8 + 0x1305b50]
00bd2798  ADD EDX,0xf
00bd279b  AND EDX,0xfffffff0
00bd279e  ADD EDI,EDX
00bd27a0  ADD ECX,0x10
00bd27a3  CMP ECX,EBP
00bd27a5  JNZ 0x00bd2752
00bd27a7  MOV EAX,dword ptr [ESP + 0x10]
00bd27ab  ADD dword ptr [ESP + 0x68],0x4
00bd27b0  ADD EAX,0x2
00bd27b3  CMP EAX,dword ptr [ESP + 0x24]
00bd27b7  MOV dword ptr [ESP + 0x10],EAX
00bd27bb  JNZ 0x00bd26e2
00bd27c1  XOR ESI,ESI
00bd27c3  JMP 0x00bd27cd
00bd27c5  MOV dword ptr [ESP + 0x18],ESI
00bd27c9  MOV dword ptr [ESP + 0x20],ESI
00bd27cd  MOV ECX,dword ptr [EBX + 0xc]
00bd27d0  CMP ECX,ESI
00bd27d2  JLE 0x00bd2808
00bd27d4  MOV EAX,dword ptr [EBX + 0x8]
00bd27d7  LEA EDX,[EAX + ECX*0x2]
00bd27da  CMP EAX,EDX
00bd27dc  MOV ECX,dword ptr [ESP + 0x70]
00bd27e0  MOV dword ptr [ESP + 0x10],ECX
00bd27e4  JZ 0x00bd280c
00bd27e6  MOV ESI,dword ptr [ESP + 0x6c]
00bd27ea  LEA EBX,[EBX]
00bd27f0  MOVZX EBP,word ptr [EAX]
00bd27f3  IMUL EBP,EBP,0x2c
00bd27f6  ADD EBP,ESI
00bd27f8  MOV dword ptr [ECX],EBP
00bd27fa  ADD EAX,0x2
00bd27fd  ADD ECX,0x4
00bd2800  CMP EAX,EDX
00bd2802  JNZ 0x00bd27f0
00bd2804  XOR ESI,ESI
00bd2806  JMP 0x00bd280c
00bd2808  MOV dword ptr [ESP + 0x10],ESI
00bd280c  MOV EAX,dword ptr [EBX + 0x1c]
00bd280f  CMP EAX,ESI
00bd2811  MOV dword ptr [ESP + 0x68],ESI
00bd2815  JLE 0x00bd2bf0
00bd281b  MOV ECX,dword ptr [ESP + 0x4c]
00bd281f  MOV EDX,dword ptr [ECX]
00bd2821  MOV EBX,dword ptr [EBX + 0x18]
00bd2824  ADD EDI,0x3
00bd2827  AND EDI,0xfffffffc
00bd282a  MOVZX ECX,DI
00bd282d  MOV dword ptr [ESP + 0x24],ECX
00bd2831  LEA ECX,[EAX + EAX*0x2]
00bd2834  ADD ECX,ECX
00bd2836  ADD ECX,ECX
00bd2838  ADD ECX,ECX
00bd283a  ADD EDI,ECX
00bd283c  TEST EAX,EAX
00bd283e  MOV dword ptr [ESP + 0x6c],EDX
00bd2842  MOV dword ptr [ESP + 0x68],ECX
00bd2846  MOV dword ptr [ESP + 0x64],0x0
00bd284e  JLE 0x00bd29c2
00bd2854  MOV dword ptr [ESP + 0x70],EAX
00bd2858  JMP 0x00bd2860
00bd2860  MOV ESI,dword ptr [ESP + 0x40]
00bd2864  MOV ECX,ESI
00bd2866  CALL 0x00bac8d0
00bd286b  MOVZX ECX,word ptr [EBX]
00bd286e  MOVZX EDX,CX
00bd2871  CMP EDX,EAX
00bd2873  JC 0x00bd28d4
00bd2875  PUSH 0x10c758c
00bd287a  PUSH 0x0
00bd287c  CALL 0x00415c90
00bd2881  PUSH EAX
00bd2882  CALL 0x004160e0
00bd2887  ADD ESP,0xc
00bd288a  PUSH 0x64
00bd288c  CALL 0x00415c90
00bd2891  MOV ECX,EAX
00bd2893  CALL 0x00415a00
00bd2898  TEST byte ptr [0x01323910],0x1
00bd289f  JNZ 0x00bd28b2
00bd28a1  OR dword ptr [0x01323910],0x1
00bd28a8  MOV dword ptr [0x0132390c],0xbd25b0
00bd2bf0  MOV dword ptr [ESP + 0x6c],ESI
00bd2bf4  MOV dword ptr [ESP + 0x24],ESI
00bd2bf8  JMP 0x00bd29c8

===== 00BDBB97 =====
entry=00bdb9d0
body=[[00bdb9d0, 00bdba67] [00bdba70, 00bdbc84]]
completed=true
message=

undefined4 * __thiscall FUN_00bdb9d0(undefined4 *param_1,int param_2,int *param_3,int *param_4)

{
  byte bVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 *puVar7;
  undefined4 uVar8;
  undefined4 uVar9;
  int *piVar10;
  int iVar11;
  uint uVar12;
  int iVar13;
  int *unaff_EBX;
  int iVar14;
  int iVar15;
  undefined4 unaff_EDI;
  int iStack_24;
  
  param_1[4] = param_1 + 4;
  param_1[5] = param_1 + 5;
  param_1[6] = param_1 + 6;
  param_1[2] = param_2;
  *(undefined1 *)(param_1 + 8) = 0xff;
  *param_1 = param_4;
  param_1[1] = param_3;
  *(undefined1 *)((int)param_1 + 0x1e) = 0;
  param_1[3] = 0;
  *(undefined2 *)(param_1 + 7) = 0;
  *param_4 = (int)param_1;
  *(undefined2 *)(param_4 + 1) = 0;
  *(undefined1 *)((int)param_4 + 6) = 0x79;
  *(undefined1 *)((int)param_4 + 7) = 0x6f;
  piVar10 = (int *)FUN_00bd2100();
  piVar2 = (int *)*piVar10;
  iVar3 = piVar10[2];
  param_3 = (int *)(*(int *)(iVar3 + 0x2c) + (int)param_4);
  iVar11 = FUN_00bd2290();
  iVar15 = *piVar2;
  iVar14 = piVar2[1] * 0x10 + iVar15;
  iStack_24 = 0;
  for (; iVar15 != iVar14; iVar15 = iVar15 + 0x10) {
    iVar13 = *(int *)(param_2 + 0xc) + (uint)*(byte *)(iVar15 + 9) * 0x18;
    piVar2 = *(int **)(iVar13 + 4);
    iVar4 = piVar2[2];
    iVar13 = *(int *)(iVar13 + 0x10);
    if (*(byte *)(iVar15 + 0xb) == 0xff) {
      bVar1 = *(byte *)(iVar15 + 10);
      iVar5 = *(int *)(iVar13 + (uint)bVar1 * 4);
      iVar13 = iVar5 + 0x30;
      if ((*(byte *)(iVar5 + 0x1f) & 1) == 0) {
        iVar13 = iVar5 + 0x20;
      }
      iVar6 = *(int *)(*piVar2 + 4);
      (**(code **)(iVar4 + 0x14))(iVar13,iVar5);
      if ((*(byte *)(iVar4 + 1) & 8) != 0) {
        *(undefined4 **)(iVar13 + 8) = param_1;
      }
      (**(code **)(iVar4 + 0x1c))(iVar13,**(undefined4 **)(iVar6 + (uint)bVar1 * 0xc));
      if (iStack_24 < *(int *)(iVar3 + 0x30)) {
        *param_3 = iVar13;
        param_3 = param_3 + 1;
      }
    }
    else {
      iVar5 = *(int *)(param_2 + 0x10) + (uint)*(byte *)(iVar15 + 0xb) * 0x18;
      puVar7 = *(undefined4 **)(iVar5 + 4);
      piVar2 = (int *)puVar7[2];
      uVar8 = *(undefined4 *)(iVar13 + (uint)*(byte *)(iVar15 + 10) * 4);
      uVar9 = *(undefined4 *)(*(int *)(iVar5 + 0x10) + (uint)*(byte *)(iVar15 + 0xc) * 4);
      uVar12 = *(byte *)*puVar7 & 0xf;
      if ((uVar12 == 5) || (uVar12 == 6)) {
        uVar12 = 1;
      }
      func_0x00bf6ba0(((uint)*(byte *)(iVar15 + 4) << 4 | uVar12) * 0x18 + 0x1305b50,iVar15,
                      iVar11 + param_2);
      func_0x00bf6bc0(uVar8);
      bVar1 = *(byte *)(iVar15 + 10);
      iVar13 = *(int *)(*unaff_EBX + 4);
      (**(code **)(iVar4 + 0x14))(puVar7,uVar8);
      if ((*(byte *)(iVar4 + 1) & 8) != 0) {
        puVar7[2] = unaff_EDI;
      }
      (**(code **)(iVar4 + 0x1c))(puVar7,**(undefined4 **)(iVar13 + (uint)bVar1 * 0xc));
      bVar1 = *(byte *)(iVar15 + 0xc);
      iVar13 = *(int *)(*piVar2 + 4);
      (**(code **)(iStack_24 + 0x14))(param_1,uVar9);
      if ((*(byte *)(iVar4 + 1) & 8) != 0) {
        param_1[2] = unaff_EDI;
      }
      (**(code **)(iStack_24 + 0x1c))(param_1,**(undefined4 **)(iVar13 + (uint)bVar1 * 0xc));
      if (iStack_24 < *(int *)(iVar3 + 0x30)) {
        *param_3 = (int)param_1;
        param_3 = param_3 + 1;
      }
    }
    iStack_24 = iStack_24 + 1;
  }
  return param_1;
}


-- listing --
00bdb9d0  SUB ESP,0x28
00bdb9d3  PUSH EBX
00bdb9d4  MOV EBX,dword ptr [ESP + 0x34]
00bdb9d8  PUSH EBP
00bdb9d9  MOV EBP,ECX
00bdb9db  LEA EAX,[EBP + 0x10]
00bdb9de  MOV dword ptr [EAX],EAX
00bdb9e0  LEA ECX,[EAX + 0x4]
00bdb9e3  MOV dword ptr [ECX],ECX
00bdb9e5  ADD EAX,0x8
00bdb9e8  MOV dword ptr [EAX],EAX
00bdb9ea  MOV EAX,dword ptr [ESP + 0x34]
00bdb9ee  MOV dword ptr [EBP + 0x8],EAX
00bdb9f1  PUSH ESI
00bdb9f2  MOV ESI,dword ptr [ESP + 0x40]
00bdb9f6  XOR EAX,EAX
00bdb9f8  MOV byte ptr [EBP + 0x20],0xff
00bdb9fc  MOV dword ptr [EBP],ESI
00bdb9ff  MOV dword ptr [EBP + 0x4],EBX
00bdba02  MOV byte ptr [EBP + 0x1e],0x0
00bdba06  MOV dword ptr [EBP + 0xc],EAX
00bdba09  MOV word ptr [EBP + 0x1c],AX
00bdba0d  PUSH EDI
00bdba0e  MOV ECX,EBX
00bdba10  MOV dword ptr [ESP + 0x10],EBP
00bdba14  MOV dword ptr [ESI],EBP
00bdba16  MOV word ptr [ESI + 0x4],AX
00bdba1a  MOV byte ptr [ESI + 0x6],0x79
00bdba1e  MOV byte ptr [ESI + 0x7],0x6f
00bdba22  CALL 0x00bd2100
00bdba27  MOV EDI,dword ptr [EAX]
00bdba29  MOV EAX,dword ptr [EAX + 0x8]
00bdba2c  MOV dword ptr [ESP + 0x28],EAX
00bdba30  MOV EAX,dword ptr [EAX + 0x2c]
00bdba33  ADD EAX,ESI
00bdba35  MOV ECX,EBX
00bdba37  MOV dword ptr [ESP + 0x40],EAX
00bdba3b  CALL 0x00bd2290
00bdba40  MOV EBX,dword ptr [EDI + 0x4]
00bdba43  MOV ESI,dword ptr [EDI]
00bdba45  ADD EAX,dword ptr [ESP + 0x3c]
00bdba49  SHL EBX,0x4
00bdba4c  ADD EBX,ESI
00bdba4e  CMP ESI,EBX
00bdba50  MOV dword ptr [ESP + 0x18],EAX
00bdba54  MOV dword ptr [ESP + 0x2c],EBX
00bdba58  MOV dword ptr [ESP + 0x14],0x0
00bdba60  JZ 0x00bdbc79
00bdba66  JMP 0x00bdba70
00bdba70  MOVZX EAX,byte ptr [ESI + 0x9]
00bdba74  MOV EDX,dword ptr [ESP + 0x3c]
00bdba78  LEA ECX,[EAX + EAX*0x2]
00bdba7b  MOV EAX,dword ptr [EDX + 0xc]
00bdba7e  LEA ECX,[EAX + ECX*0x8]
00bdba81  MOV EAX,dword ptr [ECX + 0x4]
00bdba84  MOV EDI,dword ptr [EAX + 0x8]
00bdba87  MOV ECX,dword ptr [ECX + 0x10]
00bdba8a  MOV dword ptr [ESP + 0x1c],EAX
00bdba8e  MOV AL,byte ptr [ESI + 0xb]
00bdba91  CMP AL,0xff
00bdba93  JNZ 0x00bdbb1b
00bdba99  MOVZX EAX,byte ptr [ESI + 0xa]
00bdba9d  MOV ECX,dword ptr [ECX + EAX*0x4]
00bdbaa0  TEST byte ptr [ECX + 0x1f],0x1
00bdbaa4  LEA EDX,[ECX + 0x30]
00bdbaa7  JNZ 0x00bdbaac
00bdbaa9  LEA EDX,[ECX + 0x20]
00bdbaac  MOV dword ptr [ESP + 0x44],EDX
00bdbab0  MOV EDX,dword ptr [ESP + 0x1c]
00bdbab4  MOV EDX,dword ptr [EDX]
00bdbab6  MOV EDX,dword ptr [EDX + 0x4]
00bdbab9  PUSH ECX
00bdbaba  MOV ECX,dword ptr [ESP + 0x48]
00bdbabe  LEA EAX,[EAX + EAX*0x2]
00bdbac1  LEA EAX,[EDX + EAX*0x4]
00bdbac4  MOV EDX,dword ptr [EDI + 0x14]
00bdbac7  PUSH ECX
00bdbac8  MOV dword ptr [ESP + 0x2c],EAX
00bdbacc  CALL EDX
00bdbace  ADD ESP,0x8
00bdbad1  TEST byte ptr [EDI + 0x1],0x8
00bdbad5  JZ 0x00bdbade
00bdbad7  MOV EAX,dword ptr [ESP + 0x44]
00bdbadb  MOV dword ptr [EAX + 0x8],EBP
00bdbade  MOV ECX,dword ptr [ESP + 0x24]
00bdbae2  MOV EDX,dword ptr [ECX]
00bdbae4  MOV EAX,dword ptr [EDX]
00bdbae6  MOV ECX,dword ptr [ESP + 0x44]
00bdbaea  MOV EDX,dword ptr [EDI + 0x1c]
00bdbaed  PUSH EAX
00bdbaee  PUSH ECX
00bdbaef  CALL EDX
00bdbaf1  MOV EAX,dword ptr [ESP + 0x30]
00bdbaf5  MOV ECX,dword ptr [ESP + 0x1c]
00bdbaf9  ADD ESP,0x8
00bdbafc  CMP ECX,dword ptr [EAX + 0x30]
00bdbaff  JGE 0x00bdbc69
00bdbb05  MOV EAX,dword ptr [ESP + 0x40]
00bdbb09  MOV EDX,dword ptr [ESP + 0x44]
00bdbb0d  MOV dword ptr [EAX],EDX
00bdbb0f  ADD EAX,0x4
00bdbb12  MOV dword ptr [ESP + 0x40],EAX
00bdbb16  JMP 0x00bdbc69
00bdbb1b  MOV EDX,dword ptr [EDX + 0x10]
00bdbb1e  MOVZX EAX,AL
00bdbb21  LEA EAX,[EAX + EAX*0x2]
00bdbb24  LEA EAX,[EDX + EAX*0x8]
00bdbb27  MOV EDX,dword ptr [EAX + 0x4]
00bdbb2a  MOV EBX,dword ptr [EDX + 0x8]
00bdbb2d  MOV dword ptr [ESP + 0x24],EBX
00bdbb31  MOVZX EBX,byte ptr [ESI + 0xa]
00bdbb35  MOV EBX,dword ptr [ECX + EBX*0x4]
00bdbb38  TEST byte ptr [EBX + 0x1f],0x1
00bdbb3c  MOV dword ptr [ESP + 0x34],EDX
00bdbb40  LEA ECX,[EBX + 0x30]
00bdbb43  JNZ 0x00bdbb48
00bdbb45  LEA ECX,[EBX + 0x20]
00bdbb48  MOV EAX,dword ptr [EAX + 0x10]
00bdbb4b  MOV dword ptr [ESP + 0x44],ECX
00bdbb4f  MOVZX ECX,byte ptr [ESI + 0xc]
00bdbb53  MOV EBP,dword ptr [EAX + ECX*0x4]
00bdbb56  TEST byte ptr [EBP + 0x1f],0x1
00bdbb5a  JZ 0x00bdbb65
00bdbb5c  LEA ECX,[EBP + 0x30]
00bdbb5f  MOV dword ptr [ESP + 0x20],ECX
00bdbb63  JMP 0x00bdbb6c
00bdbb65  LEA EAX,[EBP + 0x20]
00bdbb68  MOV dword ptr [ESP + 0x20],EAX
00bdbb6c  MOV ECX,dword ptr [EDX]
00bdbb6e  MOVZX ECX,byte ptr [ECX]
00bdbb71  MOVZX EAX,byte ptr [ESI + 0x4]
00bdbb75  AND ECX,0xf
00bdbb78  CMP ECX,0x5
00bdbb7b  JZ 0x00bdbb82
00bdbb7d  CMP ECX,0x6
00bdbb80  JNZ 0x00bdbb87
00bdbb82  MOV ECX,0x1
00bdbb87  MOV EDX,dword ptr [ESP + 0x18]
00bdbb8b  SHL EAX,0x4
00bdbb8e  OR EAX,ECX
00bdbb90  PUSH EDX
00bdbb91  LEA EAX,[EAX + EAX*0x2]
00bdbb94  LEA EAX,[EAX*0x8 + 0x1305b50]
00bdbb9b  PUSH ESI
00bdbb9c  PUSH EAX
00bdbb9d  MOV ECX,EBP
00bdbb9f  MOV dword ptr [ESP + 0x3c],EAX
00bdbba3  CALL 0x00bf6ba0
00bdbba8  PUSH EBX
00bdbba9  MOV ECX,EBP
00bdbbab  CALL 0x00bf6bc0
00bdbbb0  MOV EAX,dword ptr [ESP + 0x30]
00bdbbb4  MOVZX ECX,byte ptr [EAX + 0x2]
00bdbbb8  MOVZX EAX,byte ptr [ESI + 0xa]
00bdbbbc  ADD ECX,0xf
00bdbbbf  LEA EDX,[EAX + EAX*0x2]
00bdbbc2  MOV EAX,dword ptr [ESP + 0x1c]
00bdbbc6  AND ECX,0xfffffff0
00bdbbc9  ADD dword ptr [ESP + 0x18],ECX
00bdbbcd  MOV ECX,dword ptr [EAX]
00bdbbcf  MOV EAX,dword ptr [ECX + 0x4]
00bdbbd2  PUSH EBX
00bdbbd3  MOV EBX,dword ptr [ESP + 0x48]
00bdbbd7  LEA ECX,[EAX + EDX*0x4]
00bdbbda  MOV EDX,dword ptr [EDI + 0x14]
00bdbbdd  PUSH EBX
00bdbbde  MOV dword ptr [ESP + 0x38],ECX
00bdbbe2  CALL EDX
00bdbbe4  ADD ESP,0x8
00bdbbe7  TEST byte ptr [EDI + 0x1],0x8
00bdbbeb  JZ 0x00bdbbf4
00bdbbed  MOV EAX,dword ptr [ESP + 0x10]
00bdbbf1  MOV dword ptr [EBX + 0x8],EAX
00bdbbf4  MOV ECX,dword ptr [ESP + 0x30]
00bdbbf8  MOV EDX,dword ptr [ECX]
00bdbbfa  MOV EAX,dword ptr [EDX]
00bdbbfc  MOV ECX,dword ptr [EDI + 0x1c]
00bdbbff  PUSH EAX
00bdbc00  PUSH EBX
00bdbc01  CALL ECX
00bdbc03  MOVZX EAX,byte ptr [ESI + 0xc]
00bdbc07  LEA EDX,[EAX + EAX*0x2]
00bdbc0a  MOV EAX,dword ptr [ESP + 0x3c]
00bdbc0e  MOV ECX,dword ptr [EAX]
00bdbc10  MOV EAX,dword ptr [ECX + 0x4]
00bdbc13  MOV ECX,dword ptr [ESP + 0x2c]
00bdbc17  PUSH EBP
00bdbc18  MOV EBP,dword ptr [ESP + 0x2c]
00bdbc1c  LEA EBX,[EAX + EDX*0x4]
00bdbc1f  MOV EDX,dword ptr [ECX + 0x14]
00bdbc22  PUSH EBP
00bdbc23  CALL EDX
00bdbc25  ADD ESP,0x10
00bdbc28  TEST byte ptr [EDI + 0x1],0x8
00bdbc2c  JZ 0x00bdbc35
00bdbc2e  MOV EAX,dword ptr [ESP + 0x10]
00bdbc32  MOV dword ptr [EBP + 0x8],EAX
00bdbc35  MOV ECX,dword ptr [EBX]
00bdbc37  MOV EDX,dword ptr [ECX]
00bdbc39  MOV EAX,dword ptr [ESP + 0x24]
00bdbc3d  MOV ECX,dword ptr [EAX + 0x1c]
00bdbc40  PUSH EDX
00bdbc41  PUSH EBP
00bdbc42  CALL ECX
00bdbc44  MOV EDX,dword ptr [ESP + 0x1c]
00bdbc48  MOV EAX,dword ptr [ESP + 0x30]
00bdbc4c  MOV EBX,dword ptr [ESP + 0x34]
00bdbc50  ADD ESP,0x8
00bdbc53  CMP EDX,dword ptr [EAX + 0x30]
00bdbc56  JGE 0x00bdbc65
00bdbc58  MOV EAX,dword ptr [ESP + 0x40]
00bdbc5c  MOV dword ptr [EAX],EBP
00bdbc5e  ADD EAX,0x4
00bdbc61  MOV dword ptr [ESP + 0x40],EAX
00bdbc65  MOV EBP,dword ptr [ESP + 0x10]
00bdbc69  ADD dword ptr [ESP + 0x14],0x1
00bdbc6e  ADD ESI,0x10
00bdbc71  CMP ESI,EBX
00bdbc73  JNZ 0x00bdba70
00bdbc79  POP EDI
00bdbc7a  POP ESI
00bdbc7b  MOV EAX,EBP
00bdbc7d  POP EBP
00bdbc7e  POP EBX
00bdbc7f  ADD ESP,0x28
00bdbc82  RET 0xc
