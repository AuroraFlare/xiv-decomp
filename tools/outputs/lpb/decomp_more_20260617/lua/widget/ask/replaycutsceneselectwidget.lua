require("/Widget/Ask/AskBaseClass")
_defineClass("ReplayCutsceneSelectWidget", "AskBaseClass")
function ReplayCutsceneSelectWidget.initAsk(A0_0, A1_1)
  local L2_2
  L2_2 = A0_0.work
  L2_2._temp = {
    {"questId", "integer32"}
  }
  L2_2 = A0_0.work
  L2_2.questId = A1_1
  L2_2 = A0_0.setCancelCondition
  L2_2(A0_0)
  L2_2 = A0_0.setCloseCondition
  L2_2(A0_0)
  L2_2 = A0_0.setConfirmCondition
  L2_2(A0_0, "Button_Close")
  L2_2 = A0_0.setControlCommandCondition
  L2_2(A0_0, "ListBox_CutsceneList", "UILuaCommands.Selection")
  L2_2 = A0_0.createList
  L2_2(A0_0, A1_1)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_Title", 5001, A1_1)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_ListTitle", 5101)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_NowStoryTitle", 5102)
  L2_2 = A0_0.setText
  L2_2(A0_0, "TextBlock_NowCondition", 5024, A1_1)
  L2_2 = A0_0.setContent
  L2_2(A0_0, "Button_Close", 5104)
  L2_2 = desktopWidget
  L2_2 = L2_2.getQuestIconID
  L2_2 = L2_2(L2_2, A1_1)
  if L2_2 ~= 0 then
    A0_0:setIcon("IconControl_Icon", L2_2)
  end
  if A1_1 >= 110821 and A1_1 <= 110824 then
    A0_0:setText("TextBlock_NowCondition", 5109)
  end
end
function ReplayCutsceneSelectWidget.processUICommandCancel(A0_3, A1_4, A2_5, A3_6, A4_7)
  A0_3:finish()
end
function ReplayCutsceneSelectWidget.processUICommandClose(A0_8, A1_9, A2_10, A3_11, A4_12)
  A0_8:finish()
end
function ReplayCutsceneSelectWidget.processUICommandOperate(A0_13, A1_14, A2_15, A3_16, A4_17)
  A0_13:finish()
end
function ReplayCutsceneSelectWidget.processUICommandSelection(A0_18, A1_19, A2_20, A3_21, A4_22)
  local L5_23, L6_24
  L6_24 = A0_18
  L5_23 = A0_18.getListPropertyIndex
  L5_23 = L5_23(L6_24, "ListBox", A3_21)
  L6_24 = A0_18.getListProperty
  L6_24 = L6_24(A0_18, "ListBox", L5_23, "cutsceneId")
  A0_18:hide()
  A0_18:_getParentWidget():hide()
  A0_18:_getParentWidget():finish(L6_24)
end
function ReplayCutsceneSelectWidget.finish(A0_25)
  A0_25:setBaseAskResult(-1)
  desktopWidget:closeWidgetDirect(A0_25)
end
function ReplayCutsceneSelectWidget.createList(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37
  L3_29 = A0_26
  L2_28 = A0_26.setVisibility
  L4_30 = "ListBox_CutsceneList"
  L5_31 = false
  L2_28(L3_29, L4_30, L5_31)
  L3_29 = A0_26
  L2_28 = A0_26.deleteListPropertyAll
  L4_30 = "ListBox"
  L2_28(L3_29, L4_30)
  L2_28 = 30
  L3_29 = A1_27 * 100
  L3_29 = L3_29 + 1
  L4_30 = A1_27 * 100
  L4_30 = L4_30 + L2_28
  L5_31 = {
    L6_32,
    L7_33,
    L8_34,
    L9_35,
    L10_36,
    L11_37,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil
  }
  L6_32, L7_33, L11_37 = nil, nil, nil
  L6_32 = 0
  L7_33 = 1
  for L11_37 = L3_29, L4_30 do
    if cutReplaySheet:_isExistKey(L11_37) then
      L6_32 = L6_32 + 1
      L5_31[L7_33] = L11_37
    end
    L7_33 = L7_33 + 1
  end
  if L6_32 <= 0 then
    L11_37 = 5105
    L8_34(L9_35, L10_36, L11_37)
    L11_37 = true
    L8_34(L9_35, L10_36, L11_37)
    L11_37 = true
    L8_34(L9_35, L10_36, L11_37)
    return
  end
  L11_37 = L4_30
  L8_34(L9_35, L10_36, L11_37)
  for L11_37 = 1, L2_28 do
    if L5_31[L11_37] ~= nil then
      A0_26:setListText("ListBox", L11_37 - 1, "CutsceneName", 5103, L5_31[L11_37])
      A0_26:setListProperty("ListBox", L11_37 - 1, "cutsceneId", L5_31[L11_37])
    end
  end
  L8_34(L9_35, L10_36)
  L11_37 = true
  L8_34(L9_35, L10_36, L11_37)
end
