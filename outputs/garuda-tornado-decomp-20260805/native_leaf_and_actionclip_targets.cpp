program=ffxivgame-ifrit.exe
image_base=00400000

===== 00ba4370 =====
entry=00ba4370
body=[[00ba4370, 00ba4429]]
completed=true
message=

void FUN_00ba4370(int param_1)

{
  int iVar1;
  char cVar2;
  int *piVar3;
  undefined4 in_XMM0_Da;
  int unaff_retaddr;
  
  iVar1 = param_1;
  piVar3 = (int *)func_0x00e3a460(param_1);
  func_0x00bb3bd0(&param_1);
  if ((*(byte *)(iVar1 + 0x1d) & 1) == 0) {
    cVar2 = *(char *)(iVar1 + 0x1c);
    if (cVar2 == '\x05') {
      if (*(int *)(iVar1 + 0x14) <= unaff_retaddr) {
        (**(code **)(*piVar3 + 0x40))(1);
        *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
        *(undefined1 *)(iVar1 + 0x1c) = 1;
      }
    }
    else if (cVar2 == '\x06') {
      cVar2 = func_0x00bb35d0(1);
      if (cVar2 != '\0') {
        *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
        *(int *)(iVar1 + 0x14) = unaff_retaddr;
        *(undefined1 *)(iVar1 + 0x1c) = 2;
        func_0x00ba42a0();
        *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
        return;
      }
    }
    else if (cVar2 == '\a') {
      cVar2 = func_0x00bb35d0(1);
      if (cVar2 != '\0') {
        func_0x00bb35e0(1);
        *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
        *(int *)(iVar1 + 0x14) = unaff_retaddr;
        *(undefined1 *)(iVar1 + 0x1c) = 3;
        func_0x00ba42a0();
        *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
        return;
      }
    }
  }
  func_0x00ba42a0();
  *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
  return;
}


-- listing --
00ba4370  PUSH EBX
00ba4371  PUSH EBP
00ba4372  PUSH ESI
00ba4373  MOV ESI,dword ptr [ESP + 0x10]
00ba4377  PUSH EDI
00ba4378  PUSH ESI
00ba4379  CALL 0x00e3a460
00ba437e  MOV EDI,EAX
00ba4380  ADD ESP,0x4
00ba4383  LEA EAX,[ESP + 0x14]
00ba4387  PUSH EAX
00ba4388  MOV ECX,EDI
00ba438a  CALL 0x00bb3bd0
00ba438f  MOV EBP,dword ptr [ESP + 0x14]
00ba4393  MOV EBX,0x1
00ba4398  TEST byte ptr [ESI + 0x1d],BL
00ba439b  JNZ 0x00ba4419
00ba439d  MOVZX EAX,byte ptr [ESI + 0x1c]
00ba43a1  SUB EAX,0x5
00ba43a4  JZ 0x00ba4404
00ba43a6  SUB EAX,EBX
00ba43a8  JZ 0x00ba43dd
00ba43aa  SUB EAX,EBX
00ba43ac  JNZ 0x00ba4419
00ba43ae  PUSH EBX
00ba43af  MOV ECX,EDI
00ba43b1  CALL 0x00bb35d0
00ba43b6  TEST AL,AL
00ba43b8  JZ 0x00ba4419
00ba43ba  PUSH EBX
00ba43bb  MOV ECX,EDI
00ba43bd  CALL 0x00bb35e0
00ba43c2  OR byte ptr [ESI + 0x1d],BL
00ba43c5  MOV EAX,EBP
00ba43c7  MOV dword ptr [ESI + 0x14],EBP
00ba43ca  MOV byte ptr [ESI + 0x1c],0x3
00ba43ce  CALL 0x00ba42a0
00ba43d3  POP EDI
00ba43d4  MOVSS dword ptr [ESI + 0x10],XMM0
00ba43d9  POP ESI
00ba43da  POP EBP
00ba43db  POP EBX
00ba43dc  RET
00ba43dd  PUSH EBX
00ba43de  MOV ECX,EDI
00ba43e0  CALL 0x00bb35d0
00ba43e5  TEST AL,AL
00ba43e7  JZ 0x00ba4419
00ba43e9  OR byte ptr [ESI + 0x1d],BL
00ba43ec  MOV EAX,EBP
00ba43ee  MOV dword ptr [ESI + 0x14],EBP
00ba43f1  MOV byte ptr [ESI + 0x1c],0x2
00ba43f5  CALL 0x00ba42a0
00ba43fa  POP EDI
00ba43fb  MOVSS dword ptr [ESI + 0x10],XMM0
00ba4400  POP ESI
00ba4401  POP EBP
00ba4402  POP EBX
00ba4403  RET
00ba4404  CMP dword ptr [ESI + 0x14],EBP
00ba4407  JG 0x00ba4419
00ba4409  MOV EDX,dword ptr [EDI]
00ba440b  MOV EAX,dword ptr [EDX + 0x40]
00ba440e  PUSH EBX
00ba440f  MOV ECX,EDI
00ba4411  CALL EAX
00ba4413  OR byte ptr [ESI + 0x1d],BL
00ba4416  MOV byte ptr [ESI + 0x1c],BL
00ba4419  MOV EAX,EBP
00ba441b  CALL 0x00ba42a0
00ba4420  POP EDI
00ba4421  MOVSS dword ptr [ESI + 0x10],XMM0
00ba4426  POP ESI
00ba4427  POP EBP
00ba4428  POP EBX
00ba4429  RET

===== 00ba4440 =====
entry=00ba4440
body=[[00ba4440, 00ba4488] [00ba44aa, 00ba44c2]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba4440(int param_1,undefined4 param_2,undefined4 *param_3)

{
  int iVar1;
  undefined4 uVar2;
  
  *(undefined4 *)(param_1 + 0x10) = _DAT_00f54f70;
  *(undefined1 *)(param_1 + 0x1d) = 0;
  iVar1 = func_0x00e3a460(param_1);
  *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(*(int *)(iVar1 + 0x10) + 0x44);
  *(undefined4 *)(param_1 + 0x18) = 150000;
  *(undefined1 *)(param_1 + 0x1c) = *(undefined1 *)(param_3 + 2);
  switch(*(undefined1 *)(param_3 + 2)) {
  case 0:
    *(undefined1 *)(param_1 + 0x1c) = 1;
    return;
  case 1:
  case 6:
  case 7:
    break;
  case 2:
  case 4:
    *(undefined4 *)(param_1 + 0x14) = *param_3;
    return;
  case 3:
    *(undefined4 *)(param_1 + 0x14) = *param_3;
    *(undefined4 *)(param_1 + 0x18) = param_3[1];
    return;
  case 5:
    *(undefined4 *)(param_1 + 0x14) = *param_3;
    return;
  default:
    uVar2 = func_0x00415c90(&UNK_010bb088);
    func_0x00416060(uVar2);
    *(undefined1 *)(param_1 + 0x1c) = 0;
  }
  return;
}


-- listing --
00ba4440  MOVSS XMM0,dword ptr [0x00f54f70]
00ba4448  PUSH ESI
00ba4449  MOV ESI,dword ptr [ESP + 0x8]
00ba444d  PUSH ESI
00ba444e  MOVSS dword ptr [ESI + 0x10],XMM0
00ba4453  MOV byte ptr [ESI + 0x1d],0x0
00ba4457  CALL 0x00e3a460
00ba445c  MOV EAX,dword ptr [EAX + 0x10]
00ba445f  MOV ECX,dword ptr [EAX + 0x44]
00ba4462  MOV EAX,dword ptr [ESP + 0x14]
00ba4466  MOV dword ptr [ESI + 0x14],ECX
00ba4469  MOV dword ptr [ESI + 0x18],0x249f0
00ba4470  MOV DL,byte ptr [EAX + 0x8]
00ba4473  MOV byte ptr [ESI + 0x1c],DL
00ba4476  MOVZX ECX,byte ptr [EAX + 0x8]
00ba447a  ADD ESP,0x4
00ba447d  CMP ECX,0x7
00ba4480  JA 0x00ba44aa
00ba4482  JMP dword ptr [ECX*0x4 + 0xba44c4]
00ba44aa  PUSH 0x10bb088
00ba44af  CALL 0x00415c90
00ba44b4  PUSH EAX
00ba44b5  CALL 0x00416060
00ba44ba  ADD ESP,0x8
00ba44bd  MOV byte ptr [ESI + 0x1c],0x0
00ba44c1  POP ESI
00ba44c2  RET

===== 00ba45a0 =====
entry=00ba45a0
body=[[00ba45a0, 00ba45ba] [00ba46e9, 00ba473c]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba45a0(int param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  
  switch(*param_2) {
  case 0:
    if (*(float *)(param_1 + 0x10) != _DAT_01086650) {
      *(undefined1 *)(param_2 + 1) = 1;
      return;
    }
    *(undefined1 *)(param_2 + 1) = 0;
    return;
  case 1:
    switch(param_2[1]) {
    case 0:
      *(undefined1 *)(param_1 + 0x1c) = 1;
      FUN_00ba4370(param_1,0,0);
      return;
    case 1:
      *(undefined1 *)(param_1 + 0x1c) = 2;
      FUN_00ba4370(param_1,0,0);
      return;
    case 2:
      *(undefined1 *)(param_1 + 0x1c) = 3;
      FUN_00ba4370(param_1,0,0);
      return;
    case 3:
      *(byte *)(param_1 + 0x1d) = *(byte *)(param_1 + 0x1d) & 0xfe;
      *(undefined1 *)(param_1 + 0x1c) = 5;
      FUN_00ba4370(param_1,0,0);
      return;
    case 4:
      *(byte *)(param_1 + 0x1d) = *(byte *)(param_1 + 0x1d) & 0xfe;
      *(undefined1 *)(param_1 + 0x1c) = 7;
      FUN_00ba4370(param_1,0,0);
      return;
    }
    break;
  case 2:
    *(undefined4 *)(param_1 + 0x14) = param_2[1];
    FUN_00ba4370(param_1,0,0);
    return;
  case 3:
    *(undefined4 *)(param_1 + 0x18) = param_2[1];
    FUN_00ba4370(param_1,0,0);
    return;
  case 4:
    if (((((double)*(float *)(param_1 + 0x10) <= _DAT_00f62f70) ||
         (_DAT_00f54f70 <= *(float *)(param_1 + 0x10))) && (*(char *)(param_1 + 0x1c) != '\a')) &&
       (*(char *)(param_1 + 0x1c) != '\x03')) {
      *(undefined1 *)(param_2 + 1) = 0;
      FUN_00ba4370(param_1,0,0);
      return;
    }
    *(undefined1 *)(param_2 + 1) = 1;
    FUN_00ba4370(param_1,0,0);
    return;
  case 5:
    param_2[1] = _DAT_00f54f70;
    FUN_00ba4370(param_1,0,0);
    return;
  default:
    uVar1 = func_0x00415c90(0,&UNK_010bb104);
    func_0x004160e0(uVar1);
    func_0x00415c90(100);
    func_0x00415a00();
    func_0x00406550(&UNK_00f56510,&UNK_00f54d48,&UNK_010bb0ac,0x19b,&UNK_010bb0c4);
  }
  FUN_00ba4370(param_1,0,0);
  return;
}


-- listing --
00ba45a0  MOV ECX,dword ptr [ESP + 0x8]
00ba45a4  MOV EAX,dword ptr [ECX]
00ba45a6  CMP EAX,0x5
00ba45a9  PUSH ESI
00ba45aa  MOV ESI,dword ptr [ESP + 0x8]
00ba45ae  JA 0x00ba46e9
00ba45b4  JMP dword ptr [EAX*0x4 + 0xba4740]
00ba46e9  PUSH 0x10bb104
00ba46ee  PUSH 0x0
00ba46f0  CALL 0x00415c90
00ba46f5  PUSH EAX
00ba46f6  CALL 0x004160e0
00ba46fb  ADD ESP,0xc
00ba46fe  PUSH 0x64
00ba4700  CALL 0x00415c90
00ba4705  MOV ECX,EAX
00ba4707  CALL 0x00415a00
00ba470c  PUSH 0x10bb0c4
00ba4711  PUSH 0x19b
00ba4716  PUSH 0x10bb0ac
00ba471b  PUSH 0xf54d48
00ba4720  PUSH 0xf56510
00ba4725  LEA ECX,[ESP + 0x1c]
00ba4729  CALL 0x00406550
00ba472e  PUSH 0x0
00ba4730  PUSH 0x0
00ba4732  PUSH ESI
00ba4733  CALL 0x00ba4370
00ba4738  ADD ESP,0xc
00ba473b  POP ESI
00ba473c  RET

===== 00d589f0 =====
entry=00d589f0
body=[[00d589f0, 00d58aa9]]
completed=true
message=

void FUN_00d589f0(int param_1)

{
  int iVar1;
  char cVar2;
  int *piVar3;
  undefined4 in_XMM0_Da;
  undefined4 unaff_retaddr;
  
  iVar1 = param_1;
  piVar3 = (int *)func_0x00e3a460(param_1);
  func_0x00bb3bd0(&param_1);
  if ((*(byte *)(iVar1 + 0x1d) & 1) == 0) {
    *(undefined4 *)(iVar1 + 0x14) = unaff_retaddr;
    cVar2 = *(char *)(iVar1 + 0x1c);
    if (cVar2 == '\x05') {
      (**(code **)(*piVar3 + 0x40))(1);
      *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
      *(undefined1 *)(iVar1 + 0x1c) = 1;
    }
    else if (cVar2 == '\x06') {
      cVar2 = func_0x00bb35d0(1);
      if (cVar2 != '\0') {
        *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
        *(undefined4 *)(iVar1 + 0x14) = unaff_retaddr;
        *(undefined1 *)(iVar1 + 0x1c) = 2;
        func_0x00d58910();
        *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
        return;
      }
    }
    else if (cVar2 == '\a') {
      cVar2 = func_0x00bb35d0(1);
      if (cVar2 != '\0') {
        func_0x00bb35e0(1);
        *(byte *)(iVar1 + 0x1d) = *(byte *)(iVar1 + 0x1d) | 1;
        *(undefined4 *)(iVar1 + 0x14) = unaff_retaddr;
        *(undefined1 *)(iVar1 + 0x1c) = 3;
        func_0x00d58910();
        *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
        return;
      }
    }
  }
  func_0x00d58910();
  *(undefined4 *)(iVar1 + 0x10) = in_XMM0_Da;
  return;
}


-- listing --
00d589f0  PUSH EBX
00d589f1  PUSH EBP
00d589f2  PUSH ESI
00d589f3  MOV ESI,dword ptr [ESP + 0x10]
00d589f7  PUSH EDI
00d589f8  PUSH ESI
00d589f9  CALL 0x00e3a460
00d589fe  MOV EDI,EAX
00d58a00  ADD ESP,0x4
00d58a03  LEA EAX,[ESP + 0x14]
00d58a07  PUSH EAX
00d58a08  MOV ECX,EDI
00d58a0a  CALL 0x00bb3bd0
00d58a0f  MOV EAX,dword ptr [ESP + 0x14]
00d58a13  MOV EBX,0x1
00d58a18  TEST byte ptr [ESI + 0x1d],BL
00d58a1b  MOV EBP,EAX
00d58a1d  JNZ 0x00d58a99
00d58a1f  MOV dword ptr [ESI + 0x14],EAX
00d58a22  MOVZX EAX,byte ptr [ESI + 0x1c]
00d58a26  SUB EAX,0x5
00d58a29  JZ 0x00d58a89
00d58a2b  SUB EAX,EBX
00d58a2d  JZ 0x00d58a62
00d58a2f  SUB EAX,EBX
00d58a31  JNZ 0x00d58a99
00d58a33  PUSH EBX
00d58a34  MOV ECX,EDI
00d58a36  CALL 0x00bb35d0
00d58a3b  TEST AL,AL
00d58a3d  JZ 0x00d58a99
00d58a3f  PUSH EBX
00d58a40  MOV ECX,EDI
00d58a42  CALL 0x00bb35e0
00d58a47  OR byte ptr [ESI + 0x1d],BL
00d58a4a  MOV EAX,EBP
00d58a4c  MOV dword ptr [ESI + 0x14],EBP
00d58a4f  MOV byte ptr [ESI + 0x1c],0x3
00d58a53  CALL 0x00d58910
00d58a58  POP EDI
00d58a59  MOVSS dword ptr [ESI + 0x10],XMM0
00d58a5e  POP ESI
00d58a5f  POP EBP
00d58a60  POP EBX
00d58a61  RET
00d58a62  PUSH EBX
00d58a63  MOV ECX,EDI
00d58a65  CALL 0x00bb35d0
00d58a6a  TEST AL,AL
00d58a6c  JZ 0x00d58a99
00d58a6e  OR byte ptr [ESI + 0x1d],BL
00d58a71  MOV EAX,EBP
00d58a73  MOV dword ptr [ESI + 0x14],EBP
00d58a76  MOV byte ptr [ESI + 0x1c],0x2
00d58a7a  CALL 0x00d58910
00d58a7f  POP EDI
00d58a80  MOVSS dword ptr [ESI + 0x10],XMM0
00d58a85  POP ESI
00d58a86  POP EBP
00d58a87  POP EBX
00d58a88  RET
00d58a89  MOV EDX,dword ptr [EDI]
00d58a8b  MOV EAX,dword ptr [EDX + 0x40]
00d58a8e  PUSH EBX
00d58a8f  MOV ECX,EDI
00d58a91  CALL EAX
00d58a93  OR byte ptr [ESI + 0x1d],BL
00d58a96  MOV byte ptr [ESI + 0x1c],BL
00d58a99  MOV EAX,EBP
00d58a9b  CALL 0x00d58910
00d58aa0  POP EDI
00d58aa1  MOVSS dword ptr [ESI + 0x10],XMM0
00d58aa6  POP ESI
00d58aa7  POP EBP
00d58aa8  POP EBX
00d58aa9  RET

===== 0082fb30 =====
entry=0082fb30
body=[[0082fb30, 0082fba1]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __thiscall FUN_0082fb30(undefined4 *param_1,undefined4 param_2,undefined4 param_3)

{
  uint uVar1;
  int unaff_ESI;
  int *unaff_FS_OFFSET;
  int iStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eb1e28;
  iStack_c = *unaff_FS_OFFSET;
  uVar1 = _DAT_012ea8b0 ^ (uint)&stack0xffffffec;
  *unaff_FS_OFFSET = (int)&iStack_c;
  func_0x00a179c0(param_2,param_3,uVar1);
  *param_1 = &UNK_01033bec;
  param_1[2] = &UNK_01033be0;
  param_1[0xe] = &UNK_01033b54;
  *unaff_FS_OFFSET = unaff_ESI;
  return param_1;
}


-- listing --
0082fb30  PUSH -0x1
0082fb32  PUSH 0xeb1e28
0082fb37  MOV EAX,FS:[0x0]
0082fb3d  PUSH EAX
0082fb3e  PUSH ECX
0082fb3f  PUSH ESI
0082fb40  MOV EAX,[0x012ea8b0]
0082fb45  XOR EAX,ESP
0082fb47  PUSH EAX
0082fb48  LEA EAX,[ESP + 0xc]
0082fb4c  MOV FS:[0x0],EAX
0082fb52  MOV ESI,ECX
0082fb54  MOV dword ptr [ESP + 0x8],ESI
0082fb58  MOV EAX,dword ptr [ESP + 0x20]
0082fb5c  MOV ECX,dword ptr [ESP + 0x1c]
0082fb60  PUSH EAX
0082fb61  PUSH ECX
0082fb62  MOV ECX,ESI
0082fb64  CALL 0x00a179c0
0082fb69  MOV dword ptr [ESP + 0x14],0x0
0082fb71  MOV dword ptr [ESI],0x1033bec
0082fb77  MOV dword ptr [ESI + 0x8],0x1033be0
0082fb7e  MOV dword ptr [ESI + 0x38],0x1033b54
0082fb85  MOV dword ptr [ESP + 0x14],0xffffffff
0082fb8d  MOV EAX,ESI
0082fb8f  MOV ECX,dword ptr [ESP + 0xc]
0082fb93  MOV dword ptr FS:[0x0],ECX
0082fb9a  POP ECX
0082fb9b  POP ESI
0082fb9c  ADD ESP,0x10
0082fb9f  RET 0x8

===== 0082fd20 =====
entry=0082fd20
body=[[0082fd20, 0082fdba] [0082fdc0, 0082fe64]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_0082fd20(int param_1)

{
  char cVar1;
  uint uVar2;
  undefined4 uVar3;
  int *piVar4;
  int iVar5;
  int *piVar6;
  int iVar7;
  undefined4 uVar8;
  int *unaff_FS_OFFSET;
  int iVar9;
  int iStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eb1e6e;
  iStack_c = *unaff_FS_OFFSET;
  uVar2 = _DAT_012ea8b0 ^ (uint)&stack0xffffffc0;
  *unaff_FS_OFFSET = (int)&iStack_c;
  if ((*(char *)(param_1 + 0x40) != '\0') && (*(int *)(*(int *)(param_1 + 0x3c) + 0x34) != 0)) {
    iVar5 = *(int *)(param_1 + 0x14);
    func_0x00a1ff70(*(int *)(param_1 + 0x3c),uVar2);
    puStack_8 = (undefined *)0x0;
    uVar3 = FUN_00a1ffa0(*(undefined1 *)(iVar5 + 3));
    piVar4 = (int *)(**(code **)(**(int **)(param_1 + 0x24) + 0xc))();
    if (piVar4 != (int *)0x0) {
      iVar5 = func_0x00a21460();
      iVar9 = 0;
      if (0 < iVar5) {
        do {
          piVar6 = (int *)func_0x00a21430(iVar9);
          if (((piVar6 != (int *)0x0) && (iVar7 = (**(code **)(*piVar6 + 0x2c))(), iVar7 == 2)) &&
             (cVar1 = (**(code **)(*piVar6 + 0x4c))(), cVar1 == '\0')) {
            uVar8 = (**(code **)(*piVar6 + 0x14))(_DAT_012ce7d4,0xf);
            uVar8 = func_0x00a1b700(uVar8);
            iVar7 = func_0x009d5475(uVar8);
            if ((iVar7 == 0) && (piVar6[0x10] != 0)) {
              (**(code **)(*piVar4 + 0x20))(param_1,uVar3,piVar6[0x10]);
            }
          }
          iVar9 = iVar9 + 1;
        } while (iVar9 < iVar5);
      }
    }
    iStack_c = -1;
    func_0x00a1ff90();
  }
  *unaff_FS_OFFSET = iStack_c;
  return;
}


-- listing --
0082fd20  PUSH -0x1
0082fd22  PUSH 0xeb1e6e
0082fd27  MOV EAX,FS:[0x0]
0082fd2d  PUSH EAX
0082fd2e  SUB ESP,0x24
0082fd31  PUSH EBX
0082fd32  PUSH EBP
0082fd33  PUSH ESI
0082fd34  PUSH EDI
0082fd35  MOV EAX,[0x012ea8b0]
0082fd3a  XOR EAX,ESP
0082fd3c  PUSH EAX
0082fd3d  LEA EAX,[ESP + 0x38]
0082fd41  MOV FS:[0x0],EAX
0082fd47  MOV EDI,ECX
0082fd49  CMP byte ptr [EDI + 0x40],0x0
0082fd4d  JZ 0x0082fe51
0082fd53  MOV EAX,dword ptr [EDI + 0x3c]
0082fd56  MOV EBX,dword ptr [EAX + 0x34]
0082fd59  TEST EBX,EBX
0082fd5b  MOV dword ptr [ESP + 0x18],EBX
0082fd5f  JZ 0x0082fe51
0082fd65  MOV ESI,dword ptr [EDI + 0x14]
0082fd68  PUSH EAX
0082fd69  LEA ECX,[ESP + 0x28]
0082fd6d  CALL 0x00a1ff70
0082fd72  MOV dword ptr [ESP + 0x40],0x0
0082fd7a  MOVZX EAX,byte ptr [ESI + 0x3]
0082fd7e  PUSH EAX
0082fd7f  LEA ECX,[ESP + 0x28]
0082fd83  CALL 0x00a1ffa0
0082fd88  MOV ECX,dword ptr [EDI + 0x24]
0082fd8b  MOV EDX,dword ptr [ECX]
0082fd8d  MOV dword ptr [ESP + 0x1c],EAX
0082fd91  MOV EAX,dword ptr [EDX + 0xc]
0082fd94  CALL EAX
0082fd96  MOV EBP,EAX
0082fd98  TEST EBP,EBP
0082fd9a  JZ 0x0082fe40
0082fda0  MOV ECX,EBX
0082fda2  CALL 0x00a21460
0082fda7  XOR ECX,ECX
0082fda9  TEST EAX,EAX
0082fdab  MOV dword ptr [ESP + 0x20],EAX
0082fdaf  MOV dword ptr [ESP + 0x14],ECX
0082fdb3  JLE 0x0082fe40
0082fdb9  JMP 0x0082fdc4
0082fdc0  MOV EBX,dword ptr [ESP + 0x18]
0082fdc4  PUSH ECX
0082fdc5  MOV ECX,EBX
0082fdc7  CALL 0x00a21430
0082fdcc  MOV ESI,EAX
0082fdce  TEST ESI,ESI
0082fdd0  JZ 0x0082fe2f
0082fdd2  MOV EDX,dword ptr [ESI]
0082fdd4  MOV EAX,dword ptr [EDX + 0x2c]
0082fdd7  MOV ECX,ESI
0082fdd9  CALL EAX
0082fddb  CMP EAX,0x2
0082fdde  JNZ 0x0082fe2f
0082fde0  MOV EDX,dword ptr [ESI]
0082fde2  MOV EAX,dword ptr [EDX + 0x4c]
0082fde5  MOV ECX,ESI
0082fde7  CALL EAX
0082fde9  TEST AL,AL
0082fdeb  JNZ 0x0082fe2f
0082fded  MOV ECX,dword ptr [0x012ce7d4]
0082fdf3  MOV EDX,dword ptr [ESI]
0082fdf5  MOV EAX,dword ptr [EDX + 0x14]
0082fdf8  MOV EBX,dword ptr [EDI + 0x3c]
0082fdfb  PUSH 0xf
0082fdfd  PUSH ECX
0082fdfe  MOV ECX,ESI
0082fe00  CALL EAX
0082fe02  PUSH EAX
0082fe03  MOV ECX,EBX
0082fe05  CALL 0x00a1b700
0082fe0a  PUSH EAX
0082fe0b  CALL 0x009d5475
0082fe10  ADD ESP,0xc
0082fe13  TEST EAX,EAX
0082fe15  JNZ 0x0082fe2f
0082fe17  MOV ESI,dword ptr [ESI + 0x40]
0082fe1a  TEST ESI,ESI
0082fe1c  JZ 0x0082fe2f
0082fe1e  MOV EAX,dword ptr [ESP + 0x1c]
0082fe22  MOV EDX,dword ptr [EBP]
0082fe25  MOV EDX,dword ptr [EDX + 0x20]
0082fe28  PUSH ESI
0082fe29  PUSH EAX
0082fe2a  PUSH EDI
0082fe2b  MOV ECX,EBP
0082fe2d  CALL EDX
0082fe2f  MOV ECX,dword ptr [ESP + 0x14]
0082fe33  ADD ECX,0x1
0082fe36  CMP ECX,dword ptr [ESP + 0x20]
0082fe3a  MOV dword ptr [ESP + 0x14],ECX
0082fe3e  JL 0x0082fdc0
0082fe40  MOV dword ptr [ESP + 0x40],0xffffffff
0082fe48  LEA ECX,[ESP + 0x24]
0082fe4c  CALL 0x00a1ff90
0082fe51  MOV ECX,dword ptr [ESP + 0x38]
0082fe55  MOV dword ptr FS:[0x0],ECX
0082fe5c  POP ECX
0082fe5d  POP EDI
0082fe5e  POP ESI
0082fe5f  POP EBP
0082fe60  POP EBX
0082fe61  ADD ESP,0x30
0082fe64  RET
