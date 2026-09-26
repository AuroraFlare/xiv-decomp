require("/Command/System/SystemCommandBaseClass")
_defineClass("PartyKickCommand", "SystemCommandBaseClass")
function PartyKickCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
  L12_12 = A1_1
  L11_11 = A1_1.isPartyLeader
  L11_11 = L11_11(L12_12)
  if not L11_11 then
    L11_11 = false
    return L11_11
  end
  L12_12 = A1_1
  L11_11 = A1_1.getPlayerParty
  L11_11 = L11_11(L12_12)
  L12_12 = L11_11
  L11_11 = L11_11._countMember
  L11_11 = L11_11(L12_12)
  if L11_11 == 1 then
    L11_11 = false
    return L11_11
  end
  L11_11 = _isInstanceOf
  L12_12 = A6_6
  L13_13 = "CharaBaseClass"
  L11_11 = L11_11(L12_12, L13_13)
  L12_12 = type
  L13_13 = A2_2
  L12_12 = L12_12(L13_13)
  L12_12 = L12_12 == "string"
  if L11_11 and not L12_12 then
    L14_14 = A1_1
    L13_13 = A1_1.getPlayerParty
    L13_13 = L13_13(L14_14)
    L14_14 = L13_13
    L13_13 = L13_13._isMember
    L13_13 = L13_13(L14_14, L15_15)
    if not L13_13 then
      L13_13 = false
      return L13_13
    end
    if A6_6 == A1_1 then
      L13_13 = false
      return L13_13
    end
  else
    if L12_12 and not L11_11 then
      L14_14 = A1_1
      L13_13 = A1_1.getPlayerParty
      L13_13 = L13_13(L14_14)
      L14_14 = false
      for L18_18 = 1, L16_16(L17_17) do
        if L13_13:_getMemberDisplayName(L18_18) == A2_2 then
          L14_14 = true
          if L13_13:_isExistInClientMember(L18_18) and L13_13:_getMember(L18_18) == A1_1 then
            return false
          end
        end
      end
      return L14_14
    else
    end
  end
  L13_13 = true
  return L13_13
end
