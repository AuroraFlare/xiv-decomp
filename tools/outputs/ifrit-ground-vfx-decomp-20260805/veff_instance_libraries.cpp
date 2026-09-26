===== 0xc08480 =====

undefined4 __thiscall FUN_00c08480(undefined4 param_1,byte param_2)

{
  func_0x00c06ce0();
  if ((param_2 & 1) != 0) {
    func_0x004162c0(param_1);
  }
  return param_1;
}


===== 0xc08210 =====

/* WARNING: Removing unreachable block (ram,0x00c0828a) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __thiscall FUN_00c08210(int param_1,int param_2)

{
  int iVar1;
  int *piVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  
  uVar3 = param_2 + 4;
  uVar5 = 0;
  if (*(int *)(param_1 + 4) == 0) {
    return 4;
  }
  if (*(int *)(param_1 + 4) != 0) goto LAB_00c0823c;
  piVar2 = (int *)0x0;
  while( true ) {
    uVar4 = -(uint)(param_2 != 0) & uVar3;
    (**(code **)(*piVar2 + 4))(uVar4);
    if (uVar5 < *(uint *)(param_1 + 4)) {
      piVar2 = *(int **)(*(int *)(param_1 + 8) + uVar5 * 4);
    }
    else {
      piVar2 = (int *)0x0;
    }
    iVar1 = (**(code **)(*piVar2 + 4))(uVar4);
    uVar3 = uVar3 + iVar1;
    if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
      if ((uVar3 & 3) == 0) {
        iVar1 = 0;
      }
      else {
        iVar1 = 4 - (uVar3 & 3);
      }
      uVar3 = uVar3 + iVar1;
    }
    uVar5 = uVar5 + 1;
    if (*(uint *)(param_1 + 4) <= uVar5) break;
LAB_00c0823c:
    piVar2 = *(int **)(*(int *)(param_1 + 8) + uVar5 * 4);
  }
  return 4;
}


===== 0xc06d90 =====

undefined4 __thiscall FUN_00c06d90(int *param_1,int param_2,int *param_3,undefined4 param_4)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  
  if ((char)param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  param_2 = param_2 + 4;
  *param_3 = param_1[1];
  iVar6 = 4;
  if ((char)param_4 != '\0') {
    (**(code **)(*param_1 + 0x10))();
  }
  uVar7 = 0;
  uVar3 = 0;
  if (param_1[1] != 0) {
    if (param_1[1] != 0) goto LAB_00c06dde;
    piVar4 = (int *)0x0;
    while( true ) {
      (**(code **)(*piVar4 + 8))(param_2,(int)param_3 + iVar6,param_4);
      if (uVar7 < (uint)param_1[1]) {
        piVar4 = *(int **)(param_1[2] + uVar7 * 4);
      }
      else {
        piVar4 = (int *)0x0;
      }
      iVar1 = (**(code **)(*piVar4 + 4))(0);
      if (uVar7 < (uint)param_1[1]) {
        piVar4 = *(int **)(param_1[2] + uVar7 * 4);
      }
      else {
        piVar4 = (int *)0x0;
      }
      iVar2 = (**(code **)(*piVar4 + 4))(0);
      uVar3 = iVar6 + iVar1 & 0x80000003;
      if ((int)uVar3 < 0) {
        uVar3 = (uVar3 - 1 | 0xfffffffc) + 1;
      }
      if (uVar3 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = 4 - uVar3;
      }
      iVar6 = iVar6 + iVar1 + iVar5;
      uVar3 = param_2 + iVar2 & 3;
      if (uVar3 == 0) {
        iVar1 = 0;
      }
      else {
        iVar1 = 4 - uVar3;
      }
      param_2 = param_2 + iVar2 + iVar1;
      uVar3 = param_1[1];
      uVar7 = uVar7 + 1;
      if (uVar3 <= uVar7) break;
LAB_00c06dde:
      piVar4 = *(int **)(param_1[2] + uVar7 * 4);
    }
  }
  return CONCAT31((int3)(uVar3 >> 8),1);
}


===== 0xc082d0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00c082d0(int *param_1,int *param_2,char param_3)

{
  int iVar1;
  int *piVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  undefined4 unaff_retaddr;
  
  uVar5 = 0;
  param_1[1] = *param_2;
  param_1[2] = 0;
  if (param_3 == '\x01') {
    (**(code **)(*param_1 + 0x10))();
  }
  uVar4 = 4;
  if (param_1[1] != 0) {
    (**(code **)(*param_1 + 0x14))(param_1[1],1);
    if (param_1[1] != 0) {
      do {
        (**(code **)(**(int **)(param_1[2] + uVar5 * 4) + 0xc))((int)param_2 + uVar4,unaff_retaddr);
        if (uVar5 < (uint)param_1[1]) {
          piVar2 = *(int **)(param_1[2] + uVar5 * 4);
        }
        else {
          piVar2 = (int *)0x0;
        }
        iVar1 = (**(code **)(*piVar2 + 4))(0);
        uVar4 = uVar4 + iVar1;
        if (2 < *(uint *)(_DAT_0136e5f8 + 0xc)) {
          uVar3 = uVar4 & 0x80000003;
          if ((int)uVar3 < 0) {
            uVar3 = (uVar3 - 1 | 0xfffffffc) + 1;
          }
          if (uVar3 == 0) {
            iVar1 = 0;
          }
          else {
            iVar1 = 4 - uVar3;
          }
          uVar4 = uVar4 + iVar1;
        }
        uVar5 = uVar5 + 1;
      } while (uVar5 < (uint)param_1[1]);
    }
  }
  return;
}


===== 0xc06d70 =====

void __fastcall FUN_00c06d70(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = func_0x00c06690(*(undefined4 *)(param_1 + 4));
  *(undefined4 *)(param_1 + 4) = uVar1;
  return;
}


===== 0xc08570 =====

undefined4 __thiscall FUN_00c08570(int param_1,int param_2,char param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int iVar4;
  uint uVar5;
  
  if (*(int *)(param_1 + 8) == 0) {
    *(int *)(param_1 + 4) = param_2;
    uVar1 = func_0x00416480(param_2 * 4,0x48,0x10,0,0,0);
    *(undefined4 *)(param_1 + 8) = uVar1;
    if ((param_3 == '\x01') && (uVar5 = 0, *(int *)(param_1 + 4) != 0)) {
      do {
        puVar2 = (undefined4 *)func_0x00416480(0x60,0x48,0x10,0,0,0);
        if (puVar2 == (undefined4 *)0x0) {
          puVar2 = (undefined4 *)0x0;
        }
        else {
          *puVar2 = &UNK_010d1588;
          puVar2[0x16] = &UNK_010d14f0;
          *(undefined2 *)(puVar2 + 0x17) = 0xffff;
          puVar3 = puVar2 + 4;
          iVar4 = 3;
          do {
            puVar3[-3] = 0;
            *puVar3 = 0;
            puVar3[3] = 0;
            puVar3[6] = 0;
            puVar3[9] = 0;
            puVar3[0xc] = 0;
            puVar3[0xf] = 0;
            puVar3 = puVar3 + 1;
            iVar4 = iVar4 + -1;
          } while (iVar4 != 0);
        }
        *(undefined4 **)(*(int *)(param_1 + 8) + uVar5 * 4) = puVar2;
        uVar5 = uVar5 + 1;
      } while (uVar5 < *(uint *)(param_1 + 4));
    }
    return 1;
  }
  return 0;
}


===== 0xc08640 =====

undefined4 __thiscall FUN_00c08640(int param_1,int param_2,char param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  uint uVar3;
  
  if (*(int *)(param_1 + 8) == 0) {
    *(int *)(param_1 + 4) = param_2;
    uVar1 = func_0x00416480(param_2 * 4,0x48,0x10,0,0,0);
    *(undefined4 *)(param_1 + 8) = uVar1;
    if ((param_3 == '\x01') && (uVar3 = 0, *(int *)(param_1 + 4) != 0)) {
      do {
        puVar2 = (undefined4 *)func_0x00416480(0x2c,0x48,0x10,0,0,0);
        if (puVar2 == (undefined4 *)0x0) {
          puVar2 = (undefined4 *)0x0;
        }
        else {
          *puVar2 = &UNK_010d140c;
          puVar2[2] = &UNK_010d14f0;
          *(undefined2 *)(puVar2 + 3) = 0xffff;
          puVar2[1] = 0;
          puVar2[7] = 0;
          puVar2[8] = 0;
          puVar2[9] = 0;
          puVar2[10] = 0;
          puVar2[5] = 0;
          puVar2[6] = 0;
        }
        *(undefined4 **)(*(int *)(param_1 + 8) + uVar3 * 4) = puVar2;
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(param_1 + 4));
    }
    return 1;
  }
  return 0;
}


===== 0xc086e0 =====

undefined4 __thiscall FUN_00c086e0(int param_1,int param_2,char param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  uint uVar3;
  
  if (*(int *)(param_1 + 8) == 0) {
    *(int *)(param_1 + 4) = param_2;
    uVar1 = func_0x00416480(param_2 * 4,0x48,0x10,0,0,0);
    *(undefined4 *)(param_1 + 8) = uVar1;
    if ((param_3 == '\x01') && (uVar3 = 0, *(int *)(param_1 + 4) != 0)) {
      do {
        puVar2 = (undefined4 *)func_0x00416480(0x18,0x48,0x10,0,0,0);
        if (puVar2 == (undefined4 *)0x0) {
          puVar2 = (undefined4 *)0x0;
        }
        else {
          *puVar2 = &UNK_010d14bc;
          puVar2[2] = &UNK_010d14f0;
          *(undefined2 *)(puVar2 + 3) = 0xffff;
          puVar2[1] = 0;
          puVar2[5] = 0;
        }
        *(undefined4 **)(*(int *)(param_1 + 8) + uVar3 * 4) = puVar2;
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(param_1 + 4));
    }
    return 1;
  }
  return 0;
}


===== 0xc077c0 =====

int __thiscall FUN_00c077c0(int param_1,undefined4 param_2)

{
  int iVar1;
  
  iVar1 = 0;
  switch(param_2) {
  case 1:
    return param_1 + 0x90;
  case 2:
    return param_1 + 0x9c;
  case 3:
    return param_1 + 0xa8;
  case 4:
    return param_1 + 0xb4;
  case 5:
    return param_1 + 0xc0;
  case 6:
    return param_1 + 0xcc;
  case 7:
    return param_1 + 0xd8;
  case 8:
    return param_1 + 0xe4;
  case 9:
    return param_1 + 0xf0;
  case 10:
    return param_1 + 0xfc;
  case 0xb:
    return param_1 + 0x108;
  case 0xc:
    return param_1 + 0x114;
  case 0xd:
    return param_1 + 0x120;
  case 0xe:
    iVar1 = param_1 + 300;
  }
  return iVar1;
}


===== 0xc08770 =====

undefined4 FUN_00c08770(void)

{
  return 0x130788c;
}


===== 0xc07890 =====

uint __thiscall FUN_00c07890(int param_1,int param_2)

{
  uint uVar1;
  
  uVar1 = *(uint *)(param_1 + 0xc);
  if (((uVar1 == *(uint *)(param_2 + 8)) &&
      (uVar1 = *(uint *)(param_1 + 0x10), uVar1 == *(uint *)(param_2 + 0xc))) &&
     ((uVar1 != 1 || (4 < *(uint *)(param_2 + 0x10))))) {
    return CONCAT31((int3)(uVar1 >> 8),1);
  }
  return uVar1 & 0xffffff00;
}


===== 0xc0ea60 =====

int __fastcall FUN_00c0ea60(int param_1)

{
  return param_1 + 0x18;
}


===== 0xc07fd0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00c07fd0(int *param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  uint uVar8;
  int *unaff_EBP;
  int iVar9;
  int *piVar10;
  uint uVar11;
  undefined4 *unaff_FS_OFFSET;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eec424;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  iVar7 = 0;
  piVar1 = (int *)(**(code **)(*param_1 + 8))();
  iVar2 = *piVar1;
  iVar9 = 0;
  if (iVar2 != 0xff) {
    piVar10 = param_1 + 0x15;
    do {
      iVar2 = (**(code **)(*param_1 + 4))(iVar2);
      iVar2 = *(int *)(iVar2 + 4);
      *piVar10 = iVar7;
      iVar9 = iVar9 + 1;
      piVar10[-0xe] = iVar2;
      iVar7 = iVar7 + iVar2;
      iVar2 = piVar1[iVar9];
      piVar10 = piVar10 + 1;
    } while (iVar2 != 0xff);
  }
  if (param_1[0x23] != 0) {
    func_0x004162c0(param_1[0x23]);
  }
  param_1[0x23] = 0;
  iVar2 = func_0x00416480(iVar7 * 4,0x48,0x10,0,0,0);
  param_1[0x23] = iVar2;
  uStack_4 = 1;
  iVar2 = (*_DAT_010d1028)(0);
  puStack_8 = (undefined *)((uint)puStack_8 & 0xffffff00);
  iVar7 = (**(code **)(param_1[6] + 4))(0);
  iVar9 = func_0x00c06940(0);
  uVar8 = iVar7 + iVar9;
  if ((uVar8 & 3) != 0) {
    func_0x00415c90(100);
    func_0x00415a00();
    if ((_DAT_01323910 & 1) == 0) {
      _DAT_01323910 = _DAT_01323910 | 1;
      _DAT_0132390c = (code *)&UNK_00c07da0;
    }
    (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010d1488,0x2ca,&UNK_010d1628);
  }
  iVar7 = 0;
  iVar9 = 0;
  if (*unaff_EBP != 0xff) {
    piVar1 = unaff_EBP;
    do {
      uVar11 = 0;
      iVar3 = (**(code **)(*param_1 + 4))(*piVar1);
      uVar8 = uVar8 + iVar2 + 4;
      if (*(int *)(iVar3 + 4) != 0) {
        if (*(int *)(iVar3 + 4) != 0) goto LAB_00c08183;
        piVar1 = (int *)0x0;
        while( true ) {
          *(uint *)(param_1[0x23] + iVar7 * 4) = uVar8;
          iVar4 = (**(code **)(*piVar1 + 4))(0);
          uVar6 = uVar8 + iVar4 & 3;
          if (uVar6 == 0) {
            iVar5 = 0;
          }
          else {
            iVar5 = 4 - uVar6;
          }
          iVar7 = iVar7 + 1;
          uVar8 = uVar8 + iVar4 + iVar5;
          uVar11 = uVar11 + 1;
          if (*(uint *)(iVar3 + 4) <= uVar11) break;
LAB_00c08183:
          piVar1 = *(int **)(*(int *)(iVar3 + 8) + uVar11 * 4);
        }
      }
      iVar9 = iVar9 + 1;
      piVar1 = unaff_EBP + iVar9;
    } while (unaff_EBP[iVar9] != 0xff);
  }
  *unaff_FS_OFFSET = 0;
  return;
}


===== 0xc06690 =====

uint FUN_00c06690(uint param_1)

{
  return (param_1 & 0xff00 | param_1 << 0x10) << 8 | (param_1 & 0xff0000 | param_1 >> 0x10) >> 8;
}


===== 0xc066c0 =====

float10 FUN_00c066c0(uint param_1)

{
  return (float10)(float)((param_1 & 0xff0000 | param_1 >> 0x10) >> 8 |
                         (param_1 & 0xff00 | param_1 << 0x10) << 8);
}


===== 0xc06940 =====

undefined4 FUN_00c06940(void)

{
  return 0x10;
}


===== 0xc06a10 =====

undefined4 FUN_00c06a10(void)

{
  return 8;
}


