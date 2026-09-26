program=ffxivgame-ifrit.exe
image_base=00400000

===== target 00be7bc0 =====
direct_ref=00be7da5 type=UNCONDITIONAL_CALL
direct_ref_count=1
raw_pointer_count=0

===== target 00be7c10 =====
direct_ref=00be7dac type=UNCONDITIONAL_CALL
direct_ref_count=1
raw_pointer_count=0

===== function 00be7d50 =====
reasons=direct:00be7bc0;direct:00be7c10
body=[[00be7d50, 00be7db6]]
completed=true
message=

int * __thiscall
FUN_00be7d50(int *param_1,int param_2,int param_3,int param_4,int param_5,int param_6,int param_7)

{
  byte bVar1;
  undefined4 uVar2;
  
  param_1[2] = param_3;
  param_1[6] = param_4;
  param_1[7] = param_5;
  *param_1 = param_2;
  *(undefined1 *)(param_1 + 1) = 1;
  param_1[8] = param_6;
  param_1[3] = param_7;
  bVar1 = *(byte *)(param_2 + 2);
  *(byte *)(param_1 + 9) = bVar1;
  if (1 < bVar1) {
    uVar2 = func_0x00415c90(2,&UNK_010cee1c);
    func_0x004160e0(uVar2);
    *(undefined1 *)(param_1 + 9) = 0;
  }
  FUN_00be7bc0();
  FUN_00be7c10();
  return param_1;
}


