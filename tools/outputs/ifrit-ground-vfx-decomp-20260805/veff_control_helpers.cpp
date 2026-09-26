===== 0xd79bb0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d79bb0(int param_1)

{
  float *pfVar1;
  float fVar2;
  int iVar3;
  
  pfVar1 = *(float **)(param_1 + 0x20);
  iVar3 = func_0x00e3f1b0();
  fVar2 = (float)iVar3;
  if (iVar3 < 0) {
    fVar2 = fVar2 + _DAT_00f54a54;
  }
  if (fVar2 * (float)_DAT_010c6268 <= *pfVar1) {
    *(short *)(param_1 + 0x1a) = *(short *)(param_1 + 0x1a) + 1;
  }
  return;
}


===== 0xd731b0 =====

undefined4 FUN_00d731b0(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = func_0x00e3a670(param_1,*(int *)(param_1 + 0x60) << 4,0x20000,2,0);
  *(int *)(param_1 + 0x58) = iVar1;
  if (iVar1 == 0) {
    uVar2 = func_0x00e3a4d0(param_1,&UNK_01121890,0x1b6);
    uVar2 = func_0x00e3a4a0(param_1,uVar2);
    uVar2 = func_0x00e3a470(param_1,uVar2);
    uVar2 = func_0x00415c90(2,&UNK_01121910,&UNK_01121904,uVar2);
    func_0x004160e0(uVar2);
    return 0;
  }
  iVar1 = func_0x00e3a6f0(param_1,*(int *)(param_1 + 100) * 2,0x20000,2,0,0);
  *(int *)(param_1 + 0x5c) = iVar1;
  if (iVar1 == 0) {
    uVar2 = func_0x00e3a4d0(param_1,&UNK_01121940,0x1b9);
    uVar2 = func_0x00e3a4a0(param_1,uVar2);
    uVar2 = func_0x00e3a470(param_1,uVar2);
    uVar2 = func_0x00415c90(2,&UNK_011219c0,&UNK_011219b4,uVar2);
    func_0x004160e0(uVar2);
    return 0;
  }
  return 1;
}


===== 0xd732c0 =====

void FUN_00d732c0(int param_1)

{
  func_0x00e3a6a0(param_1,*(undefined4 *)(param_1 + 0x58));
  func_0x00e3a720(param_1,*(undefined4 *)(param_1 + 0x5c));
  return;
}


===== 0xd73330 =====

void FUN_00d73330(int param_1,undefined4 param_2,undefined4 param_3)

{
  func_0x00d9ae10(param_3,*(undefined4 *)(param_1 + 0x40));
  return;
}


===== 0xd7e2c0 =====

void FUN_00d7e2c0(int param_1,undefined4 param_2,undefined4 param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  undefined *puVar5;
  
  fVar1 = *(float *)(param_1 + 0x10);
  fVar2 = *(float *)(param_1 + 0x14);
  fVar3 = *(float *)(param_1 + 0x18);
  iVar4 = func_0x00e3a060();
  if (iVar4 == 0) {
    puVar5 = &UNK_01123fe8;
  }
  else if (iVar4 == 1) {
    puVar5 = &UNK_01123fc4;
  }
  else if (iVar4 == 2) {
    puVar5 = &UNK_01123fa0;
  }
  else {
    puVar5 = &UNK_0112400c;
  }
  func_0x00bcbda0(param_3,puVar5);
  func_0x00bcbda0(param_3,&UNK_0112402c,param_1 + 0x10,(double)fVar1,(double)fVar2,(double)fVar3);
  return;
}


===== 0xe39dc0 =====

void FUN_00e39dc0(void)

{
  return;
}


===== 0xe39dd0 =====

void FUN_00e39dd0(void)

{
  return;
}


===== 0xe39e60 =====

void FUN_00e39e60(void)

{
  return;
}


===== 0xd79990 =====

void __thiscall FUN_00d79990(undefined8 *param_1,undefined8 *param_2)

{
  *param_1 = *param_2;
  param_1[1] = param_2[1];
  *(undefined4 *)((int)param_1 + 0xc) = *(undefined4 *)((int)param_2 + 0xc);
  param_1[2] = param_2[2];
  param_1[3] = param_2[3];
  *(undefined4 *)((int)param_1 + 0x1c) = *(undefined4 *)((int)param_2 + 0x1c);
  param_1[4] = param_2[4];
  param_1[5] = param_2[5];
  *(undefined4 *)((int)param_1 + 0x2c) = *(undefined4 *)((int)param_2 + 0x2c);
  param_1[6] = param_2[6];
  param_1[7] = param_2[7];
  *(undefined4 *)((int)param_1 + 0x3c) = *(undefined4 *)((int)param_2 + 0x3c);
  param_1[8] = param_2[8];
  param_1[9] = param_2[9];
  *(undefined4 *)(param_1 + 10) = *(undefined4 *)(param_2 + 10);
  *(undefined4 *)((int)param_1 + 0x54) = *(undefined4 *)((int)param_2 + 0x54);
  return;
}


===== 0xd6ab70 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d6ab70(int param_1,undefined4 *param_2,undefined4 param_3)

{
  float *pfVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined4 uVar5;
  undefined4 *puVar6;
  float fStack_34;
  float fStack_30;
  float fStack_2c;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  float *pfStack_4;
  
  uStack_18 = 0xffffffff;
  uStack_14 = 0xffffffff;
  uStack_10 = 0xffffffff;
  uStack_c = 0xffffffff;
  uStack_20 = 0;
  uStack_1c = 0;
  uStack_8 = 0;
  uStack_24 = param_3;
  uStack_20 = func_0x00e39f40(param_1);
  uStack_1c = *(undefined4 *)(param_1 + 0x2c);
  puVar4 = (undefined8 *)*param_2;
  uStack_18 = 0;
  uStack_14 = 1;
  uStack_10 = 2;
  uStack_c = 3;
  uVar5 = _DAT_00f54f70;
  if (*(char *)(puVar4 + 5) != '\0') {
    puVar6 = (undefined4 *)func_0x00e3a0a0(param_1,*(int *)((int)puVar4 + 0x24) + 8);
    uVar5 = *puVar6;
  }
  pfVar1 = (float *)(param_1 + 0x30);
  uStack_8 = uVar5;
  pfStack_4 = pfVar1;
  func_0x00d9a710(param_1,*param_2,&uStack_24);
  uVar2 = *puVar4;
  uVar3 = puVar4[1];
  fStack_34 = (float)uVar2;
  *pfVar1 = *pfVar1 + fStack_34;
  fStack_30 = (float)((ulonglong)uVar2 >> 0x20);
  fStack_2c = (float)uVar3;
  *(float *)(param_1 + 0x34) = fStack_30 + *(float *)(param_1 + 0x34);
  *(float *)(param_1 + 0x38) = *(float *)(param_1 + 0x38) + fStack_2c;
  return;
}


===== 0xd999b0 =====

undefined1 FUN_00d999b0(undefined4 param_1,int *param_2,undefined4 *param_3)

{
  char cVar1;
  
  *param_3 = 0;
  if ((char)param_2[1] == '\x04') {
    cVar1 = func_0x00d995e0(param_1,*param_2 + 0x20,param_3);
    if (cVar1 == '\0') {
      return 0;
    }
  }
  return 1;
}


===== 0xd98d10 =====

void FUN_00d98d10(undefined4 param_1,int param_2,int *param_3)

{
  int iVar1;
  
  if (*(char *)(param_2 + 4) == '\x04') {
    if (*param_3 == 0) {
      return;
    }
    iVar1 = *(int *)(*param_3 + 8);
    if (iVar1 != 0) {
      func_0x00e3a260(param_1,iVar1);
      *(undefined4 *)(*param_3 + 8) = 0;
    }
  }
  if (*param_3 != 0) {
    func_0x00e3a260(param_1,*param_3);
    *param_3 = 0;
  }
  return;
}


===== 0xe3a0a0 =====

int FUN_00e3a0a0(int *param_1,short *param_2)

{
  int iVar1;
  
  iVar1 = (int)*param_2;
  if (iVar1 < 0) {
    iVar1 = *(int *)(*(int *)(*(int *)(*param_1 + 8) + 0x10) + iVar1 * -0x18 + -8);
  }
  else {
    iVar1 = *(int *)(*(int *)(*(int *)(*param_1 + 8) + 0xc) + 0x10 + iVar1 * 0x18);
  }
  iVar1 = *(int *)(iVar1 + param_2[1] * 4);
  if ((*(byte *)(iVar1 + 0x1f) & 1) != 0) {
    return iVar1 + 0x30;
  }
  return iVar1 + 0x20;
}


===== 0xd85800 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d85800(undefined4 param_1,float *param_2)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  float *pfVar4;
  int *unaff_FS_OFFSET;
  undefined4 uStack_e8;
  uint uStack_e4;
  undefined1 auStack_d4 [4];
  undefined8 *puStack_d0;
  undefined4 uStack_c8;
  undefined1 *puStack_c4;
  float fStack_c0;
  float fStack_bc;
  float fStack_b8;
  undefined1 *puStack_b4;
  float fStack_b0;
  float fStack_ac;
  float fStack_a8;
  float fStack_a4;
  float fStack_a0;
  float fStack_9c;
  float fStack_98;
  undefined1 *puStack_94;
  float fStack_90;
  float fStack_8c;
  float fStack_88;
  undefined4 uStack_84;
  undefined1 uStack_7e;
  undefined1 uStack_7d;
  undefined2 uStack_7c;
  undefined4 uStack_78;
  undefined1 *puStack_74;
  float fStack_70;
  float fStack_6c;
  uint uStack_24;
  int iStack_1c;
  undefined *puStack_18;
  undefined4 uStack_14;
  
  uStack_14 = 0xffffffff;
  puStack_18 = &UNK_00f02cf8;
  iStack_1c = *unaff_FS_OFFSET;
  uStack_24 = _DAT_012ea8b0 ^ (uint)auStack_d4;
  uStack_e4 = _DAT_012ea8b0 ^ (uint)&stack0xffffff20;
  *unaff_FS_OFFSET = (int)&iStack_1c;
  piVar2 = _DAT_0136578c;
  uStack_c8 = param_1;
  uStack_e8 = 0xd85859;
  iVar1 = (**(code **)(*_DAT_0136578c + 0x40))();
  if (iVar1 != 0) {
    uStack_e8 = 0;
    piVar2 = (int *)(**(code **)(*piVar2 + 0x38))();
    if (piVar2 == (int *)0x0) {
      if ((_DAT_01323910 & 1) == 0) {
        _DAT_01323910 = _DAT_01323910 | 1;
        _DAT_0132390c = (code *)&UNK_00d837f0;
      }
      (*_DAT_0132390c)(&UNK_01125178,&UNK_01124a94,&UNK_01125110,0x87f,&UNK_011250b0);
    }
    fStack_a4 = *param_2 + 0.0;
    fStack_a0 = param_2[1] + _DAT_00fb7dec;
    fStack_9c = param_2[2] + 0.0;
    fStack_98 = _DAT_00f54f70;
    puStack_c4 = (undefined1 *)(*param_2 + 0.0);
    fStack_c0 = param_2[1] + _DAT_0109d91c;
    fStack_bc = param_2[2] + 0.0;
    fStack_b8 = param_2[3] + _DAT_00f54f70;
    uStack_7c = 0;
    fStack_88 = _DAT_00f54f70;
    puStack_b4 = puStack_c4;
    fStack_b0 = fStack_c0;
    fStack_ac = fStack_bc;
    fStack_a8 = fStack_b8;
    puStack_94 = puStack_c4;
    fStack_90 = fStack_c0;
    fStack_8c = fStack_bc;
    iVar1 = func_0x00b948b0();
    piVar3 = *(int **)(*(int *)(iVar1 + 0x6c) + 0x13c);
    if (piVar3 != (int *)0x0) {
      uStack_e8 = 0xd859ff;
      piVar3 = (int *)(**(code **)(*piVar3 + 0x14))();
      if ((piVar3 != (int *)0x0) && (*piVar3 != 0)) {
        puStack_c4 = (undefined1 *)&uStack_e8;
        uStack_e8 = CONCAT31((int3)((uint)*piVar3 >> 8),0x1e);
        pfVar4 = (float *)func_0x00af90c0(&puStack_c4);
        fStack_88 = *pfVar4;
        uStack_84 = (**(code **)(*piVar2 + 0x164))();
        uStack_7e = 0;
        uStack_7d = 0;
        func_0x00a95000();
        iStack_1c = 0;
        func_0x00a95240(&fStack_a8,&uStack_78);
        uStack_c8 = uStack_78;
        puStack_c4 = puStack_74;
        fStack_c0 = fStack_70;
        fStack_bc = fStack_6c;
        *puStack_d0 = CONCAT44(puStack_74,uStack_78);
        puStack_d0[1] = CONCAT44(fStack_6c,fStack_70);
        iStack_1c = -1;
        func_0x00a94d10();
      }
    }
  }
  *unaff_FS_OFFSET = iStack_1c;
  func_0x009d20f4();
  return;
}


