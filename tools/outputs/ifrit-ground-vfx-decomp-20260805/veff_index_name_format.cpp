===== 0xc06700 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00c06700(void)

{
  undefined4 uVar1;
  
  if ((((_DAT_0136e5f8 == 0) || (*(int *)(_DAT_0136e5f8 + 8) != 0x76696e73)) ||
      (*(int *)(_DAT_0136e5f8 + 0x10) != 5)) || (uVar1 = 4, *(int *)(_DAT_0136e5f8 + 0xc) != 1)) {
    uVar1 = 2;
  }
  return uVar1;
}


===== 0xc06730 =====

undefined4 __thiscall FUN_00c06730(int *param_1,undefined4 param_2,undefined2 *param_3,char param_4)

{
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  *param_3 = (short)param_1[1];
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  return 1;
}


===== 0xc06770 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c06770(int *param_1,undefined4 *param_2,char param_3)

{
  undefined4 uVar1;
  
  if (_DAT_0136e5f8 == 0) {
    *(undefined2 *)(param_1 + 1) = *(undefined2 *)param_2;
    if (param_3 == '\x01') {
      (**(code **)(*param_1 + 0x10))();
    }
  }
  else {
    if (((*(int *)(_DAT_0136e5f8 + 8) == 0x76696e73) && (*(int *)(_DAT_0136e5f8 + 0x10) == 5)) &&
       (*(int *)(_DAT_0136e5f8 + 0xc) == 1)) {
      uVar1 = *param_2;
      if (param_3 == '\x01') {
        uVar1 = FUN_00c06690(uVar1);
      }
      *(short *)(param_1 + 1) = (short)uVar1;
      return;
    }
    *(undefined2 *)(param_1 + 1) = *(undefined2 *)param_2;
    if (param_3 == '\x01') {
      (**(code **)(*param_1 + 0x10))();
      return;
    }
  }
  return;
}


===== 0xc06c80 =====

void __fastcall FUN_00c06c80(int param_1)

{
  *(ushort *)(param_1 + 4) = *(ushort *)(param_1 + 4) << 8 | *(ushort *)(param_1 + 4) >> 8;
  return;
}


===== 0xc06b00 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

char * __fastcall FUN_00c06b00(int param_1)

{
  char *pcVar1;
  char cVar2;
  char *pcVar3;
  int iVar4;
  
  iVar4 = 0;
  if (*(uint *)(_DAT_0136e5f8 + 0xc) < 3) {
    iVar4 = 4;
  }
  pcVar3 = *(char **)(param_1 + 4);
  pcVar1 = pcVar3 + 1;
  do {
    cVar2 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar2 != '\0');
  return pcVar3 + iVar4 + (1 - (int)pcVar1);
}


===== 0xc06b40 =====

undefined4 __thiscall FUN_00c06b40(int *param_1,undefined4 param_2,undefined4 param_3,char param_4)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
    (**(code **)(*param_1 + 0x10))();
  }
  pcVar2 = (char *)param_1[1];
  pcVar3 = pcVar2;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  func_0x009d4600(param_3,pcVar2,pcVar3 + (1 - (int)(pcVar2 + 1)));
  return 1;
}


===== 0xc06b90 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c06b90(int *param_1,int param_2,char param_3)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  int iVar4;
  char acStack_200 [512];
  
  iVar4 = 0;
  if (*(uint *)(_DAT_0136e5f8 + 0xc) < 3) {
    iVar4 = 4;
  }
  if (param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  iVar2 = param_2 + iVar4;
  acStack_200[0] = *(char *)(param_2 + iVar4);
  if (*(char *)(param_2 + iVar4) != '\0') {
    pcVar3 = acStack_200;
    do {
      cVar1 = *(char *)(iVar2 + 1);
      iVar2 = iVar2 + 1;
      pcVar3 = pcVar3 + 1;
      *pcVar3 = cVar1;
    } while (cVar1 != '\0');
  }
  pcVar3 = acStack_200;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  iVar4 = func_0x00416480(pcVar3 + (1 - (int)(acStack_200 + 1)),0x10,0x10,&UNK_010d1368,
                          &UNK_010d13bc,0x17a);
  param_1[1] = iVar4;
  func_0x009d4600(iVar4,acStack_200,pcVar3 + (1 - (int)(acStack_200 + 1)));
  return;
}


===== 0xc06af0 =====

void FUN_00c06af0(void)

{
  return;
}


===== 0xc083c0 =====

undefined4 __thiscall FUN_00c083c0(int param_1,int param_2,char param_3)

{
  undefined4 uVar1;
  int iVar2;
  uint uVar3;
  uint *unaff_FS_OFFSET;
  uint uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_c = *unaff_FS_OFFSET;
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eec447;
  *unaff_FS_OFFSET = (uint)&uStack_c;
  if (*(int *)(param_1 + 8) != 0) {
    *unaff_FS_OFFSET = uStack_c;
    return 0;
  }
  *(int *)(param_1 + 4) = param_2;
  uVar1 = func_0x00416480(param_2 * 4,0x48,0x10,0,0,0);
  *(undefined4 *)(param_1 + 8) = uVar1;
  if ((param_3 == '\x01') && (uVar3 = 0, *(int *)(param_1 + 4) != 0)) {
    do {
      iVar2 = func_0x00416480(8,0x48,0x10,0,0,0);
      uStack_4 = 0;
      if (iVar2 == 0) {
        uVar1 = 0;
      }
      else {
        uVar1 = func_0x00c06a80();
      }
      *(undefined4 *)(*(int *)(param_1 + 8) + uVar3 * 4) = uVar1;
      uVar3 = uVar3 + 1;
      uStack_4 = 0xffffffff;
    } while (uVar3 < *(uint *)(param_1 + 4));
  }
  *unaff_FS_OFFSET = uStack_c;
  return 1;
}


===== 0xc06a20 =====

undefined4 __thiscall FUN_00c06a20(int *param_1,undefined4 param_2,undefined1 *param_3,char param_4)

{
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  *param_3 = (char)param_1[1];
  *(int *)(param_3 + 4) = param_1[2];
  if (param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  return 1;
}


===== 0xc06a60 =====

void __thiscall FUN_00c06a60(int *param_1,undefined1 *param_2,char param_3)

{
  *(undefined1 *)(param_1 + 1) = *param_2;
  param_1[2] = *(int *)(param_2 + 4);
  if (param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  return;
}


===== 0xc069e0 =====

void __fastcall FUN_00c069e0(int param_1)

{
  uint uVar1;
  
  uVar1 = *(uint *)(param_1 + 8);
  *(uint *)(param_1 + 8) =
       (uVar1 & 0xff0000 | uVar1 >> 0x10) >> 8 | (uVar1 & 0xff00 | uVar1 << 0x10) << 8;
  return;
}


===== 0xc03610 =====

undefined4 * __thiscall FUN_00c03610(undefined4 *param_1,byte param_2)

{
  *param_1 = &UNK_010cdfbc;
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


===== 0xc08510 =====

undefined4 * __thiscall FUN_00c08510(undefined4 *param_1,byte param_2)

{
  if ((param_2 & 2) != 0) {
    func_0x009d1c4c(param_1,8,param_1[-1],&UNK_00c06e80);
    if ((param_2 & 1) != 0) {
      func_0x004162c0(param_1 + -1);
    }
    return param_1 + -1;
  }
  *(undefined2 *)(param_1 + 1) = 0xffff;
  *param_1 = &UNK_010cdfbc;
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


===== 0xc06cc0 =====

undefined4 __thiscall FUN_00c06cc0(undefined4 param_1,byte param_2)

{
  func_0x00c06a90();
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


