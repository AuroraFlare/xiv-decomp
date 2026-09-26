program=ffxivgame-ifrit.exe
image_base=00400000

===== 0x00BA4C10 =====
entry=00ba4c10
body=[[00ba4c10, 00ba4c35]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00ba4c10(int param_1)

{
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = _DAT_00f54f70;
  return 1;
}


-- listing --
00ba4c10  MOV EAX,dword ptr [ESP + 0x4]
00ba4c14  XORPS XMM0,XMM0
00ba4c17  MOVSS dword ptr [EAX + 0x10],XMM0
00ba4c1c  MOVSS dword ptr [EAX + 0x14],XMM0
00ba4c21  MOVSS dword ptr [EAX + 0x18],XMM0
00ba4c26  MOVSS XMM0,dword ptr [0x00f54f70]
00ba4c2e  MOVSS dword ptr [EAX + 0x1c],XMM0
00ba4c33  MOV AL,0x1
00ba4c35  RET

===== 0x00BA4C40 =====
entry=00ba4c40
body=[[00ba4c40, 00ba4c40]]
completed=true
message=

void FUN_00ba4c40(void)

{
  return;
}


-- listing --
00ba4c40  RET

===== 0x00BA4C50 =====
entry=00ba4c50
body=[[00ba4c50, 00ba4c50]]
completed=true
message=

void FUN_00ba4c50(void)

{
  return;
}


-- listing --
00ba4c50  RET

===== 0x00BA4C60 =====
entry=00ba4c60
body=[[00ba4c60, 00ba4ca1]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba4c60(int param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  
  puVar3 = *(undefined4 **)(param_1 + 0x20);
  uVar1 = puVar3[1];
  uVar2 = puVar3[2];
  *(undefined4 *)(param_1 + 0x10) = *puVar3;
  *(undefined4 *)(param_1 + 0x14) = uVar1;
  uVar1 = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x18) = uVar2;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  if (*(int *)(param_1 + 0x24) != 0) {
    func_0x00ba4b50(*(int *)(param_1 + 0x24),param_1 + 0x10);
  }
  return;
}


-- listing --
00ba4c60  MOV EDX,dword ptr [ESP + 0x4]
00ba4c64  MOV ECX,dword ptr [EDX + 0x20]
00ba4c67  MOVSS XMM0,dword ptr [ECX + 0x4]
00ba4c6c  FLD float ptr [ECX]
00ba4c6e  MOVSS XMM1,dword ptr [ECX + 0x8]
00ba4c73  FSTP float ptr [EDX + 0x10]
00ba4c76  LEA EAX,[EDX + 0x10]
00ba4c79  MOVSS dword ptr [EAX + 0x4],XMM0
00ba4c7e  MOVSS XMM0,dword ptr [0x00f54f70]
00ba4c86  MOVSS dword ptr [EAX + 0x8],XMM1
00ba4c8b  MOVSS dword ptr [EAX + 0xc],XMM0
00ba4c90  MOV EDX,dword ptr [EDX + 0x24]
00ba4c93  TEST EDX,EDX
00ba4c95  JZ 0x00ba4ca1
00ba4c97  PUSH EAX
00ba4c98  PUSH EDX
00ba4c99  CALL 0x00ba4b50
00ba4c9e  ADD ESP,0x8
00ba4ca1  RET

===== 0x00BA4D60 =====
entry=00ba4d60
body=[[00ba4d60, 00ba4dd6]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba4d60(int param_1,int *param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined8 uStack_8;
  
  param_2[0] = 0;
  param_2[1] = 0;
  param_2[2] = 0;
  param_2[3] = 0;
  param_2[4] = 0;
  param_2[5] = 0;
  param_2[6] = 0;
  param_2[7] = 0;
  param_2[8] = 0;
  param_2[9] = 0;
  if (*(int *)(*(int *)(param_1 + 0x20) + 0xc) != 0) {
    *param_2 = (int)(param_2 + 1);
    func_0x00bceb80(param_2 + 1);
  }
  uVar3 = _DAT_00f54f70;
  uVar1 = *(undefined8 *)(param_1 + 0x18);
  uVar2 = *(undefined8 *)(param_1 + 0x10);
  param_2[5] = (int)(param_2 + 6);
  *(undefined8 *)(param_2 + 6) = uVar2;
  uStack_8 = CONCAT44(uVar3,(int)uVar1);
  *(undefined8 *)(param_2 + 8) = uStack_8;
  return;
}


-- listing --
00ba4d60  SUB ESP,0x10
00ba4d63  PXOR XMM0,XMM0
00ba4d67  PUSH ESI
00ba4d68  MOV ESI,dword ptr [ESP + 0x1c]
00ba4d6c  MOVQ qword ptr [ESI],XMM0
00ba4d70  MOVQ qword ptr [ESI + 0x8],XMM0
00ba4d75  MOVQ qword ptr [ESI + 0x10],XMM0
00ba4d7a  MOVQ qword ptr [ESI + 0x18],XMM0
00ba4d7f  PUSH EDI
00ba4d80  MOV EDI,dword ptr [ESP + 0x1c]
00ba4d84  MOVQ qword ptr [ESI + 0x20],XMM0
00ba4d89  MOV EAX,dword ptr [EDI + 0x20]
00ba4d8c  MOV ECX,dword ptr [EAX + 0xc]
00ba4d8f  TEST ECX,ECX
00ba4d91  JZ 0x00ba4d9e
00ba4d93  LEA EAX,[ESI + 0x4]
00ba4d96  PUSH EAX
00ba4d97  MOV dword ptr [ESI],EAX
00ba4d99  CALL 0x00bceb80
00ba4d9e  MOVQ XMM1,qword ptr [EDI + 0x18]
00ba4da3  MOVQ XMM0,qword ptr [EDI + 0x10]
00ba4da8  LEA EAX,[ESI + 0x18]
00ba4dab  MOVQ qword ptr [ESP + 0x10],XMM1
00ba4db1  MOVSS XMM1,dword ptr [0x00f54f70]
00ba4db9  MOV dword ptr [ESI + 0x14],EAX
00ba4dbc  MOVQ qword ptr [EAX],XMM0
00ba4dc0  MOVSS dword ptr [ESP + 0x14],XMM1
00ba4dc6  MOVQ XMM0,qword ptr [ESP + 0x10]
00ba4dcc  POP EDI
00ba4dcd  MOVQ qword ptr [EAX + 0x8],XMM0
00ba4dd2  POP ESI
00ba4dd3  ADD ESP,0x10
00ba4dd6  RET

===== 0x00BA5500 =====
entry=00ba5500
body=[[00ba5500, 00ba5525]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00ba5500(int param_1)

{
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = _DAT_00f54f70;
  return 1;
}


-- listing --
00ba5500  MOV EAX,dword ptr [ESP + 0x4]
00ba5504  XORPS XMM0,XMM0
00ba5507  MOVSS dword ptr [EAX + 0x10],XMM0
00ba550c  MOVSS dword ptr [EAX + 0x14],XMM0
00ba5511  MOVSS dword ptr [EAX + 0x18],XMM0
00ba5516  MOVSS XMM0,dword ptr [0x00f54f70]
00ba551e  MOVSS dword ptr [EAX + 0x1c],XMM0
00ba5523  MOV AL,0x1
00ba5525  RET

===== 0x00BA5530 =====
entry=00ba5530
body=[[00ba5530, 00ba5530]]
completed=true
message=

void FUN_00ba5530(void)

{
  return;
}


-- listing --
00ba5530  RET

===== 0x00BA5540 =====
entry=00ba5540
body=[[00ba5540, 00ba5540]]
completed=true
message=

void FUN_00ba5540(void)

{
  return;
}


-- listing --
00ba5540  RET

===== 0x00BA5550 =====
entry=00ba5550
body=[[00ba5550, 00ba5591]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5550(int param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  
  puVar3 = *(undefined4 **)(param_1 + 0x20);
  uVar1 = puVar3[1];
  uVar2 = puVar3[2];
  *(undefined4 *)(param_1 + 0x10) = *puVar3;
  *(undefined4 *)(param_1 + 0x14) = uVar1;
  uVar1 = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x18) = uVar2;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  if (*(int *)(param_1 + 0x24) != 0) {
    func_0x00ba4960(*(int *)(param_1 + 0x24),param_1 + 0x10);
  }
  return;
}


-- listing --
00ba5550  MOV EDX,dword ptr [ESP + 0x4]
00ba5554  MOV ECX,dword ptr [EDX + 0x20]
00ba5557  MOVSS XMM0,dword ptr [ECX + 0x4]
00ba555c  FLD float ptr [ECX]
00ba555e  MOVSS XMM1,dword ptr [ECX + 0x8]
00ba5563  FSTP float ptr [EDX + 0x10]
00ba5566  LEA EAX,[EDX + 0x10]
00ba5569  MOVSS dword ptr [EAX + 0x4],XMM0
00ba556e  MOVSS XMM0,dword ptr [0x00f54f70]
00ba5576  MOVSS dword ptr [EAX + 0x8],XMM1
00ba557b  MOVSS dword ptr [EAX + 0xc],XMM0
00ba5580  MOV EDX,dword ptr [EDX + 0x24]
00ba5583  TEST EDX,EDX
00ba5585  JZ 0x00ba5591
00ba5587  PUSH EAX
00ba5588  PUSH EDX
00ba5589  CALL 0x00ba4960
00ba558e  ADD ESP,0x8
00ba5591  RET

===== 0x00BA5DF0 =====
entry=00ba5df0
body=[[00ba5df0, 00ba5e12]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00ba5df0(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x10) = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x14) = uVar1;
  *(undefined4 *)(param_1 + 0x18) = uVar1;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  return 1;
}


-- listing --
00ba5df0  MOV EAX,dword ptr [ESP + 0x4]
00ba5df4  MOVSS XMM0,dword ptr [0x00f54f70]
00ba5dfc  MOVSS dword ptr [EAX + 0x10],XMM0
00ba5e01  MOVSS dword ptr [EAX + 0x14],XMM0
00ba5e06  MOVSS dword ptr [EAX + 0x18],XMM0
00ba5e0b  MOVSS dword ptr [EAX + 0x1c],XMM0
00ba5e10  MOV AL,0x1
00ba5e12  RET

===== 0x00BA5E20 =====
entry=00ba5e20
body=[[00ba5e20, 00ba5e20]]
completed=true
message=

void FUN_00ba5e20(void)

{
  return;
}


-- listing --
00ba5e20  RET

===== 0x00BA5E30 =====
entry=00ba5e30
body=[[00ba5e30, 00ba5e30]]
completed=true
message=

void FUN_00ba5e30(void)

{
  return;
}


-- listing --
00ba5e30  RET

===== 0x00BA5E40 =====
entry=00ba5e40
body=[[00ba5e40, 00ba5e81]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5e40(int param_1)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  
  puVar3 = *(undefined4 **)(param_1 + 0x20);
  uVar1 = puVar3[1];
  uVar2 = puVar3[2];
  *(undefined4 *)(param_1 + 0x10) = *puVar3;
  *(undefined4 *)(param_1 + 0x14) = uVar1;
  uVar1 = _DAT_00f54f70;
  *(undefined4 *)(param_1 + 0x18) = uVar2;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  if (*(int *)(param_1 + 0x24) != 0) {
    func_0x00ba4b50(*(int *)(param_1 + 0x24),param_1 + 0x10);
  }
  return;
}


-- listing --
00ba5e40  MOV EDX,dword ptr [ESP + 0x4]
00ba5e44  MOV ECX,dword ptr [EDX + 0x20]
00ba5e47  MOVSS XMM0,dword ptr [ECX + 0x4]
00ba5e4c  FLD float ptr [ECX]
00ba5e4e  MOVSS XMM1,dword ptr [ECX + 0x8]
00ba5e53  FSTP float ptr [EDX + 0x10]
00ba5e56  LEA EAX,[EDX + 0x10]
00ba5e59  MOVSS dword ptr [EAX + 0x4],XMM0
00ba5e5e  MOVSS XMM0,dword ptr [0x00f54f70]
00ba5e66  MOVSS dword ptr [EAX + 0x8],XMM1
00ba5e6b  MOVSS dword ptr [EAX + 0xc],XMM0
00ba5e70  MOV EDX,dword ptr [EDX + 0x24]
00ba5e73  TEST EDX,EDX
00ba5e75  JZ 0x00ba5e81
00ba5e77  PUSH EAX
00ba5e78  PUSH EDX
00ba5e79  CALL 0x00ba4b50
00ba5e7e  ADD ESP,0x8
00ba5e81  RET
