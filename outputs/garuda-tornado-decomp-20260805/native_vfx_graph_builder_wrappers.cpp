program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BAC620 =====
entry=00bac620
body=[[00bac620, 00bac66d]]
completed=true
message=

void FUN_00bac620(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *unaff_FS_OFFSET;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  puStack_8 = &UNK_00eea7c1;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  uStack_4 = 0;
  if (param_1 != 0) {
    func_0x00bd20c0(param_2,param_3,param_4,param_1);
  }
  *unaff_FS_OFFSET = uStack_c;
  return;
}


-- listing --
00bac620  PUSH -0x1
00bac622  PUSH 0xeea7c1
00bac627  MOV EAX,FS:[0x0]
00bac62d  PUSH EAX
00bac62e  MOV dword ptr FS:[0x0],ESP
00bac635  PUSH ECX
00bac636  MOV ECX,dword ptr [ESP + 0x14]
00bac63a  MOV dword ptr [ESP],ECX
00bac63d  TEST ECX,ECX
00bac63f  MOV dword ptr [ESP + 0xc],0x0
00bac647  JZ 0x00bac65d
00bac649  MOV EAX,dword ptr [ESP + 0x20]
00bac64d  MOV EDX,dword ptr [ESP + 0x1c]
00bac651  PUSH EAX
00bac652  MOV EAX,dword ptr [ESP + 0x1c]
00bac656  PUSH EDX
00bac657  PUSH EAX
00bac658  CALL 0x00bd20c0
00bac65d  MOV ECX,dword ptr [ESP + 0x4]
00bac661  MOV dword ptr FS:[0x0],ECX
00bac668  ADD ESP,0x10
00bac66b  RET 0x10

===== 00BAC670 =====
entry=00bac670
body=[[00bac670, 00bac6d8]]
completed=true
message=

void __thiscall
FUN_00bac670(undefined4 param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5
            ,undefined4 param_6,undefined4 param_7,undefined4 param_8,undefined4 param_9,
            undefined4 param_10,undefined4 param_11,undefined4 param_12,undefined4 param_13,
            undefined4 param_14)

{
  undefined4 *unaff_FS_OFFSET;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  puStack_8 = &UNK_00eea7dc;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  uStack_4 = 0;
  if (param_2 != 0) {
    FUN_00bd2660(param_2,param_1,param_3,param_4,param_5,param_6,param_7,param_8,param_9,param_10,
                 param_11,param_12,param_13,param_14,param_2);
  }
  *unaff_FS_OFFSET = uStack_c;
  return;
}


-- listing --
00bac670  PUSH -0x1
00bac672  PUSH 0xeea7dc
00bac677  MOV EAX,FS:[0x0]
00bac67d  PUSH EAX
00bac67e  MOV dword ptr FS:[0x0],ESP
00bac685  PUSH ECX
00bac686  MOV EAX,dword ptr [ESP + 0x14]
00bac68a  MOV dword ptr [ESP],EAX
00bac68d  TEST EAX,EAX
00bac68f  MOV dword ptr [ESP + 0xc],0x0
00bac697  JZ 0x00bac6de
00bac699  MOV EDX,dword ptr [ESP + 0x44]
00bac69d  PUSH EDX
00bac69e  MOV EDX,dword ptr [ESP + 0x44]
00bac6a2  PUSH EDX
00bac6a3  MOV EDX,dword ptr [ESP + 0x44]
00bac6a7  PUSH EDX
00bac6a8  MOV EDX,dword ptr [ESP + 0x44]
00bac6ac  PUSH EDX
00bac6ad  MOV EDX,dword ptr [ESP + 0x44]
00bac6b1  PUSH EDX
00bac6b2  MOV EDX,dword ptr [ESP + 0x44]
00bac6b6  PUSH EDX
00bac6b7  MOV EDX,dword ptr [ESP + 0x44]
00bac6bb  PUSH EDX
00bac6bc  MOV EDX,dword ptr [ESP + 0x44]
00bac6c0  PUSH EDX
00bac6c1  MOV EDX,dword ptr [ESP + 0x44]
00bac6c5  PUSH EDX
00bac6c6  MOV EDX,dword ptr [ESP + 0x44]
00bac6ca  PUSH EDX
00bac6cb  MOV EDX,dword ptr [ESP + 0x44]
00bac6cf  PUSH EDX
00bac6d0  MOV EDX,dword ptr [ESP + 0x44]
00bac6d4  PUSH EDX
00bac6d5  PUSH ECX
00bac6d6  PUSH EAX
00bac6d7  MOV ECX,EAX

===== 00BD2550 =====
entry=00bd2550
body=[[00bd2550, 00bd25a1]]
completed=true
message=

int FUN_00bd2550(int param_1,int *param_2)

{
  int iVar1;
  ushort *puVar2;
  int iVar3;
  int iVar4;
  
  iVar3 = *(int *)(param_1 + 0x1c);
  iVar1 = 0;
  iVar4 = 0;
  if (0 < iVar3) {
    puVar2 = (ushort *)(*(int *)(param_1 + 0x18) + 8);
    do {
      iVar1 = iVar1 + (uint)*puVar2;
      puVar2 = puVar2 + 6;
      iVar3 = iVar3 + -1;
    } while (iVar3 != 0);
  }
  iVar3 = *(int *)(param_1 + 0x24);
  if (iVar3 < 1) {
    *param_2 = 0;
    return iVar1;
  }
  puVar2 = (ushort *)(*(int *)(param_1 + 0x20) + 8);
  do {
    iVar4 = iVar4 + (uint)*puVar2;
    puVar2 = puVar2 + 6;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  *param_2 = iVar4;
  return iVar1;
}


-- listing --
00bd2550  PUSH ESI
00bd2551  MOV ESI,dword ptr [ESP + 0x8]
00bd2555  MOV EDX,dword ptr [ESI + 0x1c]
00bd2558  PUSH EDI
00bd2559  XOR EAX,EAX
00bd255b  XOR EDI,EDI
00bd255d  TEST EDX,EDX
00bd255f  JLE 0x00bd2576
00bd2561  MOV ECX,dword ptr [ESI + 0x18]
00bd2564  ADD ECX,0x8
00bd2567  PUSH EBX
00bd2568  MOVZX EBX,word ptr [ECX]
00bd256b  ADD EAX,EBX
00bd256d  ADD ECX,0xc
00bd2570  SUB EDX,0x1
00bd2573  JNZ 0x00bd2568
00bd2575  POP EBX
00bd2576  MOV EDX,dword ptr [ESI + 0x24]
00bd2579  TEST EDX,EDX
00bd257b  JLE 0x00bd2599
00bd257d  MOV ECX,dword ptr [ESI + 0x20]
00bd2580  ADD ECX,0x8
00bd2583  MOVZX ESI,word ptr [ECX]
00bd2586  ADD EDI,ESI
00bd2588  ADD ECX,0xc
00bd258b  SUB EDX,0x1
00bd258e  JNZ 0x00bd2583
00bd2590  MOV ECX,dword ptr [ESP + 0x10]
00bd2594  MOV dword ptr [ECX],EDI
00bd2596  POP EDI
00bd2597  POP ESI
00bd2598  RET
00bd2599  MOV EDX,dword ptr [ESP + 0x10]
00bd259d  MOV dword ptr [EDX],EDI
00bd259f  POP EDI
00bd25a0  POP ESI
00bd25a1  RET

===== 00BD2660 =====
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
      FUN_00bd2220(uVar8);
      uVar8 = *(int *)(iVar1 + 0x1c) + 0xf + uVar8 & 0xfffffff0;
      FUN_00bd22f0(uVar8);
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
