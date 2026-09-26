require("/Command/System/SystemCommandBaseClass")
_defineClass("TradeExecuteCommand", "SystemCommandBaseClass")
function TradeExecuteCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11
  L11_11 = false
  return L11_11
end
function TradeExecuteCommand.processTradeCommandOpenTray(A0_12, A1_13)
  return (desktopWidget:dictateOpenTradeWidget(A1_13))
end
function TradeExecuteCommand.processTradeCommandCloseTray(A0_14, A1_15)
  desktopWidget:dictateCloseTradeWidget(A1_15)
  return
end
function TradeExecuteCommand.processTradeCommandReply(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
  if A2_18 == "set" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 103, A3_19)
  elseif A2_18 == "back" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 101, A3_19)
  elseif A2_18 == "fix" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 112)
  elseif A2_18 == "targetfix" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 90)
  elseif A2_18 == "reedit" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 91)
  elseif A2_18 == "doedit" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 113)
  end
  if A2_18 == "noabort" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 211)
  elseif A2_18 == "noreedit" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 213)
  elseif A2_18 == "cantset" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 203, A3_19)
  elseif A2_18 == "cantback" then
    desktopWidget:dictateNoticeTradeWidget(A1_17, 201, A3_19)
  elseif A2_18 == "nosplit" then
  end
  if A2_18 == "failed" then
  end
  return true
end
function TradeExecuteCommand.processUpdateTradeCommandTrayData(A0_22, A1_23)
  local L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38
  L2_24 = false
  L3_25 = desktopWidget
  L4_26 = L3_25
  L3_25 = L3_25.checkReplyTradeWidget
  L5_27 = A1_23
  L8_30 = L3_25(L4_26, L5_27)
  L9_31 = nil
  L10_32 = type
  L11_33 = L3_25
  L10_32 = L10_32(L11_33)
  if L10_32 == "nil" then
    L10_32 = false
    L11_33 = -1
    L12_34 = 0
    return L10_32, L11_33, L12_34, L13_35, L14_36
  end
  if L3_25 == false then
    L10_32 = true
    L11_33 = -1
    L12_34 = 0
    return L10_32, L11_33, L12_34, L13_35, L14_36
  end
  L2_24 = true
  L10_32 = L4_26
  if L10_32 == 1 then
  else
    if L10_32 == 2 then
      break
    else
    end
    if L10_32 == 3 then
      L12_34 = A1_23
      L11_33 = A1_23._getExtendedTemporaryItem
      L11_33 = L11_33(L12_34, L13_35, L14_36)
      L9_31 = L11_33
      if L9_31 == nil then
        L4_26 = -1
        L2_24 = false
        do break end
        else
        end
        if L10_32 == 4 then
          L12_34 = A1_23
          L11_33 = A1_23._hasItemPackage
          L11_33 = L11_33(L12_34, L13_35)
          if L11_33 == true then
            L6_28 = 100
            L7_29 = 1
            L12_34 = A1_23
            L11_33 = A1_23._getItemPackageCapacity
            L11_33 = L11_33(L12_34, L13_35)
            L12_34 = nil
            for L16_38 = 1, L11_33 do
              L9_31 = A1_23:_getExtendedTemporaryItem(L6_28, L16_38)
              if L9_31 ~= nil and L9_31:_getCatalogID() == 1000001 then
                L7_29 = L16_38
                break
              end
            end
          end
          if L9_31 == nil then
            L4_26 = -1
            L2_24 = false
          else
          end
        elseif L10_32 == 11 then
        elseif L10_32 == 12 then
        else
          if L10_32 == 13 then
            break
          else
          end
          L4_26 = -1
          L2_24 = false
        end
      else
      end
  end
  L10_32 = L2_24
  L11_33 = L4_26
  L12_34 = L5_27
  L16_38 = L7_29
  return L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38
end
