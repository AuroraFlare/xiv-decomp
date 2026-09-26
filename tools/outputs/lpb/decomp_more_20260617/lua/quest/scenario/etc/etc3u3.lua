require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3u3", "ScenarioBaseClass")
function Etc3u3.initText(A0_0)
  A0_0:_loadTextDataPermanently(4371, "etc3u3")
end
function Etc3u3.processEventMIOUNNEStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353980416)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(354099200)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  if A3_4 == 0 then
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:say(A0_1, 8, 0)
  if A4_5 == false then
    A2_3:say(A0_1, 32, 0)
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 10, 0)
  else
  end
  if A0_1:showQuestInfomation() == 1 then
    if A4_5 == false then
      A2_3:_runCharaScheduler(354107392)
      A2_3:say(A0_1, 33, 0)
      A2_3:say(A0_1, 13, 0)
    else
      A2_3:say(A0_1, 12, 0)
    end
  else
    A2_3:_runCharaScheduler(354078720)
    A2_3:say(A0_1, 11, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc3u3.processEvent_000(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353984512)
  A2_8:say(A0_6, 14, 0)
  A2_8:say(A0_6, 15, 0)
  A2_8:finishCliantTalkTurn()
end
function Etc3u3.processEvent_005(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(353980416)
  A2_11:say(A0_9, 16, 0)
  A2_11:say(A0_9, 17, 0)
  A2_11:say(A0_9, 18, 0)
  A2_11:say(A0_9, 19, 0)
  if A2_11:ask(A0_9, 34, 2) == 1 then
    A2_11:say(A0_9, 20, 0)
  else
    A2_11:say(A0_9, 37, 0)
    A2_11:finishCliantTalkTurn()
    return (A2_11:ask(A0_9, 34, 2))
  end
  A2_11:_runCharaScheduler(354115584)
  A0_9:_wait(3)
  A2_11:say(A0_9, 21, 0)
  A2_11:say(A0_9, 22, 0)
  A2_11:finishCliantTalkTurn()
  return (A2_11:ask(A0_9, 34, 2))
end
function Etc3u3.processEvent_010(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(354177024)
  A2_14:say(A0_12, 24, 0)
  A2_14:say(A0_12, 25, 0)
  A2_14:say(A0_12, 26, 0)
  A2_14:say(A0_12, 27, 0)
  A2_14:_runCharaScheduler(354066432)
  A2_14:say(A0_12, 28, 0)
  A2_14:say(A0_12, 29, 0)
  A2_14:say(A0_12, 38, 0)
  A2_14:say(A0_12, 30, 0)
  A2_14:_runCharaScheduler(70877184)
  A2_14:say(A0_12, 31, 0)
  A2_14:finishCliantTalkTurn()
end
