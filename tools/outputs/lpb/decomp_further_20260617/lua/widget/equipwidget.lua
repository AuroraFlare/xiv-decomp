require("/Widget/WidgetBaseClass")
_defineClass("EquipWidget", "WidgetBaseClass")
function EquipWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L1_1 = A0_0.work
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    {"index", "integer16"},
    {"focus", "integer16"},
    {"selected", "integer16"},
    {"prevIndex", "integer16"},
    {"prevFocus", "integer16"},
    {"prevCount", "integer16"},
    {
      "indexChange",
      "boolean"
    },
    {
      "focusChange",
      "boolean"
    },
    {"page", "integer8"},
    {"bonus1", "boolean"},
    {"bonus2", "boolean"},
    {"bonus3", "boolean"},
    {"itemlife", "boolean"},
    {"bazaar", "boolean"},
    {
      "itemsinpage",
      "integer8"
    },
    {"listbox", "integer8"},
    {
      "listSelectStep",
      "integer8"
    },
    {"submenu", "boolean"},
    {
      "updatecount",
      "integer32"
    },
    {"slot", "integer32"},
    {
      "updatenexttime",
      "boolean"
    },
    {"demandSync", "boolean"},
    {"chosenSlot", "integer8"},
    {
      "focusedSlot",
      "integer8"
    },
    {
      "slotmasking",
      "boolean"
    },
    {"equipStep", "integer8"},
    {"sorttype", "integer8"},
    {
      "lastequiptime",
      "integer32"
    },
    {"equipx", "boolean"},
    {
      "darkMatterI",
      "integer16"
    },
    {
      "darkMatterII",
      "integer16"
    },
    {
      "darkMatterIII",
      "integer16"
    },
    {
      "darkMatterIV",
      "integer16"
    },
    {
      "darkMatterV",
      "integer16"
    },
    {
      "repairDarkMatterI",
      "integer8"
    },
    {
      "repairDarkMatterII",
      "integer8"
    },
    {
      "repairDarkMatterIII",
      "integer8"
    },
    {
      "repairDarkMatterIV",
      "integer8"
    },
    {
      "repairDarkMatterV",
      "integer8"
    },
    {
      "repairDarkMatterImin",
      "integer8"
    },
    {
      "repairDarkMatterIImin",
      "integer8"
    },
    {
      "repairDarkMatterIIImin",
      "integer8"
    },
    {
      "repairDarkMatterIVmin",
      "integer8"
    },
    {
      "repairDarkMatterVmin",
      "integer8"
    },
    {"repairCost", "integer32"},
    {
      "repairCostmin",
      "integer32"
    },
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L6_6 = "integer32"
  L6_6 = "chosenPackage"
  L6_6 = {"mode", "integer16"}
  L6_6 = "integer32"
  L6_6 = "lastresult"
  L6_6 = {"jobchange", "boolean"}
  L1_1._temp = L2_2
  L1_1 = A0_0.work
  L2_2 = desktopWidget
  L2_2 = L2_2.demandPlayerExpInfomation
  L2_2 = L2_2(L3_3)
  L1_1.equipx = L2_2
  L2_2 = A0_0
  L1_1 = A0_0.setCloseCondition
  L1_1(L2_2)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L2_2 = A0_0
  L1_1 = A0_0.setButtonEvents
  L1_1(L2_2, L3_3)
  L1_1 = worldMaster
  L2_2 = L1_1
  L1_1 = L1_1._getMyPlayer
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.getRepairType
  L2_2 = L2_2(L3_3)
  if L2_2 > 0 then
    L6_6 = 3661
    L3_3(L4_4, L5_5, L6_6)
    L6_6 = 1
    L3_3(L4_4, L5_5, L6_6, 75215)
  else
    L6_6 = 3660
    L3_3(L4_4, L5_5, L6_6)
    L6_6 = 1
    L3_3(L4_4, L5_5, L6_6, 75214)
  end
  L3_3(L4_4, L5_5)
  L6_6 = A0_0.work
  L3_3.darkMatterI, L4_4.darkMatterII, L5_5.darkMatterIII, L6_6.darkMatterIV, A0_0.work.darkMatterV = A0_0:countDarkMattersInBag()
  L3_3(L4_4, L5_5)
  L3_3(L4_4, L5_5)
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  L6_6 = 1
  L3_3(L4_4, L5_5, L6_6, 75220)
  L3_3(L4_4, L5_5)
  L6_6 = L1_1.hasItem
  L6_6 = L6_6(L1_1, 101, 2000201)
  if not L6_6 then
    L6_6 = L1_1.hasItem
    L6_6 = L6_6(L1_1, 101, 2000202)
    if not L6_6 then
      L6_6 = L1_1.hasItem
      L6_6 = L6_6(L1_1, 101, 2000203)
      if not L6_6 then
        L6_6 = L1_1.hasItem
        L6_6 = L6_6(L1_1, 101, 2000204)
        if not L6_6 then
          L6_6 = L1_1.hasItem
          L6_6 = L6_6(L1_1, 101, 2000205)
          if not L6_6 then
            L6_6 = L1_1.hasItem
            L6_6 = L6_6(L1_1, 101, 2000206)
            if not L6_6 then
              L6_6 = L1_1.hasItem
              L6_6 = L6_6(L1_1, 101, 2000207)
            end
          end
        end
      end
    end
  end
  L3_3(L4_4, L5_5, L6_6)
  L6_6 = false
  L3_3(L4_4, L5_5, L6_6)
  for L6_6 = 1, 5 do
    A0_0:setText("TextBlock_ItemName" .. "_" .. tostring(L6_6), 3202, 10013001 + L6_6 - 1, 1)
  end
  L3_3(L4_4, L5_5)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3(L4_4)
  L3_3.equipStep = 101
  L3_3.page = 0
  L3_3(L4_4, L5_5)
  L3_3.chosenSlot = 0
  L6_6 = "Button_PrimaryArm"
  L3_3.focusedSlot = L4_4
  L6_6 = true
  L3_3(L4_4, L5_5, L6_6)
  L6_6 = "TextBlock_Title"
  L4_4(L5_5, L6_6, 215, L3_3)
  L6_6 = 101
  L4_4(L5_5, L6_6)
  L4_4(L5_5)
  L4_4.repairmode = false
  L4_4.jobchange = false
  L6_6 = A0_0.getListBoxName
  L6_6 = L6_6(A0_0, 1)
  L4_4(L5_5, L6_6, 0)
end
function EquipWidget.processUICommandOperate(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20, L14_21
  if A2_9 == "Button_SortStatus" then
    L6_13 = A0_7
    L5_12 = A0_7.changeSortType
    L5_12(L6_13)
    L5_12 = A0_7.work
    L5_12 = L5_12.index
    L7_14 = A0_7
    L6_13 = A0_7.updateSortType
    L6_13(L7_14)
    L7_14 = A0_7
    L6_13 = A0_7.indexToFocus
    L8_15 = A0_7.work
    L8_15 = L8_15.listbox
    L9_16 = L5_12
    L6_13 = L6_13(L7_14, L8_15, L9_16)
    if L6_13 > -1 then
      L7_14 = A0_7.work
      L7_14.focus = L6_13
    end
    L8_15 = A0_7
    L7_14 = A0_7.focusToIndex
    L9_16 = A0_7.work
    L9_16 = L9_16.listbox
    L7_14 = L7_14(L8_15, L9_16, L10_17)
    if L7_14 >= 0 then
      L8_15 = A0_7.work
      L8_15.index = L7_14
    end
    L9_16 = A0_7
    L8_15 = A0_7.displaySortType
    L8_15(L9_16, L10_17)
  elseif A2_9 == "Button_RepairEquipment" then
    L5_12 = desktopWidget
    L6_13 = L5_12
    L5_12 = L5_12.isMacroCommandPlaying
    L5_12 = L5_12(L6_13)
    if L5_12 then
      return
    end
    L5_12 = desktopWidget
    L6_13 = L5_12
    L5_12 = L5_12.isMyPlayerDead
    L5_12 = L5_12(L6_13)
    if L5_12 then
      L5_12 = worldMaster
      L6_13 = L5_12
      L5_12 = L5_12.alert
      L7_14 = worldMaster
      L8_15 = 32708
      L9_16 = 24243
      L5_12(L6_13, L7_14, L8_15, L9_16)
      return
    end
    L5_12 = A0_7.work
    L5_12 = L5_12.repaircommandtime
    L5_12 = L5_12 + 1
    L6_13 = worldMaster
    L7_14 = L6_13
    L6_13 = L6_13._getServerTime
    L6_13 = L6_13(L7_14)
    if L5_12 < L6_13 then
      L5_12 = worldMaster
      L6_13 = L5_12
      L5_12 = L5_12._getMyPlayer
      L5_12 = L5_12(L6_13)
      L7_14 = L5_12
      L6_13 = L5_12.getRepairType
      L6_13 = L6_13(L7_14)
      L7_14 = desktopWidget
      L8_15 = L7_14
      L7_14 = L7_14.openChildWidget
      L9_16 = "RepairEquipmentDialogWidget"
      L7_14 = L7_14(L8_15, L9_16, L10_17, L11_18, L12_19)
      if L7_14 then
        if L6_13 == 0 then
          L9_16 = A0_7
          L8_15 = A0_7.maskRepairEquipmentSlot
          L8_15(L9_16, L10_17)
          L9_16 = A0_7
          L8_15 = A0_7.displayRepairEquipmentCosts
          L8_15(L9_16, L10_17)
          L9_16 = A0_7
          L8_15 = A0_7.displayRepairEquipmentSlotIcon
          L8_15(L9_16, L10_17)
        else
          L9_16 = A0_7
          L8_15 = A0_7.maskRepairEquipmentSlot
          L8_15(L9_16, L10_17)
          L9_16 = A0_7
          L8_15 = A0_7.displayRepairEquipmentSlotIcon
          L8_15(L9_16, L10_17)
        end
      end
      return L7_14
    end
  elseif A2_9 == "Button_JobStone" then
    L5_12 = A0_7.work
    L5_12 = L5_12.equipStep
    if L5_12 ~= 122 then
      L5_12 = A0_7.work
      L5_12.equipStep = 122
      L6_13 = A0_7
      L5_12 = A0_7.maskEquipSlotForJob
      L7_14 = false
      L5_12(L6_13, L7_14)
      L5_12 = A0_7.work
      L5_12.listSelectStep = 1
      L5_12 = worldMaster
      L6_13 = L5_12
      L5_12 = L5_12._getMyPlayer
      L5_12 = L5_12(L6_13)
      L7_14 = L5_12
      L6_13 = L5_12.getStateMainSkill
      L6_13 = L6_13(L7_14)
      L8_15 = L5_12
      L7_14 = L5_12.getMainClassOrJob
      L7_14 = L7_14(L8_15)
      L9_16 = A0_7
      L8_15 = A0_7.setWindowFocus
      L8_15(L9_16, L10_17)
      L8_15 = A0_7.work
      L8_15.listbox = 2
      L8_15 = A0_7.work
      L8_15.index = 0
      L8_15 = A0_7.work
      L8_15.focus = 0
      L8_15 = -1
      L9_16 = A0_7.getListPropertyName
      L9_16 = L9_16(L10_17, L11_18)
      L13_20 = 2
      for L13_20 = 0, L11_18 - 1 do
        L14_21 = A0_7.focusToIndex
        L14_21 = L14_21(A0_7, 2, L13_20)
        if A0_7:getListProperty(L9_16, L14_21, "opacity") == "1.0" then
          A0_7.work.focus = L13_20
          A0_7.work.index = L14_21
          L8_15 = L14_21
          break
        end
      end
      if L8_15 == -1 then
        L13_20 = A0_7.work
        L13_20 = L13_20.focus
        L8_15 = L10_17
        if L8_15 >= 0 then
          L10_17.index = L8_15
        end
      end
      L13_20 = "TextBlock_Title"
      L14_21 = L10_17
      L11_18(L12_19, L13_20, L14_21)
      L13_20 = true
      L11_18(L12_19, L13_20)
    else
      L5_12 = A0_7.work
      L5_12.equipStep = 121
      L6_13 = A0_7
      L5_12 = A0_7.setWindowFocus
      L7_14 = "Button_JobStone"
      L5_12(L6_13, L7_14)
      L6_13 = A0_7
      L5_12 = A0_7.jobstoneSlotFocused
      L5_12(L6_13)
    end
    return
  else
    L5_12 = A0_7.work
    L7_14 = A0_7
    L6_13 = A0_7.slotNameToEquipSlotNum
    L8_15 = A2_9
    L6_13 = L6_13(L7_14, L8_15)
    L5_12.selectParts = L6_13
    L5_12 = A0_7.work
    L5_12 = L5_12.selectParts
    if L5_12 ~= 0 then
      L5_12 = A0_7.work
      L5_12 = L5_12.equipStep
      if L5_12 == 101 then
        L5_12 = A0_7.work
        L5_12.equipStep = 103
        L6_13 = A0_7
        L5_12 = A0_7.maskEquipSlot
        L7_14 = 103
        L8_15 = A2_9
        L5_12(L6_13, L7_14, L8_15)
        L6_13 = A0_7
        L5_12 = A0_7.setControlProperty
        L7_14 = A2_9
        L8_15 = ":Label_HoverEffect"
        L7_14 = L7_14 .. L8_15
        L8_15 = "IsTabStop"
        L9_16 = false
        L5_12(L6_13, L7_14, L8_15, L9_16)
        L6_13 = A0_7
        L5_12 = A0_7.openItemList
        L7_14 = A0_7.work
        L7_14 = L7_14.selectParts
        L5_12(L6_13, L7_14)
      else
        L5_12 = A0_7.work
        L5_12 = L5_12.equipStep
        if L5_12 == 103 then
          L6_13 = A0_7
          L5_12 = A0_7.cancelFromSlotSelectItem
          L5_12(L6_13)
          L6_13 = A0_7
          L5_12 = A0_7.displaySlotItemHelp
          L7_14 = A0_7.work
          L7_14 = L7_14.selectParts
          L8_15 = true
          L5_12(L6_13, L7_14, L8_15)
        else
          L5_12 = A0_7.work
          L5_12 = L5_12.equipStep
          if L5_12 == 113 then
            L6_13 = A0_7
            L5_12 = A0_7.selectedBorder
            L5_12(L6_13)
            L6_13 = A0_7
            L5_12 = A0_7.equipItemFromSlot
            L5_12(L6_13)
          end
        end
      end
    end
  end
end
function EquipWidget.processUICommandCancel(A0_22, A1_23, A2_24, A3_25, A4_26)
  if A2_24 == "TextBlock_NoContents_1" or A2_24 == "ListBox_TabItem_1" then
    if A0_22.work.updatecount > 0 then
      return true
    end
    if A0_22.work.equipStep == 111 then
      A0_22.work.equipStep = 101
      A0_22:maskEquipSlot(101)
      A0_22:setWindowFocus("Button_PrimaryArm")
      A0_22.work.focusedSlot = A0_22:slotNameToEquipSlotNum("Button_PrimaryArm")
      A0_22:displaySlotItemHelp(A0_22.work.focusedSlot)
    else
      A0_22:cancelFromSlotSelectItemOnListBox()
    end
  elseif A2_24 == "ListBox_TabItem_2" then
    if A0_22.work.equipStep >= 121 then
      A0_22.work.equipStep = 121
      A0_22:maskEquipSlotForJob(true)
      A0_22:setWindowFocus("Button_JobStone")
      A0_22:jobstoneSlotFocused()
    end
    return
  elseif A2_24 == "Button_RepairEquipment" then
    if A0_22.work.sorttype ~= desktopWidget:getConfigWork(9) then
      desktopWidget:setConfigWorkWithSave(9, A0_22.work.sorttype)
    end
    return desktopWidget:closeWidgetDirect(A0_22)
  elseif A2_24 == "Button_JobStone" then
    if A0_22.work.equipStep > 121 then
      A0_22:jobstoneSlotFocused()
    else
      if A0_22.work.sorttype ~= desktopWidget:getConfigWork(9) then
        desktopWidget:setConfigWorkWithSave(9, A0_22.work.sorttype)
      end
      return desktopWidget:closeWidgetDirect(A0_22)
    end
  elseif A0_22:slotNameToEquipSlotNum(A2_24) ~= 0 then
    if A0_22.work.equipStep == 101 then
      if A0_22.work.sorttype ~= desktopWidget:getConfigWork(9) then
        desktopWidget:setConfigWorkWithSave(9, A0_22.work.sorttype)
      end
      desktopWidget:closeWidgetDirect(A0_22)
    elseif A0_22.work.equipStep >= 113 then
      A0_22:cancelFormListSelectSlot()
    elseif A0_22.work.equipStep == 103 then
      A0_22:cancelFromSlotSelectItem()
    end
  end
end
function EquipWidget.processUICommandClose(A0_27, A1_28, A2_29, A3_30, A4_31)
  A0_27:saveSortType()
  return desktopWidget:closeWidgetDirect(A0_27)
end
function EquipWidget.processUICommandSelection(A0_32, A1_33, A2_34, A3_35, A4_36)
  if A0_32.work.updatecount > 0 then
    return
  end
  if A3_35 < 0 then
    return
  end
  A0_32:itemUICommandSelection(nil, A2_34, A3_35, A4_36)
end
function EquipWidget.processUICommandDefault(A0_37, A1_38, A2_39, A3_40, A4_41, A5_42)
  local L6_43, L7_44, L8_45, L9_46
  L6_43 = A0_37.work
  L6_43 = L6_43.updatecount
  if L6_43 > 0 then
    L6_43 = true
    return L6_43
  end
  if A3_40 == "UILuaCommands.ButtonFocused" then
    if A2_39 == "Button_RepairEquipment" then
      L6_43 = A0_37.work
      L6_43.slot = 0
      L6_43 = A0_37.work
      L6_43.equipStep = 101
      L6_43 = A0_37.work
      L6_43.focusedSlot = 0
      L6_43 = A0_37.work
      L6_43.repairmode = true
      L6_43 = worldMaster
      L7_44 = L6_43
      L6_43 = L6_43._getMyPlayer
      L6_43 = L6_43(L7_44)
      L8_45 = L6_43
      L7_44 = L6_43.getRepairType
      L7_44 = L7_44(L8_45)
      L8_45 = A0_37.work
      L8_45 = L8_45.repaircommandtime
      L8_45 = L8_45 + 2
      L9_46 = worldMaster
      L9_46 = L9_46._getServerTime
      L9_46 = L9_46(L9_46)
      if L8_45 > L9_46 then
        L8_45 = A0_37.work
        L7_44 = L8_45.lastresult
      end
      if L7_44 > 0 then
        L9_46 = A0_37
        L8_45 = A0_37.displayHelp
        L8_45(L9_46, 3682, L7_44)
        L9_46 = A0_37
        L8_45 = A0_37.setContent
        L8_45(L9_46, "Button_RepairEquipment", 3661)
        L9_46 = A0_37
        L8_45 = A0_37.setHelpParameter
        L8_45(L9_46, "Button_RepairEquipment", 1, 75215)
        L9_46 = A0_37
        L8_45 = A0_37.setText
        L8_45(L9_46, "TextBlock_Title", 3661)
        L9_46 = A0_37
        L8_45 = A0_37.setVisibility
        L8_45(L9_46, "Grid_RepairEquipment", true)
      else
        L9_46 = A0_37
        L8_45 = A0_37.displayHelp
        L8_45(L9_46, 3681)
        L9_46 = A0_37
        L8_45 = A0_37.setContent
        L8_45(L9_46, "Button_RepairEquipment", 3660)
        L9_46 = A0_37
        L8_45 = A0_37.setHelpParameter
        L8_45(L9_46, "Button_RepairEquipment", 1, 75214)
        L9_46 = A0_37
        L8_45 = A0_37.setText
        L8_45(L9_46, "TextBlock_Title", 3660)
        L9_46 = A0_37
        L8_45 = A0_37.setVisibility
        L8_45(L9_46, "Grid_RepairEquipment", false)
      end
      L9_46 = A0_37
      L8_45 = A0_37.setVisibility
      L8_45(L9_46, "Grid_ItemList", false)
      L9_46 = A0_37
      L8_45 = A0_37.setVisibility
      L8_45(L9_46, "Grid_JobStoneList", false)
      L9_46 = A0_37
      L8_45 = A0_37.displayRepairEquipmentCosts
      L8_45(L9_46, L7_44)
      L9_46 = A0_37
      L8_45 = A0_37.displayRepairEquipmentSlotIcon
      L8_45(L9_46, L7_44)
      L9_46 = A0_37
      L8_45 = A0_37.setVisibility
      L8_45(L9_46, "Grid_BackpackAndGil", true)
      return
    elseif A2_39 == "Button_JobStone" then
      L6_43 = A0_37.work
      L6_43 = L6_43.equipStep
      if L6_43 ~= 122 then
        L7_44 = A0_37
        L6_43 = A0_37.jobstoneSlotFocused
        L6_43(L7_44)
      end
      return
    else
      L6_43 = A0_37.work
      L6_43 = L6_43.equipStep
      if L6_43 >= 121 then
        L6_43 = A0_37.work
        L6_43.equipStep = 101
      end
      L7_44 = A0_37
      L6_43 = A0_37.setVisibility
      L8_45 = "Button_SortStatus"
      L9_46 = true
      L6_43(L7_44, L8_45, L9_46)
      L7_44 = A0_37
      L6_43 = A0_37.setVisibility
      L8_45 = "Grid_BackpackAndGil"
      L9_46 = true
      L6_43(L7_44, L8_45, L9_46)
    end
    L6_43 = A0_37.work
    L6_43 = L6_43.repairmode
    if L6_43 == true then
      L6_43 = A0_37.work
      L6_43.repairmode = false
      L7_44 = A0_37
      L6_43 = A0_37.maskRepairEquipmentSlot
      L6_43(L7_44)
    end
    L6_43 = A0_37.work
    L6_43.page = 0
    L7_44 = A0_37
    L6_43 = A0_37.slotNameToEquipSlotNum
    L8_45 = A2_39
    L6_43 = L6_43(L7_44, L8_45)
    L7_44 = A0_37.work
    L7_44.focusedSlot = L6_43
    L8_45 = A0_37
    L7_44 = A0_37.setVisibility
    L9_46 = "Grid_ItemList"
    L7_44(L8_45, L9_46, true)
    L8_45 = A0_37
    L7_44 = A0_37.setVisibility
    L9_46 = "Grid_JobStoneList"
    L7_44(L8_45, L9_46, false)
    L7_44 = A0_37.work
    L7_44 = L7_44.equipStep
    if L7_44 == 113 then
      L8_45 = A0_37
      L7_44 = A0_37.displayFocusedItemHelp
      L7_44(L8_45)
      L8_45 = A0_37
      L7_44 = A0_37.setText
      L9_46 = "TextBlock_Title"
      L7_44(L8_45, L9_46, 215, L6_43)
      return
    else
      L7_44 = A0_37.work
      L7_44 = L7_44.equipStep
      if L7_44 == 114 then
        L8_45 = A0_37
        L7_44 = A0_37.displayFocusedItemHelp
        L7_44(L8_45)
        L8_45 = A0_37
        L7_44 = A0_37.setText
        L9_46 = "TextBlock_Title"
        L7_44(L8_45, L9_46, 215, L6_43)
        return
      else
        L7_44 = A0_37.work
        L7_44 = L7_44.equipStep
        if L7_44 == 103 then
          L8_45 = A0_37
          L7_44 = A0_37.setText
          L9_46 = "TextBlock_Title"
          L7_44(L8_45, L9_46, 215, L6_43)
          L8_45 = A0_37
          L7_44 = A0_37.displaySlotItemHelp
          L9_46 = L6_43
          L7_44(L8_45, L9_46)
          return
        else
          L7_44 = A0_37.work
          L7_44 = L7_44.equipStep
          if L7_44 == 111 then
            L7_44 = A0_37.work
            L7_44.equipStep = 101
          end
        end
      end
    end
    if L6_43 ~= 0 then
      L8_45 = A0_37
      L7_44 = A0_37.displaySlotItemHelp
      L9_46 = L6_43
      L7_44(L8_45, L9_46, true)
    end
  elseif A3_40 == "UILuaCommands.MouseEnteredItem" or A3_40 == "UILuaCommands.AnchoredItem" then
    L6_43 = A0_37.work
    L6_43 = L6_43.updatecount
    if L6_43 > 0 then
      return
    end
    if A5_42 == nil then
      return
    end
    if A4_41 == nil or A4_41 < 0 then
      return
    end
    L6_43 = A0_37.work
    L6_43 = L6_43.equipStep
    if L6_43 == 113 then
      if A3_40 ~= "UILuaCommands.MouseEnteredItem" then
        L7_44 = A0_37
        L6_43 = A0_37.cancelFormListSelectSlot
        L6_43(L7_44)
      end
      return
    end
    L6_43 = A0_37.work
    L6_43 = L6_43.equipStep
    if L6_43 >= 121 then
      L6_43 = A0_37.work
      L6_43.listSelectStep = 1
      L6_43 = worldMaster
      L7_44 = L6_43
      L6_43 = L6_43._getMyPlayer
      L6_43 = L6_43(L7_44)
      L8_45 = L6_43
      L7_44 = L6_43.getStateMainSkill
      L7_44 = L7_44(L8_45)
      L9_46 = L6_43
      L8_45 = L6_43.getMainClassOrJob
      L8_45 = L8_45(L9_46)
      L9_46 = 3686
      if L7_44 ~= L8_45 then
        L9_46 = 3687
      end
      A0_37:setText("TextBlock_Title", L9_46)
    end
    L6_43 = A0_37.work
    L6_43.slot = 0
    L6_43 = A0_37.work
    L6_43.listbox = A5_42
    L6_43 = A0_37.work
    L6_43.focus = A4_41
    L7_44 = A0_37
    L6_43 = A0_37.focusToIndex
    L8_45 = A0_37.work
    L8_45 = L8_45.listbox
    L9_46 = A0_37.work
    L9_46 = L9_46.focus
    L6_43 = L6_43(L7_44, L8_45, L9_46)
    if L6_43 >= 0 then
      L7_44 = A0_37.work
      L7_44.index = L6_43
    else
      return
    end
    L7_44 = A0_37.work
    L7_44 = L7_44.equipStep
    if L7_44 == 101 then
      L7_44 = A0_37.work
      L7_44.equipStep = 111
    end
    L7_44 = A0_37.work
    L7_44.page = 0
    L7_44 = A0_37.work
    L7_44 = L7_44.listbox
    if L7_44 == 1 then
      L8_45 = A0_37
      L7_44 = A0_37.selectedBorder
      L7_44(L8_45)
    end
    L7_44 = A0_37.work
    L7_44 = L7_44.listSelectStep
    if L7_44 == 1 then
      L8_45 = A0_37
      L7_44 = A0_37.displayFocusedItemHelp
      L7_44(L8_45)
    else
      L7_44 = A0_37.work
      L7_44 = L7_44.listSelectStep
      if L7_44 == 0 then
        L7_44 = A0_37.work
        L7_44.listSelectStep = 1
        L8_45 = A0_37
        L7_44 = A0_37.updateWindowDisplay
        L9_46 = true
        L7_44(L8_45, L9_46)
      end
    end
  end
end
function EquipWidget.itemUICommandSelection(A0_47, A1_48, A2_49, A3_50, A4_51)
  local L5_52, L6_53, L7_54, L8_55, L9_56
  L5_52 = A0_47.work
  L5_52 = L5_52.focus
  L7_54 = A0_47
  L6_53 = A0_47.getListBoxFocusNum
  L8_55 = A0_47.work
  L8_55 = L8_55.listbox
  L6_53 = L6_53(L7_54, L8_55)
  if L5_52 >= L6_53 then
    L6_53 = A0_47
    L5_52 = A0_47.updateListFocus
    L5_52(L6_53)
    return
  end
  L5_52 = A0_47.work
  L5_52.chosenPackage = 1
  L5_52 = A0_47.work
  L6_53 = A0_47.work
  L6_53 = L6_53.index
  L6_53 = L6_53 + 1
  L5_52.chosenItem = L6_53
  L5_52 = A0_47.work
  L5_52 = L5_52.listbox
  if L5_52 == 2 then
    L6_53 = A0_47
    L5_52 = A0_47.checkJobChange
    L7_54 = A0_47.work
    L7_54 = L7_54.chosenItem
    L5_52(L6_53, L7_54)
    return
  end
  L6_53 = A0_47
  L5_52 = A0_47.getItemEquipPoint
  L7_54 = nil
  L8_55 = A0_47.work
  L8_55 = L8_55.chosenPackage
  L9_56 = A0_47.work
  L9_56 = L9_56.chosenItem
  L9_56 = L5_52(L6_53, L7_54, L8_55, L9_56)
  if A0_47.work.equipStep == 111 then
    if L9_56 ~= 0 then
      A0_47:removeEquipItem(L9_56)
    else
      A0_47.work.equipStep = 113
      A0_47:maskEquipSlot(113, A0_47:equipSlotNumToSlotName(L5_52), A0_47:equipSlotNumToSlotName(L6_53), A0_47:equipSlotNumToSlotName(L7_54), A0_47:equipSlotNumToSlotName(L8_55))
      A0_47.work.focusedSlot = L5_52
      A0_47:updateWindowDisplay(true)
      A0_47:setWindowFocus(A0_47:equipSlotNumToSlotName(L5_52))
      A0_47:selectedBorder(A0_47.work.index, true)
      A0_47:setText("TextBlock_Title", 215, L5_52)
    end
  elseif A0_47.work.equipStep == 113 then
    A0_47.work.focus = A3_50
    A0_47:cancelFormListSelectSlot()
  else
    if A0_47.work.equipStep == 103 and (L5_52 == A0_47.work.chosenSlot or L6_53 == A0_47.work.chosenSlot or L7_54 == A0_47.work.chosenSlot or L8_55 == A0_47.work.chosenSlot) then
      if L9_56 ~= 0 then
        A0_47:updateWindowDisplay(true)
        if L9_56 ~= A0_47.work.chosenSlot then
        else
          A0_47.work.equipStep = 104
          if A0_47:isOperateButtonEnable(A0_47.work.listbox, A0_47.work.index) == true then
            A0_47:selectedBorder(A0_47.work.index, true)
          end
          A0_47:setText("TextBlock_Title", 215, A0_47.work.chosenSlot)
          A0_47:equipItemFromList()
          A0_47:displaySlotItemHelp(A0_47.work.chosenSlot, true)
        end
      else
        A0_47.work.equipStep = 104
        A0_47:updateWindowDisplay(true)
        A0_47:setText("TextBlock_Title", 215, A0_47.work.chosenSlot)
        A0_47:equipItemFromList()
        A0_47:displaySlotItemHelp(A0_47.work.chosenSlot, true)
      end
    else
    end
  end
end
function EquipWidget.update(A0_57, A1_58)
  A0_57:updateEquipxBadge()
  A0_57:updateMainSkillHeader()
  A0_57:updatePcParameter()
  A0_57:updateGameParameter()
  A0_57:updateBattleParameter()
  A0_57:updateEquipItem()
  A0_57:updateImportantOpacity()
end
function EquipWidget.updateEquipxBadge(A0_59)
  local L1_60, L2_61, L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, L9_68
  L1_60 = worldMaster
  L2_61 = L1_60
  L1_60 = L1_60._getMyPlayer
  L1_60 = L1_60(L2_61)
  L2_61, L3_62, L4_63 = nil, nil, nil
  L2_61 = L5_64
  L3_62 = L5_64
  L4_63 = L5_64
  for L8_67 = 1, L3_62 - L4_63 do
    L9_68 = A0_59.updateItemEquipxBadge
    L9_68 = L9_68(A0_59, 1, L8_67)
    if L9_68 == nil then
      break
    end
    A0_59:setListProperty(L2_61, L8_67 - 1, "equipx", L9_68)
  end
  L5_64(L6_65, L7_66)
end
function EquipWidget.updateItemEquipxBadge(A0_69, A1_70, A2_71)
  local L3_72, L4_73
  L3_72 = worldMaster
  L4_73 = L3_72
  L3_72 = L3_72._getMyPlayer
  L3_72 = L3_72(L4_73)
  L4_73 = L3_72._getItem
  L4_73 = L4_73(L3_72, A1_70, A2_71)
  if L4_73 == nil then
    return nil
  end
  if desktopWidget:cantEquipPlayer(L4_73) == true then
    return "Visible"
  else
    return "Collapsed"
  end
end
function EquipWidget.updateEquip(A0_74)
  A0_74:updateEquipItem()
end
function EquipWidget.processEquipItem(A0_75, A1_76, A2_77, A3_78)
  if A1_76 == nil then
    return false
  end
  if A1_76 == false then
    return false
  end
  if A1_76 <= 0 then
    return false
  end
  if worldMaster:_getServerTime() - A0_75.work.lastequiptime < 1 then
    return false
  end
  if A3_78 <= 0 then
    if desktopWidget:executeCharacterRemoveItem(A1_76) == true then
      A0_75.work.lastequiptime = worldMaster:_getServerTime()
      return true
    end
  elseif desktopWidget:executeCharacterEquipItem(A1_76, A2_77, A3_78) == true then
    A0_75.work.lastequiptime = worldMaster:_getServerTime()
    return true
  end
end
function EquipWidget.updateMainSkillHeader(A0_79)
  local L1_80, L2_81, L3_82, L4_83, L5_84, L6_85
  L1_80 = worldMaster
  L2_81 = L1_80
  L1_80 = L1_80._getMyPlayer
  L1_80 = L1_80(L2_81)
  L2_81 = desktopWidget
  L3_82 = L2_81
  L2_81 = L2_81.getPlayerName
  L2_81 = L2_81(L3_82)
  L4_83 = L1_80
  L3_82 = L1_80.getStateMainSkill
  L3_82 = L3_82(L4_83)
  L5_84 = L1_80
  L4_83 = L1_80.getMainClassOrJob
  L4_83 = L4_83(L5_84)
  L6_85 = L1_80
  L5_84 = L1_80.getStateMainSkillLevel
  L5_84 = L5_84(L6_85)
  L6_85 = desktopWidget
  L6_85 = L6_85.getSkillIcon
  L6_85 = L6_85(L6_85, L3_82)
  A0_79:setPlayerName(L2_81)
  A0_79:setCurrentSkill(L3_82, L4_83, L6_85, L5_84)
end
function EquipWidget.updatePcParameter(A0_86)
  local L1_87, L2_88, L3_89, L4_90
  L1_87 = worldMaster
  L2_88 = L1_87
  L1_87 = L1_87._getMyPlayer
  L1_87 = L1_87(L2_88)
  L3_89 = L1_87
  L2_88 = L1_87.getHPMax
  L2_88 = L2_88(L3_89)
  L4_90 = L1_87
  L3_89 = L1_87.getMPMax
  L3_89 = L3_89(L4_90)
  L4_90 = L1_87.getTPMax
  L4_90 = L4_90(L1_87)
  A0_86:setHp(L2_88)
  A0_86:setMp(L3_89)
  A0_86:setTp(L4_90)
end
function EquipWidget.updateGameParameter(A0_91)
  local L1_92, L2_93, L3_94, L4_95, L5_96, L6_97, L7_98, L8_99, L9_100, L10_101, L11_102, L12_103, L13_104
  L1_92 = worldMaster
  L2_93 = L1_92
  L1_92 = L1_92._getMyPlayer
  L1_92 = L1_92(L2_93)
  L3_94 = L1_92
  L2_93 = L1_92.getPhysicalParameter
  L4_95 = 1
  L2_93 = L2_93(L3_94, L4_95)
  L4_95 = L1_92
  L3_94 = L1_92.getPhysicalParameter
  L5_96 = 2
  L3_94 = L3_94(L4_95, L5_96)
  L5_96 = L1_92
  L4_95 = L1_92.getPhysicalParameter
  L6_97 = 3
  L4_95 = L4_95(L5_96, L6_97)
  L6_97 = L1_92
  L5_96 = L1_92.getPhysicalParameter
  L7_98 = 4
  L5_96 = L5_96(L6_97, L7_98)
  L7_98 = L1_92
  L6_97 = L1_92.getPhysicalParameter
  L8_99 = 5
  L6_97 = L6_97(L7_98, L8_99)
  L8_99 = L1_92
  L7_98 = L1_92.getPhysicalParameter
  L9_100 = 6
  L7_98 = L7_98(L8_99, L9_100)
  L9_100 = L1_92
  L8_99 = L1_92.getPhysicalParameter
  L10_101 = 7
  L8_99 = L8_99(L9_100, L10_101)
  L10_101 = L1_92
  L9_100 = L1_92.getPhysicalParameter
  L11_102 = 8
  L9_100 = L9_100(L10_101, L11_102)
  L11_102 = L1_92
  L10_101 = L1_92.getPhysicalParameter
  L12_103 = 9
  L10_101 = L10_101(L11_102, L12_103)
  L12_103 = L1_92
  L11_102 = L1_92.getPhysicalParameter
  L13_104 = 10
  L11_102 = L11_102(L12_103, L13_104)
  L13_104 = L1_92
  L12_103 = L1_92.getPhysicalParameter
  L12_103 = L12_103(L13_104, 11)
  L13_104 = L1_92.getPhysicalParameter
  L13_104 = L13_104(L1_92, 12)
  A0_91:setStr(L2_93)
  A0_91:setVit(L3_94)
  A0_91:setDex(L4_95)
  A0_91:setInt(L5_96)
  A0_91:setMnd(L6_97)
  A0_91:setPie(L7_98)
  A0_91:setFire(L8_99)
  A0_91:setIce(L9_100)
  A0_91:setWind(L10_101)
  A0_91:setEarth(L11_102)
  A0_91:setThunder(L12_103)
  A0_91:setWater(L13_104)
end
function EquipWidget.updateBattleParameter(A0_105)
  A0_105:setMainAttack(worldMaster:_getMyPlayer():getAttack())
  A0_105:setMainRate(worldMaster:_getMyPlayer():getAttackRate())
  A0_105:setDefence(worldMaster:_getMyPlayer():getNormalDefence())
  A0_105:setEvasion(worldMaster:_getMyPlayer():getEvasion())
  A0_105:setAttackMagic(worldMaster:_getMyPlayer():getAttackMagic())
  A0_105:setWeakMagic(worldMaster:_getMyPlayer():getWeekMagic())
  A0_105:setHealMagic(worldMaster:_getMyPlayer():getHealMagic())
  A0_105:setReinforceMagic(worldMaster:_getMyPlayer():getReinforceMagic())
  A0_105:setMagicHit(worldMaster:_getMyPlayer():getMagicRate())
  A0_105:setMagicEvasion(worldMaster:_getMyPlayer():getMagicEvasion())
  A0_105:setCraftProcessing(worldMaster:_getMyPlayer():getCraftProcessing(1))
  A0_105:setCraftProcessControl(worldMaster:_getMyPlayer():getCraftProcessControl(1))
  A0_105:setCraftMagicProcessing(worldMaster:_getMyPlayer():getCraftMagicProcessing(1))
  A0_105:setHarvestPotency(worldMaster:_getMyPlayer():getHarvestPotency(1))
  A0_105:setHarvestLimit(worldMaster:_getMyPlayer():getHarvestLimit(1))
  A0_105:setHarvestRate(worldMaster:_getMyPlayer():getHarvestRate(1))
  if desktopWidget:getPlayerMainSkillNumber() <= 28 then
    A0_105:setVisibility("Grid_Magic", true)
    A0_105:setVisibility("Grid_Production", false)
    A0_105:setVisibility("Grid_Gathering", false)
  end
  if desktopWidget:getPlayerMainSkillNumber() >= 29 and desktopWidget:getPlayerMainSkillNumber() <= 38 then
    A0_105:setVisibility("Grid_Magic", false)
    A0_105:setVisibility("Grid_Production", true)
    A0_105:setVisibility("Grid_Gathering", false)
  end
  if desktopWidget:getPlayerMainSkillNumber() >= 39 and desktopWidget:getPlayerMainSkillNumber() <= 44 then
    A0_105:setVisibility("Grid_Magic", false)
    A0_105:setVisibility("Grid_Production", false)
    A0_105:setVisibility("Grid_Gathering", true)
  end
end
function EquipWidget.getTemplateControl(A0_106, A1_107, A2_108)
  return A1_107 .. ":" .. A2_108
end
function EquipWidget.updateEquipItem(A0_109)
  local L1_110, L2_111
  L2_111 = A0_109
  L1_110 = A0_109.setMainWeapon
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(1))
  L2_111 = A0_109
  L1_110 = A0_109.setSubWeapon
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(2))
  L2_111 = A0_109
  L1_110 = A0_109.setThrowWeapon
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(5))
  L2_111 = A0_109
  L1_110 = A0_109.setPouch
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(6))
  L2_111 = A0_109
  L1_110 = A0_109.setBadolier
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(7))
  L2_111 = A0_109
  L1_110 = A0_109.setHead
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(9))
  L2_111 = A0_109
  L1_110 = A0_109.setBody
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(11))
  L2_111 = A0_109
  L1_110 = A0_109.setBodyInner
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(10))
  L2_111 = A0_109
  L1_110 = A0_109.setHands
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(14))
  L2_111 = A0_109
  L1_110 = A0_109.setWaist
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(16))
  L2_111 = A0_109
  L1_110 = A0_109.setLegs
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(13))
  L2_111 = A0_109
  L1_110 = A0_109.setLegsInner
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(12))
  L2_111 = A0_109
  L1_110 = A0_109.setFeet
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(15))
  L2_111 = A0_109
  L1_110 = A0_109.setEarR
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(18))
  L2_111 = A0_109
  L1_110 = A0_109.setNeck
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(17))
  L2_111 = A0_109
  L1_110 = A0_109.setIndexL
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(23))
  L2_111 = A0_109
  L1_110 = A0_109.setIndexR
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(22))
  L2_111 = A0_109
  L1_110 = A0_109.setWristR
  L1_110(L2_111, A0_109:getPlayerEquipmentForParts(20))
  L2_111 = A0_109
  L1_110 = A0_109.updateItemEquipStatus
  L1_110(L2_111)
  L1_110 = A0_109.work
  L1_110 = L1_110.focusedSlot
  if L1_110 ~= 0 then
    L1_110 = A0_109.work
    L1_110 = L1_110.equipStep
    if L1_110 == 101 then
      L2_111 = A0_109
      L1_110 = A0_109.displaySlotItemHelp
      L1_110(L2_111, A0_109.work.focusedSlot, true)
    end
  end
  L1_110 = A0_109.work
  L1_110 = L1_110.equipStep
  if L1_110 ~= 103 then
    L1_110 = A0_109.work
    L1_110 = L1_110.equipStep
  elseif L1_110 == 111 then
    L2_111 = A0_109
    L1_110 = A0_109.displayFocusedItemHelp
    L1_110(L2_111)
  end
  L1_110 = worldMaster
  L2_111 = L1_110
  L1_110 = L1_110._getMyPlayer
  L1_110 = L1_110(L2_111)
  L2_111 = L1_110.getRepairType
  L2_111 = L2_111(L1_110)
  if L2_111 > 0 then
    A0_109:displayRepairEquipmentSlotIcon(L2_111)
  end
end
function EquipWidget.getPlayerEquipmentForParts(A0_112, A1_113)
  local L2_114, L3_115, L4_116, L5_117, L6_118, L7_119, L8_120, L9_121, L10_122, L11_123, L12_124, L13_125, L14_126
  L3_115 = false
  L4_116 = false
  L5_117 = false
  L6_118 = false
  L7_119 = false
  L8_120 = false
  L9_121 = worldMaster
  L10_122 = L9_121
  L9_121 = L9_121._getMyPlayer
  L9_121 = L9_121(L10_122)
  L10_122 = false
  L12_124 = L9_121
  L11_123 = L9_121.hasItem
  L13_125 = 101
  L14_126 = 2001001
  L11_123 = L11_123(L12_124, L13_125, L14_126)
  if not L11_123 then
    L12_124 = L9_121
    L11_123 = L9_121.hasItem
    L13_125 = 101
    L14_126 = 2001002
    L11_123 = L11_123(L12_124, L13_125, L14_126)
    if not L11_123 then
      L12_124 = L9_121
      L11_123 = L9_121.hasItem
      L13_125 = 101
      L14_126 = 2001003
      L11_123 = L11_123(L12_124, L13_125, L14_126)
    end
  elseif L11_123 then
    L10_122 = true
  end
  if A1_113 <= 0 or A1_113 > 27 then
    L11_123 = L2_114
    L12_124 = L3_115
    L13_125 = L4_116
    L14_126 = L5_117
    return L11_123, L12_124, L13_125, L14_126, L6_118
  end
  L12_124 = L9_121
  L11_123 = L9_121._getEquippingItem
  L13_125 = A1_113
  L11_123 = L11_123(L12_124, L13_125)
  if L11_123 ~= nil then
    L13_125 = L11_123
    L12_124 = L11_123.getMaterializePermission
    L12_124 = L12_124(L13_125)
    L8_120 = L12_124
    L13_125 = L11_123
    L12_124 = L11_123.getItemIcon
    L12_124 = L12_124(L13_125)
    L2_114 = L12_124
    L7_119 = true
    L12_124, L13_125, L14_126 = nil, nil, nil
    L12_124, L13_125, L3_115, L4_116, L14_126 = desktopWidget:getItemLifeParam(A0_112, L11_123)
    if L11_123:getNormalItemFitness() == 10000 then
      L5_117 = L8_120 and L10_122
    end
    L6_118 = L11_123:isMateriaAttached()
  end
  L12_124 = L2_114
  L13_125 = L3_115
  L14_126 = L4_116
  return L12_124, L13_125, L14_126, L5_117, L6_118, L7_119
end
function EquipWidget.updateAP(A0_127)
  local L1_128, L2_129
  L1_128 = 0
  L2_129 = 0
end
function EquipWidget.getSlotItemAP(A0_130, A1_131)
  local L2_132
  L2_132 = 0
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_131) ~= nil and worldMaster:_getMyPlayer():_getEquippingItem(A1_131):isAccessory() == true then
    L2_132 = worldMaster:_getMyPlayer():_getEquippingItem(A1_131):getAccessorySize()
  end
  return L2_132
end
function EquipWidget.initParameter(A0_133)
  A0_133:setText("TextBlock_Title_HP", 214, 110)
  A0_133:setText("TextBlock_Title_MP", 214, 120)
  A0_133:setText("TextBlock_Title_TP", 214, 130)
  A0_133:setText(A0_133:getTemplateControl("Label_STR", "TextBlock_Title"), 214, 1)
  A0_133:setText(A0_133:getTemplateControl("Label_VIT", "TextBlock_Title"), 214, 2)
  A0_133:setText(A0_133:getTemplateControl("Label_DEX", "TextBlock_Title"), 214, 3)
  A0_133:setText(A0_133:getTemplateControl("Label_INT", "TextBlock_Title"), 214, 4)
  A0_133:setText(A0_133:getTemplateControl("Label_MND", "TextBlock_Title"), 214, 5)
  A0_133:setText(A0_133:getTemplateControl("Label_PIE", "TextBlock_Title"), 214, 6)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_STR", "TextBlock_Title"), 1, 70001)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_VIT", "TextBlock_Title"), 1, 70002)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_DEX", "TextBlock_Title"), 1, 70003)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_INT", "TextBlock_Title"), 1, 70004)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MND", "TextBlock_Title"), 1, 70005)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_PIE", "TextBlock_Title"), 1, 70006)
  A0_133:setText("TextBlock_FIRE", 214, 7)
  A0_133:setText("TextBlock_WATER", 214, 12)
  A0_133:setText("TextBlock_THUNDER", 214, 11)
  A0_133:setText("TextBlock_WIND", 214, 9)
  A0_133:setText("TextBlock_EARTH", 214, 10)
  A0_133:setText("TextBlock_ICE", 214, 8)
  A0_133:setText(A0_133:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_Title"), 3188, 15018)
  A0_133:setText(A0_133:getTemplateControl("Label_MainPhysicsHit", "TextBlock_Title"), 3188, 15016)
  A0_133:setText(A0_133:getTemplateControl("Label_PhysicsDefense", "TextBlock_Title"), 3188, 15019)
  A0_133:setText(A0_133:getTemplateControl("Label_Avoidance", "TextBlock_Title"), 3188, 15017)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_Title"), 1, 70018)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MainPhysicsHit", "TextBlock_Title"), 1, 70016)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_PhysicsDefense", "TextBlock_Title"), 1, 70019)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_Avoidance", "TextBlock_Title"), 1, 70017)
  A0_133:setText(A0_133:getTemplateControl("Label_AttackMagic", "TextBlock_Title"), 3188, 15024)
  A0_133:setText(A0_133:getTemplateControl("Label_WeakMagic", "TextBlock_Title"), 3188, 15027)
  A0_133:setText(A0_133:getTemplateControl("Label_HealMagic", "TextBlock_Title"), 3188, 15025)
  A0_133:setText(A0_133:getTemplateControl("Label_ReinforceMagic", "TextBlock_Title"), 3188, 15026)
  A0_133:setText(A0_133:getTemplateControl("Label_MagicHit", "TextBlock_Title"), 3188, 15028)
  A0_133:setText(A0_133:getTemplateControl("Label_MagicEvasion", "TextBlock_Title"), 3188, 15029)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_AttackMagic", "TextBlock_Title"), 1, 70024)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_WeakMagic", "TextBlock_Title"), 1, 70027)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_HealMagic", "TextBlock_Title"), 1, 70025)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_ReinforceMagic", "TextBlock_Title"), 1, 70026)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MagicHit", "TextBlock_Title"), 1, 70028)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MagicEvasion", "TextBlock_Title"), 1, 70029)
  A0_133:setText(A0_133:getTemplateControl("Label_PhysicalProcessing", "TextBlock_Title"), 3188, 400)
  A0_133:setText(A0_133:getTemplateControl("Label_MagicProcessing", "TextBlock_Title"), 3188, 410)
  A0_133:setText(A0_133:getTemplateControl("Label_AlteredControl", "TextBlock_Title"), 3188, 420)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_PhysicalProcessing", "TextBlock_Title"), 1, 70400)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_MagicProcessing", "TextBlock_Title"), 1, 70410)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_AlteredControl", "TextBlock_Title"), 1, 70420)
  A0_133:setText(A0_133:getTemplateControl("Label_GatheringAbility", "TextBlock_Title"), 3188, 500)
  A0_133:setText(A0_133:getTemplateControl("Label_GatheringResistance", "TextBlock_Title"), 3188, 510)
  A0_133:setText(A0_133:getTemplateControl("Label_GatheringInspiration", "TextBlock_Title"), 3188, 520)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_GatheringAbility", "TextBlock_Title"), 1, 70500)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_GatheringResistance", "TextBlock_Title"), 1, 70510)
  A0_133:setHelpParameter(A0_133:getTemplateControl("Label_GatheringInspiration", "TextBlock_Title"), 1, 70520)
  A0_133:setVisibility("Grid_Physics", true)
  A0_133:setVisibility("Grid_Magic", true)
  if worldMaster:_getMyPlayer():getStateMainSkill() <= 28 then
    A0_133:setVisibility("Grid_Production", false)
    A0_133:setVisibility("Grid_Production", false)
    A0_133:setVisibility("Grid_Gathering", false)
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() >= 29 and worldMaster:_getMyPlayer():getStateMainSkill() <= 38 then
    A0_133:setVisibility("Grid_Production", true)
    A0_133:setVisibility("Grid_Gathering", false)
  end
  if worldMaster:_getMyPlayer():getStateMainSkill() >= 39 and worldMaster:_getMyPlayer():getStateMainSkill() <= 44 then
    A0_133:setVisibility("Grid_Production", false)
    A0_133:setVisibility("Grid_Gathering", true)
  end
  A0_133:setHp(0)
  A0_133:setMp(0)
  A0_133:setTp(0)
  A0_133:setStr(0)
  A0_133:setVit(0)
  A0_133:setDex(0)
  A0_133:setInt(0)
  A0_133:setMnd(0)
  A0_133:setPie(0)
  A0_133:setFire(0)
  A0_133:setIce(0)
  A0_133:setWind(0)
  A0_133:setEarth(0)
  A0_133:setThunder(0)
  A0_133:setWater(0)
  A0_133:setMainAttack(0)
  A0_133:setMainRate(0)
  A0_133:setDefence(0)
  A0_133:setEvasion(0)
  A0_133:setAttackMagic(0)
  A0_133:setWeakMagic(0)
  A0_133:setHealMagic(0)
  A0_133:setReinforceMagic(0)
  A0_133:setMagicHit(0)
  A0_133:setMagicEvasion(0)
end
function EquipWidget.setHp(A0_134, A1_135, A2_136)
  local L3_137, L4_138, L5_139
  L4_138 = A0_134
  L3_137 = A0_134.setText
  L5_139 = "TextBlock_BaseParameter_HP"
  L3_137(L4_138, L5_139, tostring(A1_135))
end
function EquipWidget.setMp(A0_140, A1_141, A2_142)
  local L3_143, L4_144, L5_145
  L4_144 = A0_140
  L3_143 = A0_140.setText
  L5_145 = "TextBlock_BaseParameter_MP"
  L3_143(L4_144, L5_145, tostring(A1_141))
end
function EquipWidget.setTp(A0_146, A1_147, A2_148)
  local L3_149, L4_150, L5_151
  L4_150 = A0_146
  L3_149 = A0_146.setText
  L5_151 = "TextBlock_BaseParameter_TP"
  L3_149(L4_150, L5_151, tostring(A1_147))
end
function EquipWidget.setStr(A0_152, A1_153, A2_154)
  local L3_155, L4_156
  L4_156 = A0_152
  L3_155 = A0_152.setText
  L3_155(L4_156, A0_152:getTemplateControl("Label_STR", "TextBlock_BaseParameter"), tostring(A1_153))
end
function EquipWidget.setVit(A0_157, A1_158, A2_159)
  local L3_160, L4_161
  L4_161 = A0_157
  L3_160 = A0_157.setText
  L3_160(L4_161, A0_157:getTemplateControl("Label_VIT", "TextBlock_BaseParameter"), tostring(A1_158))
end
function EquipWidget.setDex(A0_162, A1_163, A2_164)
  local L3_165, L4_166
  L4_166 = A0_162
  L3_165 = A0_162.setText
  L3_165(L4_166, A0_162:getTemplateControl("Label_DEX", "TextBlock_BaseParameter"), tostring(A1_163))
end
function EquipWidget.setInt(A0_167, A1_168, A2_169)
  local L3_170, L4_171
  L4_171 = A0_167
  L3_170 = A0_167.setText
  L3_170(L4_171, A0_167:getTemplateControl("Label_INT", "TextBlock_BaseParameter"), tostring(A1_168))
end
function EquipWidget.setMnd(A0_172, A1_173, A2_174)
  local L3_175, L4_176
  L4_176 = A0_172
  L3_175 = A0_172.setText
  L3_175(L4_176, A0_172:getTemplateControl("Label_MND", "TextBlock_BaseParameter"), tostring(A1_173))
end
function EquipWidget.setPie(A0_177, A1_178, A2_179)
  local L3_180, L4_181
  L4_181 = A0_177
  L3_180 = A0_177.setText
  L3_180(L4_181, A0_177:getTemplateControl("Label_PIE", "TextBlock_BaseParameter"), tostring(A1_178))
end
function EquipWidget.setFire(A0_182, A1_183)
  local L2_184, L3_185, L4_186
  L3_185 = A0_182
  L2_184 = A0_182.setText
  L4_186 = "TextBlock_ElementValue_FIRE"
  L2_184(L3_185, L4_186, tostring(A1_183))
end
function EquipWidget.setWater(A0_187, A1_188)
  local L2_189, L3_190, L4_191
  L3_190 = A0_187
  L2_189 = A0_187.setText
  L4_191 = "TextBlock_ElementValue_WATER"
  L2_189(L3_190, L4_191, tostring(A1_188))
end
function EquipWidget.setThunder(A0_192, A1_193)
  local L2_194, L3_195, L4_196
  L3_195 = A0_192
  L2_194 = A0_192.setText
  L4_196 = "TextBlock_ElementValue_THUNDER"
  L2_194(L3_195, L4_196, tostring(A1_193))
end
function EquipWidget.setWind(A0_197, A1_198)
  local L2_199, L3_200, L4_201
  L3_200 = A0_197
  L2_199 = A0_197.setText
  L4_201 = "TextBlock_ElementValue_WIND"
  L2_199(L3_200, L4_201, tostring(A1_198))
end
function EquipWidget.setEarth(A0_202, A1_203)
  local L2_204, L3_205, L4_206
  L3_205 = A0_202
  L2_204 = A0_202.setText
  L4_206 = "TextBlock_ElementValue_EARTH"
  L2_204(L3_205, L4_206, tostring(A1_203))
end
function EquipWidget.setIce(A0_207, A1_208)
  local L2_209, L3_210, L4_211
  L3_210 = A0_207
  L2_209 = A0_207.setText
  L4_211 = "TextBlock_ElementValue_ICE"
  L2_209(L3_210, L4_211, tostring(A1_208))
end
function EquipWidget.setMainAttack(A0_212, A1_213)
  local L2_214, L3_215
  L3_215 = A0_212
  L2_214 = A0_212.setText
  L2_214(L3_215, A0_212:getTemplateControl("Label_MainPhysicsAttack", "TextBlock_BaseParameter"), tostring(A1_213))
end
function EquipWidget.setMainRate(A0_216, A1_217)
  local L2_218, L3_219
  L3_219 = A0_216
  L2_218 = A0_216.setText
  L2_218(L3_219, A0_216:getTemplateControl("Label_MainPhysicsHit", "TextBlock_BaseParameter"), tostring(A1_217))
end
function EquipWidget.setDefence(A0_220, A1_221)
  local L2_222, L3_223
  L3_223 = A0_220
  L2_222 = A0_220.setText
  L2_222(L3_223, A0_220:getTemplateControl("Label_PhysicsDefense", "TextBlock_BaseParameter"), tostring(A1_221))
end
function EquipWidget.setEvasion(A0_224, A1_225)
  local L2_226, L3_227
  L3_227 = A0_224
  L2_226 = A0_224.setText
  L2_226(L3_227, A0_224:getTemplateControl("Label_Avoidance", "TextBlock_BaseParameter"), tostring(A1_225))
end
function EquipWidget.setAttackMagic(A0_228, A1_229)
  local L2_230, L3_231
  L3_231 = A0_228
  L2_230 = A0_228.setText
  L2_230(L3_231, A0_228:getTemplateControl("Label_AttackMagic", "TextBlock_BaseParameter"), tostring(A1_229))
end
function EquipWidget.setWeakMagic(A0_232, A1_233)
  local L2_234, L3_235
  L3_235 = A0_232
  L2_234 = A0_232.setText
  L2_234(L3_235, A0_232:getTemplateControl("Label_WeakMagic", "TextBlock_BaseParameter"), tostring(A1_233))
end
function EquipWidget.setHealMagic(A0_236, A1_237)
  local L2_238, L3_239
  L3_239 = A0_236
  L2_238 = A0_236.setText
  L2_238(L3_239, A0_236:getTemplateControl("Label_HealMagic", "TextBlock_BaseParameter"), tostring(A1_237))
end
function EquipWidget.setReinforceMagic(A0_240, A1_241)
  local L2_242, L3_243
  L3_243 = A0_240
  L2_242 = A0_240.setText
  L2_242(L3_243, A0_240:getTemplateControl("Label_ReinforceMagic", "TextBlock_BaseParameter"), tostring(A1_241))
end
function EquipWidget.setMagicHit(A0_244, A1_245)
  local L2_246, L3_247
  L3_247 = A0_244
  L2_246 = A0_244.setText
  L2_246(L3_247, A0_244:getTemplateControl("Label_MagicHit", "TextBlock_BaseParameter"), tostring(A1_245))
end
function EquipWidget.setMagicEvasion(A0_248, A1_249)
  local L2_250, L3_251
  L3_251 = A0_248
  L2_250 = A0_248.setText
  L2_250(L3_251, A0_248:getTemplateControl("Label_MagicEvasion", "TextBlock_BaseParameter"), tostring(A1_249))
end
function EquipWidget.setCraftProcessing(A0_252, A1_253)
  local L2_254, L3_255
  L3_255 = A0_252
  L2_254 = A0_252.setText
  L2_254(L3_255, A0_252:getTemplateControl("Label_PhysicalProcessing", "TextBlock_BaseParameter"), tostring(A1_253))
end
function EquipWidget.setCraftProcessControl(A0_256, A1_257)
  local L2_258, L3_259
  L3_259 = A0_256
  L2_258 = A0_256.setText
  L2_258(L3_259, A0_256:getTemplateControl("Label_AlteredControl", "TextBlock_BaseParameter"), tostring(A1_257))
end
function EquipWidget.setCraftMagicProcessing(A0_260, A1_261)
  local L2_262, L3_263
  L3_263 = A0_260
  L2_262 = A0_260.setText
  L2_262(L3_263, A0_260:getTemplateControl("Label_MagicProcessing", "TextBlock_BaseParameter"), tostring(A1_261))
end
function EquipWidget.setHarvestPotency(A0_264, A1_265)
  local L2_266, L3_267
  L3_267 = A0_264
  L2_266 = A0_264.setText
  L2_266(L3_267, A0_264:getTemplateControl("Label_GatheringAbility", "TextBlock_BaseParameter"), tostring(A1_265))
end
function EquipWidget.setHarvestLimit(A0_268, A1_269)
  local L2_270, L3_271
  L3_271 = A0_268
  L2_270 = A0_268.setText
  L2_270(L3_271, A0_268:getTemplateControl("Label_GatheringResistance", "TextBlock_BaseParameter"), tostring(A1_269))
end
function EquipWidget.setHarvestRate(A0_272, A1_273)
  local L2_274, L3_275
  L3_275 = A0_272
  L2_274 = A0_272.setText
  L2_274(L3_275, A0_272:getTemplateControl("Label_GatheringInspiration", "TextBlock_BaseParameter"), tostring(A1_273))
end
function EquipWidget.setEquipSlotIcon(A0_276, A1_277, A2_278, A3_279, A4_280)
  if A2_278 ~= nil and A2_278 > 0 then
    A0_276:setVisibility(A1_277, true)
    A0_276:setIcon(A1_277, A2_278)
    if A3_279 ~= nil then
      A0_276:setHidden(A3_279)
    end
  else
    A0_276:setHidden(A1_277)
    A0_276:setIcon(A1_277, 0)
    if A3_279 ~= nil and A4_280 ~= nil then
      A0_276:setIcon(A3_279, A4_280)
      A0_276:setVisibility(A3_279, true)
    end
  end
end
function EquipWidget.setMainWeapon(A0_281, A1_282, A2_283, A3_284, A4_285, A5_286, A6_287)
  A0_281:setEquipSlotIcon("Button_PrimaryArm:IconControl_EquipIcon", A1_282, "Button_PrimaryArm:IconControl_EquipIconBase", 359)
  A0_281:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_283)
  A0_281:setVisibility("Button_PrimaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_284)
  A0_281:setVisibility("Button_PrimaryArm" .. ":IconControl_PolishMAX", A4_285)
  A0_281:setVisibility("Button_PrimaryArm" .. ":IconControl_Materia", A5_286)
end
function EquipWidget.setSubWeapon(A0_288, A1_289, A2_290, A3_291, A4_292, A5_293, A6_294)
  A0_288:setEquipSlotIcon("Button_SecondaryArm:IconControl_EquipIcon", A1_289, "Button_SecondaryArm:IconControl_EquipIconBase", 361)
  A0_288:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconCaution", A2_290)
  A0_288:setVisibility("Button_SecondaryArm" .. ":Border_ItemLife_EquipIconDanger", A3_291)
  A0_288:setVisibility("Button_SecondaryArm" .. ":IconControl_PolishMAX", A4_292)
  A0_288:setVisibility("Button_SecondaryArm" .. ":IconControl_Materia", A5_293)
end
function EquipWidget.setPouch(A0_295, A1_296, A2_297, A3_298, A4_299, A5_300, A6_301)
  A0_295:setEquipSlotIcon("Button_LargePouch:IconControl_EquipIcon", A1_296, "Button_LargePouch:IconControl_EquipIconBase", 360)
  A0_295:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconCaution", A2_297)
  A0_295:setVisibility("Button_LargePouch" .. ":Border_ItemLife_EquipIconDanger", A3_298)
  A0_295:setVisibility("Button_LargePouch" .. ":IconControl_PolishMAX", A4_299)
  A0_295:setVisibility("Button_LargePouch" .. ":IconControl_Materia", A5_300)
end
function EquipWidget.setBadolier(A0_302, A1_303, A2_304, A3_305, A4_306, A5_307, A6_308)
  A0_302:setEquipSlotIcon("Button_SmallPouch:IconControl_EquipIcon", A1_303, "Button_SmallPouch:IconControl_EquipIconBase", 362)
  A0_302:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconCaution", A2_304)
  A0_302:setVisibility("Button_SmallPouch" .. ":Border_ItemLife_EquipIconDanger", A3_305)
  A0_302:setVisibility("Button_SmallPouch" .. ":IconControl_PolishMAX", A4_306)
  A0_302:setVisibility("Button_SmallPouch" .. ":IconControl_Materia", A5_307)
end
function EquipWidget.setThrowWeapon(A0_309, A1_310, A2_311, A3_312, A4_313, A5_314, A6_315)
  A0_309:setEquipSlotIcon("Button_ThrowingWeapon:IconControl_EquipIcon", A1_310, "Button_ThrowingWeapon:IconControl_EquipIconBase", 363)
  A0_309:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconCaution", A2_311)
  A0_309:setVisibility("Button_ThrowingWeapon" .. ":Border_ItemLife_EquipIconDanger", A3_312)
  A0_309:setVisibility("Button_ThrowingWeapon" .. ":IconControl_PolishMAX", A4_313)
  A0_309:setVisibility("Button_ThrowingWeapon" .. ":IconControl_Materia", A5_314)
end
function EquipWidget.setHead(A0_316, A1_317, A2_318, A3_319, A4_320, A5_321, A6_322)
  A0_316:setEquipSlotIcon("Button_Head:IconControl_EquipIcon", A1_317, "Button_Head:IconControl_EquipIconBase", 364)
  A0_316:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconCaution", A2_318)
  A0_316:setVisibility("Button_Head" .. ":Border_ItemLife_EquipIconDanger", A3_319)
  A0_316:setVisibility("Button_Head" .. ":IconControl_PolishMAX", A4_320)
  A0_316:setVisibility("Button_Head" .. ":IconControl_Materia", A5_321)
end
function EquipWidget.setBody(A0_323, A1_324, A2_325, A3_326, A4_327, A5_328, A6_329)
  A0_323:setEquipSlotIcon("Button_Body:IconControl_EquipIcon", A1_324, "Button_Body:IconControl_EquipIconBase", 365)
  A0_323:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconCaution", A2_325)
  A0_323:setVisibility("Button_Body" .. ":Border_ItemLife_EquipIconDanger", A3_326)
  A0_323:setVisibility("Button_Body" .. ":IconControl_PolishMAX", A4_327)
  A0_323:setVisibility("Button_Body" .. ":IconControl_Materia", A5_328)
end
function EquipWidget.setBodyInner(A0_330, A1_331, A2_332, A3_333, A4_334, A5_335, A6_336)
  A0_330:setEquipSlotIcon("Button_Undershirt:IconControl_EquipIcon", A1_331, "Button_Undershirt:IconControl_EquipIconBase", 366)
  A0_330:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconCaution", A2_332)
  A0_330:setVisibility("Button_Undershirt" .. ":Border_ItemLife_EquipIconDanger", A3_333)
  A0_330:setVisibility("Button_Undershirt" .. ":IconControl_PolishMAX", A4_334)
  A0_330:setVisibility("Button_Undershirt" .. ":IconControl_Materia", A5_335)
end
function EquipWidget.setHands(A0_337, A1_338, A2_339, A3_340, A4_341, A5_342, A6_343)
  A0_337:setEquipSlotIcon("Button_Hands:IconControl_EquipIcon", A1_338, "Button_Hands:IconControl_EquipIconBase", 367)
  A0_337:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconCaution", A2_339)
  A0_337:setVisibility("Button_Hands" .. ":Border_ItemLife_EquipIconDanger", A3_340)
  A0_337:setVisibility("Button_Hands" .. ":IconControl_PolishMAX", A4_341)
  A0_337:setVisibility("Button_Hands" .. ":IconControl_Materia", A5_342)
end
function EquipWidget.setWaist(A0_344, A1_345, A2_346, A3_347, A4_348, A5_349, A6_350)
  A0_344:setEquipSlotIcon("Button_Waist:IconControl_EquipIcon", A1_345, "Button_Waist:IconControl_EquipIconBase", 368)
  A0_344:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconCaution", A2_346)
  A0_344:setVisibility("Button_Waist" .. ":Border_ItemLife_EquipIconDanger", A3_347)
  A0_344:setVisibility("Button_Waist" .. ":IconControl_PolishMAX", A4_348)
  A0_344:setVisibility("Button_Waist" .. ":IconControl_Materia", A5_349)
end
function EquipWidget.setLegs(A0_351, A1_352, A2_353, A3_354, A4_355, A5_356, A6_357)
  A0_351:setEquipSlotIcon("Button_Legs:IconControl_EquipIcon", A1_352, "Button_Legs:IconControl_EquipIconBase", 369)
  A0_351:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconCaution", A2_353)
  A0_351:setVisibility("Button_Legs" .. ":Border_ItemLife_EquipIconDanger", A3_354)
  A0_351:setVisibility("Button_Legs" .. ":IconControl_PolishMAX", A4_355)
  A0_351:setVisibility("Button_Legs" .. ":IconControl_Materia", A5_356)
end
function EquipWidget.setLegsInner(A0_358, A1_359, A2_360, A3_361, A4_362, A5_363, A6_364)
  A0_358:setEquipSlotIcon("Button_Undergarment:IconControl_EquipIcon", A1_359, "Button_Undergarment:IconControl_EquipIconBase", 370)
  A0_358:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconCaution", A2_360)
  A0_358:setVisibility("Button_Undergarment" .. ":Border_ItemLife_EquipIconDanger", A3_361)
  A0_358:setVisibility("Button_Undergarment" .. ":IconControl_PolishMAX", A4_362)
  A0_358:setVisibility("Button_Undergarment" .. ":IconControl_Materia", A5_363)
end
function EquipWidget.setFeet(A0_365, A1_366, A2_367, A3_368, A4_369, A5_370, A6_371)
  A0_365:setEquipSlotIcon("Button_Feet:IconControl_EquipIcon", A1_366, "Button_Feet:IconControl_EquipIconBase", 371)
  A0_365:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconCaution", A2_367)
  A0_365:setVisibility("Button_Feet" .. ":Border_ItemLife_EquipIconDanger", A3_368)
  A0_365:setVisibility("Button_Feet" .. ":IconControl_PolishMAX", A4_369)
  A0_365:setVisibility("Button_Feet" .. ":IconControl_Materia", A5_370)
end
function EquipWidget.setEarR(A0_372, A1_373, A2_374, A3_375, A4_376, A5_377, A6_378)
  A0_372:setEquipSlotIcon("Button_Accessories_RightEar:IconControl_EquipIcon", A1_373, "Button_Accessories_RightEar:IconControl_EquipIconBase", 372)
  A0_372:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconCaution", A2_374)
  A0_372:setVisibility("Button_Accessories_RightEar" .. ":Border_ItemLife_EquipIconDanger", A3_375)
  A0_372:setVisibility("Button_Accessories_RightEar" .. ":IconControl_PolishMAX", A4_376)
  A0_372:setVisibility("Button_Accessories_RightEar" .. ":IconControl_Materia", A5_377)
end
function EquipWidget.setEarL(A0_379, A1_380, A2_381, A3_382, A4_383, A5_384, A6_385)
  A0_379:setEquipSlotIcon("Button_Accessories_LeftEar:IconControl_EquipIcon", A1_380, "Button_Accessories_LeftEar:IconControl_EquipIconBase", 372)
  A0_379:setVisibility("Button_Accessories_LeftEar" .. ":Border_ItemLife_EquipIconCaution", A2_381)
  A0_379:setVisibility("Button_Accessories_LeftEar" .. ":Border_ItemLife_EquipIconDanger", A3_382)
  A0_379:setVisibility("Button_Accessories_LeftEar" .. ":IconControl_PolishMAX", A4_383)
  A0_379:setVisibility("Button_Accessories_LeftEar" .. ":IconControl_Materia", A5_384)
end
function EquipWidget.setNeck(A0_386, A1_387, A2_388, A3_389, A4_390, A5_391, A6_392)
  A0_386:setEquipSlotIcon("Button_Accessories_Neck:IconControl_EquipIcon", A1_387, "Button_Accessories_Neck:IconControl_EquipIconBase", 373)
  A0_386:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconCaution", A2_388)
  A0_386:setVisibility("Button_Accessories_Neck" .. ":Border_ItemLife_EquipIconDanger", A3_389)
  A0_386:setVisibility("Button_Accessories_Neck" .. ":IconControl_PolishMAX", A4_390)
  A0_386:setVisibility("Button_Accessories_Neck" .. ":IconControl_Materia", A5_391)
end
function EquipWidget.setIndexL(A0_393, A1_394, A2_395, A3_396, A4_397, A5_398, A6_399)
  A0_393:setEquipSlotIcon("Button_Accessories_LeftFinger_1:IconControl_EquipIcon", A1_394, "Button_Accessories_LeftFinger_1:IconControl_EquipIconBase", 374)
  A0_393:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_395)
  A0_393:setVisibility("Button_Accessories_LeftFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_396)
  A0_393:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_PolishMAX", A4_397)
  A0_393:setVisibility("Button_Accessories_LeftFinger_1" .. ":IconControl_Materia", A5_398)
end
function EquipWidget.setRingL(A0_400, A1_401, A2_402, A3_403, A4_404, A5_405, A6_406)
  A0_400:setEquipSlotIcon("Button_Accessories_LeftFinger_2:IconControl_EquipIcon", A1_401, "Button_Accessories_LeftFinger_2:IconControl_EquipIconBase", 374)
  A0_400:setVisibility("Button_Accessories_LeftFinger_2" .. ":Border_ItemLife_EquipIconCaution", A2_402)
  A0_400:setVisibility("Button_Accessories_LeftFinger_2" .. ":Border_ItemLife_EquipIconDanger", A3_403)
  A0_400:setVisibility("Button_Accessories_LeftFinger_2" .. ":IconControl_PolishMAX", A4_404)
  A0_400:setVisibility("Button_Accessories_LeftFinger_2" .. ":IconControl_Materia", A5_405)
end
function EquipWidget.setWristL(A0_407, A1_408, A2_409, A3_410, A4_411, A5_412, A6_413)
  A0_407:setEquipSlotIcon("Button_Accessories_LeftBracelet:IconControl_EquipIcon", A1_408, "Button_Accessories_LeftBracelet:IconControl_EquipIconBase", 375)
  A0_407:setVisibility("Button_Accessories_LeftBracelet" .. ":Border_ItemLife_EquipIconCaution", A2_409)
  A0_407:setVisibility("Button_Accessories_LeftBracelet" .. ":Border_ItemLife_EquipIconDanger", A3_410)
  A0_407:setVisibility("Button_Accessories_LeftBracelet" .. ":IconControl_PolishMAX", A4_411)
  A0_407:setVisibility("Button_Accessories_LeftBracelet" .. ":IconControl_Materia", A5_412)
end
function EquipWidget.setIndexR(A0_414, A1_415, A2_416, A3_417, A4_418, A5_419, A6_420)
  A0_414:setEquipSlotIcon("Button_Accessories_RightFinger_1:IconControl_EquipIcon", A1_415, "Button_Accessories_RightFinger_1:IconControl_EquipIconBase", 374)
  A0_414:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconCaution", A2_416)
  A0_414:setVisibility("Button_Accessories_RightFinger_1" .. ":Border_ItemLife_EquipIconDanger", A3_417)
  A0_414:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_PolishMAX", A4_418)
  A0_414:setVisibility("Button_Accessories_RightFinger_1" .. ":IconControl_Materia", A5_419)
end
function EquipWidget.setRingR(A0_421, A1_422, A2_423, A3_424, A4_425, A5_426, A6_427)
  A0_421:setEquipSlotIcon("Button_Accessories_RightFinger_2:IconControl_EquipIcon", A1_422, "Button_Accessories_RightFinger_2:IconControl_EquipIconBase", 374)
  A0_421:setVisibility("Button_Accessories_RightFinger_2" .. ":Border_ItemLife_EquipIconCaution", A2_423)
  A0_421:setVisibility("Button_Accessories_RightFinger_2" .. ":Border_ItemLife_EquipIconDanger", A3_424)
  A0_421:setVisibility("Button_Accessories_RightFinger_2" .. ":IconControl_PolishMAX", A4_425)
  A0_421:setVisibility("Button_Accessories_RightFinger_2" .. ":IconControl_Materia", A5_426)
end
function EquipWidget.setWristR(A0_428, A1_429, A2_430, A3_431, A4_432, A5_433, A6_434)
  A0_428:setEquipSlotIcon("Button_Accessories_RightBracelet:IconControl_EquipIcon", A1_429, "Button_Accessories_RightBracelet:IconControl_EquipIconBase", 375)
  A0_428:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconCaution", A2_430)
  A0_428:setVisibility("Button_Accessories_RightBracelet" .. ":Border_ItemLife_EquipIconDanger", A3_431)
  A0_428:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_PolishMAX", A4_432)
  A0_428:setVisibility("Button_Accessories_RightBracelet" .. ":IconControl_Materia", A5_433)
end
function EquipWidget.setPlayerName(A0_435, A1_436)
  A0_435:setText("TextBlock_PlayerName", 230, A1_436)
end
function EquipWidget.setCurrentSkill(A0_437, A1_438, A2_439, A3_440, A4_441)
  if A1_438 > 0 then
    A0_437:setVisibility("IconControl_Skill", true)
    A0_437:setVisibility("TextBlock_SkillRankTitle", true)
    if A1_438 == A2_439 then
      A2_439 = 0
    else
      A3_440 = desktopWidget:getSkillIcon(A2_439)
    end
    A0_437:setIcon("IconControl_Skill", A3_440)
    A0_437:setText("TextBlock_SkillRankTitle", 231, A1_438, A4_441, A2_439)
  else
    A0_437:setVisibility("IconControl_Skill", false)
    A0_437:setVisibility("TextBlock_SkillRankTitle", false)
  end
end
function EquipWidget.setSkill(A0_442, A1_443, A2_444)
  local L3_445, L4_446, L5_447, L6_448
  L3_445 = "TextBlock_Rank_"
  L4_446 = A1_443
  L3_445 = L3_445 .. L4_446
  L4_446 = "Grid_"
  L5_447 = A1_443
  L4_446 = L4_446 .. L5_447
  L5_447 = worldMaster
  L6_448 = L5_447
  L5_447 = L5_447._getMyPlayer
  L5_447 = L5_447(L6_448)
  L6_448 = L5_447.getSkillLevel
  L6_448 = L6_448(L5_447, A2_444)
  if L5_447:isSkillEnabled(A2_444) == false then
    A0_442:setHidden(L3_445)
    A0_442:setColor(L4_446, 0.5, 0.5, 0.5)
  else
    if A2_444 == L5_447:getStateMainSkill() then
      A0_442:setStyle(L3_445, "TBL_equippedItem")
    else
      A0_442:setStyle(L3_445, "TBL_null")
    end
    A0_442:setVisibility(L3_445, true)
    A0_442:setText(L3_445, tostring(L6_448))
    A0_442:setColor(L4_446, 1, 1, 1)
  end
end
function EquipWidget.setCity(A0_449, A1_450)
end
function EquipWidget.slotNameToEquipSlotNum(A0_451, A1_452)
  local L2_453
  if A1_452 == "Button_PrimaryArm" then
    L2_453 = 1
    return L2_453
  elseif A1_452 == "Button_LargePouch" then
    L2_453 = 6
    return L2_453
  elseif A1_452 == "Button_SecondaryArm" then
    L2_453 = 2
    return L2_453
  elseif A1_452 == "Button_SmallPouch" then
    L2_453 = 7
    return L2_453
  elseif A1_452 == "Button_ThrowingWeapon" then
    L2_453 = 5
    return L2_453
  elseif A1_452 == "Button_Head" then
    L2_453 = 9
    return L2_453
  elseif A1_452 == "Button_Body" then
    L2_453 = 11
    return L2_453
  elseif A1_452 == "Button_Undershirt" then
    L2_453 = 10
    return L2_453
  elseif A1_452 == "Button_Hands" then
    L2_453 = 14
    return L2_453
  elseif A1_452 == "Button_Waist" then
    L2_453 = 16
    return L2_453
  elseif A1_452 == "Button_Legs" then
    L2_453 = 13
    return L2_453
  elseif A1_452 == "Button_Undergarment" then
    L2_453 = 12
    return L2_453
  elseif A1_452 == "Button_Feet" then
    L2_453 = 15
    return L2_453
  elseif A1_452 == "Button_Accessories_RightEar" then
    L2_453 = 18
    return L2_453
  elseif A1_452 == "Button_Accessories_LeftEar" then
    L2_453 = 19
    return L2_453
  elseif A1_452 == "Button_Accessories_Neck" then
    L2_453 = 17
    return L2_453
  elseif A1_452 == "Button_Accessories_RightFinger_1" then
    L2_453 = 22
    return L2_453
  elseif A1_452 == "Button_Accessories_RightFinger_2" then
    L2_453 = 24
    return L2_453
  elseif A1_452 == "Button_Accessories_RightBracelet" then
    L2_453 = 20
    return L2_453
  elseif A1_452 == "Button_Accessories_LeftFinger_1" then
    L2_453 = 23
    return L2_453
  elseif A1_452 == "Button_Accessories_LeftFinger_2" then
    L2_453 = 25
    return L2_453
  elseif A1_452 == "Button_Accessories_LeftBracelet" then
    L2_453 = 21
    return L2_453
  else
    L2_453 = 0
    return L2_453
  end
end
function EquipWidget.equipSlotNumToSlotName(A0_454, A1_455)
  local L2_456
  if A1_455 == 1 then
    L2_456 = "Button_PrimaryArm"
    return L2_456
  elseif A1_455 == 6 then
    L2_456 = "Button_LargePouch"
    return L2_456
  elseif A1_455 == 2 then
    L2_456 = "Button_SecondaryArm"
    return L2_456
  elseif A1_455 == 7 then
    L2_456 = "Button_SmallPouch"
    return L2_456
  elseif A1_455 == 5 then
    L2_456 = "Button_ThrowingWeapon"
    return L2_456
  elseif A1_455 == 9 then
    L2_456 = "Button_Head"
    return L2_456
  elseif A1_455 == 11 then
    L2_456 = "Button_Body"
    return L2_456
  elseif A1_455 == 10 then
    L2_456 = "Button_Undershirt"
    return L2_456
  elseif A1_455 == 14 then
    L2_456 = "Button_Hands"
    return L2_456
  elseif A1_455 == 16 then
    L2_456 = "Button_Waist"
    return L2_456
  elseif A1_455 == 13 then
    L2_456 = "Button_Legs"
    return L2_456
  elseif A1_455 == 12 then
    L2_456 = "Button_Undergarment"
    return L2_456
  elseif A1_455 == 15 then
    L2_456 = "Button_Feet"
    return L2_456
  elseif A1_455 == 18 then
    L2_456 = "Button_Accessories_RightEar"
    return L2_456
  elseif A1_455 == 19 then
    L2_456 = "Button_Accessories_LeftEar"
    return L2_456
  elseif A1_455 == 17 then
    L2_456 = "Button_Accessories_Neck"
    return L2_456
  elseif A1_455 == 22 then
    L2_456 = "Button_Accessories_RightFinger_1"
    return L2_456
  elseif A1_455 == 24 then
    L2_456 = "Button_Accessories_RightFinger_2"
    return L2_456
  elseif A1_455 == 20 then
    L2_456 = "Button_Accessories_RightBracelet"
    return L2_456
  elseif A1_455 == 23 then
    L2_456 = "Button_Accessories_LeftFinger_1"
    return L2_456
  elseif A1_455 == 25 then
    L2_456 = "Button_Accessories_LeftFinger_2"
    return L2_456
  elseif A1_455 == 21 then
    L2_456 = "Button_Accessories_LeftBracelet"
    return L2_456
  else
    L2_456 = nil
    return L2_456
  end
end
function EquipWidget.maskEquipSlot(A0_457, A1_458, A2_459, A3_460, A4_461, A5_462)
  local L6_463, L7_464, L8_465, L9_466
  L6_463 = 75206
  L7_464 = 75206
  L8_465 = A1_458
  if L8_465 == 111 then
  else
  end
  if L8_465 == 101 then
    L6_463 = 75206
    break
  else
  end
  if L8_465 == 103 then
    L6_463 = 75208
    L7_464 = 75212
    break
  elseif L8_465 == 113 then
  else
  end
  if L8_465 == 114 then
    L6_463 = 75207
    L7_464 = 75213
    break
  else
  end
  L8_465 = true
  L9_466 = L6_463
  if A2_459 ~= nil then
    L9_466 = L7_464
    L8_465 = false
    A0_457.work.slotmasking = true
  else
    A0_457.work.slotmasking = false
  end
  A0_457:maskSlot("Button_PrimaryArm", L8_465, L9_466)
  A0_457:maskSlot("Button_LargePouch", L8_465, L9_466)
  A0_457:maskSlot("Button_SecondaryArm", L8_465, L9_466)
  A0_457:maskSlot("Button_SmallPouch", L8_465, L9_466)
  A0_457:maskSlot("Button_ThrowingWeapon", L8_465, L9_466)
  A0_457:maskSlot("Button_Head", L8_465, L9_466)
  A0_457:maskSlot("Button_Body", L8_465, L9_466)
  A0_457:maskSlot("Button_Undershirt", L8_465, L9_466)
  A0_457:maskSlot("Button_Hands", L8_465, L9_466)
  A0_457:maskSlot("Button_Waist", L8_465, L9_466)
  A0_457:maskSlot("Button_Legs", L8_465, L9_466)
  A0_457:maskSlot("Button_Undergarment", L8_465, L9_466)
  A0_457:maskSlot("Button_Feet", L8_465, L9_466)
  A0_457:maskSlot("Button_Accessories_RightEar", L8_465, L9_466)
  A0_457:maskSlot("Button_Accessories_Neck", L8_465, L9_466)
  A0_457:maskSlot("Button_Accessories_RightFinger_1", L8_465, L9_466)
  A0_457:maskSlot("Button_Accessories_RightBracelet", L8_465, L9_466)
  A0_457:maskSlot("Button_Accessories_LeftFinger_1", L8_465, L9_466)
  if A2_459 ~= nil then
    A0_457:maskSlot(A2_459, true, L6_463)
  end
  if A3_460 ~= nil then
    if A2_459 == "Button_Accessories_RightFinger_1" and A5_462 == "Button_Accessories_LeftFinger_2" then
      A0_457:maskSlot("Button_Accessories_RightFinger_1", true, L6_463)
      A0_457:maskSlot("Button_Accessories_RightFinger_2", true, L6_463)
      A0_457:maskSlot("Button_Accessories_LeftFinger_1", true, L6_463)
      A0_457:maskSlot("Button_Accessories_LeftFinger_2", true, L6_463)
    else
      A0_457:maskSlot(A3_460, true, L6_463)
    end
  end
  if A1_458 == 101 then
  else
  end
  if A1_458 == 111 then
    A0_457:setEnable("Button_RepairEquipment", true)
    A0_457:setEnable("Button_JobStone", true)
    A0_457:maskSlot("Button_JobStone", true, 75220)
    break
  else
  end
  A0_457:setEnable("Button_RepairEquipment", false)
  A0_457:setEnable("Button_JobStone", false)
  A0_457:maskSlot("Button_JobStone", false, 75223)
  break
end
function EquipWidget.maskSlot(A0_467, A1_468, A2_469, A3_470)
  if A2_469 == false then
    A0_467:setColor(A1_468, 0.5, 0.5, 0.5)
    A0_467:setEnable(A1_468, false)
  else
    A0_467:setColor(A1_468, 1, 1, 1)
    A0_467:setEnable(A1_468, true)
    A0_467:setControlProperty(A1_468 .. ":Label_HoverEffect", "IsTabStop", true)
  end
  if A3_470 ~= nil then
    A0_467:setHelpParameter(A1_468, 1, A3_470)
  end
end
function EquipWidget.maskEquipSlotForJob(A0_471, A1_472)
  local L2_473
  L2_473 = 75222
  if A1_472 == true then
    L2_473 = 75206
  end
  A0_471:setEnable("Button_RepairEquipment", A1_472)
  A0_471:maskSlot("Button_PrimaryArm", A1_472, L2_473)
  A0_471:maskSlot("Button_LargePouch", A1_472, L2_473)
  A0_471:maskSlot("Button_SecondaryArm", A1_472, L2_473)
  A0_471:maskSlot("Button_SmallPouch", A1_472, L2_473)
  A0_471:maskSlot("Button_ThrowingWeapon", A1_472, L2_473)
  A0_471:maskSlot("Button_Head", A1_472, L2_473)
  A0_471:maskSlot("Button_Body", A1_472, L2_473)
  A0_471:maskSlot("Button_Undershirt", A1_472, L2_473)
  A0_471:maskSlot("Button_Hands", A1_472, L2_473)
  A0_471:maskSlot("Button_Waist", A1_472, L2_473)
  A0_471:maskSlot("Button_Legs", A1_472, L2_473)
  A0_471:maskSlot("Button_Undergarment", A1_472, L2_473)
  A0_471:maskSlot("Button_Feet", A1_472, L2_473)
  A0_471:maskSlot("Button_Accessories_RightEar", A1_472, L2_473)
  A0_471:maskSlot("Button_Accessories_Neck", A1_472, L2_473)
  A0_471:maskSlot("Button_Accessories_RightFinger_1", A1_472, L2_473)
  A0_471:maskSlot("Button_Accessories_RightBracelet", A1_472, L2_473)
  A0_471:maskSlot("Button_Accessories_LeftFinger_1", A1_472, L2_473)
  if A1_472 == true then
    A0_471:setHelpParameter("Button_JobStone", 1, 75220)
    A0_471:setControlProperty("Button_JobStone" .. ":Label_HoverEffect", "IsTabStop", true)
  else
    A0_471:setHelpParameter("Button_JobStone", 1, 75221)
    A0_471:setControlProperty("Button_JobStone" .. ":Label_HoverEffect", "IsTabStop", false)
  end
end
function EquipWidget.initItemPart(A0_474)
  A0_474.work.chosenItem = 0
  A0_474.work.bonus1 = false
  A0_474.work.bonus2 = false
  A0_474.work.bonus3 = false
  A0_474.work.itemlife = false
  A0_474.work.bazaar = false
  A0_474.work.updatenexttime = false
  A0_474.work.demandSync = false
  A0_474.work.focus = 0
  A0_474.work.chosenSlot = 1
  A0_474.work.sorttype = desktopWidget:getConfigWork(9)
  A0_474.work.submenu = false
  A0_474:setConfirmCondition("Button_SortStatus")
  A0_474:displaySortType(A0_474.work.sorttype)
  A0_474:initListBox(1)
  A0_474:initListBox(2)
  A0_474:setText("TextBlock_Help", "")
  A0_474.work.mode = 420
  A0_474.work.listbox = 1
  A0_474.work.index = 0
  A0_474.work.listSelectStep = 0
  A0_474:setCancelCondition("TextBlock_NoContents_1")
  A0_474:setText("TextBlock_NoContents_1", 3604)
  A0_474:setText("TextBlock_ItemLifeHeader", 214, 10091)
  A0_474:setText("TextBlock_RepairMaterialHeader", 214, 10093)
  A0_474.work.chosenPackage = 0
  A0_474.work.chosenItem = 0
  A0_474:resetListBox(1)
  A0_474:setText("TextBlock_Help", "")
  A0_474:setVisibility("TextBlock_NoContents_2", false)
  A0_474:makeListFromPackage()
  A0_474:updateImportantList()
  A0_474:updateImportantOpacity()
end
function EquipWidget.getListPropertyName(A0_475, A1_476)
  local L2_477
  if A1_476 == 1 then
    L2_477 = "TabItem_1_Maker"
    return L2_477
  elseif A1_476 == 2 then
    L2_477 = "TabItem_2_Maker"
    return L2_477
  elseif A1_476 == 3 then
    L2_477 = "TabItem_3_Maker"
    return L2_477
  elseif A1_476 == 4 then
    L2_477 = "TabItem_4_Maker"
    return L2_477
  elseif A1_476 == 5 then
    L2_477 = "TabItem_5_Maker"
    return L2_477
  elseif A1_476 == 8 then
    L2_477 = "SlotItem_Maker"
    return L2_477
  elseif A1_476 == 9 then
    L2_477 = "HelpCache_Maker"
    return L2_477
  end
end
function EquipWidget.setButtonEvents(A0_478, A1_479)
  local L2_480
  L2_480 = A0_478.getControlProperty
  L2_480 = L2_480(A0_478, A1_479, "Command")
  A0_478:setControlCommandCondition(A1_479, L2_480)
  A0_478:setControlCommandCondition(A1_479, "UILuaCommands.ButtonFocused")
  A0_478:setCancelCondition(A1_479)
end
function EquipWidget.updateWindowDisplay(A0_481, A1_482)
  if A0_481.work.equipStep == 101 then
    A0_481:setGridVisibility(4)
  elseif A0_481.work.equipStep == 102 then
    A0_481:setGridVisibility(4)
  elseif A0_481.work.equipStep == 103 then
    A0_481:setGridVisibility(1)
  elseif A0_481.work.equipStep == 104 then
    A0_481:setGridVisibility(2)
  elseif A0_481.work.equipStep == 111 then
    A0_481:setGridVisibility(1)
  elseif A0_481.work.equipStep == 112 then
    A0_481:setGridVisibility(2)
  elseif A0_481.work.equipStep == 113 then
    A0_481:setGridVisibility(2)
  elseif A0_481.work.equipStep == 114 then
    A0_481:setGridVisibility(5)
  elseif A0_481.work.equipStep == 121 then
    A0_481:setGridVisibility(4)
    A0_481:setVisibility("Grid_ItemList", false)
    A0_481:setVisibility("Grid_JobStoneList", true)
    A0_481:setHidden("Grid_BackpackAndGil")
  elseif A0_481.work.equipStep == 122 then
    A0_481:setGridVisibility(1)
    A0_481:setVisibility("Grid_ItemList", false)
    A0_481:setVisibility("Grid_JobStoneList", true)
    A0_481:setHidden("Grid_BackpackAndGil")
  end
  if A1_482 == true then
    A0_481:updateListFocus()
  end
end
function EquipWidget.updateListFocus(A0_483)
  local L1_484, L2_485, L3_486, L4_487, L5_488, L6_489
  L2_485 = A0_483
  L1_484 = A0_483.getListBoxFocusNum
  L3_486 = A0_483.work
  L3_486 = L3_486.listbox
  L4_487 = L1_484(L2_485, L3_486)
  L6_489 = A0_483
  L5_488 = A0_483.getListPropertyName
  L5_488 = L5_488(L6_489, A0_483.work.listbox)
  L6_489 = A0_483.getListBoxName
  L6_489 = L6_489(A0_483, A0_483.work.listbox)
  if L1_484 == 0 then
    A0_483.work.listSelectStep = 1
    A0_483:setVisibility("TextBlock_NoContents_1", true)
    A0_483:setWindowFocus("TextBlock_NoContents_1")
    A0_483:displayFocusedItemHelp()
  else
    A0_483:setVisibility("TextBlock_NoContents_1", false)
    if A0_483.work.focus > L1_484 - 1 then
      A0_483.work.focus = L1_484 - 1
    end
    if 0 <= A0_483:focusToIndex(A0_483.work.listbox, A0_483.work.focus) then
      A0_483.work.index = A0_483:focusToIndex(A0_483.work.listbox, A0_483.work.focus)
    end
    if A0_483.work.listSelectStep == 1 then
      A0_483:setWindowFocus(L6_489)
      if true == true then
      end
    end
    A0_483:setFocusedIndex(L6_489, A0_483.work.focus)
    A0_483:displayFocusedItemHelp()
  end
end
function EquipWidget.setGridVisibility(A0_490, A1_491)
  A0_490:setVisibility("Grid_ActorName", false)
  A0_490:setVisibility("Grid_Help", A1_491 == 3 or A1_491 == 6)
  A0_490:setVisibility("Grid_ItemList", A1_491 == 1 or A1_491 == 2 or A1_491 == 3 or A1_491 == 4 or A1_491 == 5 or A1_491 == 6)
  A0_490:setVisibility("Grid_BackpackAndGil", A1_491 == 1 or A1_491 == 2 or A1_491 == 3 or A1_491 == 4 or A1_491 == 5 or A1_491 == 6)
  A0_490:setVisibility("Grid_ItemNameBase", A1_491 == 1 or A1_491 == 2 or A1_491 == 4 or A1_491 == 5)
  A0_490:setVisibility("Grid_ItemDetail1", A0_490.work.bonus1)
  A0_490:setVisibility("Grid_ItemDetail2", A0_490.work.bonus2)
  A0_490:setVisibility("Grid_ItemDetail3", A0_490.work.bonus3 or A0_490.work.itemlife or A0_490.work.bazaar)
  A0_490:setVisibility("Label_ItemBonus5", A0_490.work.bonus3)
  A0_490:setVisibility("Grid_ItemLife", A0_490.work.itemlife)
  A0_490:setVisibility("TOG_itemDetail", false)
  A0_490:setVisibility("Grid_RepairEquipment", false)
end
function EquipWidget.setWindowFocus(A0_492, A1_493)
  if A1_493 ~= nil and A1_493 ~= "" then
    A0_492:setLogicalFocus(A1_493)
    if desktopWidget:_getKeyboardFocusedWidget() == A0_492 then
      A0_492:setKeyboardFocusedControl(A1_493)
    end
  end
end
function EquipWidget.displayBagcapacityAndMoney(A0_494)
  local L1_495, L2_496, L3_497
  L1_495 = worldMaster
  L2_496 = L1_495
  L1_495 = L1_495._getMyPlayer
  L1_495 = L1_495(L2_496)
  L3_497 = L1_495
  L2_496 = L1_495.getMoneyOnHand
  L2_496 = L2_496(L3_497)
  L3_497 = A0_494.setText
  L3_497(A0_494, "TextBlock_Gil", 3263, L2_496)
  L3_497 = L1_495._getItemPackageCapacity
  L3_497 = L3_497(L1_495, 1)
  A0_494:setText("TextBlock_ItemStack_2", 3551, L3_497 - L1_495:_getItemPackageFreeSpace(1), L3_497)
end
function EquipWidget.isExistItem(A0_498, A1_499, A2_500)
  if worldMaster:_getMyPlayer():_getItem(A1_499, A2_500) ~= nil then
    return true
  else
    return false
  end
end
function EquipWidget.getListBoxName(A0_501, A1_502)
  local L2_503
  if A1_502 == 1 then
    L2_503 = "ListBox_TabItem_1"
    return L2_503
  elseif A1_502 == 2 then
    L2_503 = "ListBox_TabItem_2"
    return L2_503
  elseif A1_502 == 3 then
    L2_503 = "ListBox_TabItem_3"
    return L2_503
  elseif A1_502 == 4 then
    L2_503 = "ListBox_TabItem_4"
    return L2_503
  elseif A1_502 == 5 then
    L2_503 = "ListBox_TabItem_5"
    return L2_503
  else
    L2_503 = ""
    return L2_503
  end
end
function EquipWidget.getListBoxItemNum(A0_504, A1_505)
  local L2_506, L3_507
  L3_507 = A0_504
  L2_506 = A0_504.getListPropertyCount
  return L2_506(L3_507, A0_504:getListPropertyName(A1_505))
end
function EquipWidget.getListBoxFocusNum(A0_508, A1_509)
  local L2_510, L3_511, L4_512, L5_513
  L3_511 = A0_508
  L2_510 = A0_508.getListBoxItemNum
  L4_512 = A1_509
  L2_510 = L2_510(L3_511, L4_512)
  L4_512 = A0_508
  L3_511 = A0_508.getListPropertyName
  L5_513 = A1_509
  L3_511 = L3_511(L4_512, L5_513)
  if L2_510 == 0 then
    L4_512 = 0
    L5_513 = 0
    return L4_512, L5_513, 0, 0
  end
  L5_513 = A0_508
  L4_512 = A0_508.getControlProperty
  L4_512 = L4_512(L5_513, L3_511, "FilteredCount")
  L5_513 = A0_508.work
  L5_513 = L5_513.focus
  if L4_512 < A0_508.work.focus then
    L5_513 = L4_512 - 1
  end
  return L4_512, L4_512 - 1, 0, L5_513
end
function EquipWidget.focusToIndex(A0_514, A1_515, A2_516)
  local L3_517
  L3_517 = A0_514.getListPropertyName
  L3_517 = L3_517(A0_514, A1_515)
  if A0_514:getListBoxFocusNum(A1_515) == 0 or A2_516 >= A0_514:getListBoxFocusNum(A1_515) then
    return -1
  else
    A0_514:setControlProperty(L3_517, "FilteredIndex", A2_516)
    return A0_514:getControlProperty(L3_517, "Index")
  end
end
function EquipWidget.indexToFocus(A0_518, A1_519, A2_520)
  local L3_521, L4_522
  L3_521 = -1
  L4_522 = A0_518.getListPropertyName
  L4_522 = L4_522(A0_518, A1_519)
  if A0_518:getListBoxFocusNum(A1_519) > 0 then
    A0_518:setControlProperty(L4_522, "Index", A2_520)
    L3_521 = A0_518:getControlProperty(L4_522, "FilteredIndex")
  end
  A0_518:setControlProperty(L4_522, "Index", A0_518.work.index)
  return L3_521
end
function EquipWidget.initListBox(A0_523, A1_524)
  local L2_525, L3_526
  L3_526 = A0_523
  L2_525 = A0_523.getListBoxName
  L2_525 = L2_525(L3_526, A1_524)
  if L2_525 ~= "" then
    L3_526 = A0_523.setControlProperty
    L3_526(A0_523, L2_525, "IntData.Value0", A1_524)
    L3_526 = A0_523.setControlCommandCondition
    L3_526(A0_523, L2_525, "UILuaCommands.MouseEnteredItem")
    L3_526 = A0_523.setControlCommandCondition
    L3_526(A0_523, L2_525, "UILuaCommands.AnchoredItem")
    L3_526 = A0_523.setControlCommandCondition
    L3_526(A0_523, L2_525, "UILuaCommands.Selection")
    L3_526 = A0_523.setCancelCondition
    L3_526(A0_523, L2_525)
    L3_526 = A0_523.setVisibility
    L3_526(A0_523, L2_525, true)
    L3_526 = "TextBlock_NoContents_"
    L3_526 = L3_526 .. tostring(A1_524)
    A0_523:setVisibility(L3_526, false)
  end
end
function EquipWidget.resetListBox(A0_527, A1_528)
  local L2_529, L3_530
  L3_530 = A0_527
  L2_529 = A0_527.getListBoxItemNum
  L2_529 = L2_529(L3_530, A1_528)
  L3_530 = A0_527.getListPropertyName
  L3_530 = L3_530(A0_527, A1_528)
  if L2_529 == 0 then
    return
  else
    for _FORV_7_ = 1, L2_529 do
      L2_529 = L2_529 - 1
      A0_527:deleteListProperty(L3_530, L2_529)
    end
    A0_527:updateListProperty(L3_530)
  end
end
function EquipWidget.setItemToXmlLight(A0_531, A1_532, A2_533, A3_534, A4_535)
  local L5_536, L6_537, L7_538, L8_539, L9_540, L10_541, L11_542, L12_543, L13_544, L14_545, L15_546
  L9_540 = worldMaster
  L10_541 = L9_540
  L9_540 = L9_540._getMyPlayer
  L9_540 = L9_540(L10_541)
  L10_541 = nil
  L12_543 = L9_540
  L11_542 = L9_540._getItem
  L13_544 = A3_534
  L14_545 = A4_535
  L11_542 = L11_542(L12_543, L13_544, L14_545)
  L10_541 = L11_542
  if L10_541 == nil then
    L11_542 = false
    return L11_542
  end
  L11_542 = false
  L12_543 = false
  L13_544 = false
  if A3_534 == 1 then
    L15_546 = L10_541
    L14_545 = L10_541.isEquipment
    L14_545 = L14_545(L15_546)
    if L14_545 == true then
      L11_542 = true
      L15_546 = A0_531
      L14_545 = A0_531.isItemMask
      L14_545 = L14_545(L15_546, A4_535)
      if L14_545 then
        L11_542 = false
        L12_543 = true
      end
    end
  else
    L15_546 = L10_541
    L14_545 = L10_541._getCatalogID
    L14_545 = L14_545(L15_546)
    L5_536 = L14_545
    L15_546 = A0_531
    L14_545 = A0_531.setListProperty
    L14_545(L15_546, A1_532, A2_533, "catalog", L5_536)
    L15_546 = L9_540
    L14_545 = L9_540.getStateMainSkill
    L14_545 = L14_545(L15_546)
    L15_546 = L9_540.getMainClassOrJob
    L15_546 = L15_546(L9_540)
    if L5_536 >= 2000201 and L5_536 <= 2000207 then
      L11_542 = true
      if (L5_536 == 2000201 and L14_545 == 3 or L5_536 == 2000202 and L14_545 == 2 or L5_536 == 2000203 and L14_545 == 4 or L5_536 == 2000204 and L14_545 == 8 or L5_536 == 2000205 and L14_545 == 7 or L5_536 == 2000206 and L14_545 == 23 or L5_536 == 2000207 and L14_545 == 22) == false then
        L13_544 = true
      end
    end
  end
  L15_546 = A0_531
  L14_545 = A0_531.setListPropertyVisibility
  L14_545(L15_546, A1_532, A2_533, L11_542)
  if L11_542 or L12_543 then
    L14_545 = desktopWidget
    L15_546 = L14_545
    L14_545 = L14_545.getPlayerItemInPackage
    L7_538, L8_539, L14_545 = A3_534, A4_535, L14_545(L15_546, A3_534, A4_535)
    L7_538, L8_539, L15_546 = A3_534, A4_535, L14_545(L15_546, A3_534, A4_535)
    L6_537 = L15_546
    L5_536 = L14_545
    L15_546 = L10_541
    L14_545 = L10_541._getNameIndex
    L14_545 = L14_545(L15_546)
    L15_546 = "TBL_null"
    if A3_534 == 1 and L10_541:_isEquipping() == true then
      L15_546 = "TBL_equippedItem"
    end
    desktopWidget:setItemToXml(A0_531, A1_532, A2_533, L10_541, L15_546, L5_536, L6_537, L7_538, L8_539, L14_545, A0_531.work.sorttype, false, false, 1, A3_534, A4_535, nil, false)
    if L13_544 then
      A0_531:setListProperty(A1_532, A2_533, "opacity", "0.5")
    else
      A0_531:setListProperty(A1_532, A2_533, "opacity", "1.0")
    end
  end
  L14_545 = true
  return L14_545
end
function EquipWidget.setSortType(A0_547, A1_548, A2_549)
  local L3_550, L4_551
  L3_550 = worldMaster
  L4_551 = L3_550
  L3_550 = L3_550._getMyPlayer
  L3_550 = L3_550(L4_551)
  L4_551 = L3_550._getItem
  L4_551 = L4_551(L3_550, 1, A2_549 + 1)
  if L4_551 == nil then
    return
  end
  desktopWidget:setSortType(A0_547, A1_548, A2_549, A0_547.work.sorttype, L4_551)
end
function EquipWidget.updateSortType(A0_552)
  local L1_553
  L1_553 = A0_552.getListPropertyName
  L1_553 = L1_553(A0_552, 1)
  for _FORV_5_ = 1, A0_552:getListBoxItemNum(1) do
    A0_552:setSortType(L1_553, _FORV_5_ - 1)
  end
  A0_552:updateListProperty(L1_553)
end
function EquipWidget.getEquipItemIndex(A0_554, A1_555)
  local L2_556, L3_557, L4_558, L5_559, L6_560, L7_561
  L3_557 = A0_554
  L2_556 = A0_554.getListBoxItemNum
  L2_556 = L2_556(L3_557, L4_558)
  L3_557 = A0_554.getListPropertyName
  L3_557 = L3_557(L4_558, L5_559)
  for L7_561 = 1, L2_556 do
    if A0_554:isEquippingSub(L7_561, A1_555) == true then
      return L7_561 - 1
    end
  end
  return L4_558
end
function EquipWidget.updateItemEquipStatus(A0_562)
  local L1_563, L2_564, L3_565, L4_566, L5_567, L6_568
  L2_564 = A0_562
  L1_563 = A0_562.getListPropertyName
  L1_563 = L1_563(L2_564, L3_565)
  L2_564 = false
  L6_568 = 1
  for L6_568 = 0, L4_566 - 1 do
    if A0_562:isEquippingSub(L6_568 + 1) == true then
      if L6_568 == A0_562.work.index then
        L2_564 = true
      end
    elseif L6_568 == A0_562.work.index then
      L2_564 = false
    end
  end
  L3_565(L4_566, L5_567)
  if L3_565 == 114 then
    if L3_565 == 2 and L2_564 == false then
      L6_568 = A0_562.work
      L6_568 = L6_568.chosenPackage
      L6_568 = L3_565(L4_566, L5_567, L6_568, A0_562.work.chosenItem)
      A0_562.work.equipStep = 113
      A0_562:maskEquipSlot(113, A0_562:equipSlotNumToSlotName(L3_565), A0_562:equipSlotNumToSlotName(L4_566), A0_562:equipSlotNumToSlotName(L5_567), A0_562:equipSlotNumToSlotName(L6_568))
      A0_562:updateWindowDisplay(true)
    end
  end
end
function EquipWidget.isEquippingSub(A0_569, A1_570, A2_571)
  if worldMaster:_getMyPlayer():_getItem(1, A1_570) == nil then
    return false
  end
  if A2_571 == nil then
    return (worldMaster:_getMyPlayer():_getItem(1, A1_570):_isEquipping())
  elseif worldMaster:_getMyPlayer():_getItem(1, A1_570):_isEquipping() == true then
    if worldMaster:_getMyPlayer():_getItem(1, A1_570):_getEquippingSlot() == A2_571 then
      return true
    else
      return false
    end
  else
    return false
  end
end
function EquipWidget.isItemMask(A0_572, A1_573)
  local L2_574
  L2_574 = false
  if (A0_572.work.equipStep == 103 or A0_572.work.equipStep == 104) and A0_572.work.chosenSlot ~= 0 then
    if desktopWidget:testEquipItemOnSlot(A0_572.work.chosenSlot, 1, A1_573) == false then
      L2_574 = true
    end
  elseif 0 >= A0_572:getItemEquipPoint(nil, 1, A1_573) then
    L2_574 = true
  end
  return L2_574
end
function EquipWidget.updateItemMask(A0_575)
  local L1_576, L2_577, L3_578, L4_579, L5_580, L6_581
  L1_576 = A0_575.getListPropertyName
  L1_576 = L1_576(L2_577, L3_578)
  L5_580 = 1
  for L5_580 = 1, L3_578(L4_579, L5_580) do
    L6_581 = true
    if A0_575:isItemMask(L5_580) then
      L6_581 = false
    end
    A0_575:setListPropertyVisibility(L1_576, L5_580 - 1, L6_581)
  end
  L2_577(L3_578, L4_579)
  if L2_577 > 0 then
    L5_580 = false
    L2_577(L3_578, L4_579, L5_580)
  else
    L5_580 = true
    L2_577(L3_578, L4_579, L5_580)
  end
end
function EquipWidget.makeListFromPackage(A0_582, A1_583, A2_584)
  local L3_585, L4_586, L5_587, L6_588, L7_589, L8_590, L9_591, L10_592, L11_593, L12_594, L13_595, L14_596
  L3_585 = worldMaster
  L4_586 = L3_585
  L3_585 = L3_585._getMyPlayer
  L3_585 = L3_585(L4_586)
  L4_586, L5_587, L6_588, L7_589, L8_590 = nil, nil, nil, nil, nil
  if A2_584 == nil then
    if A1_583 == 1 or A1_583 == nil then
      L4_586 = 0
      L10_592 = A0_582
      L9_591 = A0_582.getListPropertyName
      L9_591 = L9_591(L10_592, L11_593)
      L10_592 = A0_582.getListBoxName
      L10_592 = L10_592(L11_593, L12_594)
      L5_587 = L11_593
      L6_588 = L11_593
      L7_589 = L11_593
      L14_596 = "SourceFirstIndex"
      L11_593(L12_594, L13_595, L14_596, 0)
      L14_596 = "SourceCount"
      L11_593(L12_594, L13_595, L14_596, L6_588)
      L14_596 = "FilteredSortKey"
      L11_593(L12_594, L13_595, L14_596, "sorttype")
      for L14_596 = 1, L6_588 - L7_589 do
        if A0_582:setItemToXmlLight(L9_591, L4_586, 1, L14_596) == true then
          L4_586 = L4_586 + 1
        else
          break
        end
      end
      if L5_587 > L4_586 then
        for L14_596 = L4_586, L5_587 - 1 do
          L5_587 = L5_587 - 1
          A0_582:deleteListProperty(L9_591, L5_587)
        end
      end
      L11_593(L12_594, L13_595)
    end
  else
    L9_591 = nil
    if A1_583 == 1 then
      L9_591 = 1
    else
      return
    end
    L10_592 = A0_582.getListPropertyName
    L10_592 = L10_592(L11_593, L12_594)
    L14_596 = A2_584
    if L11_593 ~= nil then
      L14_596 = A2_584 - 1
      L11_593(L12_594, L13_595, L14_596, A1_583, A2_584)
    else
      L14_596 = L10_592
      L12_594(L13_595, L14_596, L11_593 - 1)
    end
    L11_593(L12_594, L13_595)
  end
  L10_592 = A0_582
  L9_591 = A0_582.displayBagcapacityAndMoney
  L9_591(L10_592)
end
function EquipWidget.updateImportantList(A0_597)
  local L1_598, L2_599, L3_600, L4_601, L5_602, L6_603, L7_604, L8_605, L9_606
  L1_598 = worldMaster
  L2_599 = L1_598
  L1_598 = L1_598._getMyPlayer
  L1_598 = L1_598(L2_599)
  L3_600 = A0_597
  L2_599 = A0_597.getListPropertyName
  L4_601 = 2
  L2_599 = L2_599(L3_600, L4_601)
  L3_600 = 0
  L5_602 = A0_597
  L4_601 = A0_597.getListBoxItemNum
  L4_601 = L4_601(L5_602, L6_603)
  L5_602 = L1_598._getItemPackageCapacity
  L5_602 = L5_602(L6_603, L7_604)
  L9_606 = "SourceFirstIndex"
  L6_603(L7_604, L8_605, L9_606, 0)
  L9_606 = "SourceCount"
  L6_603(L7_604, L8_605, L9_606, L5_602)
  L9_606 = "FilteredSortKey"
  L6_603(L7_604, L8_605, L9_606, "catalog")
  for L9_606 = 1, L5_602 do
    if A0_597:setItemToXmlLight(L2_599, L3_600, 101, L9_606) == true then
      L3_600 = L3_600 + 1
    else
      break
    end
  end
  if L4_601 > L3_600 then
    for L9_606 = L3_600, L4_601 - 1 do
      L4_601 = L4_601 - 1
      A0_597:deleteListProperty(L2_599, L4_601)
    end
  end
  L6_603(L7_604, L8_605)
  if L6_603 > 0 then
    L9_606 = true
    L6_603(L7_604, L8_605, L9_606)
  end
  if L6_603 == 2 then
    if L6_603 >= 121 then
      L6_603(L7_604, L8_605)
    end
  end
end
function EquipWidget.updateImportantOpacity(A0_607)
  local L1_608, L2_609, L3_610, L4_611, L5_612, L6_613, L7_614, L8_615, L9_616, L10_617, L11_618
  L1_608 = worldMaster
  L2_609 = L1_608
  L1_608 = L1_608._getMyPlayer
  L1_608 = L1_608(L2_609)
  L3_610 = A0_607
  L2_609 = A0_607.getListPropertyName
  L4_611 = 2
  L2_609 = L2_609(L3_610, L4_611)
  L4_611 = L1_608
  L3_610 = L1_608.getStateMainSkill
  L3_610 = L3_610(L4_611)
  L5_612 = L1_608
  L4_611 = L1_608.getMainClassOrJob
  L4_611 = L4_611(L5_612)
  L6_613 = L1_608
  L5_612 = L1_608._getItemPackageCapacity
  L7_614 = 101
  L5_612 = L5_612(L6_613, L7_614)
  L7_614 = L1_608
  L6_613 = L1_608._getItemPackageFreeSpace
  L6_613 = L6_613(L7_614, L8_615)
  L7_614 = 0
  for L11_618 = 1, L5_612 - L6_613 do
    if desktopWidget:getPlayerItemInPackage(101, L11_618) >= 2000201 and desktopWidget:getPlayerItemInPackage(101, L11_618) <= 2000207 then
      if not (desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000201 and L3_610 == 3 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000202 and L3_610 == 2 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000203 and L3_610 == 4 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000204 and L3_610 == 8 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000205 and L3_610 == 7 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000206 and L3_610 == 23 or desktopWidget:getPlayerItemInPackage(101, L11_618) == 2000207 and L3_610 == 22) then
        A0_607:setListProperty(L2_609, L11_618 - 1, "opacity", "0.5")
        A0_607:setListProperty(L2_609, L11_618 - 1, "equiped", "Collapsed")
        A0_607:setVisibility("Button_JobStone" .. ":IconControl_JobStoneIcon", false)
      else
        A0_607:setListProperty(L2_609, L11_618 - 1, "opacity", "1.0")
        if L3_610 ~= L4_611 then
          A0_607:setListProperty(L2_609, L11_618 - 1, "equiped", "Visible")
          L7_614 = desktopWidget:getPlayerItemInPackage(101, L11_618)
        else
          A0_607:setListProperty(L2_609, L11_618 - 1, "equiped", "Collapsed")
        end
      end
      A0_607:setListPropertyVisibility(L2_609, L11_618 - 1, true)
    else
      A0_607:setListPropertyVisibility(L2_609, L11_618 - 1, false)
    end
  end
  L8_615(L9_616, L10_617)
  L11_618 = ":IconControl_JobStoneIcon"
  L11_618 = L7_614
  L8_615(L9_616, L10_617, L11_618)
  L11_618 = ":IconControl_JobStoneIcon"
  L11_618 = L7_614 > 0
  L8_615(L9_616, L10_617, L11_618)
  if L8_615 == 121 then
    L8_615(L9_616)
  end
end
function EquipWidget.displaySlotItemHelp(A0_619, A1_620, A2_621)
  local L3_622, L4_623, L5_624, L6_625, L7_626, L8_627
  if A1_620 <= 0 then
    L3_622 = false
    return L3_622
  end
  L4_623 = A0_619
  L3_622 = A0_619.setText
  L5_624 = "TextBlock_Title"
  L6_625 = 215
  L7_626 = A1_620
  L3_622(L4_623, L5_624, L6_625, L7_626)
  L4_623 = A0_619
  L3_622 = A0_619.setColor
  L5_624 = "TextBlock_Title"
  L6_625 = 1
  L7_626 = 1
  L8_627 = 1
  L3_622(L4_623, L5_624, L6_625, L7_626, L8_627)
  L3_622 = A0_619.work
  L3_622 = L3_622.slot
  if L3_622 ~= A1_620 or A2_621 == true then
    L3_622 = A0_619.work
    L3_622.slot = A1_620
    L3_622 = 0
    L4_623 = 0
    L5_624 = worldMaster
    L6_625 = L5_624
    L5_624 = L5_624._getMyPlayer
    L5_624 = L5_624(L6_625)
    L7_626 = L5_624
    L6_625 = L5_624._getEquippingItem
    L8_627 = A1_620
    L6_625 = L6_625(L7_626, L8_627)
    if L6_625 ~= nil then
      if A2_621 == true then
        L7_626 = A0_619.work
        L7_626.listSelectStep = 0
      end
      L8_627 = A0_619
      L7_626 = A0_619.displayFocusedItemHelp
      L7_626(L8_627, L6_625)
      L8_627 = A0_619
      L7_626 = A0_619.getKeyboardFocusedControl
      L7_626 = L7_626(L8_627)
      if L7_626 == "ListBox_TabItem_1" then
        L8_627 = A0_619
        L7_626 = A0_619.getListBoxFocusNum
        L7_626 = L7_626(L8_627, A0_619.work.listbox)
        if L7_626 > 0 then
          L7_626 = A0_619.work
          L7_626.focus = 0
          L8_627 = A0_619
          L7_626 = A0_619.focusToIndex
          L7_626 = L7_626(L8_627, A0_619.work.listbox, A0_619.work.focus)
          if L7_626 >= 0 then
            L8_627 = A0_619.work
            L8_627.index = L7_626
          end
          L8_627 = A0_619.getListBoxName
          L8_627 = L8_627(A0_619, A0_619.work.listbox)
          A0_619:setFocusedIndex(L8_627, A0_619.work.focus)
        end
      end
    else
      L7_626 = A0_619.work
      L7_626.listSelectStep = 0
      L8_627 = A0_619
      L7_626 = A0_619.displayHelp
      L7_626(L8_627, 3603)
      L7_626 = A0_619.work
      L7_626.bonus1 = false
      L7_626 = A0_619.work
      L7_626.bonus2 = false
      L7_626 = A0_619.work
      L7_626.bonus3 = false
      L7_626 = A0_619.work
      L7_626.itemlife = false
      L7_626 = A0_619.work
      L7_626.page = 0
      L8_627 = A0_619
      L7_626 = A0_619.setGridVisibility
      L7_626(L8_627, 6)
    end
  end
end
function EquipWidget.displayHelp(A0_628, A1_629, A2_630)
  A0_628:setText("TextBlock_Help", A1_629, A2_630)
end
function EquipWidget.displayFocusedItemHelp(A0_631, A1_632)
  local L2_633, L3_634, L4_635, L5_636, L6_637, L7_638, L8_639, L9_640, L10_641, L11_642, L12_643, L13_644, L14_645, L15_646, L16_647, L17_648, L18_649, L19_650
  L2_633 = A0_631.work
  L2_633 = L2_633.updatecount
  if L2_633 > 0 then
    L2_633 = false
    return L2_633
  end
  L2_633 = A0_631.work
  L2_633 = L2_633.repairmode
  if L2_633 == true then
    L2_633 = worldMaster
    L3_634 = L2_633
    L2_633 = L2_633._getMyPlayer
    L2_633 = L2_633(L3_634)
    L4_635 = L2_633
    L3_634 = L2_633.getRepairType
    L3_634 = L3_634(L4_635)
    if L3_634 > 0 then
      L5_636 = A0_631
      L4_635 = A0_631.displayHelp
      L6_637 = 3682
      L7_638 = L3_634
      L4_635(L5_636, L6_637, L7_638)
      L5_636 = A0_631
      L4_635 = A0_631.setText
      L6_637 = "TextBlock_Title"
      L7_638 = 3661
      L4_635(L5_636, L6_637, L7_638)
    else
      L5_636 = A0_631
      L4_635 = A0_631.displayHelp
      L6_637 = 3681
      L4_635(L5_636, L6_637)
      L5_636 = A0_631
      L4_635 = A0_631.setText
      L6_637 = "TextBlock_Title"
      L7_638 = 3660
      L4_635(L5_636, L6_637, L7_638)
    end
    L5_636 = A0_631
    L4_635 = A0_631.displayRepairEquipmentCosts
    L6_637 = L3_634
    L4_635(L5_636, L6_637)
    L5_636 = A0_631
    L4_635 = A0_631.displayRepairEquipmentSlotIcon
    L6_637 = L3_634
    L4_635(L5_636, L6_637)
    return
  end
  L3_634 = A0_631
  L2_633 = A0_631.getListBoxFocusNum
  L4_635 = A0_631.work
  L4_635 = L4_635.listbox
  L2_633 = L2_633(L3_634, L4_635)
  if L2_633 == 0 then
    L2_633 = A0_631.work
    L2_633.bonus1 = false
    L2_633 = A0_631.work
    L2_633.bonus2 = false
    L2_633 = A0_631.work
    L2_633.bonus3 = false
    L2_633 = A0_631.work
    L2_633.itemlife = false
    L2_633 = A0_631.work
    L2_633.page = 0
    L3_634 = A0_631
    L2_633 = A0_631.setGridVisibility
    L4_635 = 3
    L2_633(L3_634, L4_635)
    L3_634 = A0_631
    L2_633 = A0_631.setVisibility
    L4_635 = "TextBlock_NoContents_1"
    L5_636 = true
    L2_633(L3_634, L4_635, L5_636)
    L3_634 = A0_631
    L2_633 = A0_631.setColor
    L4_635 = "TextBlock_Title"
    L5_636 = 1
    L6_637 = 1
    L7_638 = 1
    L2_633(L3_634, L4_635, L5_636, L6_637, L7_638)
    return
  end
  L2_633 = 1
  L3_634 = A0_631.work
  L3_634 = L3_634.listbox
  if L3_634 == 2 then
    L2_633 = 101
    L4_635 = A0_631
    L3_634 = A0_631.setHidden
    L5_636 = "Grid_BackpackAndGil"
    L3_634(L4_635, L5_636)
    L4_635 = A0_631
    L3_634 = A0_631.setVisibility
    L5_636 = "Button_SortStatus"
    L6_637 = false
    L3_634(L4_635, L5_636, L6_637)
  else
    L4_635 = A0_631
    L3_634 = A0_631.setVisibility
    L5_636 = "Grid_BackpackAndGil"
    L6_637 = true
    L3_634(L4_635, L5_636, L6_637)
    L4_635 = A0_631
    L3_634 = A0_631.setVisibility
    L5_636 = "Button_SortStatus"
    L6_637 = true
    L3_634(L4_635, L5_636, L6_637)
  end
  L3_634 = A0_631.work
  L3_634 = L3_634.index
  L3_634 = L3_634 + 1
  L4_635 = worldMaster
  L5_636 = L4_635
  L4_635 = L4_635._getMyPlayer
  L4_635 = L4_635(L5_636)
  L5_636 = nil
  L7_638 = L4_635
  L6_637 = L4_635._getItem
  L8_639 = L2_633
  L9_640 = L3_634
  L6_637 = L6_637(L7_638, L8_639, L9_640)
  L5_636 = L6_637
  if A1_632 ~= nil then
    L5_636 = A1_632
  end
  L7_638 = A0_631
  L6_637 = A0_631.getListPropertyName
  L8_639 = A0_631.work
  L8_639 = L8_639.listbox
  L6_637 = L6_637(L7_638, L8_639)
  L7_638 = 0
  L8_639 = 0
  L9_640 = 0
  L10_641 = 0
  L11_642 = 0
  if L2_633 == 1 then
    L13_644 = A0_631
    L12_643 = A0_631.getItemEquipPoint
    L14_645 = L5_636
    L15_646 = L2_633
    L16_647 = L3_634
    L16_647 = L12_643(L13_644, L14_645, L15_646, L16_647)
    L11_642 = L16_647
    L10_641 = L15_646
    L9_640 = L14_645
    L8_639 = L13_644
    L7_638 = L12_643
    if L11_642 ~= 0 then
      L13_644 = A0_631
      L12_643 = A0_631.setText
      L14_645 = "TextBlock_Title"
      L15_646 = 215
      L16_647 = L11_642
      L12_643(L13_644, L14_645, L15_646, L16_647)
    else
      if L10_641 > 0 then
        L13_644 = A0_631
        L12_643 = A0_631.setText
        L14_645 = "TextBlock_Title"
        L15_646 = 215
        L16_647 = L7_638
        L12_643(L13_644, L14_645, L15_646, L16_647)
      elseif L8_639 > 0 then
        L13_644 = A0_631
        L12_643 = A0_631.setText
        L14_645 = "TextBlock_Title"
        L15_646 = 215
        L16_647 = L7_638
        L12_643(L13_644, L14_645, L15_646, L16_647)
      elseif L7_638 > 0 then
        L13_644 = A0_631
        L12_643 = A0_631.setText
        L14_645 = "TextBlock_Title"
        L15_646 = 215
        L16_647 = L7_638
        L12_643(L13_644, L14_645, L15_646, L16_647)
      end
      if L7_638 == 22 and L10_641 == 25 then
        L13_644 = A0_631
        L12_643 = A0_631.setText
        L14_645 = "TextBlock_Title"
        L15_646 = 3612
        L12_643(L13_644, L14_645, L15_646)
      end
    end
  end
  L12_643 = 1
  L13_644 = A0_631.work
  L13_644 = L13_644.equipStep
  if L13_644 ~= 103 then
    L13_644 = A0_631.work
    L13_644 = L13_644.equipStep
  elseif L13_644 == 104 then
    L13_644 = A0_631.work
    L13_644 = L13_644.chosenSlot
    if L13_644 ~= L7_638 then
      L13_644 = A0_631.work
      L13_644 = L13_644.chosenSlot
      if L13_644 ~= L8_639 then
        L13_644 = A0_631.work
        L13_644 = L13_644.chosenSlot
        if L13_644 ~= L9_640 then
          L13_644 = A0_631.work
          L13_644 = L13_644.chosenSlot
          if L13_644 ~= L10_641 then
            L12_643 = 0.5
          end
        end
      end
    end
  end
  if L2_633 == 1 then
    L14_645 = A0_631
    L13_644 = A0_631.setColor
    L15_646 = "TextBlock_Title"
    L16_647 = L12_643
    L17_648 = L12_643
    L18_649 = L12_643
    L13_644(L14_645, L15_646, L16_647, L17_648, L18_649)
  end
  L13_644 = -1
  L14_645 = nil
  L15_646 = A0_631.work
  L15_646 = L15_646.equipStep
  if L15_646 ~= 103 then
    L15_646 = A0_631.work
    L15_646 = L15_646.equipStep
  else
    if L15_646 == 104 then
      L16_647 = A0_631
      L15_646 = A0_631.getEquipItemIndex
      L17_648 = A0_631.work
      L17_648 = L17_648.chosenSlot
      L15_646 = L15_646(L16_647, L17_648)
      L13_644 = L15_646
  end
  else
    L15_646 = A0_631.work
    L15_646 = L15_646.equipStep
    if L15_646 ~= 111 then
      L15_646 = A0_631.work
      L15_646 = L15_646.equipStep
    else
      if L15_646 == 112 then
        if L11_642 ~= 0 then
          L16_647 = A0_631
          L15_646 = A0_631.getEquipItemIndex
          L17_648 = L11_642
          L15_646 = L15_646(L16_647, L17_648)
          L13_644 = L15_646
        else
          L16_647 = A0_631
          L15_646 = A0_631.getEquipItemIndex
          L17_648 = L7_638
          L15_646 = L15_646(L16_647, L17_648)
          L13_644 = L15_646
        end
    end
    else
      L15_646 = A0_631.work
      L15_646 = L15_646.equipStep
      if L15_646 ~= 113 then
        L15_646 = A0_631.work
        L15_646 = L15_646.equipStep
      elseif L15_646 == 114 then
        L15_646 = A0_631.work
        L15_646 = L15_646.chosenItem
        L13_644 = L15_646 - 1
        L15_646 = A0_631.work
        L15_646 = L15_646.focusedSlot
        if L15_646 ~= 0 then
          L13_644 = -1
          L16_647 = L4_635
          L15_646 = L4_635._getEquippingItem
          L17_648 = A0_631.work
          L17_648 = L17_648.focusedSlot
          L15_646 = L15_646(L16_647, L17_648)
          if L15_646 ~= nil then
            L14_645 = L15_646
          end
        end
      end
    end
  end
  if L13_644 ~= -1 and L14_645 == nil then
    L16_647 = L4_635
    L15_646 = L4_635._getItem
    L17_648 = 1
    L18_649 = L13_644 + 1
    L15_646 = L15_646(L16_647, L17_648, L18_649)
    L14_645 = L15_646
  elseif A1_632 ~= nil then
    L15_646 = A0_631.work
    L15_646 = L15_646.equipStep
    if L15_646 == 101 then
      L14_645 = A1_632
    end
  end
  L15_646 = desktopWidget
  L16_647 = L15_646
  L15_646 = L15_646.setItemDetail
  L17_648 = A0_631
  L18_649 = L5_636
  L19_650 = L6_637
  L15_646(L16_647, L17_648, L18_649, L19_650, A0_631.work.index)
  L15_646 = A0_631.work
  L15_646.bazaar = false
  L15_646 = desktopWidget
  L16_647 = L15_646
  L15_646 = L15_646.setItemDetailEquip
  L17_648 = A0_631
  L18_649 = L5_636
  L19_650 = L6_637
  L18_649 = L15_646(L16_647, L17_648, L18_649, L19_650, A0_631.work.index, L14_645)
  L19_650 = A0_631.work
  L19_650.bonus1 = L15_646
  L19_650 = A0_631.work
  L19_650.bonus2 = L16_647
  L19_650 = A0_631.work
  L19_650.bonus3 = L17_648
  L19_650 = A0_631.work
  L19_650.itemlife = L18_649
  L19_650 = A0_631.updateWindowDisplay
  L19_650(A0_631, false)
  if L18_649 then
    L19_650 = L5_636.getRepairAmount
    L19_650 = L19_650(L5_636)
    A0_631:setText("TextBlock_RepairCostGil", 3263, L19_650)
    A0_631:setVisibility("Grid_RepairCost", true)
  else
    L19_650 = A0_631.setVisibility
    L19_650(A0_631, "Grid_RepairCost", false)
  end
  L19_650 = A0_631.work
  L19_650 = L19_650.listbox
  if L19_650 == 2 then
    L19_650 = A0_631.work
    L19_650 = L19_650.equipStep
    if L19_650 >= 121 then
      L19_650 = A0_631.getListProperty
      L19_650 = L19_650(A0_631, L6_637, A0_631.work.index, "equiped")
      A0_631:setVisibility("IconControl_Equiped", L19_650 == "Visible")
    end
  end
  L19_650 = true
  return L19_650
end
function EquipWidget.isOperateButtonEnable(A0_651, A1_652, A2_653)
  if A0_651:getListBoxFocusNum(A1_652) == 0 then
    return false
  end
  return true
end
function EquipWidget.equipItemFromSlot(A0_654)
  local L1_655
  if worldMaster:_getMyPlayer():_getItem(A0_654.work.chosenPackage, A0_654.work.chosenItem) == worldMaster:_getMyPlayer():_getEquippingItem(A0_654.work.selectParts) then
    L1_655 = A0_654:processEquipItem(A0_654.work.selectParts, 0, 0)
  else
    L1_655 = A0_654:processEquipItem(A0_654.work.selectParts, A0_654.work.chosenPackage, A0_654.work.chosenItem)
  end
  if L1_655 == true then
    A0_654.work.equipStep = 111
    A0_654:maskEquipSlot(111)
    A0_654:updateWindowDisplay(true)
  end
  return L1_655
end
function EquipWidget.equipItemFromList(A0_656)
  local L1_657
  if A0_656:getItemEquipPoint(nil, A0_656.work.chosenPackage, A0_656.work.chosenItem) ~= 0 then
    L1_657 = A0_656:processEquipItem(A0_656.work.chosenSlot, 0, 0)
  else
    L1_657 = A0_656:processEquipItem(A0_656.work.chosenSlot, A0_656.work.chosenPackage, A0_656.work.chosenItem)
  end
  A0_656.work.equipStep = 101
  A0_656:maskEquipSlot(101)
  A0_656:setWindowFocus(A0_656:equipSlotNumToSlotName(A0_656.work.chosenSlot))
  A0_656:selectedBorder()
  A0_656:updateItemMask()
  return L1_657
end
function EquipWidget.removeEquipItem(A0_658, A1_659)
  local L2_660
  A0_658.work.equipStep = 114
  A0_658:selectedBorder(A0_658.work.index, true)
  A0_658:maskEquipSlot(114, A0_658:equipSlotNumToSlotName(A1_659))
  A0_658:updateWindowDisplay(true)
  A0_658:selectedBorder()
  L2_660 = A0_658:processEquipItem(A1_659, 0, 0)
  A0_658.work.equipStep = 111
  A0_658:maskEquipSlot(111)
  A0_658.work.listSelectStep = 1
  A0_658:updateWindowDisplay(true)
  A0_658:updateItemMask()
  return L2_660
end
function EquipWidget.cancelFromSlotSelectItem(A0_661)
  A0_661.work.equipStep = 101
  A0_661:maskEquipSlot(101)
  A0_661.work.chosenSlot = 0
  A0_661:updateItemMask()
end
function EquipWidget.cancelFromSlotSelectItemOnListBox(A0_662)
  local L1_663, L2_664
  L1_663 = A0_662.work
  L1_663.equipStep = 101
  L2_664 = A0_662
  L1_663 = A0_662.updateItemMask
  L1_663(L2_664)
  L2_664 = A0_662
  L1_663 = A0_662.getListBoxFocusNum
  L1_663 = L1_663(L2_664, 1)
  if L1_663 > 0 then
    L1_663 = A0_662.work
    L1_663.focus = 0
    L2_664 = A0_662
    L1_663 = A0_662.focusToIndex
    L1_663 = L1_663(L2_664, 1, A0_662.work.focus)
    if L1_663 >= 0 then
      L2_664 = A0_662.work
      L2_664.index = L1_663
    end
    L2_664 = A0_662.getListBoxName
    L2_664 = L2_664(A0_662, 1)
    A0_662:setFocusedIndex(L2_664, A0_662.work.focus)
    A0_662:setWindowFocus(L2_664)
  end
  L2_664 = A0_662
  L1_663 = A0_662.maskEquipSlot
  L1_663(L2_664, 101)
  L2_664 = A0_662
  L1_663 = A0_662.setWindowFocus
  L1_663(L2_664, A0_662:equipSlotNumToSlotName(A0_662.work.chosenSlot))
  L2_664 = A0_662
  L1_663 = A0_662.displaySlotItemHelp
  L1_663(L2_664, A0_662.work.chosenSlot, true)
  L1_663 = A0_662.work
  L1_663.chosenSlot = 0
end
function EquipWidget.cancelFormListSelectSlot(A0_665)
  A0_665.work.equipStep = 111
  A0_665.work.listSelectStep = 1
  A0_665:maskEquipSlot(111)
  A0_665:selectedBorder()
  A0_665:updateWindowDisplay(true)
end
function EquipWidget.selectedBorder(A0_666, A1_667, A2_668)
  local L3_669, L4_670
  L3_669 = A0_666.work
  L3_669 = L3_669.equipStep
  if not (L3_669 >= 121) then
    L3_669 = A0_666.work
    L3_669 = L3_669.listbox
    if L3_669 ~= 2 then
      L3_669 = A0_666.getControlProperty
      L3_669 = L3_669(L4_670, "Grid_JobStoneList", "Visibility")
    end
  elseif L3_669 == "Visible" then
    return
  end
  L3_669 = A0_666.getListPropertyName
  L3_669 = L3_669(L4_670, 1)
  if A1_667 ~= nil then
    if A1_667 < A0_666:getListBoxItemNum(1) then
      A0_666:setListProperty(L3_669, A1_667, "selected", L4_670)
      A0_666.work.selected = A0_666.work.index
    end
  elseif L4_670 == -1 then
    return L4_670
  else
    for _FORV_7_ = 1, A0_666:getListBoxItemNum(1) do
      A0_666:setListProperty(L3_669, _FORV_7_ - 1, "selected", "Collapsed")
    end
    L4_670.selected = -1
  end
  L4_670(A0_666, L3_669)
end
function EquipWidget.openItemList(A0_671, A1_672)
  if A1_672 > 0 then
    A0_671.work.chosenSlot = A1_672
    A0_671:setText("TextBlock_Title", 215, A0_671.work.chosenSlot)
  end
  A0_671.work.chosenPackage = 0
  A0_671.work.chosenItem = 0
  A0_671.work.listbox = 1
  A0_671.work.focus = 0
  A0_671.work.index = 0
  A0_671:updateItemMask()
  if A1_672 > 0 and A0_671.work.equipStep == 103 then
    if A0_671:getEquipItemIndex(A1_672) > -1 then
      A0_671.work.index = A0_671:getEquipItemIndex(A1_672)
      A0_671.work.focus = A0_671:indexToFocus(A0_671.work.listbox, A0_671.work.index)
    end
    A0_671.work.listSelectStep = 1
  else
    A0_671.work.listSelectStep = 1
    if 0 <= A0_671:focusToIndex(A0_671.work.focus) then
      A0_671.work.index = A0_671:focusToIndex(A0_671.work.focus)
    end
  end
  A0_671:updateWindowDisplay(true)
end
function EquipWidget.updatePlayerItem(A0_673, A1_674, A2_675)
  local L3_676, L4_677, L5_678, L6_679
  L3_676 = -1
  if A1_674 == 0 then
    L4_677 = A0_673.work
    L4_677.updatecount = A2_675
    return
  elseif A1_674 == 1 then
    L5_678 = A0_673
    L4_677 = A0_673.makeListFromPackage
    L6_679 = A1_674
    L4_677(L5_678, L6_679, A2_675)
    L3_676 = 1
  elseif A1_674 == 101 then
    L3_676 = 2
  end
  L4_677 = A0_673.work
  L4_677 = L4_677.updatecount
  if L4_677 > 0 then
    L4_677 = A0_673.work
    L5_678 = A0_673.work
    L5_678 = L5_678.updatecount
    L5_678 = L5_678 - 1
    L4_677.updatecount = L5_678
  end
  L4_677 = A0_673.work
  L4_677 = L4_677.updatecount
  if L4_677 == 0 then
    if A1_674 == 1 or A1_674 == 100 then
      L4_677 = A0_673.work
      L5_678 = A0_673.work
      L6_679 = A0_673.work
      L4_677.darkMatterI, L5_678.darkMatterII, L6_679.darkMatterIII, A0_673.work.darkMatterIV, A0_673.work.darkMatterV = A0_673:countDarkMattersInBag()
      L5_678 = A0_673
      L4_677 = A0_673.getChildWidgetByWindowName
      L6_679 = "RepairEquipmentDialogWidget"
      L4_677 = L4_677(L5_678, L6_679)
      L5_678 = worldMaster
      L6_679 = L5_678
      L5_678 = L5_678._getMyPlayer
      L5_678 = L5_678(L6_679)
      L6_679 = L5_678.getRepairType
      L6_679 = L6_679(L5_678)
      if L4_677 ~= nil then
        A0_673:countDarkMatterAndCostForRepair(L4_677:getDialogResult())
        A0_673:displayRepairEquipmentCosts(L4_677:getDialogResult())
      else
        A0_673:countDarkMatterAndCostForRepair(L6_679)
        if A0_673:getControlProperty("Grid_RepairEquipment", "Visibility") == "Visible" then
          A0_673:displayRepairEquipmentCosts(L6_679)
        end
      end
    end
    if L3_676 == 1 then
      L5_678 = A0_673
      L4_677 = A0_673.getListPropertyName
      L6_679 = 1
      L4_677 = L4_677(L5_678, L6_679)
      L5_678 = worldMaster
      L6_679 = L5_678
      L5_678 = L5_678._getMyPlayer
      L5_678 = L5_678(L6_679)
      L6_679 = L5_678.getRepairType
      L6_679 = L6_679(L5_678)
      if L6_679 > 0 then
      end
      A0_673:updateListProperty(L4_677)
      A0_673:updateItemMask()
      A0_673:updateEquipItem()
    elseif L3_676 == 2 then
      L5_678 = A0_673
      L4_677 = A0_673.updateImportantList
      L4_677(L5_678)
      L5_678 = A0_673
      L4_677 = A0_673.updateImportantOpacity
      L4_677(L5_678)
    end
    L5_678 = A0_673
    L4_677 = A0_673.displayBagcapacityAndMoney
    L4_677(L5_678)
    L4_677 = A0_673.work
    L4_677 = L4_677.listSelectStep
    if L4_677 >= 1 then
      L5_678 = A0_673
      L4_677 = A0_673.updateWindowDisplay
      L4_677(L5_678)
    end
  end
  return
end
function EquipWidget.getItemEquipPoint(A0_680, A1_681, A2_682, A3_683)
  local L4_684, L5_685, L6_686, L7_687, L8_688, L9_689, L10_690, L11_691, L12_692, L13_693, L14_694
  L4_684 = 0
  L5_685 = 0
  L6_686 = 0
  L7_687 = 0
  L8_688 = 0
  L9_689 = worldMaster
  L10_690 = L9_689
  L9_689 = L9_689._getMyPlayer
  L9_689 = L9_689(L10_690)
  L10_690 = A1_681
  if L10_690 == nil then
    L14_694 = A3_683
    L10_690 = L11_691
  end
  if L10_690 ~= nil then
    if L11_691 == true then
      if L11_691 then
        L8_688 = L11_691
      end
      for L14_694 = 1, 27 do
        if desktopWidget:testEquipItemOnSlot(L14_694, A2_682, A3_683) == true then
          if L4_684 == 0 then
            L4_684 = L14_694
          elseif L5_685 == 0 then
            L5_685 = L14_694
          elseif L6_686 == 0 then
            L6_686 = L14_694
          else
            L7_687 = L14_694
          end
        end
      end
    end
  end
  L14_694 = L7_687
  return L11_691, L12_692, L13_693, L14_694, L8_688
end
function EquipWidget.syncItemWork(A0_695, A1_696)
  local L2_697, L3_698, L4_699, L5_700, L6_701, L7_702, L8_703
  L2_697 = worldMaster
  L3_698 = L2_697
  L2_697 = L2_697._getMyPlayer
  L2_697 = L2_697(L3_698)
  L4_699 = L2_697
  L3_698 = L2_697._getItemPackageCapacity
  L3_698 = L3_698(L4_699, L5_700)
  L4_699 = L2_697._getItemPackageFreeSpace
  L4_699 = L4_699(L5_700, L6_701)
  for L8_703 = 1, L3_698 - L4_699 do
    if A0_695:checkPackageAndIndex(A1_696, 1, L8_703) == true then
      A0_695:makeListFromPackage(1, L8_703)
      A0_695:updateListProperty(A0_695:getListPropertyName(1))
      if 1 <= A0_695.work.listSelectStep then
        A0_695:updateWindowDisplay()
      end
      A0_695:updateEquipItem()
      break
    end
  end
end
function EquipWidget.checkPackageAndIndex(A0_704, A1_705, A2_706, A3_707, A4_708)
  if A4_708 == nil or A4_708 == 1 then
    if worldMaster:_getMyPlayer():_getItem(A2_706, A3_707) == A1_705 then
      return true
    else
      return false
    end
  elseif A4_708 == 2 then
    if desktopWidget:getBazaarItem(A2_706, A3_707) == A1_705 then
      return true
    else
      return false
    end
  end
end
function EquipWidget.checkJobChange(A0_709, A1_710)
  local L2_711, L3_712, L4_713, L5_714, L6_715, L7_716, L8_717, L9_718, L10_719, L11_720, L12_721
  L2_711 = worldMaster
  L3_712 = L2_711
  L2_711 = L2_711._getMyPlayer
  L2_711 = L2_711(L3_712)
  L4_713 = L2_711
  L3_712 = L2_711._getItem
  L5_714 = 101
  L6_715 = A1_710
  L3_712 = L3_712(L4_713, L5_714, L6_715)
  if L3_712 == nil then
    return
  end
  L5_714 = L3_712
  L4_713 = L3_712._getCatalogID
  L4_713 = L4_713(L5_714)
  L6_715 = L2_711
  L5_714 = L2_711.getStateMainSkill
  L5_714 = L5_714(L6_715)
  L7_716 = L2_711
  L6_715 = L2_711.getMainClassOrJob
  L6_715 = L6_715(L7_716)
  L7_716 = L4_713 == 2000201 and L5_714 == 3 or L4_713 == 2000202 and L5_714 == 2 or L4_713 == 2000203 and L5_714 == 4 or L4_713 == 2000204 and L5_714 == 8 or L4_713 == 2000205 and L5_714 == 7 or L4_713 == 2000206 and L5_714 == 23 or L4_713 == 2000207 and L5_714 == 22
  if L7_716 then
    L8_717 = false
    if L5_714 == L6_715 then
      L12_721 = 1
      L8_717 = L9_718
    else
      L12_721 = 2
      L8_717 = L9_718
    end
    if L8_717 then
      if not L9_718 then
        L9_718(L10_719, L11_720)
        L9_718(L10_719, L11_720)
        L9_718(L10_719)
      end
    end
  else
    L8_717 = nil
    for L12_721 = 15, 27 do
      if L2_711:getJobItemId(L12_721) == L4_713 then
        L8_717 = L12_721
        break
      end
    end
    if L5_714 == L6_715 then
      L12_721 = worldMaster
      L10_719(L11_720, L12_721, 30748, L5_714, L8_717, L9_718)
    else
      L12_721 = worldMaster
      L10_719(L11_720, L12_721, 30749, L6_715, L8_717, L9_718)
    end
  end
end
function EquipWidget.jobstoneSlotFocused(A0_722)
  local L1_723, L2_724, L3_725, L4_726, L5_727, L6_728, L7_729, L8_730, L9_731, L10_732
  L1_723 = A0_722.work
  L1_723 = L1_723.equipStep
  if L1_723 == 122 then
    L2_724 = A0_722
    L1_723 = A0_722.maskEquipSlotForJob
    L3_725 = false
    L1_723(L2_724, L3_725)
  else
    L2_724 = A0_722
    L1_723 = A0_722.maskEquipSlotForJob
    L3_725 = true
    L1_723(L2_724, L3_725)
  end
  L1_723 = A0_722.work
  L1_723.equipStep = 121
  L1_723 = A0_722.work
  L1_723.slot = 0
  L1_723 = A0_722.work
  L1_723.focusedSlot = 0
  L1_723 = A0_722.work
  L1_723.chosenSlot = 0
  L1_723 = A0_722.work
  L1_723.repairmode = false
  L2_724 = A0_722
  L1_723 = A0_722.setHidden
  L3_725 = "Grid_BackpackAndGil"
  L1_723(L2_724, L3_725)
  L2_724 = A0_722
  L1_723 = A0_722.setVisibility
  L3_725 = "Grid_ItemList"
  L4_726 = false
  L1_723(L2_724, L3_725, L4_726)
  L2_724 = A0_722
  L1_723 = A0_722.setVisibility
  L3_725 = "Grid_JobStoneList"
  L4_726 = true
  L1_723(L2_724, L3_725, L4_726)
  L1_723 = worldMaster
  L2_724 = L1_723
  L1_723 = L1_723._getMyPlayer
  L1_723 = L1_723(L2_724)
  L3_725 = L1_723
  L2_724 = L1_723.getStateMainSkill
  L2_724 = L2_724(L3_725)
  L4_726 = L1_723
  L3_725 = L1_723.getMainClassOrJob
  L3_725 = L3_725(L4_726)
  L4_726 = 3688
  if L2_724 > 28 then
    L4_726 = 3690
  else
    L6_728 = L1_723
    L5_727 = L1_723.hasItem
    L5_727 = L5_727(L6_728, L7_729, L8_730)
    if not L5_727 or L2_724 ~= 3 then
      L6_728 = L1_723
      L5_727 = L1_723.hasItem
      L5_727 = L5_727(L6_728, L7_729, L8_730)
      if not L5_727 or L2_724 ~= 2 then
        L6_728 = L1_723
        L5_727 = L1_723.hasItem
        L5_727 = L5_727(L6_728, L7_729, L8_730)
        if not L5_727 or L2_724 ~= 4 then
          L6_728 = L1_723
          L5_727 = L1_723.hasItem
          L5_727 = L5_727(L6_728, L7_729, L8_730)
          if not L5_727 or L2_724 ~= 8 then
            L6_728 = L1_723
            L5_727 = L1_723.hasItem
            L5_727 = L5_727(L6_728, L7_729, L8_730)
            if not L5_727 or L2_724 ~= 7 then
              L6_728 = L1_723
              L5_727 = L1_723.hasItem
              L5_727 = L5_727(L6_728, L7_729, L8_730)
              if not L5_727 or L2_724 ~= 23 then
                L6_728 = L1_723
                L5_727 = L1_723.hasItem
                L5_727 = L5_727(L6_728, L7_729, L8_730)
              end
            end
          end
        end
      end
    else
      if L5_727 and L2_724 == 22 then
        L4_726 = 3688
    end
    else
      L4_726 = 3689
    end
  end
  if L2_724 ~= L3_725 then
    L5_727 = A0_722.work
    L5_727.listbox = 2
    L5_727 = A0_722.work
    L5_727.index = 0
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = L1_723
    L5_727 = L1_723.getJobItemId
    L5_727 = L5_727(L6_728, L7_729)
    L6_728 = A0_722.getListPropertyName
    L6_728 = L6_728(L7_729, L8_730)
    L10_732 = 2
    for L10_732 = 0, L8_730 - 1 do
      if A0_722:getListProperty(L6_728, L10_732, "catalog") == L5_727 then
        A0_722.work.index = L10_732
        break
      end
    end
    L7_729(L8_730)
    L10_732 = false
    L7_729(L8_730, L9_731, L10_732)
  else
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
    L6_728 = A0_722
    L5_727 = A0_722.setVisibility
    L5_727(L6_728, L7_729, L8_730)
  end
  L6_728 = A0_722
  L5_727 = A0_722.setText
  L5_727(L6_728, L7_729, L8_730)
  L6_728 = A0_722
  L5_727 = A0_722.displayHelp
  L5_727(L6_728, L7_729, L8_730)
end
function EquipWidget.countDarkMattersInBag(A0_733)
  local L1_734, L2_735, L3_736, L4_737, L5_738, L6_739, L7_740, L8_741, L9_742, L10_743, L11_744, L12_745, L13_746
  L1_734 = worldMaster
  L2_735 = L1_734
  L1_734 = L1_734._getMyPlayer
  L1_734 = L1_734(L2_735)
  L2_735, L3_736 = nil, nil
  L5_738 = L1_734
  L4_737 = L1_734._getItemPackageCapacity
  L6_739 = 1
  L4_737 = L4_737(L5_738, L6_739)
  L2_735 = L4_737
  L5_738 = L1_734
  L4_737 = L1_734._getItemPackageFreeSpace
  L6_739 = 1
  L4_737 = L4_737(L5_738, L6_739)
  L3_736 = L4_737
  L4_737 = 0
  L5_738 = 0
  L6_739 = 0
  L7_740 = 0
  L8_741 = 0
  for L12_745 = 1, L2_735 - L3_736 do
    L13_746 = desktopWidget
    L13_746 = L13_746.getPlayerItemInPackage
    L13_746 = L13_746(L13_746, 1, L12_745)
    if L13_746 == 10013001 then
      L4_737 = L4_737 + L13_746(L13_746, 1, L12_745)
      break
    else
    end
    if L13_746 == 10013002 then
      L5_738 = L5_738 + L13_746(L13_746, 1, L12_745)
      break
    else
    end
    if L13_746 == 10013003 then
      L6_739 = L6_739 + L13_746(L13_746, 1, L12_745)
      break
    else
    end
    if L13_746 == 10013004 then
      L7_740 = L7_740 + L13_746(L13_746, 1, L12_745)
      break
    else
    end
    if L13_746 == 10013005 then
      L8_741 = L8_741 + L13_746(L13_746, 1, L12_745)
      break
    else
    end
  end
  L12_745 = L7_740
  L13_746 = L8_741
  return L9_742, L10_743, L11_744, L12_745, L13_746
end
function EquipWidget.countDarkMatterAndCostForRepair(A0_747, A1_748)
  A0_747.work.repairDarkMatterI = 0
  A0_747.work.repairDarkMatterII = 0
  A0_747.work.repairDarkMatterIII = 0
  A0_747.work.repairDarkMatterIV = 0
  A0_747.work.repairDarkMatterV = 0
  A0_747.work.repairDarkMatterImin = 99
  A0_747.work.repairDarkMatterIImin = 99
  A0_747.work.repairDarkMatterIIImin = 99
  A0_747.work.repairDarkMatterIVmin = 99
  A0_747.work.repairDarkMatterVmin = 99
  A0_747.work.repairCost = 0
  A0_747.work.repairCostmin = 999999999
  if A1_748 == 1 or A1_748 == 3 then
    A0_747:getEquipItemDarkMattersForRepair(1)
    A0_747:getEquipItemDarkMattersForRepair(2)
  end
  if A1_748 == 2 or A1_748 == 3 then
    A0_747:getEquipItemDarkMattersForRepair(9)
    A0_747:getEquipItemDarkMattersForRepair(11)
    A0_747:getEquipItemDarkMattersForRepair(14)
    A0_747:getEquipItemDarkMattersForRepair(13)
    A0_747:getEquipItemDarkMattersForRepair(15)
    A0_747:getEquipItemDarkMattersForRepair(17)
    A0_747:getEquipItemDarkMattersForRepair(16)
    A0_747:getEquipItemDarkMattersForRepair(18)
    A0_747:getEquipItemDarkMattersForRepair(20)
    A0_747:getEquipItemDarkMattersForRepair(22)
    A0_747:getEquipItemDarkMattersForRepair(23)
  end
  if A0_747.work.repairDarkMatterImin == 99 then
    A0_747.work.repairDarkMatterImin = 0
  end
  if A0_747.work.repairDarkMatterIImin == 99 then
    A0_747.work.repairDarkMatterIImin = 0
  end
  if A0_747.work.repairDarkMatterIIImin == 99 then
    A0_747.work.repairDarkMatterIIImin = 0
  end
  if A0_747.work.repairDarkMatterIVmin == 99 then
    A0_747.work.repairDarkMatterIVmin = 0
  end
  if A0_747.work.repairDarkMatterVmin == 99 then
    A0_747.work.repairDarkMatterVmin = 0
  end
  if A0_747.work.repairCostmin == 999999999 then
    A0_747.work.repairCostmin = 0
  end
end
function EquipWidget.getEquipItemDarkMattersForRepair(A0_749, A1_750)
  local L2_751, L3_752, L4_753
  L2_751 = worldMaster
  L3_752 = L2_751
  L2_751 = L2_751._getMyPlayer
  L2_751 = L2_751(L3_752)
  L4_753 = L2_751
  L3_752 = L2_751._getEquippingItem
  L3_752 = L3_752(L4_753, A1_750)
  if L3_752 ~= nil then
    L4_753 = L3_752.getItemRepairItem
    L4_753 = L4_753(L3_752)
    if A0_749:checkEquipItemLifeForRepair(A1_750) then
      if L4_753 == 10013001 then
        A0_749.work.repairDarkMatterI = A0_749.work.repairDarkMatterI + L3_752:getItemRepairItemNum()
        if L3_752:getItemRepairItemNum() < A0_749.work.repairDarkMatterImin then
          A0_749.work.repairDarkMatterImin = L3_752:getItemRepairItemNum()
          do break end
          else
          end
          if L4_753 == 10013002 then
            A0_749.work.repairDarkMatterII = A0_749.work.repairDarkMatterII + L3_752:getItemRepairItemNum()
            if L3_752:getItemRepairItemNum() < A0_749.work.repairDarkMatterIImin then
              A0_749.work.repairDarkMatterIImin = L3_752:getItemRepairItemNum()
              do break end
              else
              end
              if L4_753 == 10013003 then
                A0_749.work.repairDarkMatterIII = A0_749.work.repairDarkMatterIII + L3_752:getItemRepairItemNum()
                if L3_752:getItemRepairItemNum() < A0_749.work.repairDarkMatterIIImin then
                  A0_749.work.repairDarkMatterIIImin = L3_752:getItemRepairItemNum()
                  do break end
                  else
                  end
                  if L4_753 == 10013004 then
                    A0_749.work.repairDarkMatterIV = A0_749.work.repairDarkMatterIV + L3_752:getItemRepairItemNum()
                    if L3_752:getItemRepairItemNum() < A0_749.work.repairDarkMatterIVmin then
                      A0_749.work.repairDarkMatterIVmin = L3_752:getItemRepairItemNum()
                      do break end
                      else
                      end
                      if L4_753 == 10013005 then
                        A0_749.work.repairDarkMatterV = A0_749.work.repairDarkMatterV + L3_752:getItemRepairItemNum()
                        if L3_752:getItemRepairItemNum() < A0_749.work.repairDarkMatterVmin then
                          A0_749.work.repairDarkMatterVmin = L3_752:getItemRepairItemNum()
                        end
                      else
                      end
                    else
                    end
                else
                end
            else
            end
        else
        end
      A0_749.work.repairCost = A0_749.work.repairCost + L3_752:getRepairAmount()
      if L3_752:getRepairAmount() < A0_749.work.repairCostmin then
        A0_749.work.repairCostmin = L3_752:getRepairAmount()
      end
    end
  end
end
function EquipWidget.maskRepairEquipmentSlot(A0_754, A1_755)
  if A1_755 == nil then
    A0_754:cancelFromSlotSelectItem()
    return
  end
  A0_754:maskSlot("Button_LargePouch", false)
  A0_754:maskSlot("Button_SmallPouch", false)
  A0_754:maskSlot("Button_ThrowingWeapon", false)
  A0_754:maskSlot("Button_Undershirt", false)
  A0_754:maskSlot("Button_Undergarment", false)
  if A1_755 == 0 then
    A0_754:maskSlot("Button_PrimaryArm", false)
    A0_754:maskSlot("Button_SecondaryArm", false)
    A0_754:maskSlot("Button_Head", false)
    A0_754:maskSlot("Button_Body", false)
    A0_754:maskSlot("Button_Hands", false)
    A0_754:maskSlot("Button_Waist", false)
    A0_754:maskSlot("Button_Legs", false)
    A0_754:maskSlot("Button_Feet", false)
    A0_754:maskSlot("Button_Accessories_RightEar", false)
    A0_754:maskSlot("Button_Accessories_Neck", false)
    A0_754:maskSlot("Button_Accessories_RightFinger_1", false)
    A0_754:maskSlot("Button_Accessories_RightBracelet", false)
    A0_754:maskSlot("Button_Accessories_LeftFinger_1", false)
  end
  if A1_755 == 1 or A1_755 == 3 then
    A0_754:getEquipItemDarkMattersForRepair(1)
    A0_754:getEquipItemDarkMattersForRepair(2)
    A0_754:maskSlot("Button_PrimaryArm", true)
    A0_754:maskSlot("Button_SecondaryArm", true)
    if A1_755 == 1 then
      A0_754:maskSlot("Button_Head", false)
      A0_754:maskSlot("Button_Body", false)
      A0_754:maskSlot("Button_Hands", false)
      A0_754:maskSlot("Button_Waist", false)
      A0_754:maskSlot("Button_Legs", false)
      A0_754:maskSlot("Button_Feet", false)
      A0_754:maskSlot("Button_Accessories_RightEar", false)
      A0_754:maskSlot("Button_Accessories_Neck", false)
      A0_754:maskSlot("Button_Accessories_RightFinger_1", false)
      A0_754:maskSlot("Button_Accessories_RightBracelet", false)
      A0_754:maskSlot("Button_Accessories_LeftFinger_1", false)
    end
  end
  if A1_755 == 2 or A1_755 == 3 then
    A0_754:getEquipItemDarkMattersForRepair(9)
    A0_754:getEquipItemDarkMattersForRepair(11)
    A0_754:getEquipItemDarkMattersForRepair(14)
    A0_754:getEquipItemDarkMattersForRepair(13)
    A0_754:getEquipItemDarkMattersForRepair(15)
    A0_754:getEquipItemDarkMattersForRepair(17)
    A0_754:getEquipItemDarkMattersForRepair(16)
    A0_754:getEquipItemDarkMattersForRepair(18)
    A0_754:getEquipItemDarkMattersForRepair(20)
    A0_754:getEquipItemDarkMattersForRepair(22)
    A0_754:getEquipItemDarkMattersForRepair(23)
    A0_754:maskSlot("Button_Head", true)
    A0_754:maskSlot("Button_Body", true)
    A0_754:maskSlot("Button_Hands", true)
    A0_754:maskSlot("Button_Waist", true)
    A0_754:maskSlot("Button_Legs", true)
    A0_754:maskSlot("Button_Feet", true)
    A0_754:maskSlot("Button_Accessories_RightEar", true)
    A0_754:maskSlot("Button_Accessories_Neck", true)
    A0_754:maskSlot("Button_Accessories_RightFinger_1", true)
    A0_754:maskSlot("Button_Accessories_RightBracelet", true)
    A0_754:maskSlot("Button_Accessories_LeftFinger_1", true)
    if A1_755 == 2 then
      A0_754:maskSlot("Button_PrimaryArm", false)
      A0_754:maskSlot("Button_SecondaryArm", false)
    end
  end
end
function EquipWidget.displayRepairEquipmentSlotIcon(A0_756, A1_757)
  local L2_758, L3_759
  L2_758 = A1_757 == 1 or A1_757 == 3
  L3_759 = A1_757 == 2 or A1_757 == 3
  A0_756:displayRepairIcon("Button_LargePouch", false)
  A0_756:displayRepairIcon("Button_SmallPouch", false)
  A0_756:displayRepairIcon("Button_ThrowingWeapon", false)
  A0_756:displayRepairIcon("Button_Undershirt", false)
  A0_756:displayRepairIcon("Button_Undergarment", false)
  A0_756:displayRepairIcon("Button_PrimaryArm", L2_758)
  A0_756:displayRepairIcon("Button_SecondaryArm", L2_758)
  A0_756:displayRepairIcon("Button_Head", L3_759)
  A0_756:displayRepairIcon("Button_Body", L3_759)
  A0_756:displayRepairIcon("Button_Hands", L3_759)
  A0_756:displayRepairIcon("Button_Waist", L3_759)
  A0_756:displayRepairIcon("Button_Legs", L3_759)
  A0_756:displayRepairIcon("Button_Feet", L3_759)
  A0_756:displayRepairIcon("Button_Accessories_RightEar", L3_759)
  A0_756:displayRepairIcon("Button_Accessories_Neck", L3_759)
  A0_756:displayRepairIcon("Button_Accessories_RightFinger_1", L3_759)
  A0_756:displayRepairIcon("Button_Accessories_RightBracelet", L3_759)
  A0_756:displayRepairIcon("Button_Accessories_LeftFinger_1", L3_759)
end
function EquipWidget.displayRepairIcon(A0_760, A1_761, A2_762)
  local L3_763, L4_764
  L3_763 = worldMaster
  L4_764 = L3_763
  L3_763 = L3_763._getMyPlayer
  L3_763 = L3_763(L4_764)
  L4_764 = A0_760.slotNameToEquipSlotNum
  L4_764 = L4_764(A0_760, A1_761)
  A0_760:setVisibility(A1_761 .. ":IconControl_Repair", A2_762)
  if L3_763:_getEquippingItem(L4_764) == nil then
    A0_760:setColor(A1_761 .. ":IconControl_Repair", 0.5, 0.5, 0.5)
  elseif L3_763:_getEquippingItem(L4_764):getItemLife() == L3_763:_getEquippingItem(L4_764):getItemLifeMax() then
    A0_760:setColor(A1_761 .. ":IconControl_Repair", 0.5, 0.5, 0.5)
  else
    A0_760:setColor(A1_761 .. ":IconControl_Repair", 1, 1, 1)
  end
end
function EquipWidget.displayRepairEquipmentCosts(A0_765, A1_766)
  local L2_767, L3_768, L4_769, L5_770
  L3_768 = worldMaster
  L4_769 = L3_768
  L3_768 = L3_768._getMyPlayer
  L3_768 = L3_768(L4_769)
  if A1_766 == nil then
    L5_770 = L3_768
    L4_769 = L3_768.getRepairType
    L4_769 = L4_769(L5_770)
    L2_767 = L4_769
  else
    L2_767 = A1_766
  end
  L5_770 = A0_765
  L4_769 = A0_765.countDarkMatterAndCostForRepair
  L4_769(L5_770, L2_767)
  L5_770 = A0_765
  L4_769 = A0_765.setRepairEquipmentCostsText
  L4_769(L5_770, 1, A0_765.work.repairDarkMatterI, A0_765.work.repairDarkMatterImin, A0_765.work.darkMatterI)
  L5_770 = A0_765
  L4_769 = A0_765.setRepairEquipmentCostsText
  L4_769(L5_770, 2, A0_765.work.repairDarkMatterII, A0_765.work.repairDarkMatterIImin, A0_765.work.darkMatterII)
  L5_770 = A0_765
  L4_769 = A0_765.setRepairEquipmentCostsText
  L4_769(L5_770, 3, A0_765.work.repairDarkMatterIII, A0_765.work.repairDarkMatterIIImin, A0_765.work.darkMatterIII)
  L5_770 = A0_765
  L4_769 = A0_765.setRepairEquipmentCostsText
  L4_769(L5_770, 4, A0_765.work.repairDarkMatterIV, A0_765.work.repairDarkMatterIVmin, A0_765.work.darkMatterIV)
  L5_770 = A0_765
  L4_769 = A0_765.setRepairEquipmentCostsText
  L4_769(L5_770, 5, A0_765.work.repairDarkMatterV, A0_765.work.repairDarkMatterVmin, A0_765.work.darkMatterV)
  L4_769 = ""
  L5_770 = L3_768.getMoneyOnHand
  L5_770 = L5_770(L3_768)
  if L5_770 >= A0_765.work.repairCost then
    L4_769 = "TBL_basis_moneyBackground_green"
  elseif L5_770 >= A0_765.work.repairCostmin then
    L4_769 = "TBL_basis_moneyBackground_yellow"
  else
    L4_769 = "TBL_basis_moneyBackground_red"
  end
  A0_765:setText("TextBlock_RepairEquipCost", 225, A0_765.work.repairCost)
  A0_765:setText("TextBlock_CurrentMoney", 225, L5_770)
  A0_765:setStyle("TextBlock_CurrentMoney", L4_769)
  A0_765:setVisibility("Grid_RepairEquipment", L2_767 ~= 0)
  A0_765:setVisibility("Grid_Help", true)
  A0_765:setVisibility("Grid_ItemList", false)
  A0_765:setVisibility("Grid_ItemNameBase", false)
  A0_765:setVisibility("Grid_ItemDetail1", false)
  A0_765:setVisibility("Grid_ItemDetail2", false)
  A0_765:setVisibility("Grid_ItemDetail3", false)
  A0_765:setVisibility("Grid_ItemLife", false)
  A0_765:setVisibility("Button_SortStatus", false)
end
function EquipWidget.setRepairEquipmentCostsText(A0_771, A1_772, A2_773, A3_774, A4_775)
  local L5_776
  L5_776 = ""
  if A2_773 <= A4_775 then
    L5_776 = "TBL_parameterPlus"
  elseif A3_774 <= A4_775 then
    L5_776 = "TBL_parameterCaution"
  else
    L5_776 = "TBL_parameterMinus"
  end
  if A2_773 == 0 then
    A0_771:setEnable("Grid_Item_" .. tostring(A1_772), false)
  else
    A0_771:setEnable("Grid_Item_" .. tostring(A1_772), true)
  end
  A0_771:setText("TextBlock_ItemNumber" .. "_" .. tostring(A1_772), 3189, A2_773)
  A0_771:setText("TextBlock_ItemInBag" .. "_" .. tostring(A1_772), 225, A4_775)
  A0_771:setStyle("TextBlock_ItemInBag" .. "_" .. tostring(A1_772), L5_776)
end
function EquipWidget.checkItemLife(A0_777, A1_778)
  local L2_779
  L2_779 = false
  if A1_778 == 1 or A1_778 == 3 then
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(1)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(2)
  end
  if A1_778 == 2 or A1_778 == 3 then
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(9)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(11)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(14)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(13)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(15)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(17)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(16)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(18)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(20)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(22)
    L2_779 = L2_779 or A0_777:checkEquipItemLifeForRepair(23)
  end
  return L2_779
end
function EquipWidget.checkEquipItemLifeForRepair(A0_780, A1_781)
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_781) == nil then
    return false
  end
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_781):isRepairable() == false then
    return false
  end
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_781):getItemLife() == worldMaster:_getMyPlayer():_getEquippingItem(A1_781):getItemLifeMax() then
    return false
  end
  return true
end
function EquipWidget.setDialogResult(A0_782, A1_783)
  local L2_784, L3_785, L4_786
  L2_784 = worldMaster
  L3_785 = L2_784
  L2_784 = L2_784._getMyPlayer
  L2_784 = L2_784(L3_785)
  L4_786 = L2_784
  L3_785 = L2_784.getRepairType
  L3_785 = L3_785(L4_786)
  L4_786 = nil
  if desktopWidget:isMacroCommandPlaying() then
    A0_782:displayRepairEquipmentCosts(L3_785)
    A0_782:displayRepairEquipmentSlotIcon(L3_785)
    return
  end
  if A1_783 < 0 then
    if A0_782.work.repaircommandtime + 1 > worldMaster:_getServerTime() then
      L3_785 = A0_782.work.lastresult
    end
    A0_782:displayRepairEquipmentCosts(L3_785)
    A0_782:displayRepairEquipmentSlotIcon(L3_785)
    return
  elseif A1_783 == 0 then
    L4_786 = desktopWidget:executePlayerCommand(24243, A1_783)
  else
    L4_786 = desktopWidget:executePlayerCommand(24243, A1_783)
  end
  A0_782.work.repaircommandtime = worldMaster:_getServerTime()
  A0_782.work.lastresult = A1_783
  if L4_786 ~= nil then
    if L4_786 == true then
      if A1_783 > 0 then
        A0_782:countDarkMatterAndCostForRepair(A1_783)
        if A0_782:checkItemLife(A1_783) == false then
          A0_782:displayRepairEquipmentCosts(L3_785)
          A0_782:displayRepairEquipmentSlotIcon(L3_785)
          A0_782.work.lastresult = L3_785
        elseif (0 < A0_782.work.repairDarkMatterImin and A0_782.work.repairDarkMatterImin <= A0_782.work.darkMatterI or 0 < A0_782.work.repairDarkMatterIImin and A0_782.work.repairDarkMatterIImin <= A0_782.work.darkMatterII or 0 < A0_782.work.repairDarkMatterIIImin and A0_782.work.repairDarkMatterIIImin <= A0_782.work.darkMatterIII or 0 < A0_782.work.repairDarkMatterIVmin and A0_782.work.repairDarkMatterIVmin <= A0_782.work.darkMatterIV or 0 < A0_782.work.repairDarkMatterVmin and A0_782.work.repairDarkMatterVmin <= A0_782.work.darkMatterV) and A0_782.work.repairCostmin <= L2_784:getMoneyOnHand() then
          A0_782:displayHelp(3682, A1_783)
          A0_782:setContent("Button_RepairEquipment", 3661)
          A0_782:setHelpParameter("Button_RepairEquipment", 1, 75215)
          A0_782:setText("TextBlock_Title", 3661)
          A0_782:setVisibility("Grid_RepairEquipment", true)
          A0_782:displayRepairEquipmentCosts(A1_783)
          A0_782:displayRepairEquipmentSlotIcon(A1_783)
        else
          A0_782:displayRepairEquipmentCosts(L3_785)
          A0_782:displayRepairEquipmentSlotIcon(L3_785)
          A0_782.work.lastresult = L3_785
        end
      else
        A0_782:displayHelp(3681)
        A0_782:setContent("Button_RepairEquipment", 3660)
        A0_782:setHelpParameter("Button_RepairEquipment", 1, 75214)
        A0_782:setText("TextBlock_Title", 3660)
        A0_782:setVisibility("Grid_RepairEquipment", false)
        A0_782:displayRepairEquipmentCosts(A1_783)
        A0_782:displayRepairEquipmentSlotIcon(A1_783)
      end
    else
      A0_782:displayRepairEquipmentCosts(L3_785)
      A0_782:displayRepairEquipmentSlotIcon(L3_785)
      A0_782.work.lastresult = L3_785
    end
  end
end
function EquipWidget.equipedJobOnly(A0_787)
  local L1_788, L2_789, L3_790, L4_791
  for L4_791 = 1, 27 do
    if A0_787:isJobOnly(L4_791) then
      return true
    end
  end
  return L1_788
end
function EquipWidget.isJobOnly(A0_792, A1_793)
  local L2_794
  L2_794 = false
  if worldMaster:_getMyPlayer():_getEquippingItem(A1_793) ~= nil and worldMaster:_getMyPlayer():_getEquippingItem(A1_793):getItemCompatibilityKey() >= 2119 and worldMaster:_getMyPlayer():_getEquippingItem(A1_793):getItemCompatibilityKey() <= 2129 then
    L2_794 = true
  end
  return L2_794
end
function EquipWidget.displaySortType(A0_795, A1_796)
  desktopWidget:displaySortType(A1_796, A0_795, "Button_SortStatus")
end
function EquipWidget.changeSortType(A0_797)
  A0_797.work.sorttype = desktopWidget:changeSortType(A0_797.work.sorttype)
end
function EquipWidget.saveSortType(A0_798)
  desktopWidget:saveSortType(A0_798.work.sorttype)
end
