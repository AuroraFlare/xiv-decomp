program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BE7BC0 =====
entry=00be7bc0
body=[[00be7bc0, 00be7c0a]]
completed=true
message=

void __fastcall FUN_00be7bc0(int *param_1)

{
  int iVar1;
  undefined2 uVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  
  iVar1 = *param_1;
  uVar3 = (uint)*(ushort *)(iVar1 + 8);
  iVar5 = 0;
  if (uVar3 != 0) {
    iVar4 = 0;
    do {
      uVar2 = FUN_00be7ae0(param_1[2],*(int *)(iVar1 + 4) + iVar4);
      *(undefined2 *)(param_1[7] + iVar5 * 2) = uVar2;
      iVar5 = iVar5 + 1;
      iVar4 = iVar4 + 0xc;
    } while (iVar5 < (int)uVar3);
  }
  return;
}


-- listing --
00be7bc0  PUSH ECX
00be7bc1  PUSH EBP
00be7bc2  PUSH ESI
00be7bc3  PUSH EDI
00be7bc4  MOV EDI,ECX
00be7bc6  MOV EBP,dword ptr [EDI]
00be7bc8  MOVZX EAX,word ptr [EBP + 0x8]
00be7bcc  XOR ESI,ESI
00be7bce  TEST EAX,EAX
00be7bd0  MOV dword ptr [ESP + 0xc],EAX
00be7bd4  JLE 0x00be7c06
00be7bd6  PUSH EBX
00be7bd7  XOR EBX,EBX
00be7bd9  LEA ESP,[ESP]
00be7be0  MOV EAX,dword ptr [EBP + 0x4]
00be7be3  MOV ECX,dword ptr [EDI + 0x8]
00be7be6  ADD EAX,EBX
00be7be8  PUSH EAX
00be7be9  PUSH ECX
00be7bea  CALL 0x00be7ae0
00be7bef  MOV EDX,dword ptr [EDI + 0x1c]
00be7bf2  MOV word ptr [EDX + ESI*0x2],AX
00be7bf6  ADD ESI,0x1
00be7bf9  ADD ESP,0x8
00be7bfc  ADD EBX,0xc
00be7bff  CMP ESI,dword ptr [ESP + 0x10]
00be7c03  JL 0x00be7be0
00be7c05  POP EBX
00be7c06  POP EDI
00be7c07  POP ESI
00be7c08  POP EBP
00be7c09  POP ECX
00be7c0a  RET

===== 00BE7C10 =====
entry=00be7c10
body=[[00be7c10, 00be7c3b] [00be7c40, 00be7cd4]]
completed=true
message=

void __fastcall FUN_00be7c10(int *param_1)

{
  short *psVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iStack_14;
  int iStack_10;
  short *psStack_c;
  uint uStack_4;
  
  iStack_10 = *param_1;
  uStack_4 = (uint)*(ushort *)(iStack_10 + 8);
  iVar6 = 0;
  iVar4 = uStack_4 * 4;
  iStack_14 = 0;
  iVar5 = 0;
  if (uStack_4 != 0) {
    do {
      iVar2 = FUN_00be7a40(param_1[3],param_1[2],*(int *)(iStack_10 + 4) + iVar6 * 0xc,&iStack_14);
      uVar3 = iStack_14 + -1 + iVar4 & ~(iStack_14 - 1U);
      *(short *)(param_1[8] + iVar6 * 2) = (short)iVar2;
      if (iVar6 == 0) {
        param_1[5] = uVar3;
      }
      else {
        psStack_c = (short *)(param_1[8] + -2 + iVar6 * 2);
        *psStack_c = *psStack_c + ((short)uVar3 - (short)iVar5);
      }
      iVar4 = uVar3 + iVar2;
      iVar6 = iVar6 + 1;
      iVar5 = iVar4;
    } while (iVar6 < (int)uStack_4);
    if (0xf < iStack_14) goto LAB_00be7cb1;
  }
  iStack_14 = 0x10;
LAB_00be7cb1:
  uVar3 = iStack_14 + -1 + iVar4 & ~(iStack_14 - 1U);
  psVar1 = (short *)(param_1[8] + -2 + iVar6 * 2);
  *psVar1 = *psVar1 + ((short)uVar3 - (short)iVar5);
  param_1[4] = uVar3;
  return;
}


-- listing --
00be7c10  SUB ESP,0x14
00be7c13  PUSH EBX
00be7c14  PUSH EBP
00be7c15  PUSH ESI
00be7c16  PUSH EDI
00be7c17  MOV EDI,ECX
00be7c19  MOV EAX,dword ptr [EDI]
00be7c1b  MOVZX ECX,word ptr [EAX + 0x8]
00be7c1f  XOR ESI,ESI
00be7c21  XOR EBP,EBP
00be7c23  CMP ECX,ESI
00be7c25  MOV dword ptr [ESP + 0x14],EAX
00be7c29  MOV dword ptr [ESP + 0x20],ECX
00be7c2d  LEA EBX,[ECX*0x4 + 0x0]
00be7c34  MOV dword ptr [ESP + 0x10],ESI
00be7c38  JLE 0x00be7cac
00be7c3a  JMP 0x00be7c44
00be7c40  MOV EAX,dword ptr [ESP + 0x14]
00be7c44  MOV EDX,dword ptr [EAX + 0x4]
00be7c47  LEA ECX,[ESI + ESI*0x2]
00be7c4a  LEA EAX,[EDX + ECX*0x4]
00be7c4d  MOV EDX,dword ptr [EDI + 0x8]
00be7c50  LEA ECX,[ESP + 0x10]
00be7c54  PUSH ECX
00be7c55  PUSH EAX
00be7c56  MOV EAX,dword ptr [EDI + 0xc]
00be7c59  PUSH EDX
00be7c5a  PUSH EAX
00be7c5b  CALL 0x00be7a40
00be7c60  MOV ECX,dword ptr [ESP + 0x20]
00be7c64  LEA EDX,[ECX + -0x1]
00be7c67  NOT EDX
00be7c69  LEA EBX,[ECX + EBX*0x1 + -0x1]
00be7c6d  AND EBX,EDX
00be7c6f  MOV EDX,dword ptr [EDI + 0x20]
00be7c72  ADD ESP,0x10
00be7c75  TEST ESI,ESI
00be7c77  MOV word ptr [EDX + ESI*0x2],AX
00be7c7b  JNZ 0x00be7c82
00be7c7d  MOV dword ptr [EDI + 0x14],EBX
00be7c80  JMP 0x00be7c9a
00be7c82  MOV EDX,dword ptr [EDI + 0x20]
00be7c85  LEA EDX,[EDX + ESI*0x2 + -0x2]
00be7c89  MOV dword ptr [ESP + 0x18],EDX
00be7c8d  MOV EDX,EBX
00be7c8f  SUB EDX,EBP
00be7c91  MOV EBP,EDX
00be7c93  MOV EDX,dword ptr [ESP + 0x18]
00be7c97  ADD word ptr [EDX],BP
00be7c9a  ADD EBX,EAX
00be7c9c  ADD ESI,0x1
00be7c9f  CMP ESI,dword ptr [ESP + 0x20]
00be7ca3  MOV EBP,EBX
00be7ca5  JL 0x00be7c40
00be7ca7  CMP ECX,0x10
00be7caa  JGE 0x00be7cb1
00be7cac  MOV ECX,0x10
00be7cb1  LEA EAX,[ECX + EBX*0x1 + -0x1]
00be7cb5  ADD ECX,-0x1
00be7cb8  NOT ECX
00be7cba  AND EAX,ECX
00be7cbc  MOV ECX,dword ptr [EDI + 0x20]
00be7cbf  MOV EDX,EAX
00be7cc1  LEA ECX,[ECX + ESI*0x2 + -0x2]
00be7cc5  SUB EDX,EBP
00be7cc7  ADD word ptr [ECX],DX
00be7cca  MOV dword ptr [EDI + 0x10],EAX
00be7ccd  POP EDI
00be7cce  POP ESI
00be7ccf  POP EBP
00be7cd0  POP EBX
00be7cd1  ADD ESP,0x14
00be7cd4  RET

===== 00BE7D50 =====
entry=00be7d50
body=[[00be7d50, 00be7db6]]
completed=true
message=

int * __thiscall
FUN_00be7d50(int *param_1,int param_2,int param_3,int param_4,int param_5,int param_6,int param_7)

{
  byte bVar1;
  undefined4 uVar2;
  
  param_1[2] = param_3;
  param_1[6] = param_4;
  param_1[7] = param_5;
  *param_1 = param_2;
  *(undefined1 *)(param_1 + 1) = 1;
  param_1[8] = param_6;
  param_1[3] = param_7;
  bVar1 = *(byte *)(param_2 + 2);
  *(byte *)(param_1 + 9) = bVar1;
  if (1 < bVar1) {
    uVar2 = func_0x00415c90(2,&UNK_010cee1c);
    func_0x004160e0(uVar2);
    *(undefined1 *)(param_1 + 9) = 0;
  }
  FUN_00be7bc0();
  FUN_00be7c10();
  return param_1;
}


-- listing --
00be7d50  MOV EDX,dword ptr [ESP + 0xc]
00be7d54  MOV EAX,dword ptr [ESP + 0x4]
00be7d58  PUSH ESI
00be7d59  MOV ESI,ECX
00be7d5b  MOV ECX,dword ptr [ESP + 0xc]
00be7d5f  MOV dword ptr [ESI + 0x8],ECX
00be7d62  MOV ECX,dword ptr [ESP + 0x14]
00be7d66  MOV dword ptr [ESI + 0x18],EDX
00be7d69  MOV EDX,dword ptr [ESP + 0x18]
00be7d6d  MOV dword ptr [ESI + 0x1c],ECX
00be7d70  MOV ECX,dword ptr [ESP + 0x1c]
00be7d74  MOV dword ptr [ESI],EAX
00be7d76  MOV byte ptr [ESI + 0x4],0x1
00be7d7a  MOV dword ptr [ESI + 0x20],EDX
00be7d7d  MOV dword ptr [ESI + 0xc],ECX
00be7d80  MOV AL,byte ptr [EAX + 0x2]
00be7d83  CMP AL,0x2
00be7d85  MOV byte ptr [ESI + 0x24],AL
00be7d88  JC 0x00be7da3
00be7d8a  PUSH 0x10cee1c
00be7d8f  PUSH 0x2
00be7d91  CALL 0x00415c90
00be7d96  PUSH EAX
00be7d97  CALL 0x004160e0
00be7d9c  ADD ESP,0xc
00be7d9f  MOV byte ptr [ESI + 0x24],0x0
00be7da3  MOV ECX,ESI
00be7da5  CALL 0x00be7bc0
00be7daa  MOV ECX,ESI
00be7dac  CALL 0x00be7c10
00be7db1  MOV EAX,ESI
00be7db3  POP ESI
00be7db4  RET 0x18
