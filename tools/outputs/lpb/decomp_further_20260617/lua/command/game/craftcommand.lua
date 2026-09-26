require("/Command/Game/GameCommandBaseClass")
_defineClass("CraftCommand", "GameCommandBaseClass")
function CraftCommand.isUseActionGauge(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function CraftCommand.canAimForRelation(A0_2)
  if A0_2:getCommandId() == 22012 or A0_2:getCommandId() == 22016 then
    return true, true, false
  else
    return true, false, false
  end
end
