local L0_0, L1_1
L0_0 = CommandDebuggerFUNCBaseClass
function L1_1(A0_2)
  A0_2:_callSuperClassFunc("_onInit")
  A0_2.commandDebuggerFUNCWork._save = {
    {
      "_assignForChild",
      256
    }
  }
  A0_2.commandDebuggerFUNCWork._temp = {
    {
      "_assignForChild",
      256
    }
  }
  A0_2:init()
end
L0_0._onInit = L1_1
L0_0 = CommandDebuggerFUNCBaseClass
function L1_1(A0_3, A1_4)
  local L2_5, L3_6
  L3_6 = A0_3
  L2_5 = A0_3.filterLog
  L3_6 = L2_5(L3_6, A1_4)
  return L2_5, L3_6
end
L0_0._onFilterLog = L1_1
L0_0 = CommandDebuggerFUNCBaseClass
function L1_1(A0_7, A1_8)
  return A1_8
end
L0_0.filterLog = L1_1
