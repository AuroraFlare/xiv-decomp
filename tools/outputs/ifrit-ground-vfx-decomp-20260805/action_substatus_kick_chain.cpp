===== 0x662c80 =====

void FUN_00662c80(int *param_1,undefined4 param_2)

{
  int iVar1;
  
  if (param_1 != (int *)0x0) {
    iVar1 = (**(code **)(*param_1 + 0x268))();
    if (iVar1 == 0) {
      func_0x0065a9e0(param_2,1);
    }
  }
  return;
}


===== 0xa1ffa0 =====

undefined4 __thiscall FUN_00a1ffa0(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(*(int *)(param_1 + 0xc) + 0x70);
  iVar2 = *(int *)(iVar1 + 0x10);
  if (((iVar2 != 0) && (-1 < param_2)) && (param_2 < iVar2)) {
    return *(undefined4 *)(*(int *)(iVar1 + 8) + param_2 * 4);
  }
  return 0;
}


===== 0xa20070 =====

undefined4 __fastcall FUN_00a20070(int param_1)

{
  return *(undefined4 *)(param_1 + 0xc);
}


===== 0x9da6cc =====

uint FUN_009da6cc(void)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int unaff_EBP;
  
  func_0x009de4f0(&UNK_0122d138,0x18);
  piVar1 = *(int **)(unaff_EBP + 8);
  if (piVar1 != (int *)0x0) {
    *(undefined4 *)(unaff_EBP + -4) = 0;
    iVar3 = func_0x009da3cc();
    uVar2 = *(uint *)(*(int *)(*(int *)(*piVar1 + -4) + 0x10) + 4);
    if ((uVar2 & 1) == 0) {
      iVar4 = func_0x009da3e2(*(undefined4 *)(unaff_EBP + 0x10));
    }
    else if ((uVar2 & 2) == 0) {
      iVar4 = func_0x009da476();
    }
    else {
      iVar4 = func_0x009da578(iVar3,*(undefined4 *)(unaff_EBP + 0x10),
                              (int)piVar1 + (-iVar3 - *(int *)(unaff_EBP + 0xc)),
                              *(undefined4 *)(unaff_EBP + 0x14));
    }
    if (iVar4 == 0) {
      *(undefined4 *)(unaff_EBP + -0x1c) = 0;
      if (*(int *)(unaff_EBP + 0x18) != 0) {
        func_0x009d19bb(&UNK_0108627c);
        func_0x009d1b9f(unaff_EBP + -0x28,&UNK_011b31f8);
        return (uint)(*(int *)**(undefined4 **)(unaff_EBP + -0x14) == -0x3ffffffb);
      }
    }
    else {
      iVar4 = func_0x009da457(iVar3);
      *(int *)(unaff_EBP + -0x1c) = iVar4 + iVar3;
    }
    *(undefined4 *)(unaff_EBP + -4) = 0xfffffffe;
  }
  uVar2 = func_0x009de535();
  return uVar2;
}


===== 0x766678 =====

undefined4 __thiscall FUN_00766678(char param_1)

{
  char cVar1;
  char *in_EAX;
  int unaff_EBP;
  int unaff_ESI;
  int unaff_EDI;
  undefined4 *unaff_FS_OFFSET;
  undefined4 in_stack_0000002c;
  undefined4 in_stack_00000084;
  undefined4 in_stack_0000008c;
  
  *in_EAX = *in_EAX + (char)in_EAX;
  *in_EAX = *in_EAX + (char)in_EAX;
  *(char *)(unaff_EBP + 0x5130244c) = *(char *)(unaff_EBP + 0x5130244c) + param_1;
  cVar1 = func_0x00712bb0(unaff_EDI + 0xac);
  func_0x00446f50();
  if (cVar1 != '\0') {
    *(undefined4 *)(unaff_ESI + 0x16c) = 8;
    if (*(int *)(unaff_EDI + 0x134) != 0) {
      cVar1 = func_0x00765410();
      if (cVar1 == '\0') {
        *(undefined4 *)(unaff_ESI + 0x16c) = in_stack_0000002c;
        goto LAB_00766765;
      }
    }
    if (unaff_EDI != unaff_ESI + 0x30) {
      *(int *)(unaff_ESI + 0x2c) = unaff_EDI;
      func_0x00cc76f0(unaff_EDI + 0xac);
      *unaff_FS_OFFSET = in_stack_00000084;
      return 1;
    }
  }
LAB_00766765:
  *unaff_FS_OFFSET = in_stack_0000008c;
  return 0;
}


