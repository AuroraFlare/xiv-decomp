require("/Group/RelationGroup/RelationGroupBaseClass")
_defineClass("TradeRelationGroup", "RelationGroupBaseClass")
function TradeRelationGroup.isHost(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.work
  L2_2 = L2_2._globalTemp
  L2_2 = L2_2.host
  L2_2 = L2_2 == A1_1
  return L2_2
end
function TradeRelationGroup.initAsRelationGroup(A0_3)
  A0_3.work._sync = {
    {
      "_globalTemp",
      "nesting",
      16
    }
  }
  A0_3.work._globalTemp._nesting = {
    {"host", "member"},
    {
      "variableCommand",
      "integer32"
    }
  }
  A0_3.work._tag = {
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
  A0_3:_bindWork(200001, "work", "_globalTemp", "host")
  A0_3:_bindWork(200002, "work", "_globalTemp", "variableCommand")
end
function TradeRelationGroup.getCommandVariation(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  if L1_5 == 0 then
    return L1_5
  end
  for L4_8 = 1, L2_6(L3_7) do
    if A0_4:_isMember(A0_4.work._globalTemp.host, L4_8) then
      return A0_4.work._globalTemp.variableCommand, A0_4:_getMemberLocalizedDisplayName(L4_8)
    end
  end
  return L1_5
end
function TradeRelationGroup._onUpdateWork(A0_9, A1_10, A2_11)
  A0_9:_callSuperClassFunc("_onUpdateWork", A1_10, A2_11)
  if A2_11 == "_init" then
    desktopWidget:processUpdateConfirmTradeCommandVariation()
  elseif A1_10 == "work" and A2_11 == "confirmGroupCommand" then
    desktopWidget:processUpdateConfirmTradeCommandVariation()
  end
end
function TradeRelationGroup._onUpdateMember(A0_12, A1_13, A2_14)
  A0_12:_callSuperClassFunc("_onUpdateMember", A1_13, A2_14)
  desktopWidget:processUpdateConfirmTradeCommandVariation()
end
function TradeRelationGroup._onFinalize(A0_15)
  desktopWidget:processUpdateConfirmTradeCommandVariation()
end
