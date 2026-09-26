require("/Group/RelationGroup/RelationGroupBaseClass")
_defineClass("GroupExecCommandRelationGroup", "RelationGroupBaseClass")
function GroupExecCommandRelationGroup.isHost(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.work
  L2_2 = L2_2._globalTemp
  L2_2 = L2_2.host
  L2_2 = L2_2 == A1_1
  return L2_2
end
function GroupExecCommandRelationGroup.initAsRelationGroup(A0_3)
  local L1_4, L2_5
  L1_4 = A0_3.work
  L2_5 = {
    {
      "_globalTemp",
      "nesting",
      16
    }
  }
  L1_4._sync = L2_5
  L1_4 = A0_3.work
  L1_4 = L1_4._globalTemp
  L2_5 = {
    {"host", "member"},
    {
      "variableCommand",
      "integer32"
    }
  }
  L1_4._nesting = L2_5
end
function GroupExecCommandRelationGroup._onUpdateWork(A0_6, A1_7, A2_8)
  A0_6:_callSuperClassFunc("_onUpdateWork", A1_7, A2_8)
end
function GroupExecCommandRelationGroup._onUpdateMember(A0_9, A1_10, A2_11)
  A0_9:_callSuperClassFunc("_onUpdateMember", A1_10, A2_11)
end
function GroupExecCommandRelationGroup._onFinalize(A0_12)
  local L1_13
end
