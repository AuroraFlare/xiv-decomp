program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BE7AE0 =====
entry=00be7ae0
body=[[00be7ae0, 00be7b29] [00be7b42, 00be7b54] [00be7b61, 00be7b73] [00be7b80, 00be7b84]]
completed=true
message=

undefined2 FUN_00be7ae0(byte *param_1,undefined4 *param_2)

{
  char cVar1;
  char *pcVar2;
  undefined2 uVar3;
  
  uVar3 = 0;
  if ((param_1[1] & 1) == 0) {
    uVar3 = *(undefined2 *)(param_1 + 0xc);
  }
  else if ((*param_1 & 0x30) == 0x30) {
    pcVar2 = *(char **)*param_2;
    cVar1 = *pcVar2;
    if (cVar1 == '\0') {
      switch(pcVar2[1]) {
      case '\x01':
        return 8;
      case '\x02':
code_r0x00be7b55:
        return 0xc;
      case '\x03':
code_r0x00be7b2a:
        return 0x10;
      case '\x04':
code_r0x00be7b7a:
        return 0x14;
      }
    }
    else if (cVar1 == '\x01') {
      switch(pcVar2[1]) {
      case '\x01':
        goto code_r0x00be7b55;
      case '\x02':
        goto code_r0x00be7b7a;
      case '\x03':
code_r0x00be7b30:
        return 0x1c;
      case '\x04':
        return 0x24;
      }
    }
    else if (cVar1 == '\x02') {
      switch(pcVar2[1]) {
      case '\x01':
        goto code_r0x00be7b2a;
      case '\x02':
        goto code_r0x00be7b30;
      case '\x03':
        return 0x28;
      case '\x04':
        return 0x34;
      }
    }
  }
  return uVar3;
}


-- listing --
00be7ae0  MOV ECX,dword ptr [ESP + 0x4]
00be7ae4  XOR EAX,EAX
00be7ae6  TEST byte ptr [ECX + 0x1],0x1
00be7aea  JZ 0x00be7b80
00be7af0  MOV CL,byte ptr [ECX]
00be7af2  AND CL,0x30
00be7af5  CMP CL,0x30
00be7af8  JNZ 0x00be7b84
00be7afe  MOV EDX,dword ptr [ESP + 0x8]
00be7b02  MOV ECX,dword ptr [EDX]
00be7b04  MOV ECX,dword ptr [ECX]
00be7b06  MOVZX EDX,byte ptr [ECX]
00be7b09  SUB EDX,EAX
00be7b0b  JZ 0x00be7b61
00be7b0d  SUB EDX,0x1
00be7b10  JZ 0x00be7b42
00be7b12  SUB EDX,0x1
00be7b15  JNZ 0x00be7b84
00be7b17  MOVZX ECX,byte ptr [ECX + 0x1]
00be7b1b  ADD ECX,-0x1
00be7b1e  CMP ECX,0x3
00be7b21  JA 0x00be7b84
00be7b23  JMP dword ptr [ECX*0x4 + 0xbe7b88]
00be7b42  MOVZX ECX,byte ptr [ECX + 0x1]
00be7b46  ADD ECX,-0x1
00be7b49  CMP ECX,0x3
00be7b4c  JA 0x00be7b84
00be7b4e  JMP dword ptr [ECX*0x4 + 0xbe7b98]
00be7b61  MOVZX ECX,byte ptr [ECX + 0x1]
00be7b65  ADD ECX,-0x1
00be7b68  CMP ECX,0x3
00be7b6b  JA 0x00be7b84
00be7b6d  JMP dword ptr [ECX*0x4 + 0xbe7ba8]
00be7b80  MOVZX EAX,word ptr [ECX + 0xc]
00be7b84  RET
