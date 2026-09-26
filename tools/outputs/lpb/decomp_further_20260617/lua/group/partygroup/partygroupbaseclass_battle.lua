local L0_0, L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_2)
  local L1_3
  L1_3 = false
  return L1_3
end
L0_0.isPlayerPartyGroup = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9
  if A1_5 == nil then
    A1_5 = 1
  end
  if L2_6 then
    for L5_9 = 1, L3_7(L4_8) do
      if A0_4:getPartyMember(L5_9) ~= nil then
        A1_5 = A1_5 - 1
        if A1_5 == 0 then
          return (A0_4:getPartyMember(L5_9))
        end
      end
    end
  end
  return L2_6
end
L0_0.getPartyMemberBeAlive = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_10)
  local L1_11
  L1_11 = A0_10.partyGroupWork
  L1_11 = L1_11._globalTemp
  L1_11 = L1_11.owner
  return L1_11
end
L0_0.getPartyOwner = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_12)
  local L1_13
  L1_13 = 6
  return L1_13
end
L0_0.getObjectClassId = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25
  L2_16 = A0_14
  L1_15 = A0_14._countMember
  L1_15 = L1_15(L2_16)
  L2_16 = 0
  L3_17 = 0
  L4_18 = 0
  L5_19 = 0
  L6_20 = 0
  L7_21 = 0
  for L11_25 = 1, L1_15 do
    if A0_14:getPartyMember(L11_25) ~= nil then
      if not A0_14:getPartyMember(L11_25):isNotoriousMonster() then
        L2_16 = L2_16 + A0_14:getPartyMember(L11_25):getPotencial()
        L3_17 = L3_17 + A0_14:getPartyMember(L11_25):getStateMainSkillLevel()
        L7_21 = L7_21 + 1
      else
        L4_18 = L4_18 + 1
        L6_20 = L6_20 + A0_14:getPartyMember(L11_25):getPotencial()
        L5_19 = L5_19 + A0_14:getPartyMember(L11_25):getStateMainSkillLevel()
      end
    end
  end
  if L7_21 == 0 then
    if L4_18 > 0 then
      L2_16 = L6_20
      L3_17 = L5_19 / L4_18
    else
      return L8_22, L9_23
    end
  else
    L3_17 = L3_17 / L7_21
  end
  if L1_15 == 1 then
  elseif L1_15 == 2 then
    L2_16 = L2_16 * 1.5
  elseif L1_15 == 3 then
    L2_16 = L2_16 * 1.4
  elseif L1_15 == 4 then
    L2_16 = L2_16 * 1.3
  elseif L1_15 == 5 then
    L2_16 = L2_16 * 1.2
  else
    L2_16 = L2_16 * 1.1
  end
  return L8_22, L9_23
end
L0_0.getAllMembersPotencial = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_26)
  A0_26.partyGroupWork._globalTemp._nesting = {
    {"owner", "member"}
  }
  A0_26.partyGroupWork._tag = {
    {
      "leader",
      1,
      {
        "_globalTemp",
        "owner"
      }
    }
  }
  A0_26:_bindWork(400001, "partyGroupWork", "_globalTemp", "owner")
end
L0_0.initForBattle = L1_1
L0_0 = PartyGroupBaseClass
function L1_1(A0_27, A1_28)
  if A0_27:_isExistInClientMember(A1_28) then
    return A0_27:_getMember(A1_28)
  end
end
L0_0.getPartyMember = L1_1
