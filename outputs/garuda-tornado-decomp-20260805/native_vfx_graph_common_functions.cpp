program=ffxivgame-ifrit.exe
image_base=00400000

===== 00BD7870 =====
entry=00bd7870
body=[[00bd7870, 00bd787b]]
completed=true
message=

void FUN_00bd7870(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 4) = param_2;
  return;
}


-- listing --
00bd7870  MOV EAX,dword ptr [ESP + 0x8]
00bd7874  MOV ECX,dword ptr [ESP + 0x4]
00bd7878  MOV dword ptr [ECX + 0x4],EAX
00bd787b  RET

===== 00BD7880 =====
entry=00bd7880
body=[[00bd7880, 00bd7887]]
completed=true
message=

undefined4 FUN_00bd7880(int param_1)

{
  return *(undefined4 *)(param_1 + 4);
}


-- listing --
00bd7880  MOV EAX,dword ptr [ESP + 0x4]
00bd7884  MOV EAX,dword ptr [EAX + 0x4]
00bd7887  RET

===== 00BD7890 =====
entry=00bd7890
body=[[00bd7890, 00bd789b]]
completed=true
message=

void FUN_00bd7890(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 8) = param_2;
  return;
}


-- listing --
00bd7890  MOV EAX,dword ptr [ESP + 0x8]
00bd7894  MOV ECX,dword ptr [ESP + 0x4]
00bd7898  MOV dword ptr [ECX + 0x8],EAX
00bd789b  RET

===== 00BD78A0 =====
entry=00bd78a0
body=[[00bd78a0, 00bd78ab]]
completed=true
message=

void FUN_00bd78a0(int param_1,undefined4 param_2)

{
  *(undefined4 *)(param_1 + 0xc) = param_2;
  return;
}


-- listing --
00bd78a0  MOV EAX,dword ptr [ESP + 0x8]
00bd78a4  MOV ECX,dword ptr [ESP + 0x4]
00bd78a8  MOV dword ptr [ECX + 0xc],EAX
00bd78ab  RET

===== 00BD78B0 =====
entry=00bd78b0
body=[[00bd78b0, 00bd78b7]]
completed=true
message=

undefined4 FUN_00bd78b0(int param_1)

{
  return *(undefined4 *)(param_1 + 0xc);
}


-- listing --
00bd78b0  MOV EAX,dword ptr [ESP + 0x4]
00bd78b4  MOV EAX,dword ptr [EAX + 0xc]
00bd78b7  RET

===== 00BF6BE0 =====
entry=00bf6be0
body=[[00bf6be0, 00bf6be8]]
completed=true
message=

undefined4 __fastcall FUN_00bf6be0(int param_1)

{
  return *(undefined4 *)(**(int **)(param_1 + 0x10) + 0xc);
}


-- listing --
00bf6be0  MOV EAX,dword ptr [ECX + 0x10]
00bf6be3  MOV ECX,dword ptr [EAX]
00bf6be5  MOV EAX,dword ptr [ECX + 0xc]
00bf6be8  RET

===== 00BF6BF0 =====
entry=00bf6bf0
body=[[00bf6bf0, 00bf6c01]]
completed=true
message=

int __fastcall FUN_00bf6bf0(int param_1)

{
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x10);
  return (int)*(short *)(iVar1 + 0x18) * (int)*(short *)(iVar1 + 0xc) + *(int *)(iVar1 + 4);
}


-- listing --
00bf6bf0  MOV ECX,dword ptr [ECX + 0x10]
00bf6bf3  MOVSX EAX,word ptr [ECX + 0x18]
00bf6bf7  MOVSX EDX,word ptr [ECX + 0xc]
00bf6bfb  IMUL EAX,EDX
00bf6bfe  ADD EAX,dword ptr [ECX + 0x4]
00bf6c01  RET

===== 00BF6C10 =====
entry=00bf6c10
body=[[00bf6c10, 00bf6c16]]
completed=true
message=

float10 __fastcall FUN_00bf6c10(int param_1)

{
  return (float10)*(float *)(*(int *)(param_1 + 0x10) + 0x14);
}


-- listing --
00bf6c10  MOV EAX,dword ptr [ECX + 0x10]
00bf6c13  FLD float ptr [EAX + 0x14]
00bf6c16  RET
