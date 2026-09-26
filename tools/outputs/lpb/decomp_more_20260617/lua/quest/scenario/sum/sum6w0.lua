require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Sum6w0", "ScenarioBaseClass")
function Sum6w0.initText(A0_0)
  A0_0:_loadTextDataPermanently(10560, "sum6w0")
end
function Sum6w0.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 4, 0)
  else
    A2_3:say(A0_1, 3, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Sum6w0.processEventTrisselle(A0_4, A1_5, A2_6, A3_7)
  local L4_8, L5_9
  L5_9 = A2_6
  L4_8 = A2_6.startCliantTalkTurn
  L4_8(L5_9, 2, A1_5)
  L5_9 = A2_6
  L4_8 = A2_6.doSalute
  L4_8 = L4_8(L5_9, 2, 11)
  if L4_8 == 0 then
    L5_9 = A2_6._runCharaScheduler
    L5_9(A2_6, 353959936)
  end
  L5_9 = A0_4._wait
  L5_9(A0_4, 1)
  L5_9 = A2_6.say
  L5_9(A2_6, A0_4, 11, 0)
  L5_9 = 0
  repeat
    while true do
      if true then
        L5_9 = A2_6:askExtendWidget(A0_4, 12, 3, 1, 1)
        if L5_9 == 1 then
          A2_6:_runCharaScheduler(353964032)
          A2_6:say(A0_4, 21, 0)
        elseif L5_9 == 2 then
          A2_6:_runCharaScheduler(353968128)
          A2_6:say(A0_4, 16, 0)
          worldMaster:say(A0_4, 17, A3_7)
          worldMaster:say(A0_4, 18, A3_7)
          worldMaster:say(A0_4, 19, A3_7)
          worldMaster:say(A0_4, 20, A3_7)
          worldMaster:say(A0_4, 37, A3_7)
        else
        end
      end
    end
  until L5_9 == -3
  A2_6:finishCliantTalkTurn()
  return L5_9
end
function Sum6w0.processEventClear(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 31, 0)
  A2_12:_runCharaScheduler(353976320)
  A2_12:say(A0_10, 32, 0)
  A2_12:finishCliantTalkTurn()
end
function Sum6w0.processEventClearAfter(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18
  L5_18 = A2_15
  L4_17 = A2_15.startCliantTalkTurn
  L4_17(L5_18, 2, A1_14)
  L5_18 = A2_15
  L4_17 = A2_15.doSalute
  L4_17 = L4_17(L5_18, 2, 11)
  if L4_17 == 0 then
    L5_18 = A2_15._runCharaScheduler
    L5_18(A2_15, 353959936)
  end
  L5_18 = A0_13._wait
  L5_18(A0_13, 1)
  L5_18 = A2_15.say
  L5_18(A2_15, A0_13, 11, 0)
  L5_18 = 0
  repeat
    while true do
      if true then
        L5_18 = A2_15:askExtendWidget(A0_13, 5, 3, 1, 1, A3_16)
        if L5_18 == 1 then
          A2_15:_runCharaScheduler(353964032)
          A2_15:say(A0_13, 21, 0)
        elseif L5_18 == 2 then
          A2_15:_runCharaScheduler(353968128)
          A2_15:say(A0_13, 16, 0)
          worldMaster:say(A0_13, 33, A3_16)
          worldMaster:say(A0_13, 34, A3_16)
          worldMaster:say(A0_13, 35, A3_16)
          worldMaster:say(A0_13, 36, A3_16)
          worldMaster:say(A0_13, 38, A3_16)
        else
        end
      end
    end
  until L5_18 == -3
  A2_15:finishCliantTalkTurn()
  return L5_18
end
