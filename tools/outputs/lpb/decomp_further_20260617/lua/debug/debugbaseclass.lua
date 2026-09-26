local L0_0, L1_1
L0_0 = DebugBaseClass
function L1_1(A0_2)
  A0_2:_callSuperClassFunc("_onInit")
  A0_2.debugWork._save = {
    {
      "_assignForChild",
      1024
    }
  }
  A0_2.debugWork._temp = {
    {
      "_assignForChild",
      1024
    }
  }
end
L0_0._onInit = L1_1
L0_0 = DebugBaseClass
function L1_1(A0_3, A1_4)
end
L0_0._onLoop = L1_1
L0_0 = DebugBaseClass
function L1_1(A0_5, ...)
  local L2_7, L3_8, L4_9
  L3_8 = A0_5
  L2_7 = A0_5._setLoopInterval
  L4_9 = ...
  L2_7(L3_8, L4_9)
end
L0_0.setLoopInterval = L1_1
