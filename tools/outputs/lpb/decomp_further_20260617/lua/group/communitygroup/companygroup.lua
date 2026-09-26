require("/Group/CommunityGroup/CommunityGroupBaseClass")
_defineClass("CompanyGroup", "CommunityGroupBaseClass")
function CompanyGroup.getMasterMember(A0_0)
  local L1_1
  L1_1 = A0_0.work
  L1_1 = L1_1._globalSave
  L1_1 = L1_1.master
  return L1_1
end
function CompanyGroup.getCompanyRank(A0_2)
  local L1_3
  L1_3 = A0_2.work
  L1_3 = L1_3._globalSave
  L1_3 = L1_3.rank
  return L1_3
end
function CompanyGroup.getUniqueIdentifier(A0_4)
  return A0_4:_getDisplayName()
end
function CompanyGroup.countNpc(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14
  L1_6 = 0
  for L5_10 = 1, L3_8(L4_9) do
    L7_12 = A0_5
    L6_11 = A0_5._getMemberDisplayName
    L8_13 = L5_10
    L7_12 = L6_11(L7_12, L8_13)
    L8_13 = type
    L9_14 = L6_11
    L8_13 = L8_13(L9_14)
    if L8_13 == "number" then
      L1_6 = L1_6 + 1
    else
      L8_13 = "[~a-zA-Z0-9]"
      L9_14 = _string
      L9_14 = L9_14.match
      L9_14 = L9_14(L6_11, L8_13, 1)
      if L9_14 == nil then
        L8_13 = "^[A-Z]+"
        L9_14 = _string
        L9_14 = L9_14.match
        L9_14 = L9_14(L6_11, L8_13, 1)
        if L9_14 ~= nil then
          L1_6 = L1_6 + 1
        end
      end
    end
  end
  return L1_6
end
function CompanyGroup.initAsCommunityGroup(A0_15)
  A0_15.work._sync = {
    {
      "_globalSave",
      "nesting",
      32
    },
    {
      "_memberSave",
      "array",
      A0_15:_getProperty(0),
      "nesting",
      1
    }
  }
  for _FORV_4_ = 1, A0_15:_getProperty(0) do
    A0_15.work._memberSave[_FORV_4_]._nesting = {
      {"rank", "integer8"}
    }
  end
  _FOR_._globalSave._nesting = {
    {"master", "member"},
    {
      "crestIcon",
      "array",
      4,
      "integer16"
    },
    {"rank", "integer8"}
  }
  A0_15.work._tag = {
    {
      "baseInfo",
      1,
      {
        "_globalSave",
        "master"
      },
      {
        "_globalSave",
        "crestIcon"
      },
      {
        "_globalSave",
        "rank"
      }
    },
    {
      "memberRank",
      1,
      {
        "_memberSave",
        "[*]",
        "rank"
      }
    }
  }
  A0_15:_bindWorkNestingArray(300001, "work", "_memberSave", "rank", A0_15:_getProperty(0))
  A0_15:updateMemberInformation()
end
function CompanyGroup._onUpdateMemberInformation(A0_16, A1_17)
  A0_16:_callSuperClassFunc("_onUpdateMemberInformation", A1_17)
  desktopWidget:processUpdateCurrentCommunityGroup(A0_16, 1)
  desktopWidget:processUpdateCurrentCommunityGroup(A0_16, 2)
end
function CompanyGroup._onUpdateGroupInformation(A0_18)
  A0_18:_callSuperClassFunc("_onUpdateGroupInformation")
end
function CompanyGroup._onUpdateMember(A0_19, A1_20, A2_21)
  A0_19:_callSuperClassFunc("_onUpdateMember", A1_20, A2_21)
  desktopWidget:processUpdateCurrentCommunityGroup(A0_19, 1)
  desktopWidget:processUpdateCurrentCommunityGroup(A0_19, 2)
end
function CompanyGroup._onUpdateWork(A0_22, A1_23, A2_24)
  A0_22:_callSuperClassFunc("_onUpdateWork", A1_23, A2_24)
  if A2_24 == "baseInfo" then
    desktopWidget:processUpdateCurrentCommunityGroup(A0_22, 1)
  elseif A2_24 == "memberRank" then
    desktopWidget:processUpdateCurrentCommunityGroup(A0_22, 2)
  end
end
function CompanyGroup.getCrestIcon(A0_25)
  local L1_26, L2_27, L3_28, L4_29
  L1_26 = A0_25.work
  L1_26 = L1_26._globalSave
  L1_26 = L1_26.crestIcon
  L1_26 = L1_26[1]
  L2_27 = A0_25.work
  L2_27 = L2_27._globalSave
  L2_27 = L2_27.crestIcon
  L2_27 = L2_27[2]
  L3_28 = A0_25.work
  L3_28 = L3_28._globalSave
  L3_28 = L3_28.crestIcon
  L3_28 = L3_28[3]
  L4_29 = A0_25.work
  L4_29 = L4_29._globalSave
  L4_29 = L4_29.crestIcon
  L4_29 = L4_29[4]
  return L1_26, L2_27, L3_28, L4_29
end
function CompanyGroup.isCurrent(A0_30, A1_31)
  if A1_31:getCommunityGroupCurrent(20002) ~= nil and A0_30 == A1_31:getCommunityGroupCurrent(20002) then
    return true
  end
  return false
end
function CompanyGroup.isOwner(A0_32, A1_33)
  local L2_34
  L2_34 = A0_32.work
  L2_34 = L2_34._globalSave
  L2_34 = L2_34.master
  if L2_34 ~= nil then
    L2_34 = A0_32.work
    L2_34 = L2_34._globalSave
    L2_34 = L2_34.master
    if A1_33 == L2_34 then
      L2_34 = true
      return L2_34
    end
  end
  L2_34 = false
  return L2_34
end
function CompanyGroup.updateMemberInformation(A0_35)
  A0_35:_updateMemberAndInformation()
end
function CompanyGroup.updateRankInGroup(A0_36)
  local L1_37
end
function CompanyGroup.getMemberIndex(A0_38, A1_39)
  local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47
  if A1_39 == nil then
    L2_40 = 0
    return L2_40
  end
  L3_41 = A1_39
  L2_40 = A1_39._isAlive
  L2_40 = L2_40(L3_41)
  if L2_40 == false then
    L2_40 = 0
    return L2_40
  end
  L3_41 = A1_39
  L2_40 = A1_39._getDisplayName
  L2_40 = L2_40(L3_41)
  L4_42 = A0_38
  L3_41 = A0_38._countMember
  L3_41 = L3_41(L4_42)
  if L3_41 < 1 then
    L4_42 = 0
    return L4_42
  end
  L4_42 = 1
  L5_43 = ""
  for L9_47 = 1, L3_41 do
    if A0_38:_isExistInWorldMember(L9_47) == true then
      if A0_38:_isExistInClientMember(L9_47) == true then
        if A0_38:_isMember(A1_39, L9_47) == true then
          return L9_47
        end
      else
        L5_43 = A0_38:_getMemberDisplayName(L9_47)
        if L5_43 ~= "" and L5_43 == L2_40 then
          return L9_47
        end
      end
    else
      L5_43 = A0_38:_getMemberDisplayName(L9_47)
      if L5_43 ~= "" and L5_43 == L2_40 then
        return L9_47
      end
    end
  end
  return L6_44
end
function CompanyGroup.getMemberUniqueIdentifier(A0_48, A1_49)
  if A1_49 < 1 or A1_49 > A0_48:_countMember() then
    return nil
  end
  return A0_48:_getMemberDisplayName(A1_49)
end
function CompanyGroup.getMemberRank(A0_50, A1_51)
  local L2_52
  L2_52 = 0
  if type(A1_51) == "number" then
    L2_52 = A1_51
  else
    L2_52 = A0_50:getMemberIndex(A1_51)
  end
  if L2_52 < 1 or L2_52 > #A0_50.work._memberSave then
    return 0
  end
  return A0_50.work._memberSave[L2_52].rank
end
