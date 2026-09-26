require("/Group/RelationGroup/RelationGroupBaseClass")
_defineClass("GroupInvitationRelationGroup", "RelationGroupBaseClass")
function GroupInvitationRelationGroup.isHost(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.work
  L2_2 = L2_2._globalTemp
  L2_2 = L2_2.host
  L2_2 = L2_2 == A1_1
  return L2_2
end
function GroupInvitationRelationGroup.isHostMember(A0_3, A1_4)
  return A0_3:_isMember(A0_3.work._globalTemp.host, A1_4)
end
function GroupInvitationRelationGroup.initAsRelationGroup(A0_5)
  A0_5.work._sync = {
    {
      "_globalTemp",
      "nesting",
      16
    }
  }
  A0_5.work._globalTemp._nesting = {
    {"host", "member"},
    {
      "variableCommand",
      "integer32"
    }
  }
  A0_5.work._tag = {
    {
      "confirmGroupCommand",
      1,
      {
        "_globalTemp",
        "host"
      },
      {
        "_globalTemp",
        "variableCommand"
      }
    }
  }
  A0_5:_bindWork(200001, "work", "_globalTemp", "host")
  A0_5:_bindWork(200002, "work", "_globalTemp", "variableCommand")
end
function GroupInvitationRelationGroup.getCommandVariation(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  if L1_7 == 0 then
    return L1_7
  end
  for L4_10 = 1, L2_8(L3_9) do
    if A0_6:_isMember(A0_6.work._globalTemp.host, L4_10) then
      return A0_6.work._globalTemp.variableCommand, A0_6:_getMemberLocalizedDisplayName(L4_10)
    end
  end
  return L1_7
end
function GroupInvitationRelationGroup._onUpdateWork(A0_11, A1_12, A2_13)
  A0_11:_callSuperClassFunc("_onUpdateWork", A1_12, A2_13)
  if A2_13 == "_init" then
    desktopWidget:processUpdateConfirmGroupCommandVariation()
  elseif A1_12 == "work" and A2_13 == "confirmGroupCommand" then
    desktopWidget:processUpdateConfirmGroupCommandVariation()
  end
end
function GroupInvitationRelationGroup._onUpdateMember(A0_14, A1_15, A2_16)
  A0_14:_callSuperClassFunc("_onUpdateMember", A1_15, A2_16)
  desktopWidget:processUpdateConfirmGroupCommandVariation()
end
function GroupInvitationRelationGroup._onFinalize(A0_17)
  desktopWidget:processUpdateConfirmGroupCommandVariation()
end
