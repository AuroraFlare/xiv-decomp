# C Decomp Snippets

Pseudocode snippets from `Client Sourcecode Decomp/ffxivgame.exe.c` where Ghidra emitted a matching function label.

## 0x004E4B40 - result_lookup_helper_a

```c
undefined4 __thiscall FUN_004e4b40(int param_1,undefined4 param_2)

{
  int iVar1;
  int unaff_EBX;
  int unaff_ESI;
  undefined1 auStack_8 [8];
  
  FUN_0071d420(auStack_8,param_2);
  iVar1 = *(int *)(param_1 + 0x20);
  if ((unaff_ESI == 0) || (unaff_ESI != param_1 + 0x1c)) {
    FUN_009d22b4();
  }
  if (unaff_EBX != iVar1) {
    if (unaff_ESI == 0) {
      FUN_009d22b4();
    }
    if (unaff_EBX == *(int *)(unaff_ESI + 4)) {
      FUN_009d22b4();
    }
    return *(undefined4 *)(unaff_EBX + 0x10);
  }
  return 0;
}
```

## 0x004E4BA0 - result_lookup_helper_b

```c
undefined4 __fastcall FUN_004e4ba0(int *param_1)

{
  int iVar1;
  int unaff_EBX;
  int *unaff_EBP;
  undefined4 uVar2;
  undefined1 auStack_8 [8];
  
  (**(code **)(*param_1 + 4))();
  FUN_0071d420(auStack_8,&stack0x00000004);
  iVar1 = param_1[6];
  if ((unaff_EBP == (int *)0x0) || (unaff_EBP != param_1 + 5)) {
    FUN_009d22b4();
  }
  if (unaff_EBX == iVar1) {
    uVar2 = 0;
  }
  else {
    if (unaff_EBP == (int *)0x0) {
      FUN_009d22b4();
    }
    if (unaff_EBX == unaff_EBP[1]) {
      FUN_009d22b4();
    }
    uVar2 = *(undefined4 *)(unaff_EBX + 0x10);
  }
  (**(code **)(*param_1 + 8))();
  return uVar2;
}
```

## 0x004E4C10 - owner_0x88_result_lookup_wrapper

```c
undefined4 __fastcall FUN_004e4c10(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  if (*(int *)(param_1 + 0x88) != 0) {
    iVar1 = FUN_004e4b40((undefined4 *)(param_1 + 0x88));
    if (iVar1 != 0) {
      uVar2 = FUN_004e4ba0(*(undefined4 *)(param_1 + 0x88));
      return uVar2;
    }
  }
  return 0;
}
```

## 0x00DAE770 - da_family_candidate_enqueue_mirror

```c
undefined4 __thiscall FUN_00dae770(uint *param_1,int param_2,int *param_3)

{
  uint *puVar1;
  ushort uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  int iVar5;
  undefined4 *puVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  undefined8 uVar10;
  undefined4 uStack_18;
  undefined4 uStack_c;
  
  if (*(short *)((int)param_1 + 0xe) == 0) {
    puVar1 = param_1 + 4;
    iVar5 = InterlockedCompareExchange(puVar1,2,0);
    if (iVar5 != 1) {
      uVar2 = *(ushort *)(param_2 + 0x20);
      uVar9 = (uint)uVar2;
      uVar8 = uVar9 + 0x13 & 0xfffc;
      if ((ushort)param_1[3] + 0x10 + uVar8 <= *param_1) {
        if ((short)param_1[3] == 0) {
          puVar6 = (undefined4 *)param_1[2];
          *puVar6 = 0;
          puVar6[1] = 0;
          puVar6[2] = 0;
          puVar6[3] = 0;
          *(undefined2 *)(param_1[2] + 4) = 0x10;
          *(undefined1 *)param_1[2] = 1;
          *(undefined2 *)(param_1[2] + 2) = 0;
          *(undefined2 *)(param_1[2] + 6) = 0;
          *(undefined2 *)(param_1 + 3) = 0x10;
        }
        uVar3 = *(undefined4 *)(param_2 + 0x14);
        uVar4 = *(undefined4 *)(param_2 + 0x18);
        puVar6 = (undefined4 *)((uint)(ushort)param_1[3] + param_1[2]);
        uStack_18 = CONCAT22(3,(short)uVar8);
        *puVar6 = uStack_18;
        puVar6[1] = uVar3;
        puVar6[2] = uVar4;
        puVar6[3] = uStack_c;
        *(short *)(param_1 + 3) = (short)param_1[3] + 0x10;
        FUN_009d4600((uint)(ushort)param_1[3] + param_1[2],*(undefined4 *)(param_2 + 0x24),uVar9);
        if (param_3 != (int *)0x0) {
          (**(code **)(*param_3 + 0x18))(uVar3,(uint)(ushort)param_1[3] + param_1[2],uVar9);
        }
        *(ushort *)(param_1 + 3) = (short)param_1[3] + uVar2;
        *(short *)(param_1[2] + 4) = *(short *)(param_1[2] + 4) + (short)uVar8;
        *(short *)(param_1[2] + 6) = *(short *)(param_1[2] + 6) + 1;
        uVar10 = FUN_004e36a0();
        *(undefined8 *)(param_1[2] + 8) = uVar10;
        uVar7 = (uint)uVar2;
        while (uVar7 + 0x10 < uVar8) {
          *(undefined1 *)((uint)(ushort)param_1[3] + param_1[2]) = 0;
          *(short *)(param_1 + 3) = (short)param_1[3] + 1;
          uVar9 = uVar9 + 1;
          uVar7 = uVar9 & 0xffff;
        }
        InterlockedCompareExchange(puVar1,0,2);
        return 1;
      }
      InterlockedCompareExchange(puVar1,0,2);
    }
  }
  return 0;
}
```

## 0x00DAEC20 - da_family_lookup_pair_helper

```c
void FUN_00daec20(undefined4 *param_1,undefined4 param_2,undefined4 *param_3,undefined4 param_4,
                 undefined4 *param_5,int param_6,int param_7)

{
  int iVar1;
  
  for (; param_3 != param_5; param_3 = (undefined4 *)*param_3) {
    iVar1 = *(int *)(param_3[2] + 0xc);
    if (((iVar1 != 0) && (iVar1 == param_6)) && (*(int *)(param_3[2] + 0x10) == param_7)) break;
  }
  *param_1 = param_2;
  param_1[1] = param_3;
  return;
}
```

## 0x00DB4B80 - wrapper_candidate_gate_enqueue

```c
char __fastcall FUN_00db4b80(int param_1)

{
  int iVar1;
  int *piVar2;
  char cVar3;
  int unaff_EBX;
  void *unaff_EBP;
  undefined4 unaff_retaddr;
  undefined4 uVar4;
  int iStack_20;
  int iStack_1c;
  char cStack_14;
  void *pvStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00f04430;
  pvStack_c = ExceptionList;
  ExceptionList = &pvStack_c;
  iStack_20 = param_1 + 0x5c;
  iVar1 = param_1 + 0x60;
  EnterCriticalSection(iVar1,_DAT_012ea8b0 ^ (uint)&stack0xffffffcc);
  puStack_8 = (undefined *)0x0;
  uVar4 = unaff_retaddr;
  FUN_0071d420(&iStack_20,unaff_retaddr);
  iStack_1c = *(int *)(param_1 + 0x10);
  if ((unaff_EBX == 0) || (unaff_EBX != param_1 + 0xc)) {
    FUN_009d22b4();
  }
  if (iVar1 == iStack_1c) {
LAB_00db4c9f:
    LeaveCriticalSection(iVar1);
    cVar3 = '\0';
  }
  else {
    if (unaff_EBX == 0) {
      FUN_009d22b4();
    }
    if (iVar1 == *(int *)(unaff_EBX + 4)) {
      FUN_009d22b4();
    }
    piVar2 = *(int **)(param_1 + 0x70);
    if ((char)unaff_retaddr == '\0') {
      cVar3 = (**(code **)(*piVar2 + 0x10))();
      if (cVar3 == '\0') goto LAB_00db4c9f;
    }
    EnterCriticalSection(param_1 + 0x44);
    cStack_14 = '\x01';
    pvStack_c = (void *)CONCAT31(pvStack_c._1_3_,(short)piVar2[5] == 0);
    cVar3 = FUN_00dae770(puStack_8,*(undefined4 *)(param_1 + 0x78));
    if ((cVar3 != '\0') &&
       (*(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) + 1, cStack_14 != '\0')) {
      *(int *)(param_1 + 0x18) = *(int *)(param_1 + 0x18) + 1;
    }
    if (((char)pvStack_c != '\0') && ((short)piVar2[5] != 0)) {
      (**(code **)(*piVar2 + 4))(param_1);
    }
    LeaveCriticalSection(param_1 + 0x44);
    LeaveCriticalSection(uVar4);
  }
  ExceptionList = unaff_EBP;
  return cVar3;
}
```

## 0x00DB4CC0 - wrapper_lookup_pair_helper

```c
void FUN_00db4cc0(int *param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5,
                 undefined4 param_6,undefined4 param_7)

{
  int iVar1;
  int *piVar2;
  
  piVar2 = (int *)FUN_00daec20(&param_4,param_2,param_3,param_4,param_5,param_6,param_7);
  iVar1 = piVar2[1];
  if (param_2 != *piVar2) {
    FUN_009d22b4();
  }
  param_1[1] = iVar1;
  *param_1 = param_2;
  return;
}
```

## 0x00DB5560 - wrapper_output_container_dtor_root

```c
void __fastcall FUN_00db5560(undefined4 *param_1)

{
  uint uVar1;
  undefined1 auStack_14 [8];
  void *pvStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  puStack_8 = &UNK_00f03b69;
  pvStack_c = ExceptionList;
  uVar1 = _DAT_012ea8b0 ^ (uint)&stack0xffffffdc;
  ExceptionList = &pvStack_c;
  *param_1 = &UNK_011293ec;
  uStack_4 = 3;
  FUN_00dab890(uVar1);
  if ((undefined4 *)param_1[10] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[10])(1);
  }
  param_1[10] = 0;
  if ((undefined4 *)param_1[0xc] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0xc])(1);
  }
  param_1[0xc] = 0;
  if ((undefined4 *)param_1[0xd] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0xd])(1);
  }
  param_1[0xd] = 0;
  FUN_008fbf30();
  uStack_4 = CONCAT31(uStack_4._1_3_,1);
  FUN_00927700(auStack_14,param_1 + 7,*(undefined4 *)param_1[8],param_1 + 7,(undefined4 *)param_1[8]
              );
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_1[8]);
}
```

## 0x00DB5650 - wrapper_output_container_tree_dtor_a

```c
void __fastcall FUN_00db5650(undefined4 *param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined1 auStack_20 [4];
  int iStack_1c;
  void *pvStack_14;
  undefined *puStack_10;
  uint uStack_c;
  
  puStack_10 = &UNK_00f03ba6;
  pvStack_14 = ExceptionList;
  uVar3 = _DAT_012ea8b0 ^ (uint)&stack0xffffffc0;
  ExceptionList = &pvStack_14;
  *param_1 = &UNK_01129454;
  iVar1 = *(int *)param_1[3];
  uStack_c = 1;
  while( true ) {
    iVar2 = param_1[3];
    if (param_1 == (undefined4 *)0xfffffff8) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == iVar2) break;
    if (param_1 == (undefined4 *)0xfffffff8) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == param_1[3]) {
      FUN_009d22b4(uVar3);
    }
    if (*(undefined4 **)(iVar1 + 0x10) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iVar1 + 0x10))(1);
    }
    FUN_009172c0();
  }
  iVar1 = *(int *)param_1[6];
  puVar4 = param_1 + 5;
  while( true ) {
    iStack_1c = param_1[6];
    if (puVar4 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == iStack_1c) break;
    if (puVar4 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == param_1[6]) {
      FUN_009d22b4();
    }
    if (*(undefined4 **)(iVar1 + 0x10) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iVar1 + 0x10))(1);
    }
    FUN_009172c0();
  }
  uStack_c = uStack_c & 0xffffff00;
  FUN_00927700(auStack_20,puVar4,*(undefined4 *)param_1[6],puVar4,(undefined4 *)param_1[6]);
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_1[6]);
}
```

## 0x00DB57E0 - wrapper_output_container_tree_dtor_b

```c
void __fastcall FUN_00db57e0(undefined4 *param_1)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined1 auStack_20 [4];
  int iStack_1c;
  void *pvStack_14;
  undefined *puStack_10;
  uint uStack_c;
  
  puStack_10 = &UNK_00f04496;
  pvStack_14 = ExceptionList;
  uVar3 = _DAT_012ea8b0 ^ (uint)&stack0xffffffc0;
  ExceptionList = &pvStack_14;
  *param_1 = &UNK_01129464;
  iVar1 = *(int *)param_1[3];
  uStack_c = 1;
  while( true ) {
    iVar2 = param_1[3];
    if (param_1 == (undefined4 *)0xfffffff8) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == iVar2) break;
    if (param_1 == (undefined4 *)0xfffffff8) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == param_1[3]) {
      FUN_009d22b4(uVar3);
    }
    if (*(undefined4 **)(iVar1 + 0x10) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iVar1 + 0x10))(1);
    }
    FUN_009172c0();
  }
  iVar1 = *(int *)param_1[6];
  puVar4 = param_1 + 5;
  while( true ) {
    iStack_1c = param_1[6];
    if (puVar4 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == iStack_1c) break;
    if (puVar4 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar1 == param_1[6]) {
      FUN_009d22b4();
    }
    if (*(undefined4 **)(iVar1 + 0x10) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iVar1 + 0x10))(1);
    }
    FUN_009172c0();
  }
  uStack_c = uStack_c & 0xffffff00;
  FUN_008a8ab0(auStack_20,puVar4,*(undefined4 *)param_1[6],puVar4,(undefined4 *)param_1[6]);
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_1[6]);
}
```

## 0x00DB5970 - wrapper_output_container_dtor_full

```c
void __fastcall FUN_00db5970(undefined4 *param_1)

{
  uint uVar1;
  void *pvStack_c;
  undefined *puStack_8;
  int iStack_4;
  
  puStack_8 = &UNK_00f044de;
  pvStack_c = ExceptionList;
  uVar1 = _DAT_012ea8b0 ^ (uint)&stack0xffffffec;
  ExceptionList = &pvStack_c;
  *param_1 = &UNK_011294a4;
  iStack_4 = 2;
  FUN_00dab890(uVar1);
  iStack_4._0_1_ = 1;
  param_1[0x1a] = &UNK_01129494;
  FUN_00db57e0();
  iStack_4 = (uint)iStack_4._1_3_ << 8;
  param_1[0x12] = &UNK_01129484;
  FUN_00db5650();
  iStack_4 = 0xffffffff;
  FUN_00db5560();
  ExceptionList = pvStack_c;
  return;
}
```

## 0x00DB5AF0 - wrapper_output_container_clear_or_reset

```c
void __fastcall FUN_00db5af0(undefined4 *param_1)

{
  undefined4 *puVar1;
  int iVar2;
  uint uVar3;
  undefined1 auStack_14 [4];
  int iStack_10;
  void *pvStack_c;
  undefined *puStack_8;
  uint uStack_4;
  
  puStack_8 = &UNK_00f04513;
  pvStack_c = ExceptionList;
  uVar3 = _DAT_012ea8b0 ^ (uint)&stack0xffffffd0;
  ExceptionList = &pvStack_c;
  *param_1 = &UNK_01129474;
  iVar2 = *(int *)param_1[6];
  puVar1 = param_1 + 5;
  uStack_4 = 1;
  while( true ) {
    iStack_10 = param_1[6];
    if (puVar1 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar2 == iStack_10) break;
    if (puVar1 == (undefined4 *)0x0) {
      FUN_009d22b4(uVar3);
    }
    if (iVar2 == param_1[6]) {
      FUN_009d22b4(uVar3);
    }
    if (*(int *)(iVar2 + 0xc) != param_1[2]) {
      if (iVar2 == param_1[6]) {
        FUN_009d22b4(uVar3);
      }
      FUN_00daef60(param_1[2]);
    }
    if (iVar2 == param_1[6]) {
      FUN_009d22b4();
    }
    if (*(undefined4 **)(iVar2 + 0x10) != (undefined4 *)0x0) {
      (**(code **)**(undefined4 **)(iVar2 + 0x10))(1);
    }
    FUN_009172c0();
  }
  iVar2 = *(int *)(param_1[6] + 4);
  if (*(char *)(iVar2 + 0x15) == '\0') {
    FUN_008a8780(*(undefined4 *)(iVar2 + 8));
                    // WARNING: Subroutine does not return
    thunk_FUN_009d5c88(iVar2);
  }
  *(undefined4 *)(param_1[6] + 4) = param_1[6];
  param_1[7] = 0;
  *(undefined4 *)param_1[6] = param_1[6];
  *(undefined4 *)(param_1[6] + 8) = param_1[6];
  uStack_4 = uStack_4 & 0xffffff00;
  FUN_00927700(auStack_14,puVar1,*(undefined4 *)param_1[6],puVar1,(undefined4 *)param_1[6]);
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_1[6]);
}
```
