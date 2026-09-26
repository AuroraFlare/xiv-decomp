require("/Widget/WidgetBaseClass")
_defineClass("PcInformationWidget", "WidgetBaseClass")
function PcInformationWidget.init(A0_0)
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setOperatorCloseCondition()
  A0_0:setOperatorOpenChildCondition()
  A0_0:setOperatorRequestCondition()
  A0_0:setModal(true)
end
function PcInformationWidget.processUICommandDefault(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6)
  if A3_4 == "UILuaCommands.OperateItem" then
end
function PcInformationWidget.processUIOperatorCommandRequest(A0_7, A1_8, A2_9)
  local L3_10
  L3_10 = A0_7.getListProperty
  L3_10 = L3_10(A0_7, "XmlDataMaker_Data", 0, "string_target_name")
  if A1_8 == 1 then
    desktopWidget:setTellAddress(L3_10)
    break
  else
  end
  if A1_8 == 2 then
    desktopWidget:executePlayerPartyInviteByName(L3_10)
    do break end
    break
  else
  end
end
