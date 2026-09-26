require("/Widget/WidgetBaseClass")
_defineClass("UserMacroIconListWidget", "WidgetBaseClass")
function UserMacroIconListWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L4_4 = "pageIndex"
  L5_5 = "integer8"
  L4_4 = {L5_5, "integer8"}
  L5_5 = "iconIndex"
  L1_1._temp = L2_2
  for L4_4 = 1, 25 do
    L5_5 = "Button_Icon_"
    L5_5 = L5_5 .. tostring(L4_4)
    A0_0:setConfirmCondition(L5_5)
    A0_0:setCommandParameter(L5_5, L4_4)
  end
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2, L3_3)
  L1_1(L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L1_1.pageIndex = 1
  L1_1.iconIndex = 1
  L4_4 = tostring
  L5_5 = 12
  L5_5 = L4_4(L5_5)
  L1_1(L2_2, L3_3, L4_4, L5_5, L4_4(L5_5))
  L4_4 = "/"
  L1_1(L2_2, L3_3, L4_4)
  L1_1(L2_2)
end
function UserMacroIconListWidget.processUICommandOperate(A0_6, A1_7, A2_8, A3_9, A4_10)
  local L5_11, L6_12, L7_13, L8_14
  L5_11 = false
  L6_12 = A2_8
  if L6_12 == "Button_Close" then
    L8_14 = A0_6
    L7_13 = A0_6.hide
    L7_13(L8_14)
    return
  else
  end
  if L6_12 == "Button_Left" then
    L7_13 = A0_6.work
    L7_13 = L7_13.pageIndex
    if L7_13 > 1 then
      L7_13 = A0_6.work
      L8_14 = A0_6.work
      L8_14 = L8_14.pageIndex
      L8_14 = L8_14 - 1
      L7_13.pageIndex = L8_14
    else
      L7_13 = A0_6.work
      L7_13.pageIndex = 12
    end
    L5_11 = true
    break
  else
  end
  if L6_12 == "Button_Right" then
    L7_13 = A0_6.work
    L7_13 = L7_13.pageIndex
    if L7_13 < 12 then
      L7_13 = A0_6.work
      L8_14 = A0_6.work
      L8_14 = L8_14.pageIndex
      L8_14 = L8_14 + 1
      L7_13.pageIndex = L8_14
    else
      L7_13 = A0_6.work
      L7_13.pageIndex = 1
    end
    L5_11 = true
    break
  else
  end
  if A3_9 ~= nil then
    L8_14 = A0_6
    L7_13 = A0_6._getParentWidget
    L7_13 = L7_13(L8_14)
    L8_14 = A0_6.work
    L8_14 = L8_14.pageIndex
    L8_14 = L8_14 - 1
    L8_14 = L8_14 * 25
    L8_14 = L8_14 + A3_9
    L8_14 = L8_14 - 1
    L7_13:setMacroIcon(L8_14)
    A0_6:hide()
    return
  else
  end
  if L5_11 == true then
    L7_13 = A0_6
    L6_12 = A0_6.updatePageNum
    L6_12(L7_13)
  end
end
function UserMacroIconListWidget.processUICommandClose(A0_15, A1_16, A2_17, A3_18, A4_19)
  A0_15:hide()
end
function UserMacroIconListWidget.updatePageNum(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26
  L1_21 = A0_20.setText
  L5_25 = A0_20.work
  L5_25 = L5_25.pageIndex
  L6_26 = L4_24(L5_25)
  L1_21(L2_22, L3_23, L4_24, L5_25, L6_26, L4_24(L5_25))
  L1_21 = A0_20.work
  L1_21 = L1_21.pageIndex
  L1_21 = L1_21 - 1
  L1_21 = L1_21 * 25
  for L5_25 = 1, 25 do
    L6_26 = "Button_Icon_"
    L6_26 = L6_26 .. tostring(L5_25) .. ":IconControl_Icon"
    if L1_21 == 0 then
      A0_20:setIcon(L6_26, 0)
      A0_20:setVisibility(L6_26, false)
    else
      A0_20:setIcon(L6_26, L1_21 + 41001 - 1)
      A0_20:setVisibility(L6_26, true)
    end
    L1_21 = L1_21 + 1
  end
end
function UserMacroIconListWidget.setIconID(A0_27, A1_28)
  local L2_29
  L2_29 = A1_28 / 25
  A0_27.work.pageIndex = _math.floor(L2_29) + 1
  A0_27:updatePageNum()
  A0_27.work.iconIndex = A1_28 % 25 + 1
  A0_27:setLogicalFocus("Button_Icon_" .. tostring(A0_27.work.iconIndex))
end
