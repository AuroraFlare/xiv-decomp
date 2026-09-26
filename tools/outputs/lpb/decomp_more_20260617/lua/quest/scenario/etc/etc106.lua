require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc106", "ScenarioBaseClass")
function Etc106.initText(A0_0)
  A0_0:_loadTextDataPermanently(10416, "etc106")
end
function Etc106.processEventEpicStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 2
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 3
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 4
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 5
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 6
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A2_3
  L5_6 = A2_3.say
  L7_8 = A0_1
  L8_9 = 7
  L9_10 = 0
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L6_7 = A0_1
  L5_6 = A0_1.showQuestInfomation
  L5_6 = L5_6(L6_7)
  if L5_6 == 1 then
    L6_7 = false
    L7_8 = false
    L8_9 = false
    L9_10 = false
    L10_11 = false
    L11_12 = false
    L12_13 = false
    L13_14 = true
    L15_16 = A2_3
    L14_15 = A2_3.say
    L16_17 = A0_1
    L14_15(L15_16, L16_17, 12, 0)
    L15_16 = A2_3
    L14_15 = A2_3.say
    L16_17 = A0_1
    L14_15(L15_16, L16_17, 13, 0)
    L15_16 = A2_3
    L14_15 = A2_3.say
    L16_17 = A0_1
    L14_15(L15_16, L16_17, 14, 0)
    if A3_4 >= 1000 then
      L6_7 = true
      A3_4 = A3_4 - 1000
    end
    if A3_4 >= 100 then
      L7_8 = true
      A3_4 = A3_4 - 100
    end
    if A3_4 >= 10 then
      L8_9 = true
      A3_4 = A3_4 - 10
    end
    if A3_4 >= 1 then
      L9_10 = true
    end
    if A4_5 >= 100 then
      L10_11 = true
      A4_5 = A4_5 - 100
    end
    if A4_5 >= 10 then
      L11_12 = true
      A4_5 = A4_5 - 10
    end
    if A4_5 >= 1 then
      L12_13 = true
    end
    L14_15 = false
    L5_6 = 10
    while true do
      if L14_15 == false then
        L16_17 = A2_3
        L15_16 = A2_3.askRestrictChoices
        L15_16 = L15_16(L16_17, A0_1, 15, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14)
        L16_17 = L15_16
        if L16_17 == 1 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 29, 0)
            A2_3:say(A0_1, 30, 0)
            A2_3:say(A0_1, 31, 0)
            A2_3:say(A0_1, 32, 0)
            A2_3:say(A0_1, 33, 0)
            A2_3:say(A0_1, 34, 0)
            A2_3:say(A0_1, 35, 0)
            A2_3:say(A0_1, 36, 0, 1, 10100116)
            A2_3:say(A0_1, 37, 0, 1, 10100116)
            A2_3:say(A0_1, 38, 0)
            L5_6 = L5_6 + 1
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 2 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 49, 0)
            A2_3:say(A0_1, 50, 0)
            A2_3:say(A0_1, 51, 0)
            A2_3:say(A0_1, 52, 0)
            A2_3:say(A0_1, 53, 0)
            A2_3:say(A0_1, 54, 0)
            A2_3:say(A0_1, 55, 0)
            A2_3:say(A0_1, 36, 0, 2, 10100008)
            A2_3:say(A0_1, 56, 0, 2, 10100008)
            A2_3:say(A0_1, 57, 0)
            L5_6 = L5_6 + 2
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 3 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 39, 0)
            A2_3:say(A0_1, 40, 0)
            A2_3:say(A0_1, 41, 0)
            A2_3:say(A0_1, 42, 0)
            A2_3:say(A0_1, 43, 0)
            A2_3:say(A0_1, 44, 0)
            A2_3:say(A0_1, 45, 0)
            A2_3:say(A0_1, 46, 0)
            A2_3:say(A0_1, 36, 0, 3, 10100244)
            A2_3:say(A0_1, 47, 0, 3, 10100244)
            A2_3:say(A0_1, 48, 0)
            L5_6 = L5_6 + 3
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 4 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 58, 0)
            A2_3:say(A0_1, 59, 0)
            A2_3:say(A0_1, 60, 0)
            A2_3:say(A0_1, 61, 0)
            A2_3:say(A0_1, 62, 0)
            A2_3:say(A0_1, 63, 0)
            A2_3:say(A0_1, 64, 0)
            A2_3:say(A0_1, 36, 0, 4, 10100132)
            A2_3:say(A0_1, 65, 0, 4, 10100132)
            A2_3:say(A0_1, 66, 0)
            L5_6 = L5_6 + 4
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 5 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 67, 0)
            A2_3:say(A0_1, 68, 0)
            A2_3:say(A0_1, 69, 0)
            A2_3:say(A0_1, 70, 0)
            A2_3:say(A0_1, 71, 0)
            A2_3:say(A0_1, 72, 0)
            A2_3:say(A0_1, 73, 0)
            A2_3:say(A0_1, 74, 0)
            A2_3:say(A0_1, 36, 0, 5, 10100116)
            A2_3:say(A0_1, 75, 0, 5, 10100116)
            A2_3:say(A0_1, 76, 0)
            L5_6 = L5_6 + 5
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 6 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 77, 0)
            A0_1:startFadeOut(A1_2, 1)
            A0_1:_wait(1)
            A0_1:startFadeIn(A1_2, 1)
            A2_3:say(A0_1, 78, 0)
            A2_3:say(A0_1, 79, 0)
            A2_3:say(A0_1, 80, 0)
            A2_3:say(A0_1, 81, 0)
            A2_3:say(A0_1, 82, 0)
            A2_3:say(A0_1, 83, 0)
            A2_3:say(A0_1, 84, 0)
            A2_3:say(A0_1, 85, 0)
            A2_3:say(A0_1, 86, 0)
            A2_3:say(A0_1, 36, 0, 6, 10100032)
            A2_3:say(A0_1, 87, 0, 6, 10100032)
            A2_3:say(A0_1, 88, 0)
            L5_6 = L5_6 + 6
            L14_15 = true
            break
          end
          break
        else
        end
        if L16_17 == 7 then
          worldMaster:say(A0_1, 24, 0)
          worldMaster:say(A0_1, 25, 0)
          if A2_3:askExtendWidget(A0_1, 26, 2, 1, 1) == 1 then
            A2_3:say(A0_1, 89, 0)
            A0_1:startFadeOut(A1_2, 1)
            A0_1:_wait(1)
            A0_1:startFadeIn(A1_2, 1)
            A2_3:say(A0_1, 90, 0)
            A2_3:say(A0_1, 91, 0)
            A2_3:say(A0_1, 92, 0)
            A2_3:say(A0_1, 93, 0)
            A2_3:say(A0_1, 94, 0)
            A2_3:say(A0_1, 95, 0)
            A2_3:say(A0_1, 96, 0)
            A2_3:say(A0_1, 97, 0)
            A2_3:say(A0_1, 98, 0)
            A2_3:say(A0_1, 99, 0)
            A2_3:say(A0_1, 36, 0, 7, 10100120)
            A2_3:say(A0_1, 100, 0, 10100120)
            A2_3:say(A0_1, 101, 0)
            L5_6 = L5_6 + 7
            L14_15 = true
            break
          end
          do break end
          break
        end
        if L16_17 == 8 then
          L14_15 = true
          break
        end
        else
          L7_8 = A2_3
          L6_7 = A2_3.say
          L8_9 = A0_1
          L9_10 = 11
          L10_11 = 0
          L6_7(L7_8, L8_9, L9_10, L10_11)
        end
      end
    end
  return L5_6
end
function Etc106.processEventEpicStart_2nd(A0_18, A1_19, A2_20, A3_21, A4_22)
  local L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34
  L6_24 = A2_20
  L5_23 = A2_20.say
  L7_25 = A0_18
  L8_26 = 8
  L9_27 = 0
  L5_23(L6_24, L7_25, L8_26, L9_27)
  L6_24 = A2_20
  L5_23 = A2_20.say
  L7_25 = A0_18
  L8_26 = 9
  L9_27 = 0
  L5_23(L6_24, L7_25, L8_26, L9_27)
  L6_24 = A2_20
  L5_23 = A2_20.say
  L7_25 = A0_18
  L8_26 = 10
  L9_27 = 0
  L5_23(L6_24, L7_25, L8_26, L9_27)
  L6_24 = A0_18
  L5_23 = A0_18.showQuestInfomation
  L5_23 = L5_23(L6_24)
  if L5_23 == 1 then
    L6_24 = false
    L7_25 = false
    L8_26 = false
    L9_27 = false
    L10_28 = false
    L11_29 = false
    L12_30 = false
    L13_31 = true
    L15_33 = A2_20
    L14_32 = A2_20.say
    L16_34 = A0_18
    L14_32(L15_33, L16_34, 12, 0)
    L15_33 = A2_20
    L14_32 = A2_20.say
    L16_34 = A0_18
    L14_32(L15_33, L16_34, 13, 0)
    L15_33 = A2_20
    L14_32 = A2_20.say
    L16_34 = A0_18
    L14_32(L15_33, L16_34, 14, 0)
    if A3_21 >= 1000 then
      L6_24 = true
      A3_21 = A3_21 - 1000
    end
    if A3_21 >= 100 then
      L7_25 = true
      A3_21 = A3_21 - 100
    end
    if A3_21 >= 10 then
      L8_26 = true
      A3_21 = A3_21 - 10
    end
    if A3_21 >= 1 then
      L9_27 = true
    end
    if A4_22 >= 100 then
      L10_28 = true
      A4_22 = A4_22 - 100
    end
    if A4_22 >= 10 then
      L11_29 = true
      A4_22 = A4_22 - 10
    end
    if A4_22 >= 1 then
      L12_30 = true
    end
    L14_32 = false
    L5_23 = 10
    while true do
      if L14_32 == false then
        L16_34 = A2_20
        L15_33 = A2_20.askRestrictChoices
        L15_33 = L15_33(L16_34, A0_18, 15, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31)
        L16_34 = L15_33
        if L16_34 == 1 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 29, 0)
            A2_20:say(A0_18, 30, 0)
            A2_20:say(A0_18, 31, 0)
            A2_20:say(A0_18, 32, 0)
            A2_20:say(A0_18, 33, 0)
            A2_20:say(A0_18, 34, 0)
            A2_20:say(A0_18, 35, 0)
            A2_20:say(A0_18, 36, 0, 1, 10100116)
            A2_20:say(A0_18, 37, 0, 1, 10100116)
            A2_20:say(A0_18, 38, 0)
            L5_23 = L5_23 + 1
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 2 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 49, 0)
            A2_20:say(A0_18, 50, 0)
            A2_20:say(A0_18, 51, 0)
            A2_20:say(A0_18, 52, 0)
            A2_20:say(A0_18, 53, 0)
            A2_20:say(A0_18, 54, 0)
            A2_20:say(A0_18, 55, 0)
            A2_20:say(A0_18, 36, 0, 2, 10100008)
            A2_20:say(A0_18, 56, 0, 2, 10100008)
            A2_20:say(A0_18, 57, 0)
            L5_23 = L5_23 + 2
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 3 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 39, 0)
            A2_20:say(A0_18, 40, 0)
            A2_20:say(A0_18, 41, 0)
            A2_20:say(A0_18, 42, 0)
            A2_20:say(A0_18, 43, 0)
            A2_20:say(A0_18, 44, 0)
            A2_20:say(A0_18, 45, 0)
            A2_20:say(A0_18, 46, 0)
            A2_20:say(A0_18, 36, 0, 3, 10100244)
            A2_20:say(A0_18, 47, 0, 3, 10100244)
            A2_20:say(A0_18, 48, 0)
            L5_23 = L5_23 + 3
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 4 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 58, 0)
            A2_20:say(A0_18, 59, 0)
            A2_20:say(A0_18, 60, 0)
            A2_20:say(A0_18, 61, 0)
            A2_20:say(A0_18, 62, 0)
            A2_20:say(A0_18, 63, 0)
            A2_20:say(A0_18, 64, 0)
            A2_20:say(A0_18, 36, 0, 4, 10100132)
            A2_20:say(A0_18, 65, 0, 4, 10100132)
            A2_20:say(A0_18, 66, 0)
            L5_23 = L5_23 + 4
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 5 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 67, 0)
            A2_20:say(A0_18, 68, 0)
            A2_20:say(A0_18, 69, 0)
            A2_20:say(A0_18, 70, 0)
            A2_20:say(A0_18, 71, 0)
            A2_20:say(A0_18, 72, 0)
            A2_20:say(A0_18, 73, 0)
            A2_20:say(A0_18, 74, 0)
            A2_20:say(A0_18, 36, 0, 5, 10100116)
            A2_20:say(A0_18, 75, 0, 5, 10100116)
            A2_20:say(A0_18, 76, 0)
            L5_23 = L5_23 + 5
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 6 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 77, 0)
            A0_18:startFadeOut(A1_19, 1)
            A0_18:_wait(1)
            A0_18:startFadeIn(A1_19, 1)
            A2_20:say(A0_18, 78, 0)
            A2_20:say(A0_18, 79, 0)
            A2_20:say(A0_18, 80, 0)
            A2_20:say(A0_18, 81, 0)
            A2_20:say(A0_18, 82, 0)
            A2_20:say(A0_18, 83, 0)
            A2_20:say(A0_18, 84, 0)
            A2_20:say(A0_18, 85, 0)
            A2_20:say(A0_18, 86, 0)
            A2_20:say(A0_18, 36, 0, 6, 10100032)
            A2_20:say(A0_18, 87, 0, 6, 10100032)
            A2_20:say(A0_18, 88, 0)
            L5_23 = L5_23 + 6
            L14_32 = true
            break
          end
          break
        else
        end
        if L16_34 == 7 then
          worldMaster:say(A0_18, 24, 0)
          worldMaster:say(A0_18, 25, 0)
          if A2_20:askExtendWidget(A0_18, 26, 2, 1, 1) == 1 then
            A2_20:say(A0_18, 89, 0)
            A0_18:startFadeOut(A1_19, 1)
            A0_18:_wait(1)
            A0_18:startFadeIn(A1_19, 1)
            A2_20:say(A0_18, 90, 0)
            A2_20:say(A0_18, 91, 0)
            A2_20:say(A0_18, 92, 0)
            A2_20:say(A0_18, 93, 0)
            A2_20:say(A0_18, 94, 0)
            A2_20:say(A0_18, 95, 0)
            A2_20:say(A0_18, 96, 0)
            A2_20:say(A0_18, 97, 0)
            A2_20:say(A0_18, 98, 0)
            A2_20:say(A0_18, 99, 0)
            A2_20:say(A0_18, 36, 0, 7, 10100120)
            A2_20:say(A0_18, 100, 0, 10100120)
            A2_20:say(A0_18, 101, 0)
            L5_23 = L5_23 + 7
            L14_32 = true
            break
          end
          do break end
          break
        end
        if L16_34 == 8 then
          L14_32 = true
          break
        end
        else
          L7_25 = A2_20
          L6_24 = A2_20.say
          L8_26 = A0_18
          L9_27 = 11
          L10_28 = 0
          L6_24(L7_25, L8_26, L9_27, L10_28)
        end
      end
    end
  return L5_23
end
function Etc106.processEvent010_0(A0_35, A1_36, A2_37, A3_38, A4_39)
  local L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47, L13_48, L14_49, L15_50, L16_51
  L6_41 = A2_37
  L5_40 = A2_37.say
  L7_42 = A0_35
  L8_43 = 102
  L9_44 = 0
  L5_40(L6_41, L7_42, L8_43, L9_44)
  L5_40 = false
  L6_41 = false
  L7_42 = false
  L8_43 = false
  L9_44 = false
  L10_45 = false
  L11_46 = false
  L12_47 = true
  if A3_38 >= 1000 then
    L5_40 = true
    A3_38 = A3_38 - 1000
  end
  if A3_38 >= 100 then
    L6_41 = true
    A3_38 = A3_38 - 100
  end
  if A3_38 >= 10 then
    L7_42 = true
    A3_38 = A3_38 - 10
  end
  if A3_38 >= 1 then
    L8_43 = true
  end
  if A4_39 >= 100 then
    L9_44 = true
    A4_39 = A4_39 - 100
  end
  if A4_39 >= 10 then
    L10_45 = true
    A4_39 = A4_39 - 10
  end
  if A4_39 >= 1 then
    L11_46 = true
  end
  L13_48 = 0
  L14_49 = false
  while true do
    if L14_49 == false then
      L16_51 = A2_37
      L15_50 = A2_37.askRestrictChoices
      L15_50 = L15_50(L16_51, A0_35, 15, L5_40, L6_41, L7_42, L8_43, L9_44, L10_45, L11_46, L12_47)
      L16_51 = L15_50
      if L16_51 == 1 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 29, 0)
          A2_37:say(A0_35, 30, 0)
          A2_37:say(A0_35, 31, 0)
          A2_37:say(A0_35, 32, 0)
          A2_37:say(A0_35, 33, 0)
          A2_37:say(A0_35, 34, 0)
          A2_37:say(A0_35, 35, 0)
          A2_37:say(A0_35, 36, 0, 1, 10100116)
          A2_37:say(A0_35, 37, 0, 1, 10100116)
          A2_37:say(A0_35, 38, 0)
          L13_48 = L13_48 + 1
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 2 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 49, 0)
          A2_37:say(A0_35, 50, 0)
          A2_37:say(A0_35, 51, 0)
          A2_37:say(A0_35, 52, 0)
          A2_37:say(A0_35, 53, 0)
          A2_37:say(A0_35, 54, 0)
          A2_37:say(A0_35, 55, 0)
          A2_37:say(A0_35, 36, 0, 2, 10100008)
          A2_37:say(A0_35, 56, 0, 2, 10100008)
          A2_37:say(A0_35, 57, 0)
          L13_48 = L13_48 + 2
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 3 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 39, 0)
          A2_37:say(A0_35, 40, 0)
          A2_37:say(A0_35, 41, 0)
          A2_37:say(A0_35, 42, 0)
          A2_37:say(A0_35, 43, 0)
          A2_37:say(A0_35, 44, 0)
          A2_37:say(A0_35, 45, 0)
          A2_37:say(A0_35, 46, 0)
          A2_37:say(A0_35, 36, 0, 3, 10100244)
          A2_37:say(A0_35, 47, 0, 3, 10100244)
          A2_37:say(A0_35, 48, 0)
          L13_48 = L13_48 + 3
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 4 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 58, 0)
          A2_37:say(A0_35, 59, 0)
          A2_37:say(A0_35, 60, 0)
          A2_37:say(A0_35, 61, 0)
          A2_37:say(A0_35, 62, 0)
          A2_37:say(A0_35, 63, 0)
          A2_37:say(A0_35, 64, 0)
          A2_37:say(A0_35, 36, 0, 4, 10100132)
          A2_37:say(A0_35, 65, 0, 4, 10100132)
          A2_37:say(A0_35, 66, 0)
          L13_48 = L13_48 + 4
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 5 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 67, 0)
          A2_37:say(A0_35, 68, 0)
          A2_37:say(A0_35, 69, 0)
          A2_37:say(A0_35, 70, 0)
          A2_37:say(A0_35, 71, 0)
          A2_37:say(A0_35, 72, 0)
          A2_37:say(A0_35, 73, 0)
          A2_37:say(A0_35, 74, 0)
          A2_37:say(A0_35, 36, 0, 5, 10100116)
          A2_37:say(A0_35, 75, 0, 5, 10100116)
          A2_37:say(A0_35, 76, 0)
          L13_48 = L13_48 + 5
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 6 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 77, 0)
          A0_35:startFadeOut(A1_36, 1)
          A0_35:_wait(1)
          A0_35:startFadeIn(A1_36, 1)
          A2_37:say(A0_35, 78, 0)
          A2_37:say(A0_35, 79, 0)
          A2_37:say(A0_35, 80, 0)
          A2_37:say(A0_35, 81, 0)
          A2_37:say(A0_35, 82, 0)
          A2_37:say(A0_35, 83, 0)
          A2_37:say(A0_35, 84, 0)
          A2_37:say(A0_35, 85, 0)
          A2_37:say(A0_35, 86, 0)
          A2_37:say(A0_35, 36, 0, 6, 10100032)
          A2_37:say(A0_35, 87, 0, 6, 10100032)
          A2_37:say(A0_35, 88, 0)
          L13_48 = L13_48 + 6
          L14_49 = true
          break
        end
        break
      else
      end
      if L16_51 == 7 then
        worldMaster:say(A0_35, 24, 0)
        worldMaster:say(A0_35, 25, 0)
        if A2_37:askExtendWidget(A0_35, 26, 2, 1, 1) == 1 then
          A2_37:say(A0_35, 89, 0)
          A0_35:startFadeOut(A1_36, 1)
          A0_35:_wait(1)
          A0_35:startFadeIn(A1_36, 1)
          A2_37:say(A0_35, 90, 0)
          A2_37:say(A0_35, 91, 0)
          A2_37:say(A0_35, 92, 0)
          A2_37:say(A0_35, 93, 0)
          A2_37:say(A0_35, 94, 0)
          A2_37:say(A0_35, 95, 0)
          A2_37:say(A0_35, 96, 0)
          A2_37:say(A0_35, 97, 0)
          A2_37:say(A0_35, 98, 0)
          A2_37:say(A0_35, 99, 0)
          A2_37:say(A0_35, 36, 0, 7, 10100120)
          A2_37:say(A0_35, 100, 0, 10100120)
          A2_37:say(A0_35, 101, 0)
          L13_48 = L13_48 + 7
          L14_49 = true
          break
        end
        do break end
        break
      end
      if L16_51 == 8 then
        L14_49 = true
        break
      end
    end
  end
  return L13_48
end
function Etc106.processEvent010_1(A0_52, A1_53, A2_54, A3_55)
  local L4_56, L5_57, L6_58
  L5_57 = A2_54
  L4_56 = A2_54.say
  L6_58 = A0_52
  L4_56(L5_57, L6_58, 103, 0)
  L5_57 = A2_54
  L4_56 = A2_54.askExtendWidget
  L6_58 = A0_52
  L4_56 = L4_56(L5_57, L6_58, 104, 3, 1, 1)
  L5_57 = L4_56
  if L5_57 == 1 then
    L6_58 = 0
    if A3_55 == 1 then
      L6_58 = 10100116
      break
    else
    end
    if A3_55 == 2 then
      L6_58 = 10100008
      break
    else
    end
    if A3_55 == 3 then
      L6_58 = 10100244
      break
    else
    end
    if A3_55 == 4 then
      L6_58 = 10100132
      break
    else
    end
    if A3_55 == 5 then
      L6_58 = 10100116
      break
    else
    end
    if A3_55 == 6 then
      L6_58 = 10100032
      break
    else
    end
    if A3_55 == 7 then
      L6_58 = 10100120
      break
    else
    end
    A2_54:say(A0_52, 108, 0)
    A2_54:say(A0_52, 109, 0)
    A2_54:say(A0_52, 110, 0)
    A2_54:say(A0_52, 350, 0, A3_55, L6_58)
    A2_54:say(A0_52, 111, 0)
    break
  else
  end
  if L5_57 == 2 then
    L6_58 = A3_55
    if L6_58 == 1 then
      A2_54:say(A0_52, 336, 0)
      A2_54:say(A0_52, 337, 0)
      break
    else
    end
    if L6_58 == 2 then
      A2_54:say(A0_52, 340, 0)
      A2_54:say(A0_52, 341, 0)
      break
    else
    end
    if L6_58 == 3 then
      A2_54:say(A0_52, 338, 0)
      A2_54:say(A0_52, 339, 0)
      break
    else
    end
    if L6_58 == 4 then
      A2_54:say(A0_52, 342, 0)
      A2_54:say(A0_52, 343, 0)
      break
    else
    end
    if L6_58 == 5 then
      A2_54:say(A0_52, 344, 0)
      A2_54:say(A0_52, 345, 0)
      break
    else
    end
    if L6_58 == 6 then
      A2_54:say(A0_52, 346, 0)
      A2_54:say(A0_52, 347, 0)
      break
    else
    end
    if L6_58 == 7 then
      A2_54:say(A0_52, 348, 0)
      A2_54:say(A0_52, 349, 0)
      do break end
      break
    else
    end
  else
  end
  return
end
function Etc106.processEvent020(A0_59, A1_60, A2_61, A3_62, A4_63)
  local L5_64, L6_65
  L6_65 = A2_61
  L5_64 = A2_61.say
  L5_64(L6_65, A0_59, 112, 0)
  L6_65 = A2_61
  L5_64 = A2_61.say
  L5_64(L6_65, A0_59, 113, 0)
  L5_64 = 0
  L6_65 = 0
  if A4_63 == 0 then
    if A3_62 == 1 then
      L5_64 = 10100116
      break
    else
    end
    if A3_62 == 2 then
      L5_64 = 10100008
      break
    else
    end
    if A3_62 == 3 then
      L5_64 = 10100244
      break
    else
    end
    if A3_62 == 4 then
      L5_64 = 10100132
      break
    else
    end
    if A3_62 == 5 then
      L5_64 = 10100116
      break
    else
    end
    if A3_62 == 6 then
      L5_64 = 10100032
      break
    else
    end
    if A3_62 == 7 then
      L5_64 = 10100120
      break
    else
    end
    A2_61:say(A0_59, 114, 0, A3_62, L5_64)
    break
  else
  end
  if A4_63 == 1 then
    A2_61:say(A0_59, 115, 0)
    break
  else
  end
  if A4_63 == 2 then
    A2_61:say(A0_59, 116, 0)
    break
  else
  end
  if A4_63 == 3 then
    if A3_62 == 1 then
      L5_64 = 10100116
      break
    else
    end
    if A3_62 == 2 then
      L5_64 = 10100008
      break
    else
    end
    if A3_62 == 3 then
      L5_64 = 10100244
      break
    else
    end
    if A3_62 == 4 then
      L5_64 = 10100132
      break
    else
    end
    if A3_62 == 5 then
      L5_64 = 10100116
      break
    else
    end
    if A3_62 == 6 then
      L5_64 = 10100032
      break
    else
    end
    if A3_62 == 7 then
      L5_64 = 10100120
      break
    else
    end
    A2_61:say(A0_59, 114, 0, A3_62, L5_64)
    break
  else
  end
  if A4_63 == 4 then
    if A3_62 == 1 then
      L6_65 = 11000353
      break
    else
    end
    if A3_62 == 2 then
      L6_65 = 11000354
      break
    else
    end
    if A3_62 == 3 then
      L6_65 = 11000355
      break
    else
    end
    if A3_62 == 4 then
      L6_65 = 11000356
      break
    else
    end
    if A3_62 == 5 then
      L6_65 = 11000357
      break
    else
    end
    if A3_62 == 6 then
      L6_65 = 11000358
      break
    else
    end
    if A3_62 == 7 then
      L6_65 = 11000359
      break
    else
    end
    A2_61:say(A0_59, 117, 0, A3_62, L6_65)
    A0_59:startFadeOut(A1_60, 1)
    A0_59:_wait(1)
    A0_59:startFadeIn(A1_60, 1)
    A2_61:say(A0_59, 118, 0, L6_65)
    A2_61:say(A0_59, 119, 0)
    A2_61:say(A0_59, 120, 0)
    A2_61:say(A0_59, 121, 0)
    A2_61:say(A0_59, 122, 0)
    A2_61:say(A0_59, 123, 0)
    A2_61:say(A0_59, 124, 0)
    break
  else
  end
end
function Etc106.processEvent030_1(A0_66, A1_67, A2_68)
  A2_68:say(A0_66, 125, 0)
  A2_68:say(A0_66, 126, 0)
  A2_68:say(A0_66, 121, 0)
  A2_68:say(A0_66, 122, 0)
  A2_68:say(A0_66, 123, 0)
  A2_68:say(A0_66, 124, 0)
end
function Etc106.processEvent030_2(A0_69, A1_70, A2_71)
  A2_71:say(A0_69, 127, 0)
  A2_71:say(A0_69, 128, 0)
  A0_69:startFadeOut(A1_70, 1)
  A0_69:_wait(1)
  A0_69:startFadeIn(A1_70, 1)
  A2_71:say(A0_69, 129, 0)
  A2_71:say(A0_69, 130, 0)
  A2_71:say(A0_69, 131, 0)
  A2_71:say(A0_69, 132, 0)
  A2_71:say(A0_69, 133, 0)
  A2_71:say(A0_69, 134, 0)
end
function Etc106.processEvent040_1(A0_72, A1_73, A2_74)
  A2_74:say(A0_72, 135, 0)
  A2_74:say(A0_72, 136, 0)
  A2_74:say(A0_72, 137, 0)
  A2_74:say(A0_72, 138, 0)
  A2_74:say(A0_72, 139, 0)
  A2_74:say(A0_72, 140, 0)
  A2_74:say(A0_72, 141, 0)
end
function Etc106.processEvent040_2(A0_75, A1_76, A2_77)
  A2_77:say(A0_75, 142, 0)
  A2_77:say(A0_75, 143, 0)
  A0_75:startFadeOut(A1_76, 1)
  A0_75:_wait(1)
  A0_75:startFadeIn(A1_76, 1)
  A2_77:say(A0_75, 144, 0)
  A2_77:say(A0_75, 145, 0)
  A2_77:say(A0_75, 146, 0)
  A2_77:say(A0_75, 147, 0)
  A2_77:say(A0_75, 148, 0)
end
function Etc106.processEvent050_0(A0_78, A1_79, A2_80)
  A2_80:say(A0_78, 147, 0)
  A2_80:say(A0_78, 148, 0)
end
function Etc106.processEvent050_1(A0_81, A1_82, A2_83)
  A2_83:startCliantTalkTurn(2, A1_82)
  A2_83:say(A0_81, 149, 0)
  A2_83:_runCharaScheduler(354078720)
  A2_83:say(A0_81, 150, 0)
  A0_81:startFadeOut(A1_82, 1)
  A0_81:_wait(1)
  A0_81:startFadeIn(A1_82, 1)
  A2_83:say(A0_81, 151, 0)
  A2_83:say(A0_81, 152, 0)
  A2_83:_runCharaScheduler(353968128)
  A2_83:say(A0_81, 153, 0)
  A2_83:finishCliantTalkTurn()
end
function Etc106.processEvent055(A0_84, A1_85, A2_86)
  A2_86:startCliantTalkTurn(2, A1_85)
  A2_86:say(A0_84, 151, 0)
  A2_86:say(A0_84, 152, 0)
  A2_86:_runCharaScheduler(353968128)
  A2_86:say(A0_84, 153, 0)
  A2_86:finishCliantTalkTurn()
end
function Etc106.processEvent055_1(A0_87, A1_88, A2_89, A3_90)
  local L4_91
  L4_91 = 0
  if A3_90 == 1 then
    L4_91 = 3
    break
  else
  end
  if A3_90 == 2 then
    L4_91 = 3
    break
  else
  end
  if A3_90 == 3 then
    L4_91 = 2
    break
  else
  end
  if A3_90 == 4 then
    L4_91 = 1
    break
  else
  end
  if A3_90 == 5 then
    L4_91 = 1
    break
  else
  end
  if A3_90 == 6 then
    L4_91 = 2
    break
  else
  end
  if A3_90 == 7 then
    L4_91 = 2
    break
  else
  end
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 154, 0)
  A2_89:_runCharaScheduler(353968128)
  A2_89:say(A0_87, 155, 0)
  A2_89:say(A0_87, 160, 0)
  A2_89:_runCharaScheduler(353959936)
  A2_89:say(A0_87, 161, 0, A3_90)
  A2_89:say(A0_87, 162, 0)
  A2_89:say(A0_87, 163, 0)
  A2_89:_runCharaScheduler(354054144)
  A2_89:say(A0_87, 164, 0)
  A2_89:say(A0_87, 165, 0, L4_91)
  A2_89:_runCharaScheduler(69435392)
  A2_89:say(A0_87, 166, 0)
  A2_89:finishCliantTalkTurn()
end
function Etc106.processEvent060_0(A0_92, A1_93, A2_94, A3_95)
  local L4_96
  L4_96 = 0
  if A3_95 == 1 then
    L4_96 = 3
    break
  else
  end
  if A3_95 == 2 then
    L4_96 = 3
    break
  else
  end
  if A3_95 == 3 then
    L4_96 = 2
    break
  else
  end
  if A3_95 == 4 then
    L4_96 = 1
    break
  else
  end
  if A3_95 == 5 then
    L4_96 = 1
    break
  else
  end
  if A3_95 == 6 then
    L4_96 = 2
    break
  else
  end
  if A3_95 == 7 then
    L4_96 = 2
    break
  else
  end
  A2_94:startCliantTalkTurn(2, A1_93)
  A2_94:_runCharaScheduler(353959936)
  A2_94:say(A0_92, 156, 0)
  A2_94:say(A0_92, 157, 0)
  A0_92:startFadeOut(A1_93, 1)
  A0_92:_wait(1)
  A0_92:startFadeIn(A1_93, 1)
  A2_94:_runCharaScheduler(84045824)
  A2_94:say(A0_92, 158, 0)
  A2_94:_runCharaScheduler(69312512)
  A2_94:say(A0_92, 159, 0)
  A2_94:say(A0_92, 160, 0)
  A2_94:_runCharaScheduler(353959936)
  A2_94:say(A0_92, 161, 0, A3_95)
  A2_94:say(A0_92, 162, 0)
  A2_94:say(A0_92, 163, 0)
  A2_94:_runCharaScheduler(354054144)
  A2_94:say(A0_92, 164, 0)
  A2_94:say(A0_92, 165, 0, L4_96)
  A2_94:_runCharaScheduler(69435392)
  A2_94:say(A0_92, 166, 0)
  A2_94:finishCliantTalkTurn()
end
function Etc106.processEvent060_1(A0_97, A1_98, A2_99, A3_100, A4_101, A5_102, A6_103, A7_104)
  local L8_105, L9_106, L10_107, L11_108, L12_109, L13_110, L14_111, L15_112, L16_113, L17_114
  L9_106 = A2_99
  L8_105 = A2_99.startCliantTalkTurn
  L10_107 = 2
  L11_108 = A1_98
  L8_105(L9_106, L10_107, L11_108)
  L8_105 = false
  L9_106 = 0
  L10_107 = A3_100
  if L10_107 == 1 then
    L9_106 = 3
    break
  else
  end
  if L10_107 == 2 then
    L9_106 = 3
    break
  else
  end
  if L10_107 == 3 then
    L9_106 = 2
    break
  else
  end
  if L10_107 == 4 then
    L9_106 = 1
    break
  else
  end
  if L10_107 == 5 then
    L9_106 = 1
    break
  else
  end
  if L10_107 == 6 then
    L9_106 = 2
    break
  else
  end
  if L10_107 == 7 then
    L9_106 = 2
    break
  else
  end
  while true do
    repeat
      if L8_105 == false then
        L11_108 = A2_99
        L10_107 = A2_99.askExtendWidget
        L12_109 = A0_97
        L13_110 = 167
        L14_111 = 6
        L15_112 = 1
        L16_113 = 1
        L10_107 = L10_107(L11_108, L12_109, L13_110, L14_111, L15_112, L16_113)
        if L10_107 == -3 then
          L8_105 = true
        end
        L11_108 = L10_107
        if L11_108 == 1 then
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 354103296
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 174
          L16_113 = 0
          L17_114 = A3_100
          L12_109(L13_110, L14_111, L15_112, L16_113, L17_114)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 175
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 354054144
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 176
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 177
          L16_113 = 0
          L17_114 = L9_106
          L12_109(L13_110, L14_111, L15_112, L16_113, L17_114)
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 69435392
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 178
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L8_105 = true
          break
        else
        end
        if L11_108 == 2 then
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 353964032
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 179
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 180
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 181
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 84045824
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 182
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L8_105 = true
          break
        else
        end
        if L11_108 == 3 then
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 353959936
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 183
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 184
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 354103296
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 185
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L8_105 = true
          break
        else
        end
        if L11_108 == 4 then
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 353959936
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 186
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 187
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L13_110 = A2_99
          L12_109 = A2_99._runCharaScheduler
          L14_111 = 354000896
          L12_109(L13_110, L14_111)
          L13_110 = A2_99
          L12_109 = A2_99.say
          L14_111 = A0_97
          L15_112 = 188
          L16_113 = 0
          L12_109(L13_110, L14_111, L15_112, L16_113)
          L8_105 = true
          break
        else
        end
        if L11_108 == 5 then
          L12_109 = true
          L13_110 = true
          L14_111 = true
          L15_112 = true
          L16_113 = false
          while true do
            while true do
              while true do
                while true do
                  while true do
                    while true do
                      while true do
                        repeat
                          while true do
                            while true do
                              repeat
                                L17_114 = 0
                                if L9_106 == 1 then
                                  L17_114 = A2_99:askRestrictChoices(A0_97, 189, L12_109, L13_110, L14_111, L15_112)
                                  break
                                else
                                end
                                if L9_106 == 2 then
                                  L17_114 = A2_99:askRestrictChoices(A0_97, 325, L12_109, L13_110, L14_111, L15_112)
                                  break
                                else
                                end
                                if L9_106 == 3 then
                                  L17_114 = A2_99:askRestrictChoices(A0_97, 330, L12_109, L13_110, L14_111, L15_112)
                                  break
                                else
                                end
                                if L17_114 == 1 then
                                  if A4_101 == 1 then
                                    L16_113 = true
                                    A2_99:_runCharaScheduler(354107392)
                                    A2_99:say(A0_97, 198, 0)
                                    A2_99:finishCliantTalkTurn()
                                    return 10
                                  end
                                  A2_99:_runCharaScheduler(83894272)
                                  A2_99:say(A0_97, 197, 0)
                                  L16_113 = true
                              until A2_99:askExtendWidget(A0_97, 194, 2, 1, 1) == 1
                            end
                          end
                          else
                          end
                          if L17_114 == 2 then
                            if A5_102 == 1 then
                              L16_113 = true
                              A2_99:_runCharaScheduler(354107392)
                              A2_99:say(A0_97, 198, 0)
                              A2_99:finishCliantTalkTurn()
                              return 20
                            end
                            A2_99:_runCharaScheduler(83894272)
                            A2_99:say(A0_97, 197, 0)
                            L16_113 = true
                        until A2_99:askExtendWidget(A0_97, 194, 2, 1, 1) == 1
                      end
                    end
                    else
                    end
                    if L17_114 == 3 then
                      if A6_103 == 1 then
                        if A2_99:askExtendWidget(A0_97, 194, 2, 1, 1) == 1 then
                          L16_113 = true
                          A2_99:_runCharaScheduler(354107392)
                          A2_99:say(A0_97, 198, 0)
                          A2_99:finishCliantTalkTurn()
                          do return 30 end
                          A2_99:say(A0_97, 197, 0)
                          A2_99:_runCharaScheduler(83894272)
                          L16_113 = true
                          do break end
                          if L17_114 == 4 then
                            L16_113 = true
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
          do break end
          break
        end
        if L11_108 == 6 then
          L8_105 = true
          break
        end
      end
    until L16_113 == false
  end
  L11_108 = A2_99
  L10_107 = A2_99.finishCliantTalkTurn
  L10_107(L11_108)
end
function Etc106.processEvent070_0(A0_115, A1_116, A2_117, A3_118)
  A2_117:say(A0_115, 200, 0)
  A2_117:say(A0_115, 201, 0, A3_118)
  A2_117:say(A0_115, 202, 0, A3_118)
  A2_117:say(A0_115, 203, 0)
  A2_117:say(A0_115, 204, 0, A3_118)
  A2_117:say(A0_115, 205, 0)
  worldMaster:say(A0_115, 206, A3_118)
  worldMaster:say(A0_115, 207, A3_118)
  worldMaster:say(A0_115, 208, A3_118)
end
function Etc106.processEvent070_1(A0_119, A1_120, A2_121)
  A2_121:startCliantTalkTurn(2, A1_120)
  A2_121:_runCharaScheduler(353959936)
  A2_121:say(A0_119, 199, 0)
  A2_121:finishCliantTalkTurn()
end
function Etc106.processEvent080_0(A0_122, A1_123, A2_124, A3_125)
  if A3_125 == 1 then
    A2_124:say(A0_122, 212, 0)
    A2_124:say(A0_122, 213, 0)
    A2_124:say(A0_122, 214, 0)
    A2_124:say(A0_122, 215, 0)
    A2_124:say(A0_122, 216, 0)
    A2_124:say(A0_122, 217, 0)
    break
  else
  end
  if A3_125 == 2 then
    A2_124:say(A0_122, 230, 0)
    A2_124:say(A0_122, 231, 0)
    A2_124:say(A0_122, 232, 0)
    A2_124:say(A0_122, 233, 0)
    A2_124:say(A0_122, 234, 0)
    A2_124:say(A0_122, 235, 0)
    break
  else
  end
  if A3_125 == 3 then
    A2_124:say(A0_122, 218, 0)
    A2_124:say(A0_122, 219, 0)
    A2_124:say(A0_122, 220, 0)
    A2_124:say(A0_122, 221, 0)
    A2_124:say(A0_122, 222, 0)
    A2_124:say(A0_122, 223, 0)
    A2_124:say(A0_122, 224, 0)
    break
  else
  end
  if A3_125 == 4 then
    A2_124:say(A0_122, 225, 0)
    A2_124:say(A0_122, 226, 0)
    A2_124:say(A0_122, 227, 0)
    A2_124:say(A0_122, 228, 0)
    A2_124:say(A0_122, 229, 0)
    break
  else
  end
  if A3_125 == 5 then
    A2_124:say(A0_122, 236, 0)
    A2_124:say(A0_122, 237, 0)
    A2_124:say(A0_122, 238, 0)
    A2_124:say(A0_122, 239, 0)
    A2_124:say(A0_122, 240, 0)
    A2_124:say(A0_122, 241, 0)
    A2_124:say(A0_122, 242, 0)
    break
  else
  end
  if A3_125 == 6 then
    A2_124:say(A0_122, 243, 0)
    A2_124:say(A0_122, 244, 0)
    A2_124:say(A0_122, 245, 0)
    A2_124:say(A0_122, 246, 0)
    A2_124:say(A0_122, 247, 0)
    A2_124:say(A0_122, 248, 0)
    A2_124:say(A0_122, 249, 0)
    A2_124:say(A0_122, 250, 0)
    break
  else
  end
  if A3_125 == 7 then
    A2_124:say(A0_122, 251, 0)
    A2_124:say(A0_122, 252, 0)
    A2_124:say(A0_122, 253, 0)
    A2_124:say(A0_122, 254, 0)
    A2_124:say(A0_122, 255, 0)
    A2_124:say(A0_122, 256, 0)
    A2_124:say(A0_122, 257, 0)
    break
  else
  end
  A2_124:say(A0_122, 258, 0)
  A0_122:startFadeOut(A1_123, 1)
  A0_122:_wait(1)
  A0_122:startFadeIn(A1_123, 1)
  A2_124:say(A0_122, 259, 0)
  A2_124:say(A0_122, 260, 0)
  A0_122:startFadeOut(A1_123, 1)
  A0_122:_wait(1)
  A0_122:startFadeIn(A1_123, 1)
  A2_124:say(A0_122, 261, 0)
  A2_124:say(A0_122, 262, 0)
  A2_124:say(A0_122, 263, 0, A3_125)
  if A3_125 == 1 then
    A2_124:say(A0_122, 264, 0)
    A2_124:say(A0_122, 265, 0)
    A2_124:say(A0_122, 266, 0)
    A2_124:say(A0_122, 267, 0)
    A2_124:say(A0_122, 268, 0)
    worldMaster:say(A0_122, 269)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 2 then
    A2_124:say(A0_122, 277, 0)
    A2_124:say(A0_122, 278, 0)
    A2_124:say(A0_122, 279, 0)
    A2_124:say(A0_122, 280, 0)
    A2_124:say(A0_122, 281, 0)
    worldMaster:say(A0_122, 282)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 3 then
    A2_124:say(A0_122, 271, 0)
    A2_124:say(A0_122, 272, 0)
    A2_124:say(A0_122, 273, 0)
    A2_124:say(A0_122, 274, 0)
    A2_124:say(A0_122, 275, 0)
    worldMaster:say(A0_122, 276)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 4 then
    A2_124:say(A0_122, 283, 0)
    A2_124:say(A0_122, 284, 0)
    A2_124:say(A0_122, 285, 0)
    A2_124:say(A0_122, 286, 0)
    A2_124:say(A0_122, 287, 0)
    worldMaster:say(A0_122, 288)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 5 then
    A2_124:say(A0_122, 289, 0)
    A2_124:say(A0_122, 290, 0)
    A2_124:say(A0_122, 291, 0)
    A2_124:say(A0_122, 292, 0)
    A2_124:say(A0_122, 293, 0)
    worldMaster:say(A0_122, 294)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 6 then
    A2_124:say(A0_122, 295, 0)
    A2_124:say(A0_122, 296, 0)
    A2_124:say(A0_122, 297, 0)
    A2_124:say(A0_122, 298, 0)
    A2_124:say(A0_122, 299, 0)
    worldMaster:say(A0_122, 300)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
  if A3_125 == 7 then
    A2_124:say(A0_122, 301, 0)
    A2_124:say(A0_122, 302, 0)
    A2_124:say(A0_122, 303, 0)
    A2_124:say(A0_122, 304, 0)
    A2_124:say(A0_122, 305, 0)
    worldMaster:say(A0_122, 306)
    worldMaster:say(A0_122, 270, A3_125)
    worldMaster:say(A0_122, 335)
    break
  else
  end
end
function Etc106.processEvent080_1(A0_126, A1_127, A2_128, A3_129)
  A2_128:say(A0_126, 209, 0)
  A2_128:say(A0_126, 210, 0)
  A2_128:say(A0_126, 211, 0, A3_129)
end
function Etc106.processEvent085(A0_130, A1_131, A2_132, A3_133)
  A2_132:say(A0_130, 262, 0)
  A2_132:say(A0_130, 263, 0, A3_133)
  if A3_133 == 1 then
    A2_132:say(A0_130, 264, 0)
    A2_132:say(A0_130, 265, 0)
    A2_132:say(A0_130, 266, 0)
    A2_132:say(A0_130, 267, 0)
    A2_132:say(A0_130, 268, 0)
    worldMaster:say(A0_130, 269)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 2 then
    A2_132:say(A0_130, 277, 0)
    A2_132:say(A0_130, 278, 0)
    A2_132:say(A0_130, 279, 0)
    A2_132:say(A0_130, 280, 0)
    A2_132:say(A0_130, 281, 0)
    worldMaster:say(A0_130, 282)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 3 then
    A2_132:say(A0_130, 271, 0)
    A2_132:say(A0_130, 272, 0)
    A2_132:say(A0_130, 273, 0)
    A2_132:say(A0_130, 274, 0)
    A2_132:say(A0_130, 275, 0)
    worldMaster:say(A0_130, 276)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 4 then
    A2_132:say(A0_130, 283, 0)
    A2_132:say(A0_130, 284, 0)
    A2_132:say(A0_130, 285, 0)
    A2_132:say(A0_130, 286, 0)
    A2_132:say(A0_130, 287, 0)
    worldMaster:say(A0_130, 288)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 5 then
    A2_132:say(A0_130, 289, 0)
    A2_132:say(A0_130, 290, 0)
    A2_132:say(A0_130, 291, 0)
    A2_132:say(A0_130, 292, 0)
    A2_132:say(A0_130, 293, 0)
    worldMaster:say(A0_130, 294)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 6 then
    A2_132:say(A0_130, 295, 0)
    A2_132:say(A0_130, 296, 0)
    A2_132:say(A0_130, 297, 0)
    A2_132:say(A0_130, 298, 0)
    A2_132:say(A0_130, 299, 0)
    worldMaster:say(A0_130, 300)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
  if A3_133 == 7 then
    A2_132:say(A0_130, 301, 0)
    A2_132:say(A0_130, 302, 0)
    A2_132:say(A0_130, 303, 0)
    A2_132:say(A0_130, 304, 0)
    A2_132:say(A0_130, 305, 0)
    worldMaster:say(A0_130, 306)
    worldMaster:say(A0_130, 270, A3_133)
    worldMaster:say(A0_130, 335)
    break
  else
  end
end
function Etc106.processEvent090_0(A0_134, A1_135, A2_136, A3_137)
  A2_136:say(A0_134, 307, 0, A3_137)
end
function Etc106.processEvent090_1(A0_138, A1_139, A2_140)
  A2_140:say(A0_138, 116, 0)
end
function Etc106.processEvent090_2(A0_141, A1_142, A2_143)
  A2_143:say(A0_141, 308, 0)
  A2_143:say(A0_141, 309, 0)
  A2_143:say(A0_141, 310, 0)
  A2_143:say(A0_141, 311, 0)
  A2_143:say(A0_141, 312, 0)
  A2_143:say(A0_141, 313, 0)
  A2_143:say(A0_141, 314, 0)
  worldMaster:say(A0_141, 315)
  worldMaster:say(A0_141, 316)
  worldMaster:say(A0_141, 317)
  worldMaster:say(A0_141, 318)
end
function Etc106.processEvent095(A0_144, A1_145, A2_146)
  A2_146:say(A0_144, 319, 0)
  A2_146:say(A0_144, 320, 0)
  A2_146:say(A0_144, 321, 0)
  worldMaster:say(A0_144, 315)
  worldMaster:say(A0_144, 316)
  worldMaster:say(A0_144, 317)
  worldMaster:say(A0_144, 318)
end
function Etc106.processEvent100(A0_147, A1_148, A2_149, A3_150)
  A2_149:startCliantTalkTurn(2, A1_148)
  A2_149:say(A0_147, 322, 0)
  A2_149:say(A0_147, 323, 0)
  A0_147:startFadeOutCutSceneDefault(A1_148)
  A0_147:startNQCutScene("wpn0f010", 1, A3_150, A3_150)
  A0_147:startFadeInCutSceneDefault(A1_148)
  A2_149:say(A0_147, 324, 0, A3_150)
end
