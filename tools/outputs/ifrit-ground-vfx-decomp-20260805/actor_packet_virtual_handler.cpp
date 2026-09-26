===== 0x662570 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __thiscall
FUN_00662570(int *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *puVar1;
  uint uVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  undefined4 uVar6;
  int *unaff_FS_OFFSET;
  undefined4 uStack_24c;
  int iStack_248;
  undefined4 uStack_244;
  undefined *puStack_240;
  undefined1 auStack_23c [4];
  int iStack_238;
  undefined1 auStack_230 [8];
  undefined1 auStack_228 [112];
  undefined4 uStack_1b8;
  int iStack_30;
  undefined4 uStack_28;
  int iStack_14;
  undefined *puStack_10;
  undefined4 uStack_c;
  
  uStack_c = 0xffffffff;
  puStack_10 = &UNK_00e87c3e;
  iStack_14 = *unaff_FS_OFFSET;
  uVar2 = _DAT_012ea8b0 ^ (uint)&stack0xfffffda8;
  *unaff_FS_OFFSET = (int)&iStack_14;
  iVar3 = (**(code **)(*param_1 + 0x268))(uVar2);
  if (iVar3 == 0) {
    piVar4 = (int *)func_0x007a0150(param_3);
    if (piVar4 != (int *)0x0) {
      piVar5 = (int *)(**(code **)(*(int *)piVar4[0x45] + 8))();
      if (piVar5 != (int *)0x0) {
        func_0x0062e2d0(auStack_230,param_2,0x10);
        puStack_240 = &UNK_00736362;
        iStack_238 = (**(code **)(*piVar4 + 0x10))(&puStack_240,auStack_23c);
        if ((iStack_238 != 0) &&
           (puVar1 = (undefined4 *)param_1[0x4bc], puVar1 != (undefined4 *)0x0)) {
          func_0x0080c830();
          uStack_c = 0;
          uStack_1b8 = param_4;
          func_0x0080a7a0();
          func_0x0080c340();
          uStack_24c = _DAT_012c856c;
          iStack_248 = 0;
          uStack_244 = param_3;
          puStack_240 = (undefined *)CONCAT31(puStack_240._1_3_,0xff);
          func_0x0080a7b0(&uStack_24c);
          iStack_248 = param_1[0x37];
          uStack_24c = 0;
          uStack_244 = CONCAT31(uStack_244._1_3_,0xff);
          func_0x0080d8a0(&stack0xfffffdb0);
          uStack_244 = *puVar1;
          iVar3 = param_1[0x37];
          uVar6 = (**(code **)(*piVar5 + 0x6c))(puStack_240,puStack_240,auStack_228);
          (**(code **)(iStack_248 + 8))(iVar3,uVar6);
          uStack_28 = 0xffffffff;
          func_0x0080c8e0();
          *unaff_FS_OFFSET = iStack_30;
          return 1;
        }
      }
    }
  }
  *unaff_FS_OFFSET = iStack_14;
  return 0;
}


