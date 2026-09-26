program=ffxivgame-ifrit.exe
image_base=00400000

===== target 010bb12c =====
direct_ref_count=0
raw_pointer=00ba4d48
raw_pointer=00ba5248
raw_pointer_count=2

===== target 010bb244 =====
direct_ref_count=0
raw_pointer=00ba5c98
raw_pointer=00ba6308
raw_pointer_count=2

===== target 010bb264 =====
direct_ref_count=0
raw_pointer=00ba5c5e
raw_pointer=00ba62ce
raw_pointer_count=2

===== function 00ba5210 =====
reasons=raw-pointer:010bb12c
body=[[00ba5210, 00ba5255]]
completed=true
message=

void FUN_00ba5210(int param_1,undefined4 param_2,undefined4 param_3)

{
  func_0x00bcbda0(param_3,&UNK_010bb12c,(float *)(param_1 + 0x10),(double)*(float *)(param_1 + 0x10)
                  ,(double)*(float *)(param_1 + 0x14),(double)*(float *)(param_1 + 0x18));
  return;
}



===== function 00ba5bb0 =====
reasons=raw-pointer:010bb244;raw-pointer:010bb264
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


