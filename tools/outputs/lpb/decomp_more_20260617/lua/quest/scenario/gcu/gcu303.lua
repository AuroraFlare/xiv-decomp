require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu303", "ScenarioBaseClass")
function Gcu303.initText(A0_0)
  A0_0:_loadTextDataPermanently(7136, "gcu303")
end
function Gcu303.processEventCAHERNAUTStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(1, A1_2)
  if A3_4 == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 2, 0)
    A2_3:say(A0_1, 26, 0)
  else
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
  end
  A2_3:say(A0_1, 27, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:_runCharaScheduler(354086912)
  A2_3:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(353980416)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353968128)
    A2_3:say(A0_1, 10, 0)
    A2_3:_waitForCharaSchedulerFinished(353968128)
  else
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 9, 0)
    A2_3:_waitForCharaSchedulerFinished(353964032)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcu303.processEvent_000(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(1, A1_6)
  A2_7:_runCharaScheduler(353980416)
  A2_7:say(A0_5, 11, 0)
  A2_7:_waitForCharaSchedulerFinished(353980416)
  A2_7:finishCliantTalkTurn()
end
function Gcu303.processEvent_010(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(1, A1_9)
  A2_10:_runCharaScheduler(353964032)
  A2_10:say(A0_8, 12, 0)
  if A2_10:ask(A0_8, 13, 4) == 1 then
    A2_10:_runCharaScheduler(354082816)
    A0_8:_wait(1)
    A2_10:say(A0_8, 18, 0)
    A2_10:say(A0_8, 19, 0)
  end
  if A2_10:ask(A0_8, 13, 4) == 2 then
    A2_10:_runCharaScheduler(354086912)
    A0_8:_wait(1)
    A2_10:say(A0_8, 20, 0)
    A2_10:say(A0_8, 21, 0)
  end
  if A2_10:ask(A0_8, 13, 4) == 3 then
    A2_10:_runCharaScheduler(353968128)
    A2_10:say(A0_8, 22, 0)
    A2_10:say(A0_8, 28, 0)
    A2_10:say(A0_8, 23, 0)
  end
  if A2_10:ask(A0_8, 13, 4) == 4 then
    A2_10:_runCharaScheduler(354086912)
    A2_10:say(A0_8, 29, 0)
    A2_10:say(A0_8, 32, 0)
    A2_10:say(A0_8, 30, 0)
    A2_10:say(A0_8, 31, 0)
  end
  A2_10:_runCharaScheduler(353964032)
  A2_10:say(A0_8, 24, 0)
  A2_10:_runCharaScheduler(353972224)
  A2_10:say(A0_8, 25, 0)
  A2_10:_waitForCharaSchedulerFinished(353972224)
  A2_10:finishCliantTalkTurn()
  return (A2_10:ask(A0_8, 13, 4))
end
function Gcu303.processEvent_010_1(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:finishCliantTalkTurn()
end
function Gcu303.processEvent_020(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:finishCliantTalkTurn()
end
function Gcu303.processEvent_030(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:finishCliantTalkTurn()
end
