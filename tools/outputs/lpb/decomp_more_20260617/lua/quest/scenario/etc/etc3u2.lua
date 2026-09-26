require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3u2", "ScenarioBaseClass")
function Etc3u2.initText(A0_0)
  A0_0:_loadTextDataPermanently(4355, "etc3u2")
end
function Etc3u2.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(354041856)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 39, 0)
  A2_3:_runCharaScheduler(354066432)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 10, 0)
    A2_3:say(A0_1, 11, 0)
    A2_3:say(A0_1, 12, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 9, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc3u2.processEventStartAfter(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 13, 0)
  A2_6:say(A0_4, 14, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Etc3u2.processEventRycharde(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(83898368)
  A2_9:say(A0_7, 15, 0)
  A2_9:say(A0_7, 40, 0)
  A2_9:say(A0_7, 16, 0)
  if worldMaster:ask(A0_7, worldMaster, 51030, 2) == 1 then
    A0_7:runCharaSchedulerPastAreaIn(A1_8)
    A2_9:finishCliantTalkTurn()
    return (worldMaster:ask(A0_7, worldMaster, 51030, 2))
  else
    A2_9:say(A0_7, 17, 0)
    A2_9:finishCliantTalkTurn()
    return (worldMaster:ask(A0_7, worldMaster, 51030, 2))
  end
end
function Etc3u2.processEventNqetc3u2(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("etc3u210", 1)
  A0_10:startFadeInCutSceneDefault(A1_11)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 29, 0)
  A2_12:_runCharaScheduler(354041856)
  A2_12:say(A0_10, 30, 0)
  A2_12:say(A0_10, 31, 0)
  A2_12:finishCliantTalkTurn()
  return
end
function Etc3u2.processEventRychardeFree(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 29, 0)
  A2_15:say(A0_13, 30, 0)
  A2_15:say(A0_13, 31, 0)
  A2_15:finishCliantTalkTurn()
  return
end
function Etc3u2.processEventClear(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 32, 0)
  A2_18:say(A0_16, 41, 0)
  A2_18:_runCharaScheduler(354086912)
  A2_18:say(A0_16, 33, 0)
  A2_18:say(A0_16, 34, 0)
  A2_18:say(A0_16, 42, 0)
  A2_18:say(A0_16, 35, 0)
  A2_18:say(A0_16, 37, 0)
  A2_18:say(A0_16, 38, 0)
  A2_18:finishCliantTalkTurn()
  return
end
