===== 0x7ac7f0 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_007ac7f0(int *param_1)

{
  int iVar1;
  int *piVar2;
  undefined4 uVar3;
  
  switch((char)param_1[0x16a]) {
  case '\0':
    uVar3 = 0xcf;
    break;
  case '\x01':
    uVar3 = 0xcb;
    break;
  case '\x02':
    uVar3 = 0xe7;
    break;
  case '\x03':
    uVar3 = 0xcd;
    break;
  default:
    goto LAB_007ac887;
  case '\v':
    uVar3 = 0xd1;
    break;
  case '\r':
    uVar3 = 0xd5;
    break;
  case '\x0e':
    uVar3 = 0xd7;
    break;
  case '\x0f':
    uVar3 = 0xd9;
    break;
  case '\x1e':
    uVar3 = 0xdb;
    break;
  case '\x1f':
    uVar3 = 0xdd;
    break;
  case ' ':
    uVar3 = 0xdf;
    break;
  case '2':
  case '3':
    uVar3 = 0xe1;
    break;
  case 'F':
    uVar3 = 0xe3;
    break;
  case 'Q':
    uVar3 = 0xe5;
    break;
  case '[':
    uVar3 = 0xe9;
    break;
  case '\\':
    uVar3 = 0xeb;
  }
  func_0x0065aa70(uVar3);
LAB_007ac887:
  func_0x007ab150();
  iVar1 = *param_1;
  if (*(int *)(iVar1 + 0x103c) != -1) {
    piVar2 = (int *)(**(code **)(**(int **)(iVar1 + 0x1030) + 0x124))();
    (**(code **)(*piVar2 + 8))(*(undefined4 *)(iVar1 + 0x103c));
    *(undefined4 *)(iVar1 + 0x103c) = 0xffffffff;
  }
  func_0x007a5070();
  *(undefined1 *)(param_1 + 0x16b) = 1;
  param_1[0x166] = 0;
  param_1[0x167] = _DAT_00fe7ec8;
  return;
}


===== 0x7c0e10 =====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_007c0e10(int *param_1,float param_2)

{
  float fVar1;
  char cVar2;
  uint uVar3;
  int iVar4;
  undefined4 uVar5;
  int *unaff_FS_OFFSET;
  undefined4 auStack_74 [5];
  undefined4 auStack_60 [3];
  undefined4 uStack_54;
  undefined1 auStack_4c [20];
  undefined4 auStack_38 [8];
  int iStack_18;
  int iStack_14;
  int iStack_10;
  int iStack_c;
  undefined *puStack_8;
  int iStack_4;
  
  iStack_4 = -1;
  puStack_8 = &UNK_00ea9e31;
  iStack_c = *unaff_FS_OFFSET;
  uVar3 = _DAT_012ea8b0 ^ (uint)&stack0xffffff80;
  *unaff_FS_OFFSET = (int)&iStack_c;
  iVar4 = (**(code **)(*(int *)*param_1 + 0x268))(uVar3);
  if (iVar4 != 0) goto LAB_007c1cc7;
  switch(*(undefined1 *)((int)param_1 + 0x5ad)) {
  case 0:
    cVar2 = func_0x007a7220();
    if (cVar2 != '\0') {
      cVar2 = *(char *)((int)param_1 + 0x5aa);
      if (((cVar2 == '\0') || (cVar2 == '\x0f')) || (cVar2 == 'F')) {
        func_0x0065bbc0(cVar2);
      }
      func_0x007b69d0();
      param_1[0x16d] = param_1[0x16d] & 0xffffcbff;
      uVar3 = param_1[0x16d];
      switch(*(undefined1 *)((int)param_1 + 0x5a9)) {
      case 0:
        cVar2 = *(char *)((int)param_1 + 0x5aa);
        switch(cVar2) {
        case '\x01':
        case '\x03':
          param_1[0x16d] = uVar3 & 0xffffbfff;
          *(char *)(param_1 + 0x16a) = cVar2;
          *(char *)((int)param_1 + 0x5a9) = cVar2;
          FUN_007ac7f0();
          *unaff_FS_OFFSET = iStack_c;
          return;
        case '\x02':
          *(char *)(param_1 + 0x16a) = cVar2;
          *(undefined1 *)((int)param_1 + 0x5ad) = 4;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        default:
          if (cVar2 == '\x1f' || cVar2 == ' ') {
            *(undefined1 *)(param_1 + 0x16a) = 0x1e;
            *(undefined1 *)((int)param_1 + 0x5ad) = 6;
            *(undefined1 *)((int)param_1 + 0x5ae) = 1;
            *unaff_FS_OFFSET = iStack_c;
            return;
          }
          *(char *)(param_1 + 0x16a) = cVar2;
          *(undefined1 *)((int)param_1 + 0x5ad) = 6;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        case '\v':
        case '\r':
          *(char *)(param_1 + 0x16a) = cVar2;
          *(undefined1 *)((int)param_1 + 0x5ad) = 2;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        case '\x0f':
          *(char *)(param_1 + 0x16a) = cVar2;
          *(undefined1 *)((int)param_1 + 0x5ad) = 8;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        case 'F':
          goto code_r0x007c0f9d;
        case '\\':
          *(char *)(param_1 + 0x16a) = cVar2;
          *(undefined1 *)((int)param_1 + 0x5ad) = 10;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        }
      case 1:
      case 3:
        param_1[0x169] = 0;
        *(undefined1 *)((int)param_1 + 0x5ad) = 0xe;
        *(undefined1 *)(param_1 + 0x16a) = 0;
        func_0x007b8d40(&UNK_00fe7270);
        *unaff_FS_OFFSET = iStack_10;
        return;
      case 2:
        cVar2 = *(char *)((int)param_1 + 0x5aa);
        if ((cVar2 != '\x01') && (cVar2 != '\x03')) {
          *(undefined1 *)(param_1 + 0x16a) = 0;
          *(undefined1 *)((int)param_1 + 0x5ad) = 5;
          *(undefined1 *)((int)param_1 + 0x5ae) = 1;
          *unaff_FS_OFFSET = iStack_c;
          return;
        }
        param_1[0x16d] = uVar3 | 0x4000;
        *(char *)(param_1 + 0x16a) = cVar2;
        *(char *)((int)param_1 + 0x5a9) = cVar2;
        FUN_007ac7f0();
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0xb:
      case 0xd:
        *(undefined1 *)(param_1 + 0x16a) = 0;
        *(undefined1 *)((int)param_1 + 0x5ad) = 3;
        *(undefined1 *)((int)param_1 + 0x5ae) = 1;
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0xf:
        *(undefined1 *)(param_1 + 0x16a) = 0;
        *(undefined1 *)((int)param_1 + 0x5ad) = 9;
        *(undefined1 *)((int)param_1 + 0x5ae) = 1;
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0x1e:
        if (*(char *)((int)param_1 + 0x5aa) == '\x1f') {
          *(undefined1 *)(param_1 + 0x16a) = 0x1f;
          uVar5 = func_0x007c4630(auStack_60,param_1,&UNK_007a3d80);
          iStack_4 = 0;
          func_0x008bf550(uVar5,0);
          iStack_4 = -1;
          auStack_60[0] = 0;
          switch((char)param_1[0x16a]) {
          case '\0':
code_r0x007c137d:
            func_0x0065aa70(0xcf);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x01':
code_r0x007c1355:
            func_0x0065aa70(0xcb);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x02':
code_r0x007c1535:
            func_0x0065aa70(0xe7);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x03':
code_r0x007c0fba:
            func_0x0065aa70(0xcd);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          default:
code_r0x007c1591:
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_c;
            return;
          case '\v':
code_r0x007c13a5:
            func_0x0065aa70(0xd1);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\r':
code_r0x007c13cd:
            func_0x0065aa70(0xd5);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x0e':
code_r0x007c13f5:
            func_0x0065aa70(0xd7);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x0f':
code_r0x007c141d:
            func_0x0065aa70(0xd9);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x1e':
code_r0x007c1445:
            func_0x0065aa70(0xdb);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\x1f':
code_r0x007c146d:
            func_0x0065aa70(0xdd);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case ' ':
code_r0x007c1495:
            func_0x0065aa70(0xdf);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '2':
          case '3':
code_r0x007c14bd:
            func_0x0065aa70(0xe1);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case 'F':
code_r0x007c14e5:
            func_0x0065aa70(0xe3);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case 'Q':
code_r0x007c150d:
            func_0x0065aa70(0xe5);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '[':
code_r0x007c155d:
            func_0x0065aa70(0xe9);
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_10;
            return;
          case '\\':
            goto code_r0x007c1585;
          }
        }
        if (*(char *)((int)param_1 + 0x5aa) == ' ') {
          *(undefined1 *)(param_1 + 0x16a) = 0x20;
          uVar5 = func_0x007c4630(auStack_74,param_1,&UNK_007a3d80);
          iStack_4 = 1;
          func_0x008bf640(uVar5,0);
          iStack_4 = -1;
          auStack_74[0] = 0;
          switch((char)param_1[0x16a]) {
          case '\0':
            goto code_r0x007c137d;
          case '\x01':
            goto code_r0x007c1355;
          case '\x02':
            goto code_r0x007c1535;
          case '\x03':
            goto code_r0x007c0fba;
          default:
            goto code_r0x007c1591;
          case '\v':
            goto code_r0x007c13a5;
          case '\r':
            goto code_r0x007c13cd;
          case '\x0e':
            goto code_r0x007c13f5;
          case '\x0f':
            goto code_r0x007c141d;
          case '\x1e':
            goto code_r0x007c1445;
          case '\x1f':
            goto code_r0x007c146d;
          case ' ':
            goto code_r0x007c1495;
          case '2':
          case '3':
            goto code_r0x007c14bd;
          case 'F':
            goto code_r0x007c14e5;
          case 'Q':
            goto code_r0x007c150d;
          case '[':
            goto code_r0x007c155d;
          case '\\':
code_r0x007c1585:
            func_0x0065aa70(0xeb);
            goto code_r0x007c1591;
          }
        }
        goto code_r0x007c1137;
      case 0x1f:
      case 0x20:
        *(undefined1 *)(param_1 + 0x16a) = 0x1e;
        uVar5 = func_0x007c4630(auStack_4c,param_1,&UNK_007a3d80);
        iStack_4 = 2;
        func_0x008bf450(uVar5,0);
        iStack_c = -1;
        uStack_54 = 0;
        switch((char)param_1[0x16a]) {
        case '\0':
          func_0x0065aa70(0xcf);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x01':
          func_0x0065aa70(0xcb);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x02':
          func_0x0065aa70(0xe7);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x03':
          func_0x0065aa70(0xcd);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\v':
          func_0x0065aa70(0xd1);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\r':
          func_0x0065aa70(0xd5);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x0e':
          func_0x0065aa70(0xd7);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x0f':
          func_0x0065aa70(0xd9);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x1e':
          func_0x0065aa70(0xdb);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\x1f':
          func_0x0065aa70(0xdd);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case ' ':
          func_0x0065aa70(0xdf);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '2':
        case '3':
          func_0x0065aa70(0xe1);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case 'F':
          func_0x0065aa70(0xe3);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case 'Q':
          func_0x0065aa70(0xe5);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '[':
          func_0x0065aa70(0xe9);
          *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
          *unaff_FS_OFFSET = iStack_18;
          return;
        case '\\':
          func_0x0065aa70(0xeb);
        }
        *(undefined1 *)((int)param_1 + 0x5ad) = 0xc;
        *unaff_FS_OFFSET = iStack_14;
        return;
      case 0x32:
      case 0x33:
        cVar2 = *(char *)((int)param_1 + 0x5aa);
        if (cVar2 == '2' || cVar2 == '3') {
          *(char *)(param_1 + 0x16a) = cVar2;
          func_0x007ba850();
          *unaff_FS_OFFSET = iStack_c;
          return;
        }
code_r0x007c1137:
        *(undefined1 *)(param_1 + 0x16a) = 0;
        *(undefined1 *)((int)param_1 + 0x5ad) = 7;
        *(undefined1 *)((int)param_1 + 0x5ae) = 1;
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0x46:
        *(undefined1 *)(param_1 + 0x16a) = 0;
        func_0x0065aa70(0xcf);
        func_0x007ba850();
        *unaff_FS_OFFSET = iStack_10;
        return;
      case 0x51:
        cVar2 = *(char *)((int)param_1 + 0x5aa);
        if (cVar2 != '\x01') {
          if (cVar2 == '\x02') {
            *(undefined1 *)(param_1 + 0x16a) = 2;
            uVar5 = func_0x006690d0();
            cVar2 = func_0x007b9920(&UNK_00fe7260,uVar5);
            if (cVar2 != '\0') {
              func_0x0065b1e0(2,0xf,0xffffffff,0,0x3f800000);
            }
            *(undefined4 *)(*param_1 + 0xdc4) = _DAT_01042f88;
            func_0x007afd90();
            func_0x007ba850();
            *unaff_FS_OFFSET = iStack_14;
            return;
          }
          if (cVar2 != '\x03') goto code_r0x007c1137;
        }
        param_1[0x16d] = uVar3 | 0x4000;
        *(char *)(param_1 + 0x16a) = cVar2;
        *(char *)((int)param_1 + 0x5a9) = cVar2;
        FUN_007ac7f0();
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0x5c:
        *(undefined1 *)(param_1 + 0x16a) = 0;
        *(undefined1 *)((int)param_1 + 0x5ad) = 0xb;
        *(undefined1 *)((int)param_1 + 0x5ae) = 1;
        *unaff_FS_OFFSET = iStack_c;
        return;
      case 0xff:
        *(undefined1 *)((int)param_1 + 0x5ad) = 1;
        *(undefined1 *)((int)param_1 + 0x5ae) = 1;
        if (*(char *)((int)param_1 + 0x5aa) != '\v') {
          *(char *)(param_1 + 0x16a) = *(char *)((int)param_1 + 0x5aa);
          *unaff_FS_OFFSET = iStack_c;
          return;
        }
        *(undefined1 *)(param_1 + 0x16a) = 0;
        *unaff_FS_OFFSET = iStack_c;
        return;
      }
    }
    break;
  case 1:
    func_0x007bc110();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 2:
    func_0x007bc5c0();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 3:
    func_0x007bc9c0();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 4:
    func_0x007bcc80();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 5:
    func_0x007bd120();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 6:
    func_0x007bd660();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 7:
    func_0x007bdae0();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 8:
    func_0x007bdf80();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 9:
    func_0x007be450();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 10:
    func_0x007be9e0();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 0xb:
    func_0x007bedd0();
    *unaff_FS_OFFSET = iStack_c;
    return;
  case 0xc:
    uVar3 = param_1[0x16d] & 0x2000;
    goto joined_r0x007c1ab2;
  case 0xd:
    uVar3 = param_1[0x16d] & 0x1000;
joined_r0x007c1ab2:
    if (uVar3 != 0) {
code_r0x007c1cb9:
      func_0x007ba850();
      *(undefined1 *)((int)param_1 + 0x5ad) = 0;
    }
    break;
  case 0xe:
    fVar1 = (float)param_1[0x169];
    param_1[0x169] = (int)(param_2 + fVar1);
    if (_UNK_00fa7b18 < (double)(param_2 + fVar1)) {
      param_2 = (float)CONCAT31(param_2._1_3_,(char)param_1[0x16c]);
      cVar2 = func_0x007ad4f0(param_2,&param_2);
      if ((cVar2 != '\0') && (*(char *)(iStack_4 + 0x60) != '\x02')) {
        func_0x007a9470(iStack_4,2);
      }
      *(undefined1 *)((int)param_1 + 0x5ad) = 0xf;
      *unaff_FS_OFFSET = iStack_14;
      return;
    }
    break;
  case 0xf:
    cVar2 = func_0x007ad830();
    if ((cVar2 == '\0') && (cVar2 = func_0x007ac240(&UNK_00fe727c), cVar2 != '\0')) {
      cVar2 = func_0x00665140(0,1);
      if (cVar2 != '\0') {
        func_0x0065b140();
        param_1[0x16d] = param_1[0x16d] | 0x400;
      }
      *(undefined1 *)((int)param_1 + 0x5ad) = 0x10;
      *unaff_FS_OFFSET = iStack_14;
      return;
    }
    break;
  case 0x10:
    cVar2 = func_0x007a4100();
    if ((cVar2 != '\0') || ((param_1[0x16d] & 0x400U) != 0)) break;
    func_0x007b1420();
    uVar5 = func_0x007c4630(auStack_38,param_1,&UNK_007a3d80);
    iStack_4 = 3;
    func_0x008c0910(uVar5,0,0);
    iStack_4 = -1;
    auStack_38[0] = 0;
    switch((char)param_1[0x16a]) {
    case '\0':
      uVar5 = 0xd0;
      break;
    case '\x01':
      uVar5 = 0xcc;
      break;
    case '\x02':
      uVar5 = 0xe8;
      break;
    case '\x03':
      uVar5 = 0xce;
      break;
    default:
      goto code_r0x007c1cb9;
    case '\v':
      uVar5 = 0xd2;
      break;
    case '\r':
      uVar5 = 0xd6;
      break;
    case '\x0e':
      uVar5 = 0xd8;
      break;
    case '\x0f':
      uVar5 = 0xda;
      break;
    case '\x1e':
      uVar5 = 0xdc;
      break;
    case '\x1f':
      uVar5 = 0xde;
      break;
    case ' ':
      uVar5 = 0xe0;
      break;
    case '2':
    case '3':
      uVar5 = 0xe2;
      break;
    case 'F':
      uVar5 = 0xe4;
      break;
    case 'Q':
      uVar5 = 0xe6;
      break;
    case '[':
      uVar5 = 0xea;
      break;
    case '\\':
      uVar5 = 0xec;
    }
    func_0x0065aa70(uVar5);
    goto code_r0x007c1cb9;
  }
LAB_007c1cc7:
  *unaff_FS_OFFSET = iStack_c;
  return;
code_r0x007c0f9d:
  *(char *)(param_1 + 0x16a) = cVar2;
  switch(cVar2);
}


===== 0x7a3980 =====

void __fastcall FUN_007a3980(int param_1)

{
  if ((*(char *)(param_1 + 0x5aa) != '\x02') && (*(char *)(param_1 + 0x5aa) != 'Q')) {
    func_0x008bf770(10);
    return;
  }
  func_0x008bf020(10);
  return;
}


