require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl0i1", "ScenarioBaseClass")
function Spl0i1.initText(A0_0)
  A0_0:_loadTextDataPermanently(5683, "spl0i1")
end
function Spl0i1.processEventSUMFESStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 == 0 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 1, 0)
    A0_1:startFadeOut(A1_2, 1)
    A0_1:_wait(1)
    A0_1:startFadeIn(A1_2, 1)
    A2_3:say(A0_1, 2, 0)
    A2_3:_runCharaScheduler(84013056)
    A0_1:_wait(2)
    A2_3:say(A0_1, 3, 0)
    A2_3:_runCharaScheduler(354000896)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 6, 0)
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 106, 0)
    break
  else
  end
  if A3_4 == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 42, 0)
    A0_1:startFadeOut(A1_2, 1)
    A0_1:_wait(1)
    A0_1:startFadeIn(A1_2, 1)
    A2_3:say(A0_1, 43, 0)
    A2_3:_runCharaScheduler(84013056)
    A0_1:_wait(2)
    A2_3:say(A0_1, 44, 0)
    A2_3:_runCharaScheduler(354000896)
    A2_3:say(A0_1, 45, 0)
    A2_3:say(A0_1, 46, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 47, 0)
    A2_3:say(A0_1, 107, 0)
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 48, 0)
    break
  else
  end
  if A3_4 == 2 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 69, 0)
    A0_1:startFadeOut(A1_2, 1)
    A0_1:_wait(1)
    A0_1:startFadeIn(A1_2, 1)
    A2_3:say(A0_1, 70, 0)
    A2_3:_runCharaScheduler(84013056)
    A0_1:_wait(2)
    A2_3:say(A0_1, 71, 0)
    A2_3:_runCharaScheduler(354000896)
    A2_3:say(A0_1, 72, 0)
    A2_3:say(A0_1, 73, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 74, 0)
    A2_3:say(A0_1, 110, 0)
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 75, 0)
    break
  else
  end
  if A0_1:showQuestInfomation() == 1 then
    if A3_4 == 0 then
      A2_3:_runCharaScheduler(83959808)
      A2_3:say(A0_1, 9, 0)
      A2_3:_runCharaScheduler(353980416)
      A2_3:say(A0_1, 10, 0)
      A2_3:say(A0_1, 11, 0)
      A2_3:_runCharaScheduler(353964032)
      A2_3:say(A0_1, 12, 0)
      A2_3:_runCharaScheduler(354107392)
      A2_3:say(A0_1, 13, 0)
      break
    else
    end
    if A3_4 == 1 then
      A2_3:_runCharaScheduler(83959808)
      A2_3:say(A0_1, 50, 0)
      A2_3:_runCharaScheduler(353980416)
      A2_3:say(A0_1, 51, 0)
      A2_3:say(A0_1, 108, 0)
      A2_3:say(A0_1, 52, 0)
      A2_3:_runCharaScheduler(353964032)
      A2_3:say(A0_1, 53, 0)
      A2_3:_runCharaScheduler(354107392)
      A2_3:say(A0_1, 54, 0)
      break
    else
    end
    if A3_4 == 2 then
      A2_3:_runCharaScheduler(83959808)
      A2_3:say(A0_1, 77, 0)
      A2_3:say(A0_1, 111, 0)
      A2_3:_runCharaScheduler(353980416)
      A2_3:say(A0_1, 78, 0)
      A2_3:say(A0_1, 79, 0)
      A2_3:_runCharaScheduler(353964032)
      A2_3:say(A0_1, 80, 0)
      A2_3:_runCharaScheduler(354107392)
      A2_3:say(A0_1, 81, 0)
      break
    else
    end
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    if A3_4 == 0 then
      A2_3:_runCharaScheduler(354041856)
      A2_3:say(A0_1, 8, 0)
      break
    else
    end
    if A3_4 == 1 then
      A2_3:_runCharaScheduler(354058240)
      A2_3:say(A0_1, 49, 0)
      break
    else
    end
    if A3_4 == 2 then
      A2_3:_runCharaScheduler(84017152)
      A2_3:say(A0_1, 76, 0)
      break
    else
    end
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Spl0i1.processEventSUMFES001(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10)
  local L6_11, L7_12
  L7_12 = A2_7
  L6_11 = A2_7.startCliantTalkTurn
  L6_11(L7_12, 2, A1_6)
  if A3_8 == 0 then
    L6_11 = A4_9
    if L6_11 == 0 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 83968000)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 14, 0)
      break
    else
    end
    if L6_11 == 1 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 354099200)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 55, 0)
      break
    else
    end
    if L6_11 == 2 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 353959936)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 82, 0)
      break
    else
    end
  else
    L6_11 = A4_9
    if L6_11 == 0 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 354103296)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 34, 0)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 35, 0)
      break
    else
    end
    if L6_11 == 1 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 354103296)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 66, 0)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 67, 0)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 109, 0)
      break
    else
    end
    if L6_11 == 2 then
      L7_12 = A2_7._runCharaScheduler
      L7_12(A2_7, 354103296)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 93, 0)
      L7_12 = A2_7.say
      L7_12(A2_7, A0_5, 94, 0)
      break
    else
    end
  end
  while true do
    while true do
      while true do
        while true do
          while true do
            while true do
              L7_12 = A2_7
              L6_11 = A2_7.askExtendWidget
              L6_11 = L6_11(L7_12, A0_5, 15, 4, 1, 1)
              if L6_11 == 1 then
                L7_12 = 0
                while true do
                  while true do
                    L7_12 = desktopWidget:askEventModeWidgetYield("Ask/RewardSelectWidget", 1, A0_5, 20, L7_12, 3020604, 3020605, 3020606, 10012018, 10012019, 10012020, 10012021)
                    if 8 == 8 then
                      if A4_9 == 0 then
                        A2_7:_runCharaScheduler(353959936)
                        A2_7:say(A0_5, 30, 0)
                        break
                      else
                      end
                      if A4_9 == 1 then
                        A2_7:_runCharaScheduler(353959936)
                        A2_7:say(A0_5, 62, 0)
                        break
                      else
                      end
                      if A4_9 == 2 then
                        A2_7:_runCharaScheduler(84041728)
                        A2_7:say(A0_5, 89, 0)
                        break
                      else
                      end
                    elseif 8 == -3 then
                      if A4_9 == 0 then
                        A2_7:_runCharaScheduler(353959936)
                        A2_7:say(A0_5, 30, 0)
                        break
                      else
                      end
                      if A4_9 == 1 then
                        A2_7:_runCharaScheduler(353959936)
                        A2_7:say(A0_5, 62, 0)
                        break
                      else
                      end
                      if A4_9 == 2 then
                        A2_7:_runCharaScheduler(84041728)
                        A2_7:say(A0_5, 89, 0)
                        break
                      else
                      end
                    else
                      if 8 == 1 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 23, 0, 3020604, 10012014, 1)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 58, 0, 3020604, 10012014, 1)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 85, 0, 3020604, 10012014, 1)
                          break
                        else
                        end
                      elseif 8 == 2 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 23, 0, 3020605, 10012016, 1)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 58, 0, 3020605, 10012016, 1)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 85, 0, 3020605, 10012016, 1)
                          break
                        else
                        end
                      elseif 8 == 3 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 23, 0, 3020606, 10012015, 1)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 58, 0, 3020606, 10012015, 1)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 85, 0, 3020606, 10012015, 1)
                          break
                        else
                        end
                      elseif 8 == 4 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 23, 0, 10012018, 10012014, 3)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 58, 0, 10012018, 10012014, 3)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 85, 0, 10012018, 10012014, 3)
                          break
                        else
                        end
                      elseif 8 == 5 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 23, 0, 10012019, 10012015, 3)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 58, 0, 10012019, 10012015, 3)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 85, 0, 10012019, 10012015, 3)
                          break
                        else
                        end
                      elseif 8 == 6 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 23, 0, 10012020, 10012016, 3)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 58, 0, 10012020, 10012016, 3)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(353964032)
                          A2_7:say(A0_5, 85, 0, 10012020, 10012016, 3)
                          break
                        else
                        end
                      else
                        if 8 == 7 then
                          if A4_9 == 0 then
                            A2_7:_runCharaScheduler(353968128)
                            A2_7:say(A0_5, 24, 0, 10012021, 10012014, 10012015, 3, 3)
                            A2_7:say(A0_5, 25, 0, 10012016, 10012017, 3, 3)
                            break
                          else
                          end
                          if A4_9 == 1 then
                            A2_7:_runCharaScheduler(353968128)
                            A2_7:say(A0_5, 59, 0, 10012021, 10012014, 10012015, 3, 3)
                            A2_7:say(A0_5, 60, 0, 10012016, 10012017, 3, 3)
                            break
                          else
                          end
                          if A4_9 == 2 then
                            A2_7:_runCharaScheduler(353968128)
                            A2_7:say(A0_5, 86, 0, 10012021, 10012014, 10012015, 3, 3)
                            A2_7:say(A0_5, 87, 0, 10012016, 10012017, 3, 3)
                          else
                          end
                        else
                        end
                      end
                      if A2_7:askExtendWidget(A0_5, 26, 2, 1, 1) == 1 then
                      elseif A2_7:askExtendWidget(A0_5, 26, 2, 1, 1) == -3 then
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 30, 0)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 62, 0)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(84041728)
                          A2_7:say(A0_5, 89, 0)
                          break
                        else
                        end
                      else
                        if A4_9 == 0 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 30, 0)
                          break
                        else
                        end
                        if A4_9 == 1 then
                          A2_7:_runCharaScheduler(353959936)
                          A2_7:say(A0_5, 62, 0)
                          break
                        else
                        end
                        if A4_9 == 2 then
                          A2_7:_runCharaScheduler(84041728)
                          A2_7:say(A0_5, 89, 0)
                          break
                        else
                        end
                      end
                    end
                    if 199 == 199 then
                    end
                  end
                  A2_7:finishCliantTalkTurn()
                  return 199
                end
              elseif L6_11 == 2 then
                L7_12 = A4_9
                if L7_12 == 0 then
                  A2_7:_runCharaScheduler(353959936)
                  A2_7:say(A0_5, 21, 0, 10012014, 10012015, 10012016, 1)
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 22, 0)
                  break
                else
                end
                if L7_12 == 1 then
                  A2_7:_runCharaScheduler(353959936)
                  A2_7:say(A0_5, 56, 0, 10012014, 10012015, 10012016, 1)
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 57, 0)
                  break
                else
                end
                if L7_12 == 2 then
                  A2_7:_runCharaScheduler(353959936)
                  A2_7:say(A0_5, 83, 0, 10012014, 10012015, 10012016, 1)
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 84, 0)
                  break
                else
                end
                L6_11 = 1
                L7_12 = A2_7.askExtendWidget
                L7_12 = L7_12(A2_7, A0_5, 26, 2, 1, 1)
                if L7_12 == 1 then
                  if A5_10 == 1 then
                    if A4_9 == 0 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 41, 0)
                      break
                    else
                    end
                    if A4_9 == 1 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 68, 0)
                      break
                    else
                    end
                    if A4_9 == 2 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 95, 0)
                      break
                    else
                    end
                    L6_11 = 199
                    A2_7:finishCliantTalkTurn()
                    return L6_11
                  end
                  if A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) == 1 then
                    L6_11 = A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) + 110
                  elseif A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) == 2 then
                    L6_11 = A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) + 110
                  elseif A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) == 3 then
                    L6_11 = A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) + 110
                  elseif A2_7:askExtendWidget(A0_5, 36, 4, 1, 1) == -3 then
                    if A4_9 == 0 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 30, 0)
                      break
                    else
                    end
                    if A4_9 == 1 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 62, 0)
                      break
                    else
                    end
                    if A4_9 == 2 then
                      A2_7:_runCharaScheduler(84041728)
                      A2_7:say(A0_5, 89, 0)
                      break
                    else
                    end
                    L6_11 = 199
                  else
                    if A4_9 == 0 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 30, 0)
                      break
                    else
                    end
                    if A4_9 == 1 then
                      A2_7:_runCharaScheduler(353959936)
                      A2_7:say(A0_5, 62, 0)
                      break
                    else
                    end
                    if A4_9 == 2 then
                      A2_7:_runCharaScheduler(84041728)
                      A2_7:say(A0_5, 89, 0)
                      break
                    else
                    end
                    L6_11 = 199
                  end
                  if L6_11 == 199 then
                  else
                    A2_7:finishCliantTalkTurn()
                    return L6_11
                  end
                elseif L7_12 == -3 then
                  if A4_9 == 0 then
                    A2_7:_runCharaScheduler(353959936)
                    A2_7:say(A0_5, 30, 0)
                    break
                  else
                  end
                  if A4_9 == 1 then
                    A2_7:_runCharaScheduler(353959936)
                    A2_7:say(A0_5, 62, 0)
                    break
                  else
                  end
                  if A4_9 == 2 then
                    A2_7:_runCharaScheduler(84041728)
                    A2_7:say(A0_5, 89, 0)
                    break
                  else
                  end
                  L6_11 = 199
                else
                  if A4_9 == 0 then
                    A2_7:_runCharaScheduler(353959936)
                    A2_7:say(A0_5, 30, 0)
                    break
                  else
                  end
                  if A4_9 == 1 then
                    A2_7:_runCharaScheduler(353959936)
                    A2_7:say(A0_5, 62, 0)
                    break
                  else
                  end
                  if A4_9 == 2 then
                    A2_7:_runCharaScheduler(84041728)
                    A2_7:say(A0_5, 89, 0)
                    break
                  else
                  end
                  L6_11 = 199
                end
                if L6_11 == 199 then
                else
                  A2_7:finishCliantTalkTurn()
                  return L6_11
                end
              elseif L6_11 == 3 then
                L7_12 = A4_9
                if L7_12 == 0 then
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 33, 0)
                else
                end
                if L7_12 == 1 then
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 65, 0)
                  break
                end
                if L7_12 == 2 then
                  A2_7:_runCharaScheduler(354103296)
                  A2_7:say(A0_5, 92, 0)
                end
              elseif L6_11 == 4 then
                L7_12 = A2_7.finishCliantTalkTurn
                L7_12(A2_7)
                return L6_11
              elseif L6_11 == -3 then
                L6_11 = 4
                L7_12 = A2_7.finishCliantTalkTurn
                L7_12(A2_7)
                return L6_11
              end
            end
          end
        end
      end
    end
  end
  L7_12 = A2_7
  L6_11 = A2_7.finishCliantTalkTurn
  L6_11(L7_12)
end
function Spl0i1.processEventSUMFES002(A0_13, A1_14, A2_15, A3_16)
  A2_15:startCliantTalkTurn(2, A1_14)
  if A3_16 == 0 then
    A2_15:_runCharaScheduler(353959936)
    A2_15:say(A0_13, 29, 0)
    break
  else
  end
  if A3_16 == 1 then
    A2_15:_runCharaScheduler(353959936)
    A2_15:say(A0_13, 61, 0)
    break
  else
  end
  if A3_16 == 2 then
    A2_15:_runCharaScheduler(353959936)
    A2_15:say(A0_13, 88, 0)
    break
  else
  end
  A2_15:finishCliantTalkTurn()
end
function Spl0i1.processEventSUMFES003(A0_17, A1_18, A2_19, A3_20)
  A2_19:startCliantTalkTurn(2, A1_18)
  if A3_20 == 0 then
    A2_19:_runCharaScheduler(83959808)
    A2_19:say(A0_17, 31, 0)
    break
  else
  end
  if A3_20 == 1 then
    A2_19:_runCharaScheduler(83959808)
    A2_19:say(A0_17, 63, 0)
    break
  else
  end
  if A3_20 == 2 then
    A2_19:_runCharaScheduler(83959808)
    A2_19:say(A0_17, 90, 0)
    break
  else
  end
  A2_19:finishCliantTalkTurn()
end
function Spl0i1.processEventSUMFES004(A0_21, A1_22, A2_23, A3_24)
  A2_23:startCliantTalkTurn(2, A1_22)
  if A3_24 == 0 then
    A2_23:_runCharaScheduler(354107392)
    A2_23:say(A0_21, 32, 0)
    break
  else
  end
  if A3_24 == 1 then
    A2_23:_runCharaScheduler(354107392)
    A2_23:say(A0_21, 64, 0)
    break
  else
  end
  if A3_24 == 2 then
    A2_23:_runCharaScheduler(354107392)
    A2_23:say(A0_21, 91, 0)
    break
  else
  end
  A2_23:finishCliantTalkTurn()
end
function Spl0i1.processEventSUMFES005(A0_25, A1_26, A2_27, A3_28)
  A2_27:startCliantTalkTurn(2, A1_26)
  if A3_28 == 0 then
    A2_27:_runCharaScheduler(354041856)
    A2_27:say(A0_25, 41, 0)
    break
  else
  end
  if A3_28 == 1 then
    A2_27:_runCharaScheduler(354041856)
    A2_27:say(A0_25, 68, 0)
    break
  else
  end
  if A3_28 == 2 then
    A2_27:_runCharaScheduler(354041856)
    A2_27:say(A0_25, 95, 0)
    break
  else
  end
  A2_27:finishCliantTalkTurn()
  return
end
function Spl0i1.processEventSUMFESGAME001(A0_29, A1_30, A2_31, A3_32, A4_33)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:_runCharaScheduler(354107392)
  if A4_33 == 1 then
    if A3_32 == 0 then
      A2_31:say(A0_29, 96, 0)
      break
    else
    end
    if A3_32 == 1 then
      A2_31:say(A0_29, 101, 0)
    else
    end
  else
  end
  A2_31:finishCliantTalkTurn()
  return
end
function Spl0i1.processEventSUMFESGAME002(A0_34, A1_35, A2_36, A3_37)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(354041856)
  if A3_37 == 0 then
    A2_36:say(A0_34, 100, 0)
    break
  else
  end
  if A3_37 == 1 then
    A2_36:say(A0_34, 105, 0)
    break
  else
  end
  A2_36:finishCliantTalkTurn()
end
