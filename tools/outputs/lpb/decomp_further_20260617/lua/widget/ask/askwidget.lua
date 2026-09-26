require("/Widget/Ask/AskBaseClass")
_defineClass("AskWidget", "AskBaseClass")
function AskWidget.initAsk(A0_0)
  A0_0.work._temp = {
    {
      "askDefaultAnswer",
      "integer8"
    },
    {
      "askAnswerMax",
      "integer8"
    },
    {"askPageMax", "integer8"},
    {"askPageNow", "integer8"},
    {"askPaging", "boolean"},
    {"canCancel", "boolean"}
  }
  A0_0:_setUICommandCondition("Button_Previous", "UILuaCommands.PagePrevious", 5)
  A0_0:_setUICommandCondition("Button_Next", "UILuaCommands.PageNext", 5)
  A0_0:setCancelCondition()
  A0_0:_setUICommandTemplateCondition("ControlTemplate_ListBoxItem", "TemplateButton_Answer", "UILuaCommands.Operate", 5)
  A0_0:addListBoxItem("ListBox_Answers", "Item_Answers", 24)
  A0_0:initialWidget()
end
function AskWidget.processAfterShow(A0_1, A1_2)
  local L2_3
  L2_3 = "Item_Answers"
  L2_3 = L2_3 .. tostring(A0_1.work.askDefaultAnswer)
  A0_1:_setKeyboardFocusedControl(L2_3, "TemplateButton_Answer")
  return true
end
function AskWidget.ask(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9, A6_10, A7_11, ...)
  local L9_13, L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21
  L10_14 = A0_4
  L9_13 = A0_4.initialWidget
  L9_13(L10_14)
  L9_13 = A0_4.work
  L10_14 = #A7_11
  L9_13.askAnswerMax = L10_14
  L9_13 = A0_4.work
  L9_13.askPaging = A4_8
  L9_13 = A0_4.work
  L9_13.canCancel = A5_9
  L9_13 = A0_4.work
  L10_14 = _math
  L10_14 = L10_14.ceil
  L11_15 = A0_4.work
  L11_15 = L11_15.askAnswerMax
  L11_15 = L11_15 / 8
  L10_14 = L10_14(L11_15)
  L9_13.askPageMax = L10_14
  L9_13 = A0_4.work
  L9_13 = L9_13.askPageMax
  if not (L9_13 > 1) then
    L9_13 = A0_4.work
    L9_13 = L9_13.askPaging
  elseif L9_13 == true then
    L10_14 = A0_4
    L9_13 = A0_4.setVisibility
    L11_15 = "Grid_Button"
    L9_13(L10_14, L11_15, L12_16)
  end
  L9_13 = #A7_11
  L10_14 = select
  L11_15 = "#"
  L17_21 = ...
  L10_14 = L10_14(L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, ...)
  L11_15 = L10_14 - L9_13
  if L11_15 < 0 then
    L11_15 = 0
  end
  if A2_6 == nil then
    L15_19 = A6_10
    L12_16(L13_17, L14_18, L15_19)
    for L15_19 = 1, L13_17.askAnswerMax do
      L16_20 = select
      L17_21 = L11_15 + L15_19
      L16_20 = L16_20(L17_21, ...)
      L17_21 = A0_4.packTextParameter
      L17_21 = L17_21(A0_4, A7_11[L15_19], L16_20)
      A0_4:_setProperty("Item_Answers" .. tostring(L15_19), "TemplateButton_Answer", "Content", L17_21)
    end
  else
    L15_19 = "TextBlock_Question"
    L16_20 = "Text"
    L17_21 = A2_6
    L12_16(L13_17, L14_18, L15_19, L16_20, L17_21, A6_10, ...)
    for L15_19 = 1, L13_17.askAnswerMax do
      L17_21 = A0_4
      L16_20 = A0_4._setProperty
      L16_20(L17_21, "Item_Answers" .. tostring(L15_19), "TemplateButton_Answer", "Content", A2_6, A7_11[L15_19], select(L11_15 + L15_19, ...))
    end
  end
  if A3_7 == nil and not (A3_7 >= 1) then
  else
    if A3_7 <= L12_16 then
      L12_16.askDefaultAnswer = A3_7
      L15_19 = A3_7
      L12_16.askPageNow = L13_17
      L12_16(L13_17, L14_18)
  end
  else
    L12_16.askDefaultAnswer = 1
    L12_16(L13_17, L14_18)
  end
end
function AskWidget.askMultiple(A0_22, A1_23, A2_24, A3_25, A4_26, A5_27, A6_28, A7_29, A8_30, ...)
  local L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39
  L11_33 = A0_22
  L10_32 = A0_22.initialWidget
  L10_32(L11_33)
  L10_32 = select
  L11_33 = "#"
  L17_39 = ...
  L10_32 = L10_32(L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, ...)
  L11_33 = #A8_30
  L12_34 = #A8_30
  L12_34 = L12_34 * A6_28
  L11_33 = L11_33 + L12_34
  L10_32 = L10_32 - L11_33
  if L10_32 < 0 then
    L10_32 = 0
  end
  L11_33 = #A8_30
  L11_33 = L11_33 + 1
  if L10_32 > 0 then
    L13_35 = A0_22
    L12_34 = A0_22._setProperty
    L17_39 = A2_24
    L12_34(L13_35, L14_36, L15_37, L16_38, L17_39, A7_29, select(L11_33, ...))
  else
    L13_35 = A0_22
    L12_34 = A0_22._setProperty
    L17_39 = A2_24
    L12_34(L13_35, L14_36, L15_37, L16_38, L17_39, A7_29)
  end
  L12_34 = L11_33 + L10_32
  L13_35 = 0
  for L17_39 = 1, #A8_30 do
    if select(L17_39, ...) == true then
      L13_35 = L13_35 + 1
      A0_22:_setProperty("Item_Answers" .. tostring(L13_35), "TemplateButton_Answer", "Content", A2_24, A8_30[L17_39], select(L12_34, ...))
    end
    L12_34 = L12_34 + A6_28
  end
  L14_36.askAnswerMax = L13_35
  L14_36.askPaging = A4_26
  L14_36.canCancel = A5_27
  L14_36.askPageMax = L15_37
  if not (L14_36 > 1) then
  elseif L14_36 == true then
    L17_39 = true
    L14_36(L15_37, L16_38, L17_39)
  end
  if A3_25 == nil and not (A3_25 >= 1) then
  else
    if A3_25 <= L14_36 then
      L14_36.askDefaultAnswer = A3_25
      L17_39 = A3_25
      L14_36.askPageNow = L15_37
      L14_36(L15_37, L16_38)
  end
  else
    L14_36.askDefaultAnswer = 1
    L14_36(L15_37, L16_38)
  end
end
function AskWidget.processUICommandEvent(A0_40, A1_41, A2_42, A3_43, A4_44, A5_45)
  local L6_46, L7_47
  L6_46 = A3_43
  if L6_46 == "UILuaCommands.Operate" then
    if A2_42 == "TemplateButton_Answer" then
      L7_47 = tonumber
      L7_47 = L7_47(desktopWidget:parseWidgetString(A1_41, 2, "Answers"))
      A0_40:setBaseAskResult(L7_47)
      do break end
      else
      end
      if L6_46 == "UILuaCommands.Cancel" then
        L7_47 = A0_40.work
        L7_47 = L7_47.canCancel
        if L7_47 == true then
          L7_47 = A0_40.setBaseAskResult
          L7_47(A0_40, -3)
          do break end
          else
          end
          if L6_46 == "UILuaCommands.PagePrevious" then
            L7_47 = A0_40.work
            L7_47 = L7_47.askPaging
            if L7_47 == true then
              L7_47 = A0_40.setBaseAskResult
              L7_47(A0_40, -2)
            else
              L7_47 = A0_40.work
              L7_47.askPageNow = A0_40.work.askPageNow - 1
              L7_47 = A0_40.work
              L7_47 = L7_47.askPageNow
              if L7_47 == 0 then
                L7_47 = A0_40.work
                L7_47.askPageNow = A0_40.work.askPageMax
              end
              L7_47 = A0_40.pageChange
              L7_47(A0_40, A0_40.work.askPageNow)
              do break end
              else
              end
              if L6_46 == "UILuaCommands.PageNext" then
                L7_47 = A0_40.work
                L7_47 = L7_47.askPaging
                if L7_47 == true then
                  L7_47 = A0_40.setBaseAskResult
                  L7_47(A0_40, -1)
                else
                  L7_47 = A0_40.work
                  L7_47.askPageNow = A0_40.work.askPageNow % A0_40.work.askPageMax + 1
                  L7_47 = A0_40.pageChange
                  L7_47(A0_40, A0_40.work.askPageNow)
                  break
                end
              else
              end
            end
        else
        end
    else
    end
end
function AskWidget.initialWidget(A0_48)
  local L1_49, L2_50, L3_51, L4_52, L5_53
  L1_49(L2_50)
  L1_49.askPageNow = 1
  L1_49.askPageMax = 0
  L1_49.askAnswerMax = 0
  L1_49.askPaging = false
  L1_49.askDefaultAnswer = 1
  L1_49.canCancel = false
  L4_52 = ""
  L1_49(L2_50, L3_51, L4_52)
  for L4_52 = 1, 24 do
    L5_53 = "Item_Answers"
    L5_53 = L5_53 .. tostring(L4_52)
    A0_48:_setProperty(L5_53, "TemplateButton_Answer", "Content", "")
    A0_48:_setProperty(L5_53, L5_53, "Visibility", "Collapsed")
  end
end
function AskWidget.pageChange(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  for L5_59 = 1, L3_57.askAnswerMax do
    L6_60 = nil
    L7_61 = A0_54.getPageNum
    L7_61 = L7_61(A0_54, L5_59)
    if L7_61 == A1_55 then
      L6_60 = "Visible"
    else
      L6_60 = "Collapsed"
    end
    L7_61 = "Item_Answers"
    L7_61 = L7_61 .. tostring(L5_59)
    A0_54:_setProperty(L7_61, L7_61, "Visibility", L6_60)
  end
  if L4_58 == false then
    L5_59 = A0_54.work
    L5_59 = L5_59.askPageMax
  end
  L5_59 = A0_54
  L6_60 = "Button_Previous"
  L7_61 = L2_56
  L4_58(L5_59, L6_60, L7_61)
  L5_59 = A0_54
  L6_60 = "Button_Next"
  L7_61 = L3_57
  L4_58(L5_59, L6_60, L7_61)
end
function AskWidget.getPageNum(A0_62, A1_63)
  local L2_64, L4_65, L6_66
  for _FORV_5_ = 1, L4_65.askPageMax do
    if A1_63 <= 8 * _FORV_5_ then
      return _FORV_5_
    end
  end
  return L2_64
end
