require("/Command/Game/BattleCommandBaseClass")
_defineClass("ShotCommand", "BattleCommandBaseClass")
function ShotCommand.isAttackCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function ShotCommand.getCommandRangeTargettingMode(A0_2, A1_3, A2_4, A3_5)
  local L4_6
  L4_6 = 1
  return L4_6
end
function ShotCommand.getUseAmmoMax(A0_7)
  local L1_8
  L1_8 = -2
  return L1_8
end
function ShotCommand.getCommandLevelAdjustLevelMax(A0_9)
  local L1_10, L2_11
  L1_10 = -1
  L2_11 = -1
  return L1_10, L2_11
end
