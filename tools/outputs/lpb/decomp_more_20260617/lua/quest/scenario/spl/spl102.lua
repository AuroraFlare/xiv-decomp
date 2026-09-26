require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl102", "ScenarioBaseClass")
function Spl102.initText(A0_0)
  A0_0:_loadTextDataPermanently(10032, "spl102")
end
function Spl102.processEventStartSea(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A0_1:startFadeOut(A1_2, 1)
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  A2_3:_runCharaScheduler(84013056)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(83980288)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(354103296)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:_runCharaScheduler(354066432)
  A2_3:say(A0_1, 10, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(83959808)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0)
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 14, 0)
    A2_3:_runCharaScheduler(354107392)
    A2_3:say(A0_1, 15, 0)
    if A3_4 == true and A4_5 == true then
      A2_3:_runCharaScheduler(354041856)
      A2_3:say(A0_1, 16, 0)
    end
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 11, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Spl102.processEventStartFst(A0_6, A1_7, A2_8, A3_9, A4_10)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353959936)
  A2_8:say(A0_6, 90, 0)
  A0_6:startFadeOut(A1_7, 1)
  A0_6:_wait(1)
  A0_6:startFadeIn(A1_7, 1)
  A2_8:_runCharaScheduler(84013056)
  A2_8:say(A0_6, 91, 0)
  A2_8:say(A0_6, 92, 0)
  A2_8:_runCharaScheduler(83914752)
  A2_8:say(A0_6, 93, 0)
  A2_8:say(A0_6, 94, 0)
  A2_8:_runCharaScheduler(354103296)
  A2_8:say(A0_6, 95, 0)
  A2_8:_runCharaScheduler(353984512)
  A2_8:say(A0_6, 96, 0)
  A2_8:say(A0_6, 97, 0)
  if A0_6:showQuestInfomation() == 1 then
    A2_8:_runCharaScheduler(83959808)
    A2_8:say(A0_6, 99, 0)
    A2_8:say(A0_6, 100, 0)
    A2_8:_runCharaScheduler(353964032)
    A2_8:say(A0_6, 101, 0)
    A2_8:_runCharaScheduler(354107392)
    A2_8:say(A0_6, 102, 0)
    if A3_9 == true and A4_10 == true then
      A2_8:_runCharaScheduler(354041856)
      A2_8:say(A0_6, 103, 0)
    end
  else
    A2_8:_runCharaScheduler(354041856)
    A2_8:say(A0_6, 98, 0)
  end
  A2_8:finishCliantTalkTurn()
  return (A0_6:showQuestInfomation())
end
function Spl102.processEventStartWil(A0_11, A1_12, A2_13, A3_14, A4_15)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(353959936)
  A2_13:say(A0_11, 49, 0)
  A2_13:say(A0_11, 50, 0)
  A0_11:startFadeOut(A1_12, 1)
  A0_11:_wait(1)
  A0_11:startFadeIn(A1_12, 1)
  A2_13:_runCharaScheduler(84013056)
  A2_13:say(A0_11, 51, 0)
  A2_13:say(A0_11, 52, 0)
  A2_13:_runCharaScheduler(83980288)
  A2_13:say(A0_11, 53, 0)
  A2_13:say(A0_11, 54, 0)
  A2_13:_runCharaScheduler(354103296)
  A2_13:say(A0_11, 55, 0)
  A2_13:say(A0_11, 56, 0)
  A2_13:_runCharaScheduler(354066432)
  A2_13:say(A0_11, 57, 0)
  if A0_11:showQuestInfomation() == 1 then
    A2_13:_runCharaScheduler(83959808)
    A2_13:say(A0_11, 59, 0)
    A2_13:say(A0_11, 60, 0)
    A2_13:_runCharaScheduler(353964032)
    A2_13:say(A0_11, 61, 0)
    A2_13:_runCharaScheduler(354107392)
    A2_13:say(A0_11, 62, 0)
    if A3_14 == true and A4_15 == true then
      A2_13:_runCharaScheduler(354041856)
      A2_13:say(A0_11, 63, 0)
    end
  else
    A2_13:_runCharaScheduler(354041856)
    A2_13:say(A0_11, 58, 0)
  end
  A2_13:finishCliantTalkTurn()
  return (A0_11:showQuestInfomation())
end
function Spl102.processEventItemSelection(A0_16, A1_17, A2_18, A3_19, A4_20)
  local L5_21, L6_22, L7_23
  L6_22 = A2_18
  L5_21 = A2_18.startCliantTalkTurn
  L7_23 = 2
  L5_21(L6_22, L7_23, A1_17)
  L5_21 = {}
  L7_23 = A1_17
  L6_22 = A1_17.isMale
  L6_22 = L6_22(L7_23)
  if L6_22 == true then
    L6_22 = {
      L7_23,
      8032835,
      8032836,
      8051521,
      8051522,
      8051523,
      8081921,
      3020613
    }
    L7_23 = 8032834
    L5_21 = L6_22
  else
    L6_22 = {
      L7_23,
      8032838,
      8032839,
      8051524,
      8051525,
      8051526,
      8081922,
      3020613
    }
    L7_23 = 8032837
    L5_21 = L6_22
  end
  L6_22 = A3_19
  if L6_22 == 0 then
    L7_23 = A2_18._runCharaScheduler
    L7_23(A2_18, 83968000)
    L7_23 = A2_18.say
    L7_23(A2_18, A0_16, 17, 0)
    break
  else
  end
  if L6_22 == 1 then
    L7_23 = A2_18._runCharaScheduler
    L7_23(A2_18, 354099200)
    L7_23 = A2_18.say
    L7_23(A2_18, A0_16, 104, 0)
    break
  else
  end
  if L6_22 == 2 then
    L7_23 = A2_18._runCharaScheduler
    L7_23(A2_18, 353959936)
    L7_23 = A2_18.say
    L7_23(A2_18, A0_16, 64, 0)
    break
  else
  end
  while true do
    while true do
      while true do
        while true do
          while true do
            L7_23 = A2_18
            L6_22 = A2_18.askExtendWidget
            L6_22 = L6_22(L7_23, A0_16, 18, 3, 1, 1)
            if L6_22 == 1 then
              L7_23 = A3_19
              if L7_23 == 0 then
                A2_18:say(A0_16, 22, 0)
                break
              else
              end
              if L7_23 == 1 then
                A2_18:say(A0_16, 109, 0)
                break
              else
              end
              if L7_23 == 2 then
                A2_18:say(A0_16, 69, 0)
                break
              else
              end
              L7_23 = 0
              while true do
                while true do
                  L7_23 = desktopWidget:askEventModeWidgetYield("Ask/RewardSelectWidget", 1, A0_16, 19, L7_23, L5_21[1], L5_21[2], L5_21[3], L5_21[4], L5_21[5], L5_21[6], L5_21[7], L5_21[8])
                  if 9 == 9 then
                    if A3_19 == 0 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 31, 0)
                      break
                    else
                    end
                    if A3_19 == 1 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 118, 0)
                      break
                    else
                    end
                    if A3_19 == 2 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 78, 0)
                      break
                    else
                    end
                    A2_18:finishCliantTalkTurn()
                  elseif 9 == -3 then
                    if A3_19 == 0 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 31, 0)
                      break
                    else
                    end
                    if A3_19 == 1 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 118, 0)
                      break
                    else
                    end
                    if A3_19 == 2 then
                      A2_18:_runCharaScheduler(354041856)
                      A2_18:say(A0_16, 78, 0)
                      break
                    else
                    end
                    A2_18:finishCliantTalkTurn()
                  else
                    if 9 == 1 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 23, 0, L5_21[1], 10011253, 1)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 110, 0, L5_21[1], 10011253, 1)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 70, 0, L5_21[1], 10011253, 1)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 2 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 23, 0, L5_21[2], 10011253, 30)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 110, 0, L5_21[2], 10011253, 30)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 70, 0, L5_21[2], 10011253, 30)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 3 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 23, 0, L5_21[3], 10011253, 50)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 110, 0, L5_21[3], 10011253, 50)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 70, 0, L5_21[3], 10011253, 50)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 4 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 23, 0, L5_21[4], 10011253, 1)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 110, 0, L5_21[4], 10011253, 1)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 70, 0, L5_21[4], 10011253, 1)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 5 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 23, 0, L5_21[5], 10011253, 30)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 110, 0, L5_21[5], 10011253, 30)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353959936)
                        A2_18:say(A0_16, 70, 0, L5_21[5], 10011253, 30)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 6 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353964032)
                        A2_18:say(A0_16, 23, 0, L5_21[6], 10011253, 50)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353964032)
                        A2_18:say(A0_16, 110, 0, L5_21[6], 10011253, 50)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353964032)
                        A2_18:say(A0_16, 70, 0, L5_21[6], 10011253, 50)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    elseif 9 == 7 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(353968128)
                        A2_18:say(A0_16, 23, 0, L5_21[7], 10011253, 5)
                        A2_18:say(A0_16, 24, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(353968128)
                        A2_18:say(A0_16, 110, 0, L5_21[7], 10011253, 5)
                        A2_18:say(A0_16, 111, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(353968128)
                        A2_18:say(A0_16, 70, 0, L5_21[7], 10011253, 5)
                        A2_18:say(A0_16, 71, 0)
                        break
                      else
                      end
                    else
                      if 9 == 8 then
                        if A3_19 == 0 then
                          A2_18:_runCharaScheduler(353968128)
                          A2_18:say(A0_16, 23, 0, L5_21[8], 10011253, 1)
                          break
                        else
                        end
                        if A3_19 == 1 then
                          A2_18:_runCharaScheduler(353968128)
                          A2_18:say(A0_16, 110, 0, L5_21[8], 10011253, 1)
                          break
                        else
                        end
                        if A3_19 == 2 then
                          A2_18:_runCharaScheduler(353968128)
                          A2_18:say(A0_16, 70, 0, L5_21[8], 10011253, 1)
                        else
                        end
                      else
                      end
                    end
                    if A2_18:askExtendWidget(A0_16, 72, 2, 1, 1) == 1 then
                    elseif A2_18:askExtendWidget(A0_16, 72, 2, 1, 1) == -3 then
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 31, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 118, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 78, 0)
                        break
                      else
                      end
                    else
                      if A3_19 == 0 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 31, 0)
                        break
                      else
                      end
                      if A3_19 == 1 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 118, 0)
                        break
                      else
                      end
                      if A3_19 == 2 then
                        A2_18:_runCharaScheduler(354041856)
                        A2_18:say(A0_16, 78, 0)
                        break
                      else
                      end
                    end
                  end
                  if 199 == 199 then
                  end
                end
                return 199
              end
            elseif L6_22 == 2 then
              L7_23 = A3_19
              if L7_23 == 0 then
                A2_18:_runCharaScheduler(354103296)
                A2_18:say(A0_16, 35, 0)
              else
              end
              if L7_23 == 1 then
                A2_18:_runCharaScheduler(354103296)
                A2_18:say(A0_16, 122, 0)
                break
              end
              if L7_23 == 2 then
                A2_18:_runCharaScheduler(354103296)
                A2_18:say(A0_16, 82, 0)
              end
            elseif L6_22 == 3 then
              L7_23 = A2_18.finishCliantTalkTurn
              L7_23(A2_18)
              return L6_22
            elseif L6_22 == -3 then
              L7_23 = A2_18.finishCliantTalkTurn
              L7_23(A2_18)
              return L6_22
            end
          end
        end
      end
    end
  end
end
function Spl102.processEventNotEnough(A0_24, A1_25, A2_26, A3_27)
  A2_26:startCliantTalkTurn(2, A1_25)
  if A3_27 == 0 then
    A2_26:_runCharaScheduler(354041856)
    A2_26:say(A0_24, 32, 0)
    break
  else
  end
  if A3_27 == 1 then
    A2_26:_runCharaScheduler(354041856)
    A2_26:say(A0_24, 119, 0)
    break
  else
  end
  if A3_27 == 2 then
    A2_26:_runCharaScheduler(353968128)
    A2_26:say(A0_24, 79, 0)
    break
  else
  end
  A2_26:finishCliantTalkTurn()
end
function Spl102.processEventItemPossession(A0_28, A1_29, A2_30, A3_31)
  A2_30:startCliantTalkTurn(2, A1_29)
  if A3_31 == 0 then
    A2_30:_runCharaScheduler(354041856)
    A2_30:say(A0_28, 33, 0)
    break
  else
  end
  if A3_31 == 1 then
    A2_30:_runCharaScheduler(354041856)
    A2_30:say(A0_28, 120, 0)
    break
  else
  end
  if A3_31 == 2 then
    A2_30:_runCharaScheduler(353968128)
    A2_30:say(A0_28, 80, 0)
    break
  else
  end
  A2_30:finishCliantTalkTurn()
end
function Spl102.processEventQuestComplete(A0_32, A1_33, A2_34, A3_35)
  A2_34:startCliantTalkTurn(2, A1_33)
  if A3_35 == 0 then
    A2_34:_runCharaScheduler(353976320)
    A2_34:say(A0_32, 29, 0)
    break
  else
  end
  if A3_35 == 1 then
    A2_34:_runCharaScheduler(353964032)
    A2_34:say(A0_32, 116, 0)
    break
  else
  end
  if A3_35 == 2 then
    A2_34:_runCharaScheduler(353959936)
    A2_34:say(A0_32, 76, 0)
    break
  else
  end
  A2_34:finishCliantTalkTurn()
end
function Spl102.processEventItemTrade(A0_36, A1_37, A2_38, A3_39)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:_runCharaScheduler(354107392)
  A0_36:_wait(2.5)
  if A3_39 == 0 then
    A2_38:say(A0_36, 30, 0)
    break
  else
  end
  if A3_39 == 1 then
    A2_38:say(A0_36, 117, 0)
    break
  else
  end
  if A3_39 == 2 then
    A2_38:say(A0_36, 77, 0)
    break
  else
  end
  A2_38:finishCliantTalkTurn()
end
function Spl102.processEventFullCapacity(A0_40, A1_41, A2_42, A3_43)
  A2_42:startCliantTalkTurn(2, A1_41)
  if A3_43 == 0 then
    A2_42:_runCharaScheduler(354041856)
    A2_42:say(A0_40, 34, 0)
    break
  else
  end
  if A3_43 == 1 then
    A2_42:_runCharaScheduler(354041856)
    A2_42:say(A0_40, 121, 0)
    break
  else
  end
  if A3_43 == 2 then
    A2_42:_runCharaScheduler(353968128)
    A2_42:say(A0_40, 81, 0)
    break
  else
  end
  A2_42:finishCliantTalkTurn()
end
function Spl102.processEventBdanceBeforeOfferSea(A0_44, A1_45, A2_46, A3_47)
  A2_46:startCliantTalkTurn(2, A1_45)
  if A3_47 == 2 then
    A2_46:_runCharaScheduler(84103168)
    A2_46:say(A0_44, 36, 0)
    A2_46:_waitForCharaSchedulerFinished(84103168)
    A2_46:_runCharaScheduler(83906560)
    A2_46:say(A0_44, 37, 0)
  elseif A3_47 == 1 then
    A2_46:_runCharaScheduler(84103168)
    A2_46:say(A0_44, 38, 0)
    A2_46:_waitForCharaSchedulerFinished(84103168)
    A2_46:_runCharaScheduler(83906560)
    A2_46:say(A0_44, 39, 0)
  else
    A2_46:_runCharaScheduler(84103168)
    A2_46:say(A0_44, 40, 0)
    A2_46:_waitForCharaSchedulerFinished(84103168)
    A2_46:_runCharaScheduler(83906560)
    A2_46:say(A0_44, 41, 0)
  end
  A2_46:finishCliantTalkTurn()
end
function Spl102.processEventBdanceBeforeOfferFst(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:_runCharaScheduler(353959936)
  A2_50:say(A0_48, 123, 0)
  A2_50:finishCliantTalkTurn()
end
function Spl102.processEventBdanceBeforeOfferWil(A0_51, A1_52, A2_53)
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:_runCharaScheduler(353959936)
  A2_53:say(A0_51, 83, 0)
  A2_53:finishCliantTalkTurn()
end
function Spl102.processEventBdanceAfterOfferSea(A0_54, A1_55, A2_56)
  A2_56:startCliantTalkTurn(2, A1_55)
  A2_56:_runCharaScheduler(83980288)
  A2_56:say(A0_54, 42, 0)
  A2_56:_waitForCharaSchedulerFinished(83980288)
  A2_56:_runCharaScheduler(84103168)
  A2_56:say(A0_54, 43, 0)
  A2_56:_waitForCharaSchedulerFinished(84103168)
  A2_56:say(A0_54, 44, 0)
  A2_56:_runCharaScheduler(100888576)
  A0_54:_wait(3.5)
  A2_56:say(A0_54, 45, 0)
  A2_56:say(A0_54, 46, 0)
  A2_56:say(A0_54, 47, 0)
  A2_56:finishCliantTalkTurn()
end
function Spl102.processEventBdanceAfterOfferFst(A0_57, A1_58, A2_59)
  A2_59:startCliantTalkTurn(2, A1_58)
  A2_59:_runCharaScheduler(353964032)
  A2_59:say(A0_57, 124, 0)
  A2_59:_runCharaScheduler(84008960)
  A2_59:say(A0_57, 125, 0)
  A2_59:say(A0_57, 126, 0)
  A2_59:_runCharaScheduler(100888576)
  A0_57:_wait(2.5)
  A2_59:say(A0_57, 127, 0)
  A2_59:say(A0_57, 128, 0)
  A2_59:say(A0_57, 129, 0)
  A2_59:finishCliantTalkTurn()
end
function Spl102.processEventBdanceAfterOfferWil(A0_60, A1_61, A2_62)
  A2_62:startCliantTalkTurn(2, A1_61)
  A2_62:_runCharaScheduler(353968128)
  A2_62:say(A0_60, 84, 0)
  A2_62:_runCharaScheduler(84008960)
  A2_62:say(A0_60, 85, 0)
  A2_62:say(A0_60, 86, 0)
  A2_62:_runCharaScheduler(100888576)
  A0_60:_wait(2.5)
  A2_62:say(A0_60, 87, 0)
  A2_62:say(A0_60, 88, 0)
  A2_62:say(A0_60, 89, 0)
  A2_62:finishCliantTalkTurn()
end
function Spl102.processEventNashuTalk(A0_63, A1_64, A2_65, A3_66)
  A2_65:startCliantTalkTurn(2, A1_64)
  A2_65:_runCharaScheduler(84082688)
  A2_65:say(A0_63, 48, 0)
  A2_65:_waitForCharaSchedulerFinished(84082688)
  if A3_66 == 1 then
    A2_65:_runCharaScheduler(83976192)
    A2_65:say(A0_63, 130, 0)
  end
  A2_65:finishCliantTalkTurn()
end
