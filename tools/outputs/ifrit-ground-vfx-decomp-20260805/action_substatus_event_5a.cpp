===== 0x65a860 =====

void FUN_0065a860(undefined4 *param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  
  iVar2 = 0;
  if (*(short *)(param_1 + 0xc) != 0) {
    puVar3 = param_1 + 0xe;
    do {
      iVar1 = func_0x007a0150(*puVar3);
      if (iVar1 != 0) {
        func_0x007bf2e0(*param_1,param_2);
      }
      iVar2 = iVar2 + 1;
      puVar3 = puVar3 + 5;
    } while (iVar2 < (int)(uint)*(ushort *)(param_1 + 0xc));
  }
  func_0x007bf2e0(*param_1,param_2);
  return;
}


===== 0x7ce7b0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007ce7b0(int param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  int *unaff_FS_OFFSET;
  undefined1 auStack_94 [4];
  undefined *puStack_90;
  uint uStack_24;
  int iStack_1c;
  undefined *puStack_18;
  undefined4 uStack_14;
  
  uStack_14 = 0xffffffff;
  puStack_18 = &UNK_00eab172;
  iStack_1c = *unaff_FS_OFFSET;
  uStack_24 = _DAT_012ea8b0 ^ (uint)auStack_94;
  uVar1 = _DAT_012ea8b0 ^ (uint)&stack0xffffff60;
  *unaff_FS_OFFSET = (int)&iStack_1c;
  iVar2 = func_0x0060b2a0(uVar1);
  if (iVar2 != 0) {
    uVar3 = func_0x004d65e0(*(undefined4 *)(param_1 + 0xdc),param_2 + 3,param_3,param_4);
    uStack_24 = 0;
    func_0x007cf7f0(uVar3);
    uStack_14 = 0xffffffff;
    puStack_90 = &UNK_00f90ef8;
  }
  *unaff_FS_OFFSET = iStack_1c;
  func_0x009d20f4();
  return;
}


