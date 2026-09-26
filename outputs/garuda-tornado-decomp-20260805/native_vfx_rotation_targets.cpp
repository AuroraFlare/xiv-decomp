program=ffxivgame-ifrit.exe
image_base=00400000

===== 0x00BA5900 =====
entry=00ba5900
body=[[00ba5900, 00ba590d]]
completed=true
message=

undefined4 FUN_00ba5900(int param_1)

{
  *(undefined4 *)(param_1 + 0x20) = 0xffffffff;
  return 1;
}


-- listing --
00ba5900  MOV EAX,dword ptr [ESP + 0x4]
00ba5904  MOV dword ptr [EAX + 0x20],0xffffffff
00ba590b  MOV AL,0x1
00ba590d  RET

===== 0x00BA1FB0 =====
entry=00ba1fb0
body=[[00ba1fb0, 00ba1fb0]]
completed=true
message=

void FUN_00ba1fb0(void)

{
  return;
}


-- listing --
00ba1fb0  RET

===== 0x00E39DD0 =====
entry=00e39dd0
body=[[00e39dd0, 00e39dd0]]
completed=true
message=

void FUN_00e39dd0(void)

{
  return;
}


-- listing --
00e39dd0  RET

===== 0x00BA5A30 =====
entry=00ba5a30
body=[[00ba5a30, 00ba5af5]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5a30(int param_1)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  undefined4 uStack_10;
  undefined4 uStack_c;
  undefined4 uStack_8;
  
  pfVar3 = *(float **)(param_1 + 0x30);
  if (*(int *)(param_1 + 0x20) == -1) {
    func_0x00e39f40(param_1);
    func_0x00823740(&uStack_10);
    *(undefined4 *)(param_1 + 0x20) = uStack_10;
    *(undefined4 *)(param_1 + 0x24) = uStack_c;
    *(undefined4 *)(param_1 + 0x28) = uStack_8;
  }
  fVar1 = pfVar3[1];
  fVar2 = pfVar3[2];
  *(float *)(param_1 + 0x10) = *(float *)(param_1 + 0x20) + *pfVar3;
  *(float *)(param_1 + 0x14) = *(float *)(param_1 + 0x24) + fVar1;
  *(float *)(param_1 + 0x18) = *(float *)(param_1 + 0x28) + fVar2;
  *(undefined4 *)(param_1 + 0x1c) = _DAT_00fbf76c;
  if (*(int *)(param_1 + 0x34) != 0) {
    func_0x00ba4960(*(int *)(param_1 + 0x34),(float *)(param_1 + 0x10));
  }
  return;
}


-- listing --
00ba5a30  SUB ESP,0x10
00ba5a33  PUSH EBX
00ba5a34  PUSH ESI
00ba5a35  MOV ESI,dword ptr [ESP + 0x1c]
00ba5a39  CMP dword ptr [ESI + 0x20],-0x1
00ba5a3d  MOV EBX,dword ptr [ESI + 0x30]
00ba5a40  PUSH EDI
00ba5a41  LEA EDI,[ESI + 0x10]
00ba5a44  JNZ 0x00ba5a7c
00ba5a46  PUSH ESI
00ba5a47  CALL 0x00e39f40
00ba5a4c  ADD ESP,0x4
00ba5a4f  LEA ECX,[ESP + 0xc]
00ba5a53  PUSH ECX
00ba5a54  MOV ECX,EAX
00ba5a56  CALL 0x00823740
00ba5a5b  MOVSS XMM0,dword ptr [ESP + 0xc]
00ba5a61  MOVSS dword ptr [ESI + 0x20],XMM0
00ba5a66  MOVSS XMM0,dword ptr [ESP + 0x10]
00ba5a6c  MOVSS dword ptr [ESI + 0x24],XMM0
00ba5a71  MOVSS XMM0,dword ptr [ESP + 0x14]
00ba5a77  MOVSS dword ptr [ESI + 0x28],XMM0
00ba5a7c  MOVSS XMM0,dword ptr [ESI + 0x24]
00ba5a81  MOVSS XMM1,dword ptr [EBX + 0x4]
00ba5a86  MOVSS XMM2,dword ptr [EBX + 0x8]
00ba5a8b  MOVSS XMM3,dword ptr [EBX]
00ba5a8f  CVTPS2PD XMM1,XMM1
00ba5a92  CVTPS2PD XMM0,XMM0
00ba5a95  ADDSD XMM0,XMM1
00ba5a99  MOVSS XMM1,dword ptr [ESI + 0x28]
00ba5a9e  CVTPS2PD XMM2,XMM2
00ba5aa1  CVTPS2PD XMM1,XMM1
00ba5aa4  ADDSD XMM1,XMM2
00ba5aa8  MOVSS XMM2,dword ptr [ESI + 0x20]
00ba5aad  CVTPS2PD XMM2,XMM2
00ba5ab0  CVTPS2PD XMM3,XMM3
00ba5ab3  CVTPD2PS XMM0,XMM0
00ba5ab7  ADDSD XMM2,XMM3
00ba5abb  CVTPD2PS XMM1,XMM1
00ba5abf  CVTPD2PS XMM2,XMM2
00ba5ac3  MOVSS dword ptr [EDI],XMM2
00ba5ac7  MOVSS dword ptr [EDI + 0x4],XMM0
00ba5acc  MOVSS dword ptr [EDI + 0x8],XMM1
00ba5ad1  MOVSS XMM0,dword ptr [0x00fbf76c]
00ba5ad9  MOVSS dword ptr [EDI + 0xc],XMM0
00ba5ade  MOV ESI,dword ptr [ESI + 0x34]
00ba5ae1  TEST ESI,ESI
00ba5ae3  JZ 0x00ba5aef
00ba5ae5  PUSH EDI
00ba5ae6  PUSH ESI
00ba5ae7  CALL 0x00ba4960
00ba5aec  ADD ESP,0x8
00ba5aef  POP EDI
00ba5af0  POP ESI
00ba5af1  POP EBX
00ba5af2  ADD ESP,0x10
00ba5af5  RET

===== 0x00BA5910 =====
entry=00ba5910
body=[[00ba5910, 00ba5a26]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5910(int param_1,undefined4 param_2,undefined4 param_3)

{
  double dVar1;
  double dVar2;
  double dVar3;
  
  dVar1 = ((double)*(float *)(param_1 + 0x20) * _DAT_00f62f40) / _DAT_00f62f48;
  dVar2 = ((double)*(float *)(param_1 + 0x24) * _DAT_00f62f40) / _DAT_00f62f48;
  dVar3 = ((double)*(float *)(param_1 + 0x28) * _DAT_00f62f40) / _DAT_00f62f48;
  func_0x00bcbda0(param_3,&UNK_010bb208,param_1 + 0x10,
                  (double)(float)(((double)*(float *)(param_1 + 0x10) * _DAT_00f62f40) /
                                 _DAT_00f62f48),
                  (double)(float)(((double)*(float *)(param_1 + 0x14) * _DAT_00f62f40) /
                                 _DAT_00f62f48),
                  (double)(float)(((double)*(float *)(param_1 + 0x18) * _DAT_00f62f40) /
                                 _DAT_00f62f48));
  func_0x00bcbda0(param_3,&UNK_010bb228,param_1 + 0x20,(double)(float)dVar1,(double)(float)dVar2,
                  (double)(float)dVar3);
  return;
}


-- listing --
00ba5910  PUSH EBP
00ba5911  MOV EBP,ESP
00ba5913  AND ESP,0xffffffc0
00ba5916  SUB ESP,0x38
00ba5919  PUSH ESI
00ba591a  PUSH EDI
00ba591b  MOV EAX,dword ptr [EBP + 0x8]
00ba591e  MOVSD XMM1,qword ptr [0x00f62f48]
00ba5926  MOVSS XMM0,dword ptr [EAX + 0x20]
00ba592b  LEA ESI,[EAX + 0x20]
00ba592e  CVTPS2PD XMM2,XMM0
00ba5931  MOVSD XMM0,qword ptr [0x00f62f40]
00ba5939  MULSD XMM2,XMM0
00ba593d  DIVSD XMM2,XMM1
00ba5941  CVTSD2SS XMM2,XMM2
00ba5945  MOVSS dword ptr [ESP + 0x3c],XMM2
00ba594b  MOVSS XMM2,dword ptr [EAX + 0x24]
00ba5950  CVTPS2PD XMM2,XMM2
00ba5953  MULSD XMM2,XMM0
00ba5957  DIVSD XMM2,XMM1
00ba595b  CVTPD2PS XMM2,XMM2
00ba595f  MOVSS dword ptr [ESP + 0x38],XMM2
00ba5965  MOVSS XMM2,dword ptr [EAX + 0x28]
00ba596a  CVTPS2PD XMM2,XMM2
00ba596d  MULSD XMM2,XMM0
00ba5971  DIVSD XMM2,XMM1
00ba5975  CVTPD2PS XMM2,XMM2
00ba5979  MOVSS dword ptr [ESP + 0x34],XMM2
00ba597f  MOVSS XMM2,dword ptr [EAX + 0x18]
00ba5984  CVTPS2PD XMM2,XMM2
00ba5987  MULSD XMM2,XMM0
00ba598b  DIVSD XMM2,XMM1
00ba598f  CVTPD2PS XMM2,XMM2
00ba5993  CVTSS2SD XMM2,XMM2
00ba5997  MOV EDI,dword ptr [EBP + 0x10]
00ba599a  SUB ESP,0x18
00ba599d  MOVSD qword ptr [ESP + 0x10],XMM2
00ba59a3  MOVSS XMM2,dword ptr [EAX + 0x14]
00ba59a8  CVTPS2PD XMM2,XMM2
00ba59ab  MULSD XMM2,XMM0
00ba59af  DIVSD XMM2,XMM1
00ba59b3  CVTPD2PS XMM2,XMM2
00ba59b7  CVTSS2SD XMM2,XMM2
00ba59bb  MOVSD qword ptr [ESP + 0x8],XMM2
00ba59c1  MOVSS XMM2,dword ptr [EAX + 0x10]
00ba59c6  LEA ECX,[EAX + 0x10]
00ba59c9  CVTPS2PD XMM2,XMM2
00ba59cc  MULSD XMM2,XMM0
00ba59d0  DIVSD XMM2,XMM1
00ba59d4  CVTPD2PS XMM0,XMM2
00ba59d8  CVTPS2PD XMM0,XMM0
00ba59db  MOVSD qword ptr [ESP],XMM0
00ba59e0  PUSH ECX
00ba59e1  PUSH 0x10bb208
00ba59e6  PUSH EDI
00ba59e7  CALL 0x00bcbda0
00ba59ec  CVTSS2SD XMM0,dword ptr [ESP + 0x58]
00ba59f2  ADD ESP,0xc
00ba59f5  MOVSD qword ptr [ESP + 0x10],XMM0
00ba59fb  CVTSS2SD XMM0,dword ptr [ESP + 0x50]
00ba5a01  MOVSD qword ptr [ESP + 0x8],XMM0
00ba5a07  CVTSS2SD XMM0,dword ptr [ESP + 0x54]
00ba5a0d  MOVSD qword ptr [ESP],XMM0
00ba5a12  PUSH ESI
00ba5a13  PUSH 0x10bb228
00ba5a18  PUSH EDI
00ba5a19  CALL 0x00bcbda0
00ba5a1e  ADD ESP,0x24
00ba5a21  POP EDI
00ba5a22  POP ESI
00ba5a23  MOV ESP,EBP
00ba5a25  POP EBP
00ba5a26  RET

===== 0x00BA5B00 =====
entry=00ba5b00
body=[[00ba5b00, 00ba5b4c]]
completed=true
message=

undefined4 FUN_00ba5b00(int param_1)

{
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  return 1;
}


-- listing --
00ba5b00  MOV EAX,dword ptr [ESP + 0x4]
00ba5b04  XORPS XMM0,XMM0
00ba5b07  MOVSS dword ptr [EAX + 0x10],XMM0
00ba5b0c  MOVSS dword ptr [EAX + 0x20],XMM0
00ba5b11  MOVSS dword ptr [EAX + 0x30],XMM0
00ba5b16  MOVSS dword ptr [EAX + 0x40],XMM0
00ba5b1b  MOVSS dword ptr [EAX + 0x14],XMM0
00ba5b20  MOVSS dword ptr [EAX + 0x24],XMM0
00ba5b25  MOVSS dword ptr [EAX + 0x34],XMM0
00ba5b2a  MOVSS dword ptr [EAX + 0x44],XMM0
00ba5b2f  MOVSS dword ptr [EAX + 0x18],XMM0
00ba5b34  MOVSS dword ptr [EAX + 0x28],XMM0
00ba5b39  MOVSS dword ptr [EAX + 0x38],XMM0
00ba5b3e  MOVSS dword ptr [EAX + 0x48],XMM0
00ba5b43  MOV dword ptr [EAX + 0x2c],0x0
00ba5b4a  MOV AL,0x1
00ba5b4c  RET

===== 0x00BA5B50 =====
entry=00ba5b50
body=[[00ba5b50, 00ba5b50]]
completed=true
message=

void FUN_00ba5b50(void)

{
  return;
}


-- listing --
00ba5b50  RET

===== 0x00BA5B60 =====
entry=00ba5b60
body=[[00ba5b60, 00ba5ba4]]
completed=true
message=

void FUN_00ba5b60(int param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  if (param_3 == 2) {
    *(undefined4 *)(param_1 + 0x20) = *param_4;
    *(undefined4 *)(param_1 + 0x30) = param_4[8];
    *(undefined4 *)(param_1 + 0x40) = param_4[0xc];
    *(undefined4 *)(param_1 + 0x24) = param_4[1];
    *(undefined4 *)(param_1 + 0x34) = param_4[9];
    *(undefined4 *)(param_1 + 0x44) = param_4[0xd];
    *(undefined4 *)(param_1 + 0x28) = param_4[2];
    *(undefined4 *)(param_1 + 0x38) = param_4[10];
    *(undefined4 *)(param_1 + 0x48) = param_4[0xe];
  }
  return;
}


-- listing --
00ba5b60  CMP dword ptr [ESP + 0xc],0x2
00ba5b65  JNZ 0x00ba5ba4
00ba5b67  MOV ECX,dword ptr [ESP + 0x10]
00ba5b6b  MOV EAX,dword ptr [ESP + 0x4]
00ba5b6f  FLD float ptr [ECX]
00ba5b71  FSTP float ptr [EAX + 0x20]
00ba5b74  FLD float ptr [ECX + 0x20]
00ba5b77  FSTP float ptr [EAX + 0x30]
00ba5b7a  FLD float ptr [ECX + 0x30]
00ba5b7d  FSTP float ptr [EAX + 0x40]
00ba5b80  FLD float ptr [ECX + 0x4]
00ba5b83  FSTP float ptr [EAX + 0x24]
00ba5b86  FLD float ptr [ECX + 0x24]
00ba5b89  FSTP float ptr [EAX + 0x34]
00ba5b8c  FLD float ptr [ECX + 0x34]
00ba5b8f  FSTP float ptr [EAX + 0x44]
00ba5b92  FLD float ptr [ECX + 0x8]
00ba5b95  FSTP float ptr [EAX + 0x28]
00ba5b98  FLD float ptr [ECX + 0x28]
00ba5b9b  FSTP float ptr [EAX + 0x38]
00ba5b9e  FLD float ptr [ECX + 0x38]
00ba5ba1  FSTP float ptr [EAX + 0x48]
00ba5ba4  RET

===== 0x00BA5CB0 =====
entry=00ba5cb0
body=[[00ba5cb0, 00ba5de9]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5cb0(int param_1,undefined4 param_2,int param_3)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  undefined4 uVar4;
  double dVar5;
  float fVar6;
  double dVar7;
  double dVar8;
  
  *(int *)(param_1 + 0x2c) = *(int *)(param_1 + 0x2c) + param_3;
  pfVar3 = *(float **)(param_1 + 0x50);
  fVar6 = (float)((double)*(int *)(param_1 + 0x2c) / _DAT_00fa9598);
  dVar7 = (double)*(float *)(param_1 + 0x40) * _DAT_00f59898;
  dVar5 = (double)fVar6 * (double)fVar6;
  dVar8 = (double)*(float *)(param_1 + 0x44) * _DAT_00f59898;
  fVar1 = pfVar3[1];
  fVar2 = *pfVar3;
  *(float *)(param_1 + 0x18) =
       pfVar3[2] +
       (float)((double)*(float *)(param_1 + 0x48) * _DAT_00f59898 * dVar5 +
               (double)*(float *)(param_1 + 0x38) * (double)fVar6 +
              (double)*(float *)(param_1 + 0x28));
  uVar4 = _DAT_00f54f70;
  *(float *)(param_1 + 0x10) =
       fVar2 + (float)((double)*(float *)(param_1 + 0x30) * (double)fVar6 + dVar7 * dVar5 +
                      (double)*(float *)(param_1 + 0x20));
  *(float *)(param_1 + 0x14) =
       fVar1 + (float)(dVar8 * dVar5 + (double)*(float *)(param_1 + 0x34) * (double)fVar6 +
                      (double)*(float *)(param_1 + 0x24));
  *(undefined4 *)(param_1 + 0x1c) = uVar4;
  if (*(int *)(param_1 + 0x54) != 0) {
    func_0x00ba4b50(*(int *)(param_1 + 0x54),(float *)(param_1 + 0x10));
  }
  return;
}


-- listing --
00ba5cb0  MOV EAX,dword ptr [ESP + 0x4]
00ba5cb4  MOV ECX,dword ptr [ESP + 0xc]
00ba5cb8  ADD dword ptr [EAX + 0x2c],ECX
00ba5cbb  CVTSI2SS XMM0,dword ptr [EAX + 0x2c]
00ba5cc0  MOVSS XMM2,dword ptr [EAX + 0x30]
00ba5cc5  MOVSS XMM5,dword ptr [EAX + 0x34]
00ba5cca  MOV EDX,dword ptr [EAX + 0x50]
00ba5ccd  CVTSS2SD XMM0,XMM0
00ba5cd1  DIVSD XMM0,qword ptr [0x00fa9598]
00ba5cd9  CVTSD2SS XMM1,XMM0
00ba5cdd  CVTPS2PD XMM3,XMM2
00ba5ce0  CVTSS2SD XMM2,XMM1
00ba5ce4  MULSD XMM3,XMM2
00ba5ce8  MOVSS XMM2,dword ptr [EAX + 0x40]
00ba5ced  CVTPS2PD XMM4,XMM2
00ba5cf0  MOVSD XMM2,qword ptr [0x00f59898]
00ba5cf8  MULSD XMM4,XMM2
00ba5cfc  CVTSS2SD XMM0,XMM1
00ba5d00  MULSD XMM0,XMM0
00ba5d04  MULSD XMM4,XMM0
00ba5d08  ADDSD XMM3,XMM4
00ba5d0c  MOVSS XMM4,dword ptr [EAX + 0x20]
00ba5d11  CVTPS2PD XMM4,XMM4
00ba5d14  ADDSD XMM3,XMM4
00ba5d18  MOVSS XMM4,dword ptr [EAX + 0x44]
00ba5d1d  CVTPS2PD XMM5,XMM5
00ba5d20  CVTPS2PD XMM4,XMM4
00ba5d23  MULSD XMM4,XMM2
00ba5d27  MULSD XMM4,XMM0
00ba5d2b  CVTSS2SD XMM6,XMM1
00ba5d2f  MULSD XMM5,XMM6
00ba5d33  ADDSD XMM4,XMM5
00ba5d37  MOVSS XMM5,dword ptr [EAX + 0x24]
00ba5d3c  CVTPS2PD XMM5,XMM5
00ba5d3f  ADDSD XMM4,XMM5
00ba5d43  MOVSS XMM5,dword ptr [EAX + 0x48]
00ba5d48  CVTPS2PD XMM5,XMM5
00ba5d4b  MULSD XMM5,XMM2
00ba5d4f  MULSD XMM5,XMM0
00ba5d53  MOVSS XMM0,dword ptr [EAX + 0x38]
00ba5d58  CVTPS2PD XMM0,XMM0
00ba5d5b  CVTSS2SD XMM1,XMM1
00ba5d5f  MULSD XMM0,XMM1
00ba5d63  MOVSS XMM1,dword ptr [EDX + 0x4]
00ba5d68  ADDSD XMM5,XMM0
00ba5d6c  MOVSS XMM0,dword ptr [EAX + 0x28]
00ba5d71  CVTPS2PD XMM0,XMM0
00ba5d74  ADDSD XMM5,XMM0
00ba5d78  CVTPD2PS XMM4,XMM4
00ba5d7c  CVTSS2SD XMM2,XMM4
00ba5d80  CVTPS2PD XMM1,XMM1
00ba5d83  ADDSD XMM1,XMM2
00ba5d87  MOVSS XMM2,dword ptr [EDX + 0x8]
00ba5d8c  CVTPS2PD XMM2,XMM2
00ba5d8f  CVTPD2PS XMM0,XMM5
00ba5d93  CVTSS2SD XMM0,XMM0
00ba5d97  ADDSD XMM2,XMM0
00ba5d9b  CVTPD2PS XMM0,XMM2
00ba5d9f  MOVSS XMM2,dword ptr [EDX]
00ba5da3  LEA ECX,[EAX + 0x10]
00ba5da6  CVTSD2SS XMM3,XMM3
00ba5daa  CVTPS2PD XMM2,XMM2
00ba5dad  CVTSS2SD XMM3,XMM3
00ba5db1  MOVSS dword ptr [ECX + 0x8],XMM0
00ba5db6  MOVSS XMM0,dword ptr [0x00f54f70]
00ba5dbe  ADDSD XMM2,XMM3
00ba5dc2  CVTPD2PS XMM1,XMM1
00ba5dc6  CVTPD2PS XMM2,XMM2
00ba5dca  MOVSS dword ptr [ECX],XMM2
00ba5dce  MOVSS dword ptr [ECX + 0x4],XMM1
00ba5dd3  MOVSS dword ptr [ECX + 0xc],XMM0
00ba5dd8  MOV EAX,dword ptr [EAX + 0x54]
00ba5ddb  TEST EAX,EAX
00ba5ddd  JZ 0x00ba5de9
00ba5ddf  PUSH ECX
00ba5de0  PUSH EAX
00ba5de1  CALL 0x00ba4b50
00ba5de6  ADD ESP,0x8
00ba5de9  RET

===== 0x00BA5BB0 =====
entry=00ba5bb0
body=[[00ba5bb0, 00ba5ca7]]
completed=true
message=

void FUN_00ba5bb0(int param_1,undefined4 param_2,undefined4 param_3)

{
  func_0x00bcbda0(param_3,&UNK_010bb2a4,(float *)(param_1 + 0x10),(double)*(float *)(param_1 + 0x10)
                  ,(double)*(float *)(param_1 + 0x14),(double)*(float *)(param_1 + 0x18));
  func_0x00bcbda0(param_3,&UNK_010bb284,(float *)(param_1 + 0x20),(double)*(float *)(param_1 + 0x20)
                  ,(double)*(float *)(param_1 + 0x24),(double)*(float *)(param_1 + 0x28));
  func_0x00bcbda0(param_3,&UNK_010bb264,(float *)(param_1 + 0x30),(double)*(float *)(param_1 + 0x30)
                  ,(double)*(float *)(param_1 + 0x34),(double)*(float *)(param_1 + 0x38));
  func_0x00bcbda0(param_3,&UNK_010bb244,(float *)(param_1 + 0x40),(double)*(float *)(param_1 + 0x40)
                  ,(double)*(float *)(param_1 + 0x44),(double)*(float *)(param_1 + 0x48));
  return;
}


-- listing --
00ba5bb0  PUSH ESI
00ba5bb1  MOV ESI,dword ptr [ESP + 0x8]
00ba5bb5  MOVSS XMM0,dword ptr [ESI + 0x18]
00ba5bba  PUSH EDI
00ba5bbb  MOV EDI,dword ptr [ESP + 0x14]
00ba5bbf  LEA EAX,[ESI + 0x10]
00ba5bc2  SUB ESP,0x18
00ba5bc5  CVTPS2PD XMM0,XMM0
00ba5bc8  MOVSD qword ptr [ESP + 0x10],XMM0
00ba5bce  MOVSS XMM0,dword ptr [EAX + 0x4]
00ba5bd3  CVTPS2PD XMM0,XMM0
00ba5bd6  MOVSD qword ptr [ESP + 0x8],XMM0
00ba5bdc  MOVSS XMM0,dword ptr [EAX]
00ba5be0  CVTPS2PD XMM0,XMM0
00ba5be3  MOVSD qword ptr [ESP],XMM0
00ba5be8  PUSH EAX
00ba5be9  PUSH 0x10bb2a4
00ba5bee  PUSH EDI
00ba5bef  CALL 0x00bcbda0
00ba5bf4  MOVSS XMM0,dword ptr [ESI + 0x28]
00ba5bf9  LEA EAX,[ESI + 0x20]
00ba5bfc  ADD ESP,0xc
00ba5bff  CVTPS2PD XMM0,XMM0
00ba5c02  MOVSD qword ptr [ESP + 0x10],XMM0
00ba5c08  MOVSS XMM0,dword ptr [EAX + 0x4]
00ba5c0d  CVTPS2PD XMM0,XMM0
00ba5c10  MOVSD qword ptr [ESP + 0x8],XMM0
00ba5c16  MOVSS XMM0,dword ptr [EAX]
00ba5c1a  CVTPS2PD XMM0,XMM0
00ba5c1d  MOVSD qword ptr [ESP],XMM0
00ba5c22  PUSH EAX
00ba5c23  PUSH 0x10bb284
00ba5c28  PUSH EDI
00ba5c29  CALL 0x00bcbda0
00ba5c2e  MOVSS XMM0,dword ptr [ESI + 0x38]
00ba5c33  LEA EAX,[ESI + 0x30]
00ba5c36  ADD ESP,0xc
00ba5c39  CVTPS2PD XMM0,XMM0
00ba5c3c  MOVSD qword ptr [ESP + 0x10],XMM0
00ba5c42  MOVSS XMM0,dword ptr [EAX + 0x4]
00ba5c47  CVTPS2PD XMM0,XMM0
00ba5c4a  MOVSD qword ptr [ESP + 0x8],XMM0
00ba5c50  MOVSS XMM0,dword ptr [EAX]
00ba5c54  CVTPS2PD XMM0,XMM0
00ba5c57  MOVSD qword ptr [ESP],XMM0
00ba5c5c  PUSH EAX
00ba5c5d  PUSH 0x10bb264
00ba5c62  PUSH EDI
00ba5c63  CALL 0x00bcbda0
00ba5c68  MOVSS XMM0,dword ptr [ESI + 0x48]
00ba5c6d  LEA EAX,[ESI + 0x40]
00ba5c70  ADD ESP,0xc
00ba5c73  CVTPS2PD XMM0,XMM0
00ba5c76  MOVSD qword ptr [ESP + 0x10],XMM0
00ba5c7c  MOVSS XMM0,dword ptr [EAX + 0x4]
00ba5c81  CVTPS2PD XMM0,XMM0
00ba5c84  MOVSD qword ptr [ESP + 0x8],XMM0
00ba5c8a  MOVSS XMM0,dword ptr [EAX]
00ba5c8e  CVTPS2PD XMM0,XMM0
00ba5c91  MOVSD qword ptr [ESP],XMM0
00ba5c96  PUSH EAX
00ba5c97  PUSH 0x10bb244
00ba5c9c  PUSH EDI
00ba5c9d  CALL 0x00bcbda0
00ba5ca2  ADD ESP,0x24
00ba5ca5  POP EDI
00ba5ca6  POP ESI
00ba5ca7  RET

===== 0x00D6ACA0 =====
entry=00d6aca0
body=[[00d6aca0, 00d6ace7]]
completed=true
message=

bool FUN_00d6aca0(int param_1,int *param_2)

{
  int iVar1;
  char cVar2;
  
  iVar1 = *param_2;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined1 *)(param_1 + 0x1c) = 1;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  cVar2 = FUN_00d999b0(param_1,iVar1 + 0x24,param_1 + 0x2c);
  return cVar2 != '\0';
}


-- listing --
00d6aca0  MOV EAX,dword ptr [ESP + 0x8]
00d6aca4  MOV ECX,dword ptr [EAX]
00d6aca6  MOV EAX,dword ptr [ESP + 0x4]
00d6acaa  XORPS XMM0,XMM0
00d6acad  LEA EDX,[EAX + 0x2c]
00d6acb0  PUSH EDX
00d6acb1  ADD ECX,0x24
00d6acb4  MOV dword ptr [EAX + 0x2c],0x0
00d6acbb  MOVSS dword ptr [EAX + 0x3c],XMM0
00d6acc0  MOVSS dword ptr [EAX + 0x14],XMM0
00d6acc5  MOV byte ptr [EAX + 0x1c],0x1
00d6acc9  PUSH ECX
00d6acca  PUSH EAX
00d6accb  MOVSS dword ptr [EAX + 0x30],XMM0
00d6acd0  MOVSS dword ptr [EAX + 0x34],XMM0
00d6acd5  MOVSS dword ptr [EAX + 0x38],XMM0
00d6acda  CALL 0x00d999b0
00d6acdf  ADD ESP,0xc
00d6ace2  TEST AL,AL
00d6ace4  SETNZ AL
00d6ace7  RET

===== 0x00D6ACF0 =====
entry=00d6acf0
body=[[00d6acf0, 00d6ad0b]]
completed=true
message=

void FUN_00d6acf0(int param_1,int *param_2)

{
  FUN_00d98d10(param_1,*param_2 + 0x24,param_1 + 0x2c);
  return;
}


-- listing --
00d6acf0  MOV EAX,dword ptr [ESP + 0x4]
00d6acf4  MOV EDX,dword ptr [ESP + 0x8]
00d6acf8  LEA ECX,[EAX + 0x2c]
00d6acfb  PUSH ECX
00d6acfc  MOV ECX,dword ptr [EDX]
00d6acfe  ADD ECX,0x24
00d6ad01  PUSH ECX
00d6ad02  PUSH EAX
00d6ad03  CALL 0x00d98d10
00d6ad08  ADD ESP,0xc
00d6ad0b  RET

===== 0x00D6AD10 =====
entry=00d6ad10
body=[[00d6ad10, 00d6ad26]]
completed=true
message=

void FUN_00d6ad10(int param_1,undefined4 param_2)

{
  FUN_00d6ab70(param_1,param_2,*(undefined4 *)(param_1 + 0x40));
  return;
}


-- listing --
00d6ad10  MOV EAX,dword ptr [ESP + 0x4]
00d6ad14  MOV ECX,dword ptr [EAX + 0x40]
00d6ad17  MOV EDX,dword ptr [ESP + 0x8]
00d6ad1b  PUSH ECX
00d6ad1c  PUSH EDX
00d6ad1d  PUSH EAX
00d6ad1e  CALL 0x00d6ab70
00d6ad23  ADD ESP,0xc
00d6ad26  RET

===== 0x00D6AD30 =====
entry=00d6ad30
body=[[00d6ad30, 00d6ad4f]]
completed=true
message=

void FUN_00d6ad30(int param_1,int *param_2)

{
  func_0x00d99a70(param_1,*param_2 + 0x24,*(undefined4 *)(param_1 + 0x2c),
                  *(undefined4 *)(param_1 + 0x40));
  return;
}


-- listing --
00d6ad30  MOV EAX,dword ptr [ESP + 0x4]
00d6ad34  MOV ECX,dword ptr [EAX + 0x40]
00d6ad37  MOV EDX,dword ptr [EAX + 0x2c]
00d6ad3a  PUSH ECX
00d6ad3b  MOV ECX,dword ptr [ESP + 0xc]
00d6ad3f  PUSH EDX
00d6ad40  MOV EDX,dword ptr [ECX]
00d6ad42  ADD EDX,0x24
00d6ad45  PUSH EDX
00d6ad46  PUSH EAX
00d6ad47  CALL 0x00d99a70
00d6ad4c  ADD ESP,0x10
00d6ad4f  RET

===== 0x00D6AD50 =====
entry=00d6ad50
body=[[00d6ad50, 00d6b318]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d6ad50(int param_1,int *param_2,int param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  undefined8 *puVar5;
  bool bVar6;
  float fVar7;
  float *pfVar8;
  longlong *plVar9;
  int iVar10;
  float fVar11;
  float fVar13;
  float fVar14;
  double dVar12;
  float fVar15;
  float fVar16;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  int iStack_d0;
  float fStack_cc;
  float fStack_c8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  float fStack_60;
  float fStack_5c;
  float fStack_58;
  float fStack_54;
  float fStack_50;
  float fStack_4c;
  float fStack_48;
  float fStack_44;
  undefined1 auStack_40 [16];
  float fStack_30;
  float fStack_2c;
  float fStack_28;
  float fStack_24;
  float fStack_20;
  float fStack_1c;
  float fStack_18;
  float fStack_14;
  
  if ((char)param_2[1] == '\x02') {
    iVar4 = *param_2;
    puVar5 = *(undefined8 **)(param_1 + 0x40);
    uStack_a0 = *puVar5;
    uStack_98 = puVar5[1];
    uStack_90 = puVar5[2];
    uStack_88 = puVar5[3];
    uStack_80 = puVar5[4];
    uStack_78 = puVar5[5];
    uStack_70 = puVar5[6];
    uStack_68 = puVar5[7];
    uStack_e0 = *(undefined8 *)(param_1 + 0x20);
    uStack_d8 = *(undefined8 *)(param_1 + 0x28);
    pfVar8 = (float *)FUN_00e3a0a0(param_1,iVar4 + 0x30);
    fVar1 = *pfVar8;
    pfVar8 = (float *)FUN_00e3a0a0(param_1,iVar4 + 0x34);
    fVar2 = *pfVar8;
    pfVar8 = (float *)FUN_00e3a0a0(param_1,iVar4 + 0x38);
    fVar3 = *pfVar8;
    *(float *)(param_1 + 0x20) = (float)uStack_70;
    *(float *)(param_1 + 0x24) = uStack_70._4_4_;
    *(float *)(param_1 + 0x28) = (float)uStack_68;
    if (*(char *)(param_1 + 0x1c) != '\0') {
      *(undefined1 *)(param_1 + 0x1c) = 0;
      uStack_e0 = uStack_70;
      uStack_d8 = uStack_68;
      *(float *)(param_1 + 0x20) = (float)uStack_70;
      *(float *)(param_1 + 0x24) = uStack_70._4_4_;
      *(float *)(param_1 + 0x28) = (float)uStack_68;
      if (param_3 == 0) {
        return;
      }
    }
    fStack_30 = (float)uStack_70 - (float)uStack_e0;
    fStack_2c = uStack_70._4_4_ - uStack_e0._4_4_;
    fStack_28 = (float)uStack_68 - (float)uStack_d8;
    fStack_24 = uStack_68._4_4_ - uStack_d8._4_4_;
    fStack_50 = (float)uStack_e0;
    fStack_4c = uStack_e0._4_4_;
    fStack_48 = (float)uStack_d8;
    fStack_44 = uStack_d8._4_4_;
    fVar13 = fStack_2c * fStack_2c;
    fVar15 = fStack_28 * fStack_28;
    fStack_1c = fVar15 + fVar13 + fVar13;
    fStack_18 = fVar15 + fVar15 + fVar13;
    fStack_14 = fVar15 + fStack_24 * fStack_24 + fVar13;
    fStack_20 = SQRT(fVar15 + fStack_30 * fStack_30 + fVar13);
    iStack_d0 = 0;
    if ((double)fStack_20 <= _DAT_00fe1e38) {
      uStack_e0 = (ulonglong)(uint)_DAT_00f54f70 << 0x20;
      uStack_d8 = (ulonglong)(uint)_DAT_00f54f70 << 0x20;
    }
    else {
      plVar9 = (longlong *)func_0x0053b750(auStack_40);
      uStack_e0 = *plVar9;
      uStack_d8 = plVar9[1];
    }
    fStack_c8 = *(float *)(param_1 + 0x3c);
    fStack_cc = 0.0;
    *(float *)(param_1 + 0x3c) = fStack_c8 + fStack_20;
    func_0x00e3a810(param_1);
    if (*(float *)(param_1 + 0x14) <= *(float *)(param_1 + 0x3c)) {
      fStack_60 = (float)uStack_e0;
      fStack_5c = uStack_e0._4_4_;
      fStack_58 = (float)uStack_d8;
      fStack_54 = uStack_d8._4_4_;
      do {
        fStack_cc = *(float *)(param_1 + 0x14) + fStack_cc;
        fStack_c8 = fStack_cc - fStack_c8;
        fVar11 = fStack_c8 * fStack_60 + fStack_50;
        fVar14 = fStack_c8 * fStack_5c + fStack_4c;
        fVar16 = fStack_c8 * fStack_58 + fStack_48;
        fStack_24 = fStack_c8 * fStack_54 + fStack_44;
        fStack_c8 = 0.0;
        fStack_30 = fVar11;
        fStack_2c = fVar14;
        fStack_28 = fVar16;
        iVar10 = func_0x00e3f230();
        fVar13 = *(float *)(iVar4 + 0x2c);
        dVar12 = (double)iVar10 * _DAT_010cfd40;
        fVar15 = *(float *)(iVar4 + 0xc);
        iVar10 = func_0x00e3f1b0();
        fVar7 = (float)iVar10;
        if (iVar10 < 0) {
          fVar7 = fVar7 + _DAT_00f54a54;
        }
        if (fVar7 * (float)_DAT_010c6268 <= fVar13 * (float)dVar12 + fVar15) {
          fStack_14 = _DAT_00f54f70;
          uStack_70 = CONCAT44(fVar14,fVar11);
          uStack_68 = CONCAT44(_DAT_00f54f70,fVar16);
          iVar10 = (int)fVar1;
          fStack_20 = fVar11;
          fStack_1c = fVar14;
          fStack_18 = fVar16;
          if (0 < (int)fVar1) {
            do {
              FUN_00d6ab70(param_1,param_2,&uStack_a0);
              iVar10 = iVar10 + -1;
            } while (iVar10 != 0);
          }
        }
        *(float *)(param_1 + 0x3c) = *(float *)(param_1 + 0x3c) - *(float *)(param_1 + 0x14);
        iVar10 = func_0x00e3f1b0();
        fVar15 = _DAT_00fb7ab4;
        fVar13 = (float)iVar10;
        if (iVar10 < 0) {
          fVar13 = fVar13 + _DAT_00f54a54;
        }
        fVar13 = fVar13 * (float)_DAT_010c6268 * fVar3 + fVar2;
        bVar6 = fVar13 < _DAT_00fb7ab4;
        *(float *)(param_1 + 0x14) = fVar13;
        if (bVar6) {
          fVar13 = fVar15;
        }
        iStack_d0 = iStack_d0 + 1;
        *(float *)(param_1 + 0x14) = fVar13;
      } while ((iStack_d0 < 0x65) && (fVar13 <= *(float *)(param_1 + 0x3c)));
    }
    func_0x00e3a830(param_1);
  }
  return;
}


-- listing --
00d6ad50  PUSH EBP
00d6ad51  MOV EBP,ESP
00d6ad53  AND ESP,0xfffffff0
00d6ad56  SUB ESP,0xd4
00d6ad5c  MOV EAX,dword ptr [EBP + 0xc]
00d6ad5f  MOVZX ECX,byte ptr [EAX + 0x4]
00d6ad63  SUB ECX,0x2
00d6ad66  PUSH EBX
00d6ad67  PUSH ESI
00d6ad68  MOV ESI,dword ptr [EBP + 0x8]
00d6ad6b  PUSH EDI
00d6ad6c  MOV dword ptr [ESP + 0x3c],EAX
00d6ad70  JNZ 0x00d6b312
00d6ad76  MOV EDI,dword ptr [EAX]
00d6ad78  MOV EAX,dword ptr [ESI + 0x40]
00d6ad7b  MOVQ XMM0,qword ptr [EAX]
00d6ad7f  MOVQ qword ptr [ESP + 0x50],XMM0
00d6ad85  MOVQ XMM0,qword ptr [EAX + 0x8]
00d6ad8a  MOVQ qword ptr [ESP + 0x58],XMM0
00d6ad90  MOVQ XMM0,qword ptr [EAX + 0x10]
00d6ad95  MOVQ qword ptr [ESP + 0x60],XMM0
00d6ad9b  MOVQ XMM0,qword ptr [EAX + 0x18]
00d6ada0  MOVQ qword ptr [ESP + 0x68],XMM0
00d6ada6  MOVQ XMM0,qword ptr [EAX + 0x20]
00d6adab  MOVQ qword ptr [ESP + 0x70],XMM0
00d6adb1  MOVQ XMM0,qword ptr [EAX + 0x28]
00d6adb6  MOVQ qword ptr [ESP + 0x78],XMM0
00d6adbc  MOVQ XMM0,qword ptr [EAX + 0x30]
00d6adc1  MOVQ qword ptr [ESP + 0x80],XMM0
00d6adca  MOVQ XMM0,qword ptr [EAX + 0x38]
00d6adcf  MOVQ qword ptr [ESP + 0x88],XMM0
00d6add8  MOVQ XMM0,qword ptr [ESI + 0x20]
00d6addd  LEA EAX,[EDI + 0x30]
00d6ade0  PUSH EAX
00d6ade1  MOVQ qword ptr [ESP + 0x14],XMM0
00d6ade7  MOVQ XMM0,qword ptr [ESI + 0x28]
00d6adec  PUSH ESI
00d6aded  MOVQ qword ptr [ESP + 0x20],XMM0
00d6adf3  CALL 0x00e3a0a0
00d6adf8  CVTTSS2SI EBX,dword ptr [EAX]
00d6adfc  LEA ECX,[EDI + 0x34]
00d6adff  PUSH ECX
00d6ae00  PUSH ESI
00d6ae01  MOV dword ptr [ESP + 0x48],EBX
00d6ae05  CALL 0x00e3a0a0
00d6ae0a  MOVSS XMM0,dword ptr [EAX]
00d6ae0e  LEA EDX,[EDI + 0x38]
00d6ae11  PUSH EDX
00d6ae12  PUSH ESI
00d6ae13  MOVSS dword ptr [ESP + 0x44],XMM0
00d6ae19  CALL 0x00e3a0a0
00d6ae1e  MOVSS XMM0,dword ptr [EAX]
00d6ae22  MOVSS XMM1,dword ptr [ESP + 0x98]
00d6ae2b  MOVSS XMM2,dword ptr [ESP + 0x9c]
00d6ae34  MOVSS XMM3,dword ptr [ESP + 0xa0]
00d6ae3d  ADD ESP,0x18
00d6ae40  MOVSS dword ptr [ESI + 0x20],XMM1
00d6ae45  MOVSS dword ptr [ESI + 0x24],XMM2
00d6ae4a  MOVSS dword ptr [ESI + 0x28],XMM3
00d6ae4f  CMP byte ptr [ESI + 0x1c],0x0
00d6ae53  MOVSS dword ptr [ESP + 0x30],XMM0
00d6ae59  JZ 0x00d6ae96
00d6ae5b  CMP dword ptr [EBP + 0x10],0x0
00d6ae5f  MOVQ XMM0,qword ptr [ESP + 0x80]
00d6ae68  MOV byte ptr [ESI + 0x1c],0x0
00d6ae6c  MOVQ qword ptr [ESP + 0x10],XMM0
00d6ae72  MOVQ XMM0,qword ptr [ESP + 0x88]
00d6ae7b  MOVQ qword ptr [ESP + 0x18],XMM0
00d6ae81  MOVSS dword ptr [ESI + 0x20],XMM1
00d6ae86  MOVSS dword ptr [ESI + 0x24],XMM2
00d6ae8b  MOVSS dword ptr [ESI + 0x28],XMM3
00d6ae90  JZ 0x00d6b312
00d6ae96  MOVSS XMM0,dword ptr [ESP + 0x10]
00d6ae9c  MOVSS dword ptr [ESP + 0xc0],XMM0
00d6aea5  MOVSS XMM0,dword ptr [ESP + 0x14]
00d6aeab  MOVSS dword ptr [ESP + 0xc4],XMM0
00d6aeb4  MOVSS XMM0,dword ptr [ESP + 0x18]
00d6aeba  MOVSS dword ptr [ESP + 0xc8],XMM0
00d6aec3  MOVSS XMM0,dword ptr [ESP + 0x1c]
00d6aec9  MOVSS dword ptr [ESP + 0xcc],XMM0
00d6aed2  MOVAPS XMM0,xmmword ptr [ESP + 0xc0]
00d6aeda  MOVSS dword ptr [ESP + 0xc0],XMM1
00d6aee3  MOVSS XMM1,dword ptr [ESP + 0x8c]
00d6aeec  MOVSS dword ptr [ESP + 0xcc],XMM1
00d6aef5  MOVSS dword ptr [ESP + 0xc4],XMM2
00d6aefe  MOVSS dword ptr [ESP + 0xc8],XMM3
00d6af07  MOVAPS XMM1,xmmword ptr [ESP + 0xc0]
00d6af0f  SUBPS XMM1,XMM0
00d6af12  MOVAPS xmmword ptr [ESP + 0xc0],XMM1
00d6af1a  MOVSS XMM1,dword ptr [ESP + 0xc4]
00d6af23  MOVSS XMM2,dword ptr [ESP + 0xc8]
00d6af2c  MOVSS XMM3,dword ptr [ESP + 0xcc]
00d6af35  MOVAPS xmmword ptr [ESP + 0xa0],XMM0
00d6af3d  MOVSS XMM0,dword ptr [ESP + 0xc0]
00d6af46  MOVSS dword ptr [ESP + 0xc4],XMM1
00d6af4f  MOVSS dword ptr [ESP + 0xc0],XMM0
00d6af58  MOVSS dword ptr [ESP + 0x10],XMM0
00d6af5e  MOVSS dword ptr [ESP + 0x14],XMM1
00d6af64  MOVSS dword ptr [ESP + 0xc8],XMM2
00d6af6d  MOVSS dword ptr [ESP + 0xcc],XMM3
00d6af76  MOVAPS XMM0,xmmword ptr [ESP + 0xc0]
00d6af7e  MULPS XMM0,XMM0
00d6af81  MOVAPS XMM1,XMM0
00d6af84  SHUFPS XMM1,XMM0,0xaa
00d6af88  ADDPS XMM1,XMM0
00d6af8b  SHUFPS XMM0,XMM0,0x55
00d6af8f  ADDPS XMM1,XMM0
00d6af92  SQRTSS XMM1,XMM1
00d6af96  MOVAPS xmmword ptr [ESP + 0xd0],XMM1
00d6af9e  CVTSS2SD XMM0,dword ptr [ESP + 0xd0]
00d6afa7  COMISD XMM0,qword ptr [0x00fe1e38]
00d6afaf  XORPS XMM1,XMM1
00d6afb2  MOVSS XMM0,dword ptr [0x00f54f70]
00d6afba  MOVSS dword ptr [ESP + 0x18],XMM2
00d6afc0  MOVSS dword ptr [ESP + 0x1c],XMM3
00d6afc6  MOV dword ptr [ESP + 0x20],0x0
00d6afce  JBE 0x00d6affb
00d6afd0  LEA EAX,[ESP + 0xb0]
00d6afd7  PUSH EAX
00d6afd8  LEA ECX,[ESP + 0x14]
00d6afdc  CALL 0x0053b750
00d6afe1  MOVQ XMM0,qword ptr [EAX]
00d6afe5  XORPS XMM1,XMM1
00d6afe8  MOVQ qword ptr [ESP + 0x10],XMM0
00d6afee  MOVQ XMM0,qword ptr [EAX + 0x8]
00d6aff3  MOVQ qword ptr [ESP + 0x18],XMM0
00d6aff9  JMP 0x00d6b013
00d6affb  MOVSS dword ptr [ESP + 0x10],XMM1
00d6b001  MOVSS dword ptr [ESP + 0x14],XMM0
00d6b007  MOVSS dword ptr [ESP + 0x18],XMM1
00d6b00d  MOVSS dword ptr [ESP + 0x1c],XMM0
00d6b013  MOVSS XMM0,dword ptr [ESI + 0x3c]
00d6b018  MOVSS dword ptr [ESP + 0x28],XMM0
00d6b01e  MOVSS dword ptr [ESP + 0x24],XMM1
00d6b024  CVTSS2SD XMM1,dword ptr [ESP + 0xd0]
00d6b02d  CVTPS2PD XMM0,XMM0
00d6b030  ADDSD XMM0,XMM1
00d6b034  CVTPD2PS XMM0,XMM0
00d6b038  PUSH ESI
00d6b039  MOVSS dword ptr [ESI + 0x3c],XMM0
00d6b03e  CALL 0x00e3a810
00d6b043  MOVSS XMM0,dword ptr [ESI + 0x14]
00d6b048  MOVSS XMM1,dword ptr [ESI + 0x3c]
00d6b04d  ADD ESP,0x4
00d6b050  CVTPS2PD XMM0,XMM0
00d6b053  CVTPS2PD XMM1,XMM1
00d6b056  COMISD XMM1,XMM0
00d6b05a  JC 0x00d6b309
00d6b060  MOVSS XMM0,dword ptr [ESP + 0x10]
00d6b066  MOVSS dword ptr [ESP + 0xc0],XMM0
00d6b06f  MOVSS XMM0,dword ptr [ESP + 0x14]
00d6b075  MOVSS dword ptr [ESP + 0xc4],XMM0
00d6b07e  MOVSS XMM0,dword ptr [ESP + 0x18]
00d6b084  MOVSS dword ptr [ESP + 0xc8],XMM0
00d6b08d  MOVSS XMM0,dword ptr [ESP + 0x1c]
00d6b093  MOVSS dword ptr [ESP + 0xcc],XMM0
00d6b09c  MOVAPS XMM0,xmmword ptr [ESP + 0xc0]
00d6b0a4  MOVAPS xmmword ptr [ESP + 0x90],XMM0
00d6b0ac  MOVSS XMM0,dword ptr [ESI + 0x14]
00d6b0b1  CVTPS2PD XMM1,XMM0
00d6b0b4  CVTSS2SD XMM0,dword ptr [ESP + 0x24]
00d6b0ba  ADDSD XMM1,XMM0
00d6b0be  CVTSS2SD XMM0,dword ptr [ESP + 0x28]
00d6b0c4  MOV ECX,dword ptr [0x0137b780]
00d6b0ca  MOVAPD XMM2,XMM1
00d6b0ce  SUBSD XMM2,XMM0
00d6b0d2  CVTSD2SS XMM0,XMM2
00d6b0d6  MOVSS XMM0,XMM0
00d6b0da  XORPS XMM2,XMM2
00d6b0dd  SHUFPS XMM0,XMM0,0x0
00d6b0e1  MULPS XMM0,xmmword ptr [ESP + 0x90]
00d6b0e9  MOVAPS xmmword ptr [ESP + 0xc0],XMM0
00d6b0f1  MOVSS XMM0,dword ptr [ESP + 0xc0]
00d6b0fa  MOVSS dword ptr [ESP + 0x10],XMM0
00d6b100  MOVSS XMM0,dword ptr [ESP + 0xc4]
00d6b109  MOVSS dword ptr [ESP + 0x14],XMM0
00d6b10f  MOVSS XMM0,dword ptr [ESP + 0xc8]
00d6b118  MOVSS dword ptr [ESP + 0x18],XMM0
00d6b11e  MOVSS XMM0,dword ptr [ESP + 0xcc]
00d6b127  MOVSS dword ptr [ESP + 0x1c],XMM0
00d6b12d  MOVAPS XMM0,xmmword ptr [ESP + 0x10]
00d6b132  ADDPS XMM0,xmmword ptr [ESP + 0xa0]
00d6b13a  MOVAPS xmmword ptr [ESP + 0xc0],XMM0
00d6b142  MOVSS XMM0,dword ptr [ESP + 0xc0]
00d6b14b  MOVSS dword ptr [ESP + 0x40],XMM0
00d6b151  MOVSS XMM0,dword ptr [ESP + 0xc4]
00d6b15a  MOVSS dword ptr [ESP + 0x44],XMM0
00d6b160  MOVSS XMM0,dword ptr [ESP + 0xc8]
00d6b169  MOVSS dword ptr [ESP + 0x48],XMM0
00d6b16f  MOVSS XMM0,dword ptr [ESP + 0xcc]
00d6b178  CVTPD2PS XMM1,XMM1
00d6b17c  MOVSS dword ptr [ESP + 0x28],XMM2
00d6b182  MOVSS dword ptr [ESP + 0x24],XMM1
00d6b188  MOVSS dword ptr [ESP + 0x4c],XMM0
00d6b18e  CALL 0x00e3f230
00d6b193  MOVSS XMM1,dword ptr [EDI + 0x2c]
00d6b198  MOV ECX,dword ptr [0x0137b780]
00d6b19e  CVTSI2SS XMM0,EAX
00d6b1a2  CVTSS2SD XMM0,XMM0
00d6b1a6  MULSD XMM0,qword ptr [0x010cfd40]
00d6b1ae  CVTSD2SS XMM0,XMM0
00d6b1b2  CVTSS2SD XMM0,XMM0
00d6b1b6  CVTPS2PD XMM1,XMM1
00d6b1b9  MULSD XMM1,XMM0
00d6b1bd  CVTPD2PS XMM0,XMM1
00d6b1c1  MOVSS XMM1,dword ptr [EDI + 0xc]
00d6b1c6  CVTSS2SD XMM0,XMM0
00d6b1ca  CVTPS2PD XMM1,XMM1
00d6b1cd  ADDSD XMM0,XMM1
00d6b1d1  CVTSD2SS XMM0,XMM0
00d6b1d5  MOVSS dword ptr [ESP + 0x34],XMM0
00d6b1db  CALL 0x00e3f1b0
00d6b1e0  TEST EAX,EAX
00d6b1e2  MOV dword ptr [ESP + 0xc],EAX
00d6b1e6  FILD dword ptr [ESP + 0xc]
00d6b1ea  JGE 0x00d6b1f2
00d6b1ec  FADD float ptr [0x00f54a54]
00d6b1f2  FMUL double ptr [0x010c6268]
00d6b1f8  FSTP float ptr [ESP + 0xc]
00d6b1fc  FLD float ptr [ESP + 0xc]
00d6b200  FLD float ptr [ESP + 0x34]
00d6b204  FCOMIP ST0,ST1
00d6b206  FSTP ST0
00d6b208  JC 0x00d6b26e
00d6b20a  TEST EBX,EBX
00d6b20c  MOVDQA XMM0,xmmword ptr [ESP + 0x40]
00d6b212  MOVDQA xmmword ptr [ESP + 0xd0],XMM0
00d6b21b  MOVSS XMM0,dword ptr [0x00f54f70]
00d6b223  MOVSS dword ptr [ESP + 0xdc],XMM0
00d6b22c  MOVQ XMM0,qword ptr [ESP + 0xd0]
00d6b235  MOVQ qword ptr [ESP + 0x80],XMM0
00d6b23e  MOVQ XMM0,qword ptr [ESP + 0xd8]
00d6b247  MOVQ qword ptr [ESP + 0x88],XMM0
00d6b250  JLE 0x00d6b26e
00d6b252  MOV EDX,dword ptr [ESP + 0x3c]
00d6b256  LEA ECX,[ESP + 0x50]
00d6b25a  PUSH ECX
00d6b25b  PUSH EDX
00d6b25c  PUSH ESI
00d6b25d  CALL 0x00d6ab70
00d6b262  ADD ESP,0xc
00d6b265  SUB EBX,0x1
00d6b268  JNZ 0x00d6b252
00d6b26a  MOV EBX,dword ptr [ESP + 0x38]
00d6b26e  MOVSS XMM0,dword ptr [ESI + 0x3c]
00d6b273  MOVSS XMM1,dword ptr [ESI + 0x14]
00d6b278  CVTPS2PD XMM0,XMM0
00d6b27b  CVTPS2PD XMM1,XMM1
00d6b27e  SUBSD XMM0,XMM1
00d6b282  CVTPD2PS XMM0,XMM0
00d6b286  MOVSS dword ptr [ESI + 0x3c],XMM0
00d6b28b  MOV ECX,dword ptr [0x0137b780]
00d6b291  CALL 0x00e3f1b0
00d6b296  TEST EAX,EAX
00d6b298  MOV dword ptr [ESP + 0xc],EAX
00d6b29c  FILD dword ptr [ESP + 0xc]
00d6b2a0  JGE 0x00d6b2a8
00d6b2a2  FADD float ptr [0x00f54a54]
00d6b2a8  FMUL double ptr [0x010c6268]
00d6b2ae  MOVSS XMM1,dword ptr [0x00fb7ab4]
00d6b2b6  FSTP float ptr [ESP + 0xc]
00d6b2ba  FLD float ptr [ESP + 0xc]
00d6b2be  FMUL float ptr [ESP + 0x30]
00d6b2c2  FADD float ptr [ESP + 0x2c]
00d6b2c6  FSTP float ptr [ESP + 0xc]
00d6b2ca  FLD float ptr [ESP + 0xc]
00d6b2ce  MOVSS XMM0,dword ptr [ESP + 0xc]
00d6b2d4  COMISS XMM0,XMM1
00d6b2d7  FSTP float ptr [ESI + 0x14]
00d6b2da  JNC 0x00d6b2df
00d6b2dc  MOVAPS XMM0,XMM1
00d6b2df  MOV EAX,dword ptr [ESP + 0x20]
00d6b2e3  ADD EAX,0x1
00d6b2e6  CMP EAX,0x64
00d6b2e9  MOVSS dword ptr [ESI + 0x14],XMM0
00d6b2ee  MOV dword ptr [ESP + 0x20],EAX
00d6b2f2  JG 0x00d6b309
00d6b2f4  MOVSS XMM1,dword ptr [ESI + 0x3c]
00d6b2f9  CVTPS2PD XMM0,XMM0
00d6b2fc  CVTPS2PD XMM1,XMM1
00d6b2ff  COMISD XMM1,XMM0
00d6b303  JNC 0x00d6b0ac
00d6b309  PUSH ESI
00d6b30a  CALL 0x00e3a830
00d6b30f  ADD ESP,0x4
00d6b312  POP EDI
00d6b313  POP ESI
00d6b314  POP EBX
00d6b315  MOV ESP,EBP
00d6b317  POP EBP
00d6b318  RET
