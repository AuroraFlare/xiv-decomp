require("/Command/Game/Magic/MagicBaseClass")
_defineClass("CmnDrainMagic", "MagicBaseClass")
function CmnDrainMagic.canFireForDeadTarget(A0_0)
  local L1_1
  L1_1 = A0_0.getCommandId
  L1_1 = L1_1(A0_0)
  if L1_1 == 28660 then
  elseif L1_1 == 28661 then
  elseif L1_1 == 28663 then
  else
  end
  if L1_1 == 28664 then
    break
  else
  end
  do break end
  return false
end
function CmnDrainMagic.canFireForLiveTarget(A0_2)
  local L1_3
  L1_3 = A0_2.getCommandId
  L1_3 = L1_3(A0_2)
  if L1_3 == 28660 then
  elseif L1_3 == 28661 then
  elseif L1_3 == 28663 then
  else
  end
  if L1_3 == 28664 then
    break
  else
  end
  do break end
  return true
end
function CmnDrainMagic.getCommandLevelAdjustLevelMax(A0_4)
  local L1_5, L2_6
  L1_5 = -1
  L2_6 = 10
  return L1_5, L2_6
end
function CmnDrainMagic.getCommandParam1AdjustForHighLevelUse(A0_7, A1_8, A2_9, A3_10)
  local L4_11
  L4_11 = 0
  return L4_11
end
function CmnDrainMagic.getCommandParam2AdjustForHighLevelUse(A0_12, A1_13, A2_14, A3_15)
  local L4_16
  L4_16 = 0
  return L4_16
end
function CmnDrainMagic.getCommandParam3AdjustForHighLevelUse(A0_17, A1_18, A2_19, A3_20)
  local L4_21
  L4_21 = 0
  return L4_21
end
function CmnDrainMagic.canUseCommandRangeAreaSelect(A0_22, A1_23, A2_24, A3_25)
  local L4_26
  L4_26 = A0_22.getCommandId
  L4_26 = L4_26(A0_22)
  if L4_26 == 28660 then
  elseif L4_26 == 28661 then
  elseif L4_26 == 28663 then
  else
  end
  if L4_26 == 28664 then
    break
  else
  end
  if not A1_23:isEquippingMagicWeapon(A2_24) then
  else
    break
  end
  return true
end
