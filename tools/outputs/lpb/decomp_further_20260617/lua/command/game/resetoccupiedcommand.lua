require("/Command/Game/GameCommandBaseClass")
_defineClass("ResetOccupiedCommand", "GameCommandBaseClass")
function ResetOccupiedCommand.canFireOnDead(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function ResetOccupiedCommand.isUseActionGauge(A0_2)
  local L1_3
  L1_3 = false
  return L1_3
end
function ResetOccupiedCommand.isActionMenu(A0_4)
  local L1_5
  L1_5 = false
  return L1_5
end
