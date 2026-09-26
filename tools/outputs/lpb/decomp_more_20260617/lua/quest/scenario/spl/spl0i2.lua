require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl0i2", "ScenarioBaseClass")
function Spl0i2.initText(A0_0)
  A0_0:_loadTextDataPermanently(5699, "spl0i2")
end
function Spl0i2.processEventHWLStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354000896)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(354086912)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 10, 0)
    A2_3:say(A0_1, 11, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0)
    A2_3:_runCharaScheduler(354082816)
    A2_3:say(A0_1, 14, 0)
    A2_3:say(A0_1, 16, 0)
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 37, 0)
    worldMaster:say(A0_1, 39, 1, 0)
  else
    A2_3:_runCharaScheduler(354082816)
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Spl0i2.processEventHWGStart(A0_5, A1_6, A2_7, A3_8)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(354054144)
  A2_7:say(A0_5, 41, 0)
  A2_7:say(A0_5, 42, 0)
  A2_7:say(A0_5, 43, 0)
  A2_7:say(A0_5, 67, 0)
  A2_7:_runCharaScheduler(353959936)
  A2_7:say(A0_5, 44, 0)
  A2_7:say(A0_5, 45, 0)
  A2_7:_runCharaScheduler(84049920)
  A2_7:say(A0_5, 46, 0)
  A2_7:say(A0_5, 47, 0)
  if A0_5:showQuestInfomation() == 1 then
    A2_7:_runCharaScheduler(353964032)
    A2_7:say(A0_5, 49, 0)
    A2_7:say(A0_5, 50, 0)
    A2_7:say(A0_5, 51, 0)
    A2_7:_runCharaScheduler(354103296)
    A2_7:say(A0_5, 52, 0)
    A2_7:say(A0_5, 53, 0)
    A2_7:say(A0_5, 54, 0)
    A2_7:_runCharaScheduler(353964032)
    A2_7:say(A0_5, 55, 0)
    A2_7:say(A0_5, 57, 0)
    A2_7:_runCharaScheduler(353959936)
    A2_7:say(A0_5, 59, 0)
    worldMaster:say(A0_5, 39, 1, 0)
  else
    A2_7:_runCharaScheduler(353972224)
    A2_7:say(A0_5, 48, 0)
  end
  A2_7:finishCliantTalkTurn()
  return (A0_5:showQuestInfomation())
end
function Spl0i2.processEventHWUStart(A0_9, A1_10, A2_11, A3_12)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(354082816)
  A2_11:say(A0_9, 71, 0)
  A2_11:say(A0_9, 98, 0)
  A2_11:say(A0_9, 72, 0)
  A2_11:say(A0_9, 73, 0)
  A2_11:say(A0_9, 74, 0)
  A2_11:_runCharaScheduler(354041856)
  A2_11:say(A0_9, 75, 0)
  A2_11:_runCharaScheduler(353959936)
  A2_11:say(A0_9, 76, 0)
  if A0_9:showQuestInfomation() == 1 then
    A2_11:_runCharaScheduler(354066432)
    A2_11:say(A0_9, 79, 0)
    A2_11:say(A0_9, 80, 0)
    A2_11:_runCharaScheduler(354082816)
    A2_11:say(A0_9, 81, 0)
    A2_11:say(A0_9, 82, 0)
    A2_11:_runCharaScheduler(354041856)
    A2_11:say(A0_9, 83, 0)
    A2_11:_runCharaScheduler(354086912)
    A2_11:say(A0_9, 84, 0)
    A2_11:say(A0_9, 85, 0)
    A2_11:_runCharaScheduler(353959936)
    A2_11:say(A0_9, 87, 0)
    worldMaster:say(A0_9, 39, 1, 0)
  else
    A2_11:_runCharaScheduler(84049920)
    A2_11:say(A0_9, 78, 0)
  end
  A2_11:finishCliantTalkTurn()
  return (A0_9:showQuestInfomation())
end
function Spl0i2.processEventSUMFES001(A0_13, A1_14, A2_15, A3_16, A4_17)
  local L5_18, L6_19
  L6_19 = A2_15
  L5_18 = A2_15.startCliantTalkTurn
  L5_18(L6_19, 2, A1_14)
  if A3_16 == 0 then
  else
  end
  L5_18 = A4_17
  if L5_18 == 0 then
    L6_19 = A2_15._runCharaScheduler
    L6_19(A2_15, 353959936)
    L6_19 = A2_15.say
    L6_19(A2_15, A0_13, 17, 0)
    break
  else
  end
  if L5_18 == 1 then
    L6_19 = A2_15._runCharaScheduler
    L6_19(A2_15, 353964032)
    L6_19 = A2_15.say
    L6_19(A2_15, A0_13, 60, 0)
    break
  else
  end
  if L5_18 == 2 then
    L6_19 = A2_15._runCharaScheduler
    L6_19(A2_15, 353976320)
    L6_19 = A2_15.say
    L6_19(A2_15, A0_13, 88, 0)
    break
  else
  end
  while true do
    while true do
      while true do
        while true do
          while true do
            L6_19 = A2_15
            L5_18 = A2_15.askExtendWidget
            L5_18 = L5_18(L6_19, A0_13, 18, 3, 1, 1)
            if L5_18 == 1 then
              L6_19 = A2_15.say
              L6_19(A2_15, A0_13, 22, 0)
              L6_19 = 0
              while true do
                while true do
                  L6_19 = desktopWidget:askEventModeWidgetYield("Ask/RewardSelectWidget", 1, A0_13, 19, L6_19, 8013301, 8013302, 8013303, 8013304)
                  if 8 == 8 then
                    if A4_17 == 0 then
                      A2_15:say(A0_13, 30, 0)
                      break
                    else
                    end
                    if A4_17 == 1 then
                      A2_15:say(A0_13, 63, 0)
                      break
                    else
                    end
                    if A4_17 == 2 then
                      A2_15:say(A0_13, 93, 0)
                      break
                    else
                    end
                    A2_15:finishCliantTalkTurn()
                  elseif 8 == -3 then
                    if A4_17 == 0 then
                      A2_15:say(A0_13, 30, 0)
                      break
                    else
                    end
                    if A4_17 == 1 then
                      A2_15:say(A0_13, 63, 0)
                      break
                    else
                    end
                    if A4_17 == 2 then
                      A2_15:say(A0_13, 93, 0)
                      break
                    else
                    end
                    A2_15:finishCliantTalkTurn()
                  else
                    if 8 == 1 then
                      worldMaster:say(A0_13, 23, 8013301, 3010417, 3)
                    elseif 8 == 2 then
                      worldMaster:say(A0_13, 23, 8013302, 3010417, 10)
                    elseif 8 == 3 then
                      worldMaster:say(A0_13, 23, 8013303, 3010417, 50)
                    elseif 8 == 4 then
                      worldMaster:say(A0_13, 23, 8013304, 3010417, 99)
                    end
                    if A2_15:askExtendWidget(A0_13, 24, 2, 1, 1) == 1 then
                    elseif A2_15:askExtendWidget(A0_13, 24, 2, 1, 1) == -3 then
                      if A4_17 == 0 then
                        A2_15:say(A0_13, 33, 0)
                        break
                      else
                      end
                      if A4_17 == 1 then
                        A2_15:say(A0_13, 70, 0)
                        break
                      else
                      end
                      if A4_17 == 2 then
                        A2_15:say(A0_13, 89, 0)
                        break
                      else
                      end
                    else
                      if A4_17 == 0 then
                        A2_15:say(A0_13, 33, 0)
                        break
                      else
                      end
                      if A4_17 == 1 then
                        A2_15:say(A0_13, 70, 0)
                        break
                      else
                      end
                      if A4_17 == 2 then
                        A2_15:say(A0_13, 89, 0)
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
            elseif L5_18 == 2 then
              L6_19 = A4_17
              if L6_19 == 0 then
                A2_15:say(A0_13, 31, 0)
                A2_15:say(A0_13, 40, 0)
                A2_15:say(A0_13, 32, 0)
                worldMaster:say(A0_13, 39, 1, 0)
              else
              end
              if L6_19 == 1 then
                A2_15:_runCharaScheduler(354103296)
                A2_15:say(A0_13, 64, 0)
                A2_15:say(A0_13, 65, 0)
                A2_15:say(A0_13, 66, 0)
                worldMaster:say(A0_13, 39, 1, 0)
                break
              end
              if L6_19 == 2 then
                A2_15:_runCharaScheduler(353959936)
                A2_15:say(A0_13, 94, 0)
                A2_15:say(A0_13, 95, 0)
                A2_15:say(A0_13, 96, 0)
                worldMaster:say(A0_13, 39, 1, 0)
              end
            elseif L5_18 == 3 then
              L6_19 = A2_15.finishCliantTalkTurn
              L6_19(A2_15)
              return L5_18
            elseif L5_18 == -3 then
              L6_19 = A2_15.finishCliantTalkTurn
              L6_19(A2_15)
              return L5_18
            end
          end
        end
      end
    end
  end
end
function Spl0i2.processEventSUMFES002(A0_20, A1_21, A2_22, A3_23)
  if A3_23 == 0 then
    A2_22:_runCharaScheduler(354041856)
    A2_22:say(A0_20, 29, 0)
    break
  else
  end
  if A3_23 == 1 then
    A2_22:_runCharaScheduler(354041856)
    A2_22:say(A0_20, 62, 0)
    break
  else
  end
  if A3_23 == 2 then
    A2_22:_runCharaScheduler(353968128)
    A2_22:say(A0_20, 92, 0)
    break
  else
  end
  A2_22:finishCliantTalkTurn()
end
function Spl0i2.processEventSUMFES003(A0_24, A1_25, A2_26, A3_27)
  if A3_27 == 0 then
    A2_26:_runCharaScheduler(353976320)
    A2_26:say(A0_24, 28, 0)
    break
  else
  end
  if A3_27 == 1 then
    A2_26:_runCharaScheduler(353964032)
    A2_26:say(A0_24, 61, 0)
    break
  else
  end
  if A3_27 == 2 then
    A2_26:_runCharaScheduler(353959936)
    A2_26:say(A0_24, 91, 0)
    break
  else
  end
  A2_26:finishCliantTalkTurn()
end
function Spl0i2.processEventSUMFES004(A0_28, A1_29, A2_30, A3_31)
  A2_30:_runCharaScheduler(354107392)
  A0_28:_wait(2.5)
  if A3_31 == 0 then
    A2_30:say(A0_28, 27, 0)
    break
  else
  end
  if A3_31 == 1 then
    A2_30:say(A0_28, 68, 0)
    break
  else
  end
  if A3_31 == 2 then
    A2_30:say(A0_28, 90, 0)
    break
  else
  end
  A2_30:finishCliantTalkTurn()
end
function Spl0i2.processEventSUMFES005(A0_32, A1_33, A2_34, A3_35)
  A2_34:startCliantTalkTurn(2, A1_33)
  if A3_35 == 0 then
    A2_34:_runCharaScheduler(354041856)
    A2_34:say(A0_32, 34, 0)
    break
  else
  end
  if A3_35 == 1 then
    A2_34:_runCharaScheduler(354041856)
    A2_34:say(A0_32, 69, 0)
    break
  else
  end
  if A3_35 == 2 then
    A2_34:_runCharaScheduler(353968128)
    A2_34:say(A0_32, 97, 0)
    break
  else
  end
  A2_34:finishCliantTalkTurn()
end
