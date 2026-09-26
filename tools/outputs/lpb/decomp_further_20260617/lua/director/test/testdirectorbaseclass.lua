require("/Director/DirectorBaseClass")
_defineBaseClass("TestDirectorBaseClass", "DirectorBaseClass")
function TestDirectorBaseClass.init(A0_0, ...)
  local L2_2, L3_3
  L2_2 = A0_0.testDirectorWork
  L3_3 = {
    {
      "_assignForChild",
      32
    }
  }
  L2_2._temp = L3_3
  L2_2 = A0_0.testDirectorWork
  L3_3 = {
    {"test", "boolean"},
    {
      "_assignForChild",
      32
    }
  }
  L2_2._sync = L3_3
  L2_2 = A0_0.testDirectorWork
  L3_3 = {
    {
      "info",
      1,
      {"test"}
    }
  }
  L2_2._tag = L3_3
  L3_3 = A0_0
  L2_2 = A0_0.initAsTestDirector
  L2_2(L3_3, ...)
end
function TestDirectorBaseClass.initAsTestDirector(A0_4)
  local L1_5
end
function TestDirectorBaseClass.processUpdateWork(A0_6, A1_7, A2_8)
  if A1_7 == "testDirectorWork" then
  end
end
