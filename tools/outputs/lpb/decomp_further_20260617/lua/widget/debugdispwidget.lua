require("/Widget/WidgetBaseClass")
_defineClass("DebugDispWidget", "WidgetBaseClass")
function DebugDispWidget.init(A0_0)
  local L1_1, L2_2, L3_3, L4_4
  L4_4 = "time"
  L4_4 = {"childNum", "integer8"}
  L1_1._temp = L2_2
  L4_4 = "Window_DebugDispWidget"
  L1_1(L2_2, L3_3, L4_4, "Visibility", "hidden")
  for L4_4 = 1, #L2_2 do
    A0_0:_addItem(nil, "LB_PrintDisp", "listboxTemplate2", "ListData" .. L4_4)
    A0_0:_setProperty("ListData" .. L4_4, "ListData" .. L4_4, "Focusable", false)
    A0_0:_setProperty("ListData" .. L4_4, "ListData" .. L4_4, "IsHitTestVisible", false)
  end
  L1_1.childNum = L2_2
  L1_1(L2_2, L3_3)
  L1_1.childNum = 1
end
function DebugDispWidget.setPrintDisp(A0_5, A1_6, A2_7, A3_8, A4_9)
  local L5_10, L6_11, L7_12
  L5_10 = 5000
  L6_11 = _math
  L6_11 = L6_11.floor
  L7_12 = debug
  L7_12 = L7_12._getLowResolutionTime
  L7_12 = L7_12(L7_12)
  L7_12 = L7_12 * 1000
  L6_11 = L6_11(L7_12)
  L7_12 = nil
  if A3_8 == nil then
    A3_8 = 15
  end
  if A0_5:_getProperty(nil, "Window_DebugDispWidget", "Visibility") ~= "Visible" then
    A0_5:_setProperty(nil, "Window_DebugDispWidget", "Visibility", "Visible")
  end
  L7_12 = L6_11 + L5_10
  if A4_9 ~= nil then
    L7_12 = L7_12 + A4_9 * 1000
  end
  A0_5:addText(A1_6, tostring(A2_7), L7_12, A3_8)
  A0_5:removeText()
end
function DebugDispWidget.setFront(A0_13, A1_14)
  if A1_14 then
    A0_13:setProperty("SqwtDrawOrder", 0.5)
  else
    A0_13:setProperty("SqwtDrawOrder", 0)
  end
end
function DebugDispWidget.debugProcessLoop(A0_15)
  if A0_15:_getProperty(nil, "Window_DebugDispWidget", "Visibility") == "Visible" then
    A0_15:removeText()
  end
end
function DebugDispWidget.truncate(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
  L2_18 = 0
  L3_19 = A0_16.work
  L3_19 = L3_19.childNum
  if A1_17 > L3_19 then
    return
  end
  for L7_23 = A1_17, L3_19 do
    A0_16:_setProperty("ListData" .. L7_23, "key", "Content", "")
    A0_16:_setProperty("ListData" .. L7_23, "value", "Content", "")
    A0_16.work.time[L7_23] = 0
  end
  if A1_17 == 1 then
    L7_23 = "Window_DebugDispWidget"
    L4_20(L5_21, L6_22, L7_23, "Visibility", "hidden")
  end
end
function DebugDispWidget.addText(A0_24, A1_25, A2_26, A3_27, A4_28)
  local L5_29, L6_30, L7_31, L8_32, L9_33
  L5_29 = 0
  if A4_28 < 1 then
    A4_28 = 15
  end
  if L6_30 >= 1 then
    for L9_33 = 1, L7_31.childNum do
      if A0_24:_getProperty("ListData" .. L9_33, "key", "Content") == A1_25 then
        A0_24:_setProperty("ListData" .. L9_33, "value", "Content", A2_26)
        A0_24:_setProperty("ListData" .. L9_33, "key", "FontSize", A4_28)
        A0_24:_setProperty("ListData" .. L9_33, "value", "FontSize", A4_28)
        A0_24.work.time[L9_33] = A3_27
        return
      end
    end
  end
  if L6_30 < L7_31 then
    L6_30.childNum = L7_31
    L9_33 = A0_24.work
    L9_33 = L9_33.childNum
    L9_33 = "key"
    L6_30(L7_31, L8_32, L9_33, "Content", A1_25)
    L9_33 = A0_24.work
    L9_33 = L9_33.childNum
    L9_33 = "value"
    L6_30(L7_31, L8_32, L9_33, "Content", A2_26)
    L9_33 = A0_24.work
    L9_33 = L9_33.childNum
    L9_33 = "key"
    L6_30(L7_31, L8_32, L9_33, "FontSize", A4_28)
    L9_33 = A0_24.work
    L9_33 = L9_33.childNum
    L9_33 = "value"
    L6_30(L7_31, L8_32, L9_33, "FontSize", A4_28)
    L6_30[L7_31] = A3_27
    return
  end
  L9_33 = A1_25
  L6_30(L7_31, L8_32)
end
function DebugDispWidget.removeText(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40, L7_41, L8_42, L9_43, L10_44
  L1_35 = 1
  L2_36 = 0
  L3_37 = 0
  L4_38 = false
  L5_39 = A0_34.work
  L5_39 = L5_39.childNum
  if L5_39 == 0 then
    return
  end
  L6_40 = _math
  L6_40 = L6_40.floor
  L6_40 = L6_40(L7_41)
  for L10_44 = 1, L5_39 do
    if L2_36 == 0 and (L6_40 >= A0_34.work.time[L10_44] or A0_34:_getProperty("ListData" .. L10_44, "value", "Content") == "nil" or A0_34:_getProperty("ListData" .. L10_44, "value", "Content") == "") then
      L1_35 = L10_44
      L2_36 = 1
      L4_38 = true
    end
    if L2_36 == 1 and L6_40 < A0_34.work.time[L10_44] and (A0_34:_getProperty("ListData" .. L10_44, "value", "Content") ~= "nil" or A0_34:_getProperty("ListData" .. L10_44, "value", "Content") == "") then
      A0_34:_setProperty("ListData" .. L1_35, "key", "Content", A0_34:_getProperty("ListData" .. L10_44, "key", "Content"))
      A0_34:_setProperty("ListData" .. L1_35, "value", "Content", A0_34:_getProperty("ListData" .. L10_44, "value", "Content"))
      A0_34:_setProperty("ListData" .. L1_35, "key", "FontSize", A0_34:_getProperty("ListData" .. L10_44, "key", "FontSize"))
      A0_34:_setProperty("ListData" .. L1_35, "value", "FontSize", A0_34:_getProperty("ListData" .. L10_44, "value", "FontSize"))
      A0_34.work.time[L1_35] = A0_34.work.time[L10_44]
      L1_35 = L1_35 + 1
    end
  end
  if L2_36 == 1 and L5_39 >= L1_35 then
    L7_41(L8_42, L9_43)
    L7_41.childNum = L1_35
  end
end
