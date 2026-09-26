require("/Command/Game/Magic/MagicBaseClass")
_defineClass("CmnCureMagic", "MagicBaseClass")
function CmnCureMagic.getCommandParam1AdjustForHighLevelUse(A0_0, A1_1, A2_2, A3_3)
  local L4_4
  L4_4 = 0
  return L4_4
end
function CmnCureMagic.getCommandParam2AdjustForHighLevelUse(A0_5, A1_6, A2_7, A3_8)
  local L4_9
  L4_9 = 0
  return L4_9
end
function CmnCureMagic.getCommandParam3AdjustForHighLevelUse(A0_10, A1_11, A2_12, A3_13)
  local L4_14
  L4_14 = 0
  return L4_14
end
function CmnCureMagic.getCommandHPCost(A0_15, A1_16, A2_17, A3_18)
  local L4_19, L5_20, L6_21
  L4_19 = 0
  L6_21 = A0_15
  L5_20 = A0_15.getCommandId
  L5_20 = L5_20(L6_21)
  L6_21 = L5_20
  if L6_21 == 28666 then
  elseif L6_21 == 28667 then
  elseif L6_21 == 28668 then
  else
  end
  if L6_21 == 28669 then
    L4_19 = A0_15:getCommandParam3()
    break
  else
  end
  return L4_19
end
function CmnCureMagic.canUseCommandRangeAreaSelect(A0_22, A1_23, A2_24, A3_25)
  local L4_26
  L4_26 = false
  return L4_26
end
