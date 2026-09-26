program=ffxivgame-ifrit.exe
image_base=00400000

===== 0x00BA4FD0 =====
entry=00ba4fd0
body=[[00ba4fd0, 00ba5046]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_00ba4fd0(int param_1)

{
  undefined4 uVar1;
  
  uVar1 = _DAT_00f54f70;
  *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) & 0xfe;
  *(undefined4 *)(param_1 + 0x10) = 0;
  *(undefined4 *)(param_1 + 0x14) = 0;
  *(undefined4 *)(param_1 + 0x18) = 0;
  *(undefined4 *)(param_1 + 0x1c) = uVar1;
  *(undefined4 *)(param_1 + 0x20) = 0;
  *(undefined4 *)(param_1 + 0x24) = 0;
  *(undefined4 *)(param_1 + 0x28) = 0;
  *(undefined4 *)(param_1 + 0x30) = 0;
  *(undefined4 *)(param_1 + 0x34) = 0;
  *(undefined4 *)(param_1 + 0x38) = 0;
  *(undefined4 *)(param_1 + 0x3c) = 0;
  *(undefined4 *)(param_1 + 0x40) = 0;
  *(undefined4 *)(param_1 + 0x44) = 0;
  *(undefined4 *)(param_1 + 0x48) = 0;
  *(undefined4 *)(param_1 + 0x4c) = 0;
  *(undefined4 *)(param_1 + 0x50) = 0;
  *(undefined4 *)(param_1 + 0x54) = 0;
  *(undefined4 *)(param_1 + 0x58) = 0;
  *(undefined4 *)(param_1 + 0x2c) = 0;
  return 1;
}


-- listing --
00ba4fd0  MOV EAX,dword ptr [ESP + 0x4]
00ba4fd4  XORPS XMM0,XMM0
00ba4fd7  MOVSS XMM1,dword ptr [0x00f54f70]
00ba4fdf  AND byte ptr [EAX + 0x5c],0xfe
00ba4fe3  MOVSS dword ptr [EAX + 0x10],XMM0
00ba4fe8  MOVSS dword ptr [EAX + 0x14],XMM0
00ba4fed  MOVSS dword ptr [EAX + 0x18],XMM0
00ba4ff2  MOVSS dword ptr [EAX + 0x1c],XMM1
00ba4ff7  MOVSS dword ptr [EAX + 0x20],XMM0
00ba4ffc  MOVSS dword ptr [EAX + 0x24],XMM0
00ba5001  MOVSS dword ptr [EAX + 0x28],XMM0
00ba5006  MOVSS dword ptr [EAX + 0x30],XMM0
00ba500b  MOVSS dword ptr [EAX + 0x34],XMM0
00ba5010  MOVSS dword ptr [EAX + 0x38],XMM0
00ba5015  MOVSS dword ptr [EAX + 0x3c],XMM0
00ba501a  MOVSS dword ptr [EAX + 0x40],XMM0
00ba501f  MOVSS dword ptr [EAX + 0x44],XMM0
00ba5024  MOVSS dword ptr [EAX + 0x48],XMM0
00ba5029  MOVSS dword ptr [EAX + 0x4c],XMM0
00ba502e  MOVSS dword ptr [EAX + 0x50],XMM0
00ba5033  MOVSS dword ptr [EAX + 0x54],XMM0
00ba5038  MOVSS dword ptr [EAX + 0x58],XMM0
00ba503d  MOV dword ptr [EAX + 0x2c],0x0
00ba5044  MOV AL,0x1
00ba5046  RET

===== 0x00BA5050 =====
entry=00ba5050
body=[[00ba5050, 00ba5050]]
completed=true
message=

void FUN_00ba5050(void)

{
  return;
}


-- listing --
00ba5050  RET

===== 0x00BA5060 =====
entry=00ba5060
body=[[00ba5060, 00ba51c3]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5060(int param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (param_3 == 2) {
    if ((*(byte *)(param_4 + 0x12) & 1) == 0) {
      *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) & 0xfe;
    }
    else {
      *(byte *)(param_1 + 0x5c) = *(byte *)(param_1 + 0x5c) | 1;
    }
    *(undefined4 *)(param_1 + 0x20) = *param_4;
    *(float *)(param_1 + 0x30) = (float)param_4[4] * (float)param_4[0x10];
    if ((*(byte *)(param_1 + 0x5c) & 1) != 0) {
      *(undefined4 *)(param_1 + 0x40) = *param_4;
      *(undefined4 *)(param_1 + 0x50) = *param_4;
      *(undefined4 *)(param_1 + 0x24) = param_4[1];
      *(float *)(param_1 + 0x34) = (float)param_4[5] * (float)param_4[0x10];
      *(undefined4 *)(param_1 + 0x44) = param_4[1];
      *(undefined4 *)(param_1 + 0x54) = param_4[1];
      *(undefined4 *)(param_1 + 0x28) = param_4[2];
      *(float *)(param_1 + 0x38) = (float)param_4[6] * (float)param_4[0x10];
      uVar2 = _DAT_00f54f70;
      *(undefined4 *)(param_1 + 0x48) = param_4[2];
      *(undefined4 *)(param_1 + 0x58) = param_4[2];
      uVar1 = param_4[0x11];
      *(undefined4 *)(param_1 + 0x4c) = uVar2;
      *(undefined4 *)(param_1 + 0x3c) = uVar1;
      return;
    }
    *(float *)(param_1 + 0x40) = (float)param_4[0x11] * (float)param_4[4];
    *(undefined4 *)(param_1 + 0x24) = param_4[1];
    *(float *)(param_1 + 0x34) = (float)param_4[5] * (float)param_4[0x10];
    *(float *)(param_1 + 0x44) = (float)param_4[0x11] * (float)param_4[5];
    *(undefined4 *)(param_1 + 0x28) = param_4[2];
    *(float *)(param_1 + 0x38) = (float)param_4[6] * (float)param_4[0x10];
    *(float *)(param_1 + 0x48) = (float)param_4[0x11] * (float)param_4[6];
  }
  return;
}


-- listing --
00ba5060  CMP dword ptr [ESP + 0xc],0x2
00ba5065  JNZ 0x00ba51c3
00ba506b  MOV EAX,dword ptr [ESP + 0x10]
00ba506f  MOV ECX,dword ptr [ESP + 0x4]
00ba5073  MOV DL,0x1
00ba5075  TEST byte ptr [EAX + 0x48],DL
00ba5078  JZ 0x00ba507f
00ba507a  OR byte ptr [ECX + 0x5c],DL
00ba507d  JMP 0x00ba5083
00ba507f  AND byte ptr [ECX + 0x5c],0xfe
00ba5083  FLD float ptr [EAX]
00ba5085  TEST byte ptr [ECX + 0x5c],DL
00ba5088  FSTP float ptr [ECX + 0x20]
00ba508b  MOVSS XMM0,dword ptr [EAX + 0x10]
00ba5090  MOVSS XMM1,dword ptr [EAX + 0x40]
00ba5095  CVTPS2PD XMM0,XMM0
00ba5098  CVTPS2PD XMM1,XMM1
00ba509b  MULSD XMM0,XMM1
00ba509f  CVTPD2PS XMM0,XMM0
00ba50a3  MOVSS dword ptr [ECX + 0x30],XMM0
00ba50a8  JZ 0x00ba5126
00ba50aa  FLD float ptr [EAX]
00ba50ac  FSTP float ptr [ECX + 0x40]
00ba50af  FLD float ptr [EAX]
00ba50b1  FSTP float ptr [ECX + 0x50]
00ba50b4  FLD float ptr [EAX + 0x4]
00ba50b7  FSTP float ptr [ECX + 0x24]
00ba50ba  MOVSS XMM0,dword ptr [EAX + 0x14]
00ba50bf  MOVSS XMM1,dword ptr [EAX + 0x40]
00ba50c4  CVTPS2PD XMM0,XMM0
00ba50c7  CVTPS2PD XMM1,XMM1
00ba50ca  MULSD XMM0,XMM1
00ba50ce  CVTPD2PS XMM0,XMM0
00ba50d2  MOVSS dword ptr [ECX + 0x34],XMM0
00ba50d7  FLD float ptr [EAX + 0x4]
00ba50da  FSTP float ptr [ECX + 0x44]
00ba50dd  FLD float ptr [EAX + 0x4]
00ba50e0  FSTP float ptr [ECX + 0x54]
00ba50e3  FLD float ptr [EAX + 0x8]
00ba50e6  FSTP float ptr [ECX + 0x28]
00ba50e9  MOVSS XMM0,dword ptr [EAX + 0x18]
00ba50ee  MOVSS XMM1,dword ptr [EAX + 0x40]
00ba50f3  CVTPS2PD XMM0,XMM0
00ba50f6  CVTPS2PD XMM1,XMM1
00ba50f9  MULSD XMM0,XMM1
00ba50fd  CVTPD2PS XMM0,XMM0
00ba5101  MOVSS dword ptr [ECX + 0x38],XMM0
00ba5106  FLD float ptr [EAX + 0x8]
00ba5109  MOVSS XMM0,dword ptr [0x00f54f70]
00ba5111  FSTP float ptr [ECX + 0x48]
00ba5114  FLD float ptr [EAX + 0x8]
00ba5117  FSTP float ptr [ECX + 0x58]
00ba511a  FLD float ptr [EAX + 0x44]
00ba511d  MOVSS dword ptr [ECX + 0x4c],XMM0
00ba5122  FSTP float ptr [ECX + 0x3c]
00ba5125  RET
00ba5126  MOVSS XMM0,dword ptr [EAX + 0x44]
00ba512b  MOVSS XMM1,dword ptr [EAX + 0x10]
00ba5130  CVTPS2PD XMM0,XMM0
00ba5133  CVTPS2PD XMM1,XMM1
00ba5136  MULSD XMM0,XMM1
00ba513a  CVTPD2PS XMM0,XMM0
00ba513e  MOVSS dword ptr [ECX + 0x40],XMM0
00ba5143  FLD float ptr [EAX + 0x4]
00ba5146  FSTP float ptr [ECX + 0x24]
00ba5149  MOVSS XMM0,dword ptr [EAX + 0x14]
00ba514e  MOVSS XMM1,dword ptr [EAX + 0x40]
00ba5153  CVTPS2PD XMM0,XMM0
00ba5156  CVTPS2PD XMM1,XMM1
00ba5159  MULSD XMM0,XMM1
00ba515d  CVTPD2PS XMM0,XMM0
00ba5161  MOVSS dword ptr [ECX + 0x34],XMM0
00ba5166  MOVSS XMM0,dword ptr [EAX + 0x44]
00ba516b  MOVSS XMM1,dword ptr [EAX + 0x14]
00ba5170  CVTPS2PD XMM0,XMM0
00ba5173  CVTPS2PD XMM1,XMM1
00ba5176  MULSD XMM0,XMM1
00ba517a  CVTPD2PS XMM0,XMM0
00ba517e  MOVSS dword ptr [ECX + 0x44],XMM0
00ba5183  FLD float ptr [EAX + 0x8]
00ba5186  FSTP float ptr [ECX + 0x28]
00ba5189  MOVSS XMM0,dword ptr [EAX + 0x18]
00ba518e  MOVSS XMM1,dword ptr [EAX + 0x40]
00ba5193  CVTPS2PD XMM0,XMM0
00ba5196  CVTPS2PD XMM1,XMM1
00ba5199  MULSD XMM0,XMM1
00ba519d  CVTPD2PS XMM0,XMM0
00ba51a1  MOVSS dword ptr [ECX + 0x38],XMM0
00ba51a6  MOVSS XMM0,dword ptr [EAX + 0x44]
00ba51ab  MOVSS XMM1,dword ptr [EAX + 0x18]
00ba51b0  CVTPS2PD XMM0,XMM0
00ba51b3  CVTPS2PD XMM1,XMM1
00ba51b6  MULSD XMM0,XMM1
00ba51ba  CVTPD2PS XMM0,XMM0
00ba51be  MOVSS dword ptr [ECX + 0x48],XMM0
00ba51c3  RET

===== 0x00BA51D0 =====
entry=00ba51d0
body=[[00ba51d0, 00ba520a]]
completed=true
message=

void FUN_00ba51d0(int param_1,int *param_2)

{
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
  *param_2 = (int)(param_2 + 1);
  param_2[1] = *(undefined4 *)(param_1 + 0x30);
  param_2[2] = *(int *)(param_1 + 0x34);
  param_2[3] = *(int *)(param_1 + 0x38);
  return;
}


-- listing --
00ba51d0  MOV EAX,dword ptr [ESP + 0x8]
00ba51d4  MOV EDX,dword ptr [ESP + 0x4]
00ba51d8  PXOR XMM0,XMM0
00ba51dc  MOVQ qword ptr [EAX],XMM0
00ba51e0  MOVQ qword ptr [EAX + 0x8],XMM0
00ba51e5  MOVQ qword ptr [EAX + 0x10],XMM0
00ba51ea  MOVQ qword ptr [EAX + 0x18],XMM0
00ba51ef  MOVQ qword ptr [EAX + 0x20],XMM0
00ba51f4  LEA ECX,[EAX + 0x4]
00ba51f7  MOV dword ptr [EAX],ECX
00ba51f9  FLD float ptr [EDX + 0x30]
00ba51fc  FSTP float ptr [ECX]
00ba51fe  FLD float ptr [EDX + 0x34]
00ba5201  FSTP float ptr [ECX + 0x4]
00ba5204  FLD float ptr [EDX + 0x38]
00ba5207  FSTP float ptr [ECX + 0x8]
00ba520a  RET

===== 0x00BA5210 =====
entry=00ba5210
body=[[00ba5210, 00ba5255]]
completed=true
message=

void FUN_00ba5210(int param_1,undefined4 param_2,undefined4 param_3)

{
  func_0x00bcbda0(param_3,&UNK_010bb12c,(float *)(param_1 + 0x10),(double)*(float *)(param_1 + 0x10)
                  ,(double)*(float *)(param_1 + 0x14),(double)*(float *)(param_1 + 0x18));
  return;
}


-- listing --
00ba5210  MOV EAX,dword ptr [ESP + 0x4]
00ba5214  MOVSS XMM0,dword ptr [EAX + 0x18]
00ba5219  SUB ESP,0x18
00ba521c  CVTPS2PD XMM0,XMM0
00ba521f  MOVSD qword ptr [ESP + 0x10],XMM0
00ba5225  MOVSS XMM0,dword ptr [EAX + 0x14]
00ba522a  LEA ECX,[EAX + 0x10]
00ba522d  MOV EAX,dword ptr [ESP + 0x24]
00ba5231  CVTPS2PD XMM0,XMM0
00ba5234  MOVSD qword ptr [ESP + 0x8],XMM0
00ba523a  MOVSS XMM0,dword ptr [ECX]
00ba523e  CVTPS2PD XMM0,XMM0
00ba5241  MOVSD qword ptr [ESP],XMM0
00ba5246  PUSH ECX
00ba5247  PUSH 0x10bb12c
00ba524c  PUSH EAX
00ba524d  CALL 0x00bcbda0
00ba5252  ADD ESP,0x24
00ba5255  RET

===== 0x00BA5260 =====
entry=00ba5260
body=[[00ba5260, 00ba54df]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00ba5260(int param_1,undefined4 param_2,int param_3)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  undefined4 uVar4;
  float fVar5;
  double dVar6;
  float fVar7;
  float fVar8;
  double dVar9;
  
  pfVar3 = *(float **)(param_1 + 0x60);
  *(int *)(param_1 + 0x2c) = *(int *)(param_1 + 0x2c) + param_3;
  fVar5 = (float)((double)*(int *)(param_1 + 0x2c) / _DAT_00fa9598);
  dVar9 = (double)*(float *)(param_1 + 0x30) * (double)fVar5;
  if ((*(byte *)(param_1 + 0x5c) & 1) == 0) {
    dVar6 = (double)fVar5 * (double)fVar5;
    fVar8 = (float)(dVar9 + (double)*(float *)(param_1 + 0x40) * _DAT_00f59898 * dVar6 +
                   (double)*(float *)(param_1 + 0x20));
    fVar7 = (float)((double)*(float *)(param_1 + 0x44) * _DAT_00f59898 * dVar6 +
                    (double)*(float *)(param_1 + 0x34) * (double)fVar5 +
                   (double)*(float *)(param_1 + 0x24));
    fVar5 = (float)((double)*(float *)(param_1 + 0x48) * _DAT_00f59898 * dVar6 +
                    (double)*(float *)(param_1 + 0x38) * (double)fVar5 +
                   (double)*(float *)(param_1 + 0x28));
  }
  else {
    fVar1 = *(float *)(param_1 + 0x4c);
    fVar8 = *(float *)(param_1 + 0x40);
    fVar7 = (float)(dVar9 + (double)*(float *)(param_1 + 0x20));
    *(float *)(param_1 + 0x40) = fVar7;
    fVar8 = (fVar7 - fVar8) * fVar1 + *(float *)(param_1 + 0x50);
    *(float *)(param_1 + 0x50) = fVar8;
    fVar2 = *(float *)(param_1 + 0x34) * fVar5 + *(float *)(param_1 + 0x24);
    fVar7 = *(float *)(param_1 + 0x44);
    *(float *)(param_1 + 0x44) = fVar2;
    fVar7 = (fVar2 - fVar7) * fVar1 + *(float *)(param_1 + 0x54);
    *(float *)(param_1 + 0x54) = fVar7;
    fVar2 = *(float *)(param_1 + 0x38) * fVar5 + *(float *)(param_1 + 0x28);
    fVar5 = *(float *)(param_1 + 0x48);
    *(float *)(param_1 + 0x48) = fVar2;
    fVar5 = (fVar2 - fVar5) * fVar1 + *(float *)(param_1 + 0x58);
    *(float *)(param_1 + 0x58) = fVar5;
    *(float *)(param_1 + 0x4c) = *(float *)(param_1 + 0x3c) * *(float *)(param_1 + 0x4c);
  }
  fVar1 = pfVar3[1];
  fVar2 = *pfVar3;
  *(float *)(param_1 + 0x18) = pfVar3[2] + fVar5;
  uVar4 = _DAT_00f54f70;
  *(float *)(param_1 + 0x10) = fVar2 + fVar8;
  *(float *)(param_1 + 0x14) = fVar1 + fVar7;
  *(undefined4 *)(param_1 + 0x1c) = uVar4;
  if (*(int *)(param_1 + 100) != 0) {
    func_0x00ba4b50(*(int *)(param_1 + 100),(float *)(param_1 + 0x10));
  }
  return;
}


-- listing --
00ba5260  MOV EAX,dword ptr [ESP + 0x4]
00ba5264  MOV EDX,dword ptr [EAX + 0x60]
00ba5267  PUSH ESI
00ba5268  MOV ESI,dword ptr [ESP + 0x10]
00ba526c  ADD dword ptr [EAX + 0x2c],ESI
00ba526f  TEST byte ptr [EAX + 0x5c],0x1
00ba5273  CVTSI2SS XMM0,dword ptr [EAX + 0x2c]
00ba5278  MOVSS XMM2,dword ptr [EAX + 0x30]
00ba527d  CVTSS2SD XMM0,XMM0
00ba5281  DIVSD XMM0,qword ptr [0x00fa9598]
00ba5289  LEA ECX,[EAX + 0x10]
00ba528c  CVTSD2SS XMM0,XMM0
00ba5290  CVTSS2SD XMM3,XMM0
00ba5294  CVTPS2PD XMM2,XMM2
00ba5297  POP ESI
00ba5298  MULSD XMM2,XMM3
00ba529c  JZ 0x00ba53dc
00ba52a2  MOVSS XMM3,dword ptr [EAX + 0x20]
00ba52a7  MOVSS XMM1,dword ptr [ECX + 0x3c]
00ba52ac  CVTPS2PD XMM3,XMM3
00ba52af  ADDSD XMM2,XMM3
00ba52b3  MOVSS XMM3,dword ptr [EAX + 0x40]
00ba52b8  CVTPS2PD XMM3,XMM3
00ba52bb  CVTPD2PS XMM2,XMM2
00ba52bf  MOVSS dword ptr [EAX + 0x40],XMM2
00ba52c4  CVTSS2SD XMM2,XMM2
00ba52c8  SUBSD XMM2,XMM3
00ba52cc  CVTPS2PD XMM3,XMM1
00ba52cf  CVTSS2SD XMM4,XMM0
00ba52d3  CVTPD2PS XMM2,XMM2
00ba52d7  CVTSS2SD XMM2,XMM2
00ba52db  MULSD XMM2,XMM3
00ba52df  MOVSS XMM3,dword ptr [EAX + 0x50]
00ba52e4  CVTPS2PD XMM3,XMM3
00ba52e7  CVTPD2PS XMM2,XMM2
00ba52eb  CVTSS2SD XMM2,XMM2
00ba52ef  ADDSD XMM2,XMM3
00ba52f3  CVTPD2PS XMM2,XMM2
00ba52f7  MOVSS dword ptr [EAX + 0x50],XMM2
00ba52fc  MOVSS XMM3,dword ptr [EAX + 0x34]
00ba5301  CVTPS2PD XMM3,XMM3
00ba5304  MULSD XMM3,XMM4
00ba5308  MOVSS XMM4,dword ptr [EAX + 0x24]
00ba530d  CVTPS2PD XMM4,XMM4
00ba5310  ADDSD XMM3,XMM4
00ba5314  MOVSS XMM4,dword ptr [EAX + 0x44]
00ba5319  CVTPD2PS XMM3,XMM3
00ba531d  MOVSS dword ptr [EAX + 0x44],XMM3
00ba5322  CVTPS2PD XMM4,XMM4
00ba5325  CVTSS2SD XMM3,XMM3
00ba5329  SUBSD XMM3,XMM4
00ba532d  CVTPS2PD XMM4,XMM1
00ba5330  CVTPD2PS XMM3,XMM3
00ba5334  CVTSS2SD XMM3,XMM3
00ba5338  MULSD XMM3,XMM4
00ba533c  MOVSS XMM4,dword ptr [EAX + 0x54]
00ba5341  CVTPS2PD XMM4,XMM4
00ba5344  CVTSS2SD XMM0,XMM0
00ba5348  CVTPD2PS XMM3,XMM3
00ba534c  CVTSS2SD XMM3,XMM3
00ba5350  ADDSD XMM3,XMM4
00ba5354  CVTPD2PS XMM3,XMM3
00ba5358  MOVSS dword ptr [EAX + 0x54],XMM3
00ba535d  MOVSS XMM4,dword ptr [EAX + 0x38]
00ba5362  CVTPS2PD XMM4,XMM4
00ba5365  MULSD XMM4,XMM0
00ba5369  MOVSS XMM0,dword ptr [EAX + 0x28]
00ba536e  CVTPS2PD XMM0,XMM0
00ba5371  ADDSD XMM4,XMM0
00ba5375  CVTPD2PS XMM0,XMM4
00ba5379  MOVSS XMM4,dword ptr [EAX + 0x48]
00ba537e  MOVSS dword ptr [EAX + 0x48],XMM0
00ba5383  CVTSS2SD XMM0,XMM0
00ba5387  CVTPS2PD XMM1,XMM1
00ba538a  CVTPS2PD XMM4,XMM4
00ba538d  SUBSD XMM0,XMM4
00ba5391  CVTPD2PS XMM0,XMM0
00ba5395  CVTSS2SD XMM0,XMM0
00ba5399  MULSD XMM0,XMM1
00ba539d  MOVSS XMM1,dword ptr [EAX + 0x58]
00ba53a2  CVTPS2PD XMM1,XMM1
00ba53a5  CVTPD2PS XMM0,XMM0
00ba53a9  CVTSS2SD XMM0,XMM0
00ba53ad  ADDSD XMM0,XMM1
00ba53b1  CVTPD2PS XMM0,XMM0
00ba53b5  MOVSS dword ptr [EAX + 0x58],XMM0
00ba53ba  MOVSS XMM4,dword ptr [ECX + 0x3c]
00ba53bf  MOVSS XMM1,dword ptr [ECX + 0x2c]
00ba53c4  CVTPS2PD XMM1,XMM1
00ba53c7  CVTPS2PD XMM4,XMM4
00ba53ca  MULSD XMM1,XMM4
00ba53ce  CVTPD2PS XMM1,XMM1
00ba53d2  MOVSS dword ptr [ECX + 0x3c],XMM1
00ba53d7  JMP 0x00ba5478
00ba53dc  MOVSD XMM4,qword ptr [0x00f59898]
00ba53e4  MOVSS XMM3,dword ptr [EAX + 0x40]
00ba53e9  MOVSS XMM5,dword ptr [EAX + 0x34]
00ba53ee  CVTPS2PD XMM3,XMM3
00ba53f1  MULSD XMM3,XMM4
00ba53f5  CVTSS2SD XMM1,XMM0
00ba53f9  MULSD XMM1,XMM1
00ba53fd  MULSD XMM3,XMM1
00ba5401  ADDSD XMM2,XMM3
00ba5405  MOVSS XMM3,dword ptr [EAX + 0x20]
00ba540a  CVTPS2PD XMM3,XMM3
00ba540d  ADDSD XMM2,XMM3
00ba5411  MOVSS XMM3,dword ptr [EAX + 0x44]
00ba5416  CVTPS2PD XMM5,XMM5
00ba5419  CVTPS2PD XMM3,XMM3
00ba541c  CVTSS2SD XMM6,XMM0
00ba5420  MULSD XMM5,XMM6
00ba5424  MULSD XMM3,XMM4
00ba5428  MULSD XMM3,XMM1
00ba542c  ADDSD XMM3,XMM5
00ba5430  MOVSS XMM5,dword ptr [EAX + 0x24]
00ba5435  CVTPS2PD XMM5,XMM5
00ba5438  ADDSD XMM3,XMM5
00ba543c  MOVSS XMM5,dword ptr [EAX + 0x48]
00ba5441  CVTPS2PD XMM5,XMM5
00ba5444  MULSD XMM5,XMM4
00ba5448  MULSD XMM5,XMM1
00ba544c  MOVSS XMM1,dword ptr [EAX + 0x38]
00ba5451  CVTSS2SD XMM0,XMM0
00ba5455  CVTPS2PD XMM1,XMM1
00ba5458  MULSD XMM1,XMM0
00ba545c  MOVSS XMM0,dword ptr [EAX + 0x28]
00ba5461  CVTPS2PD XMM0,XMM0
00ba5464  ADDSD XMM5,XMM1
00ba5468  ADDSD XMM5,XMM0
00ba546c  CVTPD2PS XMM2,XMM2
00ba5470  CVTPD2PS XMM3,XMM3
00ba5474  CVTPD2PS XMM0,XMM5
00ba5478  MOVSS XMM1,dword ptr [EDX + 0x4]
00ba547d  CVTSS2SD XMM3,XMM3
00ba5481  CVTPS2PD XMM1,XMM1
00ba5484  ADDSD XMM1,XMM3
00ba5488  MOVSS XMM3,dword ptr [EDX + 0x8]
00ba548d  CVTPS2PD XMM3,XMM3
00ba5490  CVTSS2SD XMM0,XMM0
00ba5494  ADDSD XMM3,XMM0
00ba5498  CVTPD2PS XMM0,XMM3
00ba549c  MOVSS XMM3,dword ptr [EDX]
00ba54a0  CVTSS2SD XMM2,XMM2
00ba54a4  CVTPS2PD XMM3,XMM3
00ba54a7  MOVSS dword ptr [ECX + 0x8],XMM0
00ba54ac  MOVSS XMM0,dword ptr [0x00f54f70]
00ba54b4  ADDSD XMM3,XMM2
00ba54b8  CVTPD2PS XMM1,XMM1
00ba54bc  CVTPD2PS XMM2,XMM3
00ba54c0  MOVSS dword ptr [ECX],XMM2
00ba54c4  MOVSS dword ptr [ECX + 0x4],XMM1
00ba54c9  MOVSS dword ptr [ECX + 0xc],XMM0
00ba54ce  MOV EAX,dword ptr [EAX + 0x64]
00ba54d1  TEST EAX,EAX
00ba54d3  JZ 0x00ba54df
00ba54d5  PUSH ECX
00ba54d6  PUSH EAX
00ba54d7  CALL 0x00ba4b50
00ba54dc  ADD ESP,0x8
00ba54df  RET

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

===== 0x00D66690 =====
entry=00d66690
body=[[00d66690, 00d666a6]]
completed=true
message=

void FUN_00d66690(int param_1,undefined4 param_2)

{
  func_0x00d86e40(param_1,param_2,param_1 + 0x10);
  return;
}


-- listing --
00d66690  MOV EAX,dword ptr [ESP + 0x4]
00d66694  MOV EDX,dword ptr [ESP + 0x8]
00d66698  LEA ECX,[EAX + 0x10]
00d6669b  PUSH ECX
00d6669c  PUSH EDX
00d6669d  PUSH EAX
00d6669e  CALL 0x00d86e40
00d666a3  ADD ESP,0xc
00d666a6  RET

===== 0x00D666B0 =====
entry=00d666b0
body=[[00d666b0, 00d666c6]]
completed=true
message=

void FUN_00d666b0(int param_1,undefined4 param_2)

{
  func_0x00d87100(param_1,param_2,param_1 + 0x10);
  return;
}


-- listing --
00d666b0  MOV EAX,dword ptr [ESP + 0x4]
00d666b4  MOV EDX,dword ptr [ESP + 0x8]
00d666b8  LEA ECX,[EAX + 0x10]
00d666bb  PUSH ECX
00d666bc  PUSH EDX
00d666bd  PUSH EAX
00d666be  CALL 0x00d87100
00d666c3  ADD ESP,0xc
00d666c6  RET

===== 0x00D666D0 =====
entry=00d666d0
body=[[00d666d0, 00d66721]]
completed=true
message=

void FUN_00d666d0(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  char cVar2;
  undefined4 uStack_c;
  undefined4 uStack_8;
  undefined4 uStack_4;
  
  uVar1 = *(undefined4 *)(param_1 + 0x24);
  uStack_c = 0;
  uStack_8 = 0;
  uStack_4 = 0;
  cVar2 = func_0x00d85e70(param_1,param_2,&uStack_c,param_1 + 0x10);
  if (cVar2 != '\0') {
    func_0x00d81d50(param_1,param_3,param_2,uVar1,&uStack_c);
  }
  return;
}


-- listing --
00d666d0  SUB ESP,0xc
00d666d3  PUSH EBX
00d666d4  MOV EBX,dword ptr [ESP + 0x18]
00d666d8  PUSH ESI
00d666d9  MOV ESI,dword ptr [ESP + 0x18]
00d666dd  XOR EAX,EAX
00d666df  PUSH EDI
00d666e0  MOV EDI,dword ptr [ESI + 0x24]
00d666e3  MOV dword ptr [ESP + 0xc],EAX
00d666e7  MOV dword ptr [ESP + 0x10],EAX
00d666eb  MOV dword ptr [ESP + 0x14],EAX
00d666ef  LEA EAX,[ESI + 0x10]
00d666f2  PUSH EAX
00d666f3  LEA ECX,[ESP + 0x10]
00d666f7  PUSH ECX
00d666f8  PUSH EBX
00d666f9  PUSH ESI
00d666fa  CALL 0x00d85e70
00d666ff  ADD ESP,0x10
00d66702  TEST AL,AL
00d66704  JZ 0x00d6671b
00d66706  MOV EAX,dword ptr [ESP + 0x24]
00d6670a  LEA EDX,[ESP + 0xc]
00d6670e  PUSH EDX
00d6670f  PUSH EDI
00d66710  PUSH EBX
00d66711  PUSH EAX
00d66712  PUSH ESI
00d66713  CALL 0x00d81d50
00d66718  ADD ESP,0x14
00d6671b  POP EDI
00d6671c  POP ESI
00d6671d  POP EBX
00d6671e  ADD ESP,0xc
00d66721  RET

===== 0x00D66730 =====
entry=00d66730
body=[[00d66730, 00d66787]]
completed=true
message=

void FUN_00d66730(int param_1,undefined4 param_2)

{
  undefined4 uVar1;
  undefined4 uVar2;
  char cVar3;
  undefined4 uStack_c;
  undefined4 uStack_8;
  undefined4 uStack_4;
  
  uVar1 = *(undefined4 *)(param_1 + 0x24);
  uVar2 = *(undefined4 *)(param_1 + 0x20);
  uStack_c = 0;
  uStack_8 = 0;
  uStack_4 = 0;
  cVar3 = func_0x00d85e70(param_1,param_2,&uStack_c,param_1 + 0x10);
  if (cVar3 != '\0') {
    func_0x00d83430(param_1,param_2,&uStack_c,param_1 + 0x10,uVar1,uVar2);
  }
  return;
}


-- listing --
00d66730  SUB ESP,0xc
00d66733  MOV ECX,dword ptr [ESP + 0x14]
00d66737  PUSH EBX
00d66738  PUSH EBP
00d66739  PUSH ESI
00d6673a  MOV ESI,dword ptr [ESP + 0x1c]
00d6673e  MOV EBX,dword ptr [ESI + 0x24]
00d66741  MOV EBP,dword ptr [ESI + 0x20]
00d66744  PUSH EDI
00d66745  XOR EAX,EAX
00d66747  MOV dword ptr [ESP + 0x10],EAX
00d6674b  MOV dword ptr [ESP + 0x14],EAX
00d6674f  MOV dword ptr [ESP + 0x18],EAX
00d66753  LEA EDI,[ESI + 0x10]
00d66756  PUSH EDI
00d66757  LEA EAX,[ESP + 0x14]
00d6675b  PUSH EAX
00d6675c  PUSH ECX
00d6675d  PUSH ESI
00d6675e  CALL 0x00d85e70
00d66763  ADD ESP,0x10
00d66766  TEST AL,AL
00d66768  JZ 0x00d66780
00d6676a  MOV EAX,dword ptr [ESP + 0x24]
00d6676e  PUSH EBP
00d6676f  PUSH EBX
00d66770  PUSH EDI
00d66771  LEA EDX,[ESP + 0x1c]
00d66775  PUSH EDX
00d66776  PUSH EAX
00d66777  PUSH ESI
00d66778  CALL 0x00d83430
00d6677d  ADD ESP,0x18
00d66780  POP EDI
00d66781  POP ESI
00d66782  POP EBP
00d66783  POP EBX
00d66784  ADD ESP,0xc
00d66787  RET

===== 0x00D66790 =====
entry=00d66790
body=[[00d66790, 00d667e4]]
completed=true
message=

void FUN_00d66790(int param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  char cVar2;
  undefined4 uStack_c;
  undefined4 uStack_8;
  undefined4 uStack_4;
  
  uVar1 = *(undefined4 *)(param_1 + 0x24);
  uStack_c = 0;
  uStack_8 = 0;
  uStack_4 = 0;
  cVar2 = func_0x00d85e70(param_1,param_2,&uStack_c,param_1 + 0x10);
  if (cVar2 != '\0') {
    func_0x00d838b0(param_1,param_2,&uStack_c,param_1 + 0x10,uVar1,param_3);
  }
  return;
}


-- listing --
00d66790  SUB ESP,0xc
00d66793  PUSH EBX
00d66794  PUSH EBP
00d66795  MOV EBP,dword ptr [ESP + 0x1c]
00d66799  PUSH ESI
00d6679a  MOV ESI,dword ptr [ESP + 0x1c]
00d6679e  MOV EBX,dword ptr [ESI + 0x24]
00d667a1  PUSH EDI
00d667a2  XOR EAX,EAX
00d667a4  MOV dword ptr [ESP + 0x10],EAX
00d667a8  MOV dword ptr [ESP + 0x14],EAX
00d667ac  MOV dword ptr [ESP + 0x18],EAX
00d667b0  LEA EDI,[ESI + 0x10]
00d667b3  PUSH EDI
00d667b4  LEA EAX,[ESP + 0x14]
00d667b8  PUSH EAX
00d667b9  PUSH EBP
00d667ba  PUSH ESI
00d667bb  CALL 0x00d85e70
00d667c0  ADD ESP,0x10
00d667c3  TEST AL,AL
00d667c5  JZ 0x00d667dd
00d667c7  MOV ECX,dword ptr [ESP + 0x28]
00d667cb  PUSH ECX
00d667cc  PUSH EBX
00d667cd  PUSH EDI
00d667ce  LEA EDX,[ESP + 0x1c]
00d667d2  PUSH EDX
00d667d3  PUSH EBP
00d667d4  PUSH ESI
00d667d5  CALL 0x00d838b0
00d667da  ADD ESP,0x18
00d667dd  POP EDI
00d667de  POP ESI
00d667df  POP EBP
00d667e0  POP EBX
00d667e1  ADD ESP,0xc
00d667e4  RET

===== 0x00D667F0 =====
entry=00d667f0
body=[[00d667f0, 00d6689d]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d667f0(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  char cVar4;
  undefined4 uStack_c;
  undefined4 uStack_8;
  undefined4 uStack_4;
  
  iVar2 = *(int *)(param_1 + 0x20);
  uVar3 = *(undefined4 *)(param_1 + 0x24);
  uStack_c = 0;
  uStack_8 = 0;
  uStack_4 = 0;
  iVar1 = param_1 + 0x10;
  if (((_DAT_00f62f70 < (double)*(float *)(iVar2 + 0xc)) &&
      (cVar4 = func_0x00d85e70(param_1,param_2,&uStack_c,iVar1), cVar4 != '\0')) &&
     (cVar4 = func_0x00d82750(param_1,param_2,&uStack_c,iVar1,uVar3), cVar4 != '\0')) {
    func_0x00e3a460(param_1);
    _DAT_01308478 = func_0x00bb35b0();
    func_0x00d87180(param_1,param_2,&uStack_c,iVar1,uVar3,iVar2,0);
    _DAT_01308478 = 0;
  }
  return;
}


-- listing --
00d667f0  SUB ESP,0xc
00d667f3  PUSH EBX
00d667f4  PUSH ESI
00d667f5  MOV ESI,dword ptr [ESP + 0x18]
00d667f9  MOV EAX,dword ptr [ESI + 0x20]
00d667fc  MOVSS XMM0,dword ptr [EAX + 0xc]
00d66801  MOV EBX,dword ptr [ESI + 0x24]
00d66804  CVTPS2PD XMM0,XMM0
00d66807  COMISD XMM0,qword ptr [0x00f62f70]
00d6680f  PUSH EDI
00d66810  MOV dword ptr [ESP + 0x1c],EAX
00d66814  JBE 0x00d6681a
00d66816  MOV AL,0x1
00d66818  JMP 0x00d6681c
00d6681a  XOR AL,AL
00d6681c  XOR ECX,ECX
00d6681e  TEST AL,AL
00d66820  MOV dword ptr [ESP + 0xc],ECX
00d66824  MOV dword ptr [ESP + 0x10],ECX
00d66828  MOV dword ptr [ESP + 0x14],ECX
00d6682c  LEA EDI,[ESI + 0x10]
00d6682f  JZ 0x00d66897
00d66831  PUSH EBP
00d66832  MOV EBP,dword ptr [ESP + 0x24]
00d66836  PUSH EDI
00d66837  LEA EAX,[ESP + 0x14]
00d6683b  PUSH EAX
00d6683c  PUSH EBP
00d6683d  PUSH ESI
00d6683e  CALL 0x00d85e70
00d66843  ADD ESP,0x10
00d66846  TEST AL,AL
00d66848  JZ 0x00d66896
00d6684a  PUSH EBX
00d6684b  PUSH EDI
00d6684c  LEA ECX,[ESP + 0x18]
00d66850  PUSH ECX
00d66851  PUSH EBP
00d66852  PUSH ESI
00d66853  CALL 0x00d82750
00d66858  ADD ESP,0x14
00d6685b  TEST AL,AL
00d6685d  JZ 0x00d66896
00d6685f  PUSH ESI
00d66860  CALL 0x00e3a460
00d66865  ADD ESP,0x4
00d66868  MOV ECX,EAX
00d6686a  CALL 0x00bb35b0
00d6686f  MOV EDX,dword ptr [ESP + 0x20]
00d66873  PUSH 0x0
00d66875  PUSH EDX
00d66876  PUSH EBX
00d66877  MOV [0x01308478],EAX
00d6687c  PUSH EDI
00d6687d  LEA EAX,[ESP + 0x20]
00d66881  PUSH EAX
00d66882  PUSH EBP
00d66883  PUSH ESI
00d66884  CALL 0x00d87180
00d66889  ADD ESP,0x1c
00d6688c  MOV dword ptr [0x01308478],0x0
00d66896  POP EBP
00d66897  POP EDI
00d66898  POP ESI
00d66899  POP EBX
00d6689a  ADD ESP,0xc
00d6689d  RET
