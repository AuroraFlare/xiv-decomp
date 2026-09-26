require("/Group/CommunityGroup/CommunityGroupBaseClass")
_defineClass("RetainerGroup", "CommunityGroupBaseClass")
function RetainerGroup.initAsCommunityGroup(A0_0)
  local L1_1
  L1_1._sync = {
    {
      "_memberSave",
      "array",
      A0_0:_getProperty(0),
      "nesting",
      6
    }
  }
  for _FORV_4_ = 1, A0_0:_getProperty(0) do
    A0_0.work._memberSave[_FORV_4_]._nesting = {
      {"cdIDOffset", "integer16"},
      {"placeName", "integer16"},
      {"conditions", "integer8"},
      {"level", "integer8"}
    }
  end
  L1_1._tag = {
    {
      "paramsync",
      1,
      {
        "_memberSave",
        "[*]",
        "cdIDOffset"
      },
      {
        "_memberSave",
        "[*]",
        "placeName"
      },
      {
        "_memberSave",
        "[*]",
        "conditions"
      },
      {
        "_memberSave",
        "[*]",
        "level"
      }
    }
  }
end
function RetainerGroup._onUpdateMemberInformation(A0_2, A1_3)
  local L2_4
  L2_4 = A0_2._callSuperClassFunc
  L2_4(A0_2, "_onUpdateMemberInformation", A1_3)
  L2_4 = nil
  if A0_2:_isExistInWorldMember(A1_3) and A0_2:_isExistInClientMember(A1_3) then
    L2_4 = A0_2:_getMember(A1_3)
  end
  desktopWidget:processUpdateGroupInformation(L2_4, A0_2:_getKind(), A0_2)
  if L2_4 ~= nil then
    worldMaster:_getMyPlayer():getDepictionJudge():judgeNameplate(L2_4)
  end
end
function RetainerGroup._onUpdateGroupInformation(A0_5, A1_6)
  A0_5:_callSuperClassFunc("_onUpdateGroupInformation", A1_6)
end
function RetainerGroup._onUpdateMember(A0_7, A1_8, A2_9)
  A0_7:_callSuperClassFunc("_onUpdateMember", A1_8, A2_9)
end
function RetainerGroup._onUpdateWork(A0_10, A1_11, A2_12)
  local L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19
  L4_14 = A0_10
  L3_13 = A0_10._callSuperClassFunc
  L3_13(L4_14, L5_15, L6_16, L7_17)
  L3_13 = desktopWidget
  L4_14 = L3_13
  L3_13 = L3_13.processUpdateGroupInformation
  L3_13(L4_14, L5_15, L6_16, L7_17)
  if A2_12 == "_init" then
    L3_13 = worldMaster
    L4_14 = L3_13
    L3_13 = L3_13._getMyPlayer
    L3_13 = L3_13(L4_14)
    L4_14 = A0_10._countMember
    L4_14 = L4_14(L5_15)
    for L8_18 = 1, L4_14 do
      L9_19 = nil
      if A0_10:_isExistInWorldMember(L8_18) and A0_10:_isExistInClientMember(L8_18) then
        L9_19 = A0_10:_getMember(L8_18)
        if L9_19 ~= nil then
          L3_13:getDepictionJudge():judgeNameplate(L9_19)
        end
      end
    end
  end
end
function RetainerGroup.isPlayerMember(A0_20, A1_21)
  if A1_21 < 1 or A1_21 > A0_20:_countMember() then
    return false
  end
  if A0_20:getMemberWorkEmploymentState(A1_21) == 127 then
    return true
  elseif A0_20:getMemberWorkEmploymentState(A1_21) == 0 then
    if A0_20:_isExistInWorldMember(A1_21) == false then
      return false
    end
    if A0_20:_isExistInClientMember(A1_21) == false then
      return false
    end
    if A0_20:_getMember(A1_21):isPlayer() == true then
      return true
    end
  end
  return false
end
function RetainerGroup.getMemberWorkCoordinateId(A0_22, A1_23)
  local L2_24
  if not (A1_23 < 1) then
    L2_24 = A0_22.work
    L2_24 = L2_24._memberSave
    L2_24 = #L2_24
  elseif A1_23 > L2_24 then
    L2_24 = 0
    return L2_24
  end
  L2_24 = A0_22.work
  L2_24 = L2_24._memberSave
  L2_24 = L2_24[A1_23]
  L2_24 = L2_24.cdIDOffset
  L2_24 = L2_24 + 3001101
  return L2_24
end
function RetainerGroup.getMemberWorkEmploymentState(A0_25, A1_26)
  local L2_27
  if not (A1_26 < 1) then
    L2_27 = A0_25.work
    L2_27 = L2_27._memberSave
    L2_27 = #L2_27
  elseif A1_26 > L2_27 then
    L2_27 = 0
    return L2_27
  end
  L2_27 = A0_25.work
  L2_27 = L2_27._memberSave
  L2_27 = L2_27[A1_26]
  L2_27 = L2_27.conditions
  return L2_27
end
function RetainerGroup.getMemberLocation(A0_28, A1_29)
  if A1_29 < 1 or A1_29 > #A0_28.work._memberSave then
    return 0
  end
  if A0_28:getMemberWorkEmploymentState(A1_29) == 127 then
    return 1501
  end
  if A0_28.work._memberSave[A1_29].placeName ~= 0 then
    return A0_28.work._memberSave[A1_29].placeName
  end
  if A0_28:_isExistInWorldMember(A1_29) == false then
    if A0_28:getMemberWorkCoordinateId(A1_29) <= 3001175 then
      return 1090
    elseif A0_28:getMemberWorkCoordinateId(A1_29) <= 3002175 then
      return 3094
    elseif A0_28:getMemberWorkCoordinateId(A1_29) <= 3003175 then
      return 2094
    end
  end
  return 1501
end
function RetainerGroup.getMemberTown(A0_30, A1_31)
  if A1_31 < 1 or A1_31 > #A0_30.work._memberSave then
    return 0
  end
  if A0_30:getMemberWorkEmploymentState(A1_31) == 127 then
    return 1501
  end
  if A0_30.work._memberSave[A1_31].placeName == 1501 then
    return 1501
  end
  if A0_30.work._memberSave[A1_31].placeName >= 1000 and A0_30.work._memberSave[A1_31].placeName < 2000 then
    return 1051
  end
  if A0_30.work._memberSave[A1_31].placeName >= 2000 and A0_30.work._memberSave[A1_31].placeName < 3000 then
    return 2001
  end
  if A0_30.work._memberSave[A1_31].placeName >= 3000 and A0_30.work._memberSave[A1_31].placeName < 4000 then
    return 3051
  end
  return 1501
end
function RetainerGroup.getMemberRetainerLevel(A0_32, A1_33)
  if A1_33 < 1 or A1_33 > #A0_32.work._memberSave then
    return 0
  end
  if A0_32:getMemberWorkEmploymentState(A1_33) == 127 then
    return 0
  end
  if 1 > A0_32.work._memberSave[A1_33].level then
    return 1
  end
  return A0_32.work._memberSave[A1_33].level
end
