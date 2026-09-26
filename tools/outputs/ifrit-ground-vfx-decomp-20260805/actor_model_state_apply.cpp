===== 0x7a82f0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007a82f0(int *param_1,uint param_2)

{
  int *piVar1;
  undefined1 uVar2;
  uint uVar3;
  int *piVar4;
  undefined4 uVar5;
  int iVar6;
  byte bVar7;
  undefined4 *unaff_EBX;
  undefined *unaff_ESI;
  int *unaff_FS_OFFSET;
  int iStack_4cc;
  undefined4 *puStack_4c8;
  int iStack_4c4;
  undefined4 uStack_4c0;
  undefined4 *puStack_4bc;
  int iStack_4b8;
  undefined4 uStack_4b4;
  undefined4 uStack_4b0;
  undefined4 uStack_4ac;
  undefined4 uStack_4a8;
  undefined4 *puStack_4a4;
  int *piStack_4a0;
  int iStack_49c;
  undefined1 auStack_498 [16];
  uint uStack_488;
  uint auStack_484 [3];
  undefined1 uStack_478;
  undefined4 uStack_470;
  undefined4 uStack_46c;
  undefined4 uStack_468;
  undefined1 uStack_464;
  undefined4 uStack_460;
  undefined4 uStack_45c;
  undefined4 uStack_458;
  undefined1 uStack_454;
  undefined1 auStack_450 [8];
  undefined1 auStack_448 [16];
  byte bStack_438;
  undefined1 auStack_240 [16];
  byte bStack_230;
  undefined1 auStack_30 [4];
  undefined1 auStack_2c [4];
  undefined4 uStack_28;
  uint uStack_1c;
  int iStack_14;
  undefined *puStack_10;
  undefined4 uStack_c;
  
  uStack_c = 0xffffffff;
  puStack_10 = &UNK_00ea90ac;
  iStack_14 = *unaff_FS_OFFSET;
  uStack_1c = _DAT_012ea8b0 ^ (uint)&iStack_4cc;
  uVar3 = _DAT_012ea8b0 ^ (uint)&stack0xfffffb28;
  *unaff_FS_OFFSET = (int)&iStack_14;
  if (param_1[0x13] != param_2) {
    auStack_484[0] = param_1[0x13] ^ param_2;
    param_1[0x13] = param_2;
    bVar7 = 0;
    uVar2 = func_0x0065be50(uVar3);
    switch(uVar2) {
    case 0:
      bVar7 = 0;
      break;
    case 1:
      bVar7 = 1;
      break;
    case 2:
      bVar7 = 3;
      break;
    case 3:
      bVar7 = 7;
      break;
    case 4:
      bVar7 = 0xf;
      break;
    case 5:
      bVar7 = 0x1f;
      break;
    case 6:
      bVar7 = 0x3f;
      break;
    case 7:
      bVar7 = 0x7f;
      break;
    case 8:
      bVar7 = 0xff;
    }
    uStack_4c0 = CONCAT13(*(byte *)(param_1 + 0x13) & bVar7,
                          CONCAT12(~bVar7 & *(byte *)(param_1 + 0x13),(undefined2)uStack_4c0));
    uVar2 = func_0x0065c550();
    uStack_4b4 = CONCAT13(uVar2,(undefined3)uStack_4b4);
    piVar4 = (int *)(**(code **)(**(int **)(*param_1 + 0x114) + 8))();
    if ((piVar4 != (int *)0x0) && (piVar1 = *(int **)(*param_1 + 0x12f0), piVar1 != (int *)0x0)) {
      uStack_488 = uStack_4b4 >> 0x18;
      piStack_4a0 = param_1 + 9;
      iStack_49c = 0;
      do {
        uVar3 = 1 << ((byte)iStack_49c & 0x1f);
        if ((auStack_484[0] & uStack_488 & uVar3) != 0) {
          if ((uStack_4c0._2_1_ & (byte)uVar3) == 0) {
            if (*piStack_4a0 != 0) {
              (**(code **)(*piVar1 + 0x10))(*piStack_4a0);
              *puStack_4a4 = 0;
              func_0x009d4f83(auStack_30,0x10,&UNK_00fe75cc,piStack_4a0);
              func_0x0062e2d0(&iStack_49c,auStack_30,0x10);
              unaff_ESI = &UNK_00736362;
              puStack_4c8 = (undefined4 *)
                            (**(code **)(*(int *)*param_1 + 0x10))(&stack0xfffffb2c,&uStack_4a8);
              if (puStack_4c8 != (undefined4 *)0x0) {
                func_0x0080c830();
                uStack_c = 1;
                bStack_438 = bStack_438 | 0xc;
                uStack_468 = *(undefined4 *)(*param_1 + 0xdc);
                uStack_470 = _DAT_012c856c;
                uStack_46c = 0;
                uStack_464 = 0xff;
                func_0x0080a7b0(&uStack_470);
                uStack_4ac = *(undefined4 *)(*param_1 + 0xdc);
                uStack_4b4 = _DAT_012c8570;
                uStack_4b0 = 0;
                uStack_4a8 = CONCAT31(uStack_4a8._1_3_,0xff);
                func_0x0080d8a0(&uStack_4b4);
                uStack_4c0 = *(undefined4 *)(*param_1 + 0xdc);
                iStack_4c4 = *piVar1 + 8;
                uVar5 = (**(code **)(*piVar4 + 0x6c))(unaff_EBX,unaff_EBX,auStack_448);
                (*(code *)*puStack_4c8)(iStack_4c4,uVar5);
                goto LAB_007a8699;
              }
            }
          }
          else {
            func_0x009d4f83(auStack_2c,0x10,&UNK_00fe75bc,iStack_49c);
            func_0x0062e2d0(auStack_450,auStack_2c,0x10);
            puStack_4c8 = (undefined4 *)&UNK_00736362;
            iStack_4b8 = (**(code **)(*(int *)*param_1 + 0x10))(&puStack_4c8,&uStack_45c);
            if (iStack_4b8 != 0) {
              func_0x0080c830();
              uStack_c = 0;
              bStack_230 = bStack_230 | 0xc;
              uStack_458 = *(undefined4 *)(*param_1 + 0xdc);
              uStack_45c = 0;
              uStack_460 = _DAT_012c856c;
              uStack_454 = 0xff;
              func_0x0080a7b0(&uStack_460);
              auStack_484[2] = *(undefined4 *)(*param_1 + 0xdc);
              auStack_484[0] = _DAT_012c8570;
              auStack_484[1] = 0;
              uStack_478 = 0xff;
              func_0x0080d8a0(auStack_484);
              unaff_EBX = *(undefined4 **)(*param_1 + 0xdc);
              iStack_4cc = *piVar1 + 8;
              uVar5 = (**(code **)(*piVar4 + 0x6c))(uStack_4c0,uStack_4c0,auStack_240);
              uVar5 = (*(code *)*unaff_EBX)(unaff_ESI,uVar5);
              *puStack_4bc = uVar5;
LAB_007a8699:
              uStack_28 = 0xffffffff;
              func_0x0080c8e0();
            }
          }
        }
        piStack_4a0 = piStack_4a0 + 1;
        iStack_49c = iStack_49c + 1;
      } while (iStack_49c < 8);
      if (uStack_4c0._3_1_ == '\0') {
        if (param_1[0x11] != 0) {
          (**(code **)(*piVar1 + 0x10))(param_1[0x11]);
          param_1[0x11] = 0;
        }
        func_0x0062e2d0(auStack_498,&UNK_00fe75dc,0x10);
        puStack_4c8 = (undefined4 *)
                      (**(code **)(*(int *)*param_1 + 0x10))(&stack0xfffffb30,&puStack_4a4);
        if (puStack_4c8 == (undefined4 *)0x0) goto LAB_007a891a;
        func_0x0080c830();
        uStack_c = 2;
        bStack_438 = bStack_438 | 0xc;
        uStack_4a8 = *(undefined4 *)(*param_1 + 0xdc);
        uStack_4b0 = _DAT_012c856c;
        uStack_4ac = 0;
        puStack_4a4 = (undefined4 *)CONCAT31(puStack_4a4._1_3_,0xff);
        func_0x0080a7b0(&uStack_4b0);
        uStack_4ac = *(undefined4 *)(*param_1 + 0xdc);
        uStack_4b4 = _DAT_012c8570;
        uStack_4b0 = 0;
        uStack_4a8 = CONCAT31(uStack_4a8._1_3_,0xff);
        func_0x0080d8a0(&uStack_4b4);
        uStack_4c0 = *(undefined4 *)(*param_1 + 0xdc);
        iStack_4c4 = *piVar1 + 8;
        uVar5 = (**(code **)(*piVar4 + 0x6c))(&UNK_00736362,&UNK_00736362,auStack_448);
      }
      else {
        func_0x009d4f83(auStack_2c,0x10,&UNK_00fe75e8,uStack_4c0._3_1_);
        func_0x0062e2d0(auStack_498,auStack_2c,0x10);
        puStack_4c8 = (undefined4 *)
                      (**(code **)(*(int *)*param_1 + 0x10))(&stack0xfffffb30,&puStack_4a4);
        if (puStack_4c8 == (undefined4 *)0x0) goto LAB_007a891a;
        if (param_1[0x11] != 0) {
          (**(code **)(*piVar1 + 0x10))(param_1[0x11]);
          param_1[0x11] = 0;
        }
        func_0x0080c830();
        uStack_c = 3;
        bStack_438 = bStack_438 | 0xc;
        uStack_4a8 = *(undefined4 *)(*param_1 + 0xdc);
        uStack_4b0 = _DAT_012c856c;
        uStack_4ac = 0;
        puStack_4a4 = (undefined4 *)CONCAT31(puStack_4a4._1_3_,0xff);
        func_0x0080a7b0(&uStack_4b0);
        uStack_4ac = *(undefined4 *)(*param_1 + 0xdc);
        uStack_4b4 = _DAT_012c8570;
        uStack_4b0 = 0;
        uStack_4a8 = CONCAT31(uStack_4a8._1_3_,0xff);
        func_0x0080d8a0(&uStack_4b4);
        uStack_4c0 = *(undefined4 *)(*param_1 + 0xdc);
        iStack_4c4 = *piVar1 + 8;
        uVar5 = (**(code **)(*piVar4 + 0x6c))(&UNK_00736362,&UNK_00736362,auStack_448);
      }
      iVar6 = (*(code *)*puStack_4c8)(iStack_4c4,uVar5);
      param_1[0x11] = iVar6;
      uStack_28 = 0xffffffff;
      func_0x0080c8e0();
    }
  }
LAB_007a891a:
  *unaff_FS_OFFSET = iStack_14;
  func_0x009d20f4();
  return;
}


