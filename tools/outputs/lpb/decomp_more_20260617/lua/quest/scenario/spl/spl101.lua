require("/Quest/Scenario/Spl/Spl101_quest")
function Spl101.initText(A0_0)
  A0_0:_loadTextDataPermanently(10016, "spl101")
end
function Spl101.askEgg(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L1_2 = desktopWidget
  L2_3 = L1_2
  L1_2 = L1_2.askEventModeWidgetYield
  L3_4 = "Ask/EventItemSelectWidget"
  L4_5 = 11
  L5_6 = A0_1
  L6_7 = 201
  L7_8 = 10012001
  L8_9 = 10012002
  L9_10 = 10012003
  L10_11 = 10012004
  L11_12 = 10012022
  L12_13 = 10012024
  L13_14 = 10012025
  L14_15 = 10012026
  L12_13 = L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, 10012027, 10012028)
  L13_14, L14_15 = nil, nil
  if L1_2 == true and L2_3 == true then
    if L3_4 == 1 and L4_5 == 0 and L5_6 == 0 and L6_7 == 0 then
      L13_14 = 10012001
    elseif L3_4 == 0 and L4_5 == 1 and L5_6 == 0 and L6_7 == 0 then
      L13_14 = 10012002
    elseif L3_4 == 0 and L4_5 == 0 and L5_6 == 1 and L6_7 == 0 then
      L13_14 = 10012003
    elseif L3_4 == 0 and L4_5 == 0 and L5_6 == 0 and L6_7 == 1 then
      L13_14 = 10012004
    elseif L3_4 == 0 and L4_5 == 0 and L5_6 == 0 and L6_7 == 0 then
      L13_14 = 0
    end
    if L7_8 == 1 then
      L14_15 = true
    end
  else
    L2_3 = false
  end
  return L13_14, L8_9, L9_10, L10_11, L11_12, L12_13, L14_15, L2_3
end
