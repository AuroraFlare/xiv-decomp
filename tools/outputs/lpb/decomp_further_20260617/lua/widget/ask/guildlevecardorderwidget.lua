require("/Widget/Ask/AskBaseClass")
_defineClass("GuildleveCardOrderWidget", "AskBaseClass")
function GuildleveCardOrderWidget.initAsk(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
  L3_3 = A0_0
  L2_2 = A0_0.setModal
  L4_4 = true
  L2_2(L3_3, L4_4)
  L3_3 = A0_0
  L2_2 = A0_0.setVisibility
  L4_4 = "Grid_Cost"
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L3_3 = A0_0
  L2_2 = A0_0.setConfirmCondition
  L4_4 = "Button_Cancel"
  L2_2(L3_3, L4_4)
  L3_3 = A0_0
  L2_2 = A0_0.setCancelCondition
  L2_2(L3_3)
  L3_3 = A1_1
  L2_2 = A1_1.getMaxCardNum
  L2_2 = L2_2(L3_3)
  L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10 = nil, nil, nil, nil, nil, nil, nil, nil
  L11_11 = 0
  for L15_15 = 1, L2_2 do
    L3_3 = A1_1:getPreGuildleveId(L15_15)
    if L3_3 ~= nil and L3_3 > 0 then
      L11_11 = L11_11 + 1
      L5_5 = "Button_Leve" .. tostring(L11_11)
      A0_0:setConfirmCondition(L5_5)
      A0_0:setControlCommandCondition(L5_5, "UILuaCommands.EnterFocus")
      L6_6, L7_7, L8_8, L9_9, L10_10 = A0_0:getGuildleveIcon(L3_3)
      A0_0:setUserWorkGuildleveID(L11_11, L3_3)
      A0_0:setUserWorkAskID(L11_11, L15_15)
      A0_0:setIcon(L5_5 .. ":IconControl_TownName_2", L6_6)
      A0_0:setIcon(L5_5 .. ":IconControl_Card_2", L7_7)
      A0_0:setIcon(L5_5 .. ":IconControl_Plate_2", L8_8)
      A0_0:setUserWorkSkillIconID(L11_11, L9_9, L10_10)
      if L3_3 > 0 and L3_3 < 2000 then
        A0_0:setVisibility("Grid_Cost", true)
      end
    end
  end
  for L15_15 = L11_11 + 1, 8 do
    A0_0:setUserWorkGuildleveID(L15_15, 0)
    A0_0:setUserWorkAskID(L15_15, 0)
    L5_5 = "Button_Leve" .. tostring(L15_15)
    A0_0:setControlCommandCondition(L5_5, "UILuaCommands.EnterFocus")
    A0_0:setHidden(L5_5 .. ":Grid_GLPlate_2")
  end
end
function GuildleveCardOrderWidget.processUICommandOperate(A0_16, A1_17, A2_18, A3_19, A4_20)
  local L5_21, L6_22, L7_23, L8_24
  if A2_18 == "Button_Cancel" then
    L5_21(L6_22, L7_23)
    return
  end
  for L8_24 = 1, 8 do
    if A2_18 == "Button_Leve" .. tostring(L8_24) then
      A0_16:setBaseAskResult(A0_16:getUserWorkAskID(L8_24))
      return
    end
  end
end
function GuildleveCardOrderWidget.processUICommandCancel(A0_25, A1_26, A2_27, A3_28, A4_29)
  A0_25:setBaseAskResult(-1)
end
function GuildleveCardOrderWidget.processUICommandDefault(A0_30, A1_31, A2_32, A3_33, A4_34, A5_35)
  local L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L13_43, L14_44
  if A3_33 == "UILuaCommands.EnterFocus" then
    L6_36, L7_37, L8_38, L9_39, L10_40 = nil, nil, nil, nil, nil
    for L14_44 = 1, 8 do
      L6_36 = "Button_Leve" .. tostring(L14_44)
      if A2_32 == L6_36 then
        L7_37 = A0_30:getUserWorkGuildleveID(L14_44)
        if L7_37 > 0 then
          A0_30:setVisibility("IconControl_GL", true)
          A0_30:setVisibility("TextBlock_GLTitle", true)
        else
          A0_30:setHidden("IconControl_GL")
          A0_30:setHidden("TextBlock_GLTitle")
          return
        end
        L8_38, L10_40 = A0_30:getUserWorkSkillIconID(L14_44)
        L9_39 = 4101
        if L7_37 >= 120000 then
          L9_39 = 4219
        end
        if L7_37 < 2000 then
          A0_30:setText("TextBlock_FactionName", 4241, L7_37)
        end
        A0_30:setIcon("IconControl_GL", L8_38)
        A0_30:setHelpParameter("IconControl_GL", 1, L10_40)
        A0_30:setText("TextBlock_GLTitle", L9_39, L7_37)
        return
      end
    end
  end
end
function GuildleveCardOrderWidget.getGuildleveIcon(A0_45, A1_46)
  local L2_47, L3_48, L4_49, L5_50, L6_51, L7_52, L8_53
  L2_47 = 0
  L3_48 = 0
  L4_49 = 0
  L5_50 = 0
  L6_51 = 0
  if A1_46 >= 120000 then
    L7_52 = worldMaster
    L8_53 = L7_52
    L7_52 = L7_52._getMyPlayer
    L7_52 = L7_52(L8_53)
    L8_53 = L7_52
    L7_52 = L7_52.getPassiveGuildleveIcons
    L4_49, L7_52 = A1_46, L7_52(L8_53, A1_46)
    L4_49, L8_53 = A1_46, L7_52(L8_53, A1_46)
    L3_48 = L8_53
    L2_47 = L7_52
    L7_52 = questSheet
    L8_53 = L7_52
    L7_52 = L7_52._loadKeyTemporarily
    L7_52(L8_53, A1_46, A1_46)
    L7_52 = questSheet
    L8_53 = L7_52
    L7_52 = L7_52._getData
    L7_52 = L7_52(L8_53, A1_46, 52)
    L8_53 = L7_52
    if L8_53 == 329 then
      L5_50 = 607
      L6_51 = 78478
      break
    else
    end
    if L8_53 == 330 then
      L5_50 = 600
      L6_51 = 78479
      break
    else
    end
    if L8_53 == 331 then
      L5_50 = 601
      L6_51 = 78480
      break
    else
    end
    if L8_53 == 332 then
      L5_50 = 604
      L6_51 = 78481
      break
    else
    end
    if L8_53 == 333 then
      L5_50 = 606
      L6_51 = 78482
      break
    else
    end
    if L8_53 == 334 then
      L5_50 = 603
      L6_51 = 78483
      break
    else
    end
    if L8_53 == 335 then
      L5_50 = 605
      L6_51 = 78484
      break
    else
    end
    if L8_53 == 336 then
      L5_50 = 602
      L6_51 = 78485
      break
    else
    end
  elseif A1_46 > 0 then
    L7_52 = guildleveUISheet
    L8_53 = L7_52
    L7_52 = L7_52._loadKeyTemporarily
    L7_52(L8_53, A1_46, A1_46)
    L7_52 = guildleveUISheet
    L8_53 = L7_52
    L7_52 = L7_52._getData
    L7_52 = L7_52(L8_53, A1_46, 75)
    L2_47 = L7_52
    L7_52 = guildleveUISheet
    L8_53 = L7_52
    L7_52 = L7_52._getData
    L7_52 = L7_52(L8_53, A1_46, 76)
    L3_48 = L7_52
    L7_52 = guildleveUISheet
    L8_53 = L7_52
    L7_52 = L7_52._getData
    L7_52 = L7_52(L8_53, A1_46, 77)
    L4_49 = L7_52
    L7_52 = desktopWidget
    L8_53 = L7_52
    L7_52 = L7_52.getJournalIconID
    L8_53 = L7_52(L8_53, 1, A1_46)
    L6_51 = L8_53
    L5_50 = L7_52
  end
  L7_52 = L2_47
  L8_53 = L3_48
  return L7_52, L8_53, L4_49, L5_50, L6_51
end
function GuildleveCardOrderWidget.setUserWorkGuildleveID(A0_54, A1_55, A2_56)
  A0_54:setControlUserWorkInt(1, "Button_Leve" .. tostring(A1_55), A2_56)
end
function GuildleveCardOrderWidget.getUserWorkGuildleveID(A0_57, A1_58)
  return A0_57:getControlUserWorkInt(1, "Button_Leve" .. tostring(A1_58))
end
function GuildleveCardOrderWidget.setUserWorkSkillIconID(A0_59, A1_60, A2_61, A3_62)
  A0_59:setControlUserWorkInt(2, "Button_Leve" .. tostring(A1_60), A2_61)
  A0_59:setControlUserWorkInt(3, "Button_Leve" .. tostring(A1_60), A3_62)
end
function GuildleveCardOrderWidget.getUserWorkSkillIconID(A0_63, A1_64)
  return A0_63:getControlUserWorkInt(2, "Button_Leve" .. tostring(A1_64)), A0_63:getControlUserWorkInt(3, "Button_Leve" .. tostring(A1_64))
end
function GuildleveCardOrderWidget.setUserWorkAskID(A0_65, A1_66, A2_67)
  A0_65:setControlUserWorkInt(4, "Button_Leve" .. tostring(A1_66), A2_67)
end
function GuildleveCardOrderWidget.getUserWorkAskID(A0_68, A1_69)
  return A0_68:getControlUserWorkInt(4, "Button_Leve" .. tostring(A1_69))
end
