program=ffxivgame-ifrit.exe
image_base=00400000

===== 0063c210 =====
entry=0063c210
body=[[0063c210, 0063c297]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_0063c210(undefined4 param_1,undefined4 param_2,int param_3,undefined4 *param_4)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  undefined4 *unaff_FS_OFFSET;
  undefined4 uStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  puStack_8 = &UNK_00e84501;
  uStack_c = *unaff_FS_OFFSET;
  uVar2 = _DAT_012ea8b0 ^ (uint)&uStack_c;
  *unaff_FS_OFFSET = &uStack_c;
  if (param_4 != (undefined4 *)0x0) {
    *param_4 = 0x68;
    *unaff_FS_OFFSET = uStack_c;
    return 0;
  }
  iVar1 = *(int *)(param_3 + 8);
  *(int *)(param_3 + 8) = iVar1 + 0x68;
  uStack_4 = 0;
  if (iVar1 == 0) {
    uVar3 = 0;
  }
  else {
    uVar3 = func_0x0082fb30(param_1,param_2,uVar2);
  }
  *unaff_FS_OFFSET = uStack_c;
  return uVar3;
}


-- listing --
0063c210  PUSH -0x1
0063c212  PUSH 0xe84501
0063c217  MOV EAX,FS:[0x0]
0063c21d  PUSH EAX
0063c21e  MOV EAX,[0x012ea8b0]
0063c223  XOR EAX,ESP
0063c225  PUSH EAX
0063c226  LEA EAX,[ESP + 0x4]
0063c22a  MOV FS:[0x0],EAX
0063c230  MOV EAX,dword ptr [ESP + 0x20]
0063c234  TEST EAX,EAX
0063c236  JZ 0x0063c250
0063c238  MOV dword ptr [EAX],0x68
0063c23e  XOR EAX,EAX
0063c240  MOV ECX,dword ptr [ESP + 0x4]
0063c244  MOV dword ptr FS:[0x0],ECX
0063c24b  POP ECX
0063c24c  ADD ESP,0xc
0063c24f  RET
0063c250  MOV EAX,dword ptr [ESP + 0x1c]
0063c254  MOV ECX,dword ptr [EAX + 0x8]
0063c257  LEA EDX,[ECX + 0x68]
0063c25a  MOV dword ptr [EAX + 0x8],EDX
0063c25d  MOV dword ptr [ESP + 0x20],ECX
0063c261  MOV dword ptr [ESP + 0xc],0x0
0063c269  TEST ECX,ECX
0063c26b  JZ 0x0063c27e
0063c26d  MOV EAX,dword ptr [ESP + 0x18]
0063c271  MOV EDX,dword ptr [ESP + 0x14]
0063c275  PUSH EAX
0063c276  PUSH EDX
0063c277  CALL 0x0082fb30
0063c27c  JMP 0x0063c280
0063c27e  XOR EAX,EAX
0063c280  MOV dword ptr [ESP + 0xc],0xffffffff
0063c288  MOV ECX,dword ptr [ESP + 0x4]
0063c28c  MOV dword ptr FS:[0x0],ECX
0063c293  POP ECX
0063c294  ADD ESP,0xc
0063c297  RET

===== 00830000 =====
entry=00830000
body=[[00830000, 00830007] [00830010, 0083001d]]
completed=true
message=

int __fastcall FUN_00830000(int param_1)

{
  func_0x0082fbb0();
  return param_1 + -8;
}


-- listing --
00830000  SUB ECX,0x8
00830003  JMP 0x00830010
00830010  PUSH ESI
00830011  MOV ESI,ECX
00830013  CALL 0x0082fbb0
00830018  MOV EAX,ESI
0083001a  POP ESI
0083001b  RET 0x4

===== 00830010 =====
entry=00830000
body=[[00830000, 00830007] [00830010, 0083001d]]
completed=true
message=

int __fastcall FUN_00830000(int param_1)

{
  func_0x0082fbb0();
  return param_1 + -8;
}


-- listing --
00830000  SUB ECX,0x8
00830003  JMP 0x00830010
00830010  PUSH ESI
00830011  MOV ESI,ECX
00830013  CALL 0x0082fbb0
00830018  MOV EAX,ESI
0083001a  POP ESI
0083001b  RET 0x4

===== 0082fc10 =====
entry=0082fc10
body=[[0082fc10, 0082fc55]]
completed=true
message=

void __thiscall
FUN_0082fc10(int *param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            undefined4 param_5)

{
  char *pcVar1;
  
  func_0x00a17a30(param_2,param_3,param_4,param_5);
  pcVar1 = (char *)(**(code **)(*param_1 + 0xa8))();
  if (((pcVar1 != (char *)0x0) && (*pcVar1 == '\x01')) && (pcVar1[1] != '\0')) {
    func_0x00a210f0(2);
  }
  return;
}


-- listing --
0082fc10  MOV EAX,dword ptr [ESP + 0x10]
0082fc14  MOV EDX,dword ptr [ESP + 0x8]
0082fc18  PUSH ESI
0082fc19  PUSH EAX
0082fc1a  MOV EAX,dword ptr [ESP + 0xc]
0082fc1e  MOV ESI,ECX
0082fc20  MOV ECX,dword ptr [ESP + 0x14]
0082fc24  PUSH ECX
0082fc25  PUSH EDX
0082fc26  PUSH EAX
0082fc27  MOV ECX,ESI
0082fc29  CALL 0x00a17a30
0082fc2e  MOV EDX,dword ptr [ESI]
0082fc30  MOV EAX,dword ptr [EDX + 0xa8]
0082fc36  MOV ECX,ESI
0082fc38  CALL EAX
0082fc3a  TEST EAX,EAX
0082fc3c  JZ 0x0082fc52
0082fc3e  CMP byte ptr [EAX],0x1
0082fc41  JNZ 0x0082fc52
0082fc43  CMP byte ptr [EAX + 0x1],0x0
0082fc47  JZ 0x0082fc52
0082fc49  PUSH 0x2
0082fc4b  MOV ECX,ESI
0082fc4d  CALL 0x00a210f0
0082fc52  POP ESI
0082fc53  RET 0x10

===== 0082fc60 =====
entry=0082fc60
body=[[0082fc60, 0082fca5]]
completed=true
message=

void __thiscall FUN_0082fc60(int *param_1,undefined4 param_2)

{
  int iVar1;
  int *piVar2;
  
  func_0x00a18170(param_2);
  iVar1 = (**(code **)(*param_1 + 0xa4))();
  piVar2 = (int *)(**(code **)(*(int *)(iVar1 + 0xf0) + 0x6c))();
  if ((*piVar2 != 0) && ((*(byte *)(*piVar2 + 8) & 0x20) != 0)) {
    (**(code **)(*param_1 + 0x48))(1);
  }
  return;
}


-- listing --
0082fc60  MOV EAX,dword ptr [ESP + 0x4]
0082fc64  PUSH ESI
0082fc65  PUSH EAX
0082fc66  MOV ESI,ECX
0082fc68  CALL 0x00a18170
0082fc6d  MOV EDX,dword ptr [ESI]
0082fc6f  MOV EAX,dword ptr [EDX + 0xa4]
0082fc75  MOV ECX,ESI
0082fc77  CALL EAX
0082fc79  MOV EDX,dword ptr [EAX + 0xf0]
0082fc7f  ADD EAX,0xf0
0082fc84  MOV ECX,EAX
0082fc86  MOV EAX,dword ptr [EDX + 0x6c]
0082fc89  CALL EAX
0082fc8b  MOV EAX,dword ptr [EAX]
0082fc8d  TEST EAX,EAX
0082fc8f  JZ 0x0082fca2
0082fc91  TEST byte ptr [EAX + 0x8],0x20
0082fc95  JZ 0x0082fca2
0082fc97  MOV EDX,dword ptr [ESI]
0082fc99  MOV EAX,dword ptr [EDX + 0x48]
0082fc9c  PUSH 0x1
0082fc9e  MOV ECX,ESI
0082fca0  CALL EAX
0082fca2  POP ESI
0082fca3  RET 0x4

===== 0082fcb0 =====
entry=0082fcb0
body=[[0082fcb0, 0082fd1a]]
completed=true
message=

void __thiscall FUN_0082fcb0(int *param_1,undefined4 param_2)

{
  char cVar1;
  char *pcVar2;
  
  if ((param_1[0x14] < 2) &&
     (cVar1 = (**(code **)(*param_1 + 0xc0))(param_2,param_1[5]), cVar1 == '\0')) {
    return;
  }
  pcVar2 = (char *)(**(code **)(*param_1 + 0xa8))();
  if (((pcVar2 != (char *)0x0) && (*pcVar2 == '\x01')) && (pcVar2[1] != '\0')) {
    FUN_00a20f90(param_2);
    if ((char)param_1[0x10] != '\0') {
      func_0x00a1f3c0();
      func_0x00a17eb0();
    }
    return;
  }
  func_0x00a18480(param_2);
  return;
}


-- listing --
0082fcb0  PUSH ESI
0082fcb1  MOV ESI,ECX
0082fcb3  CMP dword ptr [ESI + 0x50],0x2
0082fcb7  MOV EAX,dword ptr [ESI + 0x14]
0082fcba  PUSH EDI
0082fcbb  MOV EDI,dword ptr [ESP + 0xc]
0082fcbf  JGE 0x0082fcd1
0082fcc1  MOV EDX,dword ptr [ESI]
0082fcc3  PUSH EAX
0082fcc4  MOV EAX,dword ptr [EDX + 0xc0]
0082fcca  PUSH EDI
0082fccb  CALL EAX
0082fccd  TEST AL,AL
0082fccf  JZ 0x0082fd16
0082fcd1  MOV EDX,dword ptr [ESI]
0082fcd3  MOV EAX,dword ptr [EDX + 0xa8]
0082fcd9  MOV ECX,ESI
0082fcdb  CALL EAX
0082fcdd  TEST EAX,EAX
0082fcdf  JNZ 0x0082fcee
0082fce1  PUSH EDI
0082fce2  MOV ECX,ESI
0082fce4  CALL 0x00a18480
0082fce9  POP EDI
0082fcea  POP ESI
0082fceb  RET 0x4
0082fcee  CMP byte ptr [EAX],0x1
0082fcf1  JNZ 0x0082fce1
0082fcf3  CMP byte ptr [EAX + 0x1],0x0
0082fcf7  JZ 0x0082fce1
0082fcf9  PUSH EDI
0082fcfa  MOV ECX,ESI
0082fcfc  CALL 0x00a20f90
0082fd01  CMP byte ptr [ESI + 0x40],0x0
0082fd05  JZ 0x0082fd16
0082fd07  MOV ECX,dword ptr [ESI + 0x3c]
0082fd0a  CALL 0x00a1f3c0
0082fd0f  MOV ECX,ESI
0082fd11  CALL 0x00a17eb0
0082fd16  POP EDI
0082fd17  POP ESI
0082fd18  RET 0x4

===== 0082fe70 =====
entry=0082fe70
body=[[0082fe70, 0082ffb2]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __thiscall FUN_0082fe70(int *param_1,undefined4 param_2)

{
  char cVar1;
  uint uVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  int *unaff_FS_OFFSET;
  int iStack_c;
  undefined *puStack_8;
  undefined4 uStack_4;
  
  uStack_4 = 0xffffffff;
  puStack_8 = &UNK_00eb1e91;
  iStack_c = *unaff_FS_OFFSET;
  uVar2 = _DAT_012ea8b0 ^ (uint)&stack0xffffffc8;
  *unaff_FS_OFFSET = (int)&iStack_c;
  if ((char)param_1[0x10] != '\0') {
    iVar3 = (**(code **)(*param_1 + 0xa4))(uVar2);
    piVar4 = (int *)(**(code **)(*(int *)(iVar3 + 0xf0) + 0x6c))();
    iVar3 = 0;
    if (*piVar4 != 0) {
      func_0x0080a810(param_2);
    }
    if (*(int *)(param_1[0xf] + 0x34) != 0) {
      iVar5 = param_1[5];
      func_0x00a1ff70(param_1[0xf]);
      puStack_8 = (undefined *)0x0;
      FUN_00a1ffa0(*(undefined1 *)(iVar5 + 3));
      iVar5 = (**(code **)(*(int *)param_1[9] + 0xc))();
      if ((iVar5 != 0) && (iVar5 = func_0x00a21460(), 0 < iVar5)) {
        do {
          piVar4 = (int *)func_0x00a21430(iVar3);
          if ((piVar4 != (int *)0x0) &&
             ((iVar6 = (**(code **)(*piVar4 + 0x2c))(), iVar6 == 2 &&
              (cVar1 = (**(code **)(*piVar4 + 0x4c))(), cVar1 == '\0')))) {
            uVar7 = (**(code **)(*piVar4 + 0x14))(_DAT_012ce7d4,0xf);
            uVar7 = func_0x00a1b700(uVar7);
            iVar6 = func_0x009d5475(uVar7);
            if (iVar6 == 0) {
              func_0x0082eab0(uStack_4);
            }
          }
          iVar3 = iVar3 + 1;
        } while (iVar3 < iVar5);
      }
      iStack_c = -1;
      func_0x00a1ff90();
    }
  }
  *unaff_FS_OFFSET = iStack_c;
  return;
}


-- listing --
0082fe70  PUSH -0x1
0082fe72  PUSH 0xeb1e91
0082fe77  MOV EAX,FS:[0x0]
0082fe7d  PUSH EAX
0082fe7e  SUB ESP,0x1c
0082fe81  PUSH EBX
0082fe82  PUSH EBP
0082fe83  PUSH ESI
0082fe84  PUSH EDI
0082fe85  MOV EAX,[0x012ea8b0]
0082fe8a  XOR EAX,ESP
0082fe8c  PUSH EAX
0082fe8d  LEA EAX,[ESP + 0x30]
0082fe91  MOV FS:[0x0],EAX
0082fe97  MOV EDI,ECX
0082fe99  CMP byte ptr [EDI + 0x40],0x0
0082fe9d  JZ 0x0082ff9d
0082fea3  MOV EAX,dword ptr [EDI]
0082fea5  MOV EDX,dword ptr [EAX + 0xa4]
0082feab  CALL EDX
0082fead  LEA ECX,[EAX + 0xf0]
0082feb3  MOV EAX,dword ptr [ECX]
0082feb5  MOV EDX,dword ptr [EAX + 0x6c]
0082feb8  CALL EDX
0082feba  MOV ECX,dword ptr [EAX]
0082febc  XOR EBP,EBP
0082febe  CMP ECX,EBP
0082fec0  JZ 0x0082fecc
0082fec2  MOV EAX,dword ptr [ESP + 0x40]
0082fec6  PUSH EAX
0082fec7  CALL 0x0080a810
0082fecc  MOV EAX,dword ptr [EDI + 0x3c]
0082fecf  MOV EBX,dword ptr [EAX + 0x34]
0082fed2  CMP EBX,EBP
0082fed4  MOV dword ptr [ESP + 0x14],EBX
0082fed8  JZ 0x0082ff9d
0082fede  MOV ESI,dword ptr [EDI + 0x14]
0082fee1  PUSH EAX
0082fee2  LEA ECX,[ESP + 0x20]
0082fee6  CALL 0x00a1ff70
0082feeb  MOV dword ptr [ESP + 0x38],EBP
0082feef  MOVZX ECX,byte ptr [ESI + 0x3]
0082fef3  PUSH ECX
0082fef4  LEA ECX,[ESP + 0x20]
0082fef8  CALL 0x00a1ffa0
0082fefd  MOV ECX,dword ptr [EDI + 0x24]
0082ff00  MOV EDX,dword ptr [ECX]
0082ff02  MOV EAX,dword ptr [EDX + 0xc]
0082ff05  CALL EAX
0082ff07  CMP EAX,EBP
0082ff09  JZ 0x0082ff8c
0082ff0f  MOV ECX,EBX
0082ff11  CALL 0x00a21460
0082ff16  TEST EAX,EAX
0082ff18  MOV dword ptr [ESP + 0x18],EAX
0082ff1c  JLE 0x0082ff8c
0082ff1e  JMP 0x0082ff24
0082ff20  MOV EBX,dword ptr [ESP + 0x14]
0082ff24  PUSH EBP
0082ff25  MOV ECX,EBX
0082ff27  CALL 0x00a21430
0082ff2c  MOV ESI,EAX
0082ff2e  TEST ESI,ESI
0082ff30  JZ 0x0082ff83
0082ff32  MOV EDX,dword ptr [ESI]
0082ff34  MOV EAX,dword ptr [EDX + 0x2c]
0082ff37  MOV ECX,ESI
0082ff39  CALL EAX
0082ff3b  CMP EAX,0x2
0082ff3e  JNZ 0x0082ff83
0082ff40  MOV EDX,dword ptr [ESI]
0082ff42  MOV EAX,dword ptr [EDX + 0x4c]
0082ff45  MOV ECX,ESI
0082ff47  CALL EAX
0082ff49  TEST AL,AL
0082ff4b  JNZ 0x0082ff83
0082ff4d  MOV ECX,dword ptr [0x012ce7d4]
0082ff53  MOV EDX,dword ptr [ESI]
0082ff55  MOV EAX,dword ptr [EDX + 0x14]
0082ff58  MOV EBX,dword ptr [EDI + 0x3c]
0082ff5b  PUSH 0xf
0082ff5d  PUSH ECX
0082ff5e  MOV ECX,ESI
0082ff60  CALL EAX
0082ff62  PUSH EAX
0082ff63  MOV ECX,EBX
0082ff65  CALL 0x00a1b700
0082ff6a  PUSH EAX
0082ff6b  CALL 0x009d5475
0082ff70  ADD ESP,0xc
0082ff73  TEST EAX,EAX
0082ff75  JNZ 0x0082ff83
0082ff77  MOV ECX,dword ptr [ESP + 0x40]
0082ff7b  PUSH ECX
0082ff7c  MOV ECX,ESI
0082ff7e  CALL 0x0082eab0
0082ff83  ADD EBP,0x1
0082ff86  CMP EBP,dword ptr [ESP + 0x18]
0082ff8a  JL 0x0082ff20
0082ff8c  MOV dword ptr [ESP + 0x38],0xffffffff
0082ff94  LEA ECX,[ESP + 0x1c]
0082ff98  CALL 0x00a1ff90
0082ff9d  MOV ECX,dword ptr [ESP + 0x30]
0082ffa1  MOV dword ptr FS:[0x0],ECX
0082ffa8  POP ECX
0082ffa9  POP EDI
0082ffaa  POP ESI
0082ffab  POP EBP
0082ffac  POP EBX
0082ffad  ADD ESP,0x28
0082ffb0  RET 0x4

===== 00a179c0 =====
entry=00a179c0
body=[[00a179c0, 00a17a21]]
completed=true
message=

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * __thiscall FUN_00a179c0(undefined4 *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  
  func_0x00a21260(param_2,param_3);
  uVar1 = _DAT_00f54f70;
  param_1[0xe] = &UNK_01096e44;
  *param_1 = &UNK_01096f6c;
  param_1[2] = &UNK_01096f60;
  param_1[0xe] = &UNK_01096ed4;
  param_1[0xf] = 0;
  *(undefined1 *)(param_1 + 0x10) = 0;
  param_1[0x11] = 0;
  param_1[0x12] = 0;
  param_1[0x13] = 0;
  param_1[0x14] = 0;
  param_1[0x15] = 0;
  *(undefined1 *)((int)param_1 + 0x61) = 0;
  *(undefined1 *)((int)param_1 + 0x62) = 0;
  param_1[0x17] = uVar1;
  param_1[0x19] = 0;
  return param_1;
}


-- listing --
00a179c0  MOV EAX,dword ptr [ESP + 0x8]
00a179c4  PUSH ESI
00a179c5  MOV ESI,ECX
00a179c7  MOV ECX,dword ptr [ESP + 0x8]
00a179cb  PUSH EAX
00a179cc  PUSH ECX
00a179cd  MOV ECX,ESI
00a179cf  CALL 0x00a21260
00a179d4  MOVSS XMM0,dword ptr [0x00f54f70]
00a179dc  MOV dword ptr [ESI + 0x38],0x1096e44
00a179e3  XOR EAX,EAX
00a179e5  MOV dword ptr [ESI],0x1096f6c
00a179eb  MOV dword ptr [ESI + 0x8],0x1096f60
00a179f2  MOV dword ptr [ESI + 0x38],0x1096ed4
00a179f9  MOV dword ptr [ESI + 0x3c],EAX
00a179fc  MOV byte ptr [ESI + 0x40],AL
00a179ff  MOV dword ptr [ESI + 0x44],EAX
00a17a02  MOV dword ptr [ESI + 0x48],EAX
00a17a05  MOV dword ptr [ESI + 0x4c],EAX
00a17a08  MOV dword ptr [ESI + 0x50],EAX
00a17a0b  MOV dword ptr [ESI + 0x54],EAX
00a17a0e  MOV byte ptr [ESI + 0x61],AL
00a17a11  MOV byte ptr [ESI + 0x62],AL
00a17a14  MOVSS dword ptr [ESI + 0x5c],XMM0
00a17a19  MOV dword ptr [ESI + 0x64],EAX
00a17a1c  MOV EAX,ESI
00a17a1e  POP ESI
00a17a1f  RET 0x8
