# C Decomp Snippets

Pseudocode snippets from `Client Sourcecode Decomp/ffxivgame.exe.c` where Ghidra emitted a matching function label.

## 0x008A87F0 - db_tree_remove_helper

```c
void __thiscall FUN_008a87f0(int param_1,undefined4 param_2,undefined4 param_3,int *param_4)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  int *piVar5;
  int *piVar6;
  undefined1 auStack_40 [4];
  undefined4 uStack_3c;
  undefined4 uStack_38;
  void *pvStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00e86dd8;
  pvStack_c = ExceptionList;
  ExceptionList = &pvStack_c;
  if (*(char *)((int)param_4 + 0x15) != '\0') {
    uStack_38 = 0xf;
    uStack_3c = 0;
    FUN_00404120(&UNK_00f599a8,0x1b);
    pvStack_c = (void *)0x0;
    FUN_00420d60(&stack0xffffffa8);
                    // WARNING: Subroutine does not return
    FUN_009d1b9f(auStack_40,&UNK_011aa734);
  }
  FUN_009172c0(_DAT_012ea8b0 ^ (uint)&stack0xffffff9c);
  piVar6 = (int *)*param_4;
  if (*(char *)((int)piVar6 + 0x15) == '\0') {
    if (*(char *)(param_4[2] + 0x15) == '\0') {
      piVar6 = (int *)param_4[2];
    }
  }
  else {
    piVar6 = (int *)param_4[2];
  }
  piVar5 = (int *)param_4[1];
  if (*(char *)((int)piVar6 + 0x15) == '\0') {
    piVar6[1] = (int)piVar5;
  }
  if (*(int **)(*(int *)(param_1 + 4) + 4) == param_4) {
    *(int **)(*(int *)(param_1 + 4) + 4) = piVar6;
  }
  else if ((int *)*piVar5 == param_4) {
    *piVar5 = (int)piVar6;
  }
  else {
    piVar5[2] = (int)piVar6;
  }
  puVar1 = *(undefined4 **)(param_1 + 4);
  if ((int *)*puVar1 == param_4) {
    piVar3 = piVar5;
    if (*(char *)((int)piVar6 + 0x15) == '\0') {
      piVar3 = (int *)FUN_0096fd70(piVar6);
    }
    *puVar1 = piVar3;
  }
  iVar2 = *(int *)(param_1 + 4);
  if (*(int **)(iVar2 + 8) == param_4) {
    if (*(char *)((int)piVar6 + 0x15) == '\0') {
      uVar4 = FUN_0081e910(piVar6);
      *(undefined4 *)(iVar2 + 8) = uVar4;
    }
    else {
      *(int **)(iVar2 + 8) = piVar5;
    }
  }
  if ((char)param_4[5] == '\x01') {
    if (piVar6 != *(int **)(*(int *)(param_1 + 4) + 4)) {
      do {
        piVar3 = piVar5;
        if ((char)piVar6[5] != '\x01') break;
        piVar5 = (int *)*piVar3;
        if (piVar6 == piVar5) {
          piVar5 = (int *)piVar3[2];
          if ((char)piVar5[5] == '\0') {
            *(undefined1 *)(piVar5 + 5) = 1;
            *(undefined1 *)(piVar3 + 5) = 0;
            FUN_006ceef0(piVar3);
            piVar5 = (int *)piVar3[2];
          }
          if (*(char *)((int)piVar5 + 0x15) == '\0') {
            if ((*(char *)(*piVar5 + 0x14) != '\x01') || (*(char *)(piVar5[2] + 0x14) != '\x01')) {
              if (*(char *)(piVar5[2] + 0x14) == '\x01') {
                *(undefined1 *)(*piVar5 + 0x14) = 1;
                *(undefined1 *)(piVar5 + 5) = 0;
                FUN_00b9f240(piVar5);
                piVar5 = (int *)piVar3[2];
              }
              *(char *)(piVar5 + 5) = (char)piVar3[5];
              *(undefined1 *)(piVar3 + 5) = 1;
              *(undefined1 *)(piVar5[2] + 0x14) = 1;
              FUN_006ceef0(piVar3);
              break;
            }
LAB_008a8a1e:
            *(undefined1 *)(piVar5 + 5) = 0;
          }
        }
        else {
          if ((char)piVar5[5] == '\0') {
            *(undefined1 *)(piVar5 + 5) = 1;
            *(undefined1 *)(piVar3 + 5) = 0;
            FUN_00b9f240(piVar3);
            piVar5 = (int *)*piVar3;
          }
          if (*(char *)((int)piVar5 + 0x15) == '\0') {
            if ((*(char *)(piVar5[2] + 0x14) == '\x01') && (*(char *)(*piVar5 + 0x14) == '\x01'))
            goto LAB_008a8a1e;
            if (*(char *)(*piVar5 + 0x14) == '\x01') {
              *(undefined1 *)(piVar5[2] + 0x14) = 1;
              *(undefined1 *)(piVar5 + 5) = 0;
              FUN_006ceef0(piVar5);
              piVar5 = (int *)*piVar3;
            }
            *(char *)(piVar5 + 5) = (char)piVar3[5];
            *(undefined1 *)(piVar3 + 5) = 1;
            *(undefined1 *)(*piVar5 + 0x14) = 1;
            FUN_00b9f240(piVar3);
            break;
          }
        }
        piVar5 = (int *)piVar3[1];
        piVar6 = piVar3;
      } while (piVar3 != *(int **)(*(int *)(param_1 + 4) + 4));
    }
    *(undefined1 *)(piVar6 + 5) = 1;
  }
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_4);
}
```

## 0x00927440 - da_tree_remove_helper

```c
void __thiscall FUN_00927440(int param_1,undefined4 param_2,undefined4 param_3,int *param_4)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  int *piVar5;
  int *piVar6;
  undefined *puStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  void *pvStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00e57fa8;
  pvStack_c = ExceptionList;
  ExceptionList = &pvStack_c;
  if (*(char *)((int)param_4 + 0x15) != '\0') {
    uStack_38 = 0xf;
    uStack_3c = 0;
    FUN_00404120(&UNK_00f599a8,0x1b);
    pvStack_c = (void *)0x0;
    FUN_00404320(&stack0xffffffa8);
    puStack_40 = &UNK_00f6702c;
                    // WARNING: Subroutine does not return
    FUN_009d1b9f(&puStack_40,&UNK_011aa734);
  }
  FUN_009172c0(_DAT_012ea8b0 ^ (uint)&stack0xffffff9c);
  piVar6 = (int *)*param_4;
  if (*(char *)((int)piVar6 + 0x15) == '\0') {
    if (*(char *)(param_4[2] + 0x15) == '\0') {
      piVar6 = (int *)param_4[2];
    }
  }
  else {
    piVar6 = (int *)param_4[2];
  }
  piVar5 = (int *)param_4[1];
  if (*(char *)((int)piVar6 + 0x15) == '\0') {
    piVar6[1] = (int)piVar5;
  }
  if (*(int **)(*(int *)(param_1 + 4) + 4) == param_4) {
    *(int **)(*(int *)(param_1 + 4) + 4) = piVar6;
  }
  else if ((int *)*piVar5 == param_4) {
    *piVar5 = (int)piVar6;
  }
  else {
    piVar5[2] = (int)piVar6;
  }
  puVar1 = *(undefined4 **)(param_1 + 4);
  if ((int *)*puVar1 == param_4) {
    piVar3 = piVar5;
    if (*(char *)((int)piVar6 + 0x15) == '\0') {
      piVar3 = (int *)FUN_0096fd70(piVar6);
    }
    *puVar1 = piVar3;
  }
  iVar2 = *(int *)(param_1 + 4);
  if (*(int **)(iVar2 + 8) == param_4) {
    if (*(char *)((int)piVar6 + 0x15) == '\0') {
      uVar4 = FUN_0081e910(piVar6);
      *(undefined4 *)(iVar2 + 8) = uVar4;
    }
    else {
      *(int **)(iVar2 + 8) = piVar5;
    }
  }
  if ((char)param_4[5] == '\x01') {
    if (piVar6 != *(int **)(*(int *)(param_1 + 4) + 4)) {
      do {
        piVar3 = piVar5;
        if ((char)piVar6[5] != '\x01') break;
        piVar5 = (int *)*piVar3;
        if (piVar6 == piVar5) {
          piVar5 = (int *)piVar3[2];
          if ((char)piVar5[5] == '\0') {
            *(undefined1 *)(piVar5 + 5) = 1;
            *(undefined1 *)(piVar3 + 5) = 0;
            FUN_006ceef0(piVar3);
            piVar5 = (int *)piVar3[2];
          }
          if (*(char *)((int)piVar5 + 0x15) == '\0') {
            if ((*(char *)(*piVar5 + 0x14) != '\x01') || (*(char *)(piVar5[2] + 0x14) != '\x01')) {
              if (*(char *)(piVar5[2] + 0x14) == '\x01') {
                *(undefined1 *)(*piVar5 + 0x14) = 1;
                *(undefined1 *)(piVar5 + 5) = 0;
                FUN_00b9f240(piVar5);
                piVar5 = (int *)piVar3[2];
              }
              *(char *)(piVar5 + 5) = (char)piVar3[5];
              *(undefined1 *)(piVar3 + 5) = 1;
              *(undefined1 *)(piVar5[2] + 0x14) = 1;
              FUN_006ceef0(piVar3);
              break;
            }
LAB_0092766e:
            *(undefined1 *)(piVar5 + 5) = 0;
          }
        }
        else {
          if ((char)piVar5[5] == '\0') {
            *(undefined1 *)(piVar5 + 5) = 1;
            *(undefined1 *)(piVar3 + 5) = 0;
            FUN_00b9f240(piVar3);
            piVar5 = (int *)*piVar3;
          }
          if (*(char *)((int)piVar5 + 0x15) == '\0') {
            if ((*(char *)(piVar5[2] + 0x14) == '\x01') && (*(char *)(*piVar5 + 0x14) == '\x01'))
            goto LAB_0092766e;
            if (*(char *)(*piVar5 + 0x14) == '\x01') {
              *(undefined1 *)(piVar5[2] + 0x14) = 1;
              *(undefined1 *)(piVar5 + 5) = 0;
              FUN_006ceef0(piVar5);
              piVar5 = (int *)*piVar3;
            }
            *(char *)(piVar5 + 5) = (char)piVar3[5];
            *(undefined1 *)(piVar3 + 5) = 1;
            *(undefined1 *)(*piVar5 + 0x14) = 1;
            FUN_00b9f240(piVar3);
            break;
          }
        }
        piVar5 = (int *)piVar3[1];
        piVar6 = piVar3;
      } while (piVar3 != *(int **)(*(int *)(param_1 + 4) + 4));
    }
    *(undefined1 *)(piVar6 + 5) = 1;
  }
                    // WARNING: Subroutine does not return
  thunk_FUN_009d5c88(param_4);
}
```

## 0x00994A90 - da_result_tree_insert_helper

```c
void __thiscall FUN_00994a90(int param_1,int *param_2,uint *param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  bool bVar4;
  undefined4 *puStack_c;
  int iStack_8;
  undefined4 *puStack_4;
  
  puVar3 = *(undefined4 **)(param_1 + 4);
  bVar4 = true;
  puStack_c = (undefined4 *)CONCAT31(puStack_c._1_3_,1);
  if (*(char *)((int)puVar3[1] + 0x15) == '\0') {
    puVar2 = (undefined4 *)puVar3[1];
    do {
      puVar3 = puVar2;
      bVar4 = *param_3 < (uint)puVar3[3];
      puStack_c = (undefined4 *)CONCAT31(puStack_c._1_3_,bVar4);
      if (bVar4) {
        puVar2 = (undefined4 *)*puVar3;
      }
      else {
        puVar2 = (undefined4 *)puVar3[2];
      }
    } while (*(char *)((int)puVar2 + 0x15) == '\0');
  }
  iStack_8 = param_1;
  puStack_4 = puVar3;
  if (bVar4) {
    if (puVar3 == (undefined4 *)**(int **)(param_1 + 4)) {
      puVar2 = (undefined4 *)0x1;
      goto LAB_00994aec;
    }
    FUN_004e4020();
  }
  puVar2 = puStack_c;
  if (*param_3 <= (uint)puStack_4[3]) {
    *param_2 = iStack_8;
    param_2[1] = (int)puStack_4;
    *(undefined1 *)(param_2 + 2) = 0;
    return;
  }
LAB_00994aec:
  puVar3 = (undefined4 *)FUN_00913860(&iStack_8,puVar2,puVar3,param_3);
  uVar1 = puVar3[1];
  *puStack_c = *puVar3;
  puStack_c[1] = uVar1;
  *(undefined1 *)(puStack_c + 2) = 1;
  return;
}
```
