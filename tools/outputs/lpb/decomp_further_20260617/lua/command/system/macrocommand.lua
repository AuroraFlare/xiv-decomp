require("/Command/System/SystemCommandBaseClass")
_defineClass("MacroCommand", "SystemCommandBaseClass")
function MacroCommand.canFire(A0_0, A1_1, A2_2, A3_3, A4_4, A5_5, A6_6, A7_7, A8_8, A9_9, A10_10)
  local L11_11
  if A2_2 <= 0 or A2_2 > 100 then
    L11_11 = false
    return L11_11
  end
  L11_11 = true
  return L11_11
end
function MacroCommand.fire(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19, A8_20, A9_21, A10_22)
  local L11_23, L12_24, L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31, L20_32
  L11_23 = A2_14 - 1
  L12_24 = L11_23 % 50
  L13_25 = _math
  L13_25 = L13_25.floor
  L14_26 = L12_24 / 10
  L13_25 = L13_25(L14_26)
  L13_25 = L13_25 + 1
  L14_26 = L12_24 % 10
  L14_26 = L14_26 + 1
  if L11_23 >= 50 then
    L14_26 = L14_26 + 10
  end
  L15_27 = 1
  for L19_31 = 1, 10 do
    L20_32 = desktopWidget
    L20_32 = L20_32._getUserMacroData
    L20_32 = L20_32(L20_32, L13_25, L14_26, L19_31)
    if L20_32 ~= "" and desktopWidget:executeTextCommand(L20_32, true, nil, L15_27) == true and desktopWidget:executeTextCommand(L20_32, true, nil, L15_27) ~= 1 then
      L15_27 = desktopWidget:executeTextCommand(L20_32, true, nil, L15_27)
    end
  end
  return L16_28
end
