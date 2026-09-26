program=ffxivgame-ifrit.exe
image_base=00400000

===== 00a17e50 =====
entry=00a17e50
body=[[00a17e50, 00a17e60] [00a1a930, 00a1a936]]
completed=true
message=

int FUN_00a17e50(void)

{
  int iVar1;
  
  iVar1 = func_0x00a1b730(0);
  return *(int *)(iVar1 + 4) + 8;
}


-- listing --
00a17e50  MOV ECX,dword ptr [ECX + 0x3c]
00a17e53  PUSH 0x0
00a17e55  CALL 0x00a1b730
00a17e5a  MOV ECX,EAX
00a17e5c  JMP 0x00a1a930
00a1a930  MOV EAX,dword ptr [ECX + 0x4]
00a1a933  ADD EAX,0x8
00a1a936  RET

===== 00a20f90 =====
entry=00a20f90
body=[[00a20f90, 00a20ff6]]
completed=true
message=

void __fastcall FUN_00a20f90(int param_1)

{
  int iVar1;
  uint uVar2;
  float10 fVar3;
  
  *(undefined4 *)(param_1 + 0x2c) = 0;
  if (*(int *)(param_1 + 0x1c) == 1) {
    *(undefined4 *)(param_1 + 0x1c) = 2;
  }
  else {
    FUN_00a20070();
    fVar3 = (float10)func_0x00a1b830();
    iVar1 = func_0x00a1ffc0();
    *(int *)(param_1 + 0x2c) = (int)((double)iVar1 * (double)fVar3);
  }
  uVar2 = *(int *)(param_1 + 0x28) + *(int *)(param_1 + 0x2c);
  if (uVar2 < 0x7fffffff) {
    *(uint *)(param_1 + 0x28) = uVar2;
  }
  return;
}


-- listing --
00a20f90  SUB ESP,0x8
00a20f93  PUSH ESI
00a20f94  MOV ESI,ECX
00a20f96  CMP dword ptr [ESI + 0x1c],0x1
00a20f9a  MOV dword ptr [ESI + 0x2c],0x0
00a20fa1  JNZ 0x00a20fac
00a20fa3  MOV dword ptr [ESI + 0x1c],0x2
00a20faa  JMP 0x00a20fe0
00a20fac  PUSH EDI
00a20fad  MOV EDI,dword ptr [ESP + 0x14]
00a20fb1  MOV ECX,EDI
00a20fb3  CALL 0x00a20070
00a20fb8  MOV ECX,EAX
00a20fba  CALL 0x00a1b830
00a20fbf  FSTP double ptr [ESP + 0x8]
00a20fc3  MOV ECX,EDI
00a20fc5  CALL 0x00a1ffc0
00a20fca  CVTSI2SS XMM0,EAX
00a20fce  CVTSS2SD XMM0,XMM0
00a20fd2  MULSD XMM0,qword ptr [ESP + 0x8]
00a20fd8  CVTTSD2SI EAX,XMM0
00a20fdc  MOV dword ptr [ESI + 0x2c],EAX
00a20fdf  POP EDI
00a20fe0  MOV EAX,dword ptr [ESI + 0x28]
00a20fe3  ADD EAX,dword ptr [ESI + 0x2c]
00a20fe6  CMP EAX,0x7fffffff
00a20feb  JNC 0x00a20ff0
00a20fed  MOV dword ptr [ESI + 0x28],EAX
00a20ff0  POP ESI
00a20ff1  ADD ESP,0x8
00a20ff4  RET 0x4

===== 00a210f0 =====
entry=00a210f0
body=[[00a210f0, 00a210f9]]
completed=true
message=

void __thiscall FUN_00a210f0(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 0x20) = param_2;
  return;
}


-- listing --
00a210f0  MOV EAX,dword ptr [ESP + 0x4]
00a210f4  MOV dword ptr [ECX + 0x20],EAX
00a210f7  RET 0x4

===== 00a17eb0 =====
entry=00a17eb0
body=[[00a17eb0, 00a17ef7]]
completed=true
message=

void __fastcall FUN_00a17eb0(int *param_1)

{
  bool bVar1;
  
  bVar1 = 0 < *(int *)(param_1[0xf] + 0x4c);
  if ((bVar1 & (*(byte *)(param_1 + 0x18) ^ bVar1)) != 0) {
    (**(code **)(*param_1 + 0xb4))();
    *(bool *)(param_1 + 0x18) = bVar1;
    return;
  }
  if ((bool)(*(byte *)(param_1 + 0x18) | bVar1) != bVar1) {
    (**(code **)(*param_1 + 0xb8))();
  }
  *(bool *)(param_1 + 0x18) = bVar1;
  return;
}


-- listing --
00a17eb0  PUSH EBX
00a17eb1  PUSH ESI
00a17eb2  MOV ESI,ECX
00a17eb4  MOV EAX,dword ptr [ESI + 0x3c]
00a17eb7  CMP dword ptr [EAX + 0x4c],0x0
00a17ebb  SETLE AL
00a17ebe  TEST AL,AL
00a17ec0  MOV AL,byte ptr [ESI + 0x60]
00a17ec3  SETZ BL
00a17ec6  MOV CL,AL
00a17ec8  XOR CL,BL
00a17eca  TEST BL,CL
00a17ecc  JZ 0x00a17ee0
00a17ece  MOV EDX,dword ptr [ESI]
00a17ed0  MOV EAX,dword ptr [EDX + 0xb4]
00a17ed6  MOV ECX,ESI
00a17ed8  CALL EAX
00a17eda  MOV byte ptr [ESI + 0x60],BL
00a17edd  POP ESI
00a17ede  POP EBX
00a17edf  RET
00a17ee0  OR AL,BL
00a17ee2  XOR AL,BL
00a17ee4  JZ 0x00a17ef2
00a17ee6  MOV EDX,dword ptr [ESI]
00a17ee8  MOV EAX,dword ptr [EDX + 0xb8]
00a17eee  MOV ECX,ESI
00a17ef0  CALL EAX
00a17ef2  MOV byte ptr [ESI + 0x60],BL
00a17ef5  POP ESI
00a17ef6  POP EBX
00a17ef7  RET

===== 00a1f3c0 =====
entry=00a1f3c0
body=[[00a1bec0, 00a1bf1b] [00a1f3c0, 00a1f55f]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_00a1f3c0(int *param_1)

{
  longlong lVar1;
  char cVar2;
  undefined4 uVar3;
  longlong lVar4;
  undefined8 uVar5;
  undefined1 auStack_400 [976];
  undefined4 uStack_30;
  undefined4 uStack_2c;
  longlong lStack_28;
  int iStack_20;
  int iStack_1c;
  
  if (param_1[0x14] == 0) {
    func_0x009d4f9f(auStack_400,0x400,0x3fe,&UNK_01097ab0);
    func_0x009d4bb4(auStack_400,0x400,&UNK_00f54d98);
    (*_DAT_012651b4)(auStack_400,2);
    return;
  }
  (**(code **)(*param_1 + 0x50))();
  cVar2 = (**(code **)(*param_1 + 0x38))();
  if (cVar2 == '\x01') {
    if ((param_1[0x2e] != 0) && (cVar2 = func_0x00a03510(), cVar2 == '\x01')) {
      return;
    }
    if (((*(byte *)(param_1 + 0x24) & 0x80) != 0) && (param_1[0x23] == 3)) goto LAB_00a1f45e;
  }
  if (param_1[0x23] != 2) {
    return;
  }
LAB_00a1f45e:
  func_0x00a1ef60();
  if (param_1[0x32] == 1) {
    func_0x00a1c6e0(param_1 + 0xe);
    func_0x00a1e820();
    if (param_1[0x23] == 4) {
      return;
    }
  }
  if ((*(byte *)(param_1 + 0x24) & 4) == 0) {
    *(byte *)(param_1 + 0x24) = *(byte *)(param_1 + 0x24) & 0xf7 | 4;
  }
  else {
    if (0 < param_1[0x13]) {
      func_0x00a203c0(0,0);
    }
    func_0x00a204d0();
  }
  func_0x00a1be60();
  if ((*(byte *)(param_1 + 0x24) & 0x10) != 0) {
    *(byte *)(param_1 + 0x24) = *(byte *)(param_1 + 0x24) & 0xef;
    uVar5 = func_0x00a20350();
    func_0x00a1e540(uVar5);
  }
  uVar3 = func_0x00a20350();
  cVar2 = func_0x00a1e380(uVar3);
  if (cVar2 != '\0') {
    func_0x00a1e820();
  }
  if (((param_1[0x32] == 2) && ((*(byte *)((int)param_1 + 0x91) & 1) != 0)) && (0 < param_1[0x13]))
  {
    *(undefined1 *)(param_1 + 0x3a) = 0;
  }
  else {
    *(undefined1 *)(param_1 + 0x3a) = 1;
  }
  *(byte *)((int)param_1 + 0x91) = 0 < param_1[0x13] | *(byte *)((int)param_1 + 0x91) & 0x7e;
  if (param_1[0x2e] != 0) {
    iStack_1c = 0xa1bee2;
    func_0x00a20350();
    lVar1 = *(longlong *)(param_1 + 0x28);
    iStack_1c = 0xa1bef5;
    lVar4 = func_0x00a20350();
    iStack_1c = 0xa1bf02;
    iStack_20 = func_0x00a20470();
    iStack_1c = iStack_20 >> 0x1f;
    uStack_2c = 0xa1bf0c;
    lStack_28 = lVar4 - lVar1;
    uStack_2c = func_0x009d5880();
    uStack_30 = 0xa1bf16;
    func_0x00a03490();
  }
  return;
}


-- listing --
00a1bec0  PUSH ECX
00a1bec1  PUSH ESI
00a1bec2  MOV ESI,ECX
00a1bec4  MOV EAX,dword ptr [ESI + 0xb8]
00a1beca  TEST EAX,EAX
00a1becc  MOV dword ptr [ESP + 0x4],EAX
00a1bed0  JZ 0x00a1bf19
00a1bed2  PUSH EBX
00a1bed3  PUSH EBP
00a1bed4  PUSH EDI
00a1bed5  LEA EDI,[ESI + 0xd0]
00a1bedb  MOV ECX,EDI
00a1bedd  CALL 0x00a20350
00a1bee2  MOV EBX,dword ptr [ESI + 0xa0]
00a1bee8  MOV EBP,dword ptr [ESI + 0xa4]
00a1beee  MOV ECX,EDI
00a1bef0  CALL 0x00a20350
00a1bef5  MOV ESI,EAX
00a1bef7  MOV EDI,EDX
00a1bef9  SUB ESI,EBX
00a1befb  SBB EDI,EBP
00a1befd  CALL 0x00a20470
00a1bf02  CDQ
00a1bf03  PUSH EDX
00a1bf04  PUSH EAX
00a1bf05  PUSH EDI
00a1bf06  PUSH ESI
00a1bf07  CALL 0x009d5880
00a1bf0c  MOV ECX,dword ptr [ESP + 0x10]
00a1bf10  PUSH EAX
00a1bf11  CALL 0x00a03490
00a1bf16  POP EDI
00a1bf17  POP EBP
00a1bf18  POP EBX
00a1bf19  POP ESI
00a1bf1a  POP ECX
00a1bf1b  RET
00a1f3c0  SUB ESP,0x400
00a1f3c6  PUSH ESI
00a1f3c7  MOV ESI,ECX
00a1f3c9  CMP dword ptr [ESI + 0x50],0x0
00a1f3cd  JNZ 0x00a1f41c
00a1f3cf  PUSH 0x1097ab0
00a1f3d4  PUSH 0x3fe
00a1f3d9  LEA EAX,[ESP + 0xc]
00a1f3dd  PUSH 0x400
00a1f3e2  PUSH EAX
00a1f3e3  MOV byte ptr [ESP + 0x412],0x0
00a1f3eb  CALL 0x009d4f9f
00a1f3f0  PUSH 0xf54d98
00a1f3f5  LEA ECX,[ESP + 0x18]
00a1f3f9  PUSH 0x400
00a1f3fe  PUSH ECX
00a1f3ff  CALL 0x009d4bb4
00a1f404  LEA EDX,[ESP + 0x20]
00a1f408  PUSH 0x2
00a1f40a  PUSH EDX
00a1f40b  CALL dword ptr [0x012651b4]
00a1f411  ADD ESP,0x24
00a1f414  POP ESI
00a1f415  ADD ESP,0x400
00a1f41b  RET
00a1f41c  MOV EAX,dword ptr [ESI]
00a1f41e  MOV EDX,dword ptr [EAX + 0x50]
00a1f421  CALL EDX
00a1f423  MOV EAX,dword ptr [ESI]
00a1f425  MOV EDX,dword ptr [EAX + 0x38]
00a1f428  MOV ECX,ESI
00a1f42a  CALL EDX
00a1f42c  CMP AL,0x1
00a1f42e  JNZ 0x00a1f455
00a1f430  MOV ECX,dword ptr [ESI + 0xb8]
00a1f436  TEST ECX,ECX
00a1f438  JZ 0x00a1f443
00a1f43a  CALL 0x00a03510
00a1f43f  CMP AL,0x1
00a1f441  JZ 0x00a1f414
00a1f443  TEST byte ptr [ESI + 0x90],0x80
00a1f44a  JZ 0x00a1f455
00a1f44c  CMP dword ptr [ESI + 0x8c],0x3
00a1f453  JZ 0x00a1f45e
00a1f455  CMP dword ptr [ESI + 0x8c],0x2
00a1f45c  JNZ 0x00a1f414
00a1f45e  MOV ECX,ESI
00a1f460  CALL 0x00a1ef60
00a1f465  CMP dword ptr [ESI + 0xc8],0x1
00a1f46c  JNZ 0x00a1f489
00a1f46e  LEA EAX,[ESI + 0x38]
00a1f471  PUSH EAX
00a1f472  MOV ECX,ESI
00a1f474  CALL 0x00a1c6e0
00a1f479  MOV ECX,ESI
00a1f47b  CALL 0x00a1e820
00a1f480  CMP dword ptr [ESI + 0x8c],0x4
00a1f487  JZ 0x00a1f414
00a1f489  MOV AL,byte ptr [ESI + 0x90]
00a1f48f  TEST AL,0x4
00a1f491  JNZ 0x00a1f49f
00a1f493  AND AL,0xf7
00a1f495  OR AL,0x4
00a1f497  MOV byte ptr [ESI + 0x90],AL
00a1f49d  JMP 0x00a1f4bf
00a1f49f  CMP dword ptr [ESI + 0x4c],0x0
00a1f4a3  JLE 0x00a1f4b4
00a1f4a5  PUSH 0x0
00a1f4a7  PUSH 0x0
00a1f4a9  LEA ECX,[ESI + 0xd0]
00a1f4af  CALL 0x00a203c0
00a1f4b4  LEA ECX,[ESI + 0xd0]
00a1f4ba  CALL 0x00a204d0
00a1f4bf  MOV ECX,ESI
00a1f4c1  CALL 0x00a1be60
00a1f4c6  MOV AL,byte ptr [ESI + 0x90]
00a1f4cc  TEST AL,0x10
00a1f4ce  JZ 0x00a1f4ec
00a1f4d0  AND AL,0xef
00a1f4d2  LEA ECX,[ESI + 0xd0]
00a1f4d8  MOV byte ptr [ESI + 0x90],AL
00a1f4de  CALL 0x00a20350
00a1f4e3  PUSH EDX
00a1f4e4  PUSH EAX
00a1f4e5  MOV ECX,ESI
00a1f4e7  CALL 0x00a1e540
00a1f4ec  LEA ECX,[ESI + 0xd0]
00a1f4f2  CALL 0x00a20350
00a1f4f7  PUSH EAX
00a1f4f8  MOV ECX,ESI
00a1f4fa  CALL 0x00a1e380
00a1f4ff  TEST AL,AL
00a1f501  JZ 0x00a1f50a
00a1f503  MOV ECX,ESI
00a1f505  CALL 0x00a1e820
00a1f50a  CMP dword ptr [ESI + 0xc8],0x2
00a1f511  JNZ 0x00a1f52b
00a1f513  TEST byte ptr [ESI + 0x91],0x1
00a1f51a  JZ 0x00a1f52b
00a1f51c  CMP dword ptr [ESI + 0x4c],0x0
00a1f520  JLE 0x00a1f52b
00a1f522  MOV byte ptr [ESI + 0xe8],0x0
00a1f529  JMP 0x00a1f532
00a1f52b  MOV byte ptr [ESI + 0xe8],0x1
00a1f532  CMP dword ptr [ESI + 0x4c],0x0
00a1f536  MOV DL,byte ptr [ESI + 0x91]
00a1f53c  SETLE AL
00a1f53f  TEST AL,AL
00a1f541  SETZ CL
00a1f544  AND CL,0x1
00a1f547  AND DL,0x7e
00a1f54a  OR CL,DL
00a1f54c  MOV byte ptr [ESI + 0x91],CL
00a1f552  MOV ECX,ESI
00a1f554  POP ESI
00a1f555  ADD ESP,0x400
00a1f55b  JMP 0x00a1bec0

===== 00a18170 =====
entry=00a18170
body=[[00a18170, 00a1841a]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00a18170(int *param_1,int param_2)

{
  char cVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 unaff_EDI;
  undefined4 uStack_428;
  undefined1 auStack_424 [24];
  undefined1 auStack_40c [982];
  undefined1 uStack_36;
  undefined1 uStack_e;
  
  param_1[0x16] = 0;
  FUN_00a20f30();
  iVar2 = _DAT_00f54f70;
  param_1[0x11] = 0;
  param_1[0x15] = 0;
  param_1[0x17] = iVar2;
  *(undefined1 *)(param_1 + 0x10) = 0;
  iVar2 = (**(code **)(*(int *)param_1[9] + 0x24))();
  iVar3 = (**(code **)(*(int *)param_1[9] + 0x30))();
  if ((iVar2 == 0) || (iVar3 == 0)) {
    uStack_e = 0;
    func_0x009d4f9f(auStack_40c,0x400,0x3fe,&UNK_010970b0);
    func_0x009d4bb4(auStack_40c,0x400,&UNK_00f54d98);
    (*_DAT_012651b4)(auStack_40c,3);
    (**(code **)(*param_1 + 0x48))(1);
  }
  else {
    iVar2 = param_1[5];
    if (*(int *)(iVar2 + 0x10) < 0) {
      uStack_e = 0;
      func_0x009d4f9f(auStack_40c,0x400,0x3fe,&UNK_01097110,*(int *)(iVar2 + 0x10));
      func_0x009d4bb4(auStack_40c,0x400,&UNK_00f54d98);
      (*_DAT_012651b4)(auStack_40c,2);
      (**(code **)(*param_1 + 0x48))(1);
      return;
    }
    uStack_428 = FUN_00a1ffa0(*(undefined1 *)(iVar2 + 3));
    piVar4 = (int *)func_0x00a20040();
    if ((*(byte *)(iVar2 + 0x14) & 8) == 0) {
      uVar5 = (**(code **)(*piVar4 + 0x10))(auStack_424,*(undefined4 *)(iVar2 + 0x10));
      uVar5 = (**(code **)(*piVar4 + 0xc))(&uStack_428,*(undefined4 *)(iVar2 + 0x10),uVar5);
      piVar4 = (int *)(**(code **)(param_2 + 8))(param_1,unaff_EDI,piVar4,uVar5);
    }
    else {
      uVar5 = (**(code **)(*piVar4 + 0x10))(auStack_424,*(undefined4 *)(iVar2 + 0x10));
      uVar6 = (**(code **)(*piVar4 + 0xc))(&uStack_428,*(undefined4 *)(iVar2 + 0x10),uVar5);
      piVar4 = (int *)(**(code **)(param_2 + 0xc))(param_1,unaff_EDI,piVar4,uVar6);
      unaff_EDI = uVar5;
    }
    if (piVar4 == (int *)0x0) {
      uStack_36 = 0;
      func_0x009d4f9f(&stack0xfffffbcc,0x400,0x3fe,&UNK_01097034);
      func_0x009d4bb4(&stack0xfffffbcc,0x400,&UNK_00f54d98);
      (*_DAT_012651b4)(&stack0xfffffbcc,3);
      (**(code **)(*param_1 + 0x48))(1);
      return;
    }
    param_1[0x12] = (int)piVar4;
    cVar1 = (**(code **)(*piVar4 + 0x28))();
    if (cVar1 == '\0') {
      (**(code **)(*param_1 + 0xc4))(param_2,param_1[0x12],unaff_EDI,iVar2);
      param_1[0x14] = 2;
      return;
    }
    FUN_00a210f0(2);
    param_1[0x14] = 0;
    (**(code **)(*(int *)param_1[0x12] + 0x30))();
    *(undefined1 *)((int)param_1 + 0x61) = 1;
    cVar1 = func_0x00a17f00(param_2);
    if (cVar1 != '\0') {
      (**(code **)(*param_1 + 0xc4))(param_2,param_1[0x12],unaff_EDI,iVar2);
      return;
    }
  }
  return;
}


-- listing --
00a18170  PUSH EBP
00a18171  MOV EBP,ESP
00a18173  AND ESP,0xfffffff8
00a18176  SUB ESP,0x424
00a1817c  MOV EAX,dword ptr [EBP + 0x8]
00a1817f  PUSH EBX
00a18180  PUSH ESI
00a18181  PUSH EDI
00a18182  MOV ESI,ECX
00a18184  XOR EDI,EDI
00a18186  PUSH EAX
00a18187  MOV dword ptr [ESI + 0x58],EDI
00a1818a  CALL 0x00a20f30
00a1818f  MOVSS XMM0,dword ptr [0x00f54f70]
00a18197  MOV ECX,dword ptr [ESI + 0x24]
00a1819a  MOV dword ptr [ESI + 0x44],EDI
00a1819d  MOV dword ptr [ESI + 0x54],EDI
00a181a0  MOVSS dword ptr [ESI + 0x5c],XMM0
00a181a5  MOV byte ptr [ESI + 0x40],0x0
00a181a9  MOV EDX,dword ptr [ECX]
00a181ab  MOV EAX,dword ptr [EDX + 0x24]
00a181ae  CALL EAX
00a181b0  MOV ECX,dword ptr [ESI + 0x24]
00a181b3  MOV EDX,dword ptr [ECX]
00a181b5  MOV EBX,EAX
00a181b7  MOV EAX,dword ptr [EDX + 0x30]
00a181ba  CALL EAX
00a181bc  CMP EBX,EDI
00a181be  MOV dword ptr [ESP + 0x10],EAX
00a181c2  JZ 0x00a183c2
00a181c8  CMP EAX,EDI
00a181ca  JZ 0x00a183c2
00a181d0  MOV EBX,dword ptr [ESI + 0x14]
00a181d3  MOV EAX,dword ptr [EBX + 0x10]
00a181d6  CMP EAX,EDI
00a181d8  JGE 0x00a18234
00a181da  PUSH EAX
00a181db  PUSH 0x1097110
00a181e0  PUSH 0x3fe
00a181e5  LEA ECX,[ESP + 0x3c]
00a181e9  PUSH 0x400
00a181ee  PUSH ECX
00a181ef  MOV byte ptr [ESP + 0x442],0x0
00a181f7  CALL 0x009d4f9f
00a181fc  PUSH 0xf54d98
00a18201  LEA EDX,[ESP + 0x48]
00a18205  PUSH 0x400
00a1820a  PUSH EDX
00a1820b  CALL 0x009d4bb4
00a18210  LEA EAX,[ESP + 0x50]
00a18214  PUSH 0x2
00a18216  PUSH EAX
00a18217  CALL dword ptr [0x012651b4]
00a1821d  MOV EDX,dword ptr [ESI]
00a1821f  MOV EAX,dword ptr [EDX + 0x48]
00a18222  ADD ESP,0x28
00a18225  PUSH 0x1
00a18227  MOV ECX,ESI
00a18229  CALL EAX
00a1822b  POP EDI
00a1822c  POP ESI
00a1822d  POP EBX
00a1822e  MOV ESP,EBP
00a18230  POP EBP
00a18231  RET 0x4
00a18234  MOVZX ECX,byte ptr [EBX + 0x3]
00a18238  MOV EDI,dword ptr [EBP + 0x8]
00a1823b  PUSH ECX
00a1823c  MOV ECX,EDI
00a1823e  CALL 0x00a1ffa0
00a18243  MOV ECX,EDI
00a18245  MOV dword ptr [ESP + 0x18],EAX
00a18249  CALL 0x00a20040
00a1824e  TEST byte ptr [EBX + 0x14],0x8
00a18252  MOV EDI,EAX
00a18254  JNZ 0x00a1829c
00a18256  MOV EDX,dword ptr [ESP + 0x10]
00a1825a  MOV EAX,dword ptr [EDX]
00a1825c  MOV EDX,dword ptr [EDI]
00a1825e  MOV EDX,dword ptr [EDX + 0x10]
00a18261  MOV dword ptr [ESP + 0x14],EAX
00a18265  MOV EAX,dword ptr [EBX + 0x10]
00a18268  PUSH EAX
00a18269  LEA ECX,[ESP + 0x20]
00a1826d  PUSH ECX
00a1826e  MOV ECX,EDI
00a18270  CALL EDX
00a18272  MOV ECX,dword ptr [EBX + 0x10]
00a18275  PUSH EAX
00a18276  MOV EAX,dword ptr [EDI]
00a18278  MOV EAX,dword ptr [EAX + 0xc]
00a1827b  PUSH ECX
00a1827c  LEA EDX,[ESP + 0x28]
00a18280  PUSH EDX
00a18281  MOV ECX,EDI
00a18283  CALL EAX
00a18285  MOV EDX,dword ptr [ESP + 0x18]
00a18289  MOV ECX,dword ptr [ESP + 0x14]
00a1828d  PUSH EAX
00a1828e  MOV EAX,dword ptr [EDX + 0x8]
00a18291  PUSH EDI
00a18292  MOV EDI,dword ptr [ESP + 0x24]
00a18296  PUSH EDI
00a18297  PUSH ESI
00a18298  CALL EAX
00a1829a  JMP 0x00a182e4
00a1829c  MOV ECX,dword ptr [ESP + 0x10]
00a182a0  MOV EDX,dword ptr [ECX]
00a182a2  MOV ECX,dword ptr [EBX + 0x10]
00a182a5  MOV EAX,dword ptr [EDI]
00a182a7  MOV EAX,dword ptr [EAX + 0x10]
00a182aa  MOV dword ptr [ESP + 0x14],EDX
00a182ae  PUSH ECX
00a182af  LEA EDX,[ESP + 0x20]
00a182b3  PUSH EDX
00a182b4  MOV ECX,EDI
00a182b6  CALL EAX
00a182b8  MOV EDX,dword ptr [EDI]
00a182ba  MOV EDX,dword ptr [EDX + 0xc]
00a182bd  PUSH EAX
00a182be  MOV EAX,dword ptr [EBX + 0x10]
00a182c1  PUSH EAX
00a182c2  LEA ECX,[ESP + 0x28]
00a182c6  PUSH ECX
00a182c7  MOV ECX,EDI
00a182c9  CALL EDX
00a182cb  MOV EDX,dword ptr [ESP + 0x18]
00a182cf  MOV ECX,dword ptr [ESP + 0x14]
00a182d3  PUSH EAX
00a182d4  MOV EAX,dword ptr [ESP + 0x20]
00a182d8  PUSH EDI
00a182d9  PUSH EAX
00a182da  MOV EAX,dword ptr [EDX + 0xc]
00a182dd  PUSH ESI
00a182de  CALL EAX
00a182e0  MOV EDI,dword ptr [ESP + 0x18]
00a182e4  TEST EAX,EAX
00a182e6  JNZ 0x00a18340
00a182e8  PUSH 0x1097034
00a182ed  PUSH 0x3fe
00a182f2  LEA ECX,[ESP + 0x38]
00a182f6  PUSH 0x400
00a182fb  PUSH ECX
00a182fc  MOV byte ptr [ESP + 0x43e],AL
00a18303  CALL 0x009d4f9f
00a18308  PUSH 0xf54d98
00a1830d  LEA EDX,[ESP + 0x44]
00a18311  PUSH 0x400
00a18316  PUSH EDX
00a18317  CALL 0x009d4bb4
00a1831c  LEA EAX,[ESP + 0x4c]
00a18320  PUSH 0x3
00a18322  PUSH EAX
00a18323  CALL dword ptr [0x012651b4]
00a18329  MOV EDX,dword ptr [ESI]
00a1832b  MOV EAX,dword ptr [EDX + 0x48]
00a1832e  ADD ESP,0x24
00a18331  PUSH 0x1
00a18333  MOV ECX,ESI
00a18335  CALL EAX
00a18337  POP EDI
00a18338  POP ESI
00a18339  POP EBX
00a1833a  MOV ESP,EBP
00a1833c  POP EBP
00a1833d  RET 0x4
00a18340  MOV dword ptr [ESI + 0x48],EAX
00a18343  MOV EDX,dword ptr [EAX]
00a18345  MOV ECX,EAX
00a18347  MOV EAX,dword ptr [EDX + 0x28]
00a1834a  CALL EAX
00a1834c  TEST AL,AL
00a1834e  JNZ 0x00a18376
00a18350  MOV EAX,dword ptr [ESI + 0x48]
00a18353  MOV ECX,dword ptr [EBP + 0x8]
00a18356  MOV EDX,dword ptr [ESI]
00a18358  MOV EDX,dword ptr [EDX + 0xc4]
00a1835e  PUSH EBX
00a1835f  PUSH EDI
00a18360  PUSH EAX
00a18361  PUSH ECX
00a18362  MOV ECX,ESI
00a18364  CALL EDX
00a18366  MOV dword ptr [ESI + 0x50],0x2
00a1836d  POP EDI
00a1836e  POP ESI
00a1836f  POP EBX
00a18370  MOV ESP,EBP
00a18372  POP EBP
00a18373  RET 0x4
00a18376  PUSH 0x2
00a18378  MOV ECX,ESI
00a1837a  CALL 0x00a210f0
00a1837f  MOV ECX,dword ptr [ESI + 0x48]
00a18382  MOV dword ptr [ESI + 0x50],0x0
00a18389  MOV EAX,dword ptr [ECX]
00a1838b  MOV EDX,dword ptr [EAX + 0x30]
00a1838e  CALL EDX
00a18390  MOV EAX,dword ptr [EBP + 0x8]
00a18393  PUSH EAX
00a18394  MOV ECX,ESI
00a18396  MOV byte ptr [ESI + 0x61],0x1
00a1839a  CALL 0x00a17f00
00a1839f  TEST AL,AL
00a183a1  JZ 0x00a18412
00a183a3  MOV EAX,dword ptr [ESI + 0x48]
00a183a6  MOV ECX,dword ptr [EBP + 0x8]
00a183a9  MOV EDX,dword ptr [ESI]
00a183ab  MOV EDX,dword ptr [EDX + 0xc4]
00a183b1  PUSH EBX
00a183b2  PUSH EDI
00a183b3  PUSH EAX
00a183b4  PUSH ECX
00a183b5  MOV ECX,ESI
00a183b7  CALL EDX
00a183b9  POP EDI
00a183ba  POP ESI
00a183bb  POP EBX
00a183bc  MOV ESP,EBP
00a183be  POP EBP
00a183bf  RET 0x4
00a183c2  PUSH 0x10970b0
00a183c7  PUSH 0x3fe
00a183cc  LEA EAX,[ESP + 0x38]
00a183d0  PUSH 0x400
00a183d5  PUSH EAX
00a183d6  MOV byte ptr [ESP + 0x43e],0x0
00a183de  CALL 0x009d4f9f
00a183e3  PUSH 0xf54d98
00a183e8  LEA ECX,[ESP + 0x44]
00a183ec  PUSH 0x400
00a183f1  PUSH ECX
00a183f2  CALL 0x009d4bb4
00a183f7  LEA EDX,[ESP + 0x4c]
00a183fb  PUSH 0x3
00a183fd  PUSH EDX
00a183fe  CALL dword ptr [0x012651b4]
00a18404  MOV EAX,dword ptr [ESI]
00a18406  MOV EDX,dword ptr [EAX + 0x48]
00a18409  ADD ESP,0x24
00a1840c  PUSH 0x1
00a1840e  MOV ECX,ESI
00a18410  CALL EDX
00a18412  POP EDI
00a18413  POP ESI
00a18414  POP EBX
00a18415  MOV ESP,EBP
00a18417  POP EBP
00a18418  RET 0x4

===== 00a18480 =====
entry=00a18480
body=[[00a18480, 00a185fd]]
completed=true
message=

void __thiscall FUN_00a18480(int *param_1,int param_2)

{
  int iVar1;
  int iVar2;
  char cVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  float10 fVar7;
  int iStack_10;
  int *piStack_4;
  
  iVar1 = param_1[5];
  iStack_10 = 0xa18492;
  piStack_4 = param_1;
  cVar3 = (**(code **)(*(int *)param_1[0x12] + 0x28))();
  if (((cVar3 != '\0') && (param_1[0x14] < 2)) &&
     (iStack_10 = iVar1, cVar3 = (**(code **)(*param_1 + 0xc0))(param_2), cVar3 == '\0')) {
    return;
  }
  iStack_10 = param_2;
  FUN_00a20f90();
  if ((char)param_1[0x10] == '\0') {
    return;
  }
  iVar2 = *(int *)param_1[0xf];
  FUN_00a20070();
  fVar7 = (float10)func_0x00a1b830();
  (**(code **)(iVar2 + 0x34))((float)(fVar7 * (float10)(float)param_1[0x17]));
  if ((*(byte *)(iVar1 + 0x14) & 0x80) == 0) {
    piVar4 = (int *)(**(code **)(param_1[0xe] + 0x7c))(&piStack_4);
    iVar2 = *piVar4;
    iVar5 = (**(code **)(*param_1 + 0x9c))();
    if ((iVar5 + iVar2 < *(int *)(iVar1 + 0x20)) || (0 < *(int *)(param_1[0xf] + 0x4c)))
    goto LAB_00a185d1;
    param_1[0x16] = 1;
  }
  else {
    piVar4 = (int *)(**(code **)(param_1[0xe] + 0x7c))(&piStack_4);
    iVar2 = *piVar4;
    iVar5 = (**(code **)(*param_1 + 0x9c))();
    if ((iVar5 + iVar2 < *(int *)(iVar1 + 0x20)) || (0 < *(int *)(param_1[0xf] + 0x4c)))
    goto LAB_00a185d1;
    param_1[0x16] = param_1[0x16] + 1;
    if ((param_1[0x11] == -1) || (param_1[0x11] != param_1[0x16])) {
      iVar2 = *(int *)(iVar1 + 0x1c);
      piVar4 = (int *)(**(code **)(param_1[0xe] + 0x7c))(&iStack_10);
      iVar5 = *piVar4;
      iVar6 = (**(code **)(*param_1 + 0x9c))(0 < iVar2);
      func_0x00a1c640((iVar5 - *(int *)(iVar1 + 0x20)) + iVar6 + iVar2);
    }
  }
  (**(code **)(*param_1 + 0xb0))();
LAB_00a185d1:
  FUN_00a1f3c0();
  FUN_00a17eb0();
  if ((param_1[0x11] != -1) && (param_1[0x16] == param_1[0x11])) {
    FUN_00a210f0(0);
  }
  return;
}


-- listing --
00a18480  PUSH ECX
00a18481  PUSH EBX
00a18482  PUSH ESI
00a18483  MOV ESI,ECX
00a18485  MOV ECX,dword ptr [ESI + 0x48]
00a18488  MOV EAX,dword ptr [ECX]
00a1848a  MOV EDX,dword ptr [EAX + 0x28]
00a1848d  MOV EBX,dword ptr [ESI + 0x14]
00a18490  CALL EDX
00a18492  TEST AL,AL
00a18494  JZ 0x00a184b6
00a18496  CMP dword ptr [ESI + 0x50],0x2
00a1849a  JGE 0x00a184b6
00a1849c  MOV ECX,dword ptr [ESP + 0x10]
00a184a0  MOV EAX,dword ptr [ESI]
00a184a2  MOV EDX,dword ptr [EAX + 0xc0]
00a184a8  PUSH EBX
00a184a9  PUSH ECX
00a184aa  MOV ECX,ESI
00a184ac  CALL EDX
00a184ae  TEST AL,AL
00a184b0  JZ 0x00a185f8
00a184b6  MOV EAX,dword ptr [ESP + 0x10]
00a184ba  PUSH EAX
00a184bb  MOV ECX,ESI
00a184bd  CALL 0x00a20f90
00a184c2  CMP byte ptr [ESI + 0x40],0x0
00a184c6  JZ 0x00a185f8
00a184cc  MOV ECX,dword ptr [ESP + 0x10]
00a184d0  PUSH EBP
00a184d1  MOV EBP,dword ptr [ESI + 0x3c]
00a184d4  PUSH EDI
00a184d5  MOV EDI,dword ptr [EBP]
00a184d8  ADD EDI,0x34
00a184db  CALL 0x00a20070
00a184e0  MOV ECX,EAX
00a184e2  CALL 0x00a1b830
00a184e7  FMUL float ptr [ESI + 0x5c]
00a184ea  MOV EDX,dword ptr [EDI]
00a184ec  PUSH ECX
00a184ed  FSTP float ptr [ESP + 0x1c]
00a184f1  MOV ECX,EBP
00a184f3  FLD float ptr [ESP + 0x1c]
00a184f7  FSTP float ptr [ESP]
00a184fa  CALL EDX
00a184fc  TEST byte ptr [EBX + 0x14],0x80
00a18500  JZ 0x00a18590
00a18506  MOV EAX,dword ptr [ESI + 0x38]
00a18509  MOV EDX,dword ptr [EAX + 0x7c]
00a1850c  LEA EDI,[ESI + 0x38]
00a1850f  LEA ECX,[ESP + 0x18]
00a18513  PUSH ECX
00a18514  MOV ECX,EDI
00a18516  CALL EDX
00a18518  MOV EBP,dword ptr [EAX]
00a1851a  MOV EAX,dword ptr [ESI]
00a1851c  MOV EDX,dword ptr [EAX + 0x9c]
00a18522  MOV ECX,ESI
00a18524  CALL EDX
00a18526  ADD EAX,EBP
00a18528  CMP EAX,dword ptr [EBX + 0x20]
00a1852b  JL 0x00a185d1
00a18531  MOV EAX,dword ptr [ESI + 0x3c]
00a18534  CMP dword ptr [EAX + 0x4c],0x0
00a18538  JG 0x00a185d1
00a1853e  ADD dword ptr [ESI + 0x58],0x1
00a18542  MOV EAX,dword ptr [ESI + 0x44]
00a18545  CMP EAX,-0x1
00a18548  MOV ECX,dword ptr [ESI + 0x58]
00a1854b  JZ 0x00a18551
00a1854d  CMP EAX,ECX
00a1854f  JZ 0x00a185c5
00a18551  MOV EDX,dword ptr [EDI]
00a18553  MOV EDX,dword ptr [EDX + 0x7c]
00a18556  MOV EBP,dword ptr [EBX + 0x1c]
00a18559  LEA EAX,[ESP + 0x10]
00a1855d  PUSH EAX
00a1855e  MOV ECX,EDI
00a18560  CALL EDX
00a18562  MOV EDI,dword ptr [EAX]
00a18564  MOV EAX,dword ptr [ESI + 0x3c]
00a18567  MOV EDX,dword ptr [ESI]
00a18569  TEST EBP,EBP
00a1856b  SETG CL
00a1856e  MOV dword ptr [ESP + 0x18],EAX
00a18572  MOV EAX,dword ptr [EDX + 0x9c]
00a18578  PUSH ECX
00a18579  MOV ECX,ESI
00a1857b  CALL EAX
00a1857d  SUB EDI,dword ptr [EBX + 0x20]
00a18580  MOV ECX,dword ptr [ESP + 0x1c]
00a18584  ADD EAX,EBP
00a18586  ADD EDI,EAX
00a18588  PUSH EDI
00a18589  CALL 0x00a1c640
00a1858e  JMP 0x00a185c5
00a18590  MOV EDX,dword ptr [ESI + 0x38]
00a18593  MOV EDX,dword ptr [EDX + 0x7c]
00a18596  LEA ECX,[ESI + 0x38]
00a18599  LEA EAX,[ESP + 0x18]
00a1859d  PUSH EAX
00a1859e  CALL EDX
00a185a0  MOV EDI,dword ptr [EAX]
00a185a2  MOV EAX,dword ptr [ESI]
00a185a4  MOV EDX,dword ptr [EAX + 0x9c]
00a185aa  MOV ECX,ESI
00a185ac  CALL EDX
00a185ae  ADD EAX,EDI
00a185b0  CMP EAX,dword ptr [EBX + 0x20]
00a185b3  JL 0x00a185d1
00a185b5  MOV EAX,dword ptr [ESI + 0x3c]
00a185b8  CMP dword ptr [EAX + 0x4c],0x0
00a185bc  JG 0x00a185d1
00a185be  MOV dword ptr [ESI + 0x58],0x1
00a185c5  MOV EDX,dword ptr [ESI]
00a185c7  MOV EAX,dword ptr [EDX + 0xb0]
00a185cd  MOV ECX,ESI
00a185cf  CALL EAX
00a185d1  MOV ECX,dword ptr [ESI + 0x3c]
00a185d4  CALL 0x00a1f3c0
00a185d9  MOV ECX,ESI
00a185db  CALL 0x00a17eb0
00a185e0  MOV EAX,dword ptr [ESI + 0x44]
00a185e3  CMP EAX,-0x1
00a185e6  POP EDI
00a185e7  POP EBP
00a185e8  JZ 0x00a185f8
00a185ea  CMP dword ptr [ESI + 0x58],EAX
00a185ed  JNZ 0x00a185f8
00a185ef  PUSH 0x0
00a185f1  MOV ECX,ESI
00a185f3  CALL 0x00a210f0
00a185f8  POP ESI
00a185f9  POP EBX
00a185fa  POP ECX
00a185fb  RET 0x4

===== 00a17a30 =====
entry=00a17a30
body=[[00a17a30, 00a17cae]]
completed=true
message=

/* WARNING: Removing unreachable block (ram,0x00a17acb) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_00a17a30(int *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  char cVar3;
  short sVar4;
  int iVar5;
  int *piVar6;
  int iVar7;
  undefined4 unaff_EDI;
  undefined4 *unaff_FS_OFFSET;
  float10 fVar8;
  undefined4 uVar9;
  undefined *puStack_80;
  uint uStack_7c;
  int iStack_78;
  undefined *puStack_74;
  undefined4 uStack_70;
  undefined1 *puStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_5c;
  undefined4 uStack_58;
  undefined4 uStack_54;
  uint uStack_20;
  undefined4 uStack_1c;
  undefined1 auStack_10 [4];
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00ed93b9;
  uStack_c = *unaff_FS_OFFSET;
  *unaff_FS_OFFSET = &uStack_c;
  uStack_54 = 0xa17a59;
  iVar5 = func_0x00a20040();
  uVar9 = *(undefined4 *)(iVar5 + 4);
  uStack_54 = 0xa17a63;
  uStack_54 = FUN_00a20070();
  uStack_58 = 0xa17a6b;
  uStack_58 = func_0x00a20060();
  uStack_5c = 0xa17a73;
  uStack_5c = func_0x00a20050();
  uStack_64 = param_3;
  uStack_68 = 0xa17a83;
  uStack_60 = uVar9;
  func_0x00a19b60();
  uStack_68 = 0;
  puStack_6c = auStack_10;
  uStack_70 = 0xa17a9b;
  piVar6 = (int *)func_0x00a1a470();
  puVar1 = (undefined4 *)*piVar6;
  *piVar6 = 0;
  puVar2 = (undefined4 *)param_1[0xf];
  if ((puVar1 != puVar2) && (puVar2 != (undefined4 *)0x0)) {
    uStack_70 = 1;
    puStack_74 = (undefined *)0xa17abb;
    (**(code **)*puVar2)();
  }
  param_1[0xf] = (int)puVar1;
  uStack_20 = uStack_20 & 0xffffff00;
  uStack_70 = 0;
  puStack_74 = (undefined *)0xa17add;
  func_0x00a1b730();
  iStack_78 = 0xa17ae9;
  func_0x00a1a890();
  iStack_78 = 0xa17af0;
  piVar6 = (int *)FUN_00a20070();
  iStack_78 = 0xa17af9;
  cVar3 = (**(code **)(*piVar6 + 0x38))();
  if (cVar3 == '\x03') {
    iStack_78 = 0xa17b04;
    iVar5 = FUN_00a20070();
    *(undefined4 *)(param_1[0xf] + 0x1d0) = *(undefined4 *)(iVar5 + 0x1d0);
  }
  iStack_78 = 0xa17b1a;
  iVar5 = FUN_00a20070();
  uStack_1c = CONCAT31(uStack_1c._1_3_,*(undefined1 *)(iVar5 + 0x92));
  iStack_78 = uStack_1c;
  uStack_7c = 0xa17b34;
  (**(code **)(param_1[0xe] + 0x4c))();
  uStack_7c = 0xa17b3b;
  iVar5 = FUN_00a20070();
  uStack_7c = *(byte *)(iVar5 + 0x90) >> 1 & 0xffffff01;
  puStack_80 = (undefined *)0xa17b52;
  func_0x00a1cfb0();
  puStack_80 = (undefined *)0x2;
  func_0x00a1b7d0();
  iVar5 = func_0x00a1a590();
  param_1[0x19] = iVar5;
  param_1[0x17] = (int)(float)((double)*(ushort *)(uStack_20 + 0x24) / _DAT_00f55ad0);
  iVar5 = *(int *)(uStack_20 + 0x1c);
  iVar7 = (**(code **)(*param_1 + 0x24))(0 < iVar5);
  func_0x00a1c640(iVar7 + iVar5);
  iVar5 = *(int *)param_1[0xf];
  FUN_00a20070();
  fVar8 = (float10)func_0x00a1b830();
  (**(code **)(iVar5 + 0x34))((float)(fVar8 * (float10)(float)param_1[0x17]));
  if ((*(byte *)(uStack_20 + 0x14) & 0x40) == 0) {
    if (*(char *)(uStack_20 + 0x15) < '\0') {
      param_1[0x11] = -1;
    }
    else {
      sVar4 = func_0x00a012e0(0,*(char *)(uStack_20 + 0x16) + 1);
      param_1[0x11] = (int)sVar4 + (int)*(char *)(uStack_20 + 0x15);
    }
    uVar9 = 2;
  }
  else {
    param_1[0x11] = 1;
    uVar9 = 0;
  }
  FUN_00a210f0(uVar9);
  *(undefined1 *)(param_1 + 0x18) = 0;
  param_1[0x15] = 1;
  iVar5 = FUN_00a20070();
  uVar9 = *(undefined4 *)(iVar5 + 0x1b4);
  iStack_78 = FUN_00a20070();
  iStack_78 = iStack_78 + 0xf0;
  puStack_80 = &UNK_01096e30;
  puStack_74 = (undefined *)uVar9;
  (**(code **)(*param_1 + 0xbc))(&puStack_80);
  (**(code **)(*param_1 + 0xac))();
  *(undefined1 *)(param_1 + 0x10) = 1;
  puStack_74 = &UNK_01096d64;
  func_0x00a25ed0();
  *unaff_FS_OFFSET = unaff_EDI;
  return;
}


-- listing --
00a17a30  PUSH -0x1
00a17a32  PUSH 0xed93b9
00a17a37  MOV EAX,FS:[0x0]
00a17a3d  PUSH EAX
00a17a3e  MOV dword ptr FS:[0x0],ESP
00a17a45  SUB ESP,0x34
00a17a48  PUSH EBX
00a17a49  PUSH EBP
00a17a4a  PUSH ESI
00a17a4b  PUSH EDI
00a17a4c  MOV EDI,dword ptr [ESP + 0x54]
00a17a50  MOV ESI,ECX
00a17a52  MOV ECX,EDI
00a17a54  CALL 0x00a20040
00a17a59  MOV EBX,dword ptr [EAX + 0x4]
00a17a5c  MOV ECX,EDI
00a17a5e  CALL 0x00a20070
00a17a63  PUSH EAX
00a17a64  MOV ECX,EDI
00a17a66  CALL 0x00a20060
00a17a6b  PUSH EAX
00a17a6c  MOV ECX,EDI
00a17a6e  CALL 0x00a20050
00a17a73  PUSH EAX
00a17a74  MOV EAX,dword ptr [ESP + 0x64]
00a17a78  PUSH EBX
00a17a79  PUSH EAX
00a17a7a  LEA ECX,[ESP + 0x34]
00a17a7e  CALL 0x00a19b60
00a17a83  PUSH 0x0
00a17a85  LEA ECX,[ESP + 0x58]
00a17a89  PUSH ECX
00a17a8a  LEA ECX,[ESP + 0x28]
00a17a8e  MOV dword ptr [ESP + 0x54],0x0
00a17a96  CALL 0x00a1a470
00a17a9b  MOV EBX,dword ptr [EAX]
00a17a9d  MOV dword ptr [EAX],0x0
00a17aa3  MOV ECX,dword ptr [ESI + 0x3c]
00a17aa6  CMP EBX,ECX
00a17aa8  MOV byte ptr [ESP + 0x4c],0x1
00a17aad  JZ 0x00a17abb
00a17aaf  TEST ECX,ECX
00a17ab1  JZ 0x00a17abb
00a17ab3  MOV EDX,dword ptr [ECX]
00a17ab5  MOV EAX,dword ptr [EDX]
00a17ab7  PUSH 0x1
00a17ab9  CALL EAX
00a17abb  MOV ECX,dword ptr [ESP + 0x54]
00a17abf  TEST ECX,ECX
00a17ac1  MOV dword ptr [ESI + 0x3c],EBX
00a17ac4  MOV byte ptr [ESP + 0x4c],0x0
00a17ac9  JZ 0x00a17ad3
00a17acb  MOV EDX,dword ptr [ECX]
00a17acd  MOV EAX,dword ptr [EDX]
00a17acf  PUSH 0x1
00a17ad1  CALL EAX
00a17ad3  MOV ECX,dword ptr [ESI + 0x3c]
00a17ad6  PUSH 0x0
00a17ad8  CALL 0x00a1b730
00a17add  MOV ECX,dword ptr [ESP + 0x5c]
00a17ae1  PUSH ECX
00a17ae2  MOV ECX,EAX
00a17ae4  CALL 0x00a1a890
00a17ae9  MOV ECX,EDI
00a17aeb  CALL 0x00a20070
00a17af0  MOV EDX,dword ptr [EAX]
00a17af2  MOV ECX,EAX
00a17af4  MOV EAX,dword ptr [EDX + 0x38]
00a17af7  CALL EAX
00a17af9  CMP AL,0x3
00a17afb  JNZ 0x00a17b13
00a17afd  MOV ECX,EDI
00a17aff  CALL 0x00a20070
00a17b04  MOV EAX,dword ptr [EAX + 0x1d0]
00a17b0a  MOV ECX,dword ptr [ESI + 0x3c]
00a17b0d  MOV dword ptr [ECX + 0x1d0],EAX
00a17b13  MOV ECX,EDI
00a17b15  CALL 0x00a20070
00a17b1a  MOV CL,byte ptr [EAX + 0x92]
00a17b20  MOV EDX,dword ptr [ESI + 0x38]
00a17b23  MOV EDX,dword ptr [EDX + 0x4c]
00a17b26  MOV byte ptr [ESP + 0x58],CL
00a17b2a  MOV EAX,dword ptr [ESP + 0x58]
00a17b2e  LEA ECX,[ESI + 0x38]
00a17b31  PUSH EAX
00a17b32  CALL EDX
00a17b34  MOV ECX,EDI
00a17b36  CALL 0x00a20070
00a17b3b  MOVZX EAX,byte ptr [EAX + 0x90]
00a17b42  MOV ECX,dword ptr [ESI + 0x3c]
00a17b45  SHR AL,0x1
00a17b47  AND EAX,0xffffff01
00a17b4c  PUSH EAX
00a17b4d  CALL 0x00a1cfb0
00a17b52  MOV ECX,dword ptr [ESI + 0x3c]
00a17b55  PUSH 0x2
00a17b57  CALL 0x00a1b7d0
00a17b5c  MOV ECX,dword ptr [ESI + 0x3c]
00a17b5f  CALL 0x00a1a590
00a17b64  MOV EBX,dword ptr [ESP + 0x60]
00a17b68  MOV EDX,dword ptr [ESI + 0x3c]
00a17b6b  MOV dword ptr [ESI + 0x64],EAX
00a17b6e  MOVZX ECX,word ptr [EBX + 0x24]
00a17b72  CVTSI2SD XMM0,ECX
00a17b76  DIVSD XMM0,qword ptr [0x00f55ad0]
00a17b7e  CVTSD2SS XMM0,XMM0
00a17b82  MOVSS dword ptr [ESI + 0x5c],XMM0
00a17b87  MOV EBP,dword ptr [EBX + 0x1c]
00a17b8a  TEST EBP,EBP
00a17b8c  SETG AL
00a17b8f  MOV dword ptr [ESP + 0x58],EDX
00a17b93  MOV EDX,dword ptr [ESI]
00a17b95  MOV ECX,ESI
00a17b97  PUSH EAX
00a17b98  MOV EAX,dword ptr [EDX + 0x24]
00a17b9b  CALL EAX
00a17b9d  MOV ECX,dword ptr [ESP + 0x5c]
00a17ba1  ADD EAX,EBP
00a17ba3  PUSH EAX
00a17ba4  CALL 0x00a1c640
00a17ba9  MOV EAX,dword ptr [ESI + 0x3c]
00a17bac  MOV EBP,dword ptr [EAX]
00a17bae  MOV ECX,EDI
00a17bb0  MOV dword ptr [ESP + 0x5c],EAX
00a17bb4  ADD EBP,0x34
00a17bb7  CALL 0x00a20070
00a17bbc  MOV ECX,EAX
00a17bbe  CALL 0x00a1b830
00a17bc3  FMUL float ptr [ESI + 0x5c]
00a17bc6  MOV EDX,dword ptr [EBP]
00a17bc9  PUSH ECX
00a17bca  MOV ECX,dword ptr [ESP + 0x60]
00a17bce  FSTP float ptr [ESP + 0x5c]
00a17bd2  FLD float ptr [ESP + 0x5c]
00a17bd6  FSTP float ptr [ESP]
00a17bd9  CALL EDX
00a17bdb  OR EBP,0xffffffff
00a17bde  TEST byte ptr [EBX + 0x14],0x40
00a17be2  JZ 0x00a17bef
00a17be4  MOV dword ptr [ESI + 0x44],0x1
00a17beb  PUSH 0x0
00a17bed  JMP 0x00a17c1c
00a17bef  CMP byte ptr [EBX + 0x15],0x0
00a17bf3  JGE 0x00a17bfa
00a17bf5  MOV dword ptr [ESI + 0x44],EBP
00a17bf8  JMP 0x00a17c1a
00a17bfa  MOVSX AX,byte ptr [EBX + 0x16]
00a17bff  ADD AX,0x1
00a17c03  PUSH EAX
00a17c04  PUSH 0x0
00a17c06  CALL 0x00a012e0
00a17c0b  MOVSX EDX,byte ptr [EBX + 0x15]
00a17c0f  MOVSX ECX,AX
00a17c12  ADD ESP,0x8
00a17c15  ADD ECX,EDX
00a17c17  MOV dword ptr [ESI + 0x44],ECX
00a17c1a  PUSH 0x2
00a17c1c  MOV ECX,ESI
00a17c1e  CALL 0x00a210f0
00a17c23  MOV ECX,EDI
00a17c25  MOV byte ptr [ESI + 0x60],0x0
00a17c29  MOV dword ptr [ESI + 0x54],0x1
00a17c30  CALL 0x00a20070
00a17c35  MOV EBX,dword ptr [EAX + 0x1b4]
00a17c3b  MOV ECX,EDI
00a17c3d  CALL 0x00a20070
00a17c42  ADD EAX,0xf0
00a17c47  MOV dword ptr [ESP + 0x10],0x1096e30
00a17c4f  MOV dword ptr [ESP + 0x18],EAX
00a17c53  MOV dword ptr [ESP + 0x1c],EBX
00a17c57  MOV EAX,dword ptr [ESI]
00a17c59  MOV EDX,dword ptr [EAX + 0xbc]
00a17c5f  LEA ECX,[ESP + 0x10]
00a17c63  PUSH ECX
00a17c64  MOV ECX,ESI
00a17c66  MOV byte ptr [ESP + 0x50],0x2
00a17c6b  CALL EDX
00a17c6d  MOV EAX,dword ptr [ESI]
00a17c6f  MOV EDX,dword ptr [EAX + 0xac]
00a17c75  MOV ECX,ESI
00a17c77  CALL EDX
00a17c79  LEA ECX,[ESP + 0x20]
00a17c7d  MOV byte ptr [ESI + 0x40],0x1
00a17c81  MOV dword ptr [ESP + 0x10],0x1096d54
00a17c89  MOV dword ptr [ESP + 0x4c],EBP
00a17c8d  MOV dword ptr [ESP + 0x20],0x1096d64
00a17c95  CALL 0x00a25ed0
00a17c9a  MOV ECX,dword ptr [ESP + 0x44]
00a17c9e  POP EDI
00a17c9f  POP ESI
00a17ca0  POP EBP
00a17ca1  POP EBX
00a17ca2  MOV dword ptr FS:[0x0],ECX
00a17ca9  ADD ESP,0x40
00a17cac  RET 0x10
