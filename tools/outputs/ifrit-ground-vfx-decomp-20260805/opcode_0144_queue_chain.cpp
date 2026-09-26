===== 0x6638a4 =====

void FUN_006638a4(void)

{
  undefined4 *unaff_ESI;
  
  func_0x007bf270(*unaff_ESI);
  func_0x007b4440(*(undefined2 *)(unaff_ESI + 1));
  func_0x007a5260(*(undefined2 *)((int)unaff_ESI + 6));
  func_0x009d20f4();
  return;
}


===== 0x7b43b0 =====

void __thiscall FUN_007b43b0(int param_1,undefined4 param_2)

{
  undefined4 uStack_30;
  undefined4 uStack_2c;
  
  *(undefined4 *)(param_1 + 0x54) = param_2;
  uStack_30 = param_2;
  uStack_2c = 0;
  func_0x007c7c20(&uStack_30);
  return;
}


===== 0x7b43e0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007b43e0(int *param_1,int param_2)

{
  int iVar1;
  int aiStack_30 [12];
  
  iVar1 = _DAT_00fe816c;
  if ((char)param_1[0x17] != '\0') {
    aiStack_30[0] = param_1[0x15];
    aiStack_30[2] = param_2;
    aiStack_30[1] = 1;
    func_0x007c7c20(aiStack_30);
    return;
  }
  *(undefined1 *)(param_1 + 0x17) = 1;
  param_1[2] = param_2;
  *(char *)(*param_1 + 0xb3a) = (char)param_2;
  param_1[0x16] = iVar1;
  return;
}


===== 0x7b4440 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007b4440(int param_1,undefined2 param_2)

{
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined2 uStack_28;
  
  uStack_30 = *(undefined4 *)(param_1 + 0x54);
  uStack_28 = param_2;
  uStack_2c = 3;
  func_0x007c7c20(&uStack_30);
  *(undefined4 *)(param_1 + 0x58) = _DAT_00fa5128;
  return;
}


===== 0x7b44c0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007b44c0(int param_1,undefined8 *param_2)

{
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined8 uStack_28;
  undefined8 uStack_20;
  undefined8 uStack_18;
  undefined8 uStack_10;
  undefined8 uStack_8;
  
  uStack_30 = *(undefined4 *)(param_1 + 0x54);
  uStack_28 = *param_2;
  uStack_20 = param_2[1];
  uStack_18 = param_2[2];
  uStack_10 = param_2[3];
  uStack_8 = param_2[4];
  uStack_2c = 5;
  func_0x007c7c20(&uStack_30);
  *(undefined4 *)(param_1 + 0x58) = _DAT_00fa5128;
  return;
}


===== 0x7bf270 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007bf270(int param_1,undefined4 param_2)

{
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  
  if (*(char *)(param_1 + 0x5d) != '\0') {
    uStack_30 = *(undefined4 *)(param_1 + 0x54);
    uStack_28 = param_2;
    uStack_2c = 2;
    func_0x007c7c20(&uStack_30);
    return;
  }
  *(undefined1 *)(param_1 + 0x5d) = 1;
  *(undefined4 *)(param_1 + 0xc) = param_2;
  func_0x007bb740(param_2,0);
  *(undefined4 *)(param_1 + 0x58) = _DAT_00fa5128;
  return;
}


