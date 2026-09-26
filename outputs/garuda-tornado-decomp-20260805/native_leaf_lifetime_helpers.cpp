program=ffxivgame-ifrit.exe
image_base=00400000

===== 00ba42a0 =====
entry=00ba42a0
body=[[00ba42a0, 00ba42c9] [00ba4346, 00ba434e]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba42a0(void)

{
  char cVar1;
  int in_EAX;
  int unaff_ESI;
  float fVar2;
  
  func_0x00e3a460();
  switch(*(undefined1 *)(unaff_ESI + 0x1c)) {
  case 0:
    return;
  case 1:
    if (in_EAX < *(int *)(unaff_ESI + 0x14)) {
      return;
    }
    cVar1 = func_0x00bccb50();
    if (cVar1 == '\0') {
      return;
    }
    return;
  case 2:
    if (*(int *)(unaff_ESI + 0x14) <= in_EAX) {
      return;
    }
    break;
  case 3:
  case 4:
    fVar2 = (float)(in_EAX - *(int *)(unaff_ESI + 0x14));
    if (0.0 < fVar2) {
      if (*(int *)(unaff_ESI + 0x18) < 1) {
        return;
      }
      if (_DAT_00f54f70 <= fVar2 / (float)*(int *)(unaff_ESI + 0x18)) {
        return;
      }
      return;
    }
    break;
  case 5:
  case 6:
  case 7:
    break;
  default:
    return;
  }
  return;
}


-- listing --
00ba42a0  PUSH ECX
00ba42a1  XORPS XMM0,XMM0
00ba42a4  PUSH EDI
00ba42a5  PUSH ESI
00ba42a6  MOV EDI,EAX
00ba42a8  MOVSS dword ptr [ESP + 0x8],XMM0
00ba42ae  CALL 0x00e3a460
00ba42b3  MOVZX ECX,byte ptr [ESI + 0x1c]
00ba42b7  ADD ESP,0x4
00ba42ba  CMP ECX,0x7
00ba42bd  JA 0x00ba4346
00ba42c3  JMP dword ptr [ECX*0x4 + 0xba4350]
00ba4346  MOVSS XMM0,dword ptr [ESP + 0x4]
00ba434c  POP EDI
00ba434d  POP ECX
00ba434e  RET

===== 00d58910 =====
entry=00d58910
body=[[00d58910, 00d58939] [00d589b9, 00d589c1]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d58910(void)

{
  char cVar1;
  int in_EAX;
  int iVar2;
  int unaff_ESI;
  float fVar3;
  
  iVar2 = func_0x00e3a460();
  switch(*(undefined1 *)(unaff_ESI + 0x1c)) {
  case 0:
    return;
  case 1:
    if (in_EAX < *(int *)(*(int *)(iVar2 + 0x10) + 0x44)) {
      return;
    }
    cVar1 = func_0x00bccb50();
    if (cVar1 == '\0') {
      return;
    }
    return;
  case 2:
    if (*(int *)(unaff_ESI + 0x14) <= in_EAX) {
      return;
    }
    break;
  case 3:
  case 4:
    fVar3 = (float)(in_EAX - *(int *)(unaff_ESI + 0x14));
    if (0.0 < fVar3) {
      if (*(int *)(unaff_ESI + 0x18) == 0) {
        return;
      }
      if (_DAT_00f54f70 <= fVar3 / (float)*(int *)(unaff_ESI + 0x18)) {
        return;
      }
      return;
    }
    break;
  case 5:
  case 6:
  case 7:
    break;
  default:
    return;
  }
  return;
}


-- listing --
00d58910  PUSH ECX
00d58911  XORPS XMM0,XMM0
00d58914  PUSH EDI
00d58915  PUSH ESI
00d58916  MOV EDI,EAX
00d58918  MOVSS dword ptr [ESP + 0x8],XMM0
00d5891e  CALL 0x00e3a460
00d58923  MOVZX ECX,byte ptr [ESI + 0x1c]
00d58927  ADD ESP,0x4
00d5892a  CMP ECX,0x7
00d5892d  JA 0x00d589b9
00d58933  JMP dword ptr [ECX*0x4 + 0xd589c4]
00d589b9  MOVSS XMM0,dword ptr [ESP + 0x4]
00d589bf  POP EDI
00d589c0  POP ECX
00d589c1  RET

===== 00bb3bd0 =====
entry=00bb3bd0
body=[[00bb3bd0, 00bb3bde]]
completed=true
message=

void __thiscall FUN_00bb3bd0(int param_1,undefined4 *param_2)

{
  *param_2 = *(undefined4 *)(param_1 + 0xc4);
  return;
}


-- listing --
00bb3bd0  MOV ECX,dword ptr [ECX + 0xc4]
00bb3bd6  MOV EAX,dword ptr [ESP + 0x4]
00bb3bda  MOV dword ptr [EAX],ECX
00bb3bdc  RET 0x4

===== 00bb35d0 =====
entry=00bb35d0
body=[[00bb35d0, 00bb35df]]
completed=true
message=

bool __thiscall FUN_00bb35d0(int param_1,uint param_2)

{
  return (*(uint *)(param_1 + 0x28) & param_2) != 0;
}


-- listing --
00bb35d0  MOV EAX,dword ptr [ECX + 0x28]
00bb35d3  AND EAX,dword ptr [ESP + 0x4]
00bb35d7  NEG EAX
00bb35d9  SBB EAX,EAX
00bb35db  NEG EAX
00bb35dd  RET 0x4

===== 00bb35e0 =====
entry=00bb35e0
body=[[00bb35e0, 00bb35f1]]
completed=true
message=

void __thiscall FUN_00bb35e0(int param_1,uint param_2)

{
  if ((*(byte *)(param_1 + 0x1c) & 1) != 0) {
    *(uint *)(param_1 + 0x28) = *(uint *)(param_1 + 0x28) & ~param_2;
  }
  return;
}


-- listing --
00bb35e0  TEST byte ptr [ECX + 0x1c],0x1
00bb35e4  JZ 0x00bb35ef
00bb35e6  MOV EAX,dword ptr [ESP + 0x4]
00bb35ea  NOT EAX
00bb35ec  AND dword ptr [ECX + 0x28],EAX
00bb35ef  RET 0x4

===== 00e3a460 =====
entry=00e3a460
body=[[00e3a460, 00e3a46b]]
completed=true
message=

undefined4 FUN_00e3a460(int *param_1)

{
  return **(undefined4 **)(*param_1 + 8);
}


-- listing --
00e3a460  MOV EAX,dword ptr [ESP + 0x4]
00e3a464  MOV ECX,dword ptr [EAX]
00e3a466  MOV EDX,dword ptr [ECX + 0x8]
00e3a469  MOV EAX,dword ptr [EDX]
00e3a46b  RET
