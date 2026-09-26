===== 0xd79b70 =====

undefined4 FUN_00d79b70(int param_1)

{
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined1 *)(param_1 + 0x18) = 1;
  *(undefined2 *)(param_1 + 0x1a) = 0;
  return 1;
}


===== 0xd79b90 =====

void FUN_00d79b90(int param_1,undefined4 param_2,int param_3)

{
  if (param_3 != 0) {
    *(int *)(param_1 + 0x14) = (int)*(short *)(param_1 + 0x1a);
    *(undefined2 *)(param_1 + 0x1a) = 0;
  }
  return;
}


===== 0xd798c0 =====

void FUN_00d798c0(int param_1,undefined4 *param_2)

{
  *(undefined1 *)(param_1 + 0x2c) = 1;
  *(undefined4 *)(param_1 + 0x3c) = param_2[3];
  *(undefined4 *)(param_1 + 0x40) = param_2[4];
  if ((*(byte *)((int)param_2 + 0x1d) & 1) == 0) {
    *(byte *)(param_1 + 0x2e) = *(byte *)(param_1 + 0x2e) & 0xfe;
  }
  else {
    *(byte *)(param_1 + 0x2e) = *(byte *)(param_1 + 0x2e) | 1;
  }
  *(undefined1 *)(param_1 + 0x2d) = *(undefined1 *)(param_2 + 7);
  *(undefined4 *)(param_1 + 0x30) = *param_2;
  *(undefined4 *)(param_1 + 0x34) = param_2[1];
  *(undefined4 *)(param_1 + 0x38) = param_2[2];
  return;
}


===== 0xd79910 =====

void FUN_00d79910(void)

{
  return;
}


===== 0xd79920 =====

void FUN_00d79920(int param_1)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  
  puVar1 = *(undefined4 **)(param_1 + 0x54);
  puVar2 = *(undefined4 **)(param_1 + 0x50);
  *(undefined4 *)(param_1 + 0x10) = *puVar2;
  *(undefined4 *)(param_1 + 0x20) = *puVar1;
  *(undefined4 *)(param_1 + 0x14) = puVar2[1];
  *(undefined4 *)(param_1 + 0x24) = puVar1[1];
  *(undefined4 *)(param_1 + 0x18) = puVar2[2];
  *(undefined4 *)(param_1 + 0x28) = puVar1[2];
  return;
}


===== 0xd79a20 =====

uint FUN_00d79a20(int param_1,int param_2)

{
  uint uVar1;
  undefined4 uVar2;
  
  *(undefined1 *)(param_1 + 0x16) = 1;
  func_0x00d79990(param_2);
  *(undefined4 *)(param_1 + 0x6c) = 0;
  uVar1 = (uint)*(byte *)(param_2 + 0x54);
  if (uVar1 == 0) {
    *(undefined2 *)(param_1 + 0x14) = 0x28;
    return 1;
  }
  if (uVar1 != 1) {
    uVar1 = uVar1 - 2;
    if (uVar1 == 0) {
      uVar2 = func_0x00e3a4d0(param_1,&UNK_01122e08,0x39);
      uVar2 = func_0x00e3a4a0(param_1,uVar2);
      uVar2 = func_0x00e3a470(param_1,uVar2);
      uVar2 = func_0x00415c90(3,&UNK_01122ee8,&UNK_01122e88,uVar2);
      uVar1 = func_0x004160e0(uVar2);
    }
    return uVar1 & 0xffffff00;
  }
  *(undefined2 *)(param_1 + 0x14) = 0x4c;
  return 1;
}


===== 0xd79ac0 =====

void FUN_00d79ac0(undefined4 param_1,undefined4 param_2,int *param_3)

{
  if (*param_3 == 1) {
    func_0x00d79990(param_2);
  }
  return;
}


===== 0xd730b0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00d730b0(int param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  uint uVar3;
  
  uVar2 = _DAT_011216b8;
  iVar1 = *(int *)(param_2 + 0x28);
  uVar3 = (uint)(byte)(*(char *)(param_2 + 0x54) + *(char *)(param_2 + 0xd));
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined4 *)(param_1 + 0x5c) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  *(undefined2 *)(param_1 + 0x6c) = 0;
  *(undefined4 *)(param_1 + 0x68) = 0;
  *(undefined4 *)(param_1 + 0x4c) = uVar2;
  *(undefined4 *)(param_1 + 0x50) = 0;
  *(undefined1 *)(param_1 + 0x54) = 1;
  func_0x00d87990(param_1 + 0x10);
  *(uint *)(param_1 + 100) = uVar3 * iVar1 * 2;
  *(uint *)(param_1 + 0x60) = (uVar3 + 1) * iVar1;
  iVar1 = func_0x00d9b270(param_1,*(undefined4 *)(param_2 + 0x28),
                          (uint)*(ushort *)(*(int *)(param_1 + 0x80) + 4) + (uVar3 + 5) * 0x10,0);
  if (iVar1 == 0) {
    uVar2 = func_0x00e3a4d0(param_1,&UNK_011217f0,0x18b);
    uVar2 = func_0x00e3a4a0(param_1,uVar2);
    uVar2 = func_0x00e3a470(param_1,uVar2);
    uVar2 = func_0x00415c90(2,&UNK_01121864,&UNK_011217e4,uVar2);
    func_0x004160e0(uVar2);
    return 0;
  }
  *(int *)(param_1 + 0x40) = iVar1;
  return 1;
}


===== 0xd732a0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d732a0(int param_1)

{
  int iVar1;
  byte bVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  int *piVar6;
  int iStack00000008;
  undefined1 auStack_104 [256];
  uint uStack_4;
  
  iVar1 = *(int *)(param_1 + 0x40);
  uStack_4 = _DAT_012ea8b0 ^ (uint)auStack_104;
  iStack00000008 = iVar1;
  if ((param_1 != 0) && (iVar1 != 0)) {
    uVar5 = (uint)*(byte *)(iVar1 + 0xe);
    func_0x00415c90();
    bVar2 = func_0x00415300();
    if ((3 < bVar2) && (*(short *)(iVar1 + 0x12) == 0)) {
      iVar3 = func_0x00d9adb0();
      func_0x009d4f9f(auStack_104,0x100,0xff,&UNK_01126d48,(int)*(short *)(iVar1 + 0xc),iVar3,
                      (double)(float)((double)(int)((iVar3 - *(short *)(iVar1 + 0xc)) *
                                                   (uint)*(ushort *)(iVar1 + 10)) * _DAT_01050b00));
      uVar4 = func_0x00e3a4d0(param_1,&UNK_01126d80,0xbb);
      uVar4 = func_0x00e3a4a0(param_1,uVar4);
      uVar4 = func_0x00e3a470(param_1,uVar4);
      uVar4 = func_0x00415c90(4,&UNK_01126df0,auStack_104,uVar4);
      func_0x004160e0(uVar4);
    }
    if (uVar5 != 0) {
      piVar6 = (int *)(iVar1 + 4);
      do {
        if (*piVar6 != 0) {
          func_0x00e3a260(param_1,*piVar6);
          *piVar6 = 0;
        }
        piVar6 = piVar6 + 5;
        uVar5 = uVar5 - 1;
      } while (uVar5 != 0);
    }
    func_0x00e3a260(param_1,iVar1);
  }
  func_0x009d20f4();
  return;
}


===== 0xd73900 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d73900(int param_1,int param_2,int param_3)

{
  undefined1 *puStack_8c;
  byte abStack_88 [4];
  int iStack_84;
  undefined *puStack_80;
  int *piStack_7c;
  undefined *puStack_78;
  int *piStack_74;
  int iStack_70;
  int iStack_6c;
  undefined1 **ppuStack_68;
  undefined4 uStack_64;
  int iStack_60;
  int iStack_5c;
  undefined1 **ppuStack_58;
  undefined4 uStack_54;
  undefined4 uStack_50;
  undefined **ppuStack_4c;
  undefined **ppuStack_48;
  int iStack_44;
  undefined4 uStack_40;
  int iStack_3c;
  int iStack_38;
  undefined1 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  byte *pbStack_24;
  undefined1 auStack_20 [32];
  
  ppuStack_68 = &puStack_8c;
  piStack_74 = &iStack_70;
  ppuStack_58 = &puStack_8c;
  puStack_8c = auStack_20;
  piStack_7c = &iStack_60;
  abStack_88[0] = *(byte *)(param_2 + 0xc) & 1;
  uStack_34 = *(char *)(param_2 + 0x25) != '\0';
  uStack_40 = *(undefined4 *)(param_1 + 0x74);
  iStack_6c = param_2;
  iStack_5c = param_2;
  iStack_84 = param_2;
  uStack_30 = *(undefined4 *)(param_1 + 0x78);
  uStack_2c = *(undefined4 *)(param_1 + 0x7c);
  uStack_28 = *(undefined4 *)(param_1 + 0x80);
  iStack_70 = param_1;
  iStack_60 = param_1;
  iStack_3c = param_1;
  ppuStack_4c = &puStack_78;
  ppuStack_48 = &puStack_80;
  pbStack_24 = abStack_88;
  uStack_64 = 0;
  puStack_78 = &UNK_00d72fb0;
  uStack_54 = 0;
  uStack_50 = 0;
  puStack_80 = &UNK_00d73390;
  iStack_38 = param_3;
  iStack_44 = param_1 + 0x10;
  func_0x00d87d00(auStack_20);
  *(float *)(param_1 + 0x68) = *(float *)(param_1 + 0x68) - (float)((double)param_3 / _DAT_00fa9598)
  ;
  *(undefined2 *)(param_1 + 0x6c) = 0;
  func_0x00d93910(&ppuStack_4c);
  func_0x00d87d80(param_1 + 0x10,auStack_20);
  if (*(float *)(param_1 + 0x68) <= 0.0) {
    *(float *)(param_1 + 0x68) = (float)((double)*(float *)(param_1 + 0x68) + _DAT_00f63028);
  }
  return;
}


===== 0xd73f70 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d73f70(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  int *unaff_FS_OFFSET;
  undefined4 uStack_f0;
  undefined4 uStack_ec;
  int iStack_e8;
  undefined4 uStack_e4;
  int iStack_e0;
  undefined4 uStack_dc;
  uint uStack_d8;
  undefined4 uStack_d4;
  int iStack_d0;
  int iStack_cc;
  int iStack_c8;
  undefined1 *puStack_c4;
  undefined4 uStack_c0;
  undefined4 uStack_bc;
  uint uStack_b8;
  undefined4 **ppuStack_b4;
  uint uStack_b0;
  uint uStack_ac;
  int iStack_84;
  undefined *puStack_80;
  undefined4 uStack_7c;
  undefined4 uStack_78;
  undefined4 uStack_74;
  undefined4 uStack_70;
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined *puStack_64;
  undefined *puStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  int iStack_54;
  undefined4 uStack_50;
  undefined *puStack_4c;
  int *piStack_48;
  undefined **ppuStack_44;
  undefined4 uStack_40;
  int iStack_3c;
  int iStack_38;
  int iStack_34;
  undefined1 *puStack_30;
  undefined4 uStack_2c;
  undefined1 auStack_28 [8];
  int *piStack_20;
  undefined4 *puStack_1c;
  undefined4 uStack_18;
  undefined2 uStack_14;
  int iStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00f02b30;
  iStack_c = *unaff_FS_OFFSET;
  uStack_ac = _DAT_012ea8b0 ^ (uint)&stack0xffffff58;
  *unaff_FS_OFFSET = (int)&iStack_c;
  if ((0 < *(short *)(param_1 + 0x6c)) &&
     (_DAT_00f62f70 < (double)*(float *)(*(int *)(param_1 + 0x70) + 0xc))) {
    uStack_b0 = (uint)*(byte *)(param_2 + 0x25);
    ppuStack_b4 = *(undefined4 ***)(param_1 + 0x74);
    uStack_b8 = param_1;
    uStack_bc = 0xd73fea;
    uStack_b8 = func_0x00e39f40();
    uStack_bc = 0xd73ff3;
    uStack_40 = func_0x00d94280();
    puStack_80 = &UNK_0111e678;
    uStack_7c = 0;
    uStack_78 = 0;
    uStack_74 = 0;
    uStack_70 = 0;
    uStack_6c = 0;
    uStack_68 = 0;
    uStack_5c = 0;
    uStack_58 = 0;
    iStack_54 = 0;
    uStack_50 = 0;
    puStack_4c = (undefined *)0x0;
    puStack_64 = &UNK_0111e688;
    puStack_60 = &UNK_00d665e0;
    iVar2 = *(int *)(param_1 + 0x58);
    iStack_84 = *(int *)(param_1 + 0x5c);
    uStack_4 = 1;
    if ((iVar2 != 0) && (iStack_84 != 0)) {
      uStack_b0 = 0xd7407c;
      iVar1 = func_0x00baaea0();
      iVar1 = *(int *)(*(int *)(*(int *)(iVar1 + 0x6c) + 200) + 0x13c);
      ppuStack_b4 = (undefined4 **)0xd74093;
      uStack_b0 = iVar1;
      func_0x00bbaea0();
      puStack_30 = auStack_28;
      piStack_20 = &iStack_84;
      puStack_1c = &uStack_68;
      ppuStack_44 = &puStack_4c;
      piStack_48 = &iStack_38;
      uStack_74 = CONCAT22(uStack_74._2_2_,0x10);
      uStack_58 = CONCAT22(uStack_58._2_2_,2);
      uStack_18 = 0;
      uStack_14 = 0;
      iStack_38 = param_1;
      iStack_34 = param_1;
      uStack_2c = 0;
      puStack_4c = &UNK_00d73aa0;
      iStack_3c = param_1;
      puStack_80 = &UNK_00d91680;
      ppuStack_b4 = (undefined4 **)0xd74136;
      iStack_54 = param_1 + 0x10;
      func_0x00d855e0();
      ppuStack_b4 = (undefined4 **)0xd7413f;
      func_0x00d856f0();
      ppuStack_b4 = &ppuStack_44;
      uStack_b8 = 0xd74149;
      func_0x00d93b20();
      ppuStack_b4 = (undefined4 **)0xd74155;
      func_0x00d85670();
      ppuStack_b4 = (undefined4 **)0xd7415e;
      func_0x00d85780();
      uStack_b8 = (uint)*(byte *)(param_1 + 0x56);
      ppuStack_b4 = (undefined4 **)0x0;
      uStack_c0 = 0;
      iStack_c8 = param_1 + 0x10;
      iStack_d0 = param_1;
      uStack_d4 = 0xd7417a;
      iStack_cc = iVar1;
      puStack_c4 = (undefined1 *)iVar2;
      func_0x00d87ad0();
      if ((*(char *)(iVar1 + 0x48) != '\0') && (*(undefined4 **)(iVar1 + 0x2c) != (undefined4 *)0x0)
         ) {
        **(undefined4 **)(iVar1 + 0x2c) = 0;
      }
      ppuStack_b4 = (undefined4 **)0x0;
      uStack_bc = 0xd74198;
      uStack_b8 = iVar2;
      func_0x00c13770();
      iVar2 = 0;
      do {
        uStack_bc = 0;
        uStack_c0 = 0;
        puStack_c4 = (undefined1 *)0x1;
        iStack_c8 = 1;
        iStack_d0 = 0xd741d3;
        iStack_cc = iVar2;
        (**(code **)(*_DAT_0136b6b0 + 0x78))();
        iVar2 = iVar2 + 1;
      } while (iVar2 < 2);
      uStack_bc = 0;
      uStack_c0 = 0xd741e6;
      func_0x00c0ed80();
      uStack_c0 = 0;
      puStack_c4 = (undefined1 *)0xd741f1;
      func_0x00c0edf0();
      puStack_c4 = (undefined1 *)0x0;
      iStack_c8 = 0xd741fc;
      func_0x00c0edc0();
      iStack_c8 = 0x10;
      iStack_cc = 0;
      uStack_d4 = 0;
      uStack_d8 = 0xd74212;
      (**(code **)(*_DAT_0136b6b0 + 100))();
      uStack_d8 = uStack_ac;
      uStack_dc = 0xd74224;
      (**(code **)(*_DAT_0136b6b0 + 0x74))();
      uStack_dc = uStack_c0;
      iStack_e0 = 0xd74236;
      (**(code **)(*_DAT_0136b6b0 + 0x70))();
      iStack_e0 = *(short *)(uStack_b8 + 0x5c) * 2;
      uStack_e4 = 0;
      iStack_e8 = *(int *)(uStack_b8 + 0x50) + -1;
      uStack_ec = 0;
      puStack_c4 = (undefined1 *)&uStack_f0;
      uStack_f0 = 3;
      (**(code **)(*_DAT_0136b6b0 + 0x6c))();
    }
  }
  *unaff_FS_OFFSET = iStack_c;
  return;
}


===== 0xd732e0 =====

void FUN_00d732e0(int param_1,int param_2,undefined4 *param_3)

{
  undefined4 uVar1;
  
  uVar1 = func_0x00e39f40(param_1,*(undefined4 *)(param_1 + 0x74),*(undefined1 *)(param_2 + 0x25));
  uVar1 = func_0x00d94280(uVar1);
  param_3[0x11] = param_1 + 0x10;
  *param_3 = uVar1;
  return;
}


===== 0xd73320 =====

void FUN_00d73320(void)

{
  return;
}


===== 0xd7e200 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00d7e200(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = _DAT_00f54f70;
  *(byte *)(param_1 + 0x2c) = *(byte *)(param_1 + 0x2c) | 1;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  return 1;
}


===== 0xd7e240 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d7e240(int param_1,int *param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined8 uStack_8;
  
  param_2[0] = 0;
  param_2[1] = 0;
  param_2[2] = 0;
  param_2[3] = 0;
  param_2[4] = 0;
  param_2[5] = 0;
  param_2[6] = 0;
  param_2[7] = 0;
  param_2[8] = 0;
  param_2[9] = 0;
  if (*(int *)(*(int *)(param_1 + 0x30) + 0xc) != 0) {
    *param_2 = (int)(param_2 + 1);
    func_0x00bceb80(param_2 + 1);
  }
  uVar3 = _DAT_00f54f70;
  uVar1 = *(undefined8 *)(param_1 + 0x18);
  uVar2 = *(undefined8 *)(param_1 + 0x10);
  param_2[5] = (int)(param_2 + 6);
  *(undefined8 *)(param_2 + 6) = uVar2;
  uStack_8 = CONCAT44(uVar3,(int)uVar1);
  *(undefined8 *)(param_2 + 8) = uStack_8;
  return;
}


===== 0xd7e370 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d7e370(int param_1)

{
  undefined4 *puVar1;
  float fVar2;
  char cVar3;
  int *piVar4;
  undefined8 *puVar5;
  int iVar6;
  undefined4 uVar7;
  undefined8 uStack_204;
  undefined4 uStack_1fc;
  float fStack_1f8;
  undefined1 auStack_1f4 [4];
  undefined4 uStack_1f0;
  undefined1 auStack_1e4 [4];
  undefined8 uStack_1e0;
  undefined8 uStack_1d8;
  undefined8 uStack_1d0;
  undefined8 uStack_1c8;
  undefined8 uStack_1c0;
  undefined8 uStack_1b8;
  undefined8 uStack_1b0;
  undefined8 uStack_1a8;
  float fStack_18c;
  float fStack_188;
  float fStack_184;
  float fStack_180;
  undefined8 uStack_174;
  undefined1 auStack_164 [68];
  undefined1 auStack_120 [60];
  undefined1 auStack_e4 [64];
  undefined1 auStack_a4 [64];
  undefined1 auStack_64 [40];
  float fStack_3c;
  float fStack_38;
  float fStack_34;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  float fStack_18;
  
  piVar4 = (int *)func_0x00e3a460(param_1);
  puVar5 = (undefined8 *)(**(code **)(*piVar4 + 0x68))();
  uStack_1e0 = *puVar5;
  uStack_1d8 = puVar5[1];
  uStack_1d0 = puVar5[2];
  uStack_1c8 = puVar5[3];
  uStack_1c0 = puVar5[4];
  uStack_1b8 = puVar5[5];
  uStack_1b0 = puVar5[6];
  uStack_1a8 = puVar5[7];
  func_0x00420200(auStack_120);
  puVar1 = *(undefined4 **)(param_1 + 0x30);
  uStack_24 = *puVar1;
  uStack_20 = puVar1[1];
  uStack_1c = puVar1[2];
  fStack_18 = _DAT_00f54f70;
  if ((*(byte *)(param_1 + 0x2c) & 1) == 0) goto LAB_00d7e4ff;
  func_0x00430430(auStack_164,&uStack_24,(int)&uStack_1a8 + 4,auStack_1e4);
  func_0x0042edb0();
  uStack_204 = uStack_174;
  cVar3 = func_0x00d85800(&uStack_1fc,&stack0xfffffdf4);
  if (cVar3 == '\x01') {
LAB_00d7e4f0:
    *(undefined4 *)(param_1 + 0x24) = uStack_1f0;
  }
  else {
    uStack_204 = CONCAT44((float)((double)uStack_204._4_4_ + _DAT_00f63028),(undefined4)uStack_204);
    cVar3 = func_0x00d85800(auStack_1f4,&uStack_204);
    if (cVar3 == '\x01') goto LAB_00d7e4f0;
  }
  *(byte *)(param_1 + 0x2c) = *(byte *)(param_1 + 0x2c) & 0xfe;
LAB_00d7e4ff:
  iVar6 = (**(code **)(*piVar4 + 0x68))();
  uStack_1fc = 0;
  uStack_204 = (ulonglong)(uint)(_DAT_00f62fa0 - *(float *)(iVar6 + 0x34)) << 0x20;
  fStack_1f8 = _DAT_00f54f70;
  uVar7 = func_0x00430430(auStack_164,param_1 + 0x20,(int)&uStack_1a8 + 4,auStack_1e4);
  uVar7 = func_0x00430430(auStack_a4,&uStack_204,auStack_e4,uVar7);
  func_0x0042edb0(auStack_64,uVar7);
  func_0x0042edb0();
  func_0x0042edb0();
  fVar2 = _DAT_00f54f70;
  fStack_180 = fStack_180 + _DAT_00f54f70;
  *(ulonglong *)(param_1 + 0x10) = CONCAT44(fStack_188 + fStack_38,fStack_18c + fStack_3c);
  *(ulonglong *)(param_1 + 0x18) = CONCAT44(fStack_180,fStack_184 + fStack_34);
  *(float *)(param_1 + 0x1c) = fVar2;
  return;
}


===== 0xd80a30 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00d80a30(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  *(undefined4 *)(param_1 + 0x50) = 0;
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) & 0xfd | 1;
  *(undefined4 *)(param_1 + 0x60) = 0;
  *(undefined4 *)(param_1 + 100) = 0;
  *(undefined4 *)(param_1 + 0x68) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  return 1;
}


===== 0xd80ac0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d80ac0(int param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (param_3 == 2) {
    if ((*(byte *)(param_4 + 0x12) & 1) == 0) {
      *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) & 0xfd;
    }
    else {
      *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) | 2;
    }
    *(undefined4 *)(param_1 + 0x30) = *param_4;
    if ((*(byte *)(param_1 + 0x5c) & 2) != 0) {
      *(float *)(param_1 + 0x40) = (float)param_4[4] * (float)param_4[0x10];
      *(undefined4 *)(param_1 + 0x50) = *param_4;
      *(undefined4 *)(param_1 + 0x60) = *param_4;
      *(undefined4 *)(param_1 + 0x34) = param_4[1];
      *(float *)(param_1 + 0x44) = (float)param_4[5] * (float)param_4[0x10];
      *(undefined4 *)(param_1 + 0x54) = param_4[1];
      *(undefined4 *)(param_1 + 100) = param_4[1];
      *(undefined4 *)(param_1 + 0x38) = param_4[2];
      *(float *)(param_1 + 0x48) = (float)param_4[6] * (float)param_4[0x10];
      uVar2 = _DAT_00f54f70;
      *(undefined4 *)(param_1 + 0x58) = param_4[2];
      *(undefined4 *)(param_1 + 0x68) = param_4[2];
      uVar1 = param_4[0x11];
      *(undefined4 *)(param_1 + 0x4c) = uVar2;
      *(undefined4 *)(param_1 + 0x3c) = uVar1;
      return;
    }
    *(float *)(param_1 + 0x40) = (float)param_4[0x10] * (float)param_4[4];
    *(float *)(param_1 + 0x50) = (float)param_4[0x11] * (float)param_4[4];
    *(undefined4 *)(param_1 + 0x34) = param_4[1];
    *(float *)(param_1 + 0x44) = (float)param_4[0x10] * (float)param_4[5];
    *(float *)(param_1 + 0x54) = (float)param_4[0x11] * (float)param_4[5];
    *(undefined4 *)(param_1 + 0x38) = param_4[2];
    *(float *)(param_1 + 0x48) = (float)param_4[0x10] * (float)param_4[6];
    *(float *)(param_1 + 0x58) = (float)param_4[0x11] * (float)param_4[6];
  }
  return;
}


===== 0xd80ce0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d80ce0(int param_1,undefined4 param_2,int param_3)

{
  float *pfVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  char cVar5;
  float *pfVar6;
  int *piVar7;
  undefined8 *puVar8;
  int iVar9;
  undefined4 uVar10;
  int iVar11;
  float *pfVar12;
  float unaff_EBX;
  int iVar13;
  int iVar14;
  float fVar15;
  longlong lStack_1c8;
  float fStack_1c4;
  longlong lStack_1c0;
  float fStack_1b8;
  float fStack_1b4;
  float fStack_1b0;
  uint uStack_1ac;
  int iStack_1a4;
  undefined4 uStack_1a0;
  undefined1 auStack_194 [4];
  undefined8 uStack_190;
  undefined8 uStack_188;
  undefined8 uStack_180;
  undefined8 uStack_178;
  undefined8 uStack_170;
  undefined8 uStack_168;
  undefined8 uStack_160;
  undefined8 uStack_158;
  undefined1 auStack_144 [4];
  undefined1 auStack_140 [48];
  float fStack_110;
  undefined1 auStack_104 [64];
  undefined1 auStack_c4 [64];
  undefined1 auStack_84 [64];
  undefined1 auStack_44 [68];
  
  *(int *)(param_1 + 0x2c) = *(int *)(param_1 + 0x2c) + param_3;
  iVar9 = param_1 + 0x30;
  pfVar12 = (float *)(param_1 + 0x40);
  pfVar6 = (float *)(param_1 + 0x50);
  fVar15 = (float)((double)*(int *)(param_1 + 0x2c) / _DAT_00fa9598);
  if ((*(byte *)(param_1 + 0x5c) & 2) == 0) {
    iVar11 = (int)pfVar6 - (int)pfVar12;
    iVar9 = iVar9 - (int)pfVar12;
    iVar13 = (int)&fStack_1c4 - (int)pfVar12;
    iVar14 = 3;
    do {
      *(float *)((int)pfVar12 + iVar13) =
           (float)((double)*(float *)(iVar11 + (int)pfVar12) * _DAT_00f59898 *
                   (double)fVar15 * (double)fVar15 + (double)*pfVar12 * (double)fVar15 +
                  (double)*(float *)(iVar9 + (int)pfVar12));
      pfVar12 = pfVar12 + 1;
      iVar14 = iVar14 + -1;
    } while (iVar14 != 0);
  }
  else {
    fVar2 = *(float *)(param_1 + 0x4c);
    iVar13 = iVar9 - (int)pfVar6;
    iVar14 = (int)&fStack_1c4 - (int)pfVar6;
    iVar11 = (param_1 + 0x60) - (int)pfVar6;
    iStack_1a4 = 3;
    do {
      pfVar1 = (float *)(iVar13 + (int)pfVar6);
      fVar4 = *(float *)((int)pfVar1 + ((int)pfVar12 - iVar9)) * fVar15 + *pfVar1;
      fVar3 = *pfVar6;
      *pfVar6 = fVar4;
      fVar3 = (fVar4 - fVar3) * fVar2 + *(float *)(iVar11 + (int)pfVar6);
      *(float *)((int)pfVar6 + iVar14) = fVar3;
      *(float *)(iVar11 + (int)pfVar6) = fVar3;
      pfVar6 = pfVar6 + 1;
      iStack_1a4 = iStack_1a4 + -1;
    } while (iStack_1a4 != 0);
    *(float *)(param_1 + 0x4c) = *(float *)(param_1 + 0x3c) * *(float *)(param_1 + 0x4c);
    iStack_1a4 = 0;
  }
  piVar7 = (int *)func_0x00e3a460(param_1);
  puVar8 = (undefined8 *)(**(code **)(*piVar7 + 0x68))();
  uStack_190 = *puVar8;
  uStack_188 = puVar8[1];
  uStack_180 = puVar8[2];
  uStack_178 = puVar8[3];
  uStack_170 = puVar8[4];
  uStack_168 = puVar8[5];
  uStack_160 = puVar8[6];
  uStack_158 = puVar8[7];
  func_0x00420200(auStack_140);
  pfVar12 = *(float **)(param_1 + 0x70);
  fStack_1b8 = *pfVar12 + unaff_EBX;
  fStack_1b4 = pfVar12[1] + fStack_1c4;
  fStack_1b0 = pfVar12[2] + (float)lStack_1c0;
  uStack_1ac = _DAT_00f54f70;
  iVar9 = func_0x00e3a080((undefined8 *)(param_1 + 0x10));
  if ((*(byte *)(param_1 + 0x5c) & 1) == 0) goto LAB_00d80fef;
  if ((iVar9 == 0) || (iVar9 == 3)) {
    fStack_1c4 = fStack_1b4;
    lStack_1c0 = CONCAT44(uStack_1ac,fStack_1b0);
  }
  else {
    puVar8 = (undefined8 *)func_0x0042ec50((int)&uStack_158 + 4,&fStack_1b8);
    fStack_1c4 = (float)((ulonglong)*puVar8 >> 0x20);
    lStack_1c0 = puVar8[1];
  }
  fStack_1c4 = (float)((double)fStack_1c4 + _DAT_00f63028);
  cVar5 = func_0x00d85800(&iStack_1a4,&stack0xfffffe38);
  if (cVar5 == '\x01') {
LAB_00d80fe0:
    *(undefined4 *)(param_1 + 0x24) = uStack_1a0;
  }
  else {
    fStack_1c4 = (float)((double)fStack_1c4 + _DAT_00f63028);
    cVar5 = func_0x00d85800(&iStack_1a4,&stack0xfffffe38);
    if (cVar5 == '\x01') goto LAB_00d80fe0;
  }
  *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) & 0xfe;
LAB_00d80fef:
  if ((iVar9 == 0) || (iVar9 == 3)) {
    fStack_110 = *(float *)(param_1 + 0x24);
  }
  else {
    iVar9 = (**(code **)(*piVar7 + 0x68))();
    lStack_1c8 = (ulonglong)(uint)(_DAT_00f62fa0 - *(float *)(iVar9 + 0x34)) << 0x20;
    lStack_1c0 = (ulonglong)_DAT_00f54f70 << 0x20;
    uVar10 = func_0x00430430(auStack_104,param_1 + 0x20,auStack_144,auStack_194);
    uVar10 = func_0x00430430(auStack_c4,&stack0xfffffe38,auStack_84,uVar10);
    func_0x0042edb0(auStack_44,uVar10);
    func_0x0042edb0();
    func_0x0042edb0();
    fStack_110 = fStack_110 + fStack_1b4;
  }
  *(undefined8 *)(param_1 + 0x10) = CONCAT44(fStack_110,fStack_1b8);
  *(ulonglong *)(param_1 + 0x18) = CONCAT44(uStack_1ac,fStack_1b0);
  return;
}


===== 0xd806e0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00d806e0(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = _DAT_00f54f70;
  *(byte *)(param_1 + 0x2c) = *(byte *)(param_1 + 0x2c) | 1;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  return 1;
}


===== 0xd80730 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d80730(int param_1,int *param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined8 uStack_8;
  
  param_2[0] = 0;
  param_2[1] = 0;
  param_2[2] = 0;
  param_2[3] = 0;
  param_2[4] = 0;
  param_2[5] = 0;
  param_2[6] = 0;
  param_2[7] = 0;
  param_2[8] = 0;
  param_2[9] = 0;
  if (*(int *)(*(int *)(param_1 + 0x40) + 0xc) != 0) {
    *param_2 = (int)(param_2 + 1);
    func_0x00bceb80(param_2 + 1);
  }
  uVar3 = _DAT_00f54f70;
  uVar1 = *(undefined8 *)(param_1 + 0x18);
  uVar2 = *(undefined8 *)(param_1 + 0x10);
  param_2[5] = (int)(param_2 + 6);
  *(undefined8 *)(param_2 + 6) = uVar2;
  uStack_8 = CONCAT44(uVar3,(int)uVar1);
  *(undefined8 *)(param_2 + 8) = uStack_8;
  return;
}


===== 0xd80860 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d80860(int param_1)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  undefined4 uVar4;
  char cVar5;
  int iVar6;
  float fStack_20;
  float fStack_1c;
  float fStack_18;
  undefined4 uStack_14;
  undefined1 auStack_10 [4];
  undefined4 uStack_c;
  
  pfVar3 = *(float **)(param_1 + 0x40);
  if ((*(byte *)(param_1 + 0x2c) & 1) == 0) goto LAB_00d8095d;
  iVar6 = func_0x00e39f40(param_1);
  *(undefined4 *)(param_1 + 0x30) = *(undefined4 *)(iVar6 + 0x30);
  *(undefined4 *)(param_1 + 0x34) = *(undefined4 *)(iVar6 + 0x34);
  *(undefined4 *)(param_1 + 0x38) = *(undefined4 *)(iVar6 + 0x38);
  fStack_18 = pfVar3[2] + *(float *)(iVar6 + 0x38);
  fStack_20 = *(float *)(iVar6 + 0x30) + *pfVar3;
  fStack_1c = (float)((double)(pfVar3[1] + *(float *)(iVar6 + 0x34)) + _DAT_00f63028);
  uStack_14 = _DAT_00f54f70;
  cVar5 = func_0x00d85800(auStack_10,&fStack_20);
  if (cVar5 == '\x01') {
LAB_00d8094e:
    *(undefined4 *)(param_1 + 0x34) = uStack_c;
  }
  else {
    fStack_1c = (float)((double)fStack_1c + _DAT_00f63028);
    cVar5 = func_0x00d85800(auStack_10,&fStack_20);
    if (cVar5 == '\x01') goto LAB_00d8094e;
  }
  *(byte *)(param_1 + 0x2c) = *(byte *)(param_1 + 0x2c) & 0xfe;
LAB_00d8095d:
  fVar1 = pfVar3[2];
  fVar2 = *pfVar3;
  *(float *)(param_1 + 0x14) = *(float *)(param_1 + 0x34) + pfVar3[1];
  uVar4 = _DAT_00f54f70;
  *(float *)(param_1 + 0x10) = *(float *)(param_1 + 0x30) + fVar2;
  *(float *)(param_1 + 0x18) = *(float *)(param_1 + 0x38) + fVar1;
  *(undefined4 *)(param_1 + 0x1c) = uVar4;
  return;
}


===== 0xba1f90 =====

void FUN_00ba1f90(void)

{
  return;
}


===== 0xd6aca0 =====

bool FUN_00d6aca0(int param_1,int *param_2)

{
  int iVar1;
  char cVar2;
  
  iVar1 = *param_2;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined1 *)(param_1 + 0x1c) = 1;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  cVar2 = func_0x00d999b0(param_1,iVar1 + 0x24,param_1 + 0x2c);
  return cVar2 != '\0';
}


===== 0xd6acf0 =====

void FUN_00d6acf0(int param_1,int *param_2)

{
  func_0x00d98d10(param_1,*param_2 + 0x24,param_1 + 0x2c);
  return;
}


===== 0xd6ad50 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d6ad50(int param_1,int *param_2,int param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  undefined8 *puVar5;
  bool bVar6;
  float fVar7;
  float *pfVar8;
  longlong *plVar9;
  int iVar10;
  float fVar11;
  float fVar13;
  float fVar14;
  double dVar12;
  float fVar15;
  float fVar16;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  int iStack_d0;
  float fStack_cc;
  float fStack_c8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  float fStack_60;
  float fStack_5c;
  float fStack_58;
  float fStack_54;
  float fStack_50;
  float fStack_4c;
  float fStack_48;
  float fStack_44;
  undefined1 auStack_40 [16];
  float fStack_30;
  float fStack_2c;
  float fStack_28;
  float fStack_24;
  float fStack_20;
  float fStack_1c;
  float fStack_18;
  float fStack_14;
  
  if ((char)param_2[1] == '\x02') {
    iVar4 = *param_2;
    puVar5 = *(undefined8 **)(param_1 + 0x40);
    uStack_a0 = *puVar5;
    uStack_98 = puVar5[1];
    uStack_90 = puVar5[2];
    uStack_88 = puVar5[3];
    uStack_80 = puVar5[4];
    uStack_78 = puVar5[5];
    uStack_70 = puVar5[6];
    uStack_68 = puVar5[7];
    uStack_e0 = *(undefined8 *)(param_1 + 0x20);
    uStack_d8 = *(undefined8 *)(param_1 + 0x28);
    pfVar8 = (float *)func_0x00e3a0a0(param_1,iVar4 + 0x30);
    fVar1 = *pfVar8;
    pfVar8 = (float *)func_0x00e3a0a0(param_1,iVar4 + 0x34);
    fVar2 = *pfVar8;
    pfVar8 = (float *)func_0x00e3a0a0(param_1,iVar4 + 0x38);
    fVar3 = *pfVar8;
    *(float *)(param_1 + 0x20) = (float)uStack_70;
    *(float *)(param_1 + 0x24) = uStack_70._4_4_;
    *(float *)(param_1 + 0x28) = (float)uStack_68;
    if (*(char *)(param_1 + 0x1c) != '\0') {
      *(undefined1 *)(param_1 + 0x1c) = 0;
      uStack_e0 = uStack_70;
      uStack_d8 = uStack_68;
      *(float *)(param_1 + 0x20) = (float)uStack_70;
      *(float *)(param_1 + 0x24) = uStack_70._4_4_;
      *(float *)(param_1 + 0x28) = (float)uStack_68;
      if (param_3 == 0) {
        return;
      }
    }
    fStack_30 = (float)uStack_70 - (float)uStack_e0;
    fStack_2c = uStack_70._4_4_ - uStack_e0._4_4_;
    fStack_28 = (float)uStack_68 - (float)uStack_d8;
    fStack_24 = uStack_68._4_4_ - uStack_d8._4_4_;
    fStack_50 = (float)uStack_e0;
    fStack_4c = uStack_e0._4_4_;
    fStack_48 = (float)uStack_d8;
    fStack_44 = uStack_d8._4_4_;
    fVar13 = fStack_2c * fStack_2c;
    fVar15 = fStack_28 * fStack_28;
    fStack_1c = fVar15 + fVar13 + fVar13;
    fStack_18 = fVar15 + fVar15 + fVar13;
    fStack_14 = fVar15 + fStack_24 * fStack_24 + fVar13;
    fStack_20 = SQRT(fVar15 + fStack_30 * fStack_30 + fVar13);
    iStack_d0 = 0;
    if ((double)fStack_20 <= _DAT_00fe1e38) {
      uStack_e0 = (ulonglong)(uint)_DAT_00f54f70 << 0x20;
      uStack_d8 = (ulonglong)(uint)_DAT_00f54f70 << 0x20;
    }
    else {
      plVar9 = (longlong *)func_0x0053b750(auStack_40);
      uStack_e0 = *plVar9;
      uStack_d8 = plVar9[1];
    }
    fStack_c8 = *(float *)(param_1 + 0x3c);
    fStack_cc = 0.0;
    *(float *)(param_1 + 0x3c) = fStack_c8 + fStack_20;
    func_0x00e3a810(param_1);
    if (*(float *)(param_1 + 0x14) <= *(float *)(param_1 + 0x3c)) {
      fStack_60 = (float)uStack_e0;
      fStack_5c = uStack_e0._4_4_;
      fStack_58 = (float)uStack_d8;
      fStack_54 = uStack_d8._4_4_;
      do {
        fStack_cc = *(float *)(param_1 + 0x14) + fStack_cc;
        fStack_c8 = fStack_cc - fStack_c8;
        fVar11 = fStack_c8 * fStack_60 + fStack_50;
        fVar14 = fStack_c8 * fStack_5c + fStack_4c;
        fVar16 = fStack_c8 * fStack_58 + fStack_48;
        fStack_24 = fStack_c8 * fStack_54 + fStack_44;
        fStack_c8 = 0.0;
        fStack_30 = fVar11;
        fStack_2c = fVar14;
        fStack_28 = fVar16;
        iVar10 = func_0x00e3f230();
        fVar13 = *(float *)(iVar4 + 0x2c);
        dVar12 = (double)iVar10 * _DAT_010cfd40;
        fVar15 = *(float *)(iVar4 + 0xc);
        iVar10 = func_0x00e3f1b0();
        fVar7 = (float)iVar10;
        if (iVar10 < 0) {
          fVar7 = fVar7 + _DAT_00f54a54;
        }
        if (fVar7 * (float)_DAT_010c6268 <= fVar13 * (float)dVar12 + fVar15) {
          fStack_14 = _DAT_00f54f70;
          uStack_70 = CONCAT44(fVar14,fVar11);
          uStack_68 = CONCAT44(_DAT_00f54f70,fVar16);
          iVar10 = (int)fVar1;
          fStack_20 = fVar11;
          fStack_1c = fVar14;
          fStack_18 = fVar16;
          if (0 < (int)fVar1) {
            do {
              func_0x00d6ab70(param_1,param_2,&uStack_a0);
              iVar10 = iVar10 + -1;
            } while (iVar10 != 0);
          }
        }
        *(float *)(param_1 + 0x3c) = *(float *)(param_1 + 0x3c) - *(float *)(param_1 + 0x14);
        iVar10 = func_0x00e3f1b0();
        fVar15 = _DAT_00fb7ab4;
        fVar13 = (float)iVar10;
        if (iVar10 < 0) {
          fVar13 = fVar13 + _DAT_00f54a54;
        }
        fVar13 = fVar13 * (float)_DAT_010c6268 * fVar3 + fVar2;
        bVar6 = fVar13 < _DAT_00fb7ab4;
        *(float *)(param_1 + 0x14) = fVar13;
        if (bVar6) {
          fVar13 = fVar15;
        }
        iStack_d0 = iStack_d0 + 1;
        *(float *)(param_1 + 0x14) = fVar13;
      } while ((iStack_d0 < 0x65) && (fVar13 <= *(float *)(param_1 + 0x3c)));
    }
    func_0x00e3a830(param_1);
  }
  return;
}


===== 0xd7f6a0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d7f6a0(int param_1,int *param_2)

{
  int iVar1;
  int iVar2;
  char cVar3;
  int *piVar4;
  int iVar5;
  undefined4 uVar6;
  undefined1 auStack_108 [260];
  uint uStack_4;
  
  uStack_4 = _DAT_012ea8b0 ^ (uint)auStack_108;
  iVar1 = *param_2;
  *(undefined4 *)(param_1 + 0x3c) = _DAT_011216b8;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined1 *)(param_1 + 0x1c) = 1;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  cVar3 = func_0x00d999b0(param_1,iVar1 + 0x24,param_1 + 0x2c);
  if (cVar3 != '\0') {
    *(byte *)(param_1 + 0x1d) = *(byte *)(param_1 + 0x1d) & 0xfe;
    if ((char)param_2[1] == '\x01') {
      piVar4 = (int *)func_0x0080aa40();
      iVar5 = (**(code **)(*piVar4 + 8))(param_2[2]);
      iVar1 = param_2[2];
      if (iVar5 == -1) {
        func_0x009d4f08(auStack_108,&UNK_011245c0,iVar1);
        uVar6 = func_0x00415c90(1,auStack_108);
        func_0x004160e0(uVar6);
        *(undefined4 *)(param_1 + 0x40) = 0;
      }
      else {
        iVar2 = *piVar4;
        uVar6 = func_0x00e3a460(param_1,param_1,1);
        uVar6 = (**(code **)(iVar2 + 0xc))(iVar1,iVar5,uVar6);
        *(undefined4 *)(param_1 + 0x40) = uVar6;
      }
    }
    func_0x009d20f4();
    return;
  }
  func_0x009d20f4();
  return;
}


===== 0xd7f7c0 =====

void FUN_00d7f7c0(undefined4 param_1,int *param_2)

{
  int iVar1;
  int *piVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int unaff_retaddr;
  
  piVar2 = (int *)func_0x0080aa40();
  uVar3 = (**(code **)(*piVar2 + 8))(param_2[2]);
  iVar1 = *piVar2;
  uVar4 = func_0x00e3a460(unaff_retaddr,unaff_retaddr);
  (**(code **)(iVar1 + 0x14))(uVar3,uVar4);
  func_0x00d98d10(unaff_retaddr,*param_2 + 0x24,unaff_retaddr + 0x2c);
  return;
}


