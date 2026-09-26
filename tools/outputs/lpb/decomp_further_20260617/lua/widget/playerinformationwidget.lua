require("/Widget/WidgetBaseClass")
_defineClass("PlayerInformationWidget", "WidgetBaseClass")
function PlayerInformationWidget.init(A0_0)
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setOperatorCloseCondition()
  A0_0:setOperatorOpenChildCondition()
  A0_0:setModal(true)
end
function PlayerInformationWidget.processUICommandDefault(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  if A3_4 == "UILuaCommands.OperateItem" then
end
