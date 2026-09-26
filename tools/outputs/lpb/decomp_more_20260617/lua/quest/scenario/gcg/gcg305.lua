require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcg305", "ScenarioBaseClass")
function Gcg305.initText(A0_0)
  A0_0:_loadTextDataPermanently(7744, "gcg305")
end
function Gcg305.processEventStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 == 1 then
    A2_3:say(A0_1, 1, 0)
  else
    A2_3:say(A0_1, 2, 0)
  end
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(354177024)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354177024)
    A2_3:say(A0_1, 9, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354177024)
    A2_3:say(A0_1, 8, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Gcg305.processEventStartAfter(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(354177024)
  A2_7:say(A0_5, 10, 0)
  A2_7:say(A0_5, 27, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Gcg305.processEventTall(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:_runCharaScheduler(354172928)
  A2_10:say(A0_8, 11, 0)
  A2_10:say(A0_8, 12, 0)
  A2_10:finishCliantTalkTurn()
  return
end
function Gcg305.processEventVevina(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354177024)
  A2_13:say(A0_11, 13, 0)
  A2_13:say(A0_11, 14, 0)
  A2_13:finishCliantTalkTurn()
  return
end
function Gcg305.processEventClear(A0_14, A1_15, A2_16, A3_17)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(83914752)
  if A3_17 == 0 then
    A2_16:say(A0_14, 15, 0)
  else
    A2_16:say(A0_14, 16, 0)
  end
  A2_16:say(A0_14, 17, 0)
  A2_16:_runCharaScheduler(353984512)
  A2_16:say(A0_14, 18, 0)
  A2_16:say(A0_14, 19, 0)
  A2_16:_runCharaScheduler(354041856)
  A2_16:say(A0_14, 20, 0)
  A2_16:say(A0_14, 21, 0)
  A2_16:_runCharaScheduler(353976320)
  A2_16:say(A0_14, 22, 0)
  A2_16:say(A0_14, 23, 0)
  A2_16:_runCharaScheduler(354041856)
  A2_16:say(A0_14, 24, 0)
  A2_16:say(A0_14, 25, 0)
  A2_16:say(A0_14, 26, 0)
  A2_16:finishCliantTalkTurn()
  return
end
