===== 0x7bf2e0 =====

void __thiscall FUN_007bf2e0(int *param_1,uint param_2,undefined4 param_3)

{
  undefined2 uVar1;
  bool bVar2;
  undefined2 *puVar3;
  int iVar4;
  uint uVar5;
  int *piVar6;
  
  if ((param_2 != 0) && (bVar2 = false, param_1[0x13] != 0)) {
    do {
      uVar5 = param_1[0x12];
      if (param_1[0x13] + uVar5 < uVar5) {
        func_0x009d22b4();
      }
      if ((uint)(param_1[0x13] + param_1[0x12]) <= uVar5) {
        func_0x009d22b4();
      }
      if ((uint)param_1[0x11] <= uVar5) {
        uVar5 = uVar5 - param_1[0x11];
      }
      if (param_2 < **(uint **)(param_1[0x10] + uVar5 * 4)) break;
      uVar5 = param_1[0x12];
      if (param_1[0x13] + uVar5 < uVar5) {
        func_0x009d22b4();
      }
      if ((uint)(param_1[0x13] + param_1[0x12]) <= uVar5) {
        func_0x009d22b4();
      }
      if ((uint)param_1[0x11] <= uVar5) {
        uVar5 = uVar5 - param_1[0x11];
      }
      switch(*(undefined4 *)(*(int *)(param_1[0x10] + uVar5 * 4) + 4)) {
      case 1:
        iVar4 = func_0x007c4ed0();
        iVar4 = *(int *)(iVar4 + 8);
        param_1[2] = iVar4;
        *(char *)(*param_1 + 0xb3a) = (char)iVar4;
        break;
      case 2:
        iVar4 = func_0x007c4ed0();
        iVar4 = *(int *)(iVar4 + 8);
        param_1[3] = iVar4;
        func_0x007bb740(iVar4,0);
        break;
      case 3:
        iVar4 = func_0x007c4ed0();
        uVar1 = *(undefined2 *)(iVar4 + 8);
        *(undefined2 *)(param_1 + 4) = uVar1;
        func_0x007a82f0(uVar1,param_3);
        break;
      case 4:
        iVar4 = func_0x007c4ed0();
        uVar1 = *(undefined2 *)(iVar4 + 8);
        *(undefined2 *)((int)param_1 + 0x12) = uVar1;
        *(undefined2 *)(*param_1 + 0xc20) = uVar1;
        break;
      case 5:
        piVar6 = param_1 + 5;
        iVar4 = func_0x007c4ed0();
        *(undefined8 *)piVar6 = *(undefined8 *)(iVar4 + 8);
        *(undefined8 *)(param_1 + 7) = *(undefined8 *)(iVar4 + 0x10);
        *(undefined8 *)(param_1 + 9) = *(undefined8 *)(iVar4 + 0x18);
        *(undefined8 *)(param_1 + 0xb) = *(undefined8 *)(iVar4 + 0x20);
        *(undefined8 *)(param_1 + 0xd) = *(undefined8 *)(iVar4 + 0x28);
        puVar3 = (undefined2 *)(*param_1 + 0xb54);
        iVar4 = 0x14;
        do {
          *puVar3 = (short)*piVar6;
          piVar6 = (int *)((int)piVar6 + 2);
          puVar3 = puVar3 + 1;
          iVar4 = iVar4 + -1;
        } while (iVar4 != 0);
        bVar2 = true;
      }
      if (param_1[0x13] != 0) {
        param_1[0x12] = param_1[0x12] + 1;
        if ((uint)param_1[0x11] <= (uint)param_1[0x12]) {
          param_1[0x12] = 0;
        }
        iVar4 = param_1[0x13] + -1;
        param_1[0x13] = iVar4;
        if (iVar4 == 0) {
          param_1[0x12] = 0;
        }
      }
    } while (param_1[0x13] != 0);
    if (bVar2) {
      func_0x007ba190();
    }
  }
  return;
}


