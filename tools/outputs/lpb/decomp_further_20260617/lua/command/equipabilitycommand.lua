require("/Command/Game/GameCommandBaseClass")
_defineClass("EquipAbilityCommand", "GameCommandBaseClass")
function EquipAbilityCommand.isAvailableOnSit(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function EquipAbilityCommand.isUseActionGauge(A0_2)
  local L1_3
  L1_3 = false
  return L1_3
end
function EquipAbilityCommand.getCanCommandErrTextIdForDead(A0_4)
  local L1_5
  L1_5 = 32708
  return L1_5
end
