require("/Command/CommandBaseClass")
_defineClass("ItemCommand", "CommandBaseClass")
function ItemCommand.isBattleCommand(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function ItemCommand.canFire(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12)
  if not A2_4:canUse(A1_3, A4_6, A5_7, A6_8, A7_9, A8_10, A9_11, A10_12) then
    return false
  end
  return true
end
