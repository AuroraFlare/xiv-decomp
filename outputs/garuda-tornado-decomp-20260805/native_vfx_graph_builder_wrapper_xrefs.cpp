program=ffxivgame-ifrit.exe
image_base=00400000

===== target 00bac670 =====
direct_ref=00bd17bf type=UNCONDITIONAL_CALL
direct_ref=00bd45f3 type=UNCONDITIONAL_CALL
direct_ref_count=2
raw_pointer_count=0

===== function 00bd175d =====
reasons=direct:00bac670
body=[[00bd1741, 00bd1770] [00bd1775, 00bd17f7]]
completed=true
message=

undefined4 FUN_00bd175d(void)

{
  int iVar1;
  undefined4 uVar2;
  int unaff_EBP;
  undefined4 *unaff_FS_OFFSET;
  undefined4 in_stack_00000010;
  undefined4 in_stack_00000030;
  undefined4 in_stack_00000034;
  undefined4 in_stack_0000003c;
  undefined4 in_stack_00000040;
  int in_stack_0000004c;
  undefined4 in_stack_00000050;
  undefined4 in_stack_00000054;
  undefined4 in_stack_0000007c;
  undefined4 in_stack_00000084;
  undefined4 *puVar3;
  
  do {
    FUN_00bac620();
    uVar2 = in_stack_0000007c;
    unaff_EBP = unaff_EBP + -1;
  } while (unaff_EBP != 0);
  in_stack_0000003c = 0;
  in_stack_00000084 = 0;
  FUN_00bd30e0();
  iVar1 = in_stack_0000004c;
  puVar3 = &stack0x00000084;
  FUN_00bac670(in_stack_0000004c,in_stack_00000040,uVar2,&stack0x0000003c,0,0,puVar3,0,0);
  *(undefined1 *)(iVar1 + 8) = 0;
  puVar3[4] = iVar1;
  puVar3[1] = in_stack_00000010;
  *(undefined1 *)(puVar3 + 3) = 0;
  puVar3[2] = in_stack_00000030;
  *unaff_FS_OFFSET = in_stack_00000034;
  return 1;
}



===== function 00bd453c =====
reasons=direct:00bac670
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
  func_0x00bd3d20(*(undefined4 *)(unaff_EBP + 0x10),*(undefined4 *)(unaff_EBP + 0xc),uVar3);
  *unaff_FS_OFFSET = in_stack_00000044;
  return unaff_ESI;
}


