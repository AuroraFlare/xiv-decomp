require("/Command/System/SystemCommandBaseClass")
_defineClass("PartyBreakupCommand", "SystemCommandBaseClass")
function PartyBreakupCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  if not A1_1:isPartyLeader() then
    return false
  end
  if A1_1:getPlayerParty():_countMember() == 1 then
    return false
  end
  return true
end
