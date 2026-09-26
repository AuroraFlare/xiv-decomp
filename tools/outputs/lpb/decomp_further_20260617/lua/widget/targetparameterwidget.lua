require("/Widget/WidgetBaseClass")
_defineClass("TargetParameterWidget", "WidgetBaseClass")
function TargetParameterWidget.init(A0_0)
  A0_0:initialWidget()
  A0_0:setDrawPriority(0)
end
function TargetParameterWidget.processBeforeShow(A0_1, A1_2)
  A0_1:setParameter()
  A0_1:setStatus()
  A0_1:setRank()
  return true
end
function TargetParameterWidget.processAfterHide(A0_3, A1_4)
  A0_3:initialWidget()
  return true
end
function TargetParameterWidget.updateAll(A0_5)
  A0_5:setParameter()
  A0_5:changeGauge(1, false)
  A0_5:setStatus()
  A0_5:setRank()
end
function TargetParameterWidget.updateHp(A0_6)
  A0_6:setParameter()
  A0_6:changeGauge(1, true)
end
function TargetParameterWidget.updateRank(A0_7)
  A0_7:setRank()
end
function TargetParameterWidget.updateStatus(A0_8)
  A0_8:setStatus()
end
function TargetParameterWidget.setParameter(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = "PRB_basis_newHpLarge"
  L2_11 = desktopWidget
  L3_12 = L2_11
  L2_11 = L2_11.getTargetGaugeMaxParameter
  L2_11 = L2_11(L3_12)
  L3_12 = desktopWidget
  L4_13 = L3_12
  L3_12 = L3_12.getTargetGaugeCurrentParameter
  L3_12 = L3_12(L4_13)
  L4_13 = desktopWidget
  L4_13 = L4_13.getCurrentTargetCharacter
  L4_13 = L4_13(L4_13)
  if L4_13 ~= nil and L4_13:isUndead() == true then
    L1_10 = "PRB_basis_newUdLarge"
    L3_12 = L2_11
  end
  A0_9:setHPMPTPMaximum(1, L2_11)
  A0_9:setHPMPTPValue(1, L3_12)
  A0_9:setName(L4_13)
  A0_9:setStyle("ProgressBar_HP", L1_10)
end
function TargetParameterWidget.setStatus(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21
  L3_17 = desktopWidget
  L3_17 = L3_17.getTargetStatusSlotLength
  L3_17 = L3_17(L4_18)
  if L3_17 <= 0 then
    L3_17 = 20
  end
  for L7_21 = 1, L3_17 do
    L1_15, L2_16 = desktopWidget:getTargetBufferStatus(L7_21)
    if L1_15 > 0 then
      A0_14:setIcon2(L7_21, L2_16)
      A0_14:setPopupHelpStatus(L7_21, L1_15)
    else
      A0_14:setIcon2(L7_21, 0)
    end
  end
end
function TargetParameterWidget.initialWidget(A0_22)
  A0_22:setHPMPTPMaximum(1, 0)
  A0_22:setHPMPTPValue(1, 0)
  A0_22:setName()
  A0_22:initialIcon()
  A0_22:setRank()
end
function TargetParameterWidget.setName(A0_23, A1_24)
  if A1_24 ~= nil then
    if desktopWidget:getTargetName() ~= "" then
      A0_23:setTextWorldMaster("TextBlock_Name", 10104, A1_24)
    else
      A0_23:setText("TextBlock_Name", 208)
    end
  end
end
function TargetParameterWidget.setRank(A0_25)
  local L1_26, L2_27
  L1_26 = desktopWidget
  L2_27 = L1_26
  L1_26 = L1_26.getCurrentTargetCharacter
  L1_26 = L1_26(L2_27)
  if L1_26 ~= nil then
    L2_27 = L1_26.isPlayer
    L2_27 = L2_27(L1_26)
    if L2_27 == false then
      L2_27 = L1_26.isPropertyEnabled
      L2_27 = L2_27(L1_26, 3)
      if L2_27 == true then
        L2_27 = L1_26.getBattalion
        L2_27 = L2_27(L1_26)
        if L2_27 ~= 1 then
          L2_27 = L1_26.getStateMainSkillLevel
          L2_27 = L2_27(L1_26)
          if L1_26:isNotoriousMonster() == true then
            A0_25:setText("TextBlock_LebelText", "??")
          else
            A0_25:setText("TextBlock_LebelText", tostring(L2_27))
          end
          A0_25:setVisibility("TextBlock_LebelText", true)
          return
        end
      end
    end
  end
  L2_27 = A0_25.setVisibility
  L2_27(A0_25, "TextBlock_LebelText", false)
end
function TargetParameterWidget.setHPMPTPMaximum(A0_28, A1_29, A2_30)
  if A1_29 == 1 then
    if A2_30 <= 0 or A2_30 == nil then
      A0_28:setHidden("ProgressBar_HP")
      A0_28:setMaximum("ProgressBar_HP", 0)
    else
      A0_28:setVisibility("ProgressBar_HP", true)
      A0_28:setMaximum("ProgressBar_HP", A2_30)
      do break end
      return
    end
  else
  end
end
function TargetParameterWidget.setHPMPTPValue(A0_31, A1_32, A2_33)
  if A1_32 == 1 then
    if A2_33 < 0 or A2_33 == nil then
      A0_31:setValue("ProgressBar_HP", 0)
    else
      A0_31:setValue("ProgressBar_HP", A2_33)
      do break end
      break
    end
  else
  end
  return
end
function TargetParameterWidget.changeGauge(A0_34, A1_35, A2_36)
  local L3_37, L4_38
  L3_37 = A1_35
  if L3_37 == 1 then
    if A2_36 then
      L4_38 = A0_34.sendControlCommand
      L4_38(A0_34, "ProgressBar_HP", "UILuaCommands.StartTargetHp")
    else
      L4_38 = A0_34.sendControlCommand
      L4_38(A0_34, "ProgressBar_HP", "UILuaCommands.StopTargetHp")
      L4_38 = A0_34.getValue
      L4_38 = L4_38(A0_34, "ProgressBar_HP")
      A0_34:setValue("ProgressBar_HP" .. ":StatusBar", L4_38)
      do break end
      break
    end
  else
  end
  return
end
function TargetParameterWidget.setIcon2(A0_39, A1_40, A2_41)
  local L3_42
  L3_42 = A0_39.getIconControlName
  L3_42 = L3_42(A0_39, A1_40)
  A0_39:setIcon(L3_42, A2_41)
  if A2_41 > 0 then
    A0_39:setVisibility(L3_42, true)
  else
    A0_39:setVisibility(L3_42, false)
  end
end
function TargetParameterWidget.initialIcon(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49
  L2_45 = desktopWidget
  L2_45 = L2_45.getTargetStatusSlotLength
  L2_45 = L2_45(L3_46)
  if L2_45 <= 0 then
    L2_45 = 20
  end
  for L6_49 = 1, L2_45 do
    L1_44 = A0_43:getIconControlName(L6_49)
    A0_43:setVisibility(L1_44, false)
    A0_43:setIcon(L1_44, 0)
  end
end
function TargetParameterWidget.isIconVisibled(A0_50, A1_51)
  local L2_52, L3_53
  L3_53 = A0_50
  L2_52 = A0_50.getVisibility
  return L2_52(L3_53, A0_50:getIconControlName(A1_51))
end
function TargetParameterWidget.setPopupHelpStatus(A0_54, A1_55, A2_56)
  local L3_57
  L3_57 = A0_54.getIconControlName
  L3_57 = L3_57(A0_54, A1_55)
  A0_54:setHelpParameter(L3_57, 1, 74701, A2_56)
end
function TargetParameterWidget.getIconControlName(A0_58, A1_59)
  return "IconControl_Buff_" .. tostring(A1_59)
end
