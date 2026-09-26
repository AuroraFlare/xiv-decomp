require("/Group/PartyGroup/PartyGroupBaseClass")
_defineClass("PlayerPartyGroup", "PartyGroupBaseClass")
function PlayerPartyGroup.isPlayerPartyGroup(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function PlayerPartyGroup.initAsPartyGroup(A0_2)
  local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L1_3 = A0_2._isMember
  L6_8 = L3_5(L4_6)
  L1_3 = L1_3(L2_4, L3_5, L4_6, L5_7, L6_8, L3_5(L4_6))
  if L1_3 then
    L1_3 = desktopWidget
    L1_3 = L1_3.processUpdateGroupInformation
    L1_3(L2_4, L3_5, L4_6, L5_7)
  end
  L1_3 = A0_2._isMember
  L6_8 = L3_5(L4_6)
  L1_3 = L1_3(L2_4, L3_5, L4_6, L5_7, L6_8, L3_5(L4_6))
  if L1_3 then
    L1_3 = worldMaster
    L1_3 = L1_3._getMyPlayer
    L1_3 = L1_3(L2_4)
    L1_3 = L1_3.getDepictionJudge
    L1_3 = L1_3(L2_4)
    for L5_7 = 1, L3_5(L4_6) do
      L6_8 = A0_2._isExistInClientMember
      L6_8 = L6_8(A0_2, L5_7)
      if L6_8 then
        L6_8 = L1_3.judgeNameplate
        L6_8(L1_3, A0_2:_getMember(L5_7))
      end
    end
    if L2_4 ~= nil then
      for L6_8 = 1, L4_6(L5_7) do
        if L2_4:_isExistInClientMember(L6_8) then
          L1_3:judgeNameplate(L2_4:_getMember(L6_8))
        end
      end
    end
  end
end
function PlayerPartyGroup._onUpdateMember(A0_9, A1_10, A2_11)
  A0_9:_callSuperClassFunc("_onUpdateMember", A1_10, A2_11)
  if A0_9:_isMember(worldMaster:_getMyPlayer()) then
    desktopWidget:processUpdateGroupInformation(worldMaster:_getMyPlayer(), A0_9:_getKind(), A0_9)
    if _isInstanceOf(A1_10, "CharaBaseClass") then
      worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A1_10)
    end
  end
end
function PlayerPartyGroup._onUpdateMemberInformation(A0_12, A1_13)
  A0_12:_callSuperClassFunc("_onUpdateMemberInformation", A1_13)
  if A0_12:_isMember(worldMaster:_getMyPlayer()) then
    desktopWidget:processUpdateGroupInformation(worldMaster:_getMyPlayer(), A0_12:_getKind(), A0_12)
    if A0_12:_isExistInClientMember(A1_13) then
      worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A0_12:_getMember(A1_13))
    end
  end
end
function PlayerPartyGroup._onUpdateGroupInformation(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19, L6_20, L7_21
  L2_16 = A0_14._callSuperClassFunc
  L2_16(L3_17, L4_18, L5_19)
  L2_16 = A0_14._isMember
  L7_21 = L4_18(L5_19)
  L2_16 = L2_16(L3_17, L4_18, L5_19, L6_20, L7_21, L4_18(L5_19))
  if L2_16 then
    L2_16 = desktopWidget
    L2_16 = L2_16.processUpdateGroupInformation
    L2_16(L3_17, L4_18, L5_19, L6_20)
    L2_16 = worldMaster
    L2_16 = L2_16._getMyPlayer
    L2_16 = L2_16(L3_17)
    L2_16 = L2_16.getDepictionJudge
    L2_16 = L2_16(L3_17)
    if A1_15 ~= nil then
      for L6_20 = 1, L4_18(L5_19) do
        L7_21 = A1_15._isExistInClientMember
        L7_21 = L7_21(A1_15, L6_20)
        if L7_21 then
          L7_21 = L2_16.judgeNameplate
          L7_21(L2_16, A1_15:_getMember(L6_20))
        end
      end
    end
    if L3_17 ~= nil then
      for L7_21 = 1, L5_19(L6_20) do
        if L3_17:_isExistInClientMember(L7_21) then
          L2_16:judgeNameplate(L3_17:_getMember(L7_21))
        end
      end
    end
  end
end
function PlayerPartyGroup._onFinalize(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27
  L1_23 = A0_22._callSuperClassFunc
  L1_23(L2_24, L3_25)
  L1_23 = A0_22._isMember
  L5_27 = L3_25(L4_26)
  L1_23 = L1_23(L2_24, L3_25, L4_26, L5_27, L3_25(L4_26))
  if L1_23 then
    L1_23 = worldMaster
    L1_23 = L1_23._getMyPlayer
    L1_23 = L1_23(L2_24)
    L1_23 = L1_23.getDepictionJudge
    L1_23 = L1_23(L2_24)
    for L5_27 = 1, L3_25(L4_26) do
      if A0_22:_isExistInClientMember(L5_27) then
        L1_23:judgeNameplate(A0_22:_getMember(L5_27))
      end
    end
  end
end
