require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceNMReward", "NpcBaseClass")
function PopulaceNMReward.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(3325, "populaceNMReward")
end
function PopulaceNMReward.eventTalkStep0(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14
  L5_6 = A0_1
  L4_5 = A0_1.startCliantTalkTurn
  L6_7 = 2
  L7_8 = A1_2
  L4_5(L5_6, L6_7, L7_8)
  if A2_3 == 1 then
  else
  end
  L5_6 = A0_1
  L4_5 = A0_1._runCharaScheduler
  L6_7 = 353964032
  L4_5(L5_6, L6_7)
  L5_6 = A0_1
  L4_5 = A0_1.say
  L6_7 = A0_1
  L7_8 = 1
  L8_9 = 0
  L4_5(L5_6, L6_7, L7_8, L8_9)
  while true do
    repeat
      while true do
        L5_6 = A0_1
        L4_5 = A0_1.askExtendWidget
        L6_7 = A0_1
        L7_8 = 37
        L8_9 = 7
        L9_10 = 1
        L10_11 = 1
        L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L10_11)
        if L4_5 == 1 then
          while true do
            L6_7 = A0_1
            L5_6 = A0_1.askExtendWidget
            L7_8 = A0_1
            L8_9 = 46
            L9_10 = 4
            L10_11 = 1
            L11_12 = 1
            L5_6 = L5_6(L6_7, L7_8, L8_9, L9_10, L10_11, L11_12)
            L6_7 = 0
            while true do
              while true do
                while true do
                  while true do
                    if L5_6 == 1 then
                      L7_8 = desktopWidget
                      L8_9 = L7_8
                      L7_8 = L7_8.askEventModeWidgetYield
                      L9_10 = "Ask/RewardSelectWidget"
                      L10_11 = 1
                      L11_12 = A0_1
                      L12_13 = 3
                      L13_14 = L6_7
                      L8_9 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, 4020010, 4030507, 4040109, 4070309, 4080007, 5020216, 5030110)
                      L6_7 = L8_9
                      if L8_9 == -1 then
                        L8_9 = 8
                      end
                      if L8_9 == 8 then
                        L10_11 = A0_1
                        L9_10 = A0_1.say
                        L11_12 = A0_1
                        L12_13 = 31
                        L13_14 = 0
                        L9_10(L10_11, L11_12, L12_13, L13_14)
                      elseif L8_9 == -3 then
                        L10_11 = A0_1
                        L9_10 = A0_1.say
                        L11_12 = A0_1
                        L12_13 = 22
                        L13_14 = 0
                        L9_10(L10_11, L11_12, L12_13, L13_14)
                        L10_11 = A0_1
                        L9_10 = A0_1._runCharaScheduler
                        L11_12 = 83955712
                        L9_10(L10_11, L11_12)
                        L8_9 = 8
                      else
                        L9_10 = L8_9
                        if L9_10 == 1 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 4020010, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 2 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 4030507, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 3 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 4040109, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 4 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 4070309, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 5 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 4080007, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 6 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 5020216, 10011151, 10)
                          break
                        else
                        end
                        if L9_10 == 7 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 17
                          L10_11(L11_12, L12_13, L13_14, 0, 5030110, 10011151, 10)
                          break
                        else
                        end
                        L10_11 = A0_1
                        L9_10 = A0_1.askExtendWidget
                        L11_12 = A0_1
                        L12_13 = 18
                        L13_14 = 2
                        L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, 1, 1)
                        if L9_10 == 1 then
                          L8_9 = L8_9 + 200
                        elseif L9_10 == -3 then
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 28
                          L10_11(L11_12, L12_13, L13_14, 0)
                          L8_9 = 299
                        else
                          L11_12 = A0_1
                          L10_11 = A0_1.say
                          L12_13 = A0_1
                          L13_14 = 28
                          L10_11(L11_12, L12_13, L13_14, 0)
                          L8_9 = 299
                        end
                      end
                      if L8_9 == 299 then
                      else
                        L10_11 = A0_1
                        L9_10 = A0_1.finishCliantTalkTurn
                        L9_10(L10_11)
                        return L8_9
                      end
                  end
                  elseif L5_6 == 2 then
                    L7_8 = desktopWidget
                    L8_9 = L7_8
                    L7_8 = L7_8.askEventModeWidgetYield
                    L9_10 = "Ask/RewardSelectWidget"
                    L10_11 = 1
                    L11_12 = A0_1
                    L12_13 = 3
                    L13_14 = L6_7
                    L8_9 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, 4020112, 4030407, 4040013, 4070214, 4080212, 5020111, 5030036)
                    L6_7 = L8_9
                    if L8_9 == -1 then
                      L8_9 = 8
                    end
                    if L8_9 == 8 then
                      L10_11 = A0_1
                      L9_10 = A0_1.say
                      L11_12 = A0_1
                      L12_13 = 31
                      L13_14 = 0
                      L9_10(L10_11, L11_12, L12_13, L13_14)
                    elseif L8_9 == -3 then
                      L10_11 = A0_1
                      L9_10 = A0_1.say
                      L11_12 = A0_1
                      L12_13 = 22
                      L13_14 = 0
                      L9_10(L10_11, L11_12, L12_13, L13_14)
                      L10_11 = A0_1
                      L9_10 = A0_1._runCharaScheduler
                      L11_12 = 83955712
                      L9_10(L10_11, L11_12)
                      L8_9 = 8
                    else
                      L9_10 = L8_9
                      if L9_10 == 1 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4020112, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 2 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4030407, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 3 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4040013, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 4 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4070214, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 5 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4080212, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 6 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 5020111, 10011152, 10)
                        break
                      else
                      end
                      if L9_10 == 7 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 5030036, 10011152, 10)
                        break
                      else
                      end
                      L10_11 = A0_1
                      L9_10 = A0_1.askExtendWidget
                      L11_12 = A0_1
                      L12_13 = 18
                      L13_14 = 2
                      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, 1, 1)
                      if L9_10 == 1 then
                        L8_9 = L8_9 + 207
                      elseif L9_10 == -3 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 28
                        L10_11(L11_12, L12_13, L13_14, 0)
                        L8_9 = 299
                      else
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 28
                        L10_11(L11_12, L12_13, L13_14, 0)
                        L8_9 = 299
                      end
                    end
                    if L8_9 == 299 then
                    else
                      L10_11 = A0_1
                      L9_10 = A0_1.finishCliantTalkTurn
                      L9_10(L10_11)
                      return L8_9
                    end
                  elseif L5_6 == 3 then
                    L7_8 = desktopWidget
                    L8_9 = L7_8
                    L7_8 = L7_8.askEventModeWidgetYield
                    L9_10 = "Ask/RewardSelectWidget"
                    L10_11 = 1
                    L11_12 = A0_1
                    L12_13 = 3
                    L13_14 = L6_7
                    L8_9 = L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, 4020407, 4030607, 4040507, 4070407, 4080507, 5020407, 5030407)
                    L6_7 = L8_9
                    if L8_9 == -1 then
                      L8_9 = 8
                    end
                    if L8_9 == 8 then
                      L10_11 = A0_1
                      L9_10 = A0_1.say
                      L11_12 = A0_1
                      L12_13 = 31
                      L13_14 = 0
                      L9_10(L10_11, L11_12, L12_13, L13_14)
                    elseif L8_9 == -3 then
                      L10_11 = A0_1
                      L9_10 = A0_1.say
                      L11_12 = A0_1
                      L12_13 = 22
                      L13_14 = 0
                      L9_10(L10_11, L11_12, L12_13, L13_14)
                      L10_11 = A0_1
                      L9_10 = A0_1._runCharaScheduler
                      L11_12 = 83955712
                      L9_10(L10_11, L11_12)
                      L8_9 = 8
                    else
                      L9_10 = L8_9
                      if L9_10 == 1 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4020407, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 2 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4030607, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 3 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4040507, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 4 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4070407, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 5 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 4080507, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 6 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 5020407, 10011154, 40)
                        break
                      else
                      end
                      if L9_10 == 7 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 17
                        L10_11(L11_12, L12_13, L13_14, 0, 5030407, 10011154, 40)
                        break
                      else
                      end
                      L10_11 = A0_1
                      L9_10 = A0_1.askExtendWidget
                      L11_12 = A0_1
                      L12_13 = 18
                      L13_14 = 2
                      L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, 1, 1)
                      if L9_10 == 1 then
                        L8_9 = L8_9 + 214
                      elseif L9_10 == -3 then
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 28
                        L10_11(L11_12, L12_13, L13_14, 0)
                        L8_9 = 299
                      else
                        L11_12 = A0_1
                        L10_11 = A0_1.say
                        L12_13 = A0_1
                        L13_14 = 28
                        L10_11(L11_12, L12_13, L13_14, 0)
                        L8_9 = 299
                      end
                    end
                    if L8_9 == 299 then
                    else
                      L10_11 = A0_1
                      L9_10 = A0_1.finishCliantTalkTurn
                      L9_10(L10_11)
                      return L8_9
                    end
                  elseif L5_6 == 4 then
                    L8_9 = A0_1
                    L7_8 = A0_1._runCharaScheduler
                    L9_10 = 84049920
                    L7_8(L8_9, L9_10)
                    L8_9 = A0_1
                    L7_8 = A0_1.say
                    L9_10 = A0_1
                    L10_11 = 2
                    L11_12 = 0
                    L7_8(L8_9, L9_10, L10_11, L11_12)
                    L5_6 = 4
                    L8_9 = A0_1
                    L7_8 = A0_1.finishCliantTalkTurn
                    L7_8(L8_9)
                    return L5_6
                  elseif L5_6 == -1 then
                    L8_9 = A0_1
                    L7_8 = A0_1._runCharaScheduler
                    L9_10 = 84049920
                    L7_8(L8_9, L9_10)
                    L8_9 = A0_1
                    L7_8 = A0_1.say
                    L9_10 = A0_1
                    L10_11 = 2
                    L11_12 = 0
                    L7_8(L8_9, L9_10, L10_11, L11_12)
                    L5_6 = 4
                    L8_9 = A0_1
                    L7_8 = A0_1.finishCliantTalkTurn
                    L7_8(L8_9)
                    return L5_6
                  elseif L5_6 == -3 then
                    L8_9 = A0_1
                    L7_8 = A0_1._runCharaScheduler
                    L9_10 = 84049920
                    L7_8(L8_9, L9_10)
                    L8_9 = A0_1
                    L7_8 = A0_1.say
                    L9_10 = A0_1
                    L10_11 = 2
                    L11_12 = 0
                    L7_8(L8_9, L9_10, L10_11, L11_12)
                    L5_6 = 4
                    L8_9 = A0_1
                    L7_8 = A0_1.finishCliantTalkTurn
                    L7_8(L8_9)
                    return L5_6
                  end
                end
              end
            end
          end
        end
      end
      if L4_5 == 2 then
        L5_6 = 0
        while true do
          while true do
            L6_7 = desktopWidget
            L7_8 = L6_7
            L6_7 = L6_7.askEventModeWidgetYield
            L8_9 = "Ask/RewardSelectWidget"
            L9_10 = 1
            L10_11 = A0_1
            L11_12 = 3
            L12_13 = L5_6
            L13_14 = 8011709
            L7_8 = L6_7(L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, 8031719, 8081209, 8090807, 8012201, 8030716, 8080817, 8091001, 8011903, 8030817, 8051016, 8090507)
            L5_6 = L7_8
            if L7_8 == -1 then
              L7_8 = 13
            end
            if L7_8 == 13 then
              L9_10 = A0_1
              L8_9 = A0_1.say
              L10_11 = A0_1
              L11_12 = 31
              L12_13 = 0
              L8_9(L9_10, L10_11, L11_12, L12_13)
            elseif L7_8 == -3 then
              L9_10 = A0_1
              L8_9 = A0_1.say
              L10_11 = A0_1
              L11_12 = 22
              L12_13 = 0
              L8_9(L9_10, L10_11, L11_12, L12_13)
              L9_10 = A0_1
              L8_9 = A0_1._runCharaScheduler
              L10_11 = 83955712
              L8_9(L9_10, L10_11)
              L7_8 = 13
            else
              L9_10 = A0_1
              L8_9 = A0_1._runCharaScheduler
              L10_11 = 69210112
              L8_9(L9_10, L10_11)
              L8_9 = L7_8
              if L8_9 == 1 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8011709, 10004230, 1)
                break
              else
              end
              if L8_9 == 2 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8031719, 10004231, 1)
                break
              else
              end
              if L8_9 == 3 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8081209, 10004232, 1)
                break
              else
              end
              if L8_9 == 4 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8090807, 10004241, 1)
                break
              else
              end
              if L8_9 == 5 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8012201, 10004233, 1)
                break
              else
              end
              if L8_9 == 6 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8030716, 10004234, 1)
                break
              else
              end
              if L8_9 == 7 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8080817, 10004235, 1)
                break
              else
              end
              if L8_9 == 8 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8091001, 10004240, 1)
                break
              else
              end
              if L8_9 == 9 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8011903, 10004236, 1)
                break
              else
              end
              if L8_9 == 10 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8030817, 10004237, 1)
                break
              else
              end
              if L8_9 == 11 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8051016, 10004238, 1)
                break
              else
              end
              if L8_9 == 12 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 17
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14, 8090507, 10004239, 1)
                break
              else
              end
              L9_10 = A0_1
              L8_9 = A0_1.askExtendWidget
              L10_11 = A0_1
              L11_12 = 18
              L12_13 = 2
              L13_14 = 1
              L8_9 = L8_9(L9_10, L10_11, L11_12, L12_13, L13_14, 1)
              if L8_9 == 1 then
                L7_8 = L7_8 + 100
              elseif L8_9 == -3 then
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 22
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14)
                L10_11 = A0_1
                L9_10 = A0_1._runCharaScheduler
                L11_12 = 83955712
                L9_10(L10_11, L11_12)
                L7_8 = 199
              else
                L10_11 = A0_1
                L9_10 = A0_1.say
                L11_12 = A0_1
                L12_13 = 22
                L13_14 = 0
                L9_10(L10_11, L11_12, L12_13, L13_14)
                L10_11 = A0_1
                L9_10 = A0_1._runCharaScheduler
                L11_12 = 83955712
                L9_10(L10_11, L11_12)
                L7_8 = 199
              end
            end
            if L7_8 == 199 then
            end
          end
          L9_10 = A0_1
          L8_9 = A0_1.finishCliantTalkTurn
          L8_9(L9_10)
          return L7_8
        end
      elseif L4_5 == 3 then
        L6_7 = A0_1
        L5_6 = A0_1._runCharaScheduler
        L7_8 = 353959936
        L5_6(L6_7, L7_8)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 23
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 24
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
      elseif L4_5 == 4 then
        L6_7 = A0_1
        L5_6 = A0_1._runCharaScheduler
        L7_8 = 353968128
        L5_6(L6_7, L7_8)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 29
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 30
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
      elseif L4_5 == 5 then
        L6_7 = A0_1
        L5_6 = A0_1._runCharaScheduler
        L7_8 = 353968128
        L5_6(L6_7, L7_8)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 25
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 26
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 27
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
      elseif L4_5 == 6 then
        L5_6 = false
        L6_7 = false
        L7_8 = false
        L8_9 = false
        L9_10 = false
        L10_11 = false
        L11_12 = A2_3
        if L11_12 == 0 then
          L5_6 = true
          L6_7 = false
          L7_8 = false
          L8_9 = false
          L9_10 = false
          L10_11 = true
          break
        else
        end
        if L11_12 == 1 then
          L5_6 = true
          L6_7 = true
          L7_8 = true
          L8_9 = true
          L9_10 = false
          L10_11 = true
          break
        else
        end
        if L11_12 == 2 then
          L5_6 = true
          L6_7 = true
          L7_8 = false
          L8_9 = false
          L9_10 = true
          L10_11 = true
          break
        else
        end
        L11_12 = false
        while true do
          while true do
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
                                  L13_14 = A0_1
                                  L12_13 = A0_1.askRestrictChoices
                                  L12_13 = L12_13(L13_14, A0_1, 51, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11)
                                  L13_14 = L12_13
                                  if L13_14 == 1 then
                                    A0_1:_runCharaScheduler(353959936)
                                    A0_1:say(A0_1, 45, 0)
                                    A0_1:say(A0_1, 33, 0)
                                    A0_1:say(A0_1, 34, 0)
                                    A0_1:say(A0_1, 35, 0)
                                    A0_1:say(A0_1, 36, 0)
                                until A2_3 > 0
                              end
                              else
                              end
                              if L13_14 == 2 then
                                A0_1:_runCharaScheduler(69210112)
                                A0_1:say(A0_1, 58, 0)
                                A0_1:say(A0_1, 59, 0)
                                A0_1:say(A0_1, 60, 0)
                                A0_1:_runCharaScheduler(83894272)
                                A0_1:say(A0_1, 61, 0)
                                A0_1:say(A0_1, 62, 0)
                                A0_1:say(A0_1, 63, 0)
                                if A2_3 == 1 then
                                  A0_1:say(A0_1, 64, 0)
                                  A0_1:say(A0_1, 65, 0)
                                  A0_1:_runCharaScheduler(354103296)
                                  A0_1:say(A0_1, 66, 0, 3)
                                  A0_1:say(A0_1, 67, 0)
                                end
                                A0_1:say(A0_1, 68, 0)
                                A0_1:say(A0_1, 69, 0)
                                A0_1:_runCharaScheduler(67600384)
                            end
                          until A2_3 == 2
                        end
                        else
                        end
                        if L13_14 == 3 then
                          A0_1:_runCharaScheduler(353968128)
                          A0_1:say(A0_1, 70, 0)
                          A0_1:say(A0_1, 71, 0)
                          A0_1:say(A0_1, 72, 0)
                          worldMaster:say(A0_1, 73)
                          A0_1:say(A0_1, 74, 0)
                      end
                      else
                      end
                      if L13_14 == 4 then
                        if A0_1:askExtendWidget(A0_1, 18, 2, 1, 1) == 1 then
                          return 300
                        end
                        if 300 == -3 then
                          L11_12 = true
                        end
                        L11_12 = true
                    end
                  end
                end
                else
                end
                if L13_14 == 5 then
                  A0_1:_runCharaScheduler(354082816)
                  A0_1:say(A0_1, 75, 0)
                  A0_1:say(A0_1, 76, 0)
                  A0_1:say(A0_1, 77, 0)
                  A0_1:say(A0_1, 78, 0)
                  A0_1:_runCharaScheduler(83955712)
                  break
                end
              end
              if L13_14 == 6 then
                L11_12 = true
              end
            end
          end
        end
      elseif L4_5 == 7 then
        L6_7 = A0_1
        L5_6 = A0_1._runCharaScheduler
        L7_8 = 84049920
        L5_6(L6_7, L7_8)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 2
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L6_7 = A0_1
        L5_6 = A0_1.finishCliantTalkTurn
        L5_6(L6_7)
        return L4_5
      elseif L4_5 == -3 then
        L6_7 = A0_1
        L5_6 = A0_1._runCharaScheduler
        L7_8 = 84049920
        L5_6(L6_7, L7_8)
        L6_7 = A0_1
        L5_6 = A0_1.say
        L7_8 = A0_1
        L8_9 = 2
        L9_10 = 0
        L5_6(L6_7, L7_8, L8_9, L9_10)
        L4_5 = 7
        L6_7 = A0_1
        L5_6 = A0_1.finishCliantTalkTurn
        L5_6(L6_7)
        return L4_5
      end
    until L11_12 == false
  end
  L5_6 = A0_1
  L4_5 = A0_1.finishCliantTalkTurn
  L4_5(L5_6)
end
function PopulaceNMReward.eventTalkStep0_1(A0_15, A1_16)
  A0_15:startCliantTalkTurn(2, A1_16)
  A0_15:say(A0_15, 21, 0)
  A0_15:_runCharaScheduler(354078720)
  A0_15:finishCliantTalkTurn()
end
function PopulaceNMReward.eventTalkStep0_2(A0_17, A1_18, A2_19)
  A0_17:startCliantTalkTurn(2, A1_18)
  if A2_19 == 1 then
    A0_17:say(A0_17, 79, 0)
    A0_17:say(A0_17, 80, 0)
    A0_17:say(A0_17, 81, 0)
    A0_17:_runCharaScheduler(68378624)
    desktopWidget:openPublicInformDialogWidget(worldMaster, 25248, 2001027, 1)
    worldMaster:notify(worldMaster, 25248, 2001027, 1)
  else
    A0_17:_runCharaScheduler(354000896)
    A0_17:say(A0_17, 82, 0, 3)
    A0_17:say(A0_17, 83, 0)
  end
  A0_17:finishCliantTalkTurn()
end
