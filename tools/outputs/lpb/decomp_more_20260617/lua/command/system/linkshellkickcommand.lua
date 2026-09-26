require("/Command/System/SystemCommandBaseClass")
_defineClass("LinkshellKickCommand", "SystemCommandBaseClass")
function LinkshellKickCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
  if A6_6 == nil then
    if A1_1 == nil then
      L11_11 = false
      return L11_11
    end
    L12_12 = A1_1
    L11_11 = A1_1._isAlive
    L11_11 = L11_11(L12_12)
    if L11_11 == false then
      L11_11 = false
      return L11_11
    end
    L12_12 = A1_1
    L11_11 = A1_1.isPlayer
    L11_11 = L11_11(L12_12)
    if L11_11 == false then
      L11_11 = false
      return L11_11
    end
  else
    if A1_1 == nil or A6_6 == nil then
      L11_11 = false
      return L11_11
    end
    L12_12 = A1_1
    L11_11 = A1_1._isAlive
    L11_11 = L11_11(L12_12)
    if L11_11 ~= false then
      L12_12 = A6_6
      L11_11 = A6_6._isAlive
      L11_11 = L11_11(L12_12)
    elseif L11_11 == false then
      L11_11 = false
      return L11_11
    end
    L12_12 = A1_1
    L11_11 = A1_1.isPlayer
    L11_11 = L11_11(L12_12)
    if L11_11 ~= false then
      L12_12 = A6_6
      L11_11 = A6_6.isPlayer
      L11_11 = L11_11(L12_12)
    elseif L11_11 == false then
      L11_11 = false
      return L11_11
    end
  end
  L11_11 = type
  L12_12 = A2_2
  L11_11 = L11_11(L12_12)
  if L11_11 ~= "string" then
    L11_11 = false
    return L11_11
  end
  L12_12 = A1_1
  L11_11 = A1_1.getCommunityGroupCurrent
  L11_11 = L11_11(L12_12, L13_13)
  if L11_11 == nil then
    L12_12 = false
    return L12_12
  end
  L12_12 = L11_11._isAlive
  L12_12 = L12_12(L13_13)
  if L12_12 == false then
    L12_12 = false
    return L12_12
  end
  L12_12 = L11_11.getUniqueIdentifier
  L12_12 = L12_12(L13_13)
  if L12_12 ~= A2_2 then
    L12_12 = false
    return L12_12
  end
  L12_12 = L11_11._isMember
  L12_12 = L12_12(L13_13, L14_14)
  if L12_12 == false then
    L12_12 = false
    return L12_12
  end
  L12_12 = L11_11.getMemberRank
  L12_12 = L12_12(L13_13, L14_14)
  if L12_12 < 7 then
    L12_12 = false
    return L12_12
  end
  if A6_6 == nil then
    L12_12 = 0
    for L16_16 = 1, L14_14(L15_15) do
      if L11_11:getMemberUniqueIdentifier(L16_16) == A3_3 then
        L12_12 = L16_16
        break
      end
    end
    if L12_12 == 0 then
      return L13_13
    end
    L16_16 = L12_12
    if L13_13 <= L14_14 then
      return L13_13
    end
  else
    L12_12 = L11_11._isMember
    L12_12 = L12_12(L13_13, L14_14)
    if L12_12 == false then
      L12_12 = false
      return L12_12
    end
    L12_12 = L11_11.getMemberRank
    L12_12 = L12_12(L13_13, L14_14)
    if L12_12 <= L13_13 then
      L12_12 = false
      return L12_12
    end
  end
  L12_12 = true
  return L12_12
end
