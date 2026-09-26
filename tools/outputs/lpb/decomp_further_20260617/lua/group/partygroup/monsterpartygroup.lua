require("/Group/PartyGroup/PartyGroupBaseClass")
_defineClass("MonsterPartyGroup", "PartyGroupBaseClass")
require("/Group/PartyGroup/MonsterPartyGroup_battle")
function MonsterPartyGroup.initAsPartyGroup(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L1_1 = worldMaster
  L2_2 = L1_1
  L1_1 = L1_1._getMyPlayer
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1
  L1_1 = L1_1.getPlayerParty
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1
  L1_1 = L1_1._getOccupancyGroup
  L1_1 = L1_1(L2_2)
  if L1_1 == A0_0 then
    L2_2 = worldMaster
    L2_2 = L2_2._getMyPlayer
    L2_2 = L2_2(L3_3)
    L2_2 = L2_2.getDepictionJudge
    L2_2 = L2_2(L3_3)
    for L6_6 = 1, L4_4(L5_5) do
      if A0_0:_isExistInClientMember(L6_6) then
        L2_2:judgeNameplate(A0_0:_getMember(L6_6))
      end
    end
  end
end
function MonsterPartyGroup._onUpdateMember(A0_7, A1_8, A2_9)
  A0_7:_callSuperClassFunc("_onUpdateMember", A1_8, A2_9)
  if worldMaster:_getMyPlayer():getPlayerParty():_getOccupancyGroup() == A0_7 and _isInstanceOf(A1_8, "CharaBaseClass") then
    worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A1_8)
  end
end
function MonsterPartyGroup._onUpdateMemberInformation(A0_10, A1_11)
  A0_10:_callSuperClassFunc("_onUpdateMemberInformation", A1_11)
  if worldMaster:_getMyPlayer():getPlayerParty():_getOccupancyGroup() == A0_10 and A0_10:_isExistInClientMember(A1_11) then
    worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_10:_getMember(A1_11))
  end
end
function MonsterPartyGroup._onUpdateGroupInformation(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18
  L2_14 = A0_12._callSuperClassFunc
  L2_14(L3_15, L4_16, L5_17)
  L2_14 = worldMaster
  L2_14 = L2_14._getMyPlayer
  L2_14 = L2_14(L3_15)
  L2_14 = L2_14.getDepictionJudge
  L2_14 = L2_14(L3_15)
  for L6_18 = 1, L4_16(L5_17) do
    if A0_12:_isExistInClientMember(L6_18) then
      L2_14:judgeNameplate(A0_12:_getMember(L6_18))
    end
  end
end
function MonsterPartyGroup._onFinalize(A0_19)
  A0_19:_callSuperClassFunc("_onFinalize")
end
