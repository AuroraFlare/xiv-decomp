require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3l3", "ScenarioBaseClass")
function Etc3l3.initText(A0_0)
  A0_0:_loadTextDataPermanently(4691, "etc3l3")
end
function Etc3l3.processEventBADERONStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353980416)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(353976320)
  if A3_4 == 0 then
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 24, 0)
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354066432)
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:_runCharaScheduler(354099200)
    if A4_5 == 0 then
      A2_3:say(A0_1, 9, 0)
    else
      A2_3:say(A0_1, 8, 0)
    end
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc3l3.processEvent_000(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353980416)
  A2_8:say(A0_6, 11, 0)
  A2_8:finishCliantTalkTurn()
end
function Etc3l3.processEvent_005(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(354177024)
  A2_11:say(A0_9, 12, 0)
  A2_11:say(A0_9, 13, 0)
  A2_11:say(A0_9, 25, 0)
  A2_11:_runCharaScheduler(353976320)
  A2_11:say(A0_9, 14, 0)
  A2_11:say(A0_9, 15, 0)
  A2_11:say(A0_9, 16, 0)
  A2_11:_runCharaScheduler(354107392)
  A2_11:say(A0_9, 17, 0)
  A2_11:say(A0_9, 26, 0)
  A2_11:finishCliantTalkTurn()
end
function Etc3l3.processEvent_005_01(A0_12, A1_13, A2_14)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(353976320)
  A2_14:say(A0_12, 18, 0)
  A2_14:finishCliantTalkTurn()
end
function Etc3l3.processEvent_010(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:_runCharaScheduler(354177024)
  A2_17:say(A0_15, 19, 0)
  A2_17:say(A0_15, 20, 0)
  A2_17:_runCharaScheduler(354123776)
  A0_15:_wait(4)
  A2_17:say(A0_15, 21, 0)
  A2_17:say(A0_15, 22, 0)
  A2_17:_runCharaScheduler(353980416)
  A2_17:say(A0_15, 23, 0)
  A2_17:finishCliantTalkTurn()
end
