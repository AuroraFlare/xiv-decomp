===== 0x829650 =====

undefined4 __fastcall FUN_00829650(undefined4 param_1)

{
  func_0x00829600();
  return param_1;
}


===== 0x829730 =====

void __thiscall FUN_00829730(int param_1,undefined4 param_2)

{
  char cVar1;
  int *piVar2;
  undefined4 uVar3;
  int iVar4;
  int iVar5;
  
  func_0x00a20f30(param_2);
  piVar2 = (int *)func_0x00a1ffa0(*(undefined1 *)(*(int *)(param_1 + 0x14) + 3));
  cVar1 = (**(code **)(*piVar2 + 0x1c))();
  if (cVar1 != '\0') {
    uVar3 = (**(code **)(*piVar2 + 0x5c))(0,0x12b7c48,0x12b7810,0);
    iVar4 = func_0x009da6cc(uVar3);
    if ((iVar4 != 0) && (iVar4 != -0x11b4)) {
      iVar5 = func_0x00a20070();
      piVar2 = (int *)(**(code **)(*(int *)(iVar5 + 0xf0) + 0x6c))();
      iVar5 = *piVar2;
      if ((iVar5 != 0) && (*(undefined **)(iVar5 + 4) == &UNK_00766678)) {
        func_0x00662c80(iVar4,iVar5 + 0x68);
      }
    }
  }
  return;
}


===== 0x8297e0 =====

undefined4 __fastcall FUN_008297e0(undefined4 param_1)

{
  func_0x008296e0();
  return param_1;
}


===== 0x776340 =====

void FUN_00776340(void)

{
  return;
}


===== 0x823ce0 =====

int __fastcall FUN_00823ce0(int param_1)

{
  return *(int *)(param_1 + 0x14) + 0x14;
}


===== 0xa20f30 =====

void __fastcall FUN_00a20f30(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = func_0x00a20110(**(undefined4 **)(param_1 + 0x18));
  *(uint *)(param_1 + 0x30) = *(uint *)(param_1 + 0x30) & 0xfffeffff;
  *(undefined4 *)(param_1 + 0x24) = uVar1;
  *(undefined4 *)(param_1 + 0x1c) = 1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  uVar1 = func_0x00a20100();
  *(uint *)(param_1 + 0x30) = *(uint *)(param_1 + 0x30) | 0xffff;
  *(undefined4 *)(param_1 + 0x28) = uVar1;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  uVar1 = func_0x00a20070();
  *(undefined4 *)(param_1 + 0x34) = uVar1;
  return;
}


===== 0xa20f90 =====

void __fastcall FUN_00a20f90(int param_1)

{
  int iVar1;
  uint uVar2;
  float10 fVar3;
  
  *(undefined4 *)(param_1 + 0x2c) = 0;
  if (*(int *)(param_1 + 0x1c) == 1) {
    *(undefined4 *)(param_1 + 0x1c) = 2;
  }
  else {
    func_0x00a20070();
    fVar3 = (float10)func_0x00a1b830();
    iVar1 = func_0x00a1ffc0();
    *(int *)(param_1 + 0x2c) = (int)((double)iVar1 * (double)fVar3);
  }
  uVar2 = *(int *)(param_1 + 0x28) + *(int *)(param_1 + 0x2c);
  if (uVar2 < 0x7fffffff) {
    *(uint *)(param_1 + 0x28) = uVar2;
  }
  return;
}


===== 0xa21000 =====

void __fastcall FUN_00a21000(int param_1)

{
  *(undefined4 *)(param_1 + 0x1c) = 3;
  return;
}


===== 0xa21250 =====

undefined4 FUN_00a21250(void)

{
  return 0;
}


