require("/Widget/Ask/AskBaseClass")
_defineClass("JournalListWidget", "AskBaseClass")
function JournalListWidget.initAsk(A0_0, A1_1, A2_2)
  A0_0.work._temp = {
    {
      "resultSelectFlag",
      "boolean"
    },
    {
      "requestResult",
      "boolean"
    },
    {
      "guildleveFlag",
      "boolean"
    },
    {"mode", "integer8"},
    {"questType", "integer8"},
    {
      "resultJournalID",
      "integer32"
    }
  }
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setConfirmCondition("Button_History")
  A0_0:setControlCommandCondition("ListBox_JournalList", "UILuaCommands.Selection")
  A0_0:setControlCommandCondition("ComboBox_Category_Quest", "UILuaCommands.SelectionChanged")
  A0_0.work.mode = A1_1
  A0_0.work.questType = 1
  A0_0.work.resultJournalID = 0
  A0_0.work.resultSelectFlag = false
  A0_0.work.requestResult = false
  A0_0.work.guildleveFlag = false
  if A1_1 == 7 then
    A0_0.work.questType = 2
    A0_0.work.requestResult = true
  end
  if A2_2 ~= nil then
    A0_0:setArgActor(A2_2)
  end
  A0_0:createList()
  if A1_1 == 1 then
    A0_0:createCategoryComboBox()
  elseif A1_1 == 7 then
    A0_0:createCategoryComboBox(2, true)
    A0_0:setVisibility("Button_History", false)
    A0_0:setProperty("Title", "@" .. tostring(7304) .. "/i" .. tostring(4010013))
  else
    A0_0:setVisibility("Grid_ComboBoxQuest", false)
    A0_0:setVisibility("Button_History", false)
  end
end
function JournalListWidget.processUICommandCancel(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8
  L5_8 = A0_3.work
  L5_8 = L5_8.mode
  if L5_8 == 1 then
  elseif L5_8 == 2 then
  elseif L5_8 == 3 then
  elseif L5_8 == 5 then
  elseif L5_8 == 6 then
  else
  end
  if L5_8 == 7 then
    A0_3:finish()
    break
  else
  end
  if L5_8 == 4 then
    A0_3:finish()
    do break end
    break
  else
  end
end
function JournalListWidget.processUICommandClose(A0_9, A1_10, A2_11, A3_12, A4_13)
  local L5_14
  L5_14 = A0_9.work
  L5_14 = L5_14.mode
  if L5_14 == 4 then
    A0_9:finish()
    break
  else
  end
  A0_9:finish()
  break
end
function JournalListWidget.processUICommandSelection(A0_15, A1_16, A2_17, A3_18, A4_19)
  local L5_20, L6_21, L7_22, L8_23, L9_24, L10_25
  L6_21 = A0_15
  L5_20 = A0_15.getListPropertyIndex
  L7_22 = "ListBox"
  L8_23 = A3_18
  L5_20 = L5_20(L6_21, L7_22, L8_23)
  L7_22 = A0_15
  L6_21 = A0_15.getListProperty
  L8_23 = "ListBox"
  L9_24 = L5_20
  L10_25 = "JournalType"
  L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25)
  if L6_21 == 0 then
    return
  end
  L8_23 = A0_15
  L7_22 = A0_15.getListProperty
  L9_24 = "ListBox"
  L10_25 = L5_20
  L7_22 = L7_22(L8_23, L9_24, L10_25, "JournalID")
  L9_24 = A0_15
  L8_23 = A0_15.getListProperty
  L10_25 = "ListBox"
  L8_23 = L8_23(L9_24, L10_25, L5_20, "JournalIndex")
  L9_24 = A0_15.work
  L9_24 = L9_24.mode
  if L9_24 == 1 then
    L10_25 = false
    if A0_15.work.questType ~= 1 then
      L10_25 = true
    end
    if L6_21 == 3 and L10_25 == false and (L7_22 >= 110001 and L7_22 <= 110059 or L7_22 >= 110600 and L7_22 <= 110971 or L7_22 >= 111401 and L7_22 <= 111599 or L7_22 >= 111601 and L7_22 <= 111799 or L7_22 >= 111801 and L7_22 <= 111999 or L7_22 >= 111200 and L7_22 <= 111339) then
      desktopWidget:openChildWidget("Ask/QuestDetailWidget", A0_15, true, 1, L7_22)
    else
      desktopWidget:openChildWidget("Ask/JournalDetailWidget", A0_15, true, 1, L6_21, L7_22, false, L8_23, L10_25)
      do break end
      elseif L9_24 == 2 then
      else
      end
      if L9_24 == 5 then
        L10_25 = A0_15.finish
        L10_25(A0_15, L7_22)
        break
      else
      end
      if L9_24 == 4 then
        L10_25 = A0_15.getArgActor
        L10_25 = L10_25(A0_15)
        if L10_25 == nil then
          return false
        end
        L10_25:selectGuildleveChangeBonus(L8_23)
        A0_15:finish(L7_22)
        break
      else
      end
      if L9_24 == 3 then
        if L6_21 == 2 then
          L10_25 = A0_15.work
          L10_25.guildleveFlag = true
        end
      else
      end
      if L9_24 == 6 then
        L10_25 = A0_15.finish
        L10_25(A0_15, L8_23)
        break
      else
      end
      if L9_24 == 7 then
        L10_25 = _math
        L10_25 = L10_25.floor
        L10_25 = L10_25(L7_22 / 100)
        if L10_25 == 110820 then
          L10_25 = A0_15.finish
          L10_25(A0_15, L7_22)
        else
          L10_25 = desktopWidget
          L10_25 = L10_25.openChildWidget
          L10_25(L10_25, "Ask/ReplayCutsceneSelectWidget", A0_15, true, L7_22)
          do break end
          break
        end
      else
      end
    end
end
function JournalListWidget.processUICommandSelectionChanged(A0_26, A1_27, A2_28, A3_29, A4_30)
  local L5_31, L6_32, L7_33
  L6_32 = A0_26
  L5_31 = A0_26.getListPropertyIndex
  L7_33 = "QuestComboBox"
  L5_31 = L5_31(L6_32, L7_33, A3_29)
  L7_33 = A0_26
  L6_32 = A0_26.getListProperty
  L6_32 = L6_32(L7_33, "QuestComboBox", L5_31, "QuestType")
  L7_33 = A0_26.work
  L7_33 = L7_33.questType
  if L7_33 ~= L6_32 then
    L7_33 = A0_26.work
    L7_33.questType = L6_32
    L7_33 = A0_26.work
    L7_33 = L7_33.mode
    if L7_33 == 7 then
      L7_33 = A0_26.createList
      L7_33(A0_26)
    elseif L6_32 == 1 then
      L7_33 = A0_26.createList
      L7_33(A0_26)
    else
      L7_33 = A0_26.requestQuestComplete
      L7_33(A0_26)
      L7_33 = A0_26.setVisibility
      L7_33(A0_26, "ListBox_JournalList", false)
    end
  elseif L6_32 ~= 1 then
    L7_33 = A0_26.work
    L7_33 = L7_33.requestResult
    if L7_33 == false then
      L7_33 = A0_26.requestQuestComplete
      L7_33(A0_26)
    end
  end
  L7_33 = A0_26.getListProperty
  L7_33 = L7_33(A0_26, "QuestComboBox", L5_31, "QuestItemName")
  A0_26:setText("ComboBox_Category_Quest", L7_33)
end
function JournalListWidget.processUICommandOperate(A0_34, A1_35, A2_36, A3_37, A4_38)
  if A2_36 == "Button_History" then
    desktopWidget:openChildWidget("GuildleveHistoryWidget", A0_34, true)
    return
  end
end
function JournalListWidget.getAskResult(A0_39)
  local L1_40, L2_41
  L1_40 = A0_39.work
  L1_40 = L1_40.mode
  if L1_40 == 2 then
  elseif L1_40 == 5 then
  elseif L1_40 == 6 then
  else
  end
  if L1_40 == 7 then
    L2_41 = A0_39.work
    L2_41 = L2_41.resultJournalID
    return L2_41
  else
  end
  if L1_40 == 3 then
    L2_41 = A0_39.work
    L2_41 = L2_41.resultJournalID
    return L2_41, A0_39.work.guildleveFlag
  else
  end
  if L1_40 == 4 then
    L2_41 = A0_39.work
    L2_41 = L2_41.resultSelectFlag
    do return L2_41 end
    break
  else
  end
  L1_40 = nil
  return L1_40
end
function JournalListWidget.finish(A0_42, A1_43)
  if A0_42.work.mode == 1 then
    desktopWidget:closeWidgetDirect(A0_42)
    return
  else
  end
  if A0_42.work.mode == 4 then
    A0_42.work.resultSelectFlag = true
    do break end
    break
  else
  end
  if A1_43 ~= nil then
    A0_42.work.resultJournalID = A1_43
  else
    A0_42.work.resultJournalID = 0
  end
  A0_42:setBaseAskResult(1)
end
function JournalListWidget.createCategoryComboBox(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49, L6_50, L7_51, L8_52
  L3_47 = 1
  if A1_45 ~= nil then
    L3_47 = A1_45
  end
  L4_48 = 0
  for L8_52 = L3_47, 30 do
    A0_44:addQuestComboBox(L8_52, L4_48)
    L4_48 = L4_48 + 1
  end
  if A2_46 then
    L8_52 = L4_48
    L5_49(L6_50, L7_51, L8_52)
    L4_48 = L4_48 + 1
    L8_52 = L4_48
    L5_49(L6_50, L7_51, L8_52)
    L4_48 = L4_48 + 1
  end
  L5_49(L6_50, L7_51)
  L8_52 = 0
  L5_49(L6_50, L7_51, L8_52)
end
function JournalListWidget.addQuestComboBox(A0_53, A1_54, A2_55)
  local L3_56, L4_57, L5_58, L6_59
  L3_56 = 4028
  L4_57 = nil
  L5_58 = 295
  L6_59 = 78429
  if A1_54 == 1 then
    L3_56 = 4029
    break
  else
  end
  if A1_54 == 2 then
    L4_57 = 5
    L5_58 = 104
    L6_59 = 78430
    break
  else
  end
  if A1_54 == 3 then
    L4_57 = 101
    L5_58 = 222
    L6_59 = 78431
    break
  else
  end
  if A1_54 == 4 then
    L3_56 = 4031
    L5_58 = 527
    L6_59 = 78453
    break
  else
  end
  if A1_54 == 5 then
    L3_56 = 4032
    L5_58 = 528
    L6_59 = 78455
    break
  else
  end
  if A1_54 == 6 then
    L3_56 = 4033
    L5_58 = 529
    L6_59 = 78454
    break
  else
  end
  if A1_54 == 7 then
    L3_56 = 4037
    L5_58 = 941
    L6_59 = 78457
    break
  else
  end
  if A1_54 == 8 then
    L3_56 = 4038
    L5_58 = 940
    L6_59 = 78458
    break
  else
  end
  if A1_54 == 9 then
    L3_56 = 4039
    L5_58 = 944
    L6_59 = 78459
    break
  else
  end
  if A1_54 == 10 then
    L3_56 = 4040
    L5_58 = 945
    L6_59 = 78460
    break
  else
  end
  if A1_54 == 11 then
    L3_56 = 4041
    L5_58 = 939
    L6_59 = 78461
    break
  else
  end
  if A1_54 == 12 then
    L3_56 = 4042
    L5_58 = 943
    L6_59 = 78462
    break
  else
  end
  if A1_54 == 13 then
    L3_56 = 4043
    L5_58 = 942
    L6_59 = 78463
    break
  else
  end
  if A1_54 == 14 then
    L4_57 = 7
    L5_58 = 203
    L6_59 = 78432
    break
  else
  end
  if A1_54 == 15 then
    L4_57 = 6
    L5_58 = 206
    L6_59 = 78433
    break
  else
  end
  if A1_54 == 16 then
    L4_57 = 8
    L5_58 = 204
    L6_59 = 78434
    break
  else
  end
  if A1_54 == 17 then
    L4_57 = 10
    L5_58 = 205
    L6_59 = 78435
    break
  else
  end
  if A1_54 == 18 then
    L4_57 = 9
    L5_58 = 207
    L6_59 = 78436
    break
  else
  end
  if A1_54 == 19 then
    L4_57 = 12
    L5_58 = 234
    L6_59 = 78437
    break
  else
  end
  if A1_54 == 20 then
    L4_57 = 11
    L5_58 = 233
    L6_59 = 78438
    break
  else
  end
  if A1_54 == 21 then
    L4_57 = 13
    L5_58 = 212
    L6_59 = 78439
    break
  else
  end
  if A1_54 == 22 then
    L4_57 = 14
    L5_58 = 209
    L6_59 = 78440
    break
  else
  end
  if A1_54 == 23 then
    L4_57 = 16
    L5_58 = 213
    L6_59 = 78441
    break
  else
  end
  if A1_54 == 24 then
    L4_57 = 17
    L5_58 = 211
    L6_59 = 78442
    break
  else
  end
  if A1_54 == 25 then
    L4_57 = 18
    L5_58 = 210
    L6_59 = 78443
    break
  else
  end
  if A1_54 == 26 then
    L4_57 = 19
    L5_58 = 215
    L6_59 = 78444
    break
  else
  end
  if A1_54 == 27 then
    L4_57 = 20
    L5_58 = 214
    L6_59 = 78445
    break
  else
  end
  if A1_54 == 28 then
    L4_57 = 21
    L5_58 = 217
    L6_59 = 78446
    break
  else
  end
  if A1_54 == 29 then
    L4_57 = 22
    L5_58 = 218
    L6_59 = 78447
    break
  else
  end
  if A1_54 == 30 then
    L4_57 = 23
    L5_58 = 219
    L6_59 = 78448
    break
  else
  end
  if A1_54 == 31 then
    L3_56 = 2941
    L5_58 = 296
    L6_59 = 78488
    break
  else
  end
  if A1_54 == 32 then
    L3_56 = 5107
    L5_58 = 242
    L6_59 = 78489
    do break end
    break
  else
  end
  A0_53:setListText("QuestComboBox", A2_55, "QuestItemName", L3_56, L4_57)
  A0_53:setListProperty("QuestComboBox", A2_55, "QuestIcon", L5_58)
  A0_53:setListProperty("QuestComboBox", A2_55, "QuestType", A1_54)
  if L6_59 ~= nil then
    A0_53:setListProperty("QuestComboBox", A2_55, "ComboBoxItemHelpType", 1)
    A0_53:setListProperty("QuestComboBox", A2_55, "ComboBoxItemHelpValue0", L6_59)
  end
end
function JournalListWidget.createList(A0_60)
  local L1_61
  L1_61 = A0_60.setVisibility
  L1_61(A0_60, "ListBox_JournalList", false)
  L1_61 = A0_60.deleteListPropertyAll
  L1_61(A0_60, "ListBox")
  L1_61 = 0
  if A0_60.work.mode == 1 then
    if A0_60.work.questType == 1 then
      L1_61 = A0_60:addQuestList(L1_61)
      L1_61 = A0_60:addActiveGuildleveList(L1_61)
      L1_61 = A0_60:addPassiveGuildleveList(L1_61)
    else
      L1_61 = A0_60:addQuestCompleteList(L1_61)
      do break end
      else
      end
      if A0_60.work.mode == 2 then
        L1_61 = A0_60:addActiveGuildleveList(L1_61)
        break
      else
      end
      if A0_60.work.mode == 3 then
        L1_61 = A0_60:addQuestList(L1_61)
        L1_61 = A0_60:addPassiveGuildleveList(L1_61)
        break
      else
      end
      if A0_60.work.mode == 4 then
        L1_61 = A0_60:addActiveGuildleveList(L1_61)
        break
      else
      end
      if A0_60.work.mode == 5 then
        L1_61 = A0_60:addQuestList(L1_61)
        break
      else
      end
      if A0_60.work.mode == 6 then
        L1_61 = A0_60:addPassiveGuildleveList(L1_61)
        break
      else
      end
      if A0_60.work.mode == 7 then
        L1_61 = A0_60:addQuestCompleteListForCutsceneReplay(L1_61)
        do break end
        break
      else
      end
    end
  A0_60:updateListProperty("ListBox")
  A0_60:setVisibility("ListBox_JournalList", true)
end
function JournalListWidget.addListTitle(A0_62, A1_63, A2_64, A3_65)
  A0_62:setListPropertyTemplate("ListBox", A1_63, "DataTemplate_ListBoxItem_Title")
  A0_62:setListText("ListBox", A1_63, "TitleText", A2_64)
  A0_62:setListProperty("ListBox", A1_63, "TitleHelpType", 1)
  A0_62:setListProperty("ListBox", A1_63, "TitleHelpValue0", A3_65)
  A0_62:setListProperty("ListBox", A1_63, "JournalType", 0)
  return A1_63 + 1
end
function JournalListWidget.addActiveGuildleveList(A0_66, A1_67)
  local L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L10_76, L11_77
  L2_68 = A1_67
  L4_70 = A0_66
  L3_69 = A0_66.addListTitle
  L3_69 = L3_69(L4_70, L5_71, L6_72, L7_73)
  A1_67 = L3_69
  L3_69 = worldMaster
  L4_70 = L3_69
  L3_69 = L3_69._getMyPlayer
  L3_69 = L3_69(L4_70)
  L4_70 = L3_69.getGuildleveIndexMax
  L4_70 = L4_70(L5_71)
  for L8_74 = 1, L4_70 do
    L10_76 = L3_69
    L9_75 = L3_69.getGuildleveID
    L11_77 = L8_74
    L9_75 = L9_75(L10_76, L11_77)
    if L9_75 ~= 0 then
      L11_77 = L3_69
      L10_76 = L3_69.isDoneGuildleveById
      L10_76 = L10_76(L11_77, L9_75)
      L11_77 = L3_69.isCheckedGuildleveById
      L11_77 = L11_77(L3_69, L9_75)
      A0_66:setListProperty("ListBox", A1_67, "JournalIndex", L8_74)
      A1_67 = A0_66:setListItem(A1_67, 1, L9_75, 4101, L10_76, L11_77)
    end
  end
  L8_74 = "ListBox"
  L9_75 = L2_68
  L10_76 = "NumberText"
  L11_77 = 228
  L6_72(L7_73, L8_74, L9_75, L10_76, L11_77, L5_71, 8)
  return A1_67
end
function JournalListWidget.addPassiveGuildleveList(A0_78, A1_79)
  local L2_80, L3_81, L4_82, L5_83, L6_84, L7_85, L8_86, L9_87, L10_88, L11_89, L12_90
  L2_80 = A1_79
  L4_82 = A0_78
  L3_81 = A0_78.addListTitle
  L3_81 = L3_81(L4_82, L5_83, L6_84, L7_85)
  A1_79 = L3_81
  L3_81 = worldMaster
  L4_82 = L3_81
  L3_81 = L3_81._getMyPlayer
  L3_81 = L3_81(L4_82)
  L4_82 = L3_81.getGuildleveQuestLength
  L4_82 = L4_82(L5_83)
  for L8_86 = 1, L4_82 do
    L10_88 = L3_81
    L9_87 = L3_81.getGuildleveQuest
    L11_89 = L8_86
    L9_87 = L9_87(L10_88, L11_89)
    if L9_87 ~= nil then
      L11_89 = L9_87
      L10_88 = L9_87.getQuestId
      L10_88 = L10_88(L11_89)
      L12_90 = L3_81
      L11_89 = L3_81.isDoneLocalleveById
      L11_89 = L11_89(L12_90, L10_88)
      L12_90 = L3_81.isCheckedLocalleveById
      L12_90 = L12_90(L3_81, L10_88)
      A0_78:setListProperty("ListBox", A1_79, "JournalIndex", L8_86)
      A1_79 = A0_78:setListItem(A1_79, 2, L10_88, 5001, L11_89, L12_90)
    end
  end
  L8_86 = "ListBox"
  L9_87 = L2_80
  L10_88 = "NumberText"
  L11_89 = 228
  L12_90 = L5_83
  L6_84(L7_85, L8_86, L9_87, L10_88, L11_89, L12_90, L4_82)
  return A1_79
end
function JournalListWidget.addQuestList(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99
  L2_93 = A1_92
  L4_95 = A0_91
  L3_94 = A0_91.addListTitle
  L3_94 = L3_94(L4_95, L5_96, L6_97, L7_98)
  A1_92 = L3_94
  L3_94 = worldMaster
  L4_95 = L3_94
  L3_94 = L3_94._getMyPlayer
  L3_94 = L3_94(L4_95)
  L4_95 = L3_94.getScenarioQuestLength
  L4_95 = L4_95(L5_96)
  for L8_99 = 1, L4_95 do
    if L3_94:getScenarioQuest(L8_99) ~= nil and L3_94:getScenarioQuest(L8_99):_isAlive() then
      A0_91:setListProperty("ListBox", A1_92, "JournalIndex", L8_99)
      A1_92 = A0_91:setListItem(A1_92, 3, L3_94:getScenarioQuest(L8_99):getQuestId(), 5001)
    end
  end
  L8_99 = "ListBox"
  L6_97(L7_98, L8_99, L2_93, "NumberText", 228, L5_96, L4_95)
  return A1_92
end
function JournalListWidget.addQuestCompleteList(A0_100, A1_101)
  local L2_102, L3_103, L4_104, L5_105, L6_106, L7_107, L8_108
  L2_102 = worldMaster
  L3_103 = L2_102
  L2_102 = L2_102._getMyPlayer
  L2_102 = L2_102(L3_103)
  L4_104 = A0_100
  L3_103 = A0_100.getQuestCompleteID
  L4_104 = L3_103(L4_104, L5_105)
  for L8_108 = L3_103, L4_104 do
    if L2_102:isQuestComplete(L8_108) == true then
      A0_100:setListProperty("ListBox", A1_101, "JournalIndex", 0)
      A1_101 = A0_100:setListItem(A1_101, 3, L8_108, 5001)
    end
  end
  return A1_101
end
function JournalListWidget.addQuestCompleteListForCutsceneReplay(A0_109, A1_110)
  local L2_111, L3_112, L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119
  L2_111 = worldMaster
  L3_112 = L2_111
  L2_111 = L2_111._getMyPlayer
  L2_111 = L2_111(L3_112)
  L4_113 = A0_109
  L3_112 = A0_109.getQuestCompleteID
  L4_113 = L3_112(L4_113, L5_114)
  if L3_112 == 110820 then
    for L8_117 = 1, L4_113 do
      L10_119 = cutReplaySheet
      L10_119 = L10_119._isExistKey
      L10_119 = L10_119(L10_119, L9_118)
      if L10_119 then
        L10_119 = L2_111._isCompletedCutSceneReplayQuest
        L10_119 = L10_119(L2_111, L9_118)
        if L10_119 == true then
          L10_119 = A0_109.setListProperty
          L10_119(A0_109, "ListBox", A1_110, "JournalIndex", 0)
          L10_119 = A0_109.setListItem
          L10_119 = L10_119(A0_109, A1_110, 3, L9_118, 5108)
          A1_110 = L10_119
        end
      end
    end
  else
    if L3_112 == 110600 then
    end
    for L10_119 = L3_112, L4_113 do
      if (L10_119 < L5_114 or L10_119 > L6_115) and L2_111:_isCompletedCutSceneReplayQuest(L10_119) == true then
        A0_109:setListProperty("ListBox", A1_110, "JournalIndex", 0)
        A1_110 = A0_109:setListItem(A1_110, 3, L10_119, 5106)
      end
    end
  end
  return A1_110
end
function JournalListWidget.setListItem(A0_120, A1_121, A2_122, A3_123, A4_124, A5_125, A6_126)
  local L7_127, L8_128, L9_129, L10_130, L11_131, L12_132
  L8_128 = A0_120
  L7_127 = A0_120.setListText
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "Name"
  L12_132 = A4_124
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132, A3_123)
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "ItemColor"
  L12_132 = tostring
  L12_132 = L12_132(1)
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132, L12_132(1))
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "VisibilityIconActive"
  L12_132 = "Collapsed"
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132)
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "VisibilityIconClear"
  L12_132 = "Collapsed"
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132)
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "VisibilityIconFail"
  L12_132 = "Collapsed"
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132)
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "VisibilityIconQuestActive"
  L12_132 = "Collapsed"
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132)
  L8_128 = A0_120
  L7_127 = A0_120.setListProperty
  L9_129 = "ListBox"
  L10_130 = A1_121
  L11_131 = "VisibilityIconQuestClear"
  L12_132 = "Collapsed"
  L7_127(L8_128, L9_129, L10_130, L11_131, L12_132)
  L7_127 = desktopWidget
  L8_128 = L7_127
  L7_127 = L7_127.getJournalIconID
  L9_129 = A2_122
  L10_130 = A3_123
  L8_128 = L7_127(L8_128, L9_129, L10_130)
  if L7_127 ~= 0 then
    L10_130 = A0_120
    L9_129 = A0_120.setListProperty
    L11_131 = "ListBox"
    L12_132 = A1_121
    L9_129(L10_130, L11_131, L12_132, "CategoryIcon", L7_127)
    L10_130 = A0_120
    L9_129 = A0_120.setListProperty
    L11_131 = "ListBox"
    L12_132 = A1_121
    L9_129(L10_130, L11_131, L12_132, "CategoryIconHelp", L8_128)
  else
    L10_130 = A0_120
    L9_129 = A0_120.setListProperty
    L11_131 = "ListBox"
    L12_132 = A1_121
    L9_129(L10_130, L11_131, L12_132, "VisibilityIconCategory", "Collapsed")
  end
  L10_130 = A0_120
  L9_129 = A0_120.setListProperty
  L11_131 = "ListBox"
  L12_132 = A1_121
  L9_129(L10_130, L11_131, L12_132, "VisibilityIconReward", "Collapsed")
  L10_130 = A0_120
  L9_129 = A0_120.setListProperty
  L11_131 = "ListBox"
  L12_132 = A1_121
  L9_129(L10_130, L11_131, L12_132, "VisibilityTextReward", "Collapsed")
  L10_130 = A0_120
  L9_129 = A0_120.setListProperty
  L11_131 = "ListBox"
  L12_132 = A1_121
  L9_129(L10_130, L11_131, L12_132, "JournalType", A2_122)
  L10_130 = A0_120
  L9_129 = A0_120.setListProperty
  L11_131 = "ListBox"
  L12_132 = A1_121
  L9_129(L10_130, L11_131, L12_132, "JournalID", A3_123)
  if A2_122 == 1 or A2_122 == 2 or A2_122 == 4 then
    if A5_125 == true then
      if A6_126 == true then
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "VisibilityIconClear", "Visible")
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "HelpTypeIconClear", 1)
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "HelpValue0IconClear", 78427)
      else
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "VisibilityIconFail", "Visible")
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "HelpTypeIconFail", 1)
        L10_130 = A0_120
        L9_129 = A0_120.setListProperty
        L11_131 = "ListBox"
        L12_132 = A1_121
        L9_129(L10_130, L11_131, L12_132, "HelpValue0IconFail", 78428)
      end
    elseif A6_126 == true then
      L10_130 = A0_120
      L9_129 = A0_120.setListProperty
      L11_131 = "ListBox"
      L12_132 = A1_121
      L9_129(L10_130, L11_131, L12_132, "VisibilityIconActive", "Visible")
      L10_130 = A0_120
      L9_129 = A0_120.setListProperty
      L11_131 = "ListBox"
      L12_132 = A1_121
      L9_129(L10_130, L11_131, L12_132, "HelpTypeIconActive", 1)
      L10_130 = A0_120
      L9_129 = A0_120.setListProperty
      L11_131 = "ListBox"
      L12_132 = A1_121
      L9_129(L10_130, L11_131, L12_132, "HelpValue0IconActive", 78426)
    end
  else
  end
  L9_129 = A0_120.work
  L9_129 = L9_129.mode
  if L9_129 == 2 then
  else
  end
  if L9_129 == 3 then
    L10_130 = true
    L12_132 = A0_120
    L11_131 = A0_120.getArgActor
    L11_131 = L11_131(L12_132)
    if L11_131 ~= nil then
      L12_132 = worldMaster
      L12_132 = L12_132._getMyPlayer
      L12_132 = L12_132(L12_132)
      if L11_131:canUseGuildleve(L12_132, A3_123) == false then
        L10_130 = false
      end
    end
    if A5_125 == true then
      if A6_126 == true then
        if A2_122 == 1 then
          L10_130 = false
        end
      else
        L10_130 = false
      end
    else
      if A6_126 == true then
      else
      end
    end
    if L10_130 == false then
      L12_132 = A0_120.setListProperty
      L12_132(A0_120, "ListBox", A1_121, "ItemColor", tostring(0.5))
      L12_132 = A0_120.setListProperty
      L12_132(A0_120, "ListBox", A1_121, "JournalType", 0)
    else
    end
  else
  end
  L9_129 = A1_121 + 1
  return L9_129
end
function JournalListWidget.requestQuestComplete(A0_133)
  local L1_134, L2_135
  L2_135 = A0_133
  L1_134 = A0_133.getQuestCompleteID
  L2_135 = L1_134(L2_135, A0_133.work.questType)
  A0_133.work.requestResult = desktopWidget:updateQuestComplete(L1_134, L2_135)
  if A0_133.work.requestResult == false then
    desktopWidget:openCommandFailedWidget(A0_133, 4311)
  end
  return A0_133.work.requestResult
end
function JournalListWidget.updateList(A0_136, A1_137)
  if A0_136.work.mode ~= 1 then
    return
  end
  A0_136:createList()
end
function JournalListWidget.getQuestCompleteID(A0_138, A1_139)
  local L2_140, L3_141, L4_142, L5_143
  L2_140 = 0
  L3_141 = 0
  L4_142 = A1_139
  if L4_142 == 2 then
    L2_140 = 110001
    L3_141 = 110059
    break
  else
  end
  if L4_142 == 3 then
    L2_140 = 110600
    L3_141 = 110971
    break
  else
  end
  if L4_142 == 4 then
    L2_140 = 111401
    L3_141 = 111599
    break
  else
  end
  if L4_142 == 5 then
    L2_140 = 111601
    L3_141 = 111799
    break
  else
  end
  if L4_142 == 6 then
    L2_140 = 111801
    L3_141 = 111999
    break
  else
  end
  if L4_142 == 7 then
    L2_140 = 111200
    L3_141 = 111219
    break
  else
  end
  if L4_142 == 8 then
    L2_140 = 111220
    L3_141 = 111239
    break
  else
  end
  if L4_142 == 9 then
    L2_140 = 111240
    L3_141 = 111259
    break
  else
  end
  if L4_142 == 10 then
    L2_140 = 111260
    L3_141 = 111279
    break
  else
  end
  if L4_142 == 11 then
    L2_140 = 111280
    L3_141 = 111299
    break
  else
  end
  if L4_142 == 12 then
    L2_140 = 111300
    L3_141 = 111319
    break
  else
  end
  if L4_142 == 13 then
    L2_140 = 111320
    L3_141 = 111339
    break
  else
  end
  if L4_142 == 14 then
    L2_140 = 110080
    L3_141 = 110099
    break
  else
  end
  if L4_142 == 15 then
    L2_140 = 110060
    L3_141 = 110079
    break
  else
  end
  if L4_142 == 16 then
    L2_140 = 110100
    L3_141 = 110119
    break
  else
  end
  if L4_142 == 17 then
    L2_140 = 110180
    L3_141 = 110199
    break
  else
  end
  if L4_142 == 18 then
    L2_140 = 110160
    L3_141 = 110179
    break
  else
  end
  if L4_142 == 19 then
    L2_140 = 110260
    L3_141 = 110279
    break
  else
  end
  if L4_142 == 20 then
    L2_140 = 110240
    L3_141 = 110259
    break
  else
  end
  if L4_142 == 21 then
    L2_140 = 110300
    L3_141 = 110319
    break
  else
  end
  if L4_142 == 22 then
    L2_140 = 110320
    L3_141 = 110339
    break
  else
  end
  if L4_142 == 23 then
    L2_140 = 110360
    L3_141 = 110379
    break
  else
  end
  if L4_142 == 24 then
    L2_140 = 110380
    L3_141 = 110399
    break
  else
  end
  if L4_142 == 25 then
    L2_140 = 110400
    L3_141 = 110419
    break
  else
  end
  if L4_142 == 26 then
    L2_140 = 110420
    L3_141 = 110439
    break
  else
  end
  if L4_142 == 27 then
    L2_140 = 110440
    L3_141 = 110459
    break
  else
  end
  if L4_142 == 28 then
    L2_140 = 110460
    L3_141 = 110479
    break
  else
  end
  if L4_142 == 29 then
    L2_140 = 110480
    L3_141 = 110499
    break
  else
  end
  if L4_142 == 30 then
    L2_140 = 110500
    L3_141 = 110519
    break
  else
  end
  if L4_142 == 31 then
    L2_140 = 110821
    L3_141 = 110824
    break
  else
  end
  if L4_142 == 32 then
    L2_140 = 110820
    L3_141 = 20
    do break end
    break
  else
  end
  L4_142 = L2_140
  L5_143 = L3_141
  return L4_142, L5_143
end
