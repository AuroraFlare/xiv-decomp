require("/Widget/WidgetBaseClass")
_defineClass("GuildleveHistoryWidget", "WidgetBaseClass")
function GuildleveHistoryWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "loadCountGuildleve"
  L5_5 = "integer8"
  L4_4 = {L5_5, "integer8"}
  L5_5 = "loadCountSkillIcon"
  L1_1._temp = L2_2
  L1_1.loadCountGuildleve = 0
  L1_1.loadCountSkillIcon = 0
  L4_4 = false
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  for L4_4 = 1, 8 do
    L5_5 = "Button_Leve"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setUserWorkGuildleveID(L4_4, 0)
    A0_0:setUserWorkSkillIconID(L4_4, 0, 0)
    A0_0:setConfirmCondition(L5_5)
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.EnterFocus")
    A0_0:setHidden(L5_5 .. ":Grid_GLPlate")
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
end
function GuildleveHistoryWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  if A2_8 == "Button_Cancel" then
    A0_6:finish()
    return
  end
end
function GuildleveHistoryWidget.processUICommandDefault(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16)
  local L6_17
  L6_17 = A3_14
  if L6_17 == "UILuaCommands.Shown" then
    if desktopWidget:executeCommandJournalHistoryInfo() == false then
      desktopWidget:openCommandFailedWidget(A0_11, 4311)
      do return end
      do break end
      else
      end
      if L6_17 == "UILuaCommands.EnterFocus" then
        A0_11:setGuildleveInfomation(A2_13)
        break
      else
      end
    else
    end
end
function GuildleveHistoryWidget.processUICommandClose(A0_18, A1_19, A2_20, A3_21, A4_22)
  A0_18:finish()
end
function GuildleveHistoryWidget.finish(A0_23)
  desktopWidget:closeWidgetDirect(A0_23)
end
function GuildleveHistoryWidget.setDetailData(A0_24, A1_25, A2_26, A3_27, A4_28, A5_29, A6_30, A7_31, A8_32)
  if A1_25 ~= 0 then
    A0_24:setUserWorkGuildleveID(1, A1_25)
  end
  if A2_26 ~= 0 then
    A0_24:setUserWorkGuildleveID(2, A2_26)
  end
  if A3_27 ~= 0 then
    A0_24:setUserWorkGuildleveID(3, A3_27)
  end
  if A4_28 ~= 0 then
    A0_24:setUserWorkGuildleveID(4, A4_28)
  end
  if A5_29 ~= 0 then
    A0_24:setUserWorkGuildleveID(5, A5_29)
  end
  if A6_30 ~= 0 then
    A0_24:setUserWorkGuildleveID(6, A6_30)
  end
  if A7_31 ~= 0 then
    A0_24:setUserWorkGuildleveID(7, A7_31)
  end
  if A8_32 ~= 0 then
    A0_24:setUserWorkGuildleveID(8, A8_32)
  end
  A0_24:requestLoadGuildleve()
  A0_24:requestLoadSkillIcon()
end
function GuildleveHistoryWidget.requestLoadGuildleve(A0_33)
  local L1_34, L2_35, L3_36
  L1_34 = A0_33.work
  L2_35 = A0_33.work
  L2_35 = L2_35.loadCountGuildleve
  L2_35 = L2_35 + 1
  L1_34.loadCountGuildleve = L2_35
  L1_34 = A0_33.work
  L1_34 = L1_34.loadCountGuildleve
  if L1_34 > 8 then
    return
  end
  L1_34 = A0_33.work
  L1_34 = L1_34.loadCountGuildleve
  L3_36 = A0_33
  L2_35 = A0_33.getUserWorkGuildleveID
  L2_35 = L2_35(L3_36, L1_34)
  L3_36 = guildleveUISheet
  if L2_35 > 0 then
    if L2_35 > 120000 then
      L3_36 = passiveGLIconSheet
    end
    A0_33:loadSpreadSheetDataAsync(L3_36, L2_35, L2_35)
  else
    A0_33:requestLoadGuildleve()
  end
end
function GuildleveHistoryWidget.requestLoadSkillIcon(A0_37)
  local L1_38, L2_39
  L1_38 = A0_37.work
  L2_39 = A0_37.work
  L2_39 = L2_39.loadCountSkillIcon
  L2_39 = L2_39 + 1
  L1_38.loadCountSkillIcon = L2_39
  L1_38 = A0_37.work
  L1_38 = L1_38.loadCountSkillIcon
  if L1_38 > 8 then
    return
  end
  L1_38 = A0_37.work
  L1_38 = L1_38.loadCountSkillIcon
  L2_39 = A0_37.getUserWorkGuildleveID
  L2_39 = L2_39(A0_37, L1_38)
  if L2_39 > 120000 then
    A0_37:loadSpreadSheetDataAsync(questSheet, L2_39, L2_39)
  else
    if L2_39 ~= 0 then
      A0_37:setUserWorkSkillIconID(L1_38, desktopWidget:getJournalIconID(1, L2_39))
    end
    A0_37:requestLoadSkillIcon()
  end
end
function GuildleveHistoryWidget.processSpreadSheetDataAsync(A0_40, A1_41, A2_42, A3_43)
  local L4_44, L5_45, L6_46, L7_47, L8_48, L9_49, L10_50, L11_51, L12_52
  L4_44 = guildleveUISheet
  if A1_41 ~= L4_44 then
    L4_44 = passiveGLIconSheet
  else
    if A1_41 == L4_44 then
      L4_44 = A0_40.work
      L4_44 = L4_44.loadCountGuildleve
      L5_45 = "Button_Leve"
      L6_46 = tostring
      L7_47 = L4_44
      L6_46 = L6_46(L7_47)
      L5_45 = L5_45 .. L6_46
      L6_46 = A2_42
      L7_47 = 75
      L8_48 = 76
      L9_49 = 77
      L10_50 = passiveGLIconSheet
      if A1_41 == L10_50 then
        L7_47 = 3
        L8_48 = 4
        L9_49 = 5
      end
      L11_51 = A1_41
      L10_50 = A1_41._getData
      L12_52 = L6_46
      L10_50 = L10_50(L11_51, L12_52, L7_47)
      L12_52 = A1_41
      L11_51 = A1_41._getData
      L11_51 = L11_51(L12_52, L6_46, L8_48)
      L12_52 = A1_41._getData
      L12_52 = L12_52(A1_41, L6_46, L9_49)
      A0_40:setIcon(L5_45 .. ":IconControl_TownName", L10_50)
      A0_40:setIcon(L5_45 .. ":IconControl_Card", L11_51)
      A0_40:setIcon(L5_45 .. ":IconControl_Plate", L12_52)
      A0_40:setVisibility(L5_45 .. ":Grid_GLPlate", true)
      A0_40:requestLoadGuildleve()
  end
  else
    L4_44 = questSheet
    if A1_41 == L4_44 then
      L4_44 = A0_40.work
      L4_44 = L4_44.loadCountSkillIcon
      L5_45 = "Button_Leve"
      L6_46 = tostring
      L7_47 = L4_44
      L6_46 = L6_46(L7_47)
      L5_45 = L5_45 .. L6_46
      L6_46 = A2_42
      L7_47, L8_48 = nil, nil
      L10_50 = A1_41
      L9_49 = A1_41._getData
      L11_51 = L6_46
      L12_52 = 52
      L9_49 = L9_49(L10_50, L11_51, L12_52)
      L10_50 = L9_49
      if L10_50 == 329 then
        L7_47 = 607
        L8_48 = 78478
        break
      else
      end
      if L10_50 == 330 then
        L7_47 = 600
        L8_48 = 78479
        break
      else
      end
      if L10_50 == 331 then
        L7_47 = 601
        L8_48 = 78480
        break
      else
      end
      if L10_50 == 332 then
        L7_47 = 604
        L8_48 = 78481
        break
      else
      end
      if L10_50 == 333 then
        L7_47 = 606
        L8_48 = 78482
        break
      else
      end
      if L10_50 == 334 then
        L7_47 = 603
        L8_48 = 78483
        break
      else
      end
      if L10_50 == 335 then
        L7_47 = 605
        L8_48 = 78484
        break
      else
      end
      if L10_50 == 336 then
        L7_47 = 602
        L8_48 = 78485
        break
      else
      end
      L11_51 = A0_40
      L10_50 = A0_40.setUserWorkSkillIconID
      L12_52 = L4_44
      L10_50(L11_51, L12_52, L7_47, L8_48)
      L11_51 = A0_40
      L10_50 = A0_40.requestLoadSkillIcon
      L10_50(L11_51)
    end
  end
end
function GuildleveHistoryWidget.setGuildleveInfomation(A0_53, A1_54)
  local L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62
  for L9_62 = 1, 8 do
    if A1_54 == "Button_Leve" .. tostring(L9_62) then
      L2_55 = A0_53:getUserWorkGuildleveID(L9_62)
      L4_57 = 4101
      L3_56, L5_58 = A0_53:getUserWorkSkillIconID(L9_62)
      if L2_55 > 120000 then
        L4_57 = 4219
      end
      if L2_55 ~= 0 and L3_56 ~= 0 then
        A0_53:setIcon("IconControl_GL", L3_56)
        A0_53:setHelpParameter("IconControl_GL", 1, L5_58)
        A0_53:setVisibility("IconControl_GL", true)
        A0_53:setText("TextBlock_GLTitle", L4_57, L2_55)
        A0_53:setVisibility("TextBlock_GLTitle", true)
        return
      end
    end
  end
  L6_59(L7_60, L8_61)
  L6_59(L7_60, L8_61)
  L9_62 = 0
  L6_59(L7_60, L8_61, L9_62)
end
function GuildleveHistoryWidget.setUserWorkGuildleveID(A0_63, A1_64, A2_65)
  A0_63:setControlUserWorkInt(1, "Button_Leve" .. tostring(A1_64), A2_65)
end
function GuildleveHistoryWidget.getUserWorkGuildleveID(A0_66, A1_67)
  return A0_66:getControlUserWorkInt(1, "Button_Leve" .. tostring(A1_67))
end
function GuildleveHistoryWidget.setUserWorkSkillIconID(A0_68, A1_69, A2_70, A3_71)
  A0_68:setControlUserWorkInt(2, "Button_Leve" .. tostring(A1_69), A2_70)
  A0_68:setControlUserWorkInt(3, "Button_Leve" .. tostring(A1_69), A3_71)
end
function GuildleveHistoryWidget.getUserWorkSkillIconID(A0_72, A1_73)
  return A0_72:getControlUserWorkInt(2, "Button_Leve" .. tostring(A1_73)), A0_72:getControlUserWorkInt(3, "Button_Leve" .. tostring(A1_73))
end
