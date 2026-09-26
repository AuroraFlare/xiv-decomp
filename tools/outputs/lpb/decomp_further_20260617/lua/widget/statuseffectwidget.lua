require("/Widget/WidgetBaseClass")
_defineClass("StatusEffectWidget", "WidgetBaseClass")
function StatusEffectWidget.init(A0_0)
  A0_0.work._temp = {
    {
      "statusEffectNumber",
      "integer8"
    },
    {
      "noticeNumber",
      "integer8"
    },
    {
      "isVisibleNoticeIcon",
      "boolean"
    },
    {
      "isVisibleInviteIcon",
      "boolean"
    },
    {
      "isVisibleContactIcon",
      "boolean"
    },
    {
      "isVisibleRectIcon",
      "boolean"
    },
    {
      "isVisibleContentIcon",
      "boolean"
    },
    {
      "isVisibleNegotiationIcon",
      "boolean"
    },
    {
      "isVisibleBootyIcon",
      "boolean"
    }
  }
  A0_0:setUICommandCondition("UILuaCommands.Cancel")
  A0_0.work.statusEffectNumber = 0
  A0_0.work.noticeNumber = 0
  A0_0.work.isVisibleNoticeIcon = false
  A0_0.work.isVisibleInviteIcon = false
  A0_0.work.isVisibleContactIcon = false
  A0_0.work.isVisibleRectIcon = false
  A0_0.work.isVisibleContentIcon = false
  A0_0.work.isVisibleNegotiationIcon = false
  A0_0.work.isVisibleBootyIcon = false
  A0_0:clearStatus()
  A0_0:setProperty("Focusable", false)
end
function StatusEffectWidget.processUICommandOperate(A0_1, A1_2, A2_3, A3_4, A4_5)
  if desktopWidget:isSubTargetSelectMode() then
    return
  end
end
function StatusEffectWidget.processUICommandCancel(A0_6, A1_7, A2_8, A3_9, A4_10)
  if desktopWidget:_getKeyboardFocusedWidget() == A0_6 then
    A0_6:sendCommand("ApplicationCommands.FocusOrderToBottom")
  end
end
function StatusEffectWidget.processUICommandDefault(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
end
function StatusEffectWidget.update(A0_17)
  A0_17:setStatus()
  A0_17:updateFocusable()
end
function StatusEffectWidget.updateNotice(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23, A6_24)
  A0_18.work.noticeNumber = 0
  A0_18:updateFocusable()
end
function StatusEffectWidget.displayNotice(A0_25, A1_26)
end
function StatusEffectWidget.setStatus(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36
  L1_28 = A0_27.work
  L1_28.statusEffectNumber = 0
  L1_28, L2_29, L3_30, L4_31 = nil, nil, nil, nil
  L5_32 = desktopWidget
  L5_32 = L5_32.getPlayerStatusSlotLength
  L5_32 = L5_32(L6_33)
  for L9_36 = 1, L5_32 do
    L1_28, L2_29, L3_30, L4_31 = desktopWidget:getPlayerBufferStatus(L9_36)
    if L1_28 > 0 then
      A0_27:setStatusIcon(L9_36, L1_28, L2_29, L3_30, L4_31)
      A0_27.work.statusEffectNumber = A0_27.work.statusEffectNumber + 1
    else
      A0_27:setStatusIcon(L9_36, 0, 0, 0, 0)
    end
  end
end
function StatusEffectWidget.setNotice(A0_37)
  local L1_38
end
function StatusEffectWidget.updateFocusable(A0_39)
  if A0_39.work.statusEffectNumber > 0 or 0 < A0_39.work.noticeNumber then
    A0_39:setProperty("Focusable", true)
  else
    A0_39:setProperty("Focusable", false)
  end
end
function StatusEffectWidget.setStatusIcon(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45)
  local L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52, L13_53, L14_54
  L6_46 = "Button_StatusEffect_"
  L7_47 = tostring
  L8_48 = A1_41
  L7_47 = L7_47(L8_48)
  L6_46 = L6_46 .. L7_47
  L7_47 = L6_46
  L8_48 = ":IconControl_Buff"
  L7_47 = L7_47 .. L8_48
  L8_48 = L6_46
  L9_49 = ":CustomControl_TimerLabel"
  L8_48 = L8_48 .. L9_49
  L9_49 = L6_46
  L10_50 = ":Label_Timer"
  L9_49 = L9_49 .. L10_50
  L11_51 = A0_40
  L10_50 = A0_40._getProperty
  L12_52 = nil
  L13_53 = L6_46
  L14_54 = "IntData.Value2"
  L10_50 = L10_50(L11_51, L12_52, L13_53, L14_54)
  L12_52 = A0_40
  L11_51 = A0_40._getProperty
  L13_53 = nil
  L14_54 = L6_46
  L11_51 = L11_51(L12_52, L13_53, L14_54, "IntData.Value3")
  L12_52 = 0
  if A5_45 ~= nil then
    L12_52 = A5_45
  end
  if A2_42 > 0 then
    if A5_45 ~= L10_50 then
      L14_54 = A0_40
      L13_53 = A0_40.setIcon
      L13_53(L14_54, L7_47, A3_43)
      L14_54 = A0_40
      L13_53 = A0_40.setHelpParameter
      L13_53(L14_54, L6_46, 1, 74701, A2_42)
      L14_54 = A0_40
      L13_53 = A0_40.setVisibility
      L13_53(L14_54, L6_46, true)
      L14_54 = A0_40
      L13_53 = A0_40._sendStoryboardCommand
      L13_53(L14_54, nil, L6_46, "UILuaCommands.StopStatusAnimation", nil, nil)
      L13_53 = 0
      L14_54 = 0
      if A4_44 > 30 then
        L13_53 = A4_44 - 30
      end
      if A4_44 > 15 then
        L14_54 = A4_44 - 15
      end
      A0_40:_setProperty(nil, L6_46, "IntData.Value0", L13_53)
      A0_40:_setProperty(nil, L6_46, "IntData.Value1", L14_54)
      if A4_44 > 0 and A5_45 > 0 then
        A0_40:setStatusTime(A1_41, A4_44, 0)
        A0_40:setVisibility(L9_49, true)
      else
        A0_40:setStatusTime(A1_41, 0, 0)
        A0_40:setVisibility(L9_49, false)
      end
      A0_40:_setProperty(nil, L6_46, "IntData.Value2", L12_52)
      A0_40:_setProperty(nil, L6_46, "IntData.Value3", A2_42)
      if L12_52 >= 0 then
        A0_40:_sendStoryboardCommand(nil, L6_46, "UILuaCommands.SetStatusAnimation")
      else
        A0_40:_sendStoryboardCommand(nil, L6_46, "UILuaCommands.StopStatusAnimation")
      end
    end
  else
    L14_54 = A0_40
    L13_53 = A0_40.setStatusTime
    L13_53(L14_54, A1_41, 0, 0)
    L14_54 = A0_40
    L13_53 = A0_40.setIcon
    L13_53(L14_54, L7_47, 0)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L13_53(L14_54, L9_49, false)
    L14_54 = A0_40
    L13_53 = A0_40.setVisibility
    L13_53(L14_54, L6_46, false)
    L14_54 = A0_40
    L13_53 = A0_40._setProperty
    L13_53(L14_54, nil, L6_46, "IntData.Value0", 0)
    L14_54 = A0_40
    L13_53 = A0_40._setProperty
    L13_53(L14_54, nil, L6_46, "IntData.Value1", 0)
    L14_54 = A0_40
    L13_53 = A0_40._setProperty
    L13_53(L14_54, nil, L6_46, "IntData.Value2", 0)
    L14_54 = A0_40
    L13_53 = A0_40._setProperty
    L13_53(L14_54, nil, L6_46, "IntData.Value3", 0)
    L14_54 = A0_40
    L13_53 = A0_40._sendStoryboardCommand
    L13_53(L14_54, nil, L6_46, "UILuaCommands.StopStatusAnimation")
  end
end
function StatusEffectWidget.clearStatus(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63, L9_64, L10_65
  L1_56 = ""
  L2_57 = ""
  L3_58 = ""
  L4_59 = ""
  L5_60 = "TextBlock_StatusEffectText"
  L6_61 = desktopWidget
  L6_61 = L6_61.getPlayerStatusSlotLength
  L6_61 = L6_61(L7_62)
  for L10_65 = 1, L6_61 do
    L1_56 = "Button_StatusEffect_" .. tostring(L10_65)
    L2_57 = L1_56 .. ":IconControl_Buff"
    L3_58 = L1_56 .. ":CustomControl_TimerLabel"
    L4_59 = L1_56 .. ":Label_Timer"
    A0_55:_setProperty(nil, L1_56, "IntData.Value0", 0)
    A0_55:_setProperty(nil, L1_56, "IntData.Value1", 0)
    A0_55:_setProperty(nil, L1_56, "IntData.Value2", 0)
    A0_55:_setProperty(nil, L1_56, "IntData.Value3", 0)
    A0_55:setStatusTime(L10_65, 0, 0)
    A0_55:setIcon(L2_57, 0)
    A0_55:setVisibility(L4_59, false)
    A0_55:setVisibility(L1_56, false)
    A0_55:_sendStoryboardCommand(nil, L1_56, "UILuaCommands.StopStatusAnimation", nil, nil)
  end
end
function StatusEffectWidget.updateStatusHelp(A0_66)
  local L1_67
end
function StatusEffectWidget.setNoticeIcon(A0_68, A1_69, A2_70, A3_71)
end
function StatusEffectWidget.clearNotice(A0_72)
  local L1_73
end
function StatusEffectWidget.setStatusTime(A0_74, A1_75, A2_76, A3_77)
  local L4_78
  L4_78 = "Button_StatusEffect_"
  L4_78 = L4_78 .. tostring(A1_75) .. ":CustomControl_TimerLabel"
  A0_74:setControlProperty(L4_78, "FloatData.Value0", A2_76)
  A0_74:setControlProperty(L4_78, "FloatData.Value1", A3_77)
  A0_74:setControlProperty(L4_78, "IntData.Value0", 1)
end
function StatusEffectWidget.setOnCursorControl(A0_79, A1_80)
end
function StatusEffectWidget.getOnCursorControl(A0_81)
  local L1_82
end
