require("/Command/Game/BattleCommandBaseClass")
_defineClass("ThrowCommand", "BattleCommandBaseClass")
function ThrowCommand.isThrowCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function ThrowCommand.getCommandRangeTargettingMode(A0_2, A1_3, A2_4, A3_5)
  local L4_6
  L4_6 = 1
  return L4_6
end
function ThrowCommand.getFrequency(A0_7)
  local L1_8
  return L1_8
end
function ThrowCommand.getUseAmmoMax(A0_9)
  local L1_10
  L1_10 = -2
  return L1_10
end
function ThrowCommand.getCommandLevelAdjustLevelMax(A0_11)
  local L1_12, L2_13
  L1_12 = -1
  L2_13 = -1
  return L1_12, L2_13
end
