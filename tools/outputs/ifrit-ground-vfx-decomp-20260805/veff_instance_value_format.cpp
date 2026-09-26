===== 0xc067f0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00c067f0(void)

{
  int iVar1;
  
  iVar1 = 3;
  if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
    iVar1 = 4;
  }
  return iVar1 + 4;
}


===== 0xc06810 =====

undefined4 __thiscall FUN_00c06810(int *param_1,undefined4 param_2,undefined1 *param_3,char param_4)

{
  *param_3 = (char)param_1[1];
  param_3[1] = *(undefined1 *)((int)param_1 + 5);
  param_3[2] = *(undefined1 *)((int)param_1 + 6);
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  *(int *)(param_3 + 4) = param_1[2];
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  return 1;
}


===== 0xc06860 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c06860(int *param_1,undefined1 *param_2,char param_3)

{
  *(undefined1 *)(param_1 + 1) = *param_2;
  *(undefined1 *)((int)param_1 + 5) = param_2[1];
  *(undefined1 *)((int)param_1 + 6) = param_2[2];
  if (*(uint *)(_DAT_0136e5f8 + 0xc) < 3) {
    param_1[2] = *(int *)(param_2 + 3);
  }
  else {
    param_1[2] = *(int *)(param_2 + 4);
  }
  if (param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  return;
}


===== 0xc06c90 =====

void __fastcall FUN_00c06c90(int param_1)

{
  uint uVar1;
  
  uVar1 = *(uint *)(param_1 + 8);
  *(uint *)(param_1 + 8) =
       (uVar1 & 0xff0000 | uVar1 >> 0x10) >> 8 | (uVar1 & 0xff00 | uVar1 << 0x10) << 8;
  return;
}


===== 0xc07940 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __fastcall FUN_00c07940(int param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  
  if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
    iVar3 = 0x70;
    piVar4 = (int *)(param_1 + 4);
    iVar5 = 7;
    do {
      piVar1 = piVar4 + 1;
      iVar2 = *piVar4;
      piVar4 = piVar4 + 2;
      iVar5 = iVar5 + -1;
      iVar3 = iVar3 + (*piVar1 + iVar2) * 4;
    } while (iVar5 != 0);
    return iVar3;
  }
  return 0x20;
}


===== 0xc07980 =====

undefined4 __thiscall FUN_00c07980(int *param_1,undefined4 param_2,int *param_3,char param_4)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int *piVar5;
  
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  piVar2 = param_1 + 1;
  piVar3 = piVar2;
  piVar5 = param_3;
  for (iVar1 = 0xe; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar5 = *piVar3;
    piVar3 = piVar3 + 1;
    piVar5 = piVar5 + 1;
  }
  piVar3 = param_1 + 0xf;
  piVar5 = param_3 + 0xe;
  for (iVar1 = 0xe; iVar1 != 0; iVar1 = iVar1 + -1) {
    *piVar5 = *piVar3;
    piVar3 = piVar3 + 1;
    piVar5 = piVar5 + 1;
  }
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
    (**(code **)(*param_1 + 0x14))();
  }
  iVar1 = 0;
  iVar4 = 0xe;
  do {
    iVar1 = iVar1 + *piVar2;
    piVar2 = piVar2 + 1;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  func_0x009d4600(param_3 + 0x1c,param_1[0x1d],iVar1 * 4);
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x14))();
  }
  return 1;
}


===== 0xc07a20 =====

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


===== 0xc078c0 =====

void __fastcall FUN_00c078c0(int param_1)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  int iVar3;
  
  puVar2 = (undefined4 *)(param_1 + 0x3c);
  iVar3 = 0xe;
  do {
    uVar1 = func_0x00c06690(puVar2[-0xe]);
    puVar2[-0xe] = uVar1;
    uVar1 = func_0x00c06690(*puVar2);
    *puVar2 = uVar1;
    puVar2 = puVar2 + 1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  return;
}


===== 0xc07900 =====

void __fastcall FUN_00c07900(int *param_1)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = 0;
  iVar3 = 0xe;
  piVar1 = param_1;
  do {
    piVar1 = piVar1 + 1;
    iVar4 = iVar4 + *piVar1;
    iVar3 = iVar3 + -1;
  } while (iVar3 != 0);
  iVar3 = 0;
  if (0 < iVar4) {
    do {
      uVar2 = func_0x00c06690(*(undefined4 *)(param_1[0x1d] + iVar3 * 4));
      *(undefined4 *)(param_1[0x1d] + iVar3 * 4) = uVar2;
      iVar3 = iVar3 + 1;
    } while (iVar3 < iVar4);
  }
  return;
}


===== 0xc06f30 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __fastcall FUN_00c06f30(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = (**(code **)(*(int *)(param_1 + 0x58) + 4))(0);
  iVar2 = iVar1 + 0x3c;
  if (1 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
    return iVar1 + 0x54;
  }
  if (6 < *(uint *)(_DAT_0136e5f8 + 0x10)) {
    iVar2 = iVar1 + 0x48;
  }
  if (7 < *(uint *)(_DAT_0136e5f8 + 0x10)) {
    iVar2 = iVar2 + 0xc;
  }
  return iVar2;
}


===== 0xc06f70 =====

undefined4 __thiscall
FUN_00c06f70(int *param_1,undefined4 param_2,undefined8 *param_3,undefined4 param_4)

{
  if ((char)param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  *param_3 = *(undefined8 *)(param_1 + 1);
  *(int *)(param_3 + 1) = param_1[3];
  *(undefined8 *)((int)param_3 + 0xc) = *(undefined8 *)(param_1 + 4);
  *(int *)((int)param_3 + 0x14) = param_1[6];
  param_3[3] = *(undefined8 *)(param_1 + 7);
  *(int *)(param_3 + 4) = param_1[9];
  *(undefined8 *)((int)param_3 + 0x24) = *(undefined8 *)(param_1 + 10);
  *(int *)((int)param_3 + 0x2c) = param_1[0xc];
  param_3[6] = *(undefined8 *)(param_1 + 0xd);
  *(int *)(param_3 + 7) = param_1[0xf];
  *(undefined8 *)((int)param_3 + 0x3c) = *(undefined8 *)(param_1 + 0x10);
  *(int *)((int)param_3 + 0x44) = param_1[0x12];
  param_3[9] = *(undefined8 *)(param_1 + 0x13);
  *(int *)(param_3 + 10) = param_1[0x15];
  if ((char)param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  (**(code **)(param_1[0x16] + 8))(param_2,(int)param_3 + 0x54,param_4);
  return 1;
}


===== 0xc07030 =====

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


===== 0xc06eb0 =====

void __fastcall FUN_00c06eb0(int param_1)

{
  float *pfVar1;
  int iVar2;
  float10 fVar3;
  
  pfVar1 = (float *)(param_1 + 0x10);
  iVar2 = 3;
  do {
    fVar3 = (float10)func_0x00c066c0(pfVar1[-3]);
    pfVar1[-3] = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(*pfVar1);
    *pfVar1 = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(pfVar1[3]);
    pfVar1[3] = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(pfVar1[6]);
    pfVar1[6] = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(pfVar1[9]);
    pfVar1[9] = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(pfVar1[0xc]);
    pfVar1[0xc] = (float)fVar3;
    fVar3 = (float10)func_0x00c066c0(pfVar1[0xf]);
    pfVar1[0xf] = (float)fVar3;
    pfVar1 = pfVar1 + 1;
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  return;
}


===== 0xc072d0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __fastcall FUN_00c072d0(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(param_1 + 4);
  iVar2 = (**(code **)(*(int *)(param_1 + 8) + 4))(0);
  iVar2 = iVar1 * 0x18 + 4 + iVar2;
  if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
    iVar2 = iVar2 + 0x1a;
  }
  return iVar2;
}


===== 0xc07310 =====

undefined4 __thiscall FUN_00c07310(int *param_1,undefined4 param_2,int *param_3,undefined4 param_4)

{
  int iVar1;
  char cVar2;
  
  cVar2 = (char)param_4;
  if (cVar2 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  *param_3 = param_1[1];
  if (cVar2 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  (**(code **)(param_1[2] + 8))(param_2,param_3 + 1,param_4);
  iVar1 = (**(code **)(param_1[2] + 4))(0);
  if (cVar2 != '\0') {
    (**(code **)(*param_1 + 0x14))();
  }
  if (param_1[1] != 0) {
    func_0x009d4600(iVar1 + 0x1e + (int)param_3,param_1[5],param_1[1] * 4);
    iVar1 = iVar1 + 0x1e + param_1[1] * 4;
    func_0x009d4600(iVar1 + (int)param_3,param_1[6],param_1[1] * 4);
    iVar1 = iVar1 + param_1[1] * 4;
    func_0x009d4600(iVar1 + (int)param_3,param_1[7],param_1[1] * 4);
    iVar1 = iVar1 + param_1[1] * 4;
    func_0x009d4600(iVar1 + (int)param_3,param_1[8],param_1[1] * 4);
    iVar1 = iVar1 + param_1[1] * 4;
    func_0x009d4600(iVar1 + (int)param_3,param_1[9],param_1[1] * 4);
    func_0x009d4600(param_1[1] * 4 + iVar1 + (int)param_3,param_1[10],param_1[1] * 4);
  }
  if (cVar2 != '\0') {
    (**(code **)(*param_1 + 0x14))();
  }
  return 1;
}


===== 0xc07420 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c07420(int *param_1,int *param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  
  param_1[1] = *param_2;
  iVar2 = 4;
  if ((char)param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
    (**(code **)(param_1[2] + 0xc))(param_2 + 1,param_3);
    iVar2 = (**(code **)(param_1[2] + 4))(0);
    iVar2 = iVar2 + 0x1e;
  }
  if (param_1[1] != 0) {
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x150);
    param_1[5] = iVar1;
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x151);
    param_1[6] = iVar1;
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x152);
    param_1[7] = iVar1;
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x153);
    param_1[8] = iVar1;
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x154);
    param_1[9] = iVar1;
    iVar1 = func_0x00416480(param_1[1] * 4,0x10,0x10,&UNK_010d1428,&UNK_010d1488,0x155);
    param_1[10] = iVar1;
    func_0x009d4600(param_1[5],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
    func_0x009d4600(param_1[6],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
    func_0x009d4600(param_1[7],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
    func_0x009d4600(param_1[8],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
    func_0x009d4600(param_1[9],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
    func_0x009d4600(param_1[10],iVar2 + (int)param_2,param_1[1] * 4);
    iVar2 = iVar2 + param_1[1] * 4;
  }
  if ((char)param_3 == '\x01') {
    (**(code **)(*param_1 + 0x14))();
  }
  if (*(uint *)(_DAT_0136e5f8 + 0xc) < 3) {
    (**(code **)(param_1[2] + 0xc))(iVar2 + (int)param_2,param_3);
  }
  return;
}


===== 0xc07220 =====

void __fastcall FUN_00c07220(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = func_0x00c06690(*(undefined4 *)(param_1 + 4));
  *(undefined4 *)(param_1 + 4) = uVar1;
  return;
}


===== 0xc07240 =====

void __fastcall FUN_00c07240(int param_1)

{
  undefined4 uVar1;
  uint uVar2;
  float10 fVar3;
  
  uVar2 = 0;
  if (*(int *)(param_1 + 4) != 0) {
    do {
      uVar1 = func_0x00c06690(*(undefined4 *)(*(int *)(param_1 + 0x14) + uVar2 * 4));
      *(undefined4 *)(*(int *)(param_1 + 0x14) + uVar2 * 4) = uVar1;
      uVar1 = func_0x00c06690(*(undefined4 *)(*(int *)(param_1 + 0x18) + uVar2 * 4));
      *(undefined4 *)(*(int *)(param_1 + 0x18) + uVar2 * 4) = uVar1;
      uVar1 = func_0x00c06690(*(undefined4 *)(*(int *)(param_1 + 0x1c) + uVar2 * 4));
      *(undefined4 *)(*(int *)(param_1 + 0x1c) + uVar2 * 4) = uVar1;
      uVar1 = func_0x00c06690(*(undefined4 *)(*(int *)(param_1 + 0x20) + uVar2 * 4));
      *(undefined4 *)(*(int *)(param_1 + 0x20) + uVar2 * 4) = uVar1;
      uVar1 = func_0x00c06690(*(undefined4 *)(*(int *)(param_1 + 0x24) + uVar2 * 4));
      *(undefined4 *)(*(int *)(param_1 + 0x24) + uVar2 * 4) = uVar1;
      fVar3 = (float10)func_0x00c066c0(*(undefined4 *)(*(int *)(param_1 + 0x28) + uVar2 * 4));
      *(float *)(*(int *)(param_1 + 0x28) + uVar2 * 4) = (float)fVar3;
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(param_1 + 4));
  }
  return;
}


