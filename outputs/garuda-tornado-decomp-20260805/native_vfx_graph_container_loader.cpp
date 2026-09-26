program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BD3D20 =====
entry=00bd3d20
body=[[00bd3d20, 00bd3e29]]
completed=true
message=

byte * __thiscall
FUN_00bd3d20(byte *param_1,undefined4 param_2,byte param_3,undefined4 param_4,int param_5,
            undefined4 param_6,undefined4 param_7,undefined4 param_8,undefined4 param_9,
            undefined4 param_10,undefined4 param_11,undefined4 param_12,undefined4 param_13,
            undefined4 param_14,undefined4 param_15,undefined4 param_16,undefined4 param_17)

{
  undefined4 uVar1;
  
  *(byte **)(param_1 + 0x28) = param_1 + 0x28;
  param_1[0x44] = 0;
  param_1[0x45] = 0;
  param_1[0x46] = 0;
  param_1[0x47] = 0;
  param_1[0x75] = param_3;
  *(undefined4 *)(param_1 + 0xc) = param_2;
  param_1[0x74] = 0;
  param_1[0] = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[3] = 0;
  param_1[0x2c] = 0;
  param_1[0x2d] = 0;
  param_1[0x2e] = 0;
  param_1[0x2f] = 0;
  param_1[0x40] = 0;
  param_1[0x41] = 0;
  param_1[0x42] = 0;
  param_1[0x43] = 0;
  param_1[0x38] = 1;
  param_1[8] = 1;
  *(int *)(param_1 + 4) = param_5;
  *(undefined4 *)(param_1 + 0x60) = *(undefined4 *)(param_5 + 0x4c);
  *(undefined4 *)(param_1 + 100) = *(undefined4 *)(param_5 + 0x44);
  *(undefined4 *)(param_1 + 0x68) = *(undefined4 *)(param_5 + 0x3c);
  *(undefined4 *)(param_1 + 0x6c) = *(undefined4 *)(param_5 + 0x34);
  *(undefined2 *)(param_1 + 0x70) = *(undefined2 *)(param_5 + 0x1c);
  *(undefined2 *)(param_1 + 0x72) = *(undefined2 *)(param_5 + 0x1e);
  *(undefined4 *)(param_1 + 0x10) = param_7;
  *(undefined4 *)(param_1 + 0x18) = param_9;
  *(undefined4 *)(param_1 + 0x14) = param_8;
  *(undefined4 *)(param_1 + 0x1c) = param_10;
  *(undefined4 *)(param_1 + 0x24) = param_12;
  *(undefined4 *)(param_1 + 0x20) = param_11;
  *(undefined4 *)(param_1 + 0x30) = param_16;
  *(undefined4 *)(param_1 + 0x34) = param_17;
  param_1[0x54] = 0;
  param_1[0x55] = 0;
  param_1[0x56] = 0;
  param_1[0x57] = 0;
  func_0x00bd3c70(param_5,param_4,param_13,param_14);
  *(undefined4 *)(param_1 + 0x58) = param_11;
  if (param_5 == 0x1303e68) {
    param_1[8] = 0;
  }
  func_0x00bd32c0(param_5);
  param_1[0xa0] = *(byte *)(param_5 + 100) & 1;
  func_0x00bd2cd0(param_5);
  func_0x00bd38d0(param_5);
  if ((*param_1 & 1) == 0) {
    param_1[0x48] = 0;
    param_1[0x49] = 0;
    param_1[0x4a] = 0;
    param_1[0x4b] = 0;
  }
  uVar1 = func_0x00e3e720();
  *(undefined4 *)(param_1 + 0x5c) = uVar1;
  return param_1;
}


-- listing --
00bd3d20  PUSH EBX
00bd3d21  PUSH ESI
00bd3d22  MOV ESI,ECX
00bd3d24  MOV ECX,dword ptr [ESP + 0xc]
00bd3d28  PUSH EDI
00bd3d29  MOV EDI,dword ptr [ESP + 0x1c]
00bd3d2d  XOR EBX,EBX
00bd3d2f  LEA EAX,[ESI + 0x28]
00bd3d32  MOV dword ptr [EAX],EAX
00bd3d34  MOV AL,byte ptr [ESP + 0x14]
00bd3d38  MOV dword ptr [ESI + 0x44],EBX
00bd3d3b  MOV byte ptr [ESI + 0x75],AL
00bd3d3e  MOV dword ptr [ESI + 0xc],ECX
00bd3d41  MOV byte ptr [ESI + 0x74],BL
00bd3d44  MOV dword ptr [ESI],EBX
00bd3d46  MOV dword ptr [ESI + 0x2c],EBX
00bd3d49  MOV dword ptr [ESI + 0x40],EBX
00bd3d4c  MOV byte ptr [ESI + 0x38],0x1
00bd3d50  MOV byte ptr [ESI + 0x8],0x1
00bd3d54  MOV dword ptr [ESI + 0x4],EDI
00bd3d57  MOV EDX,dword ptr [EDI + 0x4c]
00bd3d5a  MOV dword ptr [ESI + 0x60],EDX
00bd3d5d  MOV EAX,dword ptr [EDI + 0x44]
00bd3d60  MOV dword ptr [ESI + 0x64],EAX
00bd3d63  MOV ECX,dword ptr [EDI + 0x3c]
00bd3d66  MOV dword ptr [ESI + 0x68],ECX
00bd3d69  MOV EDX,dword ptr [EDI + 0x34]
00bd3d6c  MOV dword ptr [ESI + 0x6c],EDX
00bd3d6f  MOV AX,word ptr [EDI + 0x1c]
00bd3d73  MOV EDX,dword ptr [ESP + 0x24]
00bd3d77  MOV word ptr [ESI + 0x70],AX
00bd3d7b  MOV CX,word ptr [EDI + 0x1e]
00bd3d7f  MOV EAX,dword ptr [ESP + 0x28]
00bd3d83  MOV word ptr [ESI + 0x72],CX
00bd3d87  MOV ECX,dword ptr [ESP + 0x2c]
00bd3d8b  MOV dword ptr [ESI + 0x10],EDX
00bd3d8e  MOV EDX,dword ptr [ESP + 0x30]
00bd3d92  MOV dword ptr [ESI + 0x18],ECX
00bd3d95  MOV ECX,dword ptr [ESP + 0x38]
00bd3d99  MOV dword ptr [ESI + 0x14],EAX
00bd3d9c  MOV EAX,dword ptr [ESP + 0x34]
00bd3da0  MOV dword ptr [ESI + 0x1c],EDX
00bd3da3  MOV EDX,dword ptr [ESP + 0x48]
00bd3da7  MOV dword ptr [ESI + 0x24],ECX
00bd3daa  MOV ECX,dword ptr [ESP + 0x40]
00bd3dae  MOV dword ptr [ESI + 0x20],EAX
00bd3db1  MOV EAX,dword ptr [ESP + 0x4c]
00bd3db5  PUSH ECX
00bd3db6  MOV dword ptr [ESI + 0x30],EDX
00bd3db9  MOV EDX,dword ptr [ESP + 0x40]
00bd3dbd  MOV dword ptr [ESI + 0x34],EAX
00bd3dc0  MOV EAX,dword ptr [ESP + 0x1c]
00bd3dc4  PUSH EDX
00bd3dc5  PUSH EAX
00bd3dc6  PUSH EDI
00bd3dc7  MOV ECX,ESI
00bd3dc9  MOV dword ptr [ESI + 0x54],EBX
00bd3dcc  CALL 0x00bd3c70
00bd3dd1  CMP EDI,0x1303e68
00bd3dd7  MOV ECX,dword ptr [ESP + 0x44]
00bd3ddb  MOV dword ptr [ESI + 0x58],ECX
00bd3dde  JNZ 0x00bd3de3
00bd3de0  MOV byte ptr [ESI + 0x8],BL
00bd3de3  PUSH EDI
00bd3de4  MOV ECX,ESI
00bd3de6  CALL 0x00bd32c0
00bd3deb  MOV DL,byte ptr [EDI + 0x64]
00bd3dee  AND DL,0x1
00bd3df1  PUSH EDI
00bd3df2  MOV byte ptr [ESI + 0xa0],DL
00bd3df8  CALL 0x00bd2cd0
00bd3dfd  PUSH EDI
00bd3dfe  CALL 0x00bd38d0
00bd3e03  TEST byte ptr [ESI],0x1
00bd3e06  JNZ 0x00bd3e0b
00bd3e08  MOV dword ptr [ESI + 0x48],EBX
00bd3e0b  MOV EAX,dword ptr [ESI + 0xc]
00bd3e0e  MOV ECX,dword ptr [EAX + 0xa4]
00bd3e14  MOV ECX,dword ptr [ECX + 0x88]
00bd3e1a  CALL 0x00e3e720
00bd3e1f  MOV dword ptr [ESI + 0x5c],EAX
00bd3e22  POP EDI
00bd3e23  MOV EAX,ESI
00bd3e25  POP ESI
00bd3e26  POP EBX
00bd3e27  RET 0x40

===== 00BE8070 =====
entry=00be8070
body=[[00be8070, 00be80f6]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

short * __thiscall FUN_00be8070(short *param_1,int param_2)

{
  short sVar1;
  
  if (((uint)param_1 & 0xf) != 0) {
    func_0x00415c90(100);
    func_0x00415a00();
    if ((_DAT_01323910 & 1) == 0) {
      _DAT_01323910 = _DAT_01323910 | 1;
      _DAT_0132390c = (code *)&UNK_00be7de0;
    }
    (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010cee58,0x1c,&UNK_010cef00);
  }
  sVar1 = *(short *)(param_2 + 0x100);
  param_1[1] = sVar1;
  param_1[2] = 6;
  *param_1 = (sVar1 + 3) * 2;
  func_0x00be7e90(param_2,param_1 + 3);
  return param_1;
}


-- listing --
00be8070  PUSH EBX
00be8071  MOV EBX,ECX
00be8073  TEST BL,0xf
00be8076  JZ 0x00be80c2
00be8078  PUSH 0x64
00be807a  CALL 0x00415c90
00be807f  MOV ECX,EAX
00be8081  CALL 0x00415a00
00be8086  MOV EAX,0x1
00be808b  TEST byte ptr [0x01323910],AL
00be8091  JNZ 0x00be80a3
00be8093  OR dword ptr [0x01323910],EAX
00be8099  MOV dword ptr [0x0132390c],0xbe7de0
00be80a3  PUSH 0x10cef00
00be80a8  PUSH 0x1c
00be80aa  PUSH 0x10cee58
00be80af  PUSH 0xf54d48
00be80b4  PUSH 0xf56510
00be80b9  CALL dword ptr [0x0132390c]
00be80bf  ADD ESP,0x14
00be80c2  MOV EAX,dword ptr [ESP + 0x8]
00be80c6  MOV CX,word ptr [EAX + 0x100]
00be80cd  MOV DX,CX
00be80d0  MOV word ptr [EBX + 0x2],CX
00be80d4  LEA ECX,[EBX + 0x6]
00be80d7  ADD DX,0x3
00be80db  PUSH ECX
00be80dc  ADD DX,DX
00be80df  PUSH EAX
00be80e0  MOV word ptr [EBX + 0x4],0x6
00be80e6  MOV word ptr [EBX],DX
00be80e9  CALL 0x00be7e90
00be80ee  ADD ESP,0x8
00be80f1  MOV EAX,EBX
00be80f3  POP EBX
00be80f4  RET 0x4

===== 00BD47C0 =====
entry=00bd47c0
body=[[00bd47c0, 00bd4826]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint FUN_00bd47c0(int param_1)

{
  uint uVar1;
  
  uVar1 = (uint)*(ushort *)(param_1 + 0x100) * 2 + 6;
  if (0x3fff < uVar1) {
    func_0x00415c90(100);
    func_0x00415a00();
    if ((_DAT_01323910 & 1) == 0) {
      _DAT_01323910 = _DAT_01323910 | 1;
      _DAT_0132390c = (code *)&UNK_00bd3530;
    }
    (*_DAT_0132390c)(&UNK_00f56510,&UNK_00f54d48,&UNK_010c76e8,0x6d,&UNK_010c7740);
  }
  return uVar1 & 0xffff;
}


-- listing --
00bd47c0  MOV EAX,dword ptr [ESP + 0x4]
00bd47c4  PUSH ESI
00bd47c5  MOVZX ESI,word ptr [EAX + 0x100]
00bd47cc  LEA ESI,[ESI + ESI*0x1 + 0x6]
00bd47d0  CMP ESI,0x4000
00bd47d6  JL 0x00bd4822
00bd47d8  PUSH 0x64
00bd47da  CALL 0x00415c90
00bd47df  MOV ECX,EAX
00bd47e1  CALL 0x00415a00
00bd47e6  MOV EAX,0x1
00bd47eb  TEST byte ptr [0x01323910],AL
00bd47f1  JNZ 0x00bd4803
00bd47f3  OR dword ptr [0x01323910],EAX
00bd47f9  MOV dword ptr [0x0132390c],0xbd3530
00bd4803  PUSH 0x10c7740
00bd4808  PUSH 0x6d
00bd480a  PUSH 0x10c76e8
00bd480f  PUSH 0xf54d48
00bd4814  PUSH 0xf56510
00bd4819  CALL dword ptr [0x0132390c]
00bd481f  ADD ESP,0x14
00bd4822  MOV AX,SI
00bd4825  POP ESI
00bd4826  RET
