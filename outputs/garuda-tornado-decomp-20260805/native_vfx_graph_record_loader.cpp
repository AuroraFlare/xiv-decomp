program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BE7A40 =====
entry=00be7a40
body=[[00be7a40, 00be7a75] [00be7a90, 00be7abd]]
completed=true
message=

int FUN_00be7a40(int param_1,byte *param_2,undefined4 *param_3,undefined4 *param_4)

{
  uint uVar1;
  int iVar2;
  
  *param_4 = 0x10;
  uVar1 = 0;
  if ((param_2[1] & 2) == 0) {
    uVar1 = (uint)*(ushort *)(param_2 + 6);
  }
  else {
    iVar2 = 0;
    switch(*param_2 & 0xf) {
    case 1:
      iVar2 = 8;
      break;
    case 2:
    case 3:
      iVar2 = 0x10;
      break;
    case 4:
      iVar2 = 0x20;
      break;
    case 5:
      iVar2 = 0xc;
    }
    if ((*param_2 >> 4 & 3) == 3) {
      uVar1 = iVar2 + 0x13 + (uint)*(byte *)(*(int *)*param_3 + 1) * 8 & 0xfffffff0;
    }
  }
  if (param_1 != 0) {
    return uVar1 + 0x30;
  }
  return uVar1 + 0x20;
}


-- listing --
00be7a40  MOV ECX,dword ptr [ESP + 0x10]
00be7a44  MOV dword ptr [ECX],0x10
00be7a4a  MOV ECX,dword ptr [ESP + 0x8]
00be7a4e  XOR EAX,EAX
00be7a50  TEST byte ptr [ECX + 0x1],0x2
00be7a54  PUSH ESI
00be7a55  JZ 0x00be7aaa
00be7a57  MOVZX ECX,byte ptr [ECX]
00be7a5a  MOV EDX,ECX
00be7a5c  AND ECX,0xf
00be7a5f  SHR EDX,0x4
00be7a62  ADD ECX,-0x1
00be7a65  AND EDX,0x3
00be7a68  XOR ESI,ESI
00be7a6a  CMP ECX,0x4
00be7a6d  JA 0x00be7a90
00be7a6f  JMP dword ptr [ECX*0x4 + 0xbe7ac0]
00be7a90  CMP EDX,0x3
00be7a93  JNZ 0x00be7aae
00be7a95  MOV EDX,dword ptr [ESP + 0x10]
00be7a99  MOV EAX,dword ptr [EDX]
00be7a9b  MOV ECX,dword ptr [EAX]
00be7a9d  MOVZX EDX,byte ptr [ECX + 0x1]
00be7aa1  LEA EAX,[ESI + EDX*0x8 + 0x13]
00be7aa5  AND EAX,0xfffffff0
00be7aa8  JMP 0x00be7aae
00be7aaa  MOVZX EAX,word ptr [ECX + 0x6]
00be7aae  CMP dword ptr [ESP + 0x8],0x0
00be7ab3  POP ESI
00be7ab4  JNZ 0x00be7aba
00be7ab6  ADD EAX,0x20
00be7ab9  RET
00be7aba  ADD EAX,0x30
00be7abd  RET

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
      uVar2 = func_0x00be7ae0(param_1[2],*(int *)(iVar1 + 4) + iVar4);
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
