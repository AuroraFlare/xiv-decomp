===== 0x65ca50 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0065ca50(undefined4 *param_1,char param_2)

{
  undefined1 auStack_3c [12];
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  uint uStack_14;
  
  uStack_14 = _DAT_012ea8b0 ^ (uint)auStack_3c;
  uStack_30 = *param_1;
  uStack_2c = param_1[1];
  uStack_28 = param_1[2];
  uStack_24 = param_1[3];
  func_0x00853090(&uStack_30,0);
  if (param_2 != '\0') {
    func_0x007d1650(1);
  }
  func_0x009d20f4();
  return;
}


===== 0x65cae0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0065cae0(undefined4 *param_1,char param_2)

{
  undefined1 auStack_38 [8];
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  uint uStack_14;
  
  uStack_14 = _DAT_012ea8b0 ^ (uint)auStack_38;
  func_0x007a5cb0();
  uStack_30 = *param_1;
  uStack_2c = param_1[1];
  uStack_28 = param_1[2];
  uStack_24 = param_1[3];
  func_0x007a4c30(&uStack_30);
  if (param_2 != '\0') {
    func_0x007d1650(1);
  }
  func_0x009d20f4();
  return;
}


===== 0x65cb80 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_0065cb80(int param_1,undefined4 *param_2,char param_3)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined1 auStack_38 [8];
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  uint uStack_14;
  
  uStack_14 = _DAT_012ea8b0 ^ (uint)auStack_38;
  uVar1 = param_2[1];
  uVar2 = param_2[2];
  uVar3 = param_2[3];
  *(undefined4 *)(param_1 + 0x11f0) = *param_2;
  *(undefined4 *)(param_1 + 0x11f4) = uVar1;
  *(undefined4 *)(param_1 + 0x11f8) = uVar2;
  *(undefined4 *)(param_1 + 0x11fc) = uVar3;
  uStack_30 = *param_2;
  uStack_2c = param_2[1];
  uStack_28 = param_2[2];
  uStack_24 = param_2[3];
  func_0x007a7cc0(&uStack_30);
  func_0x007a5cb0();
  if (param_3 != '\0') {
    func_0x007d1650(1);
  }
  func_0x007a4240();
  func_0x007d4020(param_1,param_2);
  func_0x009d20f4();
  return;
}


===== 0x65c4c0 =====

void __thiscall FUN_0065c4c0(int param_1,int param_2)

{
  if ((*(uint *)(param_1 + 0x2b70) & 0x200) != 0) {
    if (param_2 == 0) {
      func_0x007b49a0(0,&UNK_00fc0364);
      func_0x007b49a0(0,&UNK_00fc0370);
      func_0x007a4130(0);
      return;
    }
    func_0x007b9420(0,&UNK_00fc037c,param_2);
    func_0x007b9420(0,&UNK_00fc0388,param_2);
    func_0x007a4130(0);
  }
  return;
}


===== 0x65af10 =====

/* WARNING: Possible PIC construction at 0x0065af29: Changing call to branch */
/* WARNING: Removing unreachable block (ram,0x0065af2e) */
/* WARNING: Removing unreachable block (ram,0x00844c76) */

void __thiscall FUN_0065af10(int param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  
  if (param_2 == 0) {
    param_2 = 8;
  }
  else if (param_2 == 1) {
    param_2 = 9;
  }
  uVar2 = *(uint *)(param_1 + 0x2868 + param_2 * 0x14);
  iVar1 = param_1 + 0x285c + param_2 * 0x14;
  if (*(int *)(iVar1 + 0x10) + uVar2 < uVar2) {
    func_0x009d22b4();
  }
  while( true ) {
    uVar4 = *(int *)(iVar1 + 0x10) + *(uint *)(iVar1 + 0xc);
    if (uVar4 < *(uint *)(iVar1 + 0xc)) {
      func_0x009d22b4();
    }
    if (uVar2 == uVar4) break;
    uVar5 = uVar2 >> 2;
    uVar4 = uVar2 & 3;
    if ((uint)(*(int *)(iVar1 + 0xc) + *(int *)(iVar1 + 0x10)) <= uVar2) {
      func_0x009d22b4();
    }
    uVar3 = uVar5;
    if (*(uint *)(iVar1 + 8) <= uVar5) {
      uVar3 = uVar5 - *(uint *)(iVar1 + 8);
    }
    if (*(int *)(*(int *)(*(int *)(*(int *)(iVar1 + 4) + uVar3 * 4) + uVar4 * 4) + 4) != 3) {
      if ((uint)(*(int *)(iVar1 + 0xc) + *(int *)(iVar1 + 0x10)) <= uVar2) {
        func_0x009d22b4();
      }
      uVar3 = uVar5;
      if (*(uint *)(iVar1 + 8) <= uVar5) {
        uVar3 = uVar5 - *(uint *)(iVar1 + 8);
      }
      if (*(int *)(*(int *)(*(int *)(*(int *)(iVar1 + 4) + uVar3 * 4) + uVar4 * 4) + 4) != 2) {
        if ((uint)(*(int *)(iVar1 + 0xc) + *(int *)(iVar1 + 0x10)) <= uVar2) {
          func_0x009d22b4();
        }
        if (*(uint *)(iVar1 + 8) <= uVar5) {
          uVar5 = uVar5 - *(uint *)(iVar1 + 8);
        }
        *(undefined4 *)(*(int *)(*(int *)(*(int *)(iVar1 + 4) + uVar5 * 4) + uVar4 * 4) + 4) = 2;
      }
    }
    if ((uint)(*(int *)(iVar1 + 0xc) + *(int *)(iVar1 + 0x10)) <= uVar2) {
      func_0x009d22b4();
    }
    uVar2 = uVar2 + 1;
  }
  return;
}


