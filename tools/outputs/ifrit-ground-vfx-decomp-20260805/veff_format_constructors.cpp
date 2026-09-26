===== 0xc08790 =====

void __fastcall FUN_00c08790(undefined4 *param_1)

{
  undefined4 *unaff_FS_OFFSET;
  undefined4 unaff_retaddr;
  undefined1 uStack00000008;
  uint3 uStack00000009;
  
  *param_1 = &UNK_010d160c;
  _uStack00000008 = 0xe;
  func_0x00c06ce0();
  uStack00000008 = 0xd;
  func_0x00c06ce0();
  uStack00000008 = 0xc;
  func_0x00c06ce0();
  uStack00000008 = 0xb;
  func_0x00c06ce0();
  uStack00000008 = 10;
  func_0x00c06ce0();
  uStack00000008 = 9;
  func_0x00c06ce0();
  uStack00000008 = 8;
  func_0x00c06ce0();
  uStack00000008 = 7;
  func_0x00c06ce0();
  uStack00000008 = 6;
  func_0x00c06ce0();
  uStack00000008 = 5;
  func_0x00c06ce0();
  uStack00000008 = 4;
  func_0x00c06ce0();
  uStack00000008 = 3;
  func_0x00c06ce0();
  uStack00000008 = 2;
  func_0x00c06ce0();
  uStack00000008 = 1;
  func_0x00c06ce0();
  _uStack00000008 = (uint)uStack00000009 << 8;
  func_0x00c02a30();
  *param_1 = &UNK_010d14d4;
  param_1[1] = &UNK_010cdfbc;
  *unaff_FS_OFFSET = unaff_retaddr;
  return;
}


===== 0xc07e00 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00c07e00(void)

{
  char *in_EAX;
  
  *in_EAX = *in_EAX + (char)in_EAX;
  func_0x009d4f9f(&stack0x00000000,0x800,0x7ff,&UNK_00f54cf8);
  (*_DAT_012651b4)(&stack0x00000000,6);
  _DAT_00000000 = 0;
  return;
}


===== 0xc07b40 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c07a20(int *param_1,int *param_2,char param_3)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int *piVar7;
  int *piVar8;
  int iStack_20;
  int iStack_1c;
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  int iStack_8;
  int iStack_4;
  
  if (*(uint *)(_DAT_0136e5f8 + 0xc) < 3) {
    uVar1 = *(undefined8 *)(param_2 + 2);
    iStack_20 = (int)*(undefined8 *)param_2;
    iStack_1c = (int)((ulonglong)*(undefined8 *)param_2 >> 0x20);
    uVar2 = *(undefined8 *)(param_2 + 4);
    uVar3 = *(undefined8 *)(param_2 + 6);
    iStack_18 = (int)uVar1;
    param_1[1] = iStack_20;
    iStack_14 = (int)((ulonglong)uVar1 >> 0x20);
    param_1[8] = iStack_1c;
    iStack_10 = (int)uVar2;
    param_1[9] = iStack_18;
    iStack_c = (int)((ulonglong)uVar2 >> 0x20);
    param_1[10] = iStack_14;
    iStack_8 = (int)uVar3;
    param_1[0xb] = iStack_10;
    iStack_4 = (int)((ulonglong)uVar3 >> 0x20);
    param_1[2] = 0;
    param_1[3] = 0;
    param_1[4] = 0;
    param_1[5] = 0;
    param_1[6] = 0;
    param_1[7] = 0;
    param_1[0xc] = iStack_c;
    param_1[0xd] = iStack_8;
    param_1[0xe] = iStack_4;
    if (param_3 == '\x01') {
      (**(code **)(*param_1 + 0x10))();
      return;
    }
  }
  else {
    piVar5 = param_1 + 1;
    piVar7 = param_2;
    piVar8 = piVar5;
    for (iVar4 = 0xe; iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar8 = *piVar7;
      piVar7 = piVar7 + 1;
      piVar8 = piVar8 + 1;
    }
    piVar7 = param_2 + 0xe;
    piVar8 = param_1 + 0xf;
    for (iVar4 = 0xe; iVar4 != 0; iVar4 = iVar4 + -1) {
      *piVar8 = *piVar7;
      piVar7 = piVar7 + 1;
      piVar8 = piVar8 + 1;
    }
    if (param_3 == '\x01') {
      (**(code **)(*param_1 + 0x10))();
    }
    iVar4 = 0;
    iVar6 = 0xe;
    do {
      iVar4 = iVar4 + *piVar5;
      piVar5 = piVar5 + 1;
      iVar6 = iVar6 + -1;
    } while (iVar6 != 0);
    if (iVar4 != 0) {
      iVar6 = func_0x00416480(iVar4 * 4,0x48,0x10,0,0,0);
      param_1[0x1d] = iVar6;
      func_0x009d4600(iVar6,param_2 + 0x1c,iVar4 * 4);
      if (param_3 == '\x01') {
        (**(code **)(*param_1 + 0x14))();
      }
    }
  }
  return;
}


===== 0xc07140 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c07030(int *param_1,undefined8 *param_2,undefined4 param_3)

{
  int iVar1;
  
  *(undefined8 *)(param_1 + 1) = *param_2;
  param_1[3] = *(int *)(param_2 + 1);
  *(undefined8 *)(param_1 + 4) = *(undefined8 *)((int)param_2 + 0xc);
  param_1[6] = *(int *)((int)param_2 + 0x14);
  *(undefined8 *)(param_1 + 7) = param_2[3];
  param_1[9] = *(int *)(param_2 + 4);
  *(undefined8 *)(param_1 + 10) = *(undefined8 *)((int)param_2 + 0x24);
  param_1[0xc] = *(int *)((int)param_2 + 0x2c);
  *(undefined8 *)(param_1 + 0xd) = param_2[6];
  param_1[0xf] = *(int *)(param_2 + 7);
  iVar1 = 0x3c;
  if (_DAT_0136e5f8 == 0) {
    *(undefined8 *)(param_1 + 0x10) = *(undefined8 *)((int)param_2 + 0x3c);
    param_1[0x12] = *(int *)((int)param_2 + 0x44);
    *(undefined8 *)(param_1 + 0x13) = param_2[9];
    param_1[0x15] = *(int *)(param_2 + 10);
    iVar1 = 0x54;
  }
  else if (*(uint *)(_DAT_0136e5f8 + 0xc) < 2) {
    if (6 < *(uint *)(_DAT_0136e5f8 + 0x10)) {
      *(undefined8 *)(param_1 + 0x10) = *(undefined8 *)((int)param_2 + 0x3c);
      param_1[0x12] = *(int *)((int)param_2 + 0x44);
      iVar1 = 0x48;
    }
    if (7 < *(uint *)(_DAT_0136e5f8 + 0x10)) {
      *(undefined8 *)(param_1 + 0x13) = *(undefined8 *)((int)param_2 + iVar1);
      param_1[0x15] = *(int *)((int)param_2 + iVar1 + 8);
      iVar1 = iVar1 + 0xc;
    }
  }
  else {
    *(undefined8 *)(param_1 + 0x10) = *(undefined8 *)((int)param_2 + 0x3c);
    param_1[0x12] = *(int *)((int)param_2 + 0x44);
    *(undefined8 *)(param_1 + 0x13) = param_2[9];
    param_1[0x15] = *(int *)(param_2 + 10);
    iVar1 = 0x54;
  }
  if ((char)param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  (**(code **)(param_1[0x16] + 0xc))(iVar1 + (int)param_2,param_3);
  return;
}


===== 0xc07f00 =====

void __fastcall FUN_00c07f00(undefined4 param_1,undefined4 param_2)

{
  char *in_EAX;
  
  *in_EAX = *in_EAX + (char)in_EAX;
  *(undefined4 *)(in_EAX + 0xd0) = param_1;
  *(undefined4 *)(in_EAX + 0xd4) = param_1;
  *(undefined4 *)(in_EAX + 0xd8) = param_2;
  *(undefined4 *)(in_EAX + 0xdc) = param_1;
  *(undefined4 *)(in_EAX + 0xe0) = param_1;
  *(undefined4 *)(in_EAX + 0xe8) = param_1;
  *(undefined4 *)(in_EAX + 0xec) = param_1;
  *(undefined **)(in_EAX + 0xe4) = &UNK_010d1528;
  *(undefined4 *)(in_EAX + 0xf4) = param_1;
  *(undefined4 *)(in_EAX + 0xf8) = param_1;
  *(undefined **)(in_EAX + 0xf0) = &UNK_010d1548;
  *(undefined **)(in_EAX + 0xfc) = &UNK_010d1548;
  *(undefined4 *)(in_EAX + 0x100) = param_1;
  *(undefined4 *)(in_EAX + 0x104) = param_1;
  *(undefined **)(in_EAX + 0x108) = &UNK_010d1548;
  *(undefined4 *)(in_EAX + 0x10c) = param_1;
  *(undefined4 *)(in_EAX + 0x110) = param_1;
  *(undefined4 *)(in_EAX + 0x118) = param_1;
  *(undefined4 *)(in_EAX + 0x11c) = param_1;
  *(undefined **)(in_EAX + 0x114) = &UNK_010d1568;
  *(undefined4 *)(in_EAX + 0x124) = param_1;
  *(undefined4 *)(in_EAX + 0x128) = param_1;
  *(undefined **)(in_EAX + 0x120) = &UNK_010d1568;
  *(undefined4 *)(in_EAX + 0x130) = param_1;
  *(undefined4 *)(in_EAX + 0x134) = param_1;
  *(undefined **)(in_EAX + 300) = &UNK_010d1568;
  in_EAX[8] = '\x01';
  in_EAX[0xc] = 's';
  in_EAX[0xd] = 'n';
  in_EAX[0xe] = 'i';
  in_EAX[0xf] = 'v';
  in_EAX[0x10] = '\x04';
  in_EAX[0x11] = '\0';
  in_EAX[0x12] = '\0';
  in_EAX[0x13] = '\0';
  *(undefined4 *)(in_EAX + 0x14) = param_1;
  return;
}


===== 0xc02a00 =====

void __fastcall FUN_00c02a00(int param_1,uint param_2)

{
  byte *pbVar1;
  uint in_EAX;
  int unaff_EBX;
  uint unaff_ESI;
  
  pbVar1 = (byte *)(unaff_EBX + 0x10eec1f0);
  *pbVar1 = *pbVar1 >> 1 | *pbVar1 << 7;
  *(uint *)(param_1 + 4) =
       (param_2 & 0xff0000 | unaff_ESI) >> 8 | (in_EAX & 0xff00 | in_EAX << 0x10) << 8;
  return;
}


===== 0xc03080 =====

undefined4 __thiscall
FUN_00c03080(int param_1,undefined4 param_2,undefined4 param_3,undefined1 param_4,int param_5)

{
  char *in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 unaff_EBX;
  int *unaff_ESI;
  undefined4 *unaff_FS_OFFSET;
  char in_CF;
  undefined *puStack0000001c;
  undefined1 uStack00000020;
  undefined1 uStack00000021;
  undefined1 uStack00000022;
  undefined1 uStack00000023;
  undefined1 uStack000000b0;
  int *piVar5;
  
  (&UNK_00b0249c)[param_1] = ((&UNK_00b0249c)[param_1] - (char)param_1) - in_CF;
  *in_EAX = *in_EAX + (char)in_EAX;
  puStack0000001c = &UNK_010ce1d0;
  uStack00000020 = (undefined1)unaff_EBX;
  uStack000000b0 = 1;
  uStack00000021 = uStack00000020;
  uStack00000022 = uStack00000020;
  uStack00000023 = uStack00000020;
  iVar1 = FUN_00c06940();
  iVar2 = 0;
  do {
    *(undefined4 *)(&stack0x00000030 + iVar2 * 4) = unaff_EBX;
    *(undefined4 *)(&stack0x00000068 + iVar2 * 4) = unaff_EBX;
    iVar2 = iVar2 + 1;
  } while (iVar2 < 0xe);
  iVar2 = FUN_00c07940();
  iVar1 = iVar1 + iVar2;
  iVar2 = 0;
  if (*unaff_ESI != iVar1) {
    do {
      func_0x00c06a60(unaff_ESI[1] + iVar1,unaff_ESI[2] != 1);
      iVar3 = FUN_00c06a10();
      iVar1 = iVar1 + iVar3;
      switch(param_4) {
      case 1:
        unaff_ESI[3] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 2:
        unaff_ESI[4] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 3:
        unaff_ESI[5] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 4:
        unaff_ESI[6] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 5:
        unaff_ESI[7] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 6:
        unaff_ESI[8] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 7:
        unaff_ESI[9] = iVar2;
        iVar3 = func_0x00c02ac0(unaff_ESI[1] + iVar1,unaff_ESI[0x18] + iVar2 * 4);
        iVar2 = iVar2 + iVar3;
        break;
      case 8:
        func_0x00c02bd0(unaff_ESI[1] + iVar1);
        break;
      case 9:
        func_0x00c02d60(unaff_ESI[1] + iVar1,unaff_ESI[0x1a],unaff_ESI + 0xc);
        break;
      case 10:
        func_0x00c02d60(unaff_ESI[1] + iVar1,unaff_ESI[0x1b],unaff_ESI + 0xe);
        break;
      case 0xb:
        func_0x00c02d60(unaff_ESI[1] + iVar1,unaff_ESI[0x1c],unaff_ESI + 0x10);
        break;
      case 0xc:
        iVar3 = unaff_ESI[0x1d];
        piVar5 = unaff_ESI + 0x12;
        iVar4 = unaff_ESI[1] + iVar1;
        goto code_r0x00c0328f;
      case 0xd:
        piVar5 = unaff_ESI + 0x14;
        iVar3 = unaff_ESI[0x1e];
        iVar4 = unaff_ESI[1] + iVar1;
        goto code_r0x00c0328f;
      case 0xe:
        iVar3 = unaff_ESI[0x1f];
        piVar5 = unaff_ESI + 0x16;
        iVar4 = unaff_ESI[1] + iVar1;
code_r0x00c0328f:
        func_0x00c02ef0(iVar4,iVar3,piVar5);
      }
      iVar1 = iVar1 + param_5;
    } while (*unaff_ESI != iVar1);
  }
  func_0x00c02a30();
  *unaff_FS_OFFSET = unaff_EBX;
  return 1;
}


===== 0xc03300 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int * __thiscall FUN_00c03300(int param_1)

{
  int *piVar1;
  char cVar2;
  code *pcVar3;
  char *pcVar4;
  byte *in_EAX;
  int *piVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  uint uVar14;
  undefined4 *unaff_FS_OFFSET;
  bool in_OF;
  int in_stack_0000002c;
  int in_stack_00000030;
  int in_stack_00000034;
  int in_stack_00000038;
  int in_stack_0000003c;
  int in_stack_00000040;
  int in_stack_00000044;
  int in_stack_00000048;
  int in_stack_0000004c;
  int in_stack_00000050;
  int in_stack_00000054;
  int in_stack_00000058;
  int in_stack_0000005c;
  int in_stack_00000060;
  undefined4 in_stack_000000a0;
  uint in_stack_000000a8;
  int in_stack_000000b4;
  char in_stack_000000b8;
  char *in_stack_000000bc;
  
  pcVar4 = in_stack_000000bc;
  if (in_OF) {
    *in_EAX = *in_EAX << 1 | *in_EAX >> 7;
    pcVar3 = (code *)swi(3);
    piVar5 = (int *)(*pcVar3)();
    return piVar5;
  }
  *(int *)(&UNK_00a8248c + param_1) = *(int *)(&UNK_00a8248c + param_1) + param_1;
  *in_EAX = *in_EAX + (char)in_EAX;
  iVar6 = 0;
  do {
    (&stack0x00000038)[iVar6] = param_1;
    *(int *)(&stack0x00000070 + iVar6 * 4) = param_1;
    iVar6 = iVar6 + 1;
  } while (iVar6 < 0xe);
  cVar2 = *in_stack_000000bc;
  in_stack_000000b4 = CONCAT31((int3)((uint)param_1 >> 8),1);
  iVar6 = FUN_00c06940(param_1);
  if (cVar2 == '\0') {
    func_0x00c068b0();
  }
  _DAT_0136e5f8 = &stack0xfffffffc;
  FUN_00c07a20(pcVar4 + iVar6,cVar2 == '\0');
  in_stack_000000a8 = in_stack_000000a8 & 0xffffff00;
  in_stack_0000002c =
       in_stack_00000044 + in_stack_00000040 + in_stack_0000003c + in_stack_00000038 +
       in_stack_00000034 + in_stack_00000030 + in_stack_0000002c;
  iVar7 = (in_stack_0000002c * 4 + 0x10) - (in_stack_0000002c * 4 & 0xfU);
  iVar8 = iVar7 + ((in_stack_00000048 * 4 + 0x10) - (in_stack_00000048 * 4 & 0xfU));
  iVar9 = iVar8 + ((in_stack_0000004c * 4 + 0x10) - (in_stack_0000004c * 4 & 0xfU));
  iVar10 = iVar9 + ((in_stack_00000050 * 4 + 0x10) - (in_stack_00000050 * 4 & 0xfU));
  iVar11 = iVar10 + ((in_stack_00000054 * 4 + 0x10) - (in_stack_00000054 * 4 & 0xfU));
  iVar12 = iVar11 + ((in_stack_00000058 * 4 + 0x10) - (in_stack_00000058 * 4 & 0xfU));
  iVar13 = iVar12 + ((in_stack_0000005c * 4 + 0x10) - (in_stack_0000005c * 4 & 0xfU));
  uVar14 = iVar13 + ((in_stack_00000060 * 4 + 0x10) - (in_stack_00000060 * 4 & 0xfU));
  iVar6 = -(uVar14 & 0xf) + 0x10;
  if (in_stack_000000b8 == '\x01') {
    iVar6 = uVar14 + iVar6 + 0x80 + in_stack_000000b4;
  }
  else {
    iVar6 = uVar14 + 0x80 + iVar6;
  }
  piVar5 = (int *)func_0x00416480(iVar6,0xf,0x10,&UNK_010d1038,&UNK_010d108c,0x8a);
  if (in_stack_000000b8 == '\x01') {
    iVar6 = (int)piVar5 + uVar14 + -(uVar14 & 0xf) + 0x90;
    *piVar5 = in_stack_000000b4;
    func_0x009d4600(iVar6,pcVar4,in_stack_000000b4);
    piVar5[1] = iVar6;
  }
  else {
    *piVar5 = in_stack_000000b4;
    piVar5[1] = (int)pcVar4;
  }
  piVar1 = piVar5 + 0x20;
  piVar5[0x19] = (int)piVar1 + iVar7;
  piVar5[0x1a] = (int)piVar1 + iVar8;
  piVar5[0x1b] = (int)piVar1 + iVar9;
  piVar5[0x1c] = (int)piVar1 + iVar10;
  piVar5[0x1d] = (int)piVar1 + iVar11;
  piVar5[0x18] = (int)piVar1;
  piVar5[0x1e] = (int)piVar1 + iVar12;
  piVar5[0x1f] = (int)piVar1 + iVar13;
  func_0x00c02ff0();
  in_stack_000000a8 = 0xffffffff;
  func_0x00c02a30();
  *unaff_FS_OFFSET = in_stack_000000a0;
  return piVar5;
}


===== 0xc05f80 =====

int * FUN_00c05f70(undefined4 param_1,undefined4 param_2,int param_3)

{
  int *piVar1;
  int iVar2;
  int *unaff_FS_OFFSET;
  int unaff_retaddr;
  int iStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  iStack_c = *unaff_FS_OFFSET;
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eec33a;
  *unaff_FS_OFFSET = (int)&iStack_c;
  piVar1 = (int *)func_0x00416480(0x14,0x10,0x10,&UNK_010d1298,&UNK_010d1220,0xf6);
  if (piVar1 == (int *)0x0) {
    piVar1 = (int *)0x0;
  }
  else {
    *piVar1 = (int)&UNK_010ce01c;
    piVar1[1] = 0;
    piVar1[2] = 0;
    piVar1[3] = 0;
    piVar1[4] = 4;
  }
  iVar2 = param_3;
  if (param_3 == 0) {
    param_3 = func_0x00416480(0x188,0x10,0x10,&UNK_010d1298,&UNK_010d1220,0xfa);
    uStack_4 = 0;
    if (param_3 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = func_0x00c0dd50();
    }
    uStack_4 = 0xffffffff;
  }
  (**(code **)(*piVar1 + 8))(iVar2);
  iVar2 = (**(code **)(*piVar1 + 0x38))(param_1);
  if (iVar2 == -1) {
    (**(code **)*piVar1)(1);
    *unaff_FS_OFFSET = unaff_retaddr;
    return (int *)0x0;
  }
  *unaff_FS_OFFSET = param_3;
  return piVar1;
}


===== 0xbe2600 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00be2600(int param_1,undefined4 *param_2)

{
  undefined8 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  char cVar4;
  int iVar5;
  undefined8 *puVar6;
  int iVar7;
  undefined4 uVar8;
  int iVar9;
  undefined8 *puVar10;
  int iVar11;
  uint uVar12;
  uint uVar13;
  undefined4 *unaff_FS_OFFSET;
  int iStack_74;
  int iStack_70;
  uint uStack_6c;
  uint uStack_68;
  int iStack_64;
  int iStack_60;
  int iStack_5c;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined1 auStack_48 [20];
  undefined *puStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined4 uStack_1c;
  undefined *puStack_18;
  int iStack_14;
  
  puStack_18 = &UNK_00eebe94;
  uStack_1c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_1c;
  *(undefined4 *)(param_1 + 0x24) = 0;
  uVar8 = *param_2;
  uVar2 = param_2[1];
  uVar3 = param_2[2];
  *(undefined4 *)(param_1 + 0x1c) = param_2[3];
  *(undefined4 *)(param_1 + 0x10) = uVar8;
  *(undefined4 *)(param_1 + 0x14) = uVar2;
  *(undefined4 *)(param_1 + 0x18) = uVar3;
  *(undefined4 *)(param_1 + 0x50) = param_2[0xd];
  puStack_34 = &UNK_010ce01c;
  uStack_30 = 0;
  uStack_2c = 0;
  uStack_28 = 0;
  uStack_24 = 4;
  iStack_14 = 0;
  iStack_5c = param_1;
  if (*(undefined4 **)(param_1 + 0x54) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(param_1 + 0x54))(1);
  }
  func_0x00416320();
  iStack_60 = func_0x00416480(0x9c,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
  iStack_14._0_1_ = 1;
  if (iStack_60 == 0) {
    iVar5 = 0;
  }
  else {
    iVar5 = func_0x00c19100();
  }
  iStack_14 = (uint)iStack_14._1_3_ << 8;
  *(int *)(param_1 + 0x54) = iVar5;
  if (iVar5 == 0) goto LAB_00be2d14;
  iVar5 = func_0x00416350();
  *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
  puVar6 = (undefined8 *)func_0x00c02900(auStack_48,param_2[0xb]);
  uStack_58 = *puVar6;
  uStack_50 = puVar6[1];
  if ((uint)uStack_50 < 3) {
    iVar5 = func_0x00c05710(param_2[0xb],param_2[0xc],0);
    if (iVar5 == 0) goto LAB_00be2d14;
    func_0x00416320();
    cVar4 = func_0x00c1ac80(iVar5,*(undefined4 *)(*(int *)(param_1 + 0x20) + 0x84),param_2[0xb]);
    iVar7 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar7 + 4);
    if (cVar4 == '\0') {
      func_0x00c03e90(iVar5);
      goto LAB_00be2d14;
    }
    func_0x00416320();
    func_0x00be2110(param_2);
    func_0x00be05d0(param_2,iVar5);
    func_0x00c17980(iVar5);
    func_0x00c03e90(iVar5);
  }
  else {
    iStack_70 = 0;
    func_0x00c02750(param_2[0xb]);
    func_0x00416320();
    cVar4 = func_0x00c1ac20(&iStack_74,*(undefined4 *)(*(int *)(param_1 + 0x20) + 0x84),param_2[0xb]
                           );
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
    if (cVar4 == '\0') goto LAB_00be2d14;
    func_0x00416320();
    func_0x00be2110(param_2);
    func_0x00be1450(param_2,&iStack_74);
    func_0x00c16df0(&stack0xffffff84);
  }
  iVar5 = func_0x00416350();
  *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
  iVar5 = param_2[0xe];
  if (*(undefined4 **)(param_1 + 0x58) != (undefined4 *)0x0) {
    (**(code **)**(undefined4 **)(param_1 + 0x58))(1);
  }
  if (iVar5 == 0) {
    *(undefined4 *)(param_1 + 0x58) = 0;
  }
  else if ((uint)uStack_50 < 3) {
    uStack_68 = func_0x00c03c70(iVar5,param_2[0xf],0);
    func_0x00416320();
    iStack_60 = func_0x00416480(0x18,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
    iStack_14._0_1_ = 2;
    if (iStack_60 == 0) {
      iVar5 = 0;
    }
    else {
      iVar5 = func_0x00c1c9c0();
    }
    iStack_14 = (uint)iStack_14._1_3_ << 8;
    *(int *)(param_1 + 0x58) = iVar5;
    cVar4 = '\x01';
    if (iVar5 != 0) {
      cVar4 = func_0x00c1cd60(uStack_68);
    }
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
    func_0x00c036b0(uStack_68);
    if (cVar4 == '\0') goto LAB_00be2d14;
    func_0x00416320();
    (**(code **)(**(int **)(param_1 + 0x54) + 0x34))(*(undefined4 *)(param_1 + 0x58));
    (**(code **)(**(int **)(param_1 + 0x54) + 0x3c))();
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
  }
  else {
    uStack_68 = 0;
    func_0x00c01b10(iVar5);
    func_0x00416320();
    iStack_64 = func_0x00416480(0x18,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
    puStack_18._0_1_ = 3;
    if (iStack_64 == 0) {
      iVar5 = 0;
    }
    else {
      iVar5 = func_0x00c1c9c0();
    }
    puStack_18 = (undefined *)((uint)puStack_18._1_3_ << 8);
    *(int *)(param_1 + 0x58) = iVar5;
    cVar4 = '\x01';
    if (iVar5 != 0) {
      cVar4 = func_0x00c1cf70(&uStack_6c);
    }
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
    if (cVar4 == '\0') goto LAB_00be2d14;
    func_0x00416320();
    (**(code **)(**(int **)(param_1 + 0x54) + 0x34))(*(undefined4 *)(param_1 + 0x58));
    (**(code **)(**(int **)(param_1 + 0x54) + 0x3c))();
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
  }
  if (param_2[0x10] == 0) {
    *(undefined4 *)(param_1 + 0x5c) = 0;
  }
  else {
    if (*(undefined4 **)(param_1 + 0x5c) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(param_1 + 0x5c))(1);
    }
    if ((uint)uStack_50 < 3) {
      uVar8 = func_0x00c03310(param_2[0x10],param_2[0x11],0);
      func_0x00416320();
      iStack_60 = func_0x00416480(0x34,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
      iStack_14._0_1_ = 4;
      if (iStack_60 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = func_0x00c14670();
      }
      iStack_14 = (uint)iStack_14._1_3_ << 8;
      *(int *)(param_1 + 0x5c) = iVar5;
      cVar4 = '\x01';
      if (iVar5 != 0) {
        cVar4 = func_0x00c146f0(uVar8);
      }
      iVar5 = func_0x00416350();
      *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
      func_0x00c02a90(uVar8);
    }
    else {
      uStack_68 = 0;
      func_0x00c017f0(param_2[0x10]);
      func_0x00416320();
      iStack_64 = func_0x00416480(0x34,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
      puStack_18._0_1_ = 5;
      if (iStack_64 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = func_0x00c14670();
      }
      puStack_18 = (undefined *)((uint)puStack_18._1_3_ << 8);
      *(int *)(param_1 + 0x5c) = iVar5;
      cVar4 = '\x01';
      if (iVar5 != 0) {
        cVar4 = func_0x00c15110(&uStack_6c);
      }
      iVar5 = func_0x00416350();
      *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
    }
    if (cVar4 == '\0') goto LAB_00be2d14;
  }
  iVar5 = *(int *)(param_1 + 0x54);
  if ((iVar5 != 0) && (*(int *)(param_1 + 0x5c) != 0)) {
    iVar7 = *(int *)(*(int *)(param_1 + 0x5c) + 0xc);
    uVar1 = *(undefined8 *)(iVar7 + 0x58);
    *(undefined8 *)(iVar5 + 0x44) = *(undefined8 *)(iVar7 + 0x50);
    *(undefined8 *)(iVar5 + 0x4c) = uVar1;
  }
  func_0x00416320();
  iVar5 = 0;
  if (*(int *)(param_1 + 0x68) != 0) {
    func_0x004162c0(*(int *)(param_1 + 0x68));
  }
  *(undefined4 *)(param_1 + 0x68) = 0;
  iVar7 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
  *(undefined4 *)(param_1 + 0x74) = 0;
  iVar9 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
  if (0 < iVar9) {
    do {
      iVar9 = (**(code **)(**(int **)(param_1 + 0x54) + 0x18))(iVar5);
      iVar9 = *(int *)(iVar9 + 0x24);
      if (*(byte *)(iVar9 + 0x44) != 0) {
        uStack_6c = (uint)*(byte *)(iVar9 + 0x44);
        iVar11 = 0;
        do {
          if (*(char *)(*(int *)(iVar9 + 0x8c) + iVar11 + 6) == '\0') {
            *(int *)(param_1 + 0x74) = *(int *)(param_1 + 0x74) + 1;
          }
          iVar11 = iVar11 + 8;
          uStack_6c = uStack_6c - 1;
        } while (uStack_6c != 0);
      }
      *(int *)(param_1 + 0x74) = *(int *)(param_1 + 0x74) + (uint)*(byte *)(iVar9 + 0x45);
      iVar5 = iVar5 + 1;
      iVar9 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
    } while (iVar5 < iVar9);
  }
  iVar7 = iVar7 * 4 + *(int *)(param_1 + 0x74) * 0x10;
  iVar5 = func_0x00416480(iVar7,*(undefined1 *)(param_1 + 0x29),0x10,0,0,0);
  *(int *)(param_1 + 0x68) = iVar5;
  if (iVar5 == 0) {
    *(undefined4 *)(param_1 + 0x6c) = 0;
    *(undefined4 *)(param_1 + 0x70) = 0;
  }
  else {
    iVar9 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
    *(int *)(param_1 + 0x70) = iVar5;
    *(int *)(param_1 + 0x6c) = iVar7 + iVar9 * -4 + iVar5;
    iVar5 = _DAT_0136e740;
    uVar12 = 0;
    iStack_5c = _DAT_0136e740;
    uStack_6c = 0;
    uStack_68 = 0;
    iVar7 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
    if (0 < iVar7) {
      do {
        iVar7 = (**(code **)(**(int **)(param_1 + 0x54) + 0x18))(uVar12);
        iStack_64 = *(int *)(iVar7 + 0x24);
        *(int *)(*(int *)(param_1 + 0x6c) + uVar12 * 4) = iStack_70;
        iStack_74 = 0;
        if (*(byte *)(iStack_64 + 0x44) != 0) {
          uStack_68 = (uint)*(byte *)(iStack_64 + 0x44);
          iVar7 = iStack_70 << 4;
          iVar9 = 0;
          do {
            iVar11 = *(int *)(iStack_64 + 0x8c) + iVar9;
            if (*(char *)(iVar11 + 6) == '\0') {
              iStack_74 = iStack_74 + 1;
              puVar6 = (undefined8 *)
                       ((uint)*(byte *)(*(int *)(_DAT_0136e740 + 0x18) +
                                       (uint)*(byte *)(iVar11 + 5) * 4) * 0x10 +
                       *(int *)(iVar5 + 0x1c));
              puVar10 = (undefined8 *)(*(int *)(param_1 + 0x70) + iVar7);
              *puVar10 = *puVar6;
              puVar10[1] = puVar6[1];
              iVar7 = iVar7 + 0x10;
            }
            iVar9 = iVar9 + 8;
            uStack_68 = uStack_68 - 1;
          } while (uStack_68 != 0);
          uStack_68 = 0;
          uVar12 = uStack_6c;
        }
        if (*(byte *)(iStack_64 + 0x45) != 0) {
          uVar13 = (uint)*(byte *)(iStack_64 + 0x45);
          iVar7 = (iStack_74 + iStack_70) * 0x10;
          iVar9 = 0;
          iStack_74 = iStack_74 + uVar13;
          do {
            puVar6 = (undefined8 *)
                     ((uint)*(byte *)(*(int *)(_DAT_0136e740 + 0x18) +
                                     (uint)*(byte *)(*(int *)(iStack_64 + 0x90) + iVar9 + 5) * 4) *
                      0x10 + *(int *)(iStack_60 + 0x1c));
            puVar10 = (undefined8 *)(*(int *)(param_1 + 0x70) + iVar7);
            *puVar10 = *puVar6;
            iVar7 = iVar7 + 0x10;
            iVar9 = iVar9 + 8;
            uVar13 = uVar13 - 1;
            puVar10[1] = puVar6[1];
            uVar12 = uStack_6c;
            iVar5 = iStack_60;
          } while (uVar13 != 0);
        }
        iStack_70 = iStack_70 + iStack_74;
        uVar12 = uVar12 + 1;
        uStack_6c = uVar12;
        iVar7 = (**(code **)(**(int **)(param_1 + 0x54) + 0x14))();
      } while ((int)uVar12 < iVar7);
    }
    iVar5 = func_0x00416350();
    *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + *(int *)(iVar5 + 4);
    func_0x00c17920();
    if ((*(byte *)(*(int *)(param_1 + 0x54) + 0x99) & 1) != 0) {
      *(byte *)(param_1 + 0x7c) = *(byte *)(param_1 + 0x7c) | 1;
    }
    if ((*(byte *)(*(int *)(param_1 + 0x54) + 0x99) & 2) != 0) {
      *(byte *)(param_1 + 0x7c) = *(byte *)(param_1 + 0x7c) | 2;
    }
  }
LAB_00be2d14:
  iStack_14 = 0xffffffff;
  func_0x00be30d0();
  *unaff_FS_OFFSET = uStack_1c;
  return;
}


===== 0xbe30b0 =====

undefined4 * __thiscall FUN_00be30b0(undefined4 *param_1,byte param_2)

{
  *param_1 = &UNK_010cdfd4;
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


