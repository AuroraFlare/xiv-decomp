local L0_0, L1_1
L0_0 = PrivateAreaBaseClass
function L1_1(A0_2, A1_3, A2_4, A3_5)
  A0_2:_callSuperClassFunc("_onInit", A1_3, A2_4, A3_5)
  A0_2.privateAreaWork._save = {}
  A0_2.privateAreaWork._temp = {
    {
      "_assignForChild",
      64
    }
  }
  A0_2:init(A0_2:_getZoneName())
end
L0_0._onInit = L1_1
L0_0 = PrivateAreaBaseClass
function L1_1(A0_6, A1_7, A2_8)
end
L0_0.init = L1_1
