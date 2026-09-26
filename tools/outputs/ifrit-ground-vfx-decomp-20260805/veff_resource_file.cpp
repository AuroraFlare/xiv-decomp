===== 0xc05e20 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int __fastcall FUN_00c05e20(int *param_1)

{
  uint uVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  uint *unaff_FS_OFFSET;
  int *unaff_retaddr;
  int iVar6;
  uint uStack_c;
  undefined *puStack_8;
  int iStack_4;
  
  puStack_8 = &UNK_00eec310;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = (uint)&uStack_c;
  iStack_4 = 0;
  iVar2 = func_0x00c06940(0);
  if (unaff_retaddr == (int *)0x0) {
    unaff_retaddr = (int *)(**(code **)(*(int *)param_1[1] + 8))();
  }
  _DAT_0136e5f8 = param_1[1] + 4;
  (**(code **)(*(int *)param_1[1] + 0x14))();
  piVar3 = (int *)(**(code **)(*(int *)param_1[1] + 0x10))();
  iVar4 = (**(code **)(*piVar3 + 4))(0);
  iVar2 = iVar2 + iVar4;
  iVar4 = *unaff_retaddr;
  iVar6 = 0;
  while (iVar4 != 0xff) {
    uVar1 = uStack_c >> 8;
    uStack_c = CONCAT31((int3)uVar1,1);
    piVar3 = (int *)(**(code **)(*(int *)param_1[1] + 4))(*unaff_retaddr);
    if (piVar3 != (int *)0x0) {
      iVar4 = func_0x00c06a10(0);
      iVar5 = (**(code **)(*piVar3 + 4))(iVar2 + iVar4);
      iVar2 = iVar2 + iVar4 + iVar5;
    }
    iVar6 = iVar6 + 1;
    iVar4 = *(int *)(iStack_4 + iVar6 * 4);
    unaff_retaddr = (int *)(iStack_4 + iVar6 * 4);
    uStack_c = uStack_c & 0xffffff00;
  }
  (**(code **)(*param_1 + 0x18))(iVar2);
  *unaff_FS_OFFSET = 0;
  return iVar2;
}


===== 0xc05ca0 =====

undefined4 __fastcall FUN_00c05ca0(int *param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 unaff_retaddr;
  
  (**(code **)(*param_1 + 0x20))(0);
  uVar1 = (**(code **)(*param_1 + 0x10))();
  uVar2 = func_0x00416480(uVar1,0x10,0x10,&UNK_010d11d0,&UNK_010d1220,0x65);
  func_0x009d2110(uVar2,0,uVar1);
  (**(code **)(*param_1 + 0x28))(uVar2,unaff_retaddr,0);
  return uVar2;
}


===== 0xc05d00 =====

undefined4 __thiscall FUN_00c05d00(int *param_1,undefined4 param_2,int param_3,int param_4)

{
  if (param_1[1] == 0) {
    return 0;
  }
  if (param_4 == 0) {
    param_4 = (**(code **)(*(int *)param_1[1] + 8))();
  }
  (**(code **)(*param_1 + 0x3c))(param_2,param_4,param_3 != 1);
  return 1;
}


===== 0xc05d40 =====

uint __thiscall FUN_00c05d40(int *param_1,int param_2,undefined4 param_3,int param_4)

{
  uint in_EAX;
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 unaff_ESI;
  
  if (param_1[1] != 0) {
    iVar1 = param_4;
    if (param_4 == 0) {
      iVar1 = (**(code **)(*(int *)param_1[1] + 8))();
    }
    param_4 = 0;
    in_EAX = func_0x009d6b65(&param_4,param_2,&UNK_010671a0);
    if (param_4 != 0) {
      (**(code **)(*param_1 + 0x20))(iVar1);
      uVar2 = (**(code **)(*param_1 + 0x10))(0x10,0x10,&UNK_010d1240,&UNK_010d1220,0x8d);
      uVar2 = func_0x00416480(uVar2);
      (**(code **)(*param_1 + 0x3c))(uVar2,iVar1,param_2 != 1);
      uVar3 = (**(code **)(*param_1 + 0x10))(1,unaff_ESI);
      func_0x009d739a(uVar2,uVar3);
      func_0x009d2646(unaff_ESI);
      in_EAX = func_0x004162c0(uVar2);
    }
  }
  return in_EAX & 0xffffff00;
}


===== 0xc064c0 =====

int * __fastcall FUN_00c064c0(int *param_1)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined1 *puVar4;
  int iVar5;
  undefined4 uVar6;
  int *piVar7;
  undefined4 unaff_EBX;
  undefined4 unaff_EBP;
  uint unaff_ESI;
  undefined1 *unaff_EDI;
  undefined4 *unaff_FS_OFFSET;
  int aiStack_40 [2];
  uint uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_c;
  char *pcStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  pcStack_8 = &UNK_00eec380;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  aiStack_40[1] = 0xffffffff;
  aiStack_40[0] = 0;
  uStack_24 = uStack_24 & 0xffffff00;
  func_0x00404040(0x1307360);
  pcVar2 = pcStack_8;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  iVar3 = (int)pcVar2 - (int)(pcStack_8 + 1);
  func_0x00451870(pcStack_8,iVar3);
  aiStack_40[0] = 0;
  puVar4 = unaff_EDI;
  if (uStack_24 < 0x10) {
    puVar4 = &stack0xffffffc8;
  }
  func_0x009d6b65(aiStack_40,puVar4,&UNK_00f80740);
  if (aiStack_40[0] == 0) {
    if (0xf < uStack_24) {
      func_0x009d1b17(unaff_EDI);
    }
    *unaff_FS_OFFSET = uStack_20;
    return (int *)0x0;
  }
  func_0x009d6f47(aiStack_40[0],0,0);
  func_0x009d6f47(aiStack_40[0],0,2);
  iVar5 = func_0x009d7c75(aiStack_40[0]);
  param_1[3] = iVar5;
  func_0x009d6f47(aiStack_40[0],0,0);
  iVar5 = func_0x00416480(param_1[3],0x10,0x10,&UNK_010d1308,&UNK_010d1220,0xde);
  param_1[2] = iVar5;
  func_0x009d6947(iVar5,param_1[3],1,aiStack_40[0]);
  uVar6 = func_0x00416480(param_1[3],0x10,0x10,&UNK_010d1308,&UNK_010d1220,0xe3);
  iVar5 = param_1[3];
  func_0x009d4600(uVar6,param_1[2],iVar5);
  piVar7 = (int *)(**(code **)(*param_1 + 0x34))(param_1[2],param_1[3],uStack_c,pcStack_8);
  if (piVar7 != (int *)0x0) {
    (**(code **)(*piVar7 + 0x14))(uVar6);
    (**(code **)(*piVar7 + 0x18))(iVar5);
  }
  func_0x009d2646(unaff_EBP);
  if (0xf < unaff_ESI) {
    func_0x009d1b17(iVar3);
  }
  *unaff_FS_OFFSET = unaff_EBX;
  return piVar7;
}


===== 0xc05f70 =====

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


===== 0xc06070 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __thiscall FUN_00c06070(int param_1,undefined4 param_2,int param_3,int param_4)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int unaff_ESI;
  undefined4 *unaff_FS_OFFSET;
  int unaff_retaddr;
  undefined1 *puVar6;
  undefined1 auStack_30 [4];
  undefined1 auStack_2c [4];
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined *puStack_20;
  undefined4 uStack_1c;
  int iStack_18;
  undefined4 uStack_14;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined *puStack_8;
  uint uStack_4;
  
  puStack_8 = &UNK_00eec354;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  puStack_20 = &UNK_010ce1d0;
  uStack_1c = 0;
  iStack_18 = 0;
  uStack_14 = 0;
  uStack_10 = 0;
  uStack_4 = 0;
  func_0x00c069b0(param_3,CONCAT31((int3)((uint)uStack_c >> 8),param_4 == 1));
  iVar3 = func_0x00c06940(0);
  uVar1 = uStack_4 >> 8;
  uStack_4 = uStack_4 & 0xffffff00;
  if (unaff_ESI != unaff_retaddr) {
    uStack_4 = CONCAT31((int3)uVar1,1);
  }
  puVar6 = auStack_2c;
  cVar2 = (**(code **)(**(int **)(param_1 + 4) + 0xc))(puVar6);
  if (cVar2 == '\0') {
    *unaff_FS_OFFSET = uStack_1c;
    return 0xffffffff;
  }
  _DAT_0136e5f8 = auStack_30;
  piVar4 = (int *)(**(code **)(**(int **)(param_1 + 4) + 0x10))();
  (**(code **)(*piVar4 + 0xc))(iVar3 + param_3,puStack_8);
  piVar4 = (int *)(**(code **)(**(int **)(param_1 + 4) + 0x10))();
  iVar5 = (**(code **)(*piVar4 + 4))(0);
  iVar3 = iVar3 + iVar5;
  puStack_20 = (undefined *)CONCAT31(puStack_20._1_3_,1);
  if (iStack_18 != iVar3) {
    do {
      func_0x00c06a60(iVar3 + param_3,uStack_14);
      iVar5 = func_0x00c06a10(0);
      iVar3 = iVar3 + iVar5;
      piVar4 = (int *)(**(code **)(**(int **)(param_1 + 4) + 4))((uint)puVar6 & 0xff);
      if (piVar4 == (int *)0x0) {
        func_0x009f6efb(&UNK_010d12e4);
      }
      else {
        (**(code **)(*piVar4 + 0xc))(iVar3 + param_3,uStack_24);
      }
    } while (iStack_18 != iVar3);
  }
  _DAT_0136e5f8 = (undefined1 *)0x0;
  *unaff_FS_OFFSET = uStack_28;
  return 1;
}


===== 0xc06210 =====

undefined4 __thiscall FUN_00c06210(int *param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  undefined4 *unaff_FS_OFFSET;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  int iStack_1c;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eec36e;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  uVar2 = (**(code **)(*param_1 + 0x10))();
  func_0x009d2110(param_2,0,uVar2);
  piVar1 = *(int **)(param_1[1] + 0xc);
  uStack_4 = 0;
  func_0x00c06950(0,param_2,param_4);
  iVar3 = func_0x00c06940(0);
  (**(code **)(*(int *)param_1[1] + 0x14))();
  piVar4 = (int *)(**(code **)(*(int *)param_1[1] + 0x10))();
  (**(code **)(*piVar4 + 8))(iVar3,iVar3 + param_2,uStack_4);
  iVar5 = (**(code **)(*piVar4 + 4))(0);
  iVar3 = iVar3 + iVar5;
  iVar5 = *piVar1;
  iStack_1c = 0;
  piVar4 = piVar1;
  while (iVar5 != 0xff) {
    piVar4 = (int *)(**(code **)(*(int *)param_1[1] + 4))(*piVar4);
    if (piVar4 != (int *)0x0) {
      (**(code **)(*piVar4 + 4))(0);
      func_0x00c06a20(iVar3,iVar3 + param_2,piVar1);
      iVar5 = func_0x00c06a10(0);
      iVar3 = iVar3 + iVar5;
      (**(code **)(*piVar4 + 8))(iVar3,iVar3 + param_2,uStack_28);
      iVar5 = (**(code **)(*piVar4 + 4))(0);
      iVar3 = iVar3 + iVar5;
    }
    iStack_1c = iStack_1c + 1;
    piVar4 = piVar1 + iStack_1c;
    iVar5 = piVar1[iStack_1c];
  }
  *unaff_FS_OFFSET = uStack_2c;
  return CONCAT31((int3)((uint)piVar4 >> 8),1);
}


===== 0xc05e00 =====

undefined4 __thiscall FUN_00c05e00(int param_1,undefined4 param_2,undefined4 param_3)

{
  (**(code **)(*(int *)(*(int *)(param_1 + 4) + 4) + 8))(0,param_2,param_3);
  return 1;
}


===== 0xbe3140 =====

undefined4 __thiscall FUN_00be3140(undefined4 param_1,byte param_2)

{
  func_0x00be30d0();
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


===== 0x8d5570 =====

undefined4 __fastcall FUN_008d5570(int param_1)

{
  return *(undefined4 *)(param_1 + 4);
}


===== 0xa29a90 =====

void __thiscall FUN_00a29a90(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 4) = param_2;
  return;
}


===== 0x7143e0 =====

undefined4 __fastcall FUN_007143e0(int param_1)

{
  return *(undefined4 *)(param_1 + 8);
}


===== 0xcb1c80 =====

undefined4 __fastcall FUN_00cb1c80(int param_1)

{
  return *(undefined4 *)(param_1 + 0xc);
}


===== 0xb8c710 =====

void __thiscall FUN_00b8c710(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 8) = param_2;
  return;
}


===== 0x8d54c0 =====

void __thiscall FUN_008d54c0(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 0xc) = param_2;
  return;
}


===== 0xa29aa0 =====

undefined4 __fastcall FUN_00a29aa0(int param_1)

{
  return *(undefined4 *)(param_1 + 0x10);
}


