require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcl302", "ScenarioBaseClass")
function Gcl302.initText(A0_0)
  A0_0:_loadTextDataPermanently(7008, "gcl302")
end
function Gcl302.processEventStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A3_4 == 1 then
    A2_3:say(A0_1, 2, 0)
  else
    A2_3:say(A0_1, 28, 0)
  end
  A2_3:_runCharaScheduler(354177024)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 25, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 26, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 27, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354099200)
    A2_3:say(A0_1, 10, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 9, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Gcl302.processEventStartAfter(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 11, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Gcl302.processEventFyrilskyf(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:_runCharaScheduler(353976320)
  A2_10:say(A0_8, 12, 0)
  A2_10:finishCliantTalkTurn()
  return
end
function Gcl302.processEventAlbin(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354041856)
  A2_13:say(A0_11, 13, 0)
  A2_13:finishCliantTalkTurn()
  return
end
function Gcl302.processEventTGizzoh(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(354066432)
  A2_16:say(A0_14, 14, 0)
  A2_16:finishCliantTalkTurn()
  return
end
function Gcl302.processEventDenston(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:_runCharaScheduler(353976320)
  A2_19:say(A0_17, 15, 0)
  A2_19:finishCliantTalkTurn()
  return
end
function Gcl302.processEventClear(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:_runCharaScheduler(354177024)
  A2_22:say(A0_20, 18, 0)
  A2_22:say(A0_20, 19, 0)
  A2_22:_runCharaScheduler(354107392)
  A1_21:_runCharaScheduler(354111488)
  A0_20:_wait(2.5)
  A2_22:say(A0_20, 20, 0)
  A2_22:finishCliantTalkTurn()
  return
end
