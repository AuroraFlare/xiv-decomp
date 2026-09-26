program=ffxivgame-ifrit.exe
image_base=00400000

===== 00E3A0A0 =====
entry=00e3a0a0
body=[[00e3a0a0, 00e3a0e2]]
completed=true
message=

int FUN_00e3a0a0(int *param_1,short *param_2)

{
  int iVar1;
  
  iVar1 = (int)*param_2;
  if (iVar1 < 0) {
    iVar1 = *(int *)(*(int *)(*(int *)(*param_1 + 8) + 0x10) + iVar1 * -0x18 + -8);
  }
  else {
    iVar1 = *(int *)(*(int *)(*(int *)(*param_1 + 8) + 0xc) + 0x10 + iVar1 * 0x18);
  }
  iVar1 = *(int *)(iVar1 + param_2[1] * 4);
  if ((*(byte *)(iVar1 + 0x1f) & 1) != 0) {
    return iVar1 + 0x30;
  }
  return iVar1 + 0x20;
}


-- listing --
00e3a0a0  MOV ECX,dword ptr [ESP + 0x8]
00e3a0a4  MOVSX EAX,word ptr [ECX]
00e3a0a7  MOV EDX,dword ptr [ESP + 0x4]
00e3a0ab  MOV EDX,dword ptr [EDX]
00e3a0ad  MOVSX ECX,word ptr [ECX + 0x2]
00e3a0b1  MOV EDX,dword ptr [EDX + 0x8]
00e3a0b4  TEST EAX,EAX
00e3a0b6  LEA EAX,[EAX + EAX*0x2]
00e3a0b9  JL 0x00e3a0c4
00e3a0bb  MOV EDX,dword ptr [EDX + 0xc]
00e3a0be  MOV EAX,dword ptr [EDX + EAX*0x8 + 0x10]
00e3a0c2  JMP 0x00e3a0d2
00e3a0c4  MOV EDX,dword ptr [EDX + 0x10]
00e3a0c7  ADD EAX,EAX
00e3a0c9  ADD EAX,EAX
00e3a0cb  ADD EAX,EAX
00e3a0cd  SUB EDX,EAX
00e3a0cf  MOV EAX,dword ptr [EDX + -0x8]
00e3a0d2  MOV EAX,dword ptr [EAX + ECX*0x4]
00e3a0d5  TEST byte ptr [EAX + 0x1f],0x1
00e3a0d9  JZ 0x00e3a0df
00e3a0db  ADD EAX,0x30
00e3a0de  RET
00e3a0df  ADD EAX,0x20
00e3a0e2  RET

===== 00E3A810 =====
entry=00e3a810
body=[[00bac820, 00bac82d] [00e3a810, 00e3a825] [00e3afe0, 00e3afea]]
completed=true
message=

void FUN_00e3a810(int *param_1)

{
  EnterCriticalSection
            (*(int *)(*(int *)(*(int *)(*(int *)(**(int **)(*param_1 + 8) + 0x10) + 0xc) + 0xcc) +
                     0x28) + 8);
  return;
}


-- listing --
00bac820  MOV EAX,dword ptr [ECX + 0xcc]
00bac826  MOV ECX,dword ptr [EAX + 0x28]
00bac829  JMP 0x00e3afe0
00e3a810  MOV EAX,dword ptr [ESP + 0x4]
00e3a814  MOV ECX,dword ptr [EAX]
00e3a816  MOV EDX,dword ptr [ECX + 0x8]
00e3a819  MOV EAX,dword ptr [EDX]
00e3a81b  MOV ECX,dword ptr [EAX + 0x10]
00e3a81e  MOV ECX,dword ptr [ECX + 0xc]
00e3a821  JMP 0x00bac820
00e3afe0  ADD ECX,0x8
00e3afe3  PUSH ECX
00e3afe4  CALL dword ptr [0x00f3e16c]
00e3afea  RET

===== 00E3A830 =====
entry=00e3a830
body=[[00bac830, 00bac83d] [00e3a830, 00e3a845] [00e3aff0, 00e3affa]]
completed=true
message=

void FUN_00e3a830(int *param_1)

{
  LeaveCriticalSection
            (*(int *)(*(int *)(*(int *)(*(int *)(**(int **)(*param_1 + 8) + 0x10) + 0xc) + 0xcc) +
                     0x28) + 8);
  return;
}


-- listing --
00bac830  MOV EAX,dword ptr [ECX + 0xcc]
00bac836  MOV ECX,dword ptr [EAX + 0x28]
00bac839  JMP 0x00e3aff0
00e3a830  MOV EAX,dword ptr [ESP + 0x4]
00e3a834  MOV ECX,dword ptr [EAX]
00e3a836  MOV EDX,dword ptr [ECX + 0x8]
00e3a839  MOV EAX,dword ptr [EDX]
00e3a83b  MOV ECX,dword ptr [EAX + 0x10]
00e3a83e  MOV ECX,dword ptr [ECX + 0xc]
00e3a841  JMP 0x00bac830
00e3aff0  ADD ECX,0x8
00e3aff3  PUSH ECX
00e3aff4  CALL dword ptr [0x00f3e168]
00e3affa  RET

===== 00D999B0 =====
entry=00d999b0
body=[[00d999b0, 00d999df]]
completed=true
message=

undefined1 FUN_00d999b0(undefined4 param_1,int *param_2,undefined4 *param_3)

{
  char cVar1;
  
  *param_3 = 0;
  if ((char)param_2[1] == '\x04') {
    cVar1 = func_0x00d995e0(param_1,*param_2 + 0x20,param_3);
    if (cVar1 == '\0') {
      return 0;
    }
  }
  return 1;
}


-- listing --
00d999b0  MOV ECX,dword ptr [ESP + 0xc]
00d999b4  MOV EAX,dword ptr [ESP + 0x8]
00d999b8  MOV dword ptr [ECX],0x0
00d999be  CMP byte ptr [EAX + 0x4],0x4
00d999c2  JNZ 0x00d999dd
00d999c4  MOV EAX,dword ptr [EAX]
00d999c6  PUSH ECX
00d999c7  ADD EAX,0x20
00d999ca  PUSH EAX
00d999cb  MOV EAX,dword ptr [ESP + 0xc]
00d999cf  PUSH EAX
00d999d0  CALL 0x00d995e0
00d999d5  ADD ESP,0xc
00d999d8  TEST AL,AL
00d999da  JNZ 0x00d999dd
00d999dc  RET
00d999dd  MOV AL,0x1
00d999df  RET

===== 00D98D10 =====
entry=00d98d10
body=[[00d98d10, 00d98d5c]]
completed=true
message=

void FUN_00d98d10(undefined4 param_1,int param_2,int *param_3)

{
  int iVar1;
  
  if (*(char *)(param_2 + 4) == '\x04') {
    if (*param_3 == 0) {
      return;
    }
    iVar1 = *(int *)(*param_3 + 8);
    if (iVar1 != 0) {
      func_0x00e3a260(param_1,iVar1);
      *(undefined4 *)(*param_3 + 8) = 0;
    }
  }
  if (*param_3 != 0) {
    func_0x00e3a260(param_1,*param_3);
    *param_3 = 0;
  }
  return;
}


-- listing --
00d98d10  MOV EAX,dword ptr [ESP + 0x8]
00d98d14  CMP byte ptr [EAX + 0x4],0x4
00d98d18  PUSH ESI
00d98d19  MOV ESI,dword ptr [ESP + 0x10]
00d98d1d  PUSH EDI
00d98d1e  MOV EDI,dword ptr [ESP + 0xc]
00d98d22  JNZ 0x00d98d44
00d98d24  MOV EAX,dword ptr [ESI]
00d98d26  TEST EAX,EAX
00d98d28  JZ 0x00d98d5a
00d98d2a  MOV EAX,dword ptr [EAX + 0x8]
00d98d2d  TEST EAX,EAX
00d98d2f  JZ 0x00d98d44
00d98d31  PUSH EAX
00d98d32  PUSH EDI
00d98d33  CALL 0x00e3a260
00d98d38  MOV ECX,dword ptr [ESI]
00d98d3a  ADD ESP,0x8
00d98d3d  MOV dword ptr [ECX + 0x8],0x0
00d98d44  MOV EAX,dword ptr [ESI]
00d98d46  TEST EAX,EAX
00d98d48  JZ 0x00d98d5a
00d98d4a  PUSH EAX
00d98d4b  PUSH EDI
00d98d4c  CALL 0x00e3a260
00d98d51  ADD ESP,0x8
00d98d54  MOV dword ptr [ESI],0x0
00d98d5a  POP EDI
00d98d5b  POP ESI
00d98d5c  RET

===== 00D99A70 =====
entry=00d99a70
body=[[00d99a70, 00d99afe] [00d99d85, 00d99d8b]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00d99a70(undefined4 param_1,int *param_2,undefined4 param_3,undefined8 *param_4)

{
  int iVar1;
  char cVar2;
  undefined4 *puVar3;
  undefined4 uVar4;
  undefined4 *unaff_EDI;
  undefined4 uStack_f4;
  undefined4 uStack_dc;
  undefined4 uStack_d8;
  undefined4 uStack_d4;
  undefined4 uStack_d0;
  undefined8 uStack_cc;
  undefined8 uStack_c4;
  undefined8 uStack_bc;
  undefined8 uStack_b4;
  undefined8 uStack_ac;
  undefined8 uStack_a4;
  undefined8 uStack_9c;
  undefined8 uStack_94;
  undefined4 uStack_8c;
  undefined4 uStack_88;
  undefined4 uStack_84;
  undefined4 uStack_80;
  undefined1 auStack_7c [16];
  undefined4 uStack_6c;
  undefined4 uStack_68;
  undefined4 uStack_64;
  undefined4 uStack_60;
  undefined4 uStack_4c;
  undefined4 uStack_48;
  undefined4 uStack_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 uStack_30;
  undefined4 uStack_2c;
  undefined4 uStack_28;
  undefined4 uStack_24;
  undefined4 uStack_20;
  undefined4 uStack_1c;
  undefined4 uStack_18;
  undefined4 uStack_14;
  
  uStack_20 = 0;
  uStack_1c = 0;
  uStack_18 = 0;
  uStack_f4 = 0;
  uStack_14 = _DAT_00f54f70;
  (**(code **)(*_DAT_0136b6b0 + 0x174))();
  func_0x00c0edc0(0);
  func_0x00c0ee20(0);
  switch((char)param_2[1]) {
  case '\x01':
    puVar3 = (undefined4 *)FUN_00e3a0a0(param_1,*param_2 + 0x20);
    uStack_4c = uStack_2c;
    uStack_48 = uStack_28;
    uStack_44 = uStack_24;
    uStack_40 = uStack_20;
    uStack_2c = 0;
    uStack_28 = 0;
    uStack_24 = 0;
    uStack_20 = 0;
    uStack_dc = 0;
    uStack_d8 = 0;
    uStack_d4 = 0;
    uStack_d0 = 0;
    func_0x00bfa060(&uStack_dc,*puVar3,param_4,&uStack_4c,0);
    return;
  case '\x02':
    uVar4 = FUN_00e3a0a0(param_1,*param_2 + 0x2c);
    uStack_8c = uStack_2c;
    uStack_88 = uStack_28;
    uStack_84 = uStack_24;
    uStack_80 = uStack_20;
    uVar4 = func_0x0042e7b0(&uStack_3c,uVar4,param_4,&uStack_8c,0);
    func_0x00bf99f0(uVar4);
    return;
  case '\x03':
    iVar1 = *param_2;
    FUN_00e3a0a0(param_1,iVar1 + 0x20);
    FUN_00e3a0a0(param_1,iVar1 + 0x28);
    puVar3 = (undefined4 *)&stack0xffffff14;
    func_0x0042f360(&uStack_6c);
    uStack_f4 = 0;
    func_0x0042f360(&uStack_84,&uStack_f4);
    uStack_6c = uStack_3c;
    uStack_68 = uStack_38;
    uStack_64 = uStack_34;
    uStack_60 = uStack_30;
    func_0x00bfbd40(auStack_7c,&uStack_8c,*puVar3,&uStack_6c,0);
    return;
  case '\x04':
    uVar4 = func_0x00d85c90(param_1,*param_2 + 0x20,unaff_EDI + 1);
    *unaff_EDI = uVar4;
    cVar2 = func_0x00d98c30(unaff_EDI,&uStack_cc);
    if (cVar2 != '\0') {
      uStack_cc = *param_4;
      uStack_c4 = param_4[1];
      uStack_bc = param_4[2];
      uStack_b4 = param_4[3];
      uStack_ac = param_4[4];
      uStack_a4 = param_4[5];
      uStack_9c = param_4[6];
      uStack_94 = param_4[7];
      (**(code **)(*_DAT_0136b6b0 + 0x144))(1);
      (**(code **)(*(int *)*unaff_EDI + 0x10))(0,&uStack_d0);
      (**(code **)(*(int *)*unaff_EDI + 0x1c))();
      (**(code **)(*_DAT_0136b6b0 + 0x144))(2);
    }
  }
  return;
}


-- listing --
00d99a70  PUSH EBP
00d99a71  MOV EBP,ESP
00d99a73  AND ESP,0xfffffff0
00d99a76  SUB ESP,0xd4
00d99a7c  XORPS XMM0,XMM0
00d99a7f  MOV ECX,dword ptr [0x0136b6b0]
00d99a85  MOV EAX,dword ptr [EBP + 0x10]
00d99a88  MOV EDX,dword ptr [ECX]
00d99a8a  PUSH EBX
00d99a8b  MOV EBX,dword ptr [EBP + 0x8]
00d99a8e  PUSH ESI
00d99a8f  MOV ESI,dword ptr [EBP + 0x14]
00d99a92  PUSH EDI
00d99a93  MOV EDI,dword ptr [EBP + 0xc]
00d99a96  MOV dword ptr [ESP + 0xc],EAX
00d99a9a  MOV EAX,dword ptr [EDX + 0x174]
00d99aa0  MOVSS dword ptr [ESP + 0xd0],XMM0
00d99aa9  MOVSS dword ptr [ESP + 0xd4],XMM0
00d99ab2  MOVSS dword ptr [ESP + 0xd8],XMM0
00d99abb  MOVSS XMM0,dword ptr [0x00f54f70]
00d99ac3  PUSH 0x0
00d99ac5  MOVSS dword ptr [ESP + 0xe0],XMM0
00d99ace  CALL EAX
00d99ad0  PUSH 0x0
00d99ad2  MOV ECX,0x13083c8
00d99ad7  CALL 0x00c0edc0
00d99adc  PUSH 0x0
00d99ade  MOV ECX,0x13083c8
00d99ae3  CALL 0x00c0ee20
00d99ae8  MOVZX EAX,byte ptr [EDI + 0x4]
00d99aec  ADD EAX,-0x1
00d99aef  CMP EAX,0x3
00d99af2  JA 0x00d99d85
00d99af8  JMP dword ptr [EAX*0x4 + 0xd99d8c]
00d99d85  POP EDI
00d99d86  POP ESI
00d99d87  POP EBX
00d99d88  MOV ESP,EBP
00d99d8a  POP EBP
00d99d8b  RET
