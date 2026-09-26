require("/Widget/WidgetBaseClass")
_defineClass("GrandCompanyJoinWidget", "WidgetBaseClass")
function GrandCompanyJoinWidget.init(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5
  L3_3 = worldMaster
  L4_4 = L3_3
  L3_3 = L3_3._getMyPlayer
  L3_3 = L3_3(L4_4)
  if L3_3 ~= nil then
    L5_5 = L3_3
    L4_4 = L3_3._isAlive
    L4_4 = L4_4(L5_5)
    if L4_4 then
      L4_4 = 1
      L5_5 = L3_3.isMale
      L5_5 = L5_5(L3_3)
      if L5_5 == true then
        L4_4 = 1
      else
        L5_5 = L3_3.isFemale
        L5_5 = L5_5(L3_3)
        if L5_5 == true then
          L4_4 = 2
        end
      end
      L5_5 = A0_0.getGrandCompanyStatusIcon
      L5_5 = L5_5(A0_0, A1_1, A2_2)
      A0_0:setIcon("IconControl_GrandCompanyRank1", L5_5)
      A0_0:setIcon("IconControl_GrandCompanyRank2", L5_5)
      A0_0:setText("TextBlock_GrandCompanyRank1", 8079 + A1_1, A2_2, L4_4)
      A0_0:setText("TextBlock_GrandCompanyRank2", 8079 + A1_1, A2_2, L4_4)
    end
  end
  L4_4 = desktopWidget
  L5_5 = L4_4
  L4_4 = L4_4.executeEffect
  L4_4(L5_5, 2130706535)
  L5_5 = A0_0
  L4_4 = A0_0.setUICommandCondition
  L4_4(L5_5, "UILuaCommands.AnimationCompleted")
  L5_5 = A0_0
  L4_4 = A0_0.sendCommand
  L4_4(L5_5, "Animation.Start")
end
function GrandCompanyJoinWidget.getGrandCompanyStatusIcon(A0_6, A1_7, A2_8)
  gcRankSheet:_loadKeyTemporarily(A2_8, A2_8)
  return (gcRankSheet:_getData(A2_8, A1_7 + 6 - 1))
end
function GrandCompanyJoinWidget.processUICommandEvent(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  if A3_12 == "UILuaCommands.AnimationCompleted" then
    desktopWidget:closeWidgetDirect(A0_9)
  end
end
