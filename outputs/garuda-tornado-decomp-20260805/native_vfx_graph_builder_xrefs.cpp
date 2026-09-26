program=ffxivgame-ifrit.exe
image_base=00400000

===== target 00bd2660 =====
direct_ref=00bac6d9 type=UNCONDITIONAL_CALL
direct_ref_count=1
raw_pointer_count=0

===== target 00be7ce0 =====
direct_ref=00bd295a type=UNCONDITIONAL_CALL
direct_ref=00bd2b0a type=UNCONDITIONAL_CALL
direct_ref_count=2
raw_pointer_count=0

===== target 00be7d50 =====
direct_ref=00bd2998 type=UNCONDITIONAL_CALL
direct_ref=00bd2b48 type=UNCONDITIONAL_CALL
direct_ref_count=2
raw_pointer_count=0

===== function 00bac6d9 =====
reasons=direct:00bd2660
body=[[00bac6d9, 00bac6ee]]
completed=true
message=

void FUN_00bac6d9(undefined4 param_1)

{
  undefined4 *unaff_FS_OFFSET;
  
  FUN_00bd2660();
  *unaff_FS_OFFSET = param_1;
  return;
}



===== function 00bd28b3 =====
reasons=direct:00be7ce0;direct:00be7d50
body=[[00bd28b3, 00bd2bef] [00bd2bfd, 00bd2c09]]
completed=true
message=

/* WARNING: Instruction at (ram,0x00bd28b7) overlaps instruction at (ram,0x00bd28b6)
    */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 __thiscall FUN_00bd28b3(undefined4 param_1)

{
  int *piVar1;
  int *in_EAX;
  int iVar2;
  int iVar3;
  uint uVar4;
  char cVar5;
  ushort *unaff_EBX;
  ushort *puVar6;
  int unaff_EBP;
  int unaff_EDI;
  undefined4 *unaff_FS_OFFSET;
  bool in_ZF;
  ushort *puStack0000000c;
  undefined4 in_stack_00000020;
  undefined4 in_stack_00000024;
  undefined4 in_stack_00000028;
  undefined2 in_stack_0000002c;
  undefined2 in_stack_00000030;
  undefined2 in_stack_00000034;
  undefined4 in_stack_0000003c;
  undefined4 *in_stack_0000004c;
  int in_stack_00000054;
  undefined4 in_stack_00000058;
  int *in_stack_0000005c;
  ushort uStack00000064;
  int *in_stack_00000068;
  int iStack00000074;
  int in_stack_00000078;
  undefined4 in_stack_0000007c;
  int in_stack_00000080;
  
  cVar5 = (char)((uint)param_1 >> 8);
  if (in_ZF) {
    *(int *)((int)in_EAX + 0x3e) = *(int *)((int)in_EAX + 0x3e) + unaff_EBP;
    *in_EAX = *in_EAX + (int)in_EAX;
    piVar1 = in_EAX + 0xe;
    *(char *)piVar1 = (char)*piVar1 + cVar5;
    if ((char)*piVar1 != '\0') goto LAB_00bd28d4;
  }
  else {
    in_EAX = (int *)((int)in_EAX + -1);
  }
  in_EAX[0x12] = in_EAX[0x12] + unaff_EBP;
  *(char *)(in_EAX + 4) = (char)in_EAX[4] + cVar5;
  unaff_EBX = (ushort *)
              CONCAT22((short)((uint)unaff_EBX >> 0x10),
                       CONCAT11((char)((uint)unaff_EBX >> 8) * '\x02',(char)unaff_EBX));
LAB_00bd28d4:
  while( true ) {
    puStack0000000c = (ushort *)0xbd28db;
    iVar2 = FUN_00bac930();
    iVar2 = (uint)*unaff_EBX * 0x30 + iVar2;
    if (*(short *)(iVar2 + 6) == 0) {
      puStack0000000c = (ushort *)&UNK_010c7508;
      func_0x00415c90();
      func_0x004160e0();
      puStack0000000c = (ushort *)0x64;
      func_0x00415c90();
      func_0x00415a00();
      if ((_DAT_01323910 & 1) == 0) {
        _DAT_01323910 = _DAT_01323910 | 1;
        _DAT_0132390c = (code *)&UNK_00bd25b0;
      }
      (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48);
    }
    puStack0000000c = unaff_EBX;
    iVar3 = FUN_00be7ce0();
    in_stack_00000078 = in_stack_00000078 + iVar3;
    unaff_EDI = iVar3 + (unaff_EDI + 0xfU & 0xfffffff0);
    if (*in_stack_0000005c != 0) {
      puStack0000000c = (ushort *)0x0;
      FUN_00be7d50(unaff_EBX,iVar2);
    }
    *in_stack_0000005c = *in_stack_0000005c + 0x28;
    unaff_EBX = unaff_EBX + 6;
    in_stack_00000080 = in_stack_00000080 + -1;
    if (in_stack_00000080 == 0) break;
    puStack0000000c = (ushort *)0xbd286b;
    uVar4 = FUN_00bac8d0();
    if (uVar4 <= *unaff_EBX) {
      puStack0000000c = (ushort *)&UNK_010c758c;
      func_0x00415c90();
      func_0x004160e0();
      puStack0000000c = (ushort *)0x64;
      func_0x00415c90();
      func_0x00415a00();
      if ((_DAT_01323910 & 1) == 0) {
        _DAT_01323910 = _DAT_01323910 | 1;
        _DAT_0132390c = (code *)&UNK_00bd25b0;
      }
      (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48);
    }
  }
  iStack00000074 = *(int *)(in_stack_00000054 + 0x24);
  if (iStack00000074 < 1) {
    in_stack_00000080 = 0;
    uStack00000064 = 0;
  }
  else {
    in_stack_00000080 = *in_stack_00000068;
    puVar6 = *(ushort **)(in_stack_00000054 + 0x20);
    in_stack_00000078 = in_stack_00000078 + iStack00000074 * 0x18;
    uStack00000064 = (ushort)(unaff_EDI + 3U) & 0xfffc;
    unaff_EDI = (unaff_EDI + 3U & 0xfffffffc) + iStack00000074 * 0x18;
    if (0 < iStack00000074) {
      do {
        puStack0000000c = (ushort *)0xbd2a1b;
        uVar4 = FUN_00bac8e0();
        if (uVar4 <= *puVar6) {
          puStack0000000c = (ushort *)&UNK_010c758c;
          func_0x00415c90();
          func_0x004160e0();
          puStack0000000c = (ushort *)0x64;
          func_0x00415c90();
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48);
        }
        puStack0000000c = (ushort *)0xbd2a8b;
        iVar2 = FUN_00bac940();
        iVar2 = (uint)*puVar6 * 0x30 + iVar2;
        if (*(short *)(iVar2 + 6) == 0) {
          puStack0000000c = (ushort *)&UNK_010c7508;
          func_0x00415c90();
          func_0x004160e0();
          puStack0000000c = (ushort *)0x64;
          func_0x00415c90();
          func_0x00415a00();
          if ((_DAT_01323910 & 1) == 0) {
            _DAT_01323910 = _DAT_01323910 | 1;
            _DAT_0132390c = (code *)&UNK_00bd25b0;
          }
          (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48);
        }
        puStack0000000c = puVar6;
        iVar3 = FUN_00be7ce0();
        in_stack_00000078 = in_stack_00000078 + iVar3;
        unaff_EDI = iVar3 + (unaff_EDI + 0xfU & 0xfffffff0);
        if (*in_stack_00000068 != 0) {
          puStack0000000c = (ushort *)0x1;
          FUN_00be7d50(puVar6,iVar2);
        }
        *in_stack_00000068 = *in_stack_00000068 + 0x28;
        puVar6 = puVar6 + 6;
        iStack00000074 = iStack00000074 + -1;
      } while (iStack00000074 != 0);
    }
  }
  if (in_stack_0000004c != (undefined4 *)0x0) {
    *in_stack_0000004c = in_stack_00000058;
    in_stack_0000004c[3] = in_stack_00000028;
    in_stack_0000004c[4] = in_stack_00000020;
    in_stack_0000004c[5] = in_stack_0000007c;
    in_stack_0000004c[6] = in_stack_00000080;
    in_stack_0000004c[8] = in_stack_00000078;
    *(undefined2 *)(in_stack_0000004c + 9) = in_stack_0000002c;
    *(undefined2 *)((int)in_stack_0000004c + 0x26) = in_stack_00000030;
    in_stack_0000004c[1] = in_stack_00000054;
    in_stack_0000004c[7] = unaff_EDI;
    *(undefined2 *)(in_stack_0000004c + 10) = in_stack_00000034;
    *(ushort *)((int)in_stack_0000004c + 0x2a) = uStack00000064;
    *(undefined1 *)(in_stack_0000004c + 2) = 1;
  }
  *unaff_FS_OFFSET = in_stack_0000003c;
  return in_stack_00000024;
}


