program=ffxivgame-ifrit.exe
image_base=00400000

===== target 00bd3d20 =====
direct_ref=00bd4747 type=UNCONDITIONAL_CALL
direct_ref_count=1
raw_pointer=0108fe0d
raw_pointer_count=1

===== function 00bd453c =====
reasons=direct:00bd3d20
body=[[00bd4010, 00bd4026] [00bd451f, 00bd463a] [00bd4644, 00bd475f]]
completed=true
message=

undefined4 FUN_00bd453c(void)

{
  int iVar1;
  char cVar2;
  undefined4 uVar3;
  int unaff_EBX;
  int iVar4;
  int unaff_EBP;
  undefined4 unaff_ESI;
  int unaff_EDI;
  undefined4 *unaff_FS_OFFSET;
  int in_stack_00000020;
  int iStack00000038;
  int iStack0000003c;
  undefined4 in_stack_00000044;
  int iStack00000050;
  int in_stack_0000006c;
  undefined4 in_stack_00000084;
  
  do {
    FUN_00bac620();
    unaff_EBX = unaff_EBX + 0x1c;
  } while (unaff_EBX != in_stack_0000006c);
  iStack00000050 = *(int *)(unaff_EDI + 0x44);
  if (iStack00000050 < 1) {
    in_stack_00000044 = 0;
  }
  else {
    iStack00000038 = in_stack_00000020;
    iStack0000003c = 0;
    do {
      iVar1 = *(int *)(unaff_EDI + 0x40);
      FUN_00bd2550();
      FUN_00bac670(iStack00000038,iVar1 + iStack0000003c);
      iStack00000038 = iStack00000038 + 0x34;
      iStack0000003c = iStack0000003c + 0x38;
      iStack00000050 = iStack00000050 + -1;
    } while (iStack00000050 != 0);
  }
  if (0 < *(int *)(unaff_EDI + 0x4c)) {
    iVar4 = *(int *)(unaff_EDI + 0x48);
    iVar1 = iVar4 + *(int *)(unaff_EDI + 0x4c) * 0x48;
    for (; iVar4 != iVar1; iVar4 = iVar4 + 0x48) {
      cVar2 = func_0x00bac6f0();
      if (cVar2 == '\0') {
        func_0x00415c90();
        func_0x004160e0();
        func_0x004162c0();
        *unaff_FS_OFFSET = in_stack_00000084;
        return 0;
      }
    }
  }
  if (*(int **)(unaff_EBP + 8) == (int *)0x0) {
    uVar3 = *(undefined4 *)(*(int *)(unaff_EBP + 0x10) + 0x10c);
  }
  else {
    uVar3 = (**(code **)(**(int **)(unaff_EBP + 8) + 0x14))();
  }
  FUN_00bd3d20(*(undefined4 *)(unaff_EBP + 0x10),*(undefined4 *)(unaff_EBP + 0xc),uVar3);
  *unaff_FS_OFFSET = in_stack_00000044;
  return unaff_ESI;
}


