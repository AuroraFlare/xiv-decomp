require("/Group/GroupBaseClass")
_defineBaseClass("ContentGroupBaseClass", "GroupBaseClass")
function ContentGroupBaseClass.isPropertyEnabled(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.contentGroupWork
  L2_2 = L2_2.property
  L2_2 = L2_2[A1_1]
  return L2_2
end
function ContentGroupBaseClass.init(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9
  L1_4 = A0_3.contentGroupWork
  L5_8 = "array"
  L6_9 = 32
  L5_8 = "_globalTemp"
  L6_9 = "nesting"
  L5_8 = {L6_9, 16}
  L6_9 = "_assignForChild"
  L1_4._sync = L2_5
  L1_4 = A0_3.contentGroupWork
  L1_4 = L1_4._globalTemp
  L5_8 = "member"
  L1_4._nesting = L2_5
  L1_4 = A0_3.contentGroupWork
  L5_8 = 1
  L6_9 = {
    "_globalTemp",
    "director"
  }
  L5_8 = "property"
  L6_9 = 1
  L1_4._tag = L2_5
  L1_4 = A0_3._isMember
  L6_9 = L3_6(L4_7)
  L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8, L6_9, L3_6(L4_7))
  if L1_4 then
    L1_4 = A0_3._getKind
    L1_4 = L1_4(L2_5)
    if L1_4 ~= 30001 then
      L1_4 = A0_3._getKind
      L1_4 = L1_4(L2_5)
    elseif L1_4 == 30006 then
      L1_4 = worldMaster
      L1_4 = L1_4.notify
      L1_4(L2_5, L3_6, L4_7)
    end
  end
  L1_4 = A0_3._isMember
  L6_9 = L3_6(L4_7)
  L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8, L6_9, L3_6(L4_7))
  if L1_4 then
    L1_4 = worldMaster
    L1_4 = L1_4._getMyPlayer
    L1_4 = L1_4(L2_5)
    L1_4 = L1_4.getDepictionJudge
    L1_4 = L1_4(L2_5)
    for L5_8 = 1, L3_6(L4_7) do
      L6_9 = A0_3._isExistInClientMember
      L6_9 = L6_9(A0_3, L5_8)
      if L6_9 then
        L6_9 = A0_3._getMember
        L6_9 = L6_9(A0_3, L5_8)
        if _isInstanceOf(L6_9, "CharaBaseClass") then
          L1_4:judgeNameplate(L6_9)
        end
      end
    end
    L1_4 = desktopWidget
    L1_4 = L1_4.processUpdateMyPlayerRestrictionByContents
    L1_4(L2_5)
  end
end
function ContentGroupBaseClass._onUpdateWork(A0_10, A1_11, A2_12)
  A0_10:_callSuperClassFunc("_onUpdateWork", A1_11, A2_12)
  if A2_12 == "_init" or A1_11 == "contentGroupWork" and A2_12 == "property" then
    desktopWidget:processUpdateMyPlayerRestrictionByContents()
  end
end
function ContentGroupBaseClass._onUpdateMember(A0_13, A1_14, A2_15)
  A0_13:_callSuperClassFunc("_onUpdateMember", A1_14, A2_15)
  if A0_13:_isMember(worldMaster:_getMyPlayer()) then
    if _isInstanceOf(A1_14, "CharaBaseClass") then
      worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(A1_14)
    end
    if _isInstanceOf(A1_14, "CharaBaseClass") and A1_14 == worldMaster:_getMyPlayer() then
      desktopWidget:processUpdateMyPlayerRestrictionByContents()
    end
  end
end
function ContentGroupBaseClass._onUpdateMemberInformation(A0_16, A1_17)
  local L2_18
  L2_18 = A0_16._callSuperClassFunc
  L2_18(A0_16, "_onUpdateMemberInformation", A1_17)
  L2_18 = A0_16._isMember
  L2_18 = L2_18(A0_16, worldMaster:_getMyPlayer())
  if L2_18 then
    L2_18 = A0_16._isExistInClientMember
    L2_18 = L2_18(A0_16, A1_17)
    if L2_18 then
      L2_18 = A0_16._getMember
      L2_18 = L2_18(A0_16, A1_17)
      if _isInstanceOf(L2_18, "CharaBaseClass") then
        worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(L2_18)
      end
    end
  end
end
function ContentGroupBaseClass._onUpdateGroupInformation(A0_19, A1_20)
  A0_19:_callSuperClassFunc("_onUpdateGroupInformation", A1_20)
end
function ContentGroupBaseClass._onFinalize(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
  L1_22 = A0_21._callSuperClassFunc
  L1_22(L2_23, L3_24)
  L1_22 = A0_21._isMember
  L6_27 = L3_24(L4_25)
  L1_22 = L1_22(L2_23, L3_24, L4_25, L5_26, L6_27, L3_24(L4_25))
  if L1_22 then
    L1_22 = worldMaster
    L1_22 = L1_22._getMyPlayer
    L1_22 = L1_22(L2_23)
    L1_22 = L1_22.getDepictionJudge
    L1_22 = L1_22(L2_23)
    for L5_26 = 1, L3_24(L4_25) do
      L6_27 = A0_21._isExistInClientMember
      L6_27 = L6_27(A0_21, L5_26)
      if L6_27 then
        L6_27 = A0_21._getMember
        L6_27 = L6_27(A0_21, L5_26)
        if _isInstanceOf(L6_27, "CharaBaseClass") then
          L1_22:judgeNameplate(L6_27)
        end
      end
    end
    L1_22 = desktopWidget
    L1_22 = L1_22.processUpdateMyPlayerRestrictionByContents
    L1_22(L2_23)
  end
  L1_22 = A0_21._isMember
  L6_27 = L3_24(L4_25)
  L1_22 = L1_22(L2_23, L3_24, L4_25, L5_26, L6_27, L3_24(L4_25))
  if L1_22 then
    L1_22 = A0_21._getKind
    L1_22 = L1_22(L2_23)
    if L1_22 ~= 30001 then
      L1_22 = A0_21._getKind
      L1_22 = L1_22(L2_23)
    elseif L1_22 == 30006 then
      L1_22 = worldMaster
      L1_22 = L1_22.notify
      L1_22(L2_23, L3_24, L4_25)
    end
  end
end
function ContentGroupBaseClass.getDirector(A0_28)
  if A0_28.contentGroupWork._globalTemp.director == nil or not A0_28.contentGroupWork._globalTemp.director:_isAlive() then
    return nil
  else
    return A0_28.contentGroupWork._globalTemp.director
  end
end
