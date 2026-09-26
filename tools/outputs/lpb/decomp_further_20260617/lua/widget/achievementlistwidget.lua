require("/Widget/AchievementListWidget")
_defineClass("AchievementListWidget", "WidgetBaseClass")
function AchievementListWidget.init(A0_0)
  A0_0.work._temp = {
    {"helpItemID", "integer32"},
    {"dispItemID", "integer32"},
    {
      "categoryIndex",
      "integer8"
    },
    {
      "currentControl",
      "string",
      32
    }
  }
  A0_0.work.helpItemID = 0
  A0_0.work.dispItemID = 0
  A0_0.work.categoryIndex = 0
  A0_0.work.currentControl = "ListBox_Category"
  worldMaster:_getMyPlayer():_clearAchievementRateCache()
  A0_0:setModal(true)
  A0_0:setUICommandCondition("UILuaCommands.EnterSelectorMouseFocus")
  A0_0:setUICommandCondition("UILuaCommands.EnterSelectorKeyboardFocus")
  A0_0:setUICommandCondition("UILuaCommands.LostMouseFocus")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setControlCommandCondition("ListBox_Category", "UILuaCommands.Selection")
  A0_0:setControlCommandCondition("ListBox_AchievementList", "UILuaCommands.Selection")
  A0_0:setText("TextBlock_WindowTitle", 12002)
  A0_0:initCategoryList()
  A0_0:initAchievementPoint()
  A0_0:initAchievementList()
  A0_0:initChildWidget("AchievementDetailWidget", false)
end
function AchievementListWidget.initCategoryList(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6
  L1_2 = A0_1.addAchievementCategoryItem
  L1_2(L2_3, L3_4)
  L1_2 = worldMaster
  L1_2 = L1_2._getMyPlayer
  L1_2 = L1_2(L2_3)
  L1_2 = L1_2._countAchievementCategory
  L1_2 = L1_2(L2_3)
  for L5_6 = 1, L1_2 do
    A0_1:addAchievementCategoryItem(L5_6)
  end
  L2_3(L3_4, L4_5)
end
function AchievementListWidget.addAchievementCategoryItem(A0_7, A1_8)
  local L2_9, L3_10, L4_11, L5_12, L6_13, L7_14
  L2_9 = worldMaster
  L3_10 = L2_9
  L2_9 = L2_9._getMyPlayer
  L2_9 = L2_9(L3_10)
  L3_10 = 0
  L4_11 = false
  L5_12 = false
  if A1_8 == 0 then
    L7_14 = A0_7
    L6_13 = A0_7.setListText
    L6_13(L7_14, "Category_Maker", A1_8, "name", 12004)
    L7_14 = A0_7
    L6_13 = A0_7.setListProperty
    L6_13(L7_14, "Category_Maker", A1_8, "selectvisible", true)
    L7_14 = A0_7
    L6_13 = A0_7.setListProperty
    L6_13(L7_14, "Category_Maker", A1_8, "hoverHelp", 79503)
  else
    L7_14 = L2_9
    L6_13 = L2_9._getAchievementCategoryId
    L6_13 = L6_13(L7_14, A1_8)
    L7_14 = A0_7.setListText
    L7_14(A0_7, "Category_Maker", A1_8, "name", 12015, L6_13)
    L7_14 = A0_7.setListProperty
    L7_14(A0_7, "Category_Maker", A1_8, "selectvisible", false)
    L7_14 = A0_7.setListProperty
    L7_14(A0_7, "Category_Maker", A1_8, "hoverHelp", 79504)
    L7_14 = L2_9._getAchievementSheetDataIcon
    L7_14 = L7_14(L2_9, L6_13)
    L3_10 = L7_14
    L4_11 = true
    L7_14 = L2_9._isDoneAchievement
    L7_14 = L7_14(L2_9, L6_13)
    if L7_14 == false then
      L5_12 = true
    end
  end
  L6_13 = 1
  L7_14 = 1
  if L5_12 == true then
    L6_13 = 0.6
    L7_14 = 0.8
  end
  A0_7:setListProperty("Category_Maker", A1_8, "icon", L3_10)
  A0_7:setListProperty("Category_Maker", A1_8, "iconvisible", L4_11)
  A0_7:setListProperty("Category_Maker", A1_8, "color", tostring(L6_13))
  A0_7:setListProperty("Category_Maker", A1_8, "alpha", tostring(L7_14))
  A0_7:setListProperty("Category_Maker", A1_8, "lockvisible", L5_12)
end
function AchievementListWidget.initAchievementPoint(A0_15)
  A0_15:updateAchievementPoint()
  A0_15:setText("TextBlock_AchievementCategory", 12005)
end
function AchievementListWidget.initAchievementList(A0_16)
  A0_16:updateAchievementList(0)
end
function AchievementListWidget.processUICommandSelection(A0_17, A1_18, A2_19, A3_20, A4_21)
  local L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35, L19_36, L20_37
  L5_22 = A2_19
  if L5_22 == "ListBox_Category" then
    L6_23 = A0_17.work
    L6_23 = L6_23.currentControl
    if L6_23 ~= "ListBox_Category" then
      L6_23 = A0_17.work
      L6_23.currentControl = "ListBox_Category"
    end
    L6_23 = A0_17.work
    L6_23 = L6_23.categoryIndex
    if L6_23 ~= A3_20 then
      L7_24 = A0_17
      L6_23 = A0_17.setListProperty
      L8_25 = "Category_Maker"
      L9_26 = A0_17.work
      L9_26 = L9_26.categoryIndex
      L10_27 = "selectvisible"
      L11_28 = false
      L6_23(L7_24, L8_25, L9_26, L10_27, L11_28)
      L7_24 = A0_17
      L6_23 = A0_17.setListProperty
      L8_25 = "Category_Maker"
      L9_26 = A3_20
      L10_27 = "selectvisible"
      L11_28 = true
      L6_23(L7_24, L8_25, L9_26, L10_27, L11_28)
      L7_24 = A0_17
      L6_23 = A0_17.updateListProperty
      L8_25 = "Category_Maker"
      L6_23(L7_24, L8_25)
      L6_23 = A0_17.work
      L6_23.categoryIndex = A3_20
      if A3_20 == 0 then
        L7_24 = A0_17
        L6_23 = A0_17.setText
        L8_25 = "TextBlock_AchievementCategory"
        L9_26 = 12005
        L6_23(L7_24, L8_25, L9_26)
      else
        L7_24 = A0_17
        L6_23 = A0_17.setText
        L8_25 = "TextBlock_AchievementCategory"
        L9_26 = 12019
        L10_27 = worldMaster
        L11_28 = L10_27
        L10_27 = L10_27._getMyPlayer
        L10_27 = L10_27(L11_28)
        L11_28 = L10_27
        L10_27 = L10_27._getAchievementCategoryId
        L12_29 = A3_20
        L20_37 = L10_27(L11_28, L12_29)
        L6_23(L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34, L18_35, L19_36, L20_37, L10_27(L11_28, L12_29))
      end
      L7_24 = A0_17
      L6_23 = A0_17.updateAchievementList
      L8_25 = A3_20
      L6_23(L7_24, L8_25)
    end
    if A3_20 > 0 then
      L6_23 = worldMaster
      L7_24 = L6_23
      L6_23 = L6_23._getMyPlayer
      L6_23 = L6_23(L7_24)
      L8_25 = L6_23
      L7_24 = L6_23._getAchievementCategoryId
      L9_26 = A3_20
      L7_24 = L7_24(L8_25, L9_26)
      L9_26 = L6_23
      L8_25 = L6_23._isDoneAchievement
      L10_27 = L7_24
      L8_25 = L8_25(L9_26, L10_27)
      if L8_25 == true then
        L9_26 = desktopWidget
        L10_27 = L9_26
        L9_26 = L9_26._getKeyboardFocusedWidget
        L9_26 = L9_26(L10_27)
        if L9_26 == A0_17 then
          L10_27 = A0_17
          L9_26 = A0_17.setKeyboardFocusedControl
          L11_28 = "ListBox_AchievementList"
          L9_26(L10_27, L11_28)
          L9_26 = A0_17.work
          L9_26.currentControl = "ListBox_AchievementList"
        end
      end
    else
      L6_23 = desktopWidget
      L7_24 = L6_23
      L6_23 = L6_23._getKeyboardFocusedWidget
      L6_23 = L6_23(L7_24)
      if L6_23 == A0_17 then
        L7_24 = A0_17
        L6_23 = A0_17.setKeyboardFocusedControl
        L8_25 = "ListBox_AchievementList"
        L6_23(L7_24, L8_25)
        L6_23 = A0_17.work
        L6_23.currentControl = "ListBox_AchievementList"
        do break end
        else
        end
        if L5_22 == "ListBox_AchievementList" then
          L6_23 = A0_17.work
          L6_23 = L6_23.currentControl
          if L6_23 ~= "ListBox_AchievementList" then
            L6_23 = A0_17.work
            L6_23.currentControl = "ListBox_AchievementList"
          end
          L7_24 = A0_17
          L6_23 = A0_17.getListProperty
          L8_25 = "Achievement_Maker"
          L9_26 = A3_20
          L10_27 = "achievementID"
          L6_23 = L6_23(L7_24, L8_25, L9_26, L10_27)
          if L6_23 == 0 then
          else
            L7_24 = "BOD_basis_ArrowDown"
            L8_25 = false
            L10_27 = A0_17
            L9_26 = A0_17.getListProperty
            L11_28 = "Achievement_Maker"
            L12_29 = A3_20
            L13_30 = "detailvisible"
            L9_26 = L9_26(L10_27, L11_28, L12_29, L13_30)
            if L9_26 == false then
              L7_24 = "BOD_basis_ArrowUp"
              L8_25 = true
              L10_27 = worldMaster
              L11_28 = L10_27
              L10_27 = L10_27._getMyPlayer
              L10_27 = L10_27(L11_28)
              L11_28 = L10_27
              L10_27 = L10_27._getAchievementRate
              L12_29 = L6_23
              L11_28 = L10_27(L11_28, L12_29)
              L13_30 = A0_17
              L12_29 = A0_17.setRate
              L14_31 = A3_20
              L15_32 = L10_27
              L16_33 = L11_28
              L12_29(L13_30, L14_31, L15_32, L16_33)
              L13_30 = A0_17
              L12_29 = A0_17.setListProperty
              L14_31 = "Achievement_Maker"
              L15_32 = A3_20
              L16_33 = "detailvisible"
              L17_34 = L8_25
              L12_29(L13_30, L14_31, L15_32, L16_33, L17_34)
              L9_26 = true
            end
            if L9_26 == true then
              L11_28 = A0_17
              L10_27 = A0_17.getChildWidgetByWindowName
              L12_29 = "AchievementDetailWidget"
              L10_27 = L10_27(L11_28, L12_29)
              if L10_27 ~= nil then
                L12_29 = L10_27
                L11_28 = L10_27.isShow
                L11_28 = L11_28(L12_29)
                if L11_28 == false then
                  L11_28 = worldMaster
                  L12_29 = L11_28
                  L11_28 = L11_28._getMyPlayer
                  L11_28 = L11_28(L12_29)
                  L12_29 = L11_28
                  L11_28 = L11_28._countAchievementRateList
                  L13_30 = L6_23
                  L11_28 = L11_28(L12_29, L13_30)
                  if L11_28 > 0 then
                    L12_29 = worldMaster
                    L13_30 = L12_29
                    L12_29 = L12_29._getMyPlayer
                    L12_29 = L12_29(L13_30)
                    L13_30 = L12_29
                    L12_29 = L12_29._getAchievementRate
                    L14_31 = L6_23
                    L13_30 = L12_29(L13_30, L14_31)
                    L14_31 = 0
                    L15_32 = A0_17.work
                    L15_32 = L15_32.categoryIndex
                    if L15_32 > 0 then
                      L15_32 = worldMaster
                      L16_33 = L15_32
                      L15_32 = L15_32._getMyPlayer
                      L15_32 = L15_32(L16_33)
                      L16_33 = L15_32
                      L15_32 = L15_32._getAchievementCategoryId
                      L17_34 = A0_17.work
                      L17_34 = L17_34.categoryIndex
                      L15_32 = L15_32(L16_33, L17_34)
                      L14_31 = L15_32
                    else
                      L14_31 = nil
                    end
                    L15_32 = A3_20 + 1
                    L16_33 = worldMaster
                    L17_34 = L16_33
                    L16_33 = L16_33._getMyPlayer
                    L16_33 = L16_33(L17_34)
                    L17_34 = L16_33
                    L16_33 = L16_33._getAchievementItemId
                    L18_35 = L14_31
                    L19_36 = L15_32
                    L16_33 = L16_33(L17_34, L18_35, L19_36)
                    L17_34 = worldMaster
                    L18_35 = L17_34
                    L17_34 = L17_34._getMyPlayer
                    L17_34 = L17_34(L18_35)
                    L18_35 = L17_34
                    L17_34 = L17_34._getAchievementSheetDataIcon
                    L19_36 = L16_33
                    L17_34 = L17_34(L18_35, L19_36)
                    L18_35 = worldMaster
                    L19_36 = L18_35
                    L18_35 = L18_35._getMyPlayer
                    L18_35 = L18_35(L19_36)
                    L19_36 = L18_35
                    L18_35 = L18_35._getAchievementSheetDataTitle
                    L20_37 = L6_23
                    L18_35 = L18_35(L19_36, L20_37)
                    L19_36 = worldMaster
                    L20_37 = L19_36
                    L19_36 = L19_36._getMyPlayer
                    L19_36 = L19_36(L20_37)
                    L20_37 = L19_36
                    L19_36 = L19_36._getAchievementSheetDataItem
                    L19_36 = L19_36(L20_37, L6_23)
                    L20_37 = 1
                    if L19_36 ~= 0 then
                    elseif L18_35 == 0 then
                      L20_37 = 0
                    end
                    L10_27:setAchievementDetail(L6_23, L17_34, L15_32, L20_37, L12_29, L13_30)
                    L10_27:show()
                    if A0_17:getChildWidgetByWindowName("ItemDetailWidget") ~= nil and desktopWidget:getWindowSize() < 1280 then
                      A0_17:clearItemHelp()
                    end
                  end
                end
              end
            end
            L11_28 = A0_17
            L10_27 = A0_17.updateListProperty
            L12_29 = "Achievement_Maker"
            L10_27(L11_28, L12_29)
            break
          end
        else
        end
      else
      end
    end
end
function AchievementListWidget.processUICommandEnterSelectorFocus(A0_38, A1_39, A2_40, A3_41)
  local L4_42
  L4_42 = 0
  if A2_40 == "ListBox_AchievementList" then
    L4_42 = A0_38:getListProperty("Achievement_Maker", A3_41, "itemID")
    if L4_42 ~= 0 and L4_42 ~= A0_38.work.dispItemID then
      if desktopWidget:getWindowSize() < 1280 and A0_38:getChildWidgetByWindowName("AchievementDetailWidget") ~= nil and A0_38:getChildWidgetByWindowName("AchievementDetailWidget"):isShow() == true then
        return
      end
      A0_38:setCommonTimer(0.5)
    end
  end
  if L4_42 == 0 then
    A0_38:clearItemHelp()
  end
  A0_38.work.helpItemID = L4_42
end
function AchievementListWidget.processUICommandCancel(A0_43, A1_44, A2_45, A3_46, A4_47)
  local L5_48
  L5_48 = A0_43.work
  L5_48 = L5_48.currentControl
  if L5_48 == "ListBox_Category" then
    desktopWidget:closeWidgetDirect(A0_43)
    break
  else
  end
  if L5_48 == "ListBox_AchievementList" and desktopWidget:_getKeyboardFocusedWidget() == A0_43 then
    A0_43:setKeyboardFocusedControl("ListBox_Category")
    A0_43.work.currentControl = "ListBox_Category"
    A0_43:clearItemHelp()
    A0_43.work.helpItemID = 0
    A0_43:setFocusedIndex("ListBox_Category", A0_43.work.categoryIndex)
    break
  else
  end
end
function AchievementListWidget.processUICommandLostMouseFocus(A0_49, A1_50, A2_51)
  if A2_51 == "ListBox_AchievementList" then
    A0_49:clearItemHelp()
    A0_49.work.helpItemID = 0
  end
end
function AchievementListWidget.processTimer(A0_52)
  local L1_53
  L1_53 = A0_52.clearItemHelp
  L1_53(A0_52)
  L1_53 = A0_52.work
  L1_53 = L1_53.helpItemID
  if L1_53 == 0 then
    return
  end
  if desktopWidget:getWindowSize() < 1280 and A0_52:getChildWidgetByWindowName("AchievementDetailWidget") ~= nil and A0_52:getChildWidgetByWindowName("AchievementDetailWidget"):isShow() == true then
    A0_52.work.dispItemID = 0
    A0_52.work.helpItemID = 0
    return
  end
  desktopWidget:openChildWidget("ItemDetailWidget", A0_52, true, false, 620, L1_53, A0_52)
  A0_52.work.dispItemID = L1_53
  A0_52.work.helpItemID = 0
end
function AchievementListWidget.clearItemHelp(A0_54)
  local L1_55
  L1_55 = A0_54.getChildWidgetByWindowName
  L1_55 = L1_55(A0_54, "ItemDetailWidget")
  if L1_55 ~= nil then
    desktopWidget:closeWidgetDirect(L1_55)
  end
  A0_54.work.dispItemID = 0
end
function AchievementListWidget.updateAchievementPoint(A0_56)
  local L1_57, L2_58, L3_59, L4_60
  L2_58 = A0_56
  L1_57 = A0_56.setText
  L3_59 = "TextBlock_AchievementPoint"
  L4_60 = 12003
  L1_57(L2_58, L3_59, L4_60, worldMaster:_getMyPlayer():_getAchievementPoint())
end
function AchievementListWidget.updateAchievementCategoryText(A0_61)
  local L1_62
  L1_62 = A0_61.work
  L1_62 = L1_62.categoryIndex
  if L1_62 == 0 then
    L1_62 = A0_61.setText
    L1_62(A0_61, "TextBlock_AchievementCategory", 12005)
  else
    L1_62 = worldMaster
    L1_62 = L1_62._getMyPlayer
    L1_62 = L1_62(L1_62)
    L1_62 = L1_62._getAchievementCategoryId
    L1_62 = L1_62(L1_62, A0_61.work.categoryIndex)
    A0_61:setText("TextBlock_AchievementCategory", 12019, L1_62)
  end
end
function AchievementListWidget.updateAchievementList(A0_63, A1_64)
  local L2_65, L3_66, L4_67, L5_68
  L2_65 = worldMaster
  L3_66 = L2_65
  L2_65 = L2_65._getMyPlayer
  L2_65 = L2_65(L3_66)
  L4_67 = A0_63
  L3_66 = A0_63.deleteListPropertyAll
  L5_68 = "Achievement_Maker"
  L3_66(L4_67, L5_68)
  L3_66 = nil
  if A1_64 ~= 0 then
    L5_68 = L2_65
    L4_67 = L2_65._getAchievementCategoryId
    L4_67 = L4_67(L5_68, A1_64)
    L3_66 = L4_67
  end
  L5_68 = L2_65
  L4_67 = L2_65._countAchievementItem
  L4_67 = L4_67(L5_68, L3_66)
  L5_68 = A0_63.setAchievementDatas
  L5_68(A0_63, L3_66, 1, L4_67)
  if L3_66 == nil then
    L5_68 = A0_63.getListPropertyCount
    L5_68 = L5_68(A0_63, "Achievement_Maker")
    A0_63:setAchievmentItemHelpPanels(L5_68)
  end
  L5_68 = A0_63.updateListProperty
  L5_68(A0_63, "Achievement_Maker")
end
function AchievementListWidget.setAchievementDatas(A0_69, A1_70, A2_71, A3_72)
  local L4_73, L5_74, L6_75, L7_76, L8_77, L9_78, L10_79, L11_80, L12_81, L13_82, L14_83, L15_84, L16_85, L17_86, L18_87
  L4_73 = worldMaster
  L4_73 = L4_73._getMyPlayer
  L4_73 = L4_73(L5_74)
  if A1_70 ~= nil then
    if L5_74 == false then
      L5_74(L6_75, L7_76)
      L8_77 = 0
      L9_78 = "name"
      L10_79 = 12015
      L11_80 = A1_70
      L5_74(L6_75, L7_76, L8_77, L9_78, L10_79, L11_80)
      L8_77 = 0
      L9_78 = "help"
      L10_79 = 12006
      L11_80 = A1_70
      L5_74(L6_75, L7_76, L8_77, L9_78, L10_79, L11_80)
      return
    end
  end
  for L8_77 = A2_71, A3_72 do
    L9_78 = L8_77 - 1
    L11_80 = L4_73
    L10_79 = L4_73._getAchievementItemId
    L12_81 = A1_70
    L13_82 = L8_77
    L10_79 = L10_79(L11_80, L12_81, L13_82)
    if L10_79 == nil then
      if L8_77 == A2_71 then
        L12_81 = A0_69
        L11_80 = A0_69.setFixedListItemParam
        L13_82 = L9_78
        L11_80(L12_81, L13_82)
        L12_81 = A0_69
        L11_80 = A0_69.setListText
        L13_82 = "Achievement_Maker"
        L14_83 = L9_78
        L15_84 = "help"
        L16_85 = 12007
        L11_80(L12_81, L13_82, L14_83, L15_84, L16_85)
      end
      break
    end
    L12_81 = A0_69
    L11_80 = A0_69.setListProperty
    L13_82 = "Achievement_Maker"
    L14_83 = L9_78
    L15_84 = "bordervisible"
    L16_85 = true
    L11_80(L12_81, L13_82, L14_83, L15_84, L16_85)
    L12_81 = A0_69
    L11_80 = A0_69.setListText
    L13_82 = "Achievement_Maker"
    L14_83 = L9_78
    L15_84 = "name"
    L16_85 = 12015
    L17_86 = L10_79
    L11_80(L12_81, L13_82, L14_83, L15_84, L16_85, L17_86)
    L12_81 = A0_69
    L11_80 = A0_69.setListText
    L13_82 = "Achievement_Maker"
    L14_83 = L9_78
    L15_84 = "help"
    L16_85 = 12016
    L17_86 = L10_79
    L11_80(L12_81, L13_82, L14_83, L15_84, L16_85, L17_86)
    L12_81 = L4_73
    L11_80 = L4_73._isDoneAchievement
    L13_82 = L10_79
    L11_80 = L11_80(L12_81, L13_82)
    if L11_80 == true then
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "gridcolor"
      L17_86 = tostring
      L18_87 = 1
      L18_87 = L17_86(L18_87)
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86, L18_87, L17_86(L18_87))
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "gridalpha"
      L17_86 = tostring
      L18_87 = 1
      L18_87 = L17_86(L18_87)
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86, L18_87, L17_86(L18_87))
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "bordercolor"
      L17_86 = "1.0"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "borderalpha"
      L17_86 = "1.0"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
    else
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "gridcolor"
      L17_86 = "0.6"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "gridalpha"
      L17_86 = "1.0"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "bordercolor"
      L17_86 = "0.5"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
      L13_82 = A0_69
      L12_81 = A0_69.setListProperty
      L14_83 = "Achievement_Maker"
      L15_84 = L9_78
      L16_85 = "borderalpha"
      L17_86 = "0.3"
      L12_81(L13_82, L14_83, L15_84, L16_85, L17_86)
    end
    L13_82 = L4_73
    L12_81 = L4_73._getAchievementSheetDataIcon
    L14_83 = L10_79
    L12_81 = L12_81(L13_82, L14_83)
    L14_83 = A0_69
    L13_82 = A0_69.setListProperty
    L15_84 = "Achievement_Maker"
    L16_85 = L9_78
    L17_86 = "icon"
    L18_87 = L12_81
    L13_82(L14_83, L15_84, L16_85, L17_86, L18_87)
    L14_83 = L4_73
    L13_82 = L4_73._getAchievementSheetDataPoint
    L15_84 = L10_79
    L13_82 = L13_82(L14_83, L15_84)
    if L13_82 > 0 then
      L14_83 = _math
      L14_83 = L14_83.floor
      L15_84 = L13_82 / 10
      L14_83 = L14_83(L15_84)
      L15_84 = L14_83 * 10
      L15_84 = L13_82 - L15_84
      L17_86 = A0_69
      L16_85 = A0_69.setListProperty
      L18_87 = "Achievement_Maker"
      L16_85(L17_86, L18_87, L9_78, "point1", 813 + L15_84)
      if L14_83 == 0 then
        L17_86 = A0_69
        L16_85 = A0_69.setListProperty
        L18_87 = "Achievement_Maker"
        L16_85(L17_86, L18_87, L9_78, "point10v", false)
      else
        L17_86 = A0_69
        L16_85 = A0_69.setListProperty
        L18_87 = "Achievement_Maker"
        L16_85(L17_86, L18_87, L9_78, "point10", 813 + L14_83)
        L17_86 = A0_69
        L16_85 = A0_69.setListProperty
        L18_87 = "Achievement_Maker"
        L16_85(L17_86, L18_87, L9_78, "point10v", true)
      end
      L17_86 = A0_69
      L16_85 = A0_69.setListProperty
      L18_87 = "Achievement_Maker"
      L16_85(L17_86, L18_87, L9_78, "point", true)
    else
      L15_84 = A0_69
      L14_83 = A0_69.setListProperty
      L16_85 = "Achievement_Maker"
      L17_86 = L9_78
      L18_87 = "point"
      L14_83(L15_84, L16_85, L17_86, L18_87, false)
    end
    L15_84 = L4_73
    L14_83 = L4_73._getAchievementSheetDataTitle
    L16_85 = L10_79
    L14_83 = L14_83(L15_84, L16_85)
    L16_85 = L4_73
    L15_84 = L4_73._getAchievementSheetDataItem
    L17_86 = L10_79
    L15_84 = L15_84(L16_85, L17_86)
    L16_85 = true
    L17_86 = 0
    if L15_84 ~= 0 then
      L18_87 = A0_69.setListText
      L18_87(A0_69, "Achievement_Maker", L9_78, "reward", 12013, L15_84)
    elseif L14_83 ~= 0 then
      L18_87 = L4_73.isFemale
      L18_87 = L18_87(L4_73)
      if L18_87 == true then
        L17_86 = 1
      end
      L18_87 = A0_69.setListText
      L18_87(A0_69, "Achievement_Maker", L9_78, "reward", 12012, L14_83, L17_86)
    else
      L16_85 = false
    end
    if L16_85 == true then
      L18_87 = A0_69.setListProperty
      L18_87(A0_69, "Achievement_Maker", L9_78, "style", "BOD_achievement_reward")
      L18_87 = false
      A0_69:setListProperty("Achievement_Maker", L9_78, "rewardget", L18_87)
    else
      L18_87 = A0_69.setListProperty
      L18_87(A0_69, "Achievement_Maker", L9_78, "style", "BOD_achievement_normal")
    end
    L18_87 = A0_69.setListProperty
    L18_87(A0_69, "Achievement_Maker", L9_78, "achievementID", L10_79)
    L18_87 = A0_69.setListProperty
    L18_87(A0_69, "Achievement_Maker", L9_78, "itemID", L15_84)
    L18_87 = A0_69.setListProperty
    L18_87(A0_69, "Achievement_Maker", L9_78, "rewardvisible", L16_85)
    L18_87 = A0_69.setListProperty
    L18_87(A0_69, "Achievement_Maker", L9_78, "arrowstyle", "BOD_basis_ArrowDown")
    L18_87 = A0_69.setListProperty
    L18_87(A0_69, "Achievement_Maker", L9_78, "detailvisible", false)
  end
end
function AchievementListWidget.setAchievmentItemHelpPanels(A0_88, A1_89)
  A0_88:setFixedListItemParam(A1_89)
  A0_88:setListText("Achievement_Maker", A1_89, "name", 12008)
  A0_88:setListText("Achievement_Maker", A1_89, "help", 12009)
  A0_88:setFixedListItemParam(A1_89 + 1)
  A0_88:setListText("Achievement_Maker", A1_89 + 1, "name", 12010)
  A0_88:setListText("Achievement_Maker", A1_89 + 1, "help", 12011)
end
function AchievementListWidget.setFixedListItemParam(A0_90, A1_91)
  A0_90:setListPropertyTemplate("Achievement_Maker", A1_91, "DataTemplate_ListBoxItem_AchievementDescription")
  A0_90:setListProperty("Achievement_Maker", A1_91, "achievementID", 0)
end
function AchievementListWidget.setRate(A0_92, A1_93, A2_94, A3_95)
  local L4_96
  L4_96 = _math
  L4_96 = L4_96.floor
  L4_96 = L4_96(A2_94 * 100 / A3_95)
  A0_92:setListProperty("Achievement_Maker", A1_93, "value", L4_96)
  A0_92:setListText("Achievement_Maker", A1_93, "progress", 12014, A2_94, A3_95, L4_96)
end
function AchievementListWidget.updateRate(A0_97, A1_98, A2_99, A3_100)
  local L4_101, L5_102, L6_103, L7_104, L8_105, L9_106
  L4_101 = A0_97.getListPropertyCount
  L4_101 = L4_101(L5_102, L6_103)
  for L8_105 = 1, L4_101 do
    L9_106 = L8_105 - 1
    if A0_97:getListProperty("Achievement_Maker", L9_106, "achievementID") == A1_98 then
      A0_97:setRate(L9_106, A2_99, A3_100)
      A0_97:updateListProperty("Achievement_Maker")
      break
    end
  end
  if L5_102 ~= nil then
    if L6_103 == true then
      L8_105 = A2_99
      L9_106 = A3_100
      L6_103(L7_104, L8_105, L9_106)
    end
  end
end
function AchievementListWidget.updateDetail(A0_107, A1_108, A2_109, A3_110)
  local L4_111, L5_112, L6_113, L7_114, L8_115, L9_116
  L4_111 = A0_107.getListPropertyCount
  L4_111 = L4_111(L5_112, L6_113)
  for L8_115 = 1, L4_111 do
    L9_116 = L8_115 - 1
    if A0_107:getListProperty("Achievement_Maker", L9_116, "achievementID") == A1_108 then
      A0_107:updateListProperty("Achievement_Maker")
      break
    end
  end
end
