===== 0x65be50 =====

undefined1 __fastcall FUN_0065be50(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x2b10) == 0) {
    return 0;
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x2b10) + 4);
  if (iVar1 != 0) {
    iVar1 = (**(code **)(**(int **)(iVar1 + 0x40) + 4))();
    if ((*(byte *)(iVar1 + 3) & 0x80) != 0) {
      return *(undefined1 *)(iVar1 + 0x35);
    }
  }
  return 0;
}


===== 0x65c550 =====

undefined1 __fastcall FUN_0065c550(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x2b10) == 0) {
    return 0;
  }
  iVar1 = *(int *)(*(int *)(param_1 + 0x2b10) + 4);
  if (iVar1 != 0) {
    iVar1 = (**(code **)(**(int **)(iVar1 + 0x40) + 4))();
    if ((*(byte *)(iVar1 + 3) & 0x80) != 0) {
      return *(undefined1 *)(iVar1 + 0x3b);
    }
  }
  return 0;
}


