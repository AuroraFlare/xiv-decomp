===== 0x7bade0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007bade0(int *param_1,float param_2)

{
  float fVar1;
  int *piVar2;
  char cVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int *unaff_EDI;
  int *unaff_FS_OFFSET;
  undefined *puVar9;
  undefined *puStack_348;
  undefined *puStack_344;
  undefined *puStack_340;
  undefined4 **ppuStack_33c;
  undefined *puStack_338;
  undefined4 uStack_334;
  undefined4 uStack_330;
  undefined *puStack_32c;
  undefined4 uStack_328;
  undefined *puStack_324;
  undefined **ppuStack_320;
  undefined4 *puStack_31c;
  undefined4 *puStack_318;
  int *piStack_314;
  undefined4 *puStack_310;
  uint uStack_30c;
  undefined **ppuStack_2fc;
  int *piStack_2f8;
  int *apiStack_2ec [4];
  undefined1 uStack_2dc;
  undefined1 uStack_2db;
  undefined1 uStack_2da;
  undefined1 uStack_2d9;
  undefined1 uStack_2d8;
  undefined1 uStack_2d7;
  undefined1 uStack_2d6;
  undefined1 uStack_2d5;
  undefined1 uStack_2d4;
  undefined4 uStack_2d0;
  undefined4 uStack_2cc;
  undefined *puStack_2c8;
  undefined *puStack_2c4;
  undefined *apuStack_2c0 [3];
  undefined4 uStack_2b4;
  undefined4 uStack_2b0;
  undefined4 uStack_2ac;
  undefined1 uStack_2a8;
  undefined4 uStack_2a4;
  undefined4 uStack_2a0;
  undefined4 uStack_29c;
  undefined1 uStack_298;
  undefined4 uStack_294;
  undefined4 uStack_290;
  undefined4 uStack_28c;
  undefined1 uStack_288;
  undefined4 uStack_280;
  undefined4 uStack_27c;
  undefined4 uStack_278;
  undefined1 uStack_274;
  undefined4 uStack_270;
  undefined4 uStack_26c;
  undefined4 uStack_268;
  undefined1 uStack_264;
  undefined4 uStack_260;
  undefined4 uStack_25c;
  undefined4 uStack_258;
  undefined1 uStack_254;
  undefined1 auStack_250 [4];
  undefined1 auStack_24c [12];
  undefined1 auStack_240 [4];
  undefined1 auStack_23c [12];
  undefined1 auStack_230 [8];
  undefined1 auStack_228 [16];
  byte bStack_218;
  int iStack_4c;
  int iStack_30;
  undefined4 uStack_28;
  int iStack_14;
  undefined *puStack_10;
  undefined4 uStack_c;
  
  uStack_c = 0xffffffff;
  puStack_10 = &UNK_00ea9d2b;
  iStack_14 = *unaff_FS_OFFSET;
  uStack_30c = _DAT_012ea8b0 ^ (uint)&stack0xfffffcf8;
  *unaff_FS_OFFSET = (int)&iStack_14;
  puStack_310 = (undefined4 *)0x7bae23;
  piVar4 = (int *)(**(code **)(**(int **)(*param_1 + 0x114) + 8))();
  iVar5 = _DAT_00fe7ec8;
  piVar2 = *(int **)(*param_1 + 0x12f0);
  if (((*(byte *)(param_1 + 0x16b) != 0) && (*(byte *)(param_1 + 0x16b) < 6)) &&
     (fVar1 = (float)param_1[0x167], param_1[0x167] = (int)(fVar1 - param_2), fVar1 - param_2 < 0.0)
     ) {
    *(undefined1 *)(param_1 + 0x16b) = 5;
    param_1[0x166] = 0;
    param_1[0x167] = iVar5;
  }
  switch((char)param_1[0x16b]) {
  case '\x01':
    puStack_310 = (undefined4 *)&UNK_007baea8;
    func_0x0065c470();
    puStack_310 = (undefined4 *)0xffffffff;
    piStack_314 = (int *)&UNK_007baeb1;
    func_0x0065c360();
    if (*(int *)(*param_1 + 0xe0) != 0x7fffffff) {
      puStack_310 = (undefined4 *)&UNK_007baeca;
      cVar3 = func_0x007ad830();
      if (cVar3 != '\0') goto LAB_007bb704;
      puStack_310 = (undefined4 *)0xffffffff;
      piStack_314 = (int *)&UNK_007baedb;
      cVar3 = func_0x0065c3c0();
      if (cVar3 == '\0') goto LAB_007bb704;
    }
    puStack_310 = (undefined4 *)0xffffffff;
    apiStack_2ec[1] = (int *)&UNK_00fe73b8;
    apiStack_2ec[2] = (int *)&UNK_00fe73c0;
    apiStack_2ec[3] = (int *)&UNK_00fe73c8;
    uStack_2d0 = 2;
    uStack_2cc = 3;
    puStack_2c8 = (undefined *)0x4;
    piStack_314 = (int *)&UNK_007baf1c;
    func_0x0065c370();
    piStack_314 = (int *)(uint)*(byte *)(param_1 + 0x16a);
    puStack_318 = (undefined4 *)&UNK_007baf2b;
    func_0x0065bc00();
    puStack_318 = (undefined4 *)&UNK_007baf38;
    func_0x007ba190();
    piStack_2f8 = (int *)0x0;
    apiStack_2ec[0] = param_1 + 0xd2;
    do {
      piStack_314 = apiStack_2ec[(int)piStack_2f8 + 1];
      puStack_310 = (undefined4 *)0x10;
      puStack_318 = (undefined4 *)auStack_250;
      puStack_31c = (undefined4 *)&UNK_007baf5e;
      func_0x0062e2d0();
      puStack_31c = &uStack_25c;
      puStack_2c8 = &UNK_00736362;
      ppuStack_320 = &puStack_2c8;
      puStack_324 = &UNK_007baf7c;
      iVar5 = (**(code **)(*(int *)*param_1 + 0x10))();
      if (((iVar5 != 0) && (piVar4 != (int *)0x0)) && (piVar2 != (int *)0x0)) {
        puStack_310 = (undefined4 *)&UNK_007bafa7;
        func_0x0080c830();
        uStack_c = 0;
        bStack_218 = bStack_218 | 4;
        uStack_268 = *(undefined4 *)(*param_1 + 0xdc);
        puStack_310 = &uStack_270;
        uStack_270 = _DAT_012c856c;
        uStack_26c = 0;
        uStack_264 = 0xff;
        piStack_314 = (int *)&UNK_007baff7;
        func_0x0080a7b0();
        uStack_28c = *(undefined4 *)(*param_1 + 0xdc);
        piStack_314 = &uStack_294;
        uStack_294 = _DAT_012c8570;
        uStack_290 = 0;
        uStack_288 = 0xff;
        puStack_318 = (undefined4 *)&UNK_007bb030;
        func_0x0080d8a0();
        iVar5 = *piStack_2f8;
        puStack_318 = (undefined4 *)auStack_228;
        ppuStack_320 = ppuStack_2fc;
        puStack_324 = &UNK_007bb05c;
        puStack_324 = (undefined *)(**(code **)(*piVar4 + 0x6c))();
        puStack_32c = &UNK_007bb06a;
        iVar5 = (**(code **)(iVar5 + 8))();
        *unaff_EDI = iVar5;
        if (iVar5 != 0) {
          *(char *)(param_1 + 0x16b) = (char)apiStack_2ec[(int)piStack_314];
          goto code_r0x007bb0be;
        }
        uStack_28 = 0xffffffff;
        puStack_32c = &UNK_007bb08b;
        func_0x0080c8e0();
      }
      apiStack_2ec[0] = apiStack_2ec[0] + 1;
      piStack_2f8 = (int *)((int)piStack_2f8 + 1);
    } while ((int)piStack_2f8 < 3);
    *(undefined1 *)(param_1 + 0x16b) = 5;
    break;
  case '\x02':
    puStack_310 = (undefined4 *)&UNK_007bb118;
    iVar5 = (**(code **)(*(int *)param_1[0xd2] + 0x9c))();
    puStack_310 = (undefined4 *)&UNK_007bb12f;
    iVar6 = (**(code **)(*(int *)param_1[0xd2] + 0x98))();
    if (iVar6 < iVar5 + -1) goto LAB_007bb704;
    puStack_310 = (undefined4 *)0x10;
    puStack_318 = (undefined4 *)auStack_230;
    piStack_314 = (int *)&UNK_00fe73d0;
    puStack_31c = (undefined4 *)&UNK_007bb14f;
    func_0x0062e2d0();
    puStack_31c = (undefined4 *)auStack_23c;
    apuStack_2c0[0] = &UNK_00736362;
    ppuStack_320 = apuStack_2c0;
    puStack_324 = &UNK_007bb16d;
    iVar5 = (**(code **)(*(int *)*param_1 + 0x10))();
    if (((iVar5 == 0) || (piVar4 == (int *)0x0)) || (piVar2 == (int *)0x0)) goto LAB_007bb704;
    puStack_310 = (undefined4 *)&UNK_007bb195;
    func_0x0080c830();
    uStack_c = 1;
    bStack_218 = bStack_218 | 4;
    uStack_258 = *(undefined4 *)(*param_1 + 0xdc);
    puStack_310 = &uStack_260;
    uStack_260 = _DAT_012c856c;
    uStack_25c = 0;
    uStack_254 = 0xff;
    piStack_314 = (int *)&UNK_007bb1eb;
    func_0x0080a7b0();
    uStack_2ac = *(undefined4 *)(*param_1 + 0xdc);
    piStack_314 = &uStack_2b4;
    uStack_2b4 = _DAT_012c8570;
    uStack_2b0 = 0;
    uStack_2a8 = 0xff;
    puStack_318 = (undefined4 *)&UNK_007bb21f;
    func_0x0080d8a0();
    iVar5 = *piVar2;
    puStack_318 = (undefined4 *)auStack_228;
    puStack_324 = &UNK_007bb247;
    puStack_324 = (undefined *)(**(code **)(*piVar4 + 0x6c))();
    puStack_32c = &UNK_007bb255;
    iVar5 = (**(code **)(iVar5 + 8))();
    param_1[0xd3] = iVar5;
    if (iVar5 == 0) goto code_r0x007bb0d9;
    *(undefined1 *)(param_1 + 0x16b) = 3;
    goto code_r0x007bb0be;
  case '\x03':
    if (0.0 < (float)param_1[0x163]) goto LAB_007bb704;
    puStack_310 = (undefined4 *)0x10;
    puStack_318 = (undefined4 *)auStack_240;
    piStack_314 = (int *)&UNK_00fe73d8;
    puStack_31c = (undefined4 *)&UNK_007bb292;
    func_0x0062e2d0();
    puStack_31c = (undefined4 *)auStack_24c;
    puStack_2c4 = &UNK_00736362;
    ppuStack_320 = &puStack_2c4;
    puStack_324 = &UNK_007bb2b0;
    iVar5 = (**(code **)(*(int *)*param_1 + 0x10))();
    if (((iVar5 == 0) || (piVar4 == (int *)0x0)) || (piVar2 == (int *)0x0)) goto LAB_007bb704;
    puStack_310 = (undefined4 *)&UNK_007bb2d8;
    func_0x0080c830();
    uStack_c = 2;
    bStack_218 = bStack_218 | 4;
    uStack_278 = *(undefined4 *)(*param_1 + 0xdc);
    puStack_310 = &uStack_280;
    uStack_280 = _DAT_012c856c;
    uStack_27c = 0;
    uStack_274 = 0xff;
    piStack_314 = (int *)&UNK_007bb32e;
    func_0x0080a7b0();
    uStack_29c = *(undefined4 *)(*param_1 + 0xdc);
    piStack_314 = &uStack_2a4;
    uStack_2a4 = _DAT_012c8570;
    uStack_2a0 = 0;
    uStack_298 = 0xff;
    puStack_318 = (undefined4 *)&UNK_007bb362;
    func_0x0080d8a0();
    iVar5 = *piVar2;
    puStack_318 = (undefined4 *)auStack_228;
    puStack_324 = &UNK_007bb38a;
    puStack_324 = (undefined *)(**(code **)(*piVar4 + 0x6c))();
    puStack_32c = &UNK_007bb398;
    iVar5 = (**(code **)(iVar5 + 8))();
    param_1[0xd4] = iVar5;
    if (iVar5 == 0) goto code_r0x007bb0d9;
    *(undefined1 *)(param_1 + 0x16b) = 4;
code_r0x007bb0be:
    param_1[0x166] = 0;
    param_1[0x167] = _DAT_00fe7ec8;
code_r0x007bb0d9:
    uStack_28 = 0xffffffff;
    puStack_32c = &UNK_007bb0f0;
    func_0x0080c8e0();
    *unaff_FS_OFFSET = iStack_30;
    return;
  case '\x04':
    if ((int *)param_1[0xd4] != (int *)0x0) {
      puStack_310 = (undefined4 *)&UNK_007bb3c6;
      iVar6 = (**(code **)(*(int *)param_1[0xd4] + 0x9c))();
      puStack_310 = (undefined4 *)&UNK_007bb3d9;
      iVar7 = (**(code **)(*(int *)param_1[0xd4] + 0x98))();
      iVar5 = _DAT_00fe7ec8;
      if (iVar7 < iVar6 + -3) goto LAB_007bb704;
    }
    *(undefined1 *)(param_1 + 0x16b) = 5;
code_r0x007bb64d:
    param_1[0x166] = 0;
    param_1[0x167] = iVar5;
    *unaff_FS_OFFSET = iStack_14;
    return;
  case '\x05':
    iVar6 = *(int *)(*(int *)(*param_1 + 0x2b5c) + 0x54);
    param_1[0x166] = 0;
    param_1[0x167] = iVar5;
    piVar4 = param_1 + 0xd2;
    piStack_2f8 = (int *)0x3;
    *(char *)(param_1 + 0x16b) = (iVar6 != 1) * '\x02' + '\x06';
    do {
      puStack_310 = (undefined4 *)*piVar4;
      if (puStack_310 != (undefined4 *)0x0) {
        if (piVar2 != (int *)0x0) {
          piStack_314 = (int *)&UNK_007bb444;
          (**(code **)(*piVar2 + 0x10))();
        }
        *piVar4 = 0;
      }
      piVar4 = piVar4 + 1;
      piStack_2f8 = (int *)((int)piStack_2f8 + -1);
    } while (piStack_2f8 != (int *)0x0);
    if ((*(char *)((int)param_1 + 0x5aa) != '\x01') && (*(char *)((int)param_1 + 0x5aa) != '\x03'))
    goto LAB_007bb704;
    apiStack_2ec[1] = (int *)_DAT_00f54f70;
    apiStack_2ec[2] = (int *)0x0;
    apiStack_2ec[3] = (int *)0x0;
    uStack_2db = 0;
    uStack_2da = 0;
    uStack_2d8 = 0;
    uStack_2d7 = 0;
    uStack_2d6 = 0;
    uStack_2d5 = 0;
    uStack_2d4 = 0;
    uStack_2dc = 0xff;
    uStack_2d9 = 0;
    uStack_2d0 = 0;
    uStack_c = 3;
    puStack_310 = (undefined4 *)0x0;
    piStack_314 = (int *)0x0;
    puStack_318 = &uStack_2d0;
    puStack_31c = (undefined4 *)0x0;
    ppuStack_320 = (undefined **)0x0;
    puStack_324 = (undefined *)0x1;
    uStack_328 = 0;
    puStack_32c = (undefined *)0x0;
    uStack_330 = 0;
    uStack_334 = 0x3f800000;
    if ((param_1[0x16d] & 0x4000U) == 0) {
      puStack_338 = &UNK_00fe7420;
      ppuStack_33c = (undefined4 **)&UNK_007bb56d;
      func_0x007b9030();
      ppuStack_33c = &piStack_314;
      puStack_340 = &UNK_00fe7430;
      puStack_344 = &UNK_007bb584;
      uVar8 = func_0x007b9920();
      puStack_348 = (undefined *)(uVar8 & 0xff);
      param_1[0x16c] = (int)puStack_348;
      if (puStack_348 != (undefined *)0x0) goto code_r0x007bb5dc;
      puStack_344 = puStack_348;
      func_0x007b9030(&UNK_00fe7440,0x3f800000,0,0,0,1,0,0,&stack0xfffffcfc);
      puVar9 = &UNK_00fe7450;
    }
    else {
      puStack_338 = &UNK_00fe73e0;
      ppuStack_33c = (undefined4 **)&UNK_007bb504;
      func_0x007b9030();
      ppuStack_33c = &piStack_314;
      puStack_340 = &UNK_00fe73f0;
      puStack_344 = &UNK_007bb51b;
      uVar8 = func_0x007b9920();
      puStack_348 = (undefined *)(uVar8 & 0xff);
      param_1[0x16c] = (int)puStack_348;
      if (puStack_348 != (undefined *)0x0) goto code_r0x007bb5dc;
      puStack_344 = puStack_348;
      func_0x007b9030(&UNK_00fe7400,0x3f800000,0,0,0,1,0,0,&stack0xfffffcfc);
      puVar9 = &UNK_00fe7410;
    }
    uVar8 = func_0x007b9920(puVar9,&puStack_348);
    param_1[0x16c] = uVar8 & 0xff;
code_r0x007bb5dc:
    puStack_344 = (undefined *)(uint)*(byte *)(param_1 + 0x16a);
    puStack_348 = &UNK_007bb5eb;
    func_0x0065bbc0();
    *unaff_FS_OFFSET = iStack_4c;
    return;
  case '\x06':
    fVar1 = (float)param_1[0x166];
    param_1[0x166] = (int)(fVar1 + param_2);
    if (_UNK_00fe8190 < (double)(fVar1 + param_2)) {
      *(undefined1 *)(param_1 + 0x16b) = 7;
      goto code_r0x007bb64d;
    }
    goto LAB_007bb704;
  case '\a':
    puStack_310 = (undefined4 *)
                  (float)(_DAT_00f598a0 - (double)(float)param_1[0x166] / _UNK_00fa7b18);
    piStack_314 = (int *)&UNK_007bb6a3;
    func_0x0065be30();
    fVar1 = (float)param_1[0x166];
    param_1[0x166] = (int)(fVar1 + param_2);
    if ((double)(fVar1 + param_2) <= _UNK_00fa7b18) goto LAB_007bb704;
    puStack_310 = (undefined4 *)_UNK_00fa4460;
    piStack_314 = (int *)&UNK_007bb6e2;
    func_0x0065be30();
    *(undefined1 *)(param_1 + 0x16b) = 8;
    break;
  default:
    goto LAB_007bb704;
  }
  param_1[0x166] = 0;
  param_1[0x167] = _DAT_00fe7ec8;
LAB_007bb704:
  *unaff_FS_OFFSET = iStack_14;
  return;
}


