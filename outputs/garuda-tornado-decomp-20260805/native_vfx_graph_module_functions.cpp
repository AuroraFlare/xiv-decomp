program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BE8FE0 =====
entry=00be8fe0
body=[[00be8fe0, 00be8ff4]]
completed=true
message=

void FUN_00be8fe0(undefined4 *param_1,undefined4 *param_2)

{
  *param_1 = *param_2;
  param_1[2] = 0;
  return;
}


-- listing --
00be8fe0  MOV EAX,dword ptr [ESP + 0x8]
00be8fe4  FLD float ptr [EAX]
00be8fe6  MOV EAX,dword ptr [ESP + 0x4]
00be8fea  XORPS XMM0,XMM0
00be8fed  FSTP float ptr [EAX]
00be8fef  MOVSS dword ptr [EAX + 0x8],XMM0
00be8ff4  RET

===== 00BE9000 =====
entry=00be9000
body=[[00be9000, 00be9000]]
completed=true
message=

void FUN_00be9000(void)

{
  return;
}


-- listing --
00be9000  RET

===== 00BE9010 =====
entry=00be9010
body=[[00be9010, 00be9033]]
completed=true
message=

void FUN_00be9010(float *param_1,float *param_2)

{
  *param_1 = param_1[2] + *param_2;
  return;
}


-- listing --
00be9010  MOV EAX,dword ptr [ESP + 0x4]
00be9014  MOV ECX,dword ptr [ESP + 0x8]
00be9018  MOVSS XMM1,dword ptr [ECX]
00be901c  MOVSS XMM0,dword ptr [EAX + 0x8]
00be9021  CVTPS2PD XMM0,XMM0
00be9024  CVTPS2PD XMM1,XMM1
00be9027  ADDSD XMM0,XMM1
00be902b  CVTPD2PS XMM0,XMM0
00be902f  MOVSS dword ptr [EAX],XMM0
00be9033  RET

===== 00BE9120 =====
entry=00be9120
body=[[00be9120, 00be9153]]
completed=true
message=

void FUN_00be9120(int param_1,float *param_2,float *param_3,undefined4 param_4,undefined4 param_5,
                 undefined4 *param_6)

{
  float10 fVar1;
  
  fVar1 = (float10)func_0x00be9160((*param_2 - *param_3) + *(float *)(param_1 + 8),*param_6);
  *(float *)(param_1 + 8) = (float)fVar1;
  return;
}


-- listing --
00be9120  MOV EAX,dword ptr [ESP + 0x8]
00be9124  FLD float ptr [EAX]
00be9126  MOV ECX,dword ptr [ESP + 0xc]
00be912a  FSUB float ptr [ECX]
00be912c  MOV EDX,dword ptr [ESP + 0x18]
00be9130  MOV EAX,dword ptr [EDX]
00be9132  PUSH ESI
00be9133  MOV ESI,dword ptr [ESP + 0x8]
00be9137  FADD float ptr [ESI + 0x8]
00be913a  PUSH EAX
00be913b  PUSH ECX
00be913c  FSTP float ptr [ESP + 0x10]
00be9140  FLD float ptr [ESP + 0x10]
00be9144  FSTP float ptr [ESP]
00be9147  CALL 0x00be9160
00be914c  ADD ESP,0x8
00be914f  FSTP float ptr [ESI + 0x8]
00be9152  POP ESI
00be9153  RET

===== 00BE9040 =====
entry=00be9040
body=[[00be9040, 00be904b]]
completed=true
message=

void FUN_00be9040(void)

{
  undefined4 *in_stack_00000010;
  
  *in_stack_00000010 = 0;
  return;
}


-- listing --
00be9040  MOV EAX,dword ptr [ESP + 0x10]
00be9044  XORPS XMM0,XMM0
00be9047  MOVSS dword ptr [EAX],XMM0
00be904b  RET

===== 00BE99E0 =====
entry=00be99e0
body=[[00be99e0, 00be99f4]]
completed=true
message=

void FUN_00be99e0(undefined4 *param_1,undefined4 *param_2)

{
  *param_1 = *param_2;
  param_1[2] = 0;
  return;
}


-- listing --
00be99e0  MOV EAX,dword ptr [ESP + 0x8]
00be99e4  FLD float ptr [EAX]
00be99e6  MOV EAX,dword ptr [ESP + 0x4]
00be99ea  XORPS XMM0,XMM0
00be99ed  FSTP float ptr [EAX]
00be99ef  MOVSS dword ptr [EAX + 0x8],XMM0
00be99f4  RET

===== 00BE9A00 =====
entry=00be9a00
body=[[00be9a00, 00be9a3c]]
completed=true
message=

void FUN_00be9a00(float *param_1,float *param_2,float param_3)

{
  *param_1 = param_2[1] * param_3 + *param_2 + param_1[2];
  return;
}


-- listing --
00be9a00  MOV EAX,dword ptr [ESP + 0x8]
00be9a04  MOVSS XMM0,dword ptr [EAX + 0x4]
00be9a09  MOVSS XMM1,dword ptr [ESP + 0xc]
00be9a0f  CVTPS2PD XMM1,XMM1
00be9a12  CVTPS2PD XMM0,XMM0
00be9a15  MULSD XMM0,XMM1
00be9a19  MOVSS XMM1,dword ptr [EAX]
00be9a1d  MOV EAX,dword ptr [ESP + 0x4]
00be9a21  CVTPS2PD XMM1,XMM1
00be9a24  ADDSD XMM0,XMM1
00be9a28  MOVSS XMM1,dword ptr [EAX + 0x8]
00be9a2d  CVTPS2PD XMM1,XMM1
00be9a30  ADDSD XMM0,XMM1
00be9a34  CVTPD2PS XMM0,XMM0
00be9a38  MOVSS dword ptr [EAX],XMM0
00be9a3c  RET

===== 00BE9A40 =====
entry=00be9a40
body=[[00be9a40, 00be9a63]]
completed=true
message=

void FUN_00be9a40(float *param_1,float *param_2)

{
  *param_1 = param_1[2] + *param_2;
  return;
}


-- listing --
00be9a40  MOV EAX,dword ptr [ESP + 0x4]
00be9a44  MOV ECX,dword ptr [ESP + 0x8]
00be9a48  MOVSS XMM1,dword ptr [ECX]
00be9a4c  MOVSS XMM0,dword ptr [EAX + 0x8]
00be9a51  CVTPS2PD XMM0,XMM0
00be9a54  CVTPS2PD XMM1,XMM1
00be9a57  ADDSD XMM0,XMM1
00be9a5b  CVTPD2PS XMM0,XMM0
00be9a5f  MOVSS dword ptr [EAX],XMM0
00be9a63  RET

===== 00BE9B50 =====
entry=00be9b50
body=[[00be9b50, 00be9c17]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00be9b50(int param_1,float *param_2,float *param_3,float param_4,float param_5,
                 undefined4 *param_6)

{
  float fVar1;
  float10 fVar2;
  
  fVar1 = (param_2[1] * param_4 + *param_2) - (param_3[1] * param_5 + *param_3);
  if (((0.0 < fVar1) || ((double)fVar1 <= _DAT_010cf418)) &&
     (((double)fVar1 <= _DAT_00f62f70 || (_DAT_00fe1e38 <= (double)fVar1)))) {
    fVar2 = (float10)func_0x00be9160(*(float *)(param_1 + 8) + fVar1,*param_6);
    *(float *)(param_1 + 8) = (float)fVar2;
  }
  return;
}


-- listing --
00be9b50  MOV EAX,dword ptr [ESP + 0x8]
00be9b54  MOVSS XMM0,dword ptr [EAX + 0x4]
00be9b59  MOVSS XMM1,dword ptr [ESP + 0x10]
00be9b5f  MOVSS XMM2,dword ptr [ESP + 0x14]
00be9b65  CVTPS2PD XMM1,XMM1
00be9b68  CVTPS2PD XMM0,XMM0
00be9b6b  MULSD XMM0,XMM1
00be9b6f  MOVSS XMM1,dword ptr [EAX]
00be9b73  MOV EAX,dword ptr [ESP + 0xc]
00be9b77  CVTPS2PD XMM1,XMM1
00be9b7a  ADDSD XMM0,XMM1
00be9b7e  MOVSS XMM1,dword ptr [EAX + 0x4]
00be9b83  CVTPS2PD XMM1,XMM1
00be9b86  CVTPS2PD XMM2,XMM2
00be9b89  MULSD XMM1,XMM2
00be9b8d  MOVSS XMM2,dword ptr [EAX]
00be9b91  CVTPD2PS XMM0,XMM0
00be9b95  CVTPS2PD XMM2,XMM2
00be9b98  ADDSD XMM1,XMM2
00be9b9c  CVTPD2PS XMM1,XMM1
00be9ba0  CVTSS2SD XMM0,XMM0
00be9ba4  CVTSS2SD XMM1,XMM1
00be9ba8  SUBSD XMM0,XMM1
00be9bac  XORPS XMM1,XMM1
00be9baf  CVTPD2PS XMM0,XMM0
00be9bb3  COMISS XMM1,XMM0
00be9bb6  MOVSS dword ptr [ESP + 0x8],XMM0
00be9bbc  JC 0x00be9bcc
00be9bbe  CVTSS2SD XMM1,XMM0
00be9bc2  COMISD XMM1,qword ptr [0x010cf418]
00be9bca  JA 0x00be9c17
00be9bcc  CVTSS2SD XMM1,XMM0
00be9bd0  COMISD XMM1,qword ptr [0x00f62f70]
00be9bd8  JBE 0x00be9bec
00be9bda  MOVSD XMM1,qword ptr [0x00fe1e38]
00be9be2  CVTSS2SD XMM0,XMM0
00be9be6  COMISD XMM1,XMM0
00be9bea  JA 0x00be9c17
00be9bec  MOV EAX,dword ptr [ESP + 0x18]
00be9bf0  MOV ECX,dword ptr [EAX]
00be9bf2  PUSH ESI
00be9bf3  MOV ESI,dword ptr [ESP + 0x8]
00be9bf7  FLD float ptr [ESI + 0x8]
00be9bfa  PUSH ECX
00be9bfb  FADD float ptr [ESP + 0x10]
00be9bff  PUSH ECX
00be9c00  FSTP float ptr [ESP + 0x14]
00be9c04  FLD float ptr [ESP + 0x14]
00be9c08  FSTP float ptr [ESP]
00be9c0b  CALL 0x00be9160
00be9c10  ADD ESP,0x8
00be9c13  FSTP float ptr [ESI + 0x8]
00be9c16  POP ESI
00be9c17  RET

===== 00BE9A70 =====
entry=00be9a70
body=[[00be9a70, 00be9a7d]]
completed=true
message=

void FUN_00be9a70(undefined4 param_1,int param_2,undefined4 param_3,undefined4 *param_4)

{
  *param_4 = *(undefined4 *)(param_2 + 4);
  return;
}


-- listing --
00be9a70  MOV EAX,dword ptr [ESP + 0x8]
00be9a74  FLD float ptr [EAX + 0x4]
00be9a77  MOV ECX,dword ptr [ESP + 0x10]
00be9a7b  FSTP float ptr [ECX]
00be9a7d  RET

===== 00BEC270 =====
entry=00bec270
body=[[00bec270, 00bec2b6]]
completed=true
message=

void FUN_00bec270(int param_1,byte *param_2)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  int iVar4;
  
  iVar2 = 0;
  puVar1 = (undefined4 *)(param_1 + 4 + (uint)param_2[1] * 4);
  if (param_2[1] != 0) {
    puVar3 = puVar1;
    do {
      iVar4 = (*param_2 + 1) * iVar2;
      iVar2 = iVar2 + 1;
      *(undefined4 *)((param_1 - (int)puVar1) + -4 + (int)(puVar3 + 1)) =
           *(undefined4 *)(param_2 + iVar4 * 4 + 4);
      *puVar3 = 0;
      puVar3 = puVar3 + 1;
    } while (iVar2 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bec270  MOV EDX,dword ptr [ESP + 0x8]
00bec274  PUSH ESI
00bec275  MOV ESI,dword ptr [ESP + 0x8]
00bec279  PUSH EDI
00bec27a  MOVZX EDI,byte ptr [EDX + 0x1]
00bec27e  XOR EAX,EAX
00bec280  TEST EDI,EDI
00bec282  LEA ECX,[ESI + EDI*0x4 + 0x4]
00bec286  JLE 0x00bec2b4
00bec288  XORPS XMM0,XMM0
00bec28b  SUB ESI,ECX
00bec28d  LEA ECX,[ECX]
00bec290  MOVZX EDI,byte ptr [EDX]
00bec293  ADD EDI,0x1
00bec296  IMUL EDI,EAX
00bec299  ADD EAX,0x1
00bec29c  ADD ECX,0x4
00bec29f  FLD float ptr [EDX + EDI*0x4 + 0x4]
00bec2a3  FSTP float ptr [ESI + ECX*0x1 + -0x4]
00bec2a7  MOVSS dword ptr [ECX + -0x4],XMM0
00bec2ac  MOVZX EDI,byte ptr [EDX + 0x1]
00bec2b0  CMP EAX,EDI
00bec2b2  JL 0x00bec290
00bec2b4  POP EDI
00bec2b5  POP ESI
00bec2b6  RET

===== 00BEC2C0 =====
entry=00bec2c0
body=[[00bec2c0, 00bec46a]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bec2c0(float *param_1,byte *param_2,float param_3)

{
  byte bVar1;
  double dVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  float *pfVar7;
  int iVar8;
  float fVar9;
  
  dVar2 = _DAT_00f59898;
  bVar1 = param_2[1];
  if ((*param_2 != 0) && (iVar8 = 0, bVar1 != 0)) {
    uVar3 = (uint)*param_2;
    do {
      iVar5 = (uVar3 + 1) * iVar8;
      *param_1 = *(float *)(param_2 + iVar5 * 4 + 8) * param_3 + *(float *)(param_2 + iVar5 * 4 + 4)
                 + param_1[bVar1 + 1];
      uVar3 = (uint)*param_2;
      if (1 < uVar3) {
        pfVar7 = (float *)(param_2 + iVar5 * 4 + 0xc);
        iVar5 = 1;
        do {
          iVar6 = 0;
          fVar9 = param_3;
          if (7 < iVar5) {
            iVar4 = (iVar5 - 8U >> 3) + 1;
            iVar6 = iVar4 * 8;
            do {
              iVar4 = iVar4 + -1;
              fVar9 = fVar9 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3 *
                      param_3;
            } while (iVar4 != 0);
          }
          if (iVar6 < iVar5) {
            iVar6 = iVar5 - iVar6;
            do {
              iVar6 = iVar6 + -1;
              fVar9 = fVar9 * param_3;
            } while (iVar6 != 0);
          }
          *param_1 = (float)((double)*pfVar7 * dVar2 * (double)fVar9 + (double)*param_1);
          uVar3 = (uint)*param_2;
          iVar6 = iVar5 + 2;
          pfVar7 = pfVar7 + 1;
          iVar5 = iVar5 + 1;
        } while (iVar6 <= (int)uVar3);
      }
      iVar8 = iVar8 + 1;
      param_1 = param_1 + 1;
    } while (iVar8 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bec2c0  PUSH ESI
00bec2c1  MOV ESI,dword ptr [ESP + 0xc]
00bec2c5  MOVZX ECX,byte ptr [ESI + 0x1]
00bec2c9  MOV AL,byte ptr [ESI]
00bec2cb  TEST AL,AL
00bec2cd  PUSH EDI
00bec2ce  MOV EDI,dword ptr [ESP + 0xc]
00bec2d2  LEA EDX,[EDI + ECX*0x4 + 0x4]
00bec2d6  JZ 0x00bec468
00bec2dc  PUSH EBP
00bec2dd  XOR EBP,EBP
00bec2df  TEST ECX,ECX
00bec2e1  JLE 0x00bec467
00bec2e7  MOVSS XMM0,dword ptr [ESP + 0x18]
00bec2ed  MOVSD XMM2,qword ptr [0x00f59898]
00bec2f5  MOVZX ECX,AL
00bec2f8  MOV EAX,EDX
00bec2fa  SUB EAX,EDI
00bec2fc  MOV dword ptr [ESP + 0x14],EAX
00bec300  PUSH EBX
00bec301  LEA EDX,[ECX + 0x1]
00bec304  IMUL EDX,EBP
00bec307  MOVSS XMM1,dword ptr [ESI + EDX*0x4 + 0x8]
00bec30d  CVTPS2PD XMM1,XMM1
00bec310  CVTSS2SD XMM3,XMM0
00bec314  MULSD XMM1,XMM3
00bec318  MOVSS XMM3,dword ptr [ESI + EDX*0x4 + 0x4]
00bec31e  CVTPS2PD XMM3,XMM3
00bec321  ADDSD XMM1,XMM3
00bec325  MOVSS XMM3,dword ptr [EAX + EDI*0x1]
00bec32a  CVTPS2PD XMM3,XMM3
00bec32d  ADDSD XMM1,XMM3
00bec331  CVTPD2PS XMM1,XMM1
00bec335  MOVSS dword ptr [EDI],XMM1
00bec339  MOVZX ECX,byte ptr [ESI]
00bec33c  CMP ECX,0x2
00bec33f  JL 0x00bec454
00bec345  MOV EAX,0x1
00bec34a  LEA EBX,[ESI + EDX*0x4 + 0xc]
00bec34e  MOV EDI,EDI
00bec350  XOR EDX,EDX
00bec352  CMP EAX,0x8
00bec355  MOVAPS XMM1,XMM0
00bec358  JL 0x00bec3f9
00bec35e  LEA ECX,[EAX + -0x8]
00bec361  SHR ECX,0x3
00bec364  ADD ECX,0x1
00bec367  LEA EDX,[ECX*0x8 + 0x0]
00bec36e  MOV EDI,EDI
00bec370  SUB ECX,0x1
00bec373  CVTSS2SD XMM1,XMM1
00bec377  CVTSS2SD XMM3,XMM0
00bec37b  MULSD XMM1,XMM3
00bec37f  CVTSD2SS XMM1,XMM1
00bec383  CVTSS2SD XMM1,XMM1
00bec387  CVTSS2SD XMM3,XMM0
00bec38b  MULSD XMM1,XMM3
00bec38f  CVTSD2SS XMM1,XMM1
00bec393  CVTSS2SD XMM1,XMM1
00bec397  CVTSS2SD XMM3,XMM0
00bec39b  MULSD XMM1,XMM3
00bec39f  CVTSD2SS XMM1,XMM1
00bec3a3  CVTSS2SD XMM1,XMM1
00bec3a7  CVTSS2SD XMM3,XMM0
00bec3ab  MULSD XMM1,XMM3
00bec3af  CVTSD2SS XMM1,XMM1
00bec3b3  CVTSS2SD XMM1,XMM1
00bec3b7  CVTSS2SD XMM3,XMM0
00bec3bb  MULSD XMM1,XMM3
00bec3bf  CVTSD2SS XMM1,XMM1
00bec3c3  CVTSS2SD XMM1,XMM1
00bec3c7  CVTSS2SD XMM3,XMM0
00bec3cb  MULSD XMM1,XMM3
00bec3cf  CVTSD2SS XMM1,XMM1
00bec3d3  CVTSS2SD XMM1,XMM1
00bec3d7  CVTSS2SD XMM3,XMM0
00bec3db  MULSD XMM1,XMM3
00bec3df  CVTSD2SS XMM1,XMM1
00bec3e3  CVTSS2SD XMM1,XMM1
00bec3e7  CVTSS2SD XMM3,XMM0
00bec3eb  MULSD XMM1,XMM3
00bec3ef  CVTSD2SS XMM1,XMM1
00bec3f3  JNZ 0x00bec370
00bec3f9  CMP EDX,EAX
00bec3fb  JGE 0x00bec416
00bec3fd  MOV ECX,EAX
00bec3ff  SUB ECX,EDX
00bec401  SUB ECX,0x1
00bec404  CVTSS2SD XMM1,XMM1
00bec408  CVTSS2SD XMM3,XMM0
00bec40c  MULSD XMM1,XMM3
00bec410  CVTSD2SS XMM1,XMM1
00bec414  JNZ 0x00bec401
00bec416  MOVSS XMM3,dword ptr [EBX]
00bec41a  CVTPS2PD XMM3,XMM3
00bec41d  CVTSS2SD XMM1,XMM1
00bec421  MULSD XMM3,XMM2
00bec425  MULSD XMM3,XMM1
00bec429  MOVSS XMM1,dword ptr [EDI]
00bec42d  CVTPS2PD XMM1,XMM1
00bec430  ADDSD XMM3,XMM1
00bec434  CVTPD2PS XMM1,XMM3
00bec438  MOVSS dword ptr [EDI],XMM1
00bec43c  MOVZX ECX,byte ptr [ESI]
00bec43f  ADD EAX,0x1
00bec442  LEA EDX,[EAX + 0x1]
00bec445  ADD EBX,0x4
00bec448  CMP EDX,ECX
00bec44a  JLE 0x00bec350
00bec450  MOV EAX,dword ptr [ESP + 0x18]
00bec454  MOVZX EDX,byte ptr [ESI + 0x1]
00bec458  ADD EBP,0x1
00bec45b  ADD EDI,0x4
00bec45e  CMP EBP,EDX
00bec460  JL 0x00bec301
00bec466  POP EBX
00bec467  POP EBP
00bec468  POP EDI
00bec469  POP ESI
00bec46a  RET

===== 00BEC470 =====
entry=00bec470
body=[[00bec470, 00bec4c6]]
completed=true
message=

void FUN_00bec470(float *param_1,byte *param_2)

{
  byte bVar1;
  int iVar2;
  
  bVar1 = param_2[1];
  iVar2 = 0;
  if (bVar1 != 0) {
    do {
      *param_1 = *(float *)(param_2 + (*param_2 + 1) * iVar2 * 4 + 4) + param_1[bVar1 + 1];
      iVar2 = iVar2 + 1;
      param_1 = param_1 + 1;
    } while (iVar2 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bec470  MOV EDX,dword ptr [ESP + 0x8]
00bec474  MOV ECX,dword ptr [ESP + 0x4]
00bec478  PUSH ESI
00bec479  PUSH EDI
00bec47a  MOVZX EDI,byte ptr [EDX + 0x1]
00bec47e  XOR EAX,EAX
00bec480  TEST EDI,EDI
00bec482  LEA ESI,[ECX + EDI*0x4 + 0x4]
00bec486  JLE 0x00bec4c4
00bec488  SUB ESI,ECX
00bec48a  LEA EBX,[EBX]
00bec490  MOVZX EDI,byte ptr [EDX]
00bec493  MOVSS XMM1,dword ptr [ESI + ECX*0x1]
00bec498  ADD EDI,0x1
00bec49b  IMUL EDI,EAX
00bec49e  MOVSS XMM0,dword ptr [EDX + EDI*0x4 + 0x4]
00bec4a4  CVTPS2PD XMM0,XMM0
00bec4a7  CVTPS2PD XMM1,XMM1
00bec4aa  ADDSD XMM0,XMM1
00bec4ae  CVTPD2PS XMM0,XMM0
00bec4b2  MOVSS dword ptr [ECX],XMM0
00bec4b6  MOVZX EDI,byte ptr [EDX + 0x1]
00bec4ba  ADD EAX,0x1
00bec4bd  ADD ECX,0x4
00bec4c0  CMP EAX,EDI
00bec4c2  JL 0x00bec490
00bec4c4  POP EDI
00bec4c5  POP ESI
00bec4c6  RET

===== 00BEC710 =====
entry=00bec710
body=[[00bec710, 00beca64]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bec710(int param_1,byte *param_2,byte *param_3,float param_4,float param_5,
                 undefined4 *param_6)

{
  int iVar1;
  float fVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  float *pfVar9;
  float10 fVar10;
  float fVar11;
  float fVar12;
  float fVar13;
  double dVar14;
  
  iVar1 = param_1 + 4 + (uint)param_2[1] * 4;
  iVar8 = 0;
  dVar14 = _DAT_00f59898;
  if (param_2[1] != 0) {
    do {
      uVar6 = (uint)*param_2;
      iVar3 = (uVar6 + 1) * iVar8;
      fVar11 = *(float *)(param_2 + iVar3 * 4 + 4);
      if ((*param_2 != 0) &&
         (fVar11 = *(float *)(param_2 + iVar3 * 4 + 8) * param_4 + fVar11, 1 < uVar6)) {
        iVar5 = 1;
        pfVar9 = (float *)(param_2 + iVar3 * 4 + 0xc);
        iVar3 = uVar6 - 1;
        do {
          iVar7 = 0;
          fVar13 = param_4;
          if (7 < iVar5) {
            iVar4 = (iVar5 - 8U >> 3) + 1;
            iVar7 = iVar4 * 8;
            do {
              iVar4 = iVar4 + -1;
              fVar13 = fVar13 * param_4 * param_4 * param_4 * param_4 * param_4 * param_4 * param_4
                       * param_4;
            } while (iVar4 != 0);
          }
          if (iVar7 < iVar5) {
            iVar7 = iVar5 - iVar7;
            do {
              iVar7 = iVar7 + -1;
              fVar13 = fVar13 * param_4;
            } while (iVar7 != 0);
          }
          fVar12 = *pfVar9;
          pfVar9 = pfVar9 + 1;
          iVar5 = iVar5 + 1;
          iVar3 = iVar3 + -1;
          fVar11 = (float)((double)fVar12 * dVar14 * (double)fVar13 + (double)fVar11);
        } while (iVar3 != 0);
      }
      uVar6 = (uint)*param_3;
      iVar3 = (uVar6 + 1) * iVar8;
      fVar13 = *(float *)(param_3 + iVar3 * 4 + 4);
      if ((*param_3 != 0) &&
         (fVar13 = *(float *)(param_3 + iVar3 * 4 + 8) * param_5 + fVar13, 1 < uVar6)) {
        iVar5 = 1;
        pfVar9 = (float *)(param_3 + iVar3 * 4 + 0xc);
        iVar3 = uVar6 - 1;
        do {
          iVar7 = 0;
          fVar12 = param_5;
          if (7 < iVar5) {
            iVar4 = (iVar5 - 8U >> 3) + 1;
            iVar7 = iVar4 * 8;
            do {
              iVar4 = iVar4 + -1;
              fVar12 = fVar12 * param_5 * param_5 * param_5 * param_5 * param_5 * param_5 * param_5
                       * param_5;
            } while (iVar4 != 0);
          }
          if (iVar7 < iVar5) {
            iVar7 = iVar5 - iVar7;
            do {
              iVar7 = iVar7 + -1;
              fVar12 = fVar12 * param_5;
            } while (iVar7 != 0);
          }
          fVar2 = *pfVar9;
          pfVar9 = pfVar9 + 1;
          iVar5 = iVar5 + 1;
          iVar3 = iVar3 + -1;
          fVar13 = (float)((double)fVar2 * dVar14 * (double)fVar12 + (double)fVar13);
        } while (iVar3 != 0);
      }
      fVar11 = fVar11 - fVar13;
      if (((0.0 < fVar11) || ((double)fVar11 <= _DAT_010cf418)) &&
         (((double)fVar11 <= _DAT_00f62f70 || (_DAT_00fe1e38 <= (double)fVar11)))) {
        fVar10 = (float10)func_0x00be9160(*(float *)(iVar1 + iVar8 * 4) + fVar11,*param_6);
        dVar14 = _DAT_00f59898;
        *(float *)(iVar1 + iVar8 * 4) = (float)fVar10;
      }
      iVar8 = iVar8 + 1;
    } while (iVar8 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bec710  MOV ECX,dword ptr [ESP + 0x4]
00bec714  PUSH EBX
00bec715  MOV EBX,dword ptr [ESP + 0xc]
00bec719  MOVZX EAX,byte ptr [EBX + 0x1]
00bec71d  PUSH EBP
00bec71e  LEA EDX,[ECX + EAX*0x4 + 0x4]
00bec722  XOR EBP,EBP
00bec724  TEST EAX,EAX
00bec726  MOV dword ptr [ESP + 0xc],EDX
00bec72a  JLE 0x00beca62
00bec730  MOVSS XMM0,dword ptr [ESP + 0x1c]
00bec736  MOVSS XMM1,dword ptr [ESP + 0x18]
00bec73c  MOVSD XMM5,qword ptr [0x00f59898]
00bec744  PUSH ESI
00bec745  PUSH EDI
00bec746  MOV CL,byte ptr [EBX]
00bec748  MOVZX EDX,CL
00bec74b  LEA EAX,[EDX + 0x1]
00bec74e  IMUL EAX,EBP
00bec751  TEST CL,CL
00bec753  MOVSS XMM4,dword ptr [EBX + EAX*0x4 + 0x4]
00bec759  JBE 0x00bec888
00bec75f  CMP EDX,0x2
00bec762  MOVSS XMM2,dword ptr [EBX + EAX*0x4 + 0x8]
00bec768  CVTPS2PD XMM2,XMM2
00bec76b  CVTSS2SD XMM3,XMM1
00bec76f  MULSD XMM2,XMM3
00bec773  CVTPS2PD XMM3,XMM4
00bec776  ADDSD XMM2,XMM3
00bec77a  CVTPD2PS XMM2,XMM2
00bec77e  MOVAPS XMM4,XMM2
00bec781  JL 0x00bec888
00bec787  MOV ECX,0x1
00bec78c  LEA ESI,[EBX + EAX*0x4 + 0xc]
00bec790  LEA EDI,[EDX + -0x1]
00bec793  XOR EDX,EDX
00bec795  CMP ECX,0x8
00bec798  MOVAPS XMM2,XMM1
00bec79b  JL 0x00bec83a
00bec7a1  LEA EAX,[ECX + -0x8]
00bec7a4  SHR EAX,0x3
00bec7a7  ADD EAX,0x1
00bec7aa  LEA EDX,[EAX*0x8 + 0x0]
00bec7b1  SUB EAX,0x1
00bec7b4  CVTSS2SD XMM2,XMM2
00bec7b8  CVTSS2SD XMM3,XMM1
00bec7bc  MULSD XMM2,XMM3
00bec7c0  CVTSD2SS XMM2,XMM2
00bec7c4  CVTSS2SD XMM2,XMM2
00bec7c8  CVTSS2SD XMM3,XMM1
00bec7cc  MULSD XMM2,XMM3
00bec7d0  CVTSD2SS XMM2,XMM2
00bec7d4  CVTSS2SD XMM2,XMM2
00bec7d8  CVTSS2SD XMM3,XMM1
00bec7dc  MULSD XMM2,XMM3
00bec7e0  CVTSD2SS XMM2,XMM2
00bec7e4  CVTSS2SD XMM2,XMM2
00bec7e8  CVTSS2SD XMM3,XMM1
00bec7ec  MULSD XMM2,XMM3
00bec7f0  CVTSD2SS XMM2,XMM2
00bec7f4  CVTSS2SD XMM2,XMM2
00bec7f8  CVTSS2SD XMM3,XMM1
00bec7fc  MULSD XMM2,XMM3
00bec800  CVTSD2SS XMM2,XMM2
00bec804  CVTSS2SD XMM2,XMM2
00bec808  CVTSS2SD XMM3,XMM1
00bec80c  MULSD XMM2,XMM3
00bec810  CVTSD2SS XMM2,XMM2
00bec814  CVTSS2SD XMM2,XMM2
00bec818  CVTSS2SD XMM3,XMM1
00bec81c  MULSD XMM2,XMM3
00bec820  CVTSD2SS XMM2,XMM2
00bec824  CVTSS2SD XMM2,XMM2
00bec828  CVTSS2SD XMM3,XMM1
00bec82c  MULSD XMM2,XMM3
00bec830  CVTSD2SS XMM2,XMM2
00bec834  JNZ 0x00bec7b1
00bec83a  CMP EDX,ECX
00bec83c  JGE 0x00bec857
00bec83e  MOV EAX,ECX
00bec840  SUB EAX,EDX
00bec842  SUB EAX,0x1
00bec845  CVTSS2SD XMM2,XMM2
00bec849  CVTSS2SD XMM3,XMM1
00bec84d  MULSD XMM2,XMM3
00bec851  CVTSD2SS XMM2,XMM2
00bec855  JNZ 0x00bec842
00bec857  MOVSS XMM3,dword ptr [ESI]
00bec85b  CVTPS2PD XMM3,XMM3
00bec85e  CVTSS2SD XMM2,XMM2
00bec862  MULSD XMM3,XMM5
00bec866  MULSD XMM3,XMM2
00bec86a  CVTSS2SD XMM2,XMM4
00bec86e  ADDSD XMM3,XMM2
00bec872  ADD ESI,0x4
00bec875  ADD ECX,0x1
00bec878  SUB EDI,0x1
00bec87b  CVTPD2PS XMM2,XMM3
00bec87f  MOVAPS XMM4,XMM2
00bec882  JNZ 0x00bec793
00bec888  MOV ESI,dword ptr [ESP + 0x1c]
00bec88c  MOV CL,byte ptr [ESI]
00bec88e  MOVZX EDX,CL
00bec891  LEA EAX,[EDX + 0x1]
00bec894  IMUL EAX,EBP
00bec897  TEST CL,CL
00bec899  MOVSS XMM3,dword ptr [ESI + EAX*0x4 + 0x4]
00bec89f  JBE 0x00bec9c8
00bec8a5  CMP EDX,0x2
00bec8a8  MOVSS XMM2,dword ptr [ESI + EAX*0x4 + 0x8]
00bec8ae  CVTPS2PD XMM2,XMM2
00bec8b1  CVTSS2SD XMM6,XMM0
00bec8b5  CVTPS2PD XMM3,XMM3
00bec8b8  MULSD XMM2,XMM6
00bec8bc  ADDSD XMM2,XMM3
00bec8c0  CVTPD2PS XMM3,XMM2
00bec8c4  JL 0x00bec9c8
00bec8ca  MOV ECX,0x1
00bec8cf  LEA ESI,[ESI + EAX*0x4 + 0xc]
00bec8d3  LEA EDI,[EDX + -0x1]
00bec8d6  XOR EDX,EDX
00bec8d8  CMP ECX,0x8
00bec8db  MOVAPS XMM2,XMM0
00bec8de  JL 0x00bec97d
00bec8e4  LEA EAX,[ECX + -0x8]
00bec8e7  SHR EAX,0x3
00bec8ea  ADD EAX,0x1
00bec8ed  LEA EDX,[EAX*0x8 + 0x0]
00bec8f4  SUB EAX,0x1
00bec8f7  CVTSS2SD XMM2,XMM2
00bec8fb  CVTSS2SD XMM6,XMM0
00bec8ff  MULSD XMM2,XMM6
00bec903  CVTSD2SS XMM2,XMM2
00bec907  CVTSS2SD XMM2,XMM2
00bec90b  CVTSS2SD XMM6,XMM0
00bec90f  MULSD XMM2,XMM6
00bec913  CVTSD2SS XMM2,XMM2
00bec917  CVTSS2SD XMM2,XMM2
00bec91b  CVTSS2SD XMM6,XMM0
00bec91f  MULSD XMM2,XMM6
00bec923  CVTSD2SS XMM2,XMM2
00bec927  CVTSS2SD XMM2,XMM2
00bec92b  CVTSS2SD XMM6,XMM0
00bec92f  MULSD XMM2,XMM6
00bec933  CVTSD2SS XMM2,XMM2
00bec937  CVTSS2SD XMM2,XMM2
00bec93b  CVTSS2SD XMM6,XMM0
00bec93f  MULSD XMM2,XMM6
00bec943  CVTSD2SS XMM2,XMM2
00bec947  CVTSS2SD XMM2,XMM2
00bec94b  CVTSS2SD XMM6,XMM0
00bec94f  MULSD XMM2,XMM6
00bec953  CVTSD2SS XMM2,XMM2
00bec957  CVTSS2SD XMM2,XMM2
00bec95b  CVTSS2SD XMM6,XMM0
00bec95f  MULSD XMM2,XMM6
00bec963  CVTSD2SS XMM2,XMM2
00bec967  CVTSS2SD XMM2,XMM2
00bec96b  CVTSS2SD XMM6,XMM0
00bec96f  MULSD XMM2,XMM6
00bec973  CVTSD2SS XMM2,XMM2
00bec977  JNZ 0x00bec8f4
00bec97d  CMP EDX,ECX
00bec97f  JGE 0x00bec99a
00bec981  MOV EAX,ECX
00bec983  SUB EAX,EDX
00bec985  SUB EAX,0x1
00bec988  CVTSS2SD XMM2,XMM2
00bec98c  CVTSS2SD XMM6,XMM0
00bec990  MULSD XMM2,XMM6
00bec994  CVTSD2SS XMM2,XMM2
00bec998  JNZ 0x00bec985
00bec99a  MOVSS XMM6,dword ptr [ESI]
00bec99e  CVTPS2PD XMM6,XMM6
00bec9a1  MULSD XMM6,XMM5
00bec9a5  CVTSS2SD XMM2,XMM2
00bec9a9  MULSD XMM6,XMM2
00bec9ad  CVTSS2SD XMM2,XMM3
00bec9b1  ADD ESI,0x4
00bec9b4  ADD ECX,0x1
00bec9b7  SUB EDI,0x1
00bec9ba  ADDSD XMM6,XMM2
00bec9be  CVTPD2PS XMM3,XMM6
00bec9c2  JNZ 0x00bec8d6
00bec9c8  CVTSS2SD XMM3,XMM3
00bec9cc  CVTSS2SD XMM2,XMM4
00bec9d0  SUBSD XMM2,XMM3
00bec9d4  XORPS XMM3,XMM3
00bec9d7  CVTSD2SS XMM2,XMM2
00bec9db  COMISS XMM3,XMM2
00bec9de  MOVSS dword ptr [ESP + 0x18],XMM2
00bec9e4  JC 0x00bec9f4
00bec9e6  CVTSS2SD XMM3,XMM2
00bec9ea  COMISD XMM3,qword ptr [0x010cf418]
00bec9f2  JA 0x00beca51
00bec9f4  CVTSS2SD XMM3,XMM2
00bec9f8  COMISD XMM3,qword ptr [0x00f62f70]
00beca00  JBE 0x00beca14
00beca02  MOVSD XMM3,qword ptr [0x00fe1e38]
00beca0a  CVTSS2SD XMM2,XMM2
00beca0e  COMISD XMM3,XMM2
00beca12  JA 0x00beca51
00beca14  MOV ESI,dword ptr [ESP + 0x14]
00beca18  FLD float ptr [ESI + EBP*0x4]
00beca1b  MOV EAX,dword ptr [ESP + 0x28]
00beca1f  FADD float ptr [ESP + 0x18]
00beca23  MOV ECX,dword ptr [EAX]
00beca25  PUSH ECX
00beca26  PUSH ECX
00beca27  FSTP float ptr [ESP + 0x20]
00beca2b  FLD float ptr [ESP + 0x20]
00beca2f  FSTP float ptr [ESP]
00beca32  CALL 0x00be9160
00beca37  MOVSD XMM5,qword ptr [0x00f59898]
00beca3f  FSTP float ptr [ESI + EBP*0x4]
00beca42  MOVSS XMM0,dword ptr [ESP + 0x2c]
00beca48  MOVSS XMM1,dword ptr [ESP + 0x28]
00beca4e  ADD ESP,0x8
00beca51  MOVZX EDX,byte ptr [EBX + 0x1]
00beca55  ADD EBP,0x1
00beca58  CMP EBP,EDX
00beca5a  JL 0x00bec746
00beca60  POP EDI
00beca61  POP ESI
00beca62  POP EBP
00beca63  POP EBX
00beca64  RET

===== 00BEC4D0 =====
entry=00bec4d0
body=[[00bec4d0, 00bec652]]
completed=true
message=

void FUN_00bec4d0(undefined4 param_1,byte *param_2,float param_3,float *param_4)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  float *pfVar6;
  float fVar7;
  
  if (*param_2 == 0) {
    iVar1 = 0;
    if (param_2[1] != 0) {
      do {
        *param_4 = 0.0;
        iVar1 = iVar1 + 1;
        param_4 = param_4 + 1;
      } while (iVar1 < (int)(uint)param_2[1]);
      return;
    }
  }
  else {
    iVar1 = 0;
    if (param_2[1] != 0) {
      uVar2 = (uint)*param_2;
      do {
        iVar4 = (uVar2 + 1) * iVar1;
        *param_4 = *(float *)(param_2 + iVar4 * 4 + 8);
        uVar2 = (uint)*param_2;
        if (1 < uVar2) {
          pfVar6 = (float *)(param_2 + iVar4 * 4 + 0xc);
          iVar4 = 0;
          do {
            iVar5 = 0;
            fVar7 = param_3;
            if (7 < iVar4) {
              iVar3 = (iVar4 - 8U >> 3) + 1;
              iVar5 = iVar3 * 8;
              do {
                iVar3 = iVar3 + -1;
                fVar7 = fVar7 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3
                        * param_3;
              } while (iVar3 != 0);
            }
            if (iVar5 < iVar4) {
              iVar5 = iVar4 - iVar5;
              do {
                iVar5 = iVar5 + -1;
                fVar7 = fVar7 * param_3;
              } while (iVar5 != 0);
            }
            *param_4 = *pfVar6 * fVar7 + *param_4;
            uVar2 = (uint)*param_2;
            iVar5 = iVar4 + 3;
            pfVar6 = pfVar6 + 1;
            iVar4 = iVar4 + 1;
          } while (iVar5 <= (int)uVar2);
        }
        iVar1 = iVar1 + 1;
        param_4 = param_4 + 1;
      } while (iVar1 < (int)(uint)param_2[1]);
    }
  }
  return;
}


-- listing --
00bec4d0  PUSH ESI
00bec4d1  MOV ESI,dword ptr [ESP + 0xc]
00bec4d5  MOV AL,byte ptr [ESI]
00bec4d7  TEST AL,AL
00bec4d9  JNZ 0x00bec504
00bec4db  XOR EAX,EAX
00bec4dd  CMP byte ptr [ESI + 0x1],AL
00bec4e0  JBE 0x00bec651
00bec4e6  XORPS XMM0,XMM0
00bec4e9  MOV ECX,dword ptr [ESP + 0x14]
00bec4ed  LEA ECX,[ECX]
00bec4f0  MOVSS dword ptr [ECX],XMM0
00bec4f4  MOVZX EDX,byte ptr [ESI + 0x1]
00bec4f8  ADD EAX,0x1
00bec4fb  ADD ECX,0x4
00bec4fe  CMP EAX,EDX
00bec500  JL 0x00bec4f0
00bec502  POP ESI
00bec503  RET
00bec504  PUSH EBP
00bec505  XOR EBP,EBP
00bec507  CMP byte ptr [ESI + 0x1],0x0
00bec50b  JBE 0x00bec650
00bec511  MOVSS XMM0,dword ptr [ESP + 0x14]
00bec517  PUSH EBX
00bec518  PUSH EDI
00bec519  MOV EDI,dword ptr [ESP + 0x20]
00bec51d  MOVZX ECX,AL
00bec520  LEA EDX,[ECX + 0x1]
00bec523  IMUL EDX,EBP
00bec526  FLD float ptr [ESI + EDX*0x4 + 0x8]
00bec52a  FSTP float ptr [EDI]
00bec52c  MOVZX ECX,byte ptr [ESI]
00bec52f  CMP ECX,0x2
00bec532  JL 0x00bec63c
00bec538  XOR EAX,EAX
00bec53a  LEA EBX,[ESI + EDX*0x4 + 0xc]
00bec53e  MOV EDI,EDI
00bec540  XOR EDX,EDX
00bec542  CMP EAX,0x8
00bec545  MOVAPS XMM1,XMM0
00bec548  JL 0x00bec5e9
00bec54e  LEA ECX,[EAX + -0x8]
00bec551  SHR ECX,0x3
00bec554  ADD ECX,0x1
00bec557  LEA EDX,[ECX*0x8 + 0x0]
00bec55e  MOV EDI,EDI
00bec560  SUB ECX,0x1
00bec563  CVTSS2SD XMM1,XMM1
00bec567  CVTSS2SD XMM2,XMM0
00bec56b  MULSD XMM1,XMM2
00bec56f  CVTSD2SS XMM1,XMM1
00bec573  CVTSS2SD XMM1,XMM1
00bec577  CVTSS2SD XMM2,XMM0
00bec57b  MULSD XMM1,XMM2
00bec57f  CVTSD2SS XMM1,XMM1
00bec583  CVTSS2SD XMM1,XMM1
00bec587  CVTSS2SD XMM2,XMM0
00bec58b  MULSD XMM1,XMM2
00bec58f  CVTSD2SS XMM1,XMM1
00bec593  CVTSS2SD XMM1,XMM1
00bec597  CVTSS2SD XMM2,XMM0
00bec59b  MULSD XMM1,XMM2
00bec59f  CVTSD2SS XMM1,XMM1
00bec5a3  CVTSS2SD XMM1,XMM1
00bec5a7  CVTSS2SD XMM2,XMM0
00bec5ab  MULSD XMM1,XMM2
00bec5af  CVTSD2SS XMM1,XMM1
00bec5b3  CVTSS2SD XMM1,XMM1
00bec5b7  CVTSS2SD XMM2,XMM0
00bec5bb  MULSD XMM1,XMM2
00bec5bf  CVTSD2SS XMM1,XMM1
00bec5c3  CVTSS2SD XMM1,XMM1
00bec5c7  CVTSS2SD XMM2,XMM0
00bec5cb  MULSD XMM1,XMM2
00bec5cf  CVTSD2SS XMM1,XMM1
00bec5d3  CVTSS2SD XMM1,XMM1
00bec5d7  CVTSS2SD XMM2,XMM0
00bec5db  MULSD XMM1,XMM2
00bec5df  CVTSD2SS XMM1,XMM1
00bec5e3  JNZ 0x00bec560
00bec5e9  CMP EDX,EAX
00bec5eb  JGE 0x00bec606
00bec5ed  MOV ECX,EAX
00bec5ef  SUB ECX,EDX
00bec5f1  SUB ECX,0x1
00bec5f4  CVTSS2SD XMM1,XMM1
00bec5f8  CVTSS2SD XMM2,XMM0
00bec5fc  MULSD XMM1,XMM2
00bec600  CVTSD2SS XMM1,XMM1
00bec604  JNZ 0x00bec5f1
00bec606  MOVSS XMM2,dword ptr [EBX]
00bec60a  CVTSS2SD XMM1,XMM1
00bec60e  CVTPS2PD XMM2,XMM2
00bec611  MULSD XMM2,XMM1
00bec615  MOVSS XMM1,dword ptr [EDI]
00bec619  CVTPS2PD XMM1,XMM1
00bec61c  ADDSD XMM2,XMM1
00bec620  CVTPD2PS XMM1,XMM2
00bec624  MOVSS dword ptr [EDI],XMM1
00bec628  MOVZX ECX,byte ptr [ESI]
00bec62b  ADD EAX,0x1
00bec62e  LEA EDX,[EAX + 0x2]
00bec631  ADD EBX,0x4
00bec634  CMP EDX,ECX
00bec636  JLE 0x00bec540
00bec63c  MOVZX EAX,byte ptr [ESI + 0x1]
00bec640  ADD EBP,0x1
00bec643  ADD EDI,0x4
00bec646  CMP EBP,EAX
00bec648  JL 0x00bec520
00bec64e  POP EDI
00bec64f  POP EBX
00bec650  POP EBP
00bec651  POP ESI
00bec652  RET

===== 00BED860 =====
entry=00bed860
body=[[00bed860, 00bed8b6]]
completed=true
message=

void FUN_00bed860(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  
  fVar1 = *param_2;
  fVar2 = param_1[1];
  pfVar3 = (float *)(**(code **)(*(int *)((int)fVar2 + 0x20) + 4))
                              (*(undefined4 *)((int)fVar2 + 0x28),*(undefined4 *)((int)fVar2 + 0x24)
                              );
  *param_1 = fVar1 * *pfVar3 + *(float *)(*(int *)((int)fVar2 + 0x10) + 0x20);
  return;
}


-- listing --
00bed860  PUSH EBX
00bed861  MOV EBX,dword ptr [ESP + 0xc]
00bed865  MOVSS XMM0,dword ptr [EBX]
00bed869  PUSH ESI
00bed86a  PUSH EDI
00bed86b  MOV EDI,dword ptr [ESP + 0x10]
00bed86f  MOV ESI,dword ptr [EDI + 0x4]
00bed872  MOV EDX,dword ptr [ESI + 0x24]
00bed875  MOV EAX,dword ptr [ESI + 0x20]
00bed878  MOV ECX,dword ptr [ESI + 0x28]
00bed87b  MOV EAX,dword ptr [EAX + 0x4]
00bed87e  PUSH EDX
00bed87f  PUSH ECX
00bed880  MOVSS dword ptr [ESP + 0x18],XMM0
00bed886  CALL EAX
00bed888  MOVSS XMM1,dword ptr [EAX]
00bed88c  MOV ECX,dword ptr [ESI + 0x10]
00bed88f  CVTSS2SD XMM0,dword ptr [ESP + 0x18]
00bed895  CVTPS2PD XMM1,XMM1
00bed898  MULSD XMM0,XMM1
00bed89c  MOVSS XMM1,dword ptr [ECX + 0x20]
00bed8a1  ADD ESP,0x8
00bed8a4  CVTPS2PD XMM1,XMM1
00bed8a7  ADDSD XMM0,XMM1
00bed8ab  CVTSD2SS XMM0,XMM0
00bed8af  MOVSS dword ptr [EDI],XMM0
00bed8b3  POP EDI
00bed8b4  POP ESI
00bed8b5  POP EBX
00bed8b6  RET

===== 00BED8C0 =====
entry=00bed8c0
body=[[00bed8c0, 00bed91e]]
completed=true
message=

void FUN_00bed8c0(float *param_1,float *param_2,undefined4 param_3)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  
  fVar1 = *param_2;
  fVar2 = param_1[1];
  pfVar3 = (float *)(**(code **)(*(int *)((int)fVar2 + 0x20) + 0xc))
                              (*(undefined4 *)((int)fVar2 + 0x28),*(undefined4 *)((int)fVar2 + 0x24)
                               ,param_3);
  *param_1 = *pfVar3 * fVar1 + *(float *)(*(int *)((int)fVar2 + 0x10) + 0x20);
  return;
}


-- listing --
00bed8c0  FLD float ptr [ESP + 0xc]
00bed8c4  PUSH EBX
00bed8c5  MOV EBX,dword ptr [ESP + 0xc]
00bed8c9  MOVSS XMM0,dword ptr [EBX]
00bed8cd  PUSH ESI
00bed8ce  PUSH EDI
00bed8cf  MOV EDI,dword ptr [ESP + 0x10]
00bed8d3  MOV ESI,dword ptr [EDI + 0x4]
00bed8d6  MOV ECX,dword ptr [ESI + 0x28]
00bed8d9  MOV EDX,dword ptr [ESI + 0x24]
00bed8dc  MOV EAX,dword ptr [ESI + 0x20]
00bed8df  MOV EAX,dword ptr [EAX + 0xc]
00bed8e2  PUSH ECX
00bed8e3  FSTP float ptr [ESP]
00bed8e6  PUSH EDX
00bed8e7  PUSH ECX
00bed8e8  MOVSS dword ptr [ESP + 0x1c],XMM0
00bed8ee  CALL EAX
00bed8f0  MOVSS XMM0,dword ptr [EAX]
00bed8f4  CVTSS2SD XMM1,dword ptr [ESP + 0x1c]
00bed8fa  MOV ECX,dword ptr [ESI + 0x10]
00bed8fd  CVTPS2PD XMM0,XMM0
00bed900  MULSD XMM0,XMM1
00bed904  MOVSS XMM1,dword ptr [ECX + 0x20]
00bed909  ADD ESP,0xc
00bed90c  CVTPS2PD XMM1,XMM1
00bed90f  ADDSD XMM0,XMM1
00bed913  CVTPD2PS XMM0,XMM0
00bed917  MOVSS dword ptr [EDI],XMM0
00bed91b  POP EDI
00bed91c  POP ESI
00bed91d  POP EBX
00bed91e  RET

===== 00BED920 =====
entry=00bed920
body=[[00bed920, 00bed97e]]
completed=true
message=

void FUN_00bed920(float *param_1,float *param_2,undefined4 param_3,undefined4 param_4)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  
  fVar1 = *param_2;
  fVar2 = param_1[1];
  pfVar3 = (float *)(**(code **)(*(int *)((int)fVar2 + 0x20) + 8))
                              (*(undefined4 *)((int)fVar2 + 0x28),*(undefined4 *)((int)fVar2 + 0x24)
                               ,param_4);
  *param_1 = *pfVar3 * fVar1 + *(float *)(*(int *)((int)fVar2 + 0x10) + 0x20);
  return;
}


-- listing --
00bed920  FLD float ptr [ESP + 0x10]
00bed924  PUSH EBX
00bed925  MOV EBX,dword ptr [ESP + 0xc]
00bed929  MOVSS XMM0,dword ptr [EBX]
00bed92d  PUSH ESI
00bed92e  PUSH EDI
00bed92f  MOV EDI,dword ptr [ESP + 0x10]
00bed933  MOV ESI,dword ptr [EDI + 0x4]
00bed936  MOV ECX,dword ptr [ESI + 0x28]
00bed939  MOV EDX,dword ptr [ESI + 0x24]
00bed93c  MOV EAX,dword ptr [ESI + 0x20]
00bed93f  MOV EAX,dword ptr [EAX + 0x8]
00bed942  PUSH ECX
00bed943  FSTP float ptr [ESP]
00bed946  PUSH EDX
00bed947  PUSH ECX
00bed948  MOVSS dword ptr [ESP + 0x1c],XMM0
00bed94e  CALL EAX
00bed950  MOVSS XMM0,dword ptr [EAX]
00bed954  CVTSS2SD XMM1,dword ptr [ESP + 0x1c]
00bed95a  MOV ECX,dword ptr [ESI + 0x10]
00bed95d  CVTPS2PD XMM0,XMM0
00bed960  MULSD XMM0,XMM1
00bed964  MOVSS XMM1,dword ptr [ECX + 0x20]
00bed969  ADD ESP,0xc
00bed96c  CVTPS2PD XMM1,XMM1
00bed96f  ADDSD XMM0,XMM1
00bed973  CVTPD2PS XMM0,XMM0
00bed977  MOVSS dword ptr [EDI],XMM0
00bed97b  POP EDI
00bed97c  POP ESI
00bed97d  POP EBX
00bed97e  RET

===== 00BED980 =====
entry=00bed980
body=[[00bed980, 00bed9ac]]
completed=true
message=

void FUN_00bed980(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 4);
  (**(code **)(*(int *)(iVar1 + 0x20) + 0x10))
            (*(undefined4 *)(iVar1 + 0x28),*(undefined4 *)(iVar1 + 0x24),param_4,param_5);
  return;
}


-- listing --
00bed980  MOV EAX,dword ptr [ESP + 0x4]
00bed984  FLD float ptr [ESP + 0x14]
00bed988  MOV EAX,dword ptr [EAX + 0x4]
00bed98b  MOV EDX,dword ptr [EAX + 0x24]
00bed98e  MOV ECX,dword ptr [EAX + 0x20]
00bed991  MOV EAX,dword ptr [EAX + 0x28]
00bed994  MOV ECX,dword ptr [ECX + 0x10]
00bed997  SUB ESP,0x8
00bed99a  FSTP float ptr [ESP + 0x4]
00bed99e  FLD float ptr [ESP + 0x18]
00bed9a2  FSTP float ptr [ESP]
00bed9a5  PUSH EDX
00bed9a6  PUSH EAX
00bed9a7  CALL ECX
00bed9a9  ADD ESP,0x10
00bed9ac  RET

===== 00BED9B0 =====
entry=00bed9b0
body=[[00bed9b0, 00bed9f9]]
completed=true
message=

void FUN_00bed9b0(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  float10 fVar4;
  
  iVar1 = *(int *)(param_1 + 4);
  iVar2 = func_0x00bf6be0();
  iVar1 = *(int *)(iVar1 + 0x10);
  uVar3 = func_0x00bf6bf0();
  fVar4 = (float10)func_0x00bf6c10();
  (**(code **)(iVar2 + 0x2c))(iVar1 + 0x20,uVar3,(float)fVar4,param_4);
  return;
}


-- listing --
00bed9b0  MOV EAX,dword ptr [ESP + 0x4]
00bed9b4  PUSH EBX
00bed9b5  PUSH EBP
00bed9b6  PUSH ESI
00bed9b7  MOV ESI,dword ptr [EAX + 0x4]
00bed9ba  PUSH EDI
00bed9bb  MOV ECX,ESI
00bed9bd  CALL 0x00bf6be0
00bed9c2  MOV EBX,dword ptr [ESI + 0x10]
00bed9c5  MOV ECX,ESI
00bed9c7  MOV EDI,EAX
00bed9c9  CALL 0x00bf6bf0
00bed9ce  MOV ECX,ESI
00bed9d0  MOV EBP,EAX
00bed9d2  CALL 0x00bf6c10
00bed9d7  FSTP float ptr [ESP + 0x14]
00bed9db  MOV ECX,dword ptr [ESP + 0x20]
00bed9df  FLD float ptr [ESP + 0x14]
00bed9e3  MOV EDX,dword ptr [EDI + 0x2c]
00bed9e6  PUSH ECX
00bed9e7  PUSH ECX
00bed9e8  FSTP float ptr [ESP]
00bed9eb  PUSH EBP
00bed9ec  ADD EBX,0x20
00bed9ef  PUSH EBX
00bed9f0  CALL EDX
00bed9f2  ADD ESP,0x10
00bed9f5  POP EDI
00bed9f6  POP ESI
00bed9f7  POP EBP
00bed9f8  POP EBX
00bed9f9  RET

===== 00BEEC60 =====
entry=00beec60
body=[[00beec60, 00beecb6]]
completed=true
message=

void FUN_00beec60(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  
  fVar1 = *param_2;
  fVar2 = param_1[1];
  pfVar3 = (float *)(**(code **)(*(int *)((int)fVar2 + 0x20) + 4))
                              (*(undefined4 *)((int)fVar2 + 0x28),*(undefined4 *)((int)fVar2 + 0x24)
                              );
  *param_1 = fVar1 * *pfVar3 + *(float *)(*(int *)((int)fVar2 + 0x10) + 0x20);
  return;
}


-- listing --
00beec60  PUSH EBX
00beec61  MOV EBX,dword ptr [ESP + 0xc]
00beec65  MOVSS XMM0,dword ptr [EBX]
00beec69  PUSH ESI
00beec6a  PUSH EDI
00beec6b  MOV EDI,dword ptr [ESP + 0x10]
00beec6f  MOV ESI,dword ptr [EDI + 0x4]
00beec72  MOV EDX,dword ptr [ESI + 0x24]
00beec75  MOV EAX,dword ptr [ESI + 0x20]
00beec78  MOV ECX,dword ptr [ESI + 0x28]
00beec7b  MOV EAX,dword ptr [EAX + 0x4]
00beec7e  PUSH EDX
00beec7f  PUSH ECX
00beec80  MOVSS dword ptr [ESP + 0x18],XMM0
00beec86  CALL EAX
00beec88  MOVSS XMM1,dword ptr [EAX]
00beec8c  MOV ECX,dword ptr [ESI + 0x10]
00beec8f  CVTSS2SD XMM0,dword ptr [ESP + 0x18]
00beec95  CVTPS2PD XMM1,XMM1
00beec98  MULSD XMM0,XMM1
00beec9c  MOVSS XMM1,dword ptr [ECX + 0x20]
00beeca1  ADD ESP,0x8
00beeca4  CVTPS2PD XMM1,XMM1
00beeca7  ADDSD XMM0,XMM1
00beecab  CVTSD2SS XMM0,XMM0
00beecaf  MOVSS dword ptr [EDI],XMM0
00beecb3  POP EDI
00beecb4  POP ESI
00beecb5  POP EBX
00beecb6  RET

===== 00BEECC0 =====
entry=00beecc0
body=[[00beecc0, 00beed40]]
completed=true
message=

void FUN_00beecc0(float *param_1,float *param_2,float param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float *pfVar4;
  
  fVar1 = param_2[1];
  fVar3 = param_1[1];
  fVar2 = *param_2;
  pfVar4 = (float *)(**(code **)(*(int *)((int)fVar3 + 0x20) + 0xc))
                              (*(undefined4 *)((int)fVar3 + 0x28),*(undefined4 *)((int)fVar3 + 0x24)
                               ,param_3);
  *param_1 = (fVar1 * param_3 + fVar2) * *pfVar4 + *(float *)(*(int *)((int)fVar3 + 0x10) + 0x20);
  return;
}


-- listing --
00beecc0  FLD float ptr [ESP + 0xc]
00beecc4  PUSH EBX
00beecc5  MOV EBX,dword ptr [ESP + 0xc]
00beecc9  MOVSS XMM0,dword ptr [EBX + 0x4]
00beecce  PUSH ESI
00beeccf  PUSH EDI
00beecd0  MOV EDI,dword ptr [ESP + 0x10]
00beecd4  MOV ESI,dword ptr [EDI + 0x4]
00beecd7  MOV ECX,dword ptr [ESI + 0x28]
00beecda  MOV EDX,dword ptr [ESI + 0x24]
00beecdd  MOV EAX,dword ptr [ESI + 0x20]
00beece0  MOV EAX,dword ptr [EAX + 0xc]
00beece3  PUSH ECX
00beece4  FSTP float ptr [ESP]
00beece7  PUSH EDX
00beece8  MOVSS dword ptr [ESP + 0x18],XMM0
00beecee  MOVSS XMM0,dword ptr [EBX]
00beecf2  PUSH ECX
00beecf3  MOVSS dword ptr [ESP + 0x20],XMM0
00beecf9  CALL EAX
00beecfb  MOVSS XMM1,dword ptr [ESP + 0x24]
00beed01  CVTSS2SD XMM0,dword ptr [ESP + 0x1c]
00beed07  MOV ECX,dword ptr [ESI + 0x10]
00beed0a  CVTPS2PD XMM1,XMM1
00beed0d  MULSD XMM0,XMM1
00beed11  CVTSS2SD XMM1,dword ptr [ESP + 0x20]
00beed17  ADDSD XMM0,XMM1
00beed1b  MOVSS XMM1,dword ptr [EAX]
00beed1f  CVTPS2PD XMM1,XMM1
00beed22  MULSD XMM0,XMM1
00beed26  MOVSS XMM1,dword ptr [ECX + 0x20]
00beed2b  ADD ESP,0xc
00beed2e  CVTPS2PD XMM1,XMM1
00beed31  ADDSD XMM0,XMM1
00beed35  CVTSD2SS XMM0,XMM0
00beed39  MOVSS dword ptr [EDI],XMM0
00beed3d  POP EDI
00beed3e  POP ESI
00beed3f  POP EBX
00beed40  RET

===== 00BEED50 =====
entry=00beed50
body=[[00beed50, 00beedae]]
completed=true
message=

void FUN_00beed50(float *param_1,float *param_2,undefined4 param_3,undefined4 param_4)

{
  float fVar1;
  float fVar2;
  float *pfVar3;
  
  fVar1 = *param_2;
  fVar2 = param_1[1];
  pfVar3 = (float *)(**(code **)(*(int *)((int)fVar2 + 0x20) + 8))
                              (*(undefined4 *)((int)fVar2 + 0x28),*(undefined4 *)((int)fVar2 + 0x24)
                               ,param_4);
  *param_1 = *pfVar3 * fVar1 + *(float *)(*(int *)((int)fVar2 + 0x10) + 0x20);
  return;
}


-- listing --
00beed50  FLD float ptr [ESP + 0x10]
00beed54  PUSH EBX
00beed55  MOV EBX,dword ptr [ESP + 0xc]
00beed59  MOVSS XMM0,dword ptr [EBX]
00beed5d  PUSH ESI
00beed5e  PUSH EDI
00beed5f  MOV EDI,dword ptr [ESP + 0x10]
00beed63  MOV ESI,dword ptr [EDI + 0x4]
00beed66  MOV ECX,dword ptr [ESI + 0x28]
00beed69  MOV EDX,dword ptr [ESI + 0x24]
00beed6c  MOV EAX,dword ptr [ESI + 0x20]
00beed6f  MOV EAX,dword ptr [EAX + 0x8]
00beed72  PUSH ECX
00beed73  FSTP float ptr [ESP]
00beed76  PUSH EDX
00beed77  PUSH ECX
00beed78  MOVSS dword ptr [ESP + 0x1c],XMM0
00beed7e  CALL EAX
00beed80  MOVSS XMM0,dword ptr [EAX]
00beed84  CVTSS2SD XMM1,dword ptr [ESP + 0x1c]
00beed8a  MOV ECX,dword ptr [ESI + 0x10]
00beed8d  CVTPS2PD XMM0,XMM0
00beed90  MULSD XMM0,XMM1
00beed94  MOVSS XMM1,dword ptr [ECX + 0x20]
00beed99  ADD ESP,0xc
00beed9c  CVTPS2PD XMM1,XMM1
00beed9f  ADDSD XMM0,XMM1
00beeda3  CVTPD2PS XMM0,XMM0
00beeda7  MOVSS dword ptr [EDI],XMM0
00beedab  POP EDI
00beedac  POP ESI
00beedad  POP EBX
00beedae  RET

===== 00BEEDB0 =====
entry=00beedb0
body=[[00beedb0, 00beeddc]]
completed=true
message=

void FUN_00beedb0(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 4);
  (**(code **)(*(int *)(iVar1 + 0x20) + 0x10))
            (*(undefined4 *)(iVar1 + 0x28),*(undefined4 *)(iVar1 + 0x24),param_4,param_5);
  return;
}


-- listing --
00beedb0  MOV EAX,dword ptr [ESP + 0x4]
00beedb4  FLD float ptr [ESP + 0x14]
00beedb8  MOV EAX,dword ptr [EAX + 0x4]
00beedbb  MOV EDX,dword ptr [EAX + 0x24]
00beedbe  MOV ECX,dword ptr [EAX + 0x20]
00beedc1  MOV EAX,dword ptr [EAX + 0x28]
00beedc4  MOV ECX,dword ptr [ECX + 0x10]
00beedc7  SUB ESP,0x8
00beedca  FSTP float ptr [ESP + 0x4]
00beedce  FLD float ptr [ESP + 0x18]
00beedd2  FSTP float ptr [ESP]
00beedd5  PUSH EDX
00beedd6  PUSH EAX
00beedd7  CALL ECX
00beedd9  ADD ESP,0x10
00beeddc  RET

===== 00BEEDE0 =====
entry=00beede0
body=[[00beede0, 00beee7b]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00beede0(int param_1,int param_2,undefined4 param_3,float *param_4)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  float *pfVar5;
  float10 fVar6;
  
  iVar1 = *(int *)(param_1 + 4);
  iVar3 = func_0x00bf6be0();
  iVar2 = *(int *)(iVar1 + 0x10);
  uVar4 = func_0x00bf6bf0();
  fVar6 = (float10)func_0x00bf6c10();
  (**(code **)(iVar3 + 0x2c))(iVar2 + 0x20,uVar4,(float)fVar6,param_4);
  pfVar5 = (float *)(**(code **)(*(int *)(iVar1 + 0x20) + 0x14))
                              (*(undefined4 *)(iVar1 + 0x28),*(undefined4 *)(iVar1 + 0x24));
  *param_4 = (float)(((double)(*(float *)(param_2 + 4) * *pfVar5) + (double)*param_4) *
                    _DAT_00f59898);
  return;
}


-- listing --
00beede0  PUSH ECX
00beede1  MOV EAX,dword ptr [ESP + 0x8]
00beede5  PUSH EBX
00beede6  PUSH EBP
00beede7  PUSH ESI
00beede8  MOV ESI,dword ptr [EAX + 0x4]
00beedeb  PUSH EDI
00beedec  MOV ECX,ESI
00beedee  CALL 0x00bf6be0
00beedf3  MOV EBP,dword ptr [ESI + 0x10]
00beedf6  MOV ECX,ESI
00beedf8  MOV EBX,EAX
00beedfa  CALL 0x00bf6bf0
00beedff  MOV ECX,ESI
00beee01  MOV dword ptr [ESP + 0x10],EAX
00beee05  CALL 0x00bf6c10
00beee0a  FSTP float ptr [ESP + 0x18]
00beee0e  MOV EDI,dword ptr [ESP + 0x24]
00beee12  FLD float ptr [ESP + 0x18]
00beee16  MOV EDX,dword ptr [EBX + 0x2c]
00beee19  PUSH EDI
00beee1a  PUSH ECX
00beee1b  MOV ECX,dword ptr [ESP + 0x18]
00beee1f  FSTP float ptr [ESP]
00beee22  PUSH ECX
00beee23  ADD EBP,0x20
00beee26  PUSH EBP
00beee27  CALL EDX
00beee29  MOV EAX,dword ptr [ESI + 0x20]
00beee2c  MOV ECX,dword ptr [ESI + 0x28]
00beee2f  MOV ESI,dword ptr [ESI + 0x24]
00beee32  MOV EAX,dword ptr [EAX + 0x14]
00beee35  PUSH ESI
00beee36  PUSH ECX
00beee37  CALL EAX
00beee39  MOV ECX,dword ptr [ESP + 0x34]
00beee3d  MOVSS XMM0,dword ptr [ECX + 0x4]
00beee42  MOVSS XMM1,dword ptr [EAX]
00beee46  CVTPS2PD XMM0,XMM0
00beee49  CVTPS2PD XMM1,XMM1
00beee4c  MULSD XMM0,XMM1
00beee50  MOVSS XMM1,dword ptr [EDI]
00beee54  CVTPD2PS XMM0,XMM0
00beee58  CVTSS2SD XMM0,XMM0
00beee5c  ADD ESP,0x18
00beee5f  CVTPS2PD XMM1,XMM1
00beee62  ADDSD XMM0,XMM1
00beee66  MULSD XMM0,qword ptr [0x00f59898]
00beee6e  CVTPD2PS XMM0,XMM0
00beee72  MOVSS dword ptr [EDI],XMM0
00beee76  POP EDI
00beee77  POP ESI
00beee78  POP EBP
00beee79  POP EBX
00beee7a  POP ECX
00beee7b  RET

===== 00BF3A20 =====
entry=00bf3a20
body=[[00bf3a20, 00bf3a62]]
completed=true
message=

void FUN_00bf3a20(int param_1,int param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = *(int *)(param_1 + (uint)*(byte *)(param_2 + 1) * 4);
  uVar2 = *(undefined4 *)(iVar1 + 0x28);
  (**(code **)(*(int *)(iVar1 + 0x20) + 4))(uVar2,*(undefined4 *)(iVar1 + 0x24));
  func_0x00bf3410(param_1,uVar2,0,*(int *)(iVar1 + 0x10) + 0x20);
  return;
}


-- listing --
00bf3a20  PUSH EBX
00bf3a21  PUSH EBP
00bf3a22  MOV EBP,dword ptr [ESP + 0xc]
00bf3a26  PUSH ESI
00bf3a27  MOV ESI,dword ptr [ESP + 0x14]
00bf3a2b  MOVZX EAX,byte ptr [ESI + 0x1]
00bf3a2f  PUSH EDI
00bf3a30  MOV EDI,dword ptr [EBP + EAX*0x4]
00bf3a34  MOV ECX,dword ptr [EDI + 0x24]
00bf3a37  MOV EAX,dword ptr [EDI + 0x20]
00bf3a3a  MOV EBX,dword ptr [EDI + 0x28]
00bf3a3d  PUSH ECX
00bf3a3e  MOV ECX,dword ptr [EAX + 0x4]
00bf3a41  PUSH EBX
00bf3a42  CALL ECX
00bf3a44  MOV EDX,dword ptr [EDI + 0x10]
00bf3a47  FLDZ
00bf3a49  ADD ESP,0x8
00bf3a4c  ADD EDX,0x20
00bf3a4f  PUSH EDX
00bf3a50  PUSH ECX
00bf3a51  FSTP float ptr [ESP]
00bf3a54  PUSH EBX
00bf3a55  PUSH EBP
00bf3a56  CALL 0x00bf3410
00bf3a5b  ADD ESP,0x10
00bf3a5e  POP EDI
00bf3a5f  POP ESI
00bf3a60  POP EBP
00bf3a61  POP EBX
00bf3a62  RET

===== 00BF3A70 =====
entry=00bf3a70
body=[[00bf3a70, 00bf3abc]]
completed=true
message=

void FUN_00bf3a70(int param_1,int param_2,undefined4 param_3)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = *(int *)(param_1 + (uint)*(byte *)(param_2 + 1) * 4);
  uVar2 = *(undefined4 *)(iVar1 + 0x28);
  (**(code **)(*(int *)(iVar1 + 0x20) + 0xc))(uVar2,*(undefined4 *)(iVar1 + 0x24),param_3);
  func_0x00bf3410(param_1,uVar2,param_3,*(int *)(iVar1 + 0x10) + 0x20);
  return;
}


-- listing --
00bf3a70  FLD float ptr [ESP + 0xc]
00bf3a74  PUSH EBX
00bf3a75  PUSH EBP
00bf3a76  MOV EBP,dword ptr [ESP + 0xc]
00bf3a7a  PUSH ESI
00bf3a7b  MOV ESI,dword ptr [ESP + 0x14]
00bf3a7f  MOVZX EAX,byte ptr [ESI + 0x1]
00bf3a83  PUSH EDI
00bf3a84  MOV EDI,dword ptr [EBP + EAX*0x4]
00bf3a88  MOV ECX,dword ptr [EDI + 0x24]
00bf3a8b  MOV EAX,dword ptr [EDI + 0x20]
00bf3a8e  MOV EBX,dword ptr [EDI + 0x28]
00bf3a91  PUSH ECX
00bf3a92  FSTP float ptr [ESP]
00bf3a95  PUSH ECX
00bf3a96  MOV ECX,dword ptr [EAX + 0xc]
00bf3a99  PUSH EBX
00bf3a9a  CALL ECX
00bf3a9c  FLD float ptr [ESP + 0x28]
00bf3aa0  MOV EDX,dword ptr [EDI + 0x10]
00bf3aa3  ADD ESP,0xc
00bf3aa6  ADD EDX,0x20
00bf3aa9  PUSH EDX
00bf3aaa  PUSH ECX
00bf3aab  FSTP float ptr [ESP]
00bf3aae  PUSH EBX
00bf3aaf  PUSH EBP
00bf3ab0  CALL 0x00bf3410
00bf3ab5  ADD ESP,0x10
00bf3ab8  POP EDI
00bf3ab9  POP ESI
00bf3aba  POP EBP
00bf3abb  POP EBX
00bf3abc  RET

===== 00BF3AC0 =====
entry=00bf3ac0
body=[[00bf3ac0, 00bf3b0a]]
completed=true
message=

void FUN_00bf3ac0(int param_1,int param_2,undefined4 param_3,undefined4 param_4)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = *(int *)(param_1 + (uint)*(byte *)(param_2 + 1) * 4);
  uVar2 = *(undefined4 *)(iVar1 + 0x28);
  (**(code **)(*(int *)(iVar1 + 0x20) + 8))(uVar2,*(undefined4 *)(iVar1 + 0x24),param_4);
  func_0x00bf3410(param_1,uVar2,0,*(int *)(iVar1 + 0x10) + 0x20);
  return;
}


-- listing --
00bf3ac0  FLD float ptr [ESP + 0x10]
00bf3ac4  PUSH EBX
00bf3ac5  PUSH EBP
00bf3ac6  MOV EBP,dword ptr [ESP + 0xc]
00bf3aca  PUSH ESI
00bf3acb  MOV ESI,dword ptr [ESP + 0x14]
00bf3acf  MOVZX EAX,byte ptr [ESI + 0x1]
00bf3ad3  PUSH EDI
00bf3ad4  MOV EDI,dword ptr [EBP + EAX*0x4]
00bf3ad8  MOV ECX,dword ptr [EDI + 0x24]
00bf3adb  MOV EAX,dword ptr [EDI + 0x20]
00bf3ade  MOV EBX,dword ptr [EDI + 0x28]
00bf3ae1  PUSH ECX
00bf3ae2  FSTP float ptr [ESP]
00bf3ae5  PUSH ECX
00bf3ae6  MOV ECX,dword ptr [EAX + 0x8]
00bf3ae9  PUSH EBX
00bf3aea  CALL ECX
00bf3aec  FLDZ
00bf3aee  MOV EDX,dword ptr [EDI + 0x10]
00bf3af1  ADD ESP,0xc
00bf3af4  ADD EDX,0x20
00bf3af7  PUSH EDX
00bf3af8  PUSH ECX
00bf3af9  FSTP float ptr [ESP]
00bf3afc  PUSH EBX
00bf3afd  PUSH EBP
00bf3afe  CALL 0x00bf3410
00bf3b03  ADD ESP,0x10
00bf3b06  POP EDI
00bf3b07  POP ESI
00bf3b08  POP EBP
00bf3b09  POP EBX
00bf3b0a  RET

===== 00BF2EC0 =====
entry=00bf2ec0
body=[[00bf2ec0, 00bf324c]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bf2ec0(int param_1,byte *param_2,byte *param_3,float param_4,float param_5)

{
  float fVar1;
  double dVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  float *pfVar10;
  float *pfVar11;
  float fVar12;
  float fVar13;
  float fVar14;
  
  iVar4 = *(int *)(param_1 + (uint)param_2[1] * 4);
  iVar3 = (**(code **)(*(int *)(iVar4 + 0x20) + 0x10))
                    (*(undefined4 *)(iVar4 + 0x28),*(undefined4 *)(iVar4 + 0x24),param_4,param_5);
  dVar2 = _DAT_00f59898;
  iVar9 = 0;
  pfVar11 = (float *)(*(int *)(iVar4 + 0x10) + 0x24 + (uint)param_2[1] * 4);
  if (param_2[1] != 0) {
    iVar3 = iVar3 - (int)pfVar11;
    do {
      uVar7 = (uint)*param_2;
      iVar4 = (uVar7 + 1) * iVar9;
      fVar12 = *(float *)(param_2 + iVar4 * 4 + 4);
      if ((*param_2 != 0) &&
         (fVar12 = *(float *)(param_2 + iVar4 * 4 + 8) * param_4 + fVar12, 1 < uVar7)) {
        pfVar10 = (float *)(param_2 + iVar4 * 4 + 0xc);
        iVar4 = uVar7 - 1;
        iVar6 = 1;
        do {
          iVar8 = 0;
          fVar14 = param_4;
          if (7 < iVar6) {
            iVar5 = (iVar6 - 8U >> 3) + 1;
            iVar8 = iVar5 * 8;
            do {
              iVar5 = iVar5 + -1;
              fVar14 = fVar14 * param_4 * param_4 * param_4 * param_4 * param_4 * param_4 * param_4
                       * param_4;
            } while (iVar5 != 0);
          }
          if (iVar8 < iVar6) {
            iVar8 = iVar6 - iVar8;
            do {
              iVar8 = iVar8 + -1;
              fVar14 = fVar14 * param_4;
            } while (iVar8 != 0);
          }
          fVar13 = *pfVar10;
          pfVar10 = pfVar10 + 1;
          iVar6 = iVar6 + 1;
          iVar4 = iVar4 + -1;
          fVar12 = (float)((double)fVar13 * dVar2 * (double)fVar14 + (double)fVar12);
        } while (iVar4 != 0);
      }
      uVar7 = (uint)*param_3;
      iVar4 = (uVar7 + 1) * iVar9;
      fVar14 = *(float *)(param_3 + iVar4 * 4 + 4);
      if ((*param_3 != 0) &&
         (fVar14 = *(float *)(param_3 + iVar4 * 4 + 8) * param_5 + fVar14, 1 < uVar7)) {
        iVar6 = 1;
        pfVar10 = (float *)(param_3 + iVar4 * 4 + 0xc);
        iVar4 = uVar7 - 1;
        do {
          iVar8 = 0;
          fVar13 = param_5;
          if (7 < iVar6) {
            iVar5 = (iVar6 - 8U >> 3) + 1;
            iVar8 = iVar5 * 8;
            do {
              iVar5 = iVar5 + -1;
              fVar13 = fVar13 * param_5 * param_5 * param_5 * param_5 * param_5 * param_5 * param_5
                       * param_5;
            } while (iVar5 != 0);
          }
          if (iVar8 < iVar6) {
            iVar8 = iVar6 - iVar8;
            do {
              iVar8 = iVar8 + -1;
              fVar13 = fVar13 * param_5;
            } while (iVar8 != 0);
          }
          fVar1 = *pfVar10;
          pfVar10 = pfVar10 + 1;
          iVar6 = iVar6 + 1;
          iVar4 = iVar4 + -1;
          fVar14 = (float)((double)fVar1 * dVar2 * (double)fVar13 + (double)fVar14);
        } while (iVar4 != 0);
      }
      fVar12 = (fVar12 - fVar14) * *(float *)(iVar3 + (int)pfVar11);
      if (((0.0 < fVar12) || ((double)fVar12 <= _DAT_010cf418)) &&
         (((double)fVar12 <= _DAT_00f62f70 || (_DAT_00fe1e38 <= (double)fVar12)))) {
        *pfVar11 = *pfVar11 + fVar12;
      }
      iVar9 = iVar9 + 1;
      pfVar11 = pfVar11 + 1;
    } while (iVar9 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bf2ec0  MOV ECX,dword ptr [ESP + 0x4]
00bf2ec4  FLD float ptr [ESP + 0x14]
00bf2ec8  PUSH EBX
00bf2ec9  MOV EBX,dword ptr [ESP + 0xc]
00bf2ecd  MOVZX EAX,byte ptr [EBX + 0x1]
00bf2ed1  PUSH EBP
00bf2ed2  PUSH ESI
00bf2ed3  MOV ESI,dword ptr [ECX + EAX*0x4]
00bf2ed6  MOV EDX,dword ptr [ESI + 0x24]
00bf2ed9  MOV EAX,dword ptr [ESI + 0x20]
00bf2edc  MOV ECX,dword ptr [ESI + 0x28]
00bf2edf  SUB ESP,0x8
00bf2ee2  FSTP float ptr [ESP + 0x4]
00bf2ee6  FLD float ptr [ESP + 0x24]
00bf2eea  FSTP float ptr [ESP]
00bf2eed  PUSH EDX
00bf2eee  MOV EDX,dword ptr [EAX + 0x10]
00bf2ef1  PUSH ECX
00bf2ef2  CALL EDX
00bf2ef4  MOVZX ECX,byte ptr [EBX + 0x1]
00bf2ef8  MOV EDX,dword ptr [ESI + 0x10]
00bf2efb  ADD ESP,0x10
00bf2efe  XOR EBP,EBP
00bf2f00  TEST ECX,ECX
00bf2f02  LEA EDX,[EDX + ECX*0x4 + 0x24]
00bf2f06  JLE 0x00bf3249
00bf2f0c  MOVSS XMM0,dword ptr [ESP + 0x20]
00bf2f12  MOVSS XMM1,dword ptr [ESP + 0x1c]
00bf2f18  MOVSD XMM5,qword ptr [0x00f59898]
00bf2f20  XORPS XMM6,XMM6
00bf2f23  PUSH EDI
00bf2f24  MOV EDI,EDX
00bf2f26  SUB EAX,EDX
00bf2f28  MOV dword ptr [ESP + 0x18],EDI
00bf2f2c  MOV dword ptr [ESP + 0x14],EAX
00bf2f30  MOV CL,byte ptr [EBX]
00bf2f32  MOVZX EDX,CL
00bf2f35  LEA EAX,[EDX + 0x1]
00bf2f38  IMUL EAX,EBP
00bf2f3b  TEST CL,CL
00bf2f3d  MOVSS XMM4,dword ptr [EBX + EAX*0x4 + 0x4]
00bf2f43  JBE 0x00bf307b
00bf2f49  CMP EDX,0x2
00bf2f4c  MOVSS XMM2,dword ptr [EBX + EAX*0x4 + 0x8]
00bf2f52  CVTPS2PD XMM2,XMM2
00bf2f55  CVTSS2SD XMM3,XMM1
00bf2f59  MULSD XMM2,XMM3
00bf2f5d  CVTPS2PD XMM3,XMM4
00bf2f60  ADDSD XMM2,XMM3
00bf2f64  CVTPD2PS XMM2,XMM2
00bf2f68  MOVAPS XMM4,XMM2
00bf2f6b  JL 0x00bf307b
00bf2f71  MOV ECX,0x1
00bf2f76  LEA ESI,[EBX + EAX*0x4 + 0xc]
00bf2f7a  LEA EDI,[EDX + -0x1]
00bf2f7d  LEA ECX,[ECX]
00bf2f80  XOR EDX,EDX
00bf2f82  CMP ECX,0x8
00bf2f85  MOVAPS XMM2,XMM1
00bf2f88  JL 0x00bf3029
00bf2f8e  LEA EAX,[ECX + -0x8]
00bf2f91  SHR EAX,0x3
00bf2f94  ADD EAX,0x1
00bf2f97  LEA EDX,[EAX*0x8 + 0x0]
00bf2f9e  MOV EDI,EDI
00bf2fa0  SUB EAX,0x1
00bf2fa3  CVTSS2SD XMM2,XMM2
00bf2fa7  CVTSS2SD XMM3,XMM1
00bf2fab  MULSD XMM2,XMM3
00bf2faf  CVTSD2SS XMM2,XMM2
00bf2fb3  CVTSS2SD XMM2,XMM2
00bf2fb7  CVTSS2SD XMM3,XMM1
00bf2fbb  MULSD XMM2,XMM3
00bf2fbf  CVTSD2SS XMM2,XMM2
00bf2fc3  CVTSS2SD XMM2,XMM2
00bf2fc7  CVTSS2SD XMM3,XMM1
00bf2fcb  MULSD XMM2,XMM3
00bf2fcf  CVTSD2SS XMM2,XMM2
00bf2fd3  CVTSS2SD XMM2,XMM2
00bf2fd7  CVTSS2SD XMM3,XMM1
00bf2fdb  MULSD XMM2,XMM3
00bf2fdf  CVTSD2SS XMM2,XMM2
00bf2fe3  CVTSS2SD XMM2,XMM2
00bf2fe7  CVTSS2SD XMM3,XMM1
00bf2feb  MULSD XMM2,XMM3
00bf2fef  CVTSD2SS XMM2,XMM2
00bf2ff3  CVTSS2SD XMM2,XMM2
00bf2ff7  CVTSS2SD XMM3,XMM1
00bf2ffb  MULSD XMM2,XMM3
00bf2fff  CVTSD2SS XMM2,XMM2
00bf3003  CVTSS2SD XMM2,XMM2
00bf3007  CVTSS2SD XMM3,XMM1
00bf300b  MULSD XMM2,XMM3
00bf300f  CVTSD2SS XMM2,XMM2
00bf3013  CVTSS2SD XMM2,XMM2
00bf3017  CVTSS2SD XMM3,XMM1
00bf301b  MULSD XMM2,XMM3
00bf301f  CVTSD2SS XMM2,XMM2
00bf3023  JNZ 0x00bf2fa0
00bf3029  CMP EDX,ECX
00bf302b  JGE 0x00bf3046
00bf302d  MOV EAX,ECX
00bf302f  SUB EAX,EDX
00bf3031  SUB EAX,0x1
00bf3034  CVTSS2SD XMM2,XMM2
00bf3038  CVTSS2SD XMM3,XMM1
00bf303c  MULSD XMM2,XMM3
00bf3040  CVTSD2SS XMM2,XMM2
00bf3044  JNZ 0x00bf3031
00bf3046  MOVSS XMM3,dword ptr [ESI]
00bf304a  CVTPS2PD XMM3,XMM3
00bf304d  CVTSS2SD XMM2,XMM2
00bf3051  MULSD XMM3,XMM5
00bf3055  MULSD XMM3,XMM2
00bf3059  CVTSS2SD XMM2,XMM4
00bf305d  ADDSD XMM3,XMM2
00bf3061  ADD ESI,0x4
00bf3064  ADD ECX,0x1
00bf3067  SUB EDI,0x1
00bf306a  CVTPD2PS XMM2,XMM3
00bf306e  MOVAPS XMM4,XMM2
00bf3071  JNZ 0x00bf2f80
00bf3077  MOV EDI,dword ptr [ESP + 0x18]
00bf307b  MOV ESI,dword ptr [ESP + 0x1c]
00bf307f  MOV CL,byte ptr [ESI]
00bf3081  MOVZX EDX,CL
00bf3084  LEA EAX,[EDX + 0x1]
00bf3087  IMUL EAX,EBP
00bf308a  TEST CL,CL
00bf308c  MOVSS XMM3,dword ptr [ESI + EAX*0x4 + 0x4]
00bf3092  JBE 0x00bf31c8
00bf3098  CMP EDX,0x2
00bf309b  MOVSS XMM2,dword ptr [ESI + EAX*0x4 + 0x8]
00bf30a1  CVTPS2PD XMM2,XMM2
00bf30a4  CVTSS2SD XMM7,XMM0
00bf30a8  CVTPS2PD XMM3,XMM3
00bf30ab  MULSD XMM2,XMM7
00bf30af  ADDSD XMM2,XMM3
00bf30b3  CVTPD2PS XMM3,XMM2
00bf30b7  JL 0x00bf31c8
00bf30bd  MOV ECX,0x1
00bf30c2  LEA ESI,[ESI + EAX*0x4 + 0xc]
00bf30c6  LEA EDI,[EDX + -0x1]
00bf30c9  LEA ESP,[ESP]
00bf30d0  XOR EDX,EDX
00bf30d2  CMP ECX,0x8
00bf30d5  MOVAPS XMM2,XMM0
00bf30d8  JL 0x00bf3179
00bf30de  LEA EAX,[ECX + -0x8]
00bf30e1  SHR EAX,0x3
00bf30e4  ADD EAX,0x1
00bf30e7  LEA EDX,[EAX*0x8 + 0x0]
00bf30ee  MOV EDI,EDI
00bf30f0  SUB EAX,0x1
00bf30f3  CVTSS2SD XMM2,XMM2
00bf30f7  CVTSS2SD XMM7,XMM0
00bf30fb  MULSD XMM2,XMM7
00bf30ff  CVTSD2SS XMM2,XMM2
00bf3103  CVTSS2SD XMM2,XMM2
00bf3107  CVTSS2SD XMM7,XMM0
00bf310b  MULSD XMM2,XMM7
00bf310f  CVTSD2SS XMM2,XMM2
00bf3113  CVTSS2SD XMM2,XMM2
00bf3117  CVTSS2SD XMM7,XMM0
00bf311b  MULSD XMM2,XMM7
00bf311f  CVTSD2SS XMM2,XMM2
00bf3123  CVTSS2SD XMM2,XMM2
00bf3127  CVTSS2SD XMM7,XMM0
00bf312b  MULSD XMM2,XMM7
00bf312f  CVTSD2SS XMM2,XMM2
00bf3133  CVTSS2SD XMM2,XMM2
00bf3137  CVTSS2SD XMM7,XMM0
00bf313b  MULSD XMM2,XMM7
00bf313f  CVTSD2SS XMM2,XMM2
00bf3143  CVTSS2SD XMM2,XMM2
00bf3147  CVTSS2SD XMM7,XMM0
00bf314b  MULSD XMM2,XMM7
00bf314f  CVTSD2SS XMM2,XMM2
00bf3153  CVTSS2SD XMM2,XMM2
00bf3157  CVTSS2SD XMM7,XMM0
00bf315b  MULSD XMM2,XMM7
00bf315f  CVTSD2SS XMM2,XMM2
00bf3163  CVTSS2SD XMM2,XMM2
00bf3167  CVTSS2SD XMM7,XMM0
00bf316b  MULSD XMM2,XMM7
00bf316f  CVTSD2SS XMM2,XMM2
00bf3173  JNZ 0x00bf30f0
00bf3179  CMP EDX,ECX
00bf317b  JGE 0x00bf3196
00bf317d  MOV EAX,ECX
00bf317f  SUB EAX,EDX
00bf3181  SUB EAX,0x1
00bf3184  CVTSS2SD XMM2,XMM2
00bf3188  CVTSS2SD XMM7,XMM0
00bf318c  MULSD XMM2,XMM7
00bf3190  CVTSD2SS XMM2,XMM2
00bf3194  JNZ 0x00bf3181
00bf3196  MOVSS XMM7,dword ptr [ESI]
00bf319a  CVTPS2PD XMM7,XMM7
00bf319d  MULSD XMM7,XMM5
00bf31a1  CVTSS2SD XMM2,XMM2
00bf31a5  MULSD XMM7,XMM2
00bf31a9  CVTSS2SD XMM2,XMM3
00bf31ad  ADD ESI,0x4
00bf31b0  ADD ECX,0x1
00bf31b3  SUB EDI,0x1
00bf31b6  ADDSD XMM7,XMM2
00bf31ba  CVTPD2PS XMM3,XMM7
00bf31be  JNZ 0x00bf30d0
00bf31c4  MOV EDI,dword ptr [ESP + 0x18]
00bf31c8  MOV EAX,dword ptr [ESP + 0x14]
00bf31cc  CVTSS2SD XMM3,XMM3
00bf31d0  CVTSS2SD XMM2,XMM4
00bf31d4  SUBSD XMM2,XMM3
00bf31d8  MOVSS XMM3,dword ptr [EAX + EDI*0x1]
00bf31dd  CVTPS2PD XMM3,XMM3
00bf31e0  MULSD XMM2,XMM3
00bf31e4  CVTSD2SS XMM2,XMM2
00bf31e8  COMISS XMM6,XMM2
00bf31eb  JC 0x00bf31fb
00bf31ed  CVTSS2SD XMM3,XMM2
00bf31f1  COMISD XMM3,qword ptr [0x010cf418]
00bf31f9  JA 0x00bf3232
00bf31fb  CVTSS2SD XMM3,XMM2
00bf31ff  COMISD XMM3,qword ptr [0x00f62f70]
00bf3207  JBE 0x00bf321b
00bf3209  MOVSD XMM4,qword ptr [0x00fe1e38]
00bf3211  CVTSS2SD XMM3,XMM2
00bf3215  COMISD XMM4,XMM3
00bf3219  JA 0x00bf3232
00bf321b  MOVSS XMM3,dword ptr [EDI]
00bf321f  CVTSS2SD XMM2,XMM2
00bf3223  CVTPS2PD XMM3,XMM3
00bf3226  ADDSD XMM3,XMM2
00bf322a  CVTPD2PS XMM2,XMM3
00bf322e  MOVSS dword ptr [EDI],XMM2
00bf3232  MOVZX ECX,byte ptr [EBX + 0x1]
00bf3236  ADD EBP,0x1
00bf3239  ADD EDI,0x4
00bf323c  CMP EBP,ECX
00bf323e  MOV dword ptr [ESP + 0x18],EDI
00bf3242  JL 0x00bf2f30
00bf3248  POP EDI
00bf3249  POP ESI
00bf324a  POP EBP
00bf324b  POP EBX
00bf324c  RET

===== 00BF3250 =====
entry=00bf3250
body=[[00bf3250, 00bf340a]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00bf3250(int param_1,byte *param_2,float param_3,float *param_4)

{
  double dVar1;
  int iVar2;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  float *pfVar7;
  int iVar8;
  float fVar9;
  
  iVar2 = *(int *)(param_1 + (uint)param_2[1] * 4);
  iVar2 = (**(code **)(*(int *)(iVar2 + 0x20) + 0x14))
                    (*(undefined4 *)(iVar2 + 0x28),*(undefined4 *)(iVar2 + 0x24));
  dVar1 = _DAT_00f59898;
  iVar8 = 0;
  if (param_2[1] != 0) {
    uVar3 = (uint)*param_2;
    iVar2 = iVar2 - (int)param_4;
    do {
      iVar5 = (uVar3 + 1) * iVar8;
      *param_4 = *(float *)(param_2 + iVar5 * 4 + 8) * param_3 + *(float *)(param_2 + iVar5 * 4 + 4)
                 + *(float *)(iVar2 + (int)param_4);
      uVar3 = (uint)*param_2;
      if (1 < uVar3) {
        pfVar7 = (float *)(param_2 + iVar5 * 4 + 0xc);
        iVar5 = 1;
        do {
          iVar6 = 0;
          fVar9 = param_3;
          if (7 < iVar5) {
            iVar4 = (iVar5 - 8U >> 3) + 1;
            iVar6 = iVar4 * 8;
            do {
              iVar4 = iVar4 + -1;
              fVar9 = fVar9 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3 * param_3 *
                      param_3;
            } while (iVar4 != 0);
          }
          if (iVar6 < iVar5) {
            iVar6 = iVar5 - iVar6;
            do {
              iVar6 = iVar6 + -1;
              fVar9 = fVar9 * param_3;
            } while (iVar6 != 0);
          }
          *param_4 = (float)((double)*pfVar7 * dVar1 * (double)fVar9 + (double)*param_4);
          uVar3 = (uint)*param_2;
          iVar6 = iVar5 + 2;
          pfVar7 = pfVar7 + 1;
          iVar5 = iVar5 + 1;
        } while (iVar6 <= (int)uVar3);
      }
      iVar8 = iVar8 + 1;
      param_4 = param_4 + 1;
    } while (iVar8 < (int)(uint)param_2[1]);
  }
  return;
}


-- listing --
00bf3250  MOV ECX,dword ptr [ESP + 0x4]
00bf3254  PUSH EBP
00bf3255  PUSH ESI
00bf3256  MOV ESI,dword ptr [ESP + 0x10]
00bf325a  MOVZX EAX,byte ptr [ESI + 0x1]
00bf325e  MOV EAX,dword ptr [ECX + EAX*0x4]
00bf3261  MOV EDX,dword ptr [EAX + 0x28]
00bf3264  MOV ECX,dword ptr [EAX + 0x20]
00bf3267  MOV EAX,dword ptr [EAX + 0x24]
00bf326a  PUSH EAX
00bf326b  PUSH EDX
00bf326c  MOV EDX,dword ptr [ECX + 0x14]
00bf326f  CALL EDX
00bf3271  ADD ESP,0x8
00bf3274  XOR EBP,EBP
00bf3276  CMP byte ptr [ESI + 0x1],0x0
00bf327a  JBE 0x00bf3408
00bf3280  MOVZX ECX,byte ptr [ESI]
00bf3283  MOVSS XMM0,dword ptr [ESP + 0x14]
00bf3289  MOVSD XMM2,qword ptr [0x00f59898]
00bf3291  PUSH EBX
00bf3292  PUSH EDI
00bf3293  MOV EDI,dword ptr [ESP + 0x20]
00bf3297  SUB EAX,EDI
00bf3299  MOV dword ptr [ESP + 0x18],EAX
00bf329d  LEA ECX,[ECX]
00bf32a0  LEA EDX,[ECX + 0x1]
00bf32a3  IMUL EDX,EBP
00bf32a6  MOVSS XMM1,dword ptr [ESI + EDX*0x4 + 0x8]
00bf32ac  CVTPS2PD XMM1,XMM1
00bf32af  CVTSS2SD XMM3,XMM0
00bf32b3  MULSD XMM1,XMM3
00bf32b7  MOVSS XMM3,dword ptr [ESI + EDX*0x4 + 0x4]
00bf32bd  CVTPS2PD XMM3,XMM3
00bf32c0  ADDSD XMM1,XMM3
00bf32c4  MOVSS XMM3,dword ptr [EAX + EDI*0x1]
00bf32c9  CVTPS2PD XMM3,XMM3
00bf32cc  ADDSD XMM1,XMM3
00bf32d0  CVTPD2PS XMM1,XMM1
00bf32d4  MOVSS dword ptr [EDI],XMM1
00bf32d8  MOVZX ECX,byte ptr [ESI]
00bf32db  CMP ECX,0x2
00bf32de  JL 0x00bf33f4
00bf32e4  MOV EAX,0x1
00bf32e9  LEA EBX,[ESI + EDX*0x4 + 0xc]
00bf32ed  LEA ECX,[ECX]
00bf32f0  XOR EDX,EDX
00bf32f2  CMP EAX,0x8
00bf32f5  MOVAPS XMM1,XMM0
00bf32f8  JL 0x00bf3399
00bf32fe  LEA ECX,[EAX + -0x8]
00bf3301  SHR ECX,0x3
00bf3304  ADD ECX,0x1
00bf3307  LEA EDX,[ECX*0x8 + 0x0]
00bf330e  MOV EDI,EDI
00bf3310  SUB ECX,0x1
00bf3313  CVTSS2SD XMM1,XMM1
00bf3317  CVTSS2SD XMM3,XMM0
00bf331b  MULSD XMM1,XMM3
00bf331f  CVTSD2SS XMM1,XMM1
00bf3323  CVTSS2SD XMM1,XMM1
00bf3327  CVTSS2SD XMM3,XMM0
00bf332b  MULSD XMM1,XMM3
00bf332f  CVTSD2SS XMM1,XMM1
00bf3333  CVTSS2SD XMM1,XMM1
00bf3337  CVTSS2SD XMM3,XMM0
00bf333b  MULSD XMM1,XMM3
00bf333f  CVTSD2SS XMM1,XMM1
00bf3343  CVTSS2SD XMM1,XMM1
00bf3347  CVTSS2SD XMM3,XMM0
00bf334b  MULSD XMM1,XMM3
00bf334f  CVTSD2SS XMM1,XMM1
00bf3353  CVTSS2SD XMM1,XMM1
00bf3357  CVTSS2SD XMM3,XMM0
00bf335b  MULSD XMM1,XMM3
00bf335f  CVTSD2SS XMM1,XMM1
00bf3363  CVTSS2SD XMM1,XMM1
00bf3367  CVTSS2SD XMM3,XMM0
00bf336b  MULSD XMM1,XMM3
00bf336f  CVTSD2SS XMM1,XMM1
00bf3373  CVTSS2SD XMM1,XMM1
00bf3377  CVTSS2SD XMM3,XMM0
00bf337b  MULSD XMM1,XMM3
00bf337f  CVTSD2SS XMM1,XMM1
00bf3383  CVTSS2SD XMM1,XMM1
00bf3387  CVTSS2SD XMM3,XMM0
00bf338b  MULSD XMM1,XMM3
00bf338f  CVTSD2SS XMM1,XMM1
00bf3393  JNZ 0x00bf3310
00bf3399  CMP EDX,EAX
00bf339b  JGE 0x00bf33b6
00bf339d  MOV ECX,EAX
00bf339f  SUB ECX,EDX
00bf33a1  SUB ECX,0x1
00bf33a4  CVTSS2SD XMM1,XMM1
00bf33a8  CVTSS2SD XMM3,XMM0
00bf33ac  MULSD XMM1,XMM3
00bf33b0  CVTSD2SS XMM1,XMM1
00bf33b4  JNZ 0x00bf33a1
00bf33b6  MOVSS XMM3,dword ptr [EBX]
00bf33ba  CVTPS2PD XMM3,XMM3
00bf33bd  CVTSS2SD XMM1,XMM1
00bf33c1  MULSD XMM3,XMM2
00bf33c5  MULSD XMM3,XMM1
00bf33c9  MOVSS XMM1,dword ptr [EDI]
00bf33cd  CVTPS2PD XMM1,XMM1
00bf33d0  ADDSD XMM3,XMM1
00bf33d4  CVTPD2PS XMM1,XMM3
00bf33d8  MOVSS dword ptr [EDI],XMM1
00bf33dc  MOVZX ECX,byte ptr [ESI]
00bf33df  ADD EAX,0x1
00bf33e2  LEA EDX,[EAX + 0x1]
00bf33e5  ADD EBX,0x4
00bf33e8  CMP EDX,ECX
00bf33ea  JLE 0x00bf32f0
00bf33f0  MOV EAX,dword ptr [ESP + 0x18]
00bf33f4  MOVZX EDX,byte ptr [ESI + 0x1]
00bf33f8  ADD EBP,0x1
00bf33fb  ADD EDI,0x4
00bf33fe  CMP EBP,EDX
00bf3400  JL 0x00bf32a0
00bf3406  POP EDI
00bf3407  POP EBX
00bf3408  POP ESI
00bf3409  POP EBP
00bf340a  RET
