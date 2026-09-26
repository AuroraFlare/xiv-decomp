program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BAC500 =====
entry=00bac500
body=[[00bac500, 00bac558]]
completed=true
message=

void __fastcall FUN_00bac500(int param_1,uint param_2)

{
  undefined4 *puVar1;
  int unaff_EBX;
  int unaff_ESI;
  undefined4 *in_stack_00000010;
  
  *(byte *)(unaff_EBX + -0x35d4f7b2) = *(byte *)(unaff_EBX + -0x35d4f7b2) | (byte)param_1;
  if ((param_2 != 0) &&
     ((uint)(param_1 >> 2) < (uint)((int)(*(int *)(unaff_ESI + 0xc) - param_2) >> 2))) {
    puVar1 = *(undefined4 **)(unaff_ESI + 8);
    *puVar1 = *in_stack_00000010;
    *(undefined4 **)(unaff_ESI + 8) = puVar1 + 1;
    return;
  }
  if (*(uint *)(unaff_ESI + 8) < param_2) {
    func_0x009d22b4();
  }
  func_0x00bac460(&stack0x00000004);
  return;
}


-- listing --
00bac500  OR byte ptr [EBX + 0xca2b084e],CL
00bac506  SAR ECX,0x2
00bac509  TEST EDX,EDX
00bac50b  JZ 0x00bac531
00bac50d  MOV EAX,dword ptr [ESI + 0xc]
00bac510  SUB EAX,EDX
00bac512  SAR EAX,0x2
00bac515  CMP ECX,EAX
00bac517  JNC 0x00bac531
00bac519  MOV EAX,dword ptr [ESI + 0x8]
00bac51c  MOV ECX,dword ptr [ESP + 0x10]
00bac520  MOV EDX,dword ptr [ECX]
00bac522  MOV dword ptr [EAX],EDX
00bac524  ADD EAX,0x4
00bac527  MOV dword ptr [ESI + 0x8],EAX
00bac52a  POP ESI
00bac52b  ADD ESP,0x8
00bac52e  RET 0x4
00bac531  PUSH EDI
00bac532  MOV EDI,dword ptr [ESI + 0x8]
00bac535  CMP EDX,EDI
00bac537  JBE 0x00bac53e
00bac539  CALL 0x009d22b4
00bac53e  MOV EAX,dword ptr [ESP + 0x14]
00bac542  PUSH EAX
00bac543  PUSH EDI
00bac544  PUSH ESI
00bac545  LEA ECX,[ESP + 0x14]
00bac549  PUSH ECX
00bac54a  MOV ECX,ESI
00bac54c  CALL 0x00bac460
00bac551  POP EDI
00bac552  POP ESI
00bac553  ADD ESP,0x8
00bac556  RET 0x4

===== 00BAC5D0 =====
entry=00bac5d0
body=[[00bac5d0, 00bac5d5]]
completed=true
message=

void __fastcall FUN_00bac5d0(char param_1)

{
  char *unaff_EDI;
  
  *unaff_EDI = *unaff_EDI + param_1;
  return;
}


-- listing --
00bac5d0  ADD byte ptr [EDI],CL
00bac5d2  POP ECX
00bac5d3  RETF 0xc60f

===== 00BAC600 =====
entry=00bac600
body=[[00bac600, 00bac61e]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bac600(void)

{
  int in_EAX;
  
  if (in_EAX != 0) {
    _DAT_0132807c = in_EAX;
  }
  if (_DAT_0132807c == 0) {
    _DAT_0132807c = func_0x0040e500();
  }
  return;
}


-- listing --
00bac600  TEST EAX,EAX
00bac602  JZ 0x00bac60b
00bac604  MOV [0x0132807c],EAX
00bac609  JMP 0x00bac610
00bac60b  MOV EAX,[0x0132807c]
00bac610  TEST EAX,EAX
00bac612  JNZ 0x00bac61e
00bac614  CALL 0x0040e500
00bac619  MOV [0x0132807c],EAX
00bac61e  RET

===== 00BAC640 =====
NO_FUNCTION
