require("/Command/Game/GameCommandBaseClass")
_defineClass("NegotiationCommand", "GameCommandBaseClass")
function NegotiationCommand.canAimForRelation(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = false
  L2_2 = false
  L3_3 = true
  return L1_1, L2_2, L3_3
end
function NegotiationCommand.canFireForRelation(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = false
  L2_6 = false
  L3_7 = true
  return L1_5, L2_6, L3_7
end
function NegotiationCommand.getCommandRangeCode(A0_8, A1_9, A2_10)
  local L3_11
  L3_11 = 2
  return L3_11
end
function NegotiationCommand.getCommandTargettingMode(A0_12, A1_13, A2_14)
  local L3_15
  L3_15 = 1
  return L3_15
end
function NegotiationCommand.isUseActionGauge(A0_16)
  local L1_17
  L1_17 = false
  return L1_17
end
