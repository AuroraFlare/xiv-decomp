require("/Command/System/SystemCommandBaseClass")
_defineClass("BonusPointCommand", "SystemCommandBaseClass")
function BonusPointCommand.isDesktopCommandMode(A0_0)
  local L1_1
  L1_1 = true
  return L1_1
end
function BonusPointCommand.canFire(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function BonusPointCommand.operateUI(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9, A6_10, A7_11, A8_12, A9_13)
  local L10_14, L11_15, L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28
  L10_14 = A4_8 + A5_9
  L10_14 = L10_14 + A6_10
  L10_14 = L10_14 + A7_11
  L10_14 = L10_14 + A8_12
  L10_14 = L10_14 + A9_13
  L10_14 = A2_6 - L10_14
  L11_15 = desktopWidget
  L12_16 = L11_15
  L11_15 = L11_15.askEventModeWidgetYield
  L13_17 = "Ask/BonusPointAssignWidget"
  L14_18 = 7
  L15_19 = L10_14
  L16_20 = A3_7
  L17_21 = A4_8
  L18_22 = A5_9
  L19_23 = A6_10
  L20_24 = A7_11
  L21_25 = A8_12
  L22_26 = A9_13
  L18_22 = L11_15(L12_16, L13_17, L14_18, L15_19, L16_20, L17_21, L18_22, L19_23, L20_24, L21_25, L22_26)
  L19_23 = A4_8
  L20_24 = A5_9
  L21_25 = A6_10
  L22_26 = A7_11
  L23_27 = A8_12
  L24_28 = A9_13
  if L13_17 ~= nil and L13_17 >= 0 then
    L19_23 = A4_8 + L13_17
  end
  if L14_18 ~= nil and L14_18 >= 0 then
    L20_24 = A5_9 + L14_18
  end
  if L15_19 ~= nil and L15_19 >= 0 then
    L21_25 = A6_10 + L15_19
  end
  if L16_20 ~= nil and L16_20 >= 0 then
    L22_26 = A7_11 + L16_20
  end
  if L17_21 ~= nil and L17_21 >= 0 then
    L23_27 = A8_12 + L17_21
  end
  if L18_22 ~= nil and L18_22 >= 0 then
    L24_28 = A9_13 + L18_22
  end
  return L12_16, L19_23, L20_24, L21_25, L22_26, L23_27, L24_28
end
