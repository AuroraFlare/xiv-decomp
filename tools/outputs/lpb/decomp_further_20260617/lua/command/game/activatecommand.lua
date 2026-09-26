require("/Command/Game/GameCommandBaseClass")
_defineClass("ActivateCommand", "GameCommandBaseClass")
function ActivateCommand.isUseActionGauge(A0_0)
  local L1_1
  L1_1 = false
  return L1_1
end
function ActivateCommand.isBattleCommand(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function ActivateCommand.canFireDetail(A0_4, A1_5)
  if A0_4:getCommandId() == 21001 then
    if A1_5:_getActorMainStat() == 0 then
      return true, 0
    else
      return false, 32503
    end
  elseif A0_4:getCommandId() == 21002 then
    if A1_5:_getActorMainStat() == 2 then
      return true, 0
    else
      return false, 32502
    end
  end
  return true, 0
end
function ActivateCommand.isActionMenu(A0_6)
  local L1_7
  L1_7 = false
  return L1_7
end
