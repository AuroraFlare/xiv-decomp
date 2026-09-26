local L0_0, L1_1
L0_0 = CutScene
function L1_1(A0_2, A1_3, ...)
  local L3_5, L4_6, L5_7, L6_8, L7_9
  if A1_3 == "Personage" then
    L3_5 = select
    L7_9 = ...
    L3_5 = L3_5(L4_6, L5_7, L6_8, L7_9, ...)
    for L7_9 = 1, #L3_5 do
      if L3_5[L7_9] <= 19999 then
      else
        A0_2.work.actorclassSheet:_loadKeySemipermanently(L3_5[L7_9], L3_5[L7_9])
      end
    end
  end
end
L0_0._onInitializationClip = L1_1
L0_0 = CutScene
function L1_1(A0_10, A1_11, ...)
  local L3_13, L4_14, L5_15, L6_16, L7_17
  if A1_11 == "Personage" then
    L3_13 = select
    L7_17 = ...
    L3_13 = L3_13(L4_14, L5_15, L6_16, L7_17, ...)
    for L7_17 = 1, #L3_13 do
      if L3_13[L7_17] <= 19999 then
      else
        A0_10.work.actorclassSheet:_unloadKey(L3_13[L7_17], L3_13[L7_17])
      end
    end
  end
end
L0_0._onFinalizeClip = L1_1
L0_0 = CutScene
function L1_1(A0_18, A1_19, A2_20, ...)
  local L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30
  if A1_19 == "Message" or A1_19 == "MessageClip" then
    L4_22 = nil
    if A2_20 == 6500019 then
      L5_23 = select
      L6_24 = 1
      L12_30 = ...
      L5_23 = L5_23(L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, ...)
      L4_22 = L5_23
      L5_23 = 0
      L6_24 = 0
      L7_25 = 0
      L8_26 = nil
      L9_27 = type
      L10_28 = select
      L11_29 = 4
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "number" then
        L9_27 = select
        L10_28 = 4
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L5_23 = L9_27
      else
        L9_27 = type
        L10_28 = select
        L11_29 = 4
        L12_30 = ...
        L12_30 = L10_28(L11_29, L12_30, ...)
        L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
        if L9_27 == "string" then
          L9_27 = select
          L10_28 = 4
          L12_30 = ...
          L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
          L8_26 = L9_27
        end
      end
      L9_27 = type
      L10_28 = select
      L11_29 = 5
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "number" then
        L9_27 = select
        L10_28 = 5
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L6_24 = L9_27
      else
        L9_27 = type
        L10_28 = select
        L11_29 = 5
        L12_30 = ...
        L12_30 = L10_28(L11_29, L12_30, ...)
        L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
        if L9_27 == "string" then
          L9_27 = select
          L10_28 = 5
          L12_30 = ...
          L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
          L8_26 = L9_27
        end
      end
      L9_27 = type
      L10_28 = select
      L11_29 = 6
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "number" then
        L9_27 = select
        L10_28 = 6
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L7_25 = L9_27
      else
        L9_27 = type
        L10_28 = select
        L11_29 = 6
        L12_30 = ...
        L12_30 = L10_28(L11_29, L12_30, ...)
        L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
        if L9_27 == "string" then
          L9_27 = select
          L10_28 = 6
          L12_30 = ...
          L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
          L8_26 = L9_27
        end
      end
      L9_27 = type
      L10_28 = select
      L11_29 = 7
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "number" then
        L9_27 = select
        L10_28 = 7
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L7_25 = L9_27
      else
        L9_27 = type
        L10_28 = select
        L11_29 = 7
        L12_30 = ...
        L12_30 = L10_28(L11_29, L12_30, ...)
        L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
        if L9_27 == "string" then
          L9_27 = select
          L10_28 = 7
          L12_30 = ...
          L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
          L8_26 = L9_27
        end
      end
      L9_27 = type
      L10_28 = select
      L11_29 = 8
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "number" then
        L9_27 = select
        L10_28 = 8
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L7_25 = L9_27
      else
        L9_27 = type
        L10_28 = select
        L11_29 = 8
        L12_30 = ...
        L12_30 = L10_28(L11_29, L12_30, ...)
        L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
        if L9_27 == "string" then
          L9_27 = select
          L10_28 = 8
          L12_30 = ...
          L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
          L8_26 = L9_27
        end
      end
      L9_27 = type
      L10_28 = select
      L11_29 = 9
      L12_30 = ...
      L12_30 = L10_28(L11_29, L12_30, ...)
      L9_27 = L9_27(L10_28, L11_29, L12_30, L10_28(L11_29, L12_30, ...))
      if L9_27 == "string" then
        L9_27 = select
        L10_28 = 9
        L12_30 = ...
        L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
        L8_26 = L9_27
      end
      L9_27 = select
      L10_28 = 3
      L12_30 = ...
      L9_27 = L9_27(L10_28, L11_29, L12_30, ...)
      if L9_27 > 0 then
        if L9_27 == 7 then
          L9_27 = 8
        elseif L9_27 == 8 then
          L9_27 = 7
        end
        L10_28 = L4_22 + L9_27
        L4_22 = L10_28 - 1
        if L4_22 <= 0 then
          L4_22 = 1
        end
      end
      if L8_26 == "" then
        L8_26 = "SnpcNoName"
      end
      L10_28 = 38
      L11_29 = desktopWidget
      L12_30 = L11_29
      L11_29 = L11_29.showMessage
      L11_29(L12_30, L8_26, L10_28, A0_18.work.textOwner, L4_22, select(6, ...))
    else
      L5_23 = -1
      L6_24 = -1
      L7_25 = -1
      L8_26 = select
      L9_27 = 2
      L12_30 = ...
      L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
      if L8_26 ~= nil then
        L8_26 = select
        L9_27 = 2
        L12_30 = ...
        L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
        if L8_26 ~= 1070001 then
          L5_23 = 1
        end
      else
      end
      L8_26 = select
      L9_27 = 3
      L12_30 = ...
      L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
      if L8_26 ~= nil then
        L8_26 = select
        L9_27 = 3
        L12_30 = ...
        L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
        if L8_26 ~= 1070001 then
          L6_24 = 1
        end
      else
      end
      L8_26 = select
      L9_27 = 4
      L12_30 = ...
      L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
      if L8_26 ~= nil then
        L8_26 = select
        L9_27 = 4
        L12_30 = ...
        L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
        if L8_26 ~= 1070001 then
          L7_25 = 1
        end
      else
      end
      if A2_20 == 1000935 then
        A2_20 = "???"
      else
        L9_27 = A0_18
        L8_26 = A0_18.getNameByActorClass
        L10_28 = A2_20
        L8_26 = L8_26(L9_27, L10_28)
        A2_20 = L8_26
      end
      L8_26 = select
      L9_27 = 1
      L12_30 = ...
      L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
      L4_22 = L8_26
      L8_26 = 38
      if L5_23 ~= -1 then
        L9_27 = desktopWidget
        L10_28 = L9_27
        L9_27 = L9_27.showMessage
        L11_29 = A2_20
        L12_30 = L8_26
        L9_27(L10_28, L11_29, L12_30, A0_18.work.textOwner, L4_22, select(2, ...))
      else
        L9_27 = desktopWidget
        L10_28 = L9_27
        L9_27 = L9_27.showMessage
        L11_29 = A2_20
        L12_30 = L8_26
        L9_27(L10_28, L11_29, L12_30, A0_18.work.textOwner, L4_22, 1, 1, 1)
      end
    end
  elseif A1_19 == "Ask" then
    L4_22 = {}
    L5_23 = false
    L6_24 = 2
    L7_25 = 1
    L8_26 = select
    L9_27 = 1
    L12_30 = ...
    L8_26 = L8_26(L9_27, L10_28, L11_29, L12_30, ...)
    L9_27 = 0
    L10_28 = 2
    L11_29 = 0
    while L5_23 == false do
      L12_30 = select
      L12_30 = L12_30(L6_24, ...)
      if L12_30 == true then
        L12_30 = L8_26 + L6_24
        L12_30 = L12_30 - 1
        L4_22[L7_25] = L12_30
        L7_25 = L7_25 + 1
      else
      end
      L6_24 = L6_24 + 1
      L10_28 = L10_28 + 1
      L12_30 = type
      L12_30 = L12_30(select(L6_24, ...))
      if L12_30 ~= "boolean" then
        L5_23 = true
      end
    end
    L6_24 = L6_24 + 1
    L12_30 = type
    L12_30 = L12_30(select(L6_24, ...))
    if L12_30 == "boolean" then
    end
    L12_30 = 0
    if _isInstanceOf(A0_18.work.textOwner, "PopulaceRetainerManager") == true then
      L12_30 = desktopWidget:askForEventMode(A2_20, A0_18, A0_18.work.textOwner, 1, false, false, L8_26, L4_22, select(L10_28, ...), 0, select(L10_28, ...), 0, 0)
    else
      L12_30 = desktopWidget:askForEventMode(A2_20, A0_18, A0_18.work.textOwner, 1, false, false, L8_26, L4_22, select(L10_28, ...))
    end
    L6_24 = 2
    while L11_29 < L12_30 do
      if select(L6_24, ...) == true then
        L11_29 = L11_29 + 1
      end
      L9_27 = L9_27 + 1
      L6_24 = L6_24 + 1
    end
    return L9_27
  elseif A1_19 == "QuestInfoAsk" then
    L4_22 = nil
    L5_23 = 0
    L6_24 = A0_18.work
    L6_24 = L6_24.textOwner
    if L6_24 ~= nil then
      L8_26 = L6_24
      L7_25 = L6_24.getQuestId
      L7_25 = L7_25(L8_26)
      if L7_25 >= 110001 and L7_25 <= 110021 or L7_25 == 110839 or L7_25 == 110829 or L7_25 == 110849 or L7_25 == 110841 or L7_25 == 110869 then
        L8_26 = desktopWidget
        L9_27 = L8_26
        L8_26 = L8_26.askQuestDetailWidget
        L10_28 = L7_25
        L8_26 = L8_26(L9_27, L10_28)
        L4_22 = L8_26
        if L4_22 ~= true then
          L5_23 = 2
        else
          L5_23 = 1
        end
      else
        L8_26 = desktopWidget
        L9_27 = L8_26
        L8_26 = L8_26.askEventModeWidgetYield
        L10_28 = "Ask/QuestAskWidget"
        L11_29 = 1
        L12_30 = A2_20
        L9_27 = L8_26(L9_27, L10_28, L11_29, L12_30)
        L5_23 = L9_27
        L4_22 = L8_26
        if L4_22 ~= true then
          L5_23 = 2
        end
      end
    end
    return L5_23
  end
  L4_22 = nil
  return L4_22
end
L0_0._onOpenUIClip = L1_1
L0_0 = CutScene
function L1_1(A0_31, A1_32, A2_33, ...)
  local L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41
  if A1_32 == "Caption" or A1_32 == "CaptionClip" then
    L5_36 = A0_31
    L4_35 = A0_31.getNameByActorClass
    L6_37 = A2_33
    L4_35 = L4_35(L5_36, L6_37)
    A2_33 = L4_35
    L4_35 = select
    L5_36 = 1
    L10_41 = ...
    L4_35 = L4_35(L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, ...)
    L5_36 = desktopWidget
    L6_37 = L5_36
    L5_36 = L5_36.showCaption
    L7_38 = A2_33
    L8_39 = A0_31.work
    L8_39 = L8_39.textOwner
    L9_40 = L4_35
    L10_41 = select
    L10_41 = L10_41(2, ...)
    L5_36(L6_37, L7_38, L8_39, L9_40, L10_41, L10_41(2, ...))
  elseif A1_32 == "Message" or A1_32 == "MessageClip" then
    L4_35 = nil
    if A2_33 == 6500019 then
      L5_36 = select
      L6_37 = 1
      L10_41 = ...
      L5_36 = L5_36(L6_37, L7_38, L8_39, L9_40, L10_41, ...)
      L4_35 = L5_36
      L5_36 = 0
      L6_37 = 0
      L7_38 = 0
      L8_39 = nil
      L9_40 = type
      L10_41 = select
      L10_41 = L10_41(4, ...)
      L9_40 = L9_40(L10_41, L10_41(4, ...))
      if L9_40 == "number" then
        L9_40 = select
        L10_41 = 4
        L9_40 = L9_40(L10_41, ...)
        L5_36 = L9_40
      else
        L9_40 = type
        L10_41 = select
        L10_41 = L10_41(4, ...)
        L9_40 = L9_40(L10_41, L10_41(4, ...))
        if L9_40 == "string" then
          L9_40 = select
          L10_41 = 4
          L9_40 = L9_40(L10_41, ...)
          L8_39 = L9_40
        end
      end
      L9_40 = type
      L10_41 = select
      L10_41 = L10_41(5, ...)
      L9_40 = L9_40(L10_41, L10_41(5, ...))
      if L9_40 == "number" then
        L9_40 = select
        L10_41 = 5
        L9_40 = L9_40(L10_41, ...)
        L6_37 = L9_40
      else
        L9_40 = type
        L10_41 = select
        L10_41 = L10_41(5, ...)
        L9_40 = L9_40(L10_41, L10_41(5, ...))
        if L9_40 == "string" then
          L9_40 = select
          L10_41 = 5
          L9_40 = L9_40(L10_41, ...)
          L8_39 = L9_40
        end
      end
      L9_40 = type
      L10_41 = select
      L10_41 = L10_41(6, ...)
      L9_40 = L9_40(L10_41, L10_41(6, ...))
      if L9_40 == "number" then
        L9_40 = select
        L10_41 = 6
        L9_40 = L9_40(L10_41, ...)
        L7_38 = L9_40
      else
        L9_40 = type
        L10_41 = select
        L10_41 = L10_41(6, ...)
        L9_40 = L9_40(L10_41, L10_41(6, ...))
        if L9_40 == "string" then
          L9_40 = select
          L10_41 = 6
          L9_40 = L9_40(L10_41, ...)
          L8_39 = L9_40
        end
      end
      L9_40 = type
      L10_41 = select
      L10_41 = L10_41(7, ...)
      L9_40 = L9_40(L10_41, L10_41(7, ...))
      if L9_40 == "number" then
        L9_40 = select
        L10_41 = 7
        L9_40 = L9_40(L10_41, ...)
        L7_38 = L9_40
      else
        L9_40 = type
        L10_41 = select
        L10_41 = L10_41(7, ...)
        L9_40 = L9_40(L10_41, L10_41(7, ...))
        if L9_40 == "string" then
          L9_40 = select
          L10_41 = 7
          L9_40 = L9_40(L10_41, ...)
          L8_39 = L9_40
        end
      end
      L9_40 = type
      L10_41 = select
      L10_41 = L10_41(8, ...)
      L9_40 = L9_40(L10_41, L10_41(8, ...))
      if L9_40 == "number" then
        L9_40 = select
        L10_41 = 8
        L9_40 = L9_40(L10_41, ...)
        L7_38 = L9_40
      else
        L9_40 = type
        L10_41 = select
        L10_41 = L10_41(8, ...)
        L9_40 = L9_40(L10_41, L10_41(8, ...))
        if L9_40 == "string" then
          L9_40 = select
          L10_41 = 8
          L9_40 = L9_40(L10_41, ...)
          L8_39 = L9_40
        end
      end
      L9_40 = select
      L10_41 = 3
      L9_40 = L9_40(L10_41, ...)
      if L9_40 > 0 then
        if L9_40 == 7 then
          L9_40 = 8
        elseif L9_40 == 8 then
          L9_40 = 7
        end
        L10_41 = L4_35 + L9_40
        L4_35 = L10_41 - 1
        if L4_35 <= 0 then
          L4_35 = 1
        end
      end
      if L8_39 == "" then
        L8_39 = "SnpcNoName"
      end
      L10_41 = 38
      desktopWidget:showLog(L8_39, L10_41, A0_31.work.textOwner, L4_35, select(6, ...))
    else
      L5_36 = -1
      L6_37 = -1
      L7_38 = -1
      L8_39 = select
      L9_40 = 2
      L10_41 = ...
      L8_39 = L8_39(L9_40, L10_41, ...)
      if L8_39 ~= nil then
        L8_39 = select
        L9_40 = 2
        L10_41 = ...
        L8_39 = L8_39(L9_40, L10_41, ...)
        if L8_39 ~= 1070001 then
          L5_36 = 1
        end
      else
      end
      L8_39 = select
      L9_40 = 3
      L10_41 = ...
      L8_39 = L8_39(L9_40, L10_41, ...)
      if L8_39 ~= nil then
        L8_39 = select
        L9_40 = 3
        L10_41 = ...
        L8_39 = L8_39(L9_40, L10_41, ...)
        if L8_39 ~= 1070001 then
          L6_37 = 1
        end
      else
      end
      L8_39 = select
      L9_40 = 4
      L10_41 = ...
      L8_39 = L8_39(L9_40, L10_41, ...)
      if L8_39 ~= nil then
        L8_39 = select
        L9_40 = 4
        L10_41 = ...
        L8_39 = L8_39(L9_40, L10_41, ...)
        if L8_39 ~= 1070001 then
          L7_38 = 1
        end
      else
      end
      if A2_33 == 1000935 then
        A2_33 = "???"
      else
        L9_40 = A0_31
        L8_39 = A0_31.getNameByActorClass
        L10_41 = A2_33
        L8_39 = L8_39(L9_40, L10_41)
        A2_33 = L8_39
      end
      L8_39 = select
      L9_40 = 1
      L10_41 = ...
      L8_39 = L8_39(L9_40, L10_41, ...)
      L4_35 = L8_39
      L8_39 = 38
      if L5_36 ~= -1 then
        L9_40 = desktopWidget
        L10_41 = L9_40
        L9_40 = L9_40.showLog
        L9_40(L10_41, A2_33, L8_39, A0_31.work.textOwner, L4_35, select(2, ...))
      else
        L9_40 = desktopWidget
        L10_41 = L9_40
        L9_40 = L9_40.showLog
        L9_40(L10_41, A2_33, L8_39, A0_31.work.textOwner, L4_35, 1, 1, 1)
      end
    end
  elseif A1_32 == "PlaneMap" then
    L4_35 = desktopWidget
    L5_36 = L4_35
    L4_35 = L4_35.openMapForCutScene
    L6_37 = A2_33
    L4_35(L5_36, L6_37)
  end
end
L0_0._onShowUIClip = L1_1
L0_0 = CutScene
function L1_1(A0_42, A1_43, A2_44)
  if A1_43 == "Caption" or A1_43 == "CaptionClip" then
    desktopWidget:hideCaption()
  elseif A1_43 == "PlaneMap" then
    desktopWidget:closeMapForCutScene()
  end
end
L0_0._onHideUIClip = L1_1
L0_0 = CutScene
function L1_1(A0_45, A1_46)
  if A1_46 == "2DEffectLocation1" then
    desktopWidget:openCutSceneEffectWidget(1)
  elseif A1_46 == "2DEffectLocation2" then
    desktopWidget:openCutSceneEffectWidget(2)
  elseif A1_46 == "2DEffectLocation3" then
    desktopWidget:openCutSceneEffectWidget(4)
  elseif A1_46 == "2DEffectLocation4" then
    desktopWidget:openCutSceneEffectWidget(5)
  elseif A1_46 == "2DEffectLocation5" then
    desktopWidget:openCutSceneEffectWidget(6)
  elseif A1_46 == "2DEffectLocation6" then
    desktopWidget:openCutSceneEffectWidget(7)
  elseif A1_46 == "2DEffectLocation7" then
    desktopWidget:openCutSceneEffectWidget(8)
  elseif A1_46 == "2DEffectLocation8" then
    desktopWidget:openCutSceneEffectWidget(12)
  elseif A1_46 == "2DEffectLocation9" then
    desktopWidget:openCutSceneEffectWidget(13)
  elseif A1_46 == "2DEffectLocation10" then
    desktopWidget:openCutSceneEffectWidget(14)
  elseif A1_46 == "2DEffectLocation11" then
    desktopWidget:openCutSceneEffectWidget(15)
  elseif A1_46 == "2DEffectContentsSuccess" then
    desktopWidget:openCutSceneEffectWidget(3)
  elseif A1_46 == "2DEffectDutySuccess1" then
    desktopWidget:openCutSceneEffectWidget(9)
  elseif A1_46 == "2DEffectDutySuccess2" then
    desktopWidget:openCutSceneEffectWidget(10)
  elseif A1_46 == "2DEffectDutySuccess3" then
    desktopWidget:openCutSceneEffectWidget(11)
  else
    if A1_46 == "NpcSayWidget" then
      desktopWidget:getStaticWidget(14):display(true)
    else
    end
  end
end
L0_0._onShowWidgetClip = L1_1
L0_0 = CutScene
function L1_1(A0_47, A1_48)
  if A1_48 == "2DEffectLocation1" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation2" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation3" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation4" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation5" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation6" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation7" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation8" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation9" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation10" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectLocation11" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectContentsSuccess" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectDutySuccess1" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectDutySuccess2" then
    desktopWidget:closeCutSceneEffectWidget()
  elseif A1_48 == "2DEffectDutySuccess3" then
    desktopWidget:closeCutSceneEffectWidget()
  else
    if A1_48 == "NpcSayWidget" then
      desktopWidget:getStaticWidget(14):display(false)
    else
    end
  end
end
L0_0._onHideWidgetClip = L1_1
L0_0 = CutScene
function L1_1(A0_49, A1_50)
  local L2_51
  if A1_50 == 10000 then
    L2_51 = worldMaster:_getMyPlayer()
  elseif A1_50 == 19000 then
    L2_51 = worldMaster
  elseif A1_50 <= 19999 then
    L2_51 = "\230\156\170\231\159\165\227\129\174abstractActor(" .. A1_50 .. ")\227\129\149\227\130\147"
  else
    L2_51 = A0_49.work.actorclassSheet:_getData(A1_50, 5)
  end
  return L2_51
end
L0_0.getNameByActorClass = L1_1
L0_0 = CutScene
function L1_1(A0_52, A1_53, A2_54, A3_55, ...)
  local L5_57, L6_58, L7_59, L8_60, L9_61
  L5_57 = worldMaster
  L6_58 = L5_57
  L5_57 = L5_57._getMyPlayer
  L5_57 = L5_57(L6_58)
  L6_58 = L5_57
  L5_57 = L5_57._fadeInNowLoadingForNoticeEventJustInArea
  L5_57(L6_58)
  L6_58 = A0_52
  L5_57 = A0_52._loadCutScene
  L5_57(L6_58)
  L5_57 = desktopWidget
  L6_58 = L5_57
  L5_57 = L5_57.getStaticWidget
  L7_59 = 14
  L5_57 = L5_57(L6_58, L7_59)
  L6_58 = L5_57
  L5_57 = L5_57.display
  L7_59 = false
  L5_57(L6_58, L7_59)
  L5_57, L6_58 = nil, nil
  if A3_55 == 1 then
    L5_57 = false
    L6_58 = false
  elseif A3_55 == 2 then
    L5_57 = false
    L6_58 = false
  elseif A3_55 == 3 then
    L5_57 = false
    L6_58 = true
  elseif A3_55 == 4 then
    L5_57 = false
    L6_58 = true
  elseif A3_55 == 5 then
    L5_57 = true
    L6_58 = true
  elseif A3_55 == 6 then
    L5_57 = true
    L6_58 = true
  elseif A3_55 == 7 then
    L5_57 = true
    L6_58 = false
  elseif A3_55 == 8 then
    L5_57 = true
    L6_58 = false
  end
  if A3_55 == 1 then
    A3_55 = 1
  elseif A3_55 == 2 then
    A3_55 = 2
  elseif A3_55 == 3 then
    A3_55 = 1
  elseif A3_55 == 4 then
    A3_55 = 2
  elseif A3_55 == 5 then
    A3_55 = 1
  elseif A3_55 == 6 then
    A3_55 = 2
  elseif A3_55 == 7 then
    A3_55 = 1
  elseif A3_55 == 8 then
    A3_55 = 2
  end
  if A1_53 == 1 then
  else
  end
  if A1_53 == 1 and L5_57 == false then
    if A2_54 == 61 then
    elseif A2_54 == 62 then
    elseif A2_54 == 63 then
    else
      if A2_54 == 64 then
      else
      end
    end
    L7_59 = desktopWidget
    L8_60 = L7_59
    L7_59 = L7_59.orderDesktopWidgetMode
    L9_61 = A2_54
    L7_59(L8_60, L9_61)
  else
  end
  L7_59 = 1
  if A2_54 ~= 64 then
    L8_60 = false
    while L8_60 == false do
      L9_61 = type
      L9_61 = L9_61(select(L7_59, ...))
      if L9_61 ~= "boolean" then
        L8_60 = true
      else
        L9_61 = select
        L9_61 = L9_61(L7_59, ...)
        if L9_61 == true then
          L7_59 = L7_59 + 1
        else
          L9_61 = select
          L9_61 = L9_61(L7_59, ...)
          if L9_61 == false then
            L7_59 = L7_59 + 1
          end
        end
      end
    end
    if L7_59 == 1 then
    else
      L7_59 = 2
    end
    L9_61 = L7_59
    L8_60 = false
    while L8_60 == false do
      if select(L7_59, ...) == nil then
        L8_60 = true
      else
        if type(select(L7_59, ...)) == "number" then
          if L9_61 == 1 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 2 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 3 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 4 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 5 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 6 then
            L9_61 = L9_61 + 1
          elseif L9_61 == 7 then
            L9_61 = L9_61 + 1
          else
            if L9_61 == 8 then
              L9_61 = L9_61 + 1
            else
            end
          end
        elseif type(select(L7_59, ...)) == "string" then
          if 1 == 1 then
          elseif 1 + 1 == 2 then
          elseif 1 + 1 + 1 == 3 then
          else
          end
        end
        L7_59 = L7_59 + 1
      end
    end
    if L7_59 == 1 then
    end
  end
  L8_60, L9_61 = nil, nil
  if A1_53 == 1 then
    if A3_55 == 1 then
      desktopWidget:showCutSceneSkip(A0_52)
    end
    L8_60, L9_61 = A0_52:_play(...)
  else
    L8_60, L9_61 = A0_52:_replay(...)
  end
  desktopWidget:getStaticWidget(14):display(false)
  if L8_60 == true and L6_58 == false then
    if A3_55 == 1 then
      desktopWidget:hideCutSceneSkip(A0_52)
    end
    desktopWidget:cancelDesktopWidgetMode(A2_54)
  elseif A3_55 == 1 then
    desktopWidget:hideCutSceneSkip(A0_52)
  end
  if L9_61 ~= nil then
  else
  end
  if A2_54 ~= 64 and L8_60 == true then
    worldMaster:_getMyPlayer():_waitForMapLoaded(nil)
  end
  return L8_60, L9_61
end
L0_0.startCutScene = L1_1
