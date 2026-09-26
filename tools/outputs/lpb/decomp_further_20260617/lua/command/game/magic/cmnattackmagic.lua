require("/Command/Game/Magic/MagicBaseClass")
_defineClass("CmnAttackMagic", "MagicBaseClass")
function CmnAttackMagic.getCommandLevelAdjustLevelMax(A0_0)
  local L1_1, L2_2
  L1_1 = -1
  L2_2 = 10
  return L1_1, L2_2
end
function CmnAttackMagic.getCommandParam1AdjustForHighLevelUse(A0_3, A1_4, A2_5, A3_6)
  local L4_7
  L4_7 = 0.25
  return L4_7
end
function CmnAttackMagic.getCommandParam2AdjustForHighLevelUse(A0_8, A1_9, A2_10, A3_11)
  local L4_12
  L4_12 = 0
  return L4_12
end
function CmnAttackMagic.getCommandParam3AdjustForHighLevelUse(A0_13, A1_14, A2_15, A3_16)
  local L4_17
  L4_17 = 0
  return L4_17
end
function CmnAttackMagic.getCommandHPCost(A0_18, A1_19, A2_20, A3_21)
  local L4_22, L5_23, L6_24
  L4_22 = 0
  L6_24 = A0_18
  L5_23 = A0_18.getCommandId
  L5_23 = L5_23(L6_24)
  L6_24 = L5_23
  if L6_24 == 28622 then
  else
  end
  if L6_24 == 28623 then
    L4_22 = A0_18:getCommandParam3()
    break
  else
  end
  return L4_22
end
