program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BD3F70 =====
entry=00bd3f70
body=[[00bd3f70, 00bd3ffa] [00bd4027, 00bd4103] [00bd4162, 00bd43dd]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00bd3f70(int *param_1,undefined4 param_2,int param_3,short *param_4)

{
  char cVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  int iVar4;
  uint uVar5;
  int *piVar6;
  int iVar7;
  uint uVar8;
  ushort *puVar9;
  int iVar10;
  int *unaff_FS_OFFSET;
  uint uStack_84;
  int iStack_80;
  int iStack_7c;
  int iStack_78;
  uint uStack_74;
  int iStack_70;
  uint uStack_6c;
  int iStack_68;
  uint uStack_64;
  int iStack_60;
  int iStack_5c;
  int iStack_58;
  int *piStack_54;
  uint *puStack_50;
  int iStack_4c;
  int iStack_48;
  uint uStack_44;
  uint uStack_40;
  ushort *puStack_3c;
  int iStack_38;
  int iStack_34;
  int iStack_30;
  int iStack_2c;
  int iStack_28;
  int iStack_24;
  int iStack_1c;
  undefined *puStack_18;
  undefined4 uStack_14;
  
  iStack_1c = *unaff_FS_OFFSET;
  uStack_14 = 0xffffffff;
  puStack_18 = &UNK_00eeb8a8;
  *unaff_FS_OFFSET = (int)&iStack_1c;
  if (*param_4 != 0x1d) {
    uVar2 = func_0x00415c90(2,&UNK_010c7a20,*param_4,0x1d);
    func_0x004160e0(uVar2);
    puVar3 = (undefined4 *)(**(code **)(*param_1 + 0x10))();
    _DAT_013684d4 = *puVar3;
    _DAT_013684d8 = puVar3[1];
    _DAT_013684dc = puVar3[2];
    _DAT_013684e0 = puVar3[3];
    uVar2 = 2;
LAB_00bd3ffb:
    _DAT_013684e4 = 0;
    uVar2 = func_0x00415c90(uVar2,&UNK_010c79fc,&DAT_013684d4);
    func_0x004160e0(uVar2);
LAB_00bd4010:
    *unaff_FS_OFFSET = iStack_1c;
    return 0;
  }
  iStack_34 = *(int *)(param_4 + 0x1a);
  if (0 < iStack_34) {
    iVar10 = *(int *)(param_4 + 0x18);
    iVar7 = *(int *)(param_4 + 0x2c);
    iStack_48 = iVar10 + iStack_34 * 0x24;
    if (iVar10 != iStack_48) {
      do {
        cVar1 = func_0x00bacaf0(iVar7 + (uint)*(ushort *)(iVar10 + 0x1c) * 0x18,&uStack_84);
        if (cVar1 == '\0') {
          _DAT_013684d4 = *(undefined4 *)(param_4 + 2);
          _DAT_013684d8 = *(undefined4 *)(param_4 + 4);
          _DAT_013684dc = *(undefined4 *)(param_4 + 6);
          _DAT_013684e0 = *(undefined4 *)(param_4 + 8);
          uVar2 = 1;
          goto LAB_00bd3ffb;
        }
        *(undefined2 *)(iVar10 + 0x1c) = (undefined2)uStack_84;
        iVar10 = iVar10 + 0x24;
      } while (iVar10 != iStack_48);
    }
  }
  iStack_48 = *(int *)(param_4 + 0x2c);
  iStack_4c = *(int *)(param_3 + 4);
  iStack_5c = 0;
  if (0 < *(int *)(param_4 + 0x1e)) {
    iStack_78 = 0;
    do {
      piVar6 = (int *)(*(int *)(param_4 + 0x1c) + iStack_78);
      iStack_58 = 0;
      piStack_54 = piVar6;
      if (0 < piVar6[1]) {
        do {
          uVar8 = *(uint *)(*piVar6 + iStack_58 * 4);
          puStack_50 = (uint *)(*piVar6 + iStack_58 * 4);
          if (((uVar8 & 0xf0000000) == 0x10000000) || ((uVar8 & 0xf0000000) == 0x20000000)) {
            iVar10 = func_0x00bac8f0(*(undefined4 *)
                                      (iStack_48 + (uVar8 >> 0x10 & 0xfff) * 0x18 + 0x10));
            if (iVar10 == 0) {
              uVar2 = func_0x00415c90(0,&UNK_010c79d8);
              func_0x004160e0(uVar2);
              func_0x00415c90(100);
              func_0x00415a00();
              if ((_DAT_01323910 & 1) == 0) {
                _DAT_01323910 = _DAT_01323910 | 1;
                _DAT_0132390c = (code *)&UNK_00bd3530;
              }
              (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c7790,0x3da,&UNK_010c799c);
            }
            *puStack_50 = ((iVar10 - iStack_4c) / 0xe8) * 0x10000 | uVar8 & 0xf000ffff;
            piVar6 = piStack_54;
          }
          iStack_58 = iStack_58 + 1;
        } while (iStack_58 < piVar6[1]);
      }
      iStack_78 = iStack_78 + 0x1c;
      iStack_5c = iStack_5c + 1;
    } while (iStack_5c < *(int *)(param_4 + 0x1e));
  }
  iStack_4c = (uint)(ushort)param_4[0xe] * 0x28 + 0xb0;
  puStack_50 = (uint *)((uint)(ushort)param_4[0xe] * 0x28 + 0xb0 + (uint)(ushort)param_4[0xf] * 0x28
                       );
  iVar10 = *(int *)(param_4 + 0x20);
  piStack_54 = (int *)((int)puStack_50 + *(int *)(param_4 + 0x1a) * 0xc);
  iStack_68 = (int)piStack_54 + *(int *)(param_4 + 0x1e) * 0x1c;
  uStack_44 = *(int *)(param_4 + 0x22) * 0x34 + 0xf + iStack_68 & 0xfffffff0;
  uVar8 = uStack_44;
  for (iVar7 = iVar10; iVar7 != iVar10 + *(int *)(param_4 + 0x22) * 0x38; iVar7 = iVar7 + 0x38) {
    uVar8 = uVar8 + *(int *)(iVar7 + 4) * 4;
  }
  uStack_40 = uVar8 + 0xf & 0xfffffff0;
  iVar7 = iVar10 + *(int *)(param_4 + 0x22) * 0x38;
  uVar8 = uStack_40;
  for (; iVar10 != iVar7; iVar10 = iVar10 + 0x38) {
    uVar8 = uVar8 + *(int *)(iVar10 + 0xc) * 4;
  }
  iVar7 = *(int *)(param_4 + 0x12);
  uStack_6c = uVar8 + 0xf & 0xfffffff0;
  iVar10 = *(int *)(param_4 + 0x26) * 0x2c + uStack_6c;
  iStack_70 = iVar10;
  iVar4 = func_0x00bd31e0(param_4,&iStack_48);
  puStack_3c = (ushort *)(iVar10 + iVar7 * 4);
  iVar10 = (iVar4 + iStack_48) * 2;
  iStack_38 = (int)puStack_3c + iVar10;
  iVar10 = iStack_38 + iVar10;
  uVar8 = 0;
  if (*(int *)(param_4 + 0x16) != 0) {
    iVar7 = func_0x00416e90(*(int *)(param_4 + 0x16),0x10,4,0,0x18);
    uVar8 = iVar10 + 3U & 0xfffffffc;
    iVar10 = iVar7 + uVar8;
  }
  uStack_64 = 0;
  if (*(int *)(param_4 + 0x12) != 0) {
    iVar7 = func_0x00416e90(*(int *)(param_4 + 0x12),0x10,4,0,0x18);
    uStack_64 = iVar10 + 3U & 0xfffffffc;
    iVar10 = uStack_64 + iVar7;
  }
  uVar5 = FUN_00bd47c0(param_4);
  uStack_74 = iVar10 + 0xfU & 0xfffffff0;
  iStack_30 = (uVar5 & 0xffff) + uStack_74;
  iVar10 = func_0x00416480(iStack_30,param_2,0x10,0,0,0);
  iStack_24 = iVar10;
  if (iVar10 == 0) {
    uVar2 = func_0x00415c90(1,&UNK_010c7970);
    func_0x004160e0(uVar2);
    *unaff_FS_OFFSET = iStack_1c;
    return 0;
  }
  *(short **)(iVar10 + 4) = param_4;
  *(undefined4 *)(iVar10 + 0x60) = *(undefined4 *)(param_4 + 0x26);
  *(undefined4 *)(iVar10 + 100) = *(undefined4 *)(param_4 + 0x22);
  *(undefined4 *)(iVar10 + 0x68) = *(undefined4 *)(param_4 + 0x1e);
  *(undefined4 *)(iVar10 + 0x6c) = *(undefined4 *)(param_4 + 0x1a);
  *(short *)(iVar10 + 0x70) = param_4[0xe];
  *(short *)(iVar10 + 0x72) = param_4[0xf];
  iStack_58 = iVar10 + 0xb0;
  iStack_5c = iVar10 + iStack_4c;
  iStack_78 = iVar10 + (int)puStack_50;
  iStack_7c = iVar10 + (int)piStack_54;
  iStack_80 = iVar10 + iStack_68;
  uStack_84 = iVar10 + uStack_6c;
  iStack_28 = iVar10 + iStack_70;
  iStack_60 = 0;
  iStack_48 = 0;
  if (uVar8 != 0) {
    iStack_48 = iVar10 + uVar8;
  }
  iStack_4c = 0;
  if (uStack_64 != 0) {
    iStack_4c = uStack_64 + iVar10;
  }
  puStack_50 = (uint *)(uStack_74 + iVar10);
  uStack_14 = 0;
  iStack_2c = (int)puStack_50;
  if (puStack_50 != (uint *)0x0) {
    FUN_00be8070(param_4);
  }
  uStack_44 = iVar10 + uStack_44;
  uStack_40 = iVar10 + uStack_40;
  puStack_3c = (ushort *)(iVar10 + (int)puStack_3c);
  piStack_54 = (int *)(iVar10 + iStack_38);
  if (iStack_34 < 1) {
    iStack_78 = 0;
  }
  else {
    uStack_64 = *(uint *)(param_4 + 0x18);
    iStack_68 = iStack_34;
    iVar7 = iStack_78;
    do {
      uStack_14 = 1;
      iStack_38 = iVar7;
      if (iVar7 != 0) {
        iStack_34 = iVar7;
        FUN_00be7480(param_3,uStack_64);
      }
      iVar7 = iVar7 + 0xc;
      uStack_64 = uStack_64 + 0x24;
      iStack_68 = iStack_68 + -1;
    } while (iStack_68 != 0);
    iStack_68 = 0;
    iStack_34 = iVar7;
  }
  uStack_14 = 0xffffffff;
  if (*(int *)(param_4 + 0x1e) < 1) {
    iStack_7c = 0;
  }
  else {
    iVar7 = *(int *)(param_4 + 0x1c);
    iStack_34 = iVar7 + *(int *)(param_4 + 0x1e) * 0x1c;
    uStack_74 = iStack_7c;
    if (iVar7 != iStack_34) {
      do {
        FUN_00bac620(uStack_74,iVar7,iStack_78 + (uint)*(ushort *)(iVar7 + 0x14) * 0xc,0);
        uStack_74 = uStack_74 + 0x1c;
        iVar7 = iVar7 + 0x1c;
      } while (iVar7 != iStack_34);
    }
  }
  uStack_74 = 0;
  if (*(int *)(param_4 + 0x22) < 1) {
    iStack_80 = 0;
    iStack_58 = 0;
    iStack_5c = 0;
  }
  else {
    iStack_68 = iStack_80;
    iStack_38 = iStack_58;
    iStack_34 = iStack_5c;
    iStack_70 = uStack_44;
    uStack_6c = uStack_40;
    uStack_64 = 0;
    puStack_50 = (uint *)*(int *)(param_4 + 0x22);
    do {
      iVar7 = *(int *)(param_4 + 0x20) + uStack_64;
      uStack_44 = FUN_00bd2550(iVar7,&uStack_40);
      FUN_00bac670(iStack_68,iVar7,iVar10,&iStack_38,puStack_3c + uStack_74,
                   (int)piStack_54 + uStack_74 * 2,&iStack_34,puStack_3c + uStack_44 + uStack_74,
                   (int)piStack_54 + (uStack_44 + uStack_74) * 2,iStack_7c,iStack_70,uStack_84,
                   uStack_6c);
      iStack_68 = iStack_68 + 0x34;
      uStack_64 = uStack_64 + 0x38;
      uStack_74 = uStack_74 + uStack_40 + uStack_44;
      puStack_50 = (uint *)((int)puStack_50 + -1);
      iStack_70 = iStack_70 + *(int *)(iVar7 + 4) * 4;
      uStack_6c = uStack_6c + *(int *)(iVar7 + 0xc) * 4;
    } while (puStack_50 != (uint *)0x0);
    puStack_50 = (uint *)0x0;
  }
  if (*(int *)(param_4 + 0x26) < 1) {
    uStack_84 = 0;
  }
  else {
    puVar9 = *(ushort **)(param_4 + 0x24);
    puStack_3c = puVar9 + *(int *)(param_4 + 0x26) * 0x24;
    uStack_64 = uStack_84;
    if (puVar9 != puStack_3c) {
      do {
        cVar1 = func_0x00bac6f0(uStack_64,puVar9,(uint)*puVar9 * 0x34 + iStack_80);
        if (cVar1 == '\0') {
          uVar2 = func_0x00415c90(1,&UNK_010c7948);
          func_0x004160e0(uVar2);
          func_0x004162c0(iVar10);
          goto LAB_00bd4010;
        }
        iStack_60 = iStack_60 + *(int *)(uStack_64 + 8);
        uStack_64 = uStack_64 + 0x2c;
        puVar9 = puVar9 + 0x24;
      } while (puVar9 != puStack_3c);
    }
  }
  if (param_1 == (int *)0x0) {
    uVar2 = *(undefined4 *)(param_3 + 0x10c);
  }
  else {
    uVar2 = (**(code **)(*param_1 + 0x14))();
  }
  uStack_14 = 2;
  iStack_34 = iVar10;
  FUN_00bd3d20(param_3,param_2,uVar2,param_4,iStack_28,iStack_58,iStack_5c,iStack_78,iStack_7c,
               iStack_80,uStack_84,iStack_48,iStack_4c,iStack_2c,iStack_30,iStack_60);
  *unaff_FS_OFFSET = iStack_5c;
  return iVar10;
}


-- listing --
00bd3f70  PUSH EBP
00bd3f71  MOV EBP,ESP
00bd3f73  AND ESP,0xfffffff0
00bd3f76  MOV EAX,FS:[0x0]
00bd3f7c  PUSH -0x1
00bd3f7e  PUSH 0xeeb8a8
00bd3f83  PUSH EAX
00bd3f84  MOV dword ptr FS:[0x0],ESP
00bd3f8b  SUB ESP,0x68
00bd3f8e  PUSH EBX
00bd3f8f  PUSH ESI
00bd3f90  PUSH EDI
00bd3f91  MOV EDI,dword ptr [EBP + 0x14]
00bd3f94  MOVZX EAX,word ptr [EDI]
00bd3f97  MOVZX ECX,AX
00bd3f9a  CMP CX,0x1d
00bd3f9e  JZ 0x00bd4027
00bd3fa4  MOVZX EAX,AX
00bd3fa7  MOVZX EAX,AX
00bd3faa  PUSH 0x1d
00bd3fac  PUSH EAX
00bd3fad  PUSH 0x10c7a20
00bd3fb2  PUSH 0x2
00bd3fb4  CALL 0x00415c90
00bd3fb9  PUSH EAX
00bd3fba  CALL 0x004160e0
00bd3fbf  MOV ECX,dword ptr [EBP + 0x8]
00bd3fc2  MOV EDX,dword ptr [ECX]
00bd3fc4  MOV EAX,dword ptr [EDX + 0x10]
00bd3fc7  ADD ESP,0x14
00bd3fca  CALL EAX
00bd3fcc  MOV ECX,dword ptr [EAX]
00bd3fce  MOV dword ptr [0x013684d4],ECX
00bd3fd4  MOV EDX,dword ptr [EAX + 0x4]
00bd3fd7  MOV dword ptr [0x013684d8],EDX
00bd3fdd  MOV ECX,dword ptr [EAX + 0x8]
00bd3fe0  PUSH 0x13684d4
00bd3fe5  MOV dword ptr [0x013684dc],ECX
00bd3feb  MOV EDX,dword ptr [EAX + 0xc]
00bd3fee  PUSH 0x10c79fc
00bd3ff3  MOV dword ptr [0x013684e0],EDX
00bd3ff9  PUSH 0x2
00bd4027  MOV EAX,dword ptr [EDI + 0x34]
00bd402a  TEST EAX,EAX
00bd402c  MOV dword ptr [ESP + 0x5c],EAX
00bd4030  JLE 0x00bd407b
00bd4032  MOV ESI,dword ptr [EDI + 0x30]
00bd4035  MOV EBX,dword ptr [EDI + 0x58]
00bd4038  LEA EAX,[EAX + EAX*0x8]
00bd403b  LEA EAX,[ESI + EAX*0x4]
00bd403e  CMP ESI,EAX
00bd4040  MOV dword ptr [ESP + 0x48],EAX
00bd4044  JZ 0x00bd407b
00bd4046  MOVZX EAX,word ptr [ESI + 0x1c]
00bd404a  MOVZX EAX,AX
00bd404d  LEA ECX,[EAX + EAX*0x2]
00bd4050  LEA EDX,[ESP + 0xc]
00bd4054  LEA EAX,[EBX + ECX*0x8]
00bd4057  MOV ECX,dword ptr [EBP + 0x10]
00bd405a  PUSH EDX
00bd405b  PUSH EAX
00bd405c  CALL 0x00bacaf0
00bd4061  TEST AL,AL
00bd4063  JZ 0x00bd436c
00bd4069  MOV AX,word ptr [ESP + 0xc]
00bd406e  MOV word ptr [ESI + 0x1c],AX
00bd4072  ADD ESI,0x24
00bd4075  CMP ESI,dword ptr [ESP + 0x48]
00bd4079  JNZ 0x00bd4046
00bd407b  MOV EAX,dword ptr [EDI + 0x58]
00bd407e  MOV ECX,dword ptr [EBP + 0x10]
00bd4081  MOV EDX,dword ptr [ECX + 0x4]
00bd4084  MOV dword ptr [ESP + 0x48],EAX
00bd4088  XOR EAX,EAX
00bd408a  CMP dword ptr [EDI + 0x3c],EAX
00bd408d  MOV dword ptr [ESP + 0x44],EDX
00bd4091  MOV dword ptr [ESP + 0x34],EAX
00bd4095  JLE 0x00bd41bb
00bd409b  MOV dword ptr [ESP + 0x18],EAX
00bd409f  MOV ECX,dword ptr [EDI + 0x38]
00bd40a2  ADD ECX,dword ptr [ESP + 0x18]
00bd40a6  XOR EDX,EDX
00bd40a8  CMP dword ptr [ECX + 0x4],EDX
00bd40ab  MOV dword ptr [ESP + 0x3c],ECX
00bd40af  MOV dword ptr [ESP + 0x38],EDX
00bd40b3  JLE 0x00bd41a2
00bd40b9  MOV EAX,dword ptr [ECX]
00bd40bb  MOV EBX,dword ptr [EAX + EDX*0x4]
00bd40be  LEA EAX,[EAX + EDX*0x4]
00bd40c1  MOV dword ptr [ESP + 0x40],EAX
00bd40c5  MOV EAX,EBX
00bd40c7  AND EAX,0xf0000000
00bd40cc  CMP EAX,0x10000000
00bd40d1  JZ 0x00bd40de
00bd40d3  CMP EAX,0x20000000
00bd40d8  JNZ 0x00bd4192
00bd40de  MOV EDX,dword ptr [ESP + 0x48]
00bd40e2  MOV EAX,EBX
00bd40e4  SHR EAX,0x10
00bd40e7  AND EAX,0xfff
00bd40ec  LEA ECX,[EAX + EAX*0x2]
00bd40ef  LEA EAX,[EDX + ECX*0x8]
00bd40f2  MOV EAX,dword ptr [EAX + 0x10]
00bd40f5  MOV ECX,dword ptr [EBP + 0x10]
00bd40f8  PUSH EAX
00bd40f9  CALL 0x00bac8f0
00bd40fe  MOV ESI,EAX
00bd4100  TEST ESI,ESI
00bd4102  JNZ 0x00bd4162
00bd4162  SUB ESI,dword ptr [ESP + 0x44]
00bd4166  MOV ECX,dword ptr [ESP + 0x40]
00bd416a  MOV EAX,0x8d3dcb09
00bd416f  IMUL ESI
00bd4171  ADD EDX,ESI
00bd4173  SAR EDX,0x7
00bd4176  MOV EAX,EDX
00bd4178  SHR EAX,0x1f
00bd417b  ADD EAX,EDX
00bd417d  MOV EDX,dword ptr [ESP + 0x38]
00bd4181  AND EBX,0xf000ffff
00bd4187  SHL EAX,0x10
00bd418a  OR EAX,EBX
00bd418c  MOV dword ptr [ECX],EAX
00bd418e  MOV ECX,dword ptr [ESP + 0x3c]
00bd4192  ADD EDX,0x1
00bd4195  CMP EDX,dword ptr [ECX + 0x4]
00bd4198  MOV dword ptr [ESP + 0x38],EDX
00bd419c  JL 0x00bd40b9
00bd41a2  MOV EAX,dword ptr [ESP + 0x34]
00bd41a6  ADD dword ptr [ESP + 0x18],0x1c
00bd41ab  ADD EAX,0x1
00bd41ae  CMP EAX,dword ptr [EDI + 0x3c]
00bd41b1  MOV dword ptr [ESP + 0x34],EAX
00bd41b5  JL 0x00bd409f
00bd41bb  MOVZX EAX,word ptr [EDI + 0x1c]
00bd41bf  MOVZX ECX,word ptr [EDI + 0x1e]
00bd41c3  MOVZX EAX,AX
00bd41c6  LEA EAX,[EAX + EAX*0x4]
00bd41c9  LEA EAX,[EAX*0x8 + 0xb3]
00bd41d0  AND EAX,0xfffffffc
00bd41d3  MOVZX ECX,CX
00bd41d6  LEA EDX,[ECX + ECX*0x4]
00bd41d9  MOV ECX,dword ptr [EDI + 0x34]
00bd41dc  MOV dword ptr [ESP + 0x44],EAX
00bd41e0  LEA EAX,[EAX + EDX*0x8 + 0x3]
00bd41e4  AND EAX,0xfffffffc
00bd41e7  MOV ESI,dword ptr [EDI + 0x40]
00bd41ea  MOV dword ptr [ESP + 0x40],EAX
00bd41ee  LEA ECX,[ECX + ECX*0x2]
00bd41f1  LEA EAX,[EAX + ECX*0x4 + 0x3]
00bd41f5  MOV ECX,dword ptr [EDI + 0x3c]
00bd41f8  AND EAX,0xfffffffc
00bd41fb  LEA EDX,[ECX*0x8 + 0x0]
00bd4202  SUB EDX,ECX
00bd4204  MOV dword ptr [ESP + 0x3c],EAX
00bd4208  LEA EAX,[EAX + EDX*0x4 + 0x3]
00bd420c  MOV EDX,dword ptr [EDI + 0x44]
00bd420f  MOV ECX,EDX
00bd4211  IMUL ECX,ECX,0x34
00bd4214  AND EAX,0xfffffffc
00bd4217  MOV dword ptr [ESP + 0x28],EAX
00bd421b  LEA EBX,[EDX*0x8 + 0x0]
00bd4222  LEA EAX,[ECX + EAX*0x1 + 0xf]
00bd4226  MOV ECX,ESI
00bd4228  SUB EBX,EDX
00bd422a  AND EAX,0xfffffff0
00bd422d  LEA EDX,[ECX + EBX*0x8]
00bd4230  CMP ECX,EDX
00bd4232  MOV dword ptr [ESP + 0x4c],EAX
00bd4236  JZ 0x00bd4245
00bd4238  MOV EBX,dword ptr [ECX + 0x4]
00bd423b  ADD ECX,0x38
00bd423e  CMP ECX,EDX
00bd4240  LEA EAX,[EAX + EBX*0x4]
00bd4243  JNZ 0x00bd4238
00bd4245  MOV EDX,dword ptr [EDI + 0x44]
00bd4248  MOV ECX,ESI
00bd424a  LEA ESI,[EDX*0x8 + 0x0]
00bd4251  SUB ESI,EDX
00bd4253  ADD EAX,0xf
00bd4256  AND EAX,0xfffffff0
00bd4259  LEA EDX,[ECX + ESI*0x8]
00bd425c  CMP ECX,EDX
00bd425e  MOV dword ptr [ESP + 0x50],EAX
00bd4262  JZ 0x00bd4271
00bd4264  MOV ESI,dword ptr [ECX + 0xc]
00bd4267  ADD ECX,0x38
00bd426a  CMP ECX,EDX
00bd426c  LEA EAX,[EAX + ESI*0x4]
00bd426f  JNZ 0x00bd4264
00bd4271  MOV ESI,dword ptr [EDI + 0x4c]
00bd4274  MOV EBX,dword ptr [EDI + 0x24]
00bd4277  IMUL ESI,ESI,0x2c
00bd427a  ADD EAX,0xf
00bd427d  AND EAX,0xfffffff0
00bd4280  LEA EDX,[ESP + 0x48]
00bd4284  LEA ESI,[ESI + EAX*0x1 + 0x3]
00bd4288  PUSH EDX
00bd4289  AND ESI,0xfffffffc
00bd428c  PUSH EDI
00bd428d  MOV dword ptr [ESP + 0x2c],EAX
00bd4291  MOV dword ptr [ESP + 0x28],ESI
00bd4295  CALL 0x00bd31e0
00bd429a  MOV ECX,dword ptr [ESP + 0x50]
00bd429e  LEA ESI,[ESI + EBX*0x4 + 0x1]
00bd42a2  AND ESI,0xfffffffe
00bd42a5  ADD EAX,ECX
00bd42a7  ADD EAX,EAX
00bd42a9  MOV dword ptr [ESP + 0x5c],ESI
00bd42ad  ADD ESI,EAX
00bd42af  MOV dword ptr [ESP + 0x60],ESI
00bd42b3  ADD ESI,EAX
00bd42b5  MOV EAX,dword ptr [EDI + 0x2c]
00bd42b8  ADD ESP,0x8
00bd42bb  XOR EBX,EBX
00bd42bd  TEST EAX,EAX
00bd42bf  JZ 0x00bd42da
00bd42c1  PUSH 0x18
00bd42c3  PUSH EBX
00bd42c4  PUSH 0x4
00bd42c6  PUSH 0x10
00bd42c8  PUSH EAX
00bd42c9  CALL 0x00416e90
00bd42ce  LEA EBX,[ESI + 0x3]
00bd42d1  ADD ESP,0x14
00bd42d4  AND EBX,0xfffffffc
00bd42d7  LEA ESI,[EAX + EBX*0x1]
00bd42da  MOV EAX,dword ptr [EDI + 0x24]
00bd42dd  TEST EAX,EAX
00bd42df  MOV dword ptr [ESP + 0x2c],0x0
00bd42e7  JZ 0x00bd4306
00bd42e9  PUSH 0x18
00bd42eb  PUSH 0x0
00bd42ed  PUSH 0x4
00bd42ef  PUSH 0x10
00bd42f1  PUSH EAX
00bd42f2  CALL 0x00416e90
00bd42f7  ADD ESI,0x3
00bd42fa  AND ESI,0xfffffffc
00bd42fd  ADD ESP,0x14
00bd4300  MOV dword ptr [ESP + 0x2c],ESI
00bd4304  ADD ESI,EAX
00bd4306  PUSH EDI
00bd4307  CALL 0x00bd47c0
00bd430c  MOV EDX,dword ptr [EBP + 0xc]
00bd430f  PUSH 0x0
00bd4311  MOVZX EAX,AX
00bd4314  PUSH 0x0
00bd4316  PUSH 0x0
00bd4318  MOVZX EAX,AX
00bd431b  ADD ESI,0xf
00bd431e  AND ESI,0xfffffff0
00bd4321  PUSH 0x10
00bd4323  ADD EAX,ESI
00bd4325  PUSH EDX
00bd4326  PUSH EAX
00bd4327  MOV dword ptr [ESP + 0x38],ESI
00bd432b  MOV dword ptr [ESP + 0x7c],EAX
00bd432f  CALL 0x00416480
00bd4334  MOV ESI,EAX
00bd4336  XOR EDX,EDX
00bd4338  ADD ESP,0x1c
00bd433b  CMP ESI,EDX
00bd433d  MOV dword ptr [ESP + 0x6c],ESI
00bd4341  JNZ 0x00bd43a0
00bd4343  PUSH 0x10c7970
00bd4348  PUSH 0x1
00bd434a  CALL 0x00415c90
00bd434f  PUSH EAX
00bd4350  CALL 0x004160e0
00bd4355  ADD ESP,0xc
00bd4358  XOR EAX,EAX
00bd435a  MOV ECX,dword ptr [ESP + 0x74]
00bd435e  MOV dword ptr FS:[0x0],ECX
00bd4365  POP EDI
00bd4366  POP ESI
00bd4367  POP EBX
00bd4368  MOV ESP,EBP
00bd436a  POP EBP
00bd436b  RET
00bd436c  MOV EAX,dword ptr [EDI + 0x4]
00bd436f  MOV ECX,dword ptr [EDI + 0x8]
00bd4372  MOV EDX,dword ptr [EDI + 0xc]
00bd4375  MOV EDI,dword ptr [EDI + 0x10]
00bd4378  PUSH 0x13684d4
00bd437d  PUSH 0x10c79fc
00bd4382  MOV [0x013684d4],EAX
00bd4387  MOV dword ptr [0x013684d8],ECX
00bd438d  MOV dword ptr [0x013684dc],EDX
00bd4393  MOV dword ptr [0x013684e0],EDI
00bd4399  PUSH 0x1
00bd439b  JMP 0x00bd3ffb
00bd43a0  CMP EBX,EDX
00bd43a2  MOV dword ptr [ESI + 0x4],EDI
00bd43a5  MOV EAX,dword ptr [EDI + 0x4c]
00bd43a8  MOV dword ptr [ESI + 0x60],EAX
00bd43ab  MOV ECX,dword ptr [EDI + 0x44]
00bd43ae  MOV dword ptr [ESI + 0x64],ECX
00bd43b1  MOV EAX,dword ptr [EDI + 0x3c]
00bd43b4  MOV dword ptr [ESI + 0x68],EAX
00bd43b7  MOV ECX,dword ptr [EDI + 0x34]
00bd43ba  MOV dword ptr [ESI + 0x6c],ECX
00bd43bd  MOV AX,word ptr [EDI + 0x1c]
00bd43c1  MOV word ptr [ESI + 0x70],AX
00bd43c5  MOV CX,word ptr [EDI + 0x1e]
00bd43c9  MOV word ptr [ESI + 0x72],CX
00bd43cd  MOV ECX,dword ptr [ESP + 0x44]
00bd43d1  LEA EAX,[ESI + 0xb0]
00bd43d7  MOV dword ptr [ESP + 0x38],EAX
00bd43db  LEA EAX,[ESI + ECX*0x1]
