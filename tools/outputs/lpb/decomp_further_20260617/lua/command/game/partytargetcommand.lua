require("/Command/Game/GameCommandBaseClass")
_defineClass("PartyTargetCommand", "GameCommandBaseClass")
function PartyTargetCommand.isAvailableOnSit(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function PartyTargetCommand.isUseActionGauge(A0_2)
  local L1_3
  L1_3 = false
  return L1_3
end
function PartyTargetCommand.canAimForRelation(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = true
  L2_6 = true
  L3_7 = true
  return L1_5, L2_6, L3_7
end
function PartyTargetCommand.canFireForRelation(A0_8)
  local L1_9, L2_10, L3_11
  L1_9 = true
  L2_10 = true
  L3_11 = true
  return L1_9, L2_10, L3_11
end
function PartyTargetCommand.isHostilityCommand(A0_12)
  local L1_13
  L1_13 = false
  return L1_13
end
function PartyTargetCommand.canFireOnDead(A0_14)
  local L1_15
  L1_15 = true
  return L1_15
end
function PartyTargetCommand.canFireForDeadTarget(A0_16)
  local L1_17
  L1_17 = true
  return L1_17
end
function PartyTargetCommand.isActionMenu(A0_18)
  local L1_19
  L1_19 = false
  return L1_19
end
