require("/Group/GroupBaseClass")
_defineBaseClass("PartyGroupBaseClass", "GroupBaseClass")
require("/Group/PartyGroup/PartyGroupBaseClass_battle")
function PartyGroupBaseClass.getPartyLeader(A0_0)
  if A0_0:getPartyOwner() ~= nil and A0_0:getPartyOwner():_isAlive() then
    return (A0_0:getPartyOwner())
  end
  return nil
end
function PartyGroupBaseClass.isPartyLeader(A0_1, A1_2)
  local L2_3
  L2_3 = A0_1.getPartyOwner
  L2_3 = L2_3(A0_1)
  if type(A1_2) == "number" then
    return L2_3 ~= nil and A0_1:_isMember(L2_3, A1_2)
  else
    return L2_3 == A1_2
  end
end
function PartyGroupBaseClass.init(A0_4)
  A0_4.partyGroupWork._temp = {
    {
      "_assignForChild",
      128
    }
  }
  A0_4.partyGroupWork._sync = {
    {
      "_globalTemp",
      "nesting",
      8
    }
  }
  A0_4:initForBattle()
  A0_4:initAsPartyGroup()
end
function PartyGroupBaseClass.initAsPartyGroup(A0_5)
  local L1_6
end
function PartyGroupBaseClass._onUpdateWork(A0_7, A1_8, A2_9)
  if (A2_9 == "_init" or A1_8 == "partyGroupWork" and A2_9 == "leader") and A0_7:_isMember(worldMaster:_getMyPlayer()) then
    desktopWidget:processUpdateGroupInformation(worldMaster:_getMyPlayer(), A0_7:_getKind(), A0_7)
  end
end
