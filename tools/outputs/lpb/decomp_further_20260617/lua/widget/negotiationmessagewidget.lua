require("/Widget/WidgetBaseClass")
_defineClass("NegotiationMessageWidget", "WidgetBaseClass")
function NegotiationMessageWidget.init(A0_0, A1_1, A2_2, A3_3)
  local L4_4
  L4_4 = A0_0.work
  L4_4._temp = {}
  if A2_2 == 0 then
    L4_4 = A0_0.setVisibility
    L4_4(A0_0, "IconControl_NegotiationTitle", false)
  else
    L4_4 = worldMaster
    L4_4 = L4_4._getMyPlayer
    L4_4 = L4_4(L4_4)
    A0_0:setIcon("IconControl_NegotiationTitle", L4_4:createVirtualItem(A2_2):getItemIcon())
  end
  L4_4 = A0_0.setText
  L4_4(A0_0, "TextBlock_NegotiationTitle", 7123, A1_1)
  L4_4 = A0_0.setText
  L4_4(A0_0, "TextBlock_RemainderTurn", "1")
  L4_4 = tostring
  L4_4 = L4_4(A3_3)
  A0_0:setText("TextBlock_AllTurns", L4_4)
  A0_0:setText("TextBlock_TurnText", 7122)
end
