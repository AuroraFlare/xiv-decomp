require("/Widget/Ask/AskBaseClass")
_defineClass("AetheryteListWidget", "AskBaseClass")
function AetheryteListWidget.initAsk(A0_0)
  A0_0.work._temp = {
    {"mode", "integer8"},
    {
      "regionIndex",
      "integer8"
    }
  }
  A0_0:setControlCommandCondition("ListBox_AetheryteList_RegionSelection", "UILuaCommands.SelectionChanged")
  A0_0:setControlCommandCondition("ListBox_AetheryteList", "UILuaCommands.SelectionChanged")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0.work.mode = 0
  A0_0.work.regionIndex = 0
  A0_0:createRegionList()
end
function AetheryteListWidget.processUICommandClose(A0_1, A1_2, A2_3, A3_4, A4_5)
  A0_1:setBaseAskResult(-1)
end
function AetheryteListWidget.processUICommandSelectionChanged(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12
  L5_11 = A2_8
  if L5_11 == "ListBox_AetheryteList_RegionSelection" then
    L6_12 = A0_6.work
    L6_12.regionIndex = A3_9
    L6_12 = A0_6.setBaseAskResult
    L6_12(A0_6, A3_9 + 1)
    break
  else
  end
  if L5_11 == "ListBox_AetheryteList" then
    L6_12 = A0_6.getListPropertyIndex
    L6_12 = L6_12(A0_6, "ListBox", A3_9)
    if A0_6:getListProperty("ListBox", L6_12, "AetheryteID") ~= 0 then
      A0_6:setBaseAskResult(A3_9 + 1)
      break
    else
    end
  else
  end
end
function AetheryteListWidget.setAskParameter(A0_13, A1_14, A2_15, ...)
  if A1_14 == 0 then
    A0_13:setText("TextBlock_AnimaValue", tostring(A2_15))
    A0_13:setVisibility("ListBox_AetheryteList_RegionSelection", true)
    A0_13:setVisibility("ListBox_AetheryteList", false)
    A0_13:setFocusedIndex("ListBox_AetheryteList_RegionSelection", A0_13.work.regionIndex)
  else
    A0_13:createAetheryteList(A2_15, ...)
    A0_13:setVisibility("ListBox_AetheryteList", true)
    A0_13:setVisibility("ListBox_AetheryteList_RegionSelection", false)
  end
  A0_13.work.mode = A1_14
end
function AetheryteListWidget.getAskResult(A0_17)
  if A0_17:getBaseAskResult() == -1 then
    return nil
  end
  return (A0_17:getBaseAskResult())
end
function AetheryteListWidget.createRegionList(A0_18)
  A0_18:setVisibility("ListBox_AetheryteList_RegionSelection", false)
  A0_18:addRegionListItem(0, 101)
  A0_18:addRegionListItem(1, 102)
  A0_18:addRegionListItem(2, 103)
  A0_18:addRegionListItem(3, 104)
  A0_18:addRegionListItem(4, 105)
  A0_18:setListText("RegionList", 5, "RegionName", 10307)
  A0_18:setListProperty("RegionList", 5, "RegionID", -1)
  A0_18:updateListProperty("RegionList")
end
function AetheryteListWidget.addRegionListItem(A0_19, A1_20, A2_21)
  A0_19:setListText("RegionList", A1_20, "RegionName", 5201, A2_21)
  A0_19:setListProperty("RegionList", A1_20, "RegionID", A2_21)
end
function AetheryteListWidget.createAetheryteList(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27, A6_28, A7_29, A8_30, A9_31, A10_32, A11_33, A12_34, A13_35, A14_36)
  local L15_37
  L15_37 = A0_22.setVisibility
  L15_37(A0_22, "ListBox_AetheryteList", false)
  L15_37 = A0_22.deleteListPropertyAll
  L15_37(A0_22, "ListBox")
  L15_37 = 0
  L15_37 = A0_22:addListItem(L15_37, A1_23, A2_24, 211, A1_23)
  L15_37 = A0_22:addListItem(L15_37, A3_25, A4_26, 211, A3_25)
  L15_37 = A0_22:addListItem(L15_37, A5_27, A6_28, 211, A5_27)
  L15_37 = A0_22:addListItem(L15_37, A7_29, A8_30, 211, A7_29)
  L15_37 = A0_22:addListItem(L15_37, A9_31, A10_32, 211, A9_31)
  L15_37 = A0_22:addListItem(L15_37, A11_33, A12_34, 211, A11_33)
  L15_37 = A0_22:addListItem(L15_37, A13_35, A14_36, 211, A13_35)
  if L15_37 == 0 then
    A0_22:addListItem(0, 0, 0, 10304)
  end
  A0_22:updateListProperty("ListBox")
end
function AetheryteListWidget.addListItem(A0_38, A1_39, A2_40, A3_41, A4_42, ...)
  if A2_40 == nil then
    return A1_39
  end
  A0_38:setListText("ListBox", A1_39, "AetheryteName", A4_42, ...)
  A0_38:setListProperty("ListBox", A1_39, "AetheryteID", A2_40)
  A0_38:setListProperty("ListBox", A1_39, "Cost", A3_41)
  if A2_40 == 0 then
    A0_38:setListProperty("ListBox", A1_39, "CostVisibility", false)
  end
  return A1_39 + 1
end
