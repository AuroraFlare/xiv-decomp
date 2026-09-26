local L0_0, L1_1
L0_0 = JudgeBaseClass
function L1_1(A0_2)
  A0_2:_callSuperClassFunc("_onInit")
  A0_2:initText()
  A0_2:init()
end
L0_0._onInit = L1_1
L0_0 = JudgeBaseClass
function L1_1(A0_3)
  local L1_4
end
L0_0.initText = L1_1
L0_0 = JudgeBaseClass
function L1_1(A0_5)
  local L1_6
end
L0_0.init = L1_1
L0_0 = JudgeBaseClass
function L1_1(A0_7, A1_8, A2_9)
  local L3_10
  if not A2_9 then
    L3_10 = A1_8
    L3_10 = _string.gsub(L3_10, ".+/", "")
    L3_10 = string:lowerCamelCase(unpack(string:split(L3_10, "_")))
    L3_10 = L3_10 .. "Sheet"
  end
  return (_createActor(L3_10, "SpreadSheet", L3_10 ~= nil, A1_8))
end
L0_0.prepareSpreadSheet = L1_1
L0_0 = JudgeBaseClass
function L1_1(A0_11, A1_12, A2_13)
  if A2_13 == nil then
    A2_13 = A1_12
    A2_13 = _string.gsub(A2_13, ".+/", "")
    A2_13 = string:lowerCamelCase(unpack(string:split(A2_13, "_")))
    A2_13 = A2_13 .. "Sheet"
  end
  _getActorByName(A2_13):_delete()
end
L0_0.unprepareSpreadSheet = L1_1
