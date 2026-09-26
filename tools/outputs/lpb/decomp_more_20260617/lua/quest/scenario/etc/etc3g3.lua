require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3g3", "ScenarioBaseClass")
function Etc3g3.initText(A0_0)
  A0_0:_loadTextDataPermanently(4531, "etc3g3")
end
function Etc3g3.processEventMIOUNNEStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(354041856)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 39, 0)
  A2_3:_runCharaScheduler(354086912)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 10, 0)
  A2_3:say(A0_1, 11, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 12, 0)
  A2_3:say(A0_1, 14, 0)
  if A3_4 == 0 then
    A2_3:say(A0_1, 15, 0)
  end
  if A4_5 == false then
    A2_3:say(A0_1, 16, 0)
  end
  if A0_1:showQuestInfomation() == 1 then
    if A4_5 == false then
      A2_3:say(A0_1, 38, 0)
      A2_3:_runCharaScheduler(354107392)
      A2_3:say(A0_1, 20, 0)
    else
      A2_3:say(A0_1, 19, 0)
    end
  else
    A2_3:_runCharaScheduler(354078720)
    A2_3:say(A0_1, 18, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc3g3.processEvent_000(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353984512)
  A2_8:say(A0_6, 21, 0)
  A2_8:say(A0_6, 22, 0)
  A2_8:finishCliantTalkTurn()
end
function Etc3g3.processEvent_005(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(353984512)
  A2_11:say(A0_9, 23, 0)
  A2_11:say(A0_9, 24, 0)
  A2_11:say(A0_9, 25, 0)
  A2_11:_runCharaScheduler(353980416)
  A2_11:say(A0_9, 26, 0)
  A2_11:say(A0_9, 27, 0)
  if A2_11:ask(A0_9, 40, 2) == 1 then
    A2_11:_runCharaScheduler(354115584)
    A0_9:_wait(3)
    A2_11:say(A0_9, 28, 0)
    A2_11:say(A0_9, 29, 0)
  else
    A2_11:say(A0_9, 43, 0)
  end
  A2_11:finishCliantTalkTurn()
  return (A2_11:ask(A0_9, 40, 2))
end
function Etc3g3.processEvent_010(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(354177024)
  A2_14:say(A0_12, 31, 0)
  A2_14:say(A0_12, 32, 0)
  A2_14:_runCharaScheduler(354066432)
  A2_14:say(A0_12, 33, 0)
  A2_14:say(A0_12, 34, 0)
  A2_14:say(A0_12, 35, 0)
  A2_14:_runCharaScheduler(354041856)
  A2_14:say(A0_12, 36, 0)
  A2_14:say(A0_12, 37, 0)
  A2_14:finishCliantTalkTurn()
end
