require("/Widget/WidgetBaseClass")
_defineClass("LogColorSettingWidget", "WidgetBaseClass")
function LogColorSettingWidget.init(A0_0)
  A0_0.work._temp = {
    {"listIndex", "integer32"},
    {"colorID", "integer8"}
  }
  A0_0:setConfirmCondition("Button_AllClear")
  A0_0:setControlCommandCondition("ListBox_LogColorSettingItems", "UILuaCommands.SelectionChanged")
  A0_0:setCancelCondition()
  A0_0:setCloseCondition()
  A0_0:setModal(true)
  desktopWidget:setLogAutoHideEnable(false)
  A0_0:createList()
  A0_0:initChildWidget("LogColorListWidget", false)
end
function LogColorSettingWidget.processClosing(A0_1)
  desktopWidget:setLogAutoHideEnable(true)
end
function LogColorSettingWidget.processUICommandOperate(A0_2, A1_3, A2_4, A3_5, A4_6)
  desktopWidget:openChildWidget("CommonAskWidget", A0_2, true, nil, 1347, 2, 1348, 1349)
end
function LogColorSettingWidget.processUICommandSelectionChanged(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12, L6_13, L7_14
  L6_13 = A0_7
  L5_12 = A0_7.getListPropertyIndex
  L7_14 = "ListBox"
  L5_12 = L5_12(L6_13, L7_14, A3_10)
  if L5_12 < 0 then
    return
  end
  L6_13 = A0_7.work
  L7_14 = A0_7.getListProperty
  L7_14 = L7_14(A0_7, "ListBox", L5_12, "ColorID")
  L6_13.colorID = L7_14
  L6_13 = A0_7.work
  L6_13.listIndex = L5_12
  L7_14 = A0_7
  L6_13 = A0_7.getListProperty
  L6_13 = L6_13(L7_14, "ListBox", L5_12, "ItemName")
  L7_14 = nil
  if L5_12 == 0 then
    L7_14 = 78002
    break
  else
  end
  if L5_12 == 1 then
    L7_14 = 78003
    break
  else
  end
  if L5_12 == 2 then
    L7_14 = 78004
    break
  else
  end
  if L5_12 == 3 then
    L7_14 = 78005
    break
  else
  end
  if L5_12 == 4 then
    L7_14 = 78006
    break
  else
  end
  if L5_12 == 5 then
    L7_14 = 78007
    break
  else
  end
  if L5_12 == 6 then
    L7_14 = 78008
    break
  else
  end
  if L5_12 == 7 then
    L7_14 = 78009
    break
  else
  end
  if L5_12 == 8 then
    L7_14 = 78010
    break
  else
  end
  if L5_12 == 9 then
    L7_14 = 78011
    break
  else
  end
  if L5_12 == 10 then
    L7_14 = 78012
    break
  else
  end
  if L5_12 == 11 then
    L7_14 = 78013
    break
  else
  end
  A0_7:getChildWidgetByWindowName("LogColorListWidget"):setListIndex(L6_13, L7_14, A0_7:getColorIndex(A0_7.work.colorID))
  A0_7:getChildWidgetByWindowName("LogColorListWidget"):show()
end
function LogColorSettingWidget.createList(A0_15)
  A0_15:addListItem(0, 1)
  A0_15:addListItem(1, 2)
  A0_15:addListItem(2, 3)
  A0_15:addListItem(3, 4)
  A0_15:addListItem(4, 5)
  A0_15:addListItem(5, 6)
  A0_15:addListItem(6, 7)
  A0_15:addListItem(7, 8)
  A0_15:addListItem(8, 9)
  A0_15:addListItem(9, 10)
  A0_15:addListItem(10, 11)
  A0_15:addListItem(11, 12)
  A0_15:updateListProperty("ListBox")
end
function LogColorSettingWidget.addListItem(A0_16, A1_17, A2_18)
  A0_16:setColorListText(A1_17)
  A0_16:setListProperty("ListBox", A1_17, "ColorID", A2_18)
end
function LogColorSettingWidget.setColorListText(A0_19, A1_20)
  local L2_21, L3_22
  if A1_20 == 0 then
    L2_21 = 2227
    L3_22 = 77902
    break
  else
  end
  if A1_20 == 1 then
    L2_21 = 2228
    L3_22 = 77903
    break
  else
  end
  if A1_20 == 2 then
    L2_21 = 2229
    L3_22 = 77904
    break
  else
  end
  if A1_20 == 3 then
    L2_21 = 2230
    L3_22 = 77905
    break
  else
  end
  if A1_20 == 4 then
    L2_21 = 2231
    L3_22 = 77906
    break
  else
  end
  if A1_20 == 5 then
    L2_21 = 2232
    L3_22 = 77907
    break
  else
  end
  if A1_20 == 6 then
    L2_21 = 2233
    L3_22 = 77908
    break
  else
  end
  if A1_20 == 7 then
    L2_21 = 2234
    L3_22 = 77909
    break
  else
  end
  if A1_20 == 8 then
    L2_21 = 2235
    L3_22 = 77910
    break
  else
  end
  if A1_20 == 9 then
    L2_21 = 2236
    L3_22 = 77911
    break
  else
  end
  if A1_20 == 10 then
    L2_21 = 2237
    L3_22 = 77912
    break
  else
  end
  if A1_20 == 11 then
    L2_21 = 2238
    L3_22 = 77913
    break
  else
  end
  do return end
  A0_19:setListText("ListBox", A1_20, "ItemName", L2_21)
  A0_19:setListProperty("ListBox", A1_20, "Help", L3_22)
end
function LogColorSettingWidget.setLogColor(A0_23, A1_24, A2_25)
  local L3_26, L4_27
  L4_27 = A0_23
  L3_26 = A0_23.getColorString
  L3_26 = L3_26(L4_27, A1_24)
  if L3_26 == nil then
    return
  end
  L4_27 = tonumber
  L4_27 = L4_27(L3_26, 16)
  desktopWidget:_setUserConfig(2, A2_25, L4_27)
end
function LogColorSettingWidget.setDefaultColor(A0_28)
  local L1_29, L2_30, L3_31, L4_32, L5_33
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = A0_28.setLogColor
  L1_29(L2_30, L3_31, L4_32)
  L1_29 = desktopWidget
  L1_29 = L1_29.updateLogColor
  L1_29(L2_30)
  L1_29 = A0_28.getListPropertyCount
  L1_29 = L1_29(L2_30, L3_31)
  for L5_33 = 0, L1_29 - 1 do
    A0_28:setColorListText(L5_33)
  end
  L2_30(L3_31, L4_32)
end
function LogColorSettingWidget.updateColor(A0_34, A1_35)
  A0_34:setLogColor(A1_35, A0_34.work.colorID)
  desktopWidget:updateLogColor()
  A0_34:setColorListText(A0_34.work.listIndex)
  A0_34:updateListProperty("ListBox")
end
function LogColorSettingWidget.getColorString(A0_36, A1_37)
  local L2_38, L3_39
  L3_39 = A1_37
  if L3_39 == 1 then
    L2_38 = "ffffff"
    break
  else
  end
  if L3_39 == 2 then
    L2_38 = "cccccc"
    break
  else
  end
  if L3_39 == 3 then
    L2_38 = "a6a6a6"
    break
  else
  end
  if L3_39 == 4 then
    L2_38 = "ff4c4c"
    break
  else
  end
  if L3_39 == 5 then
    L2_38 = "4cff4c"
    break
  else
  end
  if L3_39 == 6 then
    L2_38 = "ffff4c"
    break
  else
  end
  if L3_39 == 7 then
    L2_38 = "ff8cc6"
    break
  else
  end
  if L3_39 == 8 then
    L2_38 = "cc709e"
    break
  else
  end
  if L3_39 == 9 then
    L2_38 = "a65b80"
    break
  else
  end
  if L3_39 == 10 then
    L2_38 = "ff7f7f"
    break
  else
  end
  if L3_39 == 11 then
    L2_38 = "cc6666"
    break
  else
  end
  if L3_39 == 12 then
    L2_38 = "a65353"
    break
  else
  end
  if L3_39 == 13 then
    L2_38 = "ffde73"
    break
  else
  end
  if L3_39 == 14 then
    L2_38 = "ccb25c"
    break
  else
  end
  if L3_39 == 15 then
    L2_38 = "a6904b"
    break
  else
  end
  if L3_39 == 16 then
    L2_38 = "ffa666"
    break
  else
  end
  if L3_39 == 17 then
    L2_38 = "cc8552"
    break
  else
  end
  if L3_39 == 18 then
    L2_38 = "a66c42"
    break
  else
  end
  if L3_39 == 19 then
    L2_38 = "d4ff7f"
    break
  else
  end
  if L3_39 == 20 then
    L2_38 = "aacc66"
    break
  else
  end
  if L3_39 == 21 then
    L2_38 = "8aa653"
    break
  else
  end
  if L3_39 == 22 then
    L2_38 = "80ff7f"
    break
  else
  end
  if L3_39 == 23 then
    L2_38 = "66cc66"
    break
  else
  end
  if L3_39 == 24 then
    L2_38 = "53a653"
    break
  else
  end
  if L3_39 == 25 then
    L2_38 = "66e6ff"
    break
  else
  end
  if L3_39 == 26 then
    L2_38 = "52b8cc"
    break
  else
  end
  if L3_39 == 27 then
    L2_38 = "4295a6"
    break
  else
  end
  if L3_39 == 28 then
    L2_38 = "4c88ff"
    break
  else
  end
  if L3_39 == 29 then
    L2_38 = "3d6dcc"
    break
  else
  end
  if L3_39 == 30 then
    L2_38 = "3258a6"
    break
  else
  end
  if L3_39 == 31 then
    L2_38 = "8c8cff"
    break
  else
  end
  if L3_39 == 32 then
    L2_38 = "7070cc"
    break
  else
  end
  if L3_39 == 33 then
    L2_38 = "5b5ba6"
    break
  else
  end
  if L3_39 == 34 then
    L2_38 = "b38cff"
    break
  else
  end
  if L3_39 == 35 then
    L2_38 = "8f70cc"
    break
  else
  end
  if L3_39 == 36 then
    L2_38 = "745ba6"
    do break end
    break
  else
  end
  return L2_38
end
function LogColorSettingWidget.getColorIndex(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  L2_42 = 1
  L3_43 = desktopWidget
  L3_43 = L3_43._getUserConfig
  L3_43 = L3_43(L4_44, L5_45, L6_46)
  for L7_47 = 1, 36 do
    if tonumber(A0_40:getColorString(L7_47), 16) == L3_43 then
      L2_42 = L7_47
      break
    end
  end
  return L2_42
end
function LogColorSettingWidget.processAskResult(A0_48, A1_49)
  if A1_49 == 1 then
    A0_48:setDefaultColor()
  end
end
