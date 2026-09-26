require("/Command/System/SystemCommandBaseClass")
_defineClass("PartyInviteCommand", "SystemCommandBaseClass")
function PartyInviteCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
  L12_12 = A1_1
  L11_11 = A1_1.isPartyLeader
  L11_11 = L11_11(L12_12)
  if not L11_11 then
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
    L13_13 = A1_1.getPlayerParty
    L13_13 = L13_13(L14_14)
    L13_13 = L13_13._isMember
    L13_13 = L13_13(L14_14, L15_15)
    if L13_13 then
      L13_13 = false
      return L13_13
    end
    L13_13 = A1_1.hasRelationGroup
    L13_13 = L13_13(L14_14, L15_15, L16_16)
    if L13_13 then
      L13_13 = false
      return L13_13
    end
  else
    if L12_12 and not L11_11 then
      L13_13 = A1_1.getPlayerParty
      L13_13 = L13_13(L14_14)
      for L17_17 = 1, L15_15(L16_16) do
        if L13_13:_getMemberDisplayName(L17_17) == A2_2 then
          return false
        end
      end
      L17_17 = A2_2
      if L14_14 then
        return L14_14
      end
    else
    end
  end
  L13_13 = true
  return L13_13
end
