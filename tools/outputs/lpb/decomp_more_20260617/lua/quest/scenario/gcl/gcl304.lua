require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcl304", "ScenarioBaseClass")
function Gcl304.initText(A0_0)
  A0_0:_loadTextDataPermanently(7040, "gcl304")
end
function Gcl304.processEventLilinaStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOut(A1_2, 1)
  A2_3:startCliantTalkTurn(1, A1_2)
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 35, 0)
  A2_3:say(A0_1, 36, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 37, 0)
  A2_3:say(A0_1, 38, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:say(A0_1, 8, 0)
  end
  A0_1:startFadeOut(A1_2, 1)
  A2_3:finishCliantTalkTurn()
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  return (A0_1:showQuestInfomation())
end
function Gcl304.processEvent_000(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 39, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcl304.processEvent_005(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(1, 27) == 0 then
    A2_9:_runCharaScheduler(354041856)
  end
  A0_7:_wait(2)
  if A2_9:isUpperRank(1, 27) == true then
    A2_9:say(A0_7, 11, 0)
    A2_9:_runCharaScheduler(353984512)
    A2_9:say(A0_7, 12, 0)
    A2_9:say(A0_7, 13, 0)
    A2_9:_runCharaScheduler(354107392)
    A0_7:_wait(4)
    A2_9:say(A0_7, 14, 0)
    A2_9:say(A0_7, 40, 0)
    A2_9:_runCharaScheduler(353980416)
    A2_9:say(A0_7, 15, 0)
    A2_9:say(A0_7, 27, 0)
  else
    A2_9:say(A0_7, 42, 0)
    A2_9:_runCharaScheduler(353984512)
    A2_9:say(A0_7, 43, 0)
    A2_9:say(A0_7, 44, 0)
    A2_9:_runCharaScheduler(354107392)
    A0_7:_wait(4)
    A2_9:say(A0_7, 45, 0)
    A2_9:say(A0_7, 46, 0)
    A2_9:_runCharaScheduler(353980416)
    A2_9:say(A0_7, 47, 0)
    A2_9:say(A0_7, 48, 0)
  end
  A2_9:finishCliantTalkTurn()
end
function Gcl304.processEvent_005_01(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A2_12:doSalute(1, 27) == 0 then
    A2_12:_runCharaScheduler(353959936)
  end
  A0_10:_wait(2)
  if A2_12:isUpperRank(1, 27) == true then
    A2_12:say(A0_10, 16, 0)
    A2_12:say(A0_10, 41, 0)
  else
    A2_12:say(A0_10, 49, 0)
    A2_12:say(A0_10, 50, 0)
  end
  A2_12:finishCliantTalkTurn()
end
function Gcl304.processEvent_010(A0_13, A1_14, A2_15)
  if A2_15:ask(A0_13, 23, 2) == 1 then
  else
  end
  return (A2_15:ask(A0_13, 23, 2))
end
function Gcl304.processEvent_010_01(A0_16, A1_17, A2_18, A3_19, A4_20)
  desktopWidget:openPublicInformDialogWidget(A0_16, 26, 0, A3_19, A4_20)
  return
end
function Gcl304.processEvent_010_02(A0_21, A1_22, A2_23)
  worldMaster:say(A0_21, 34, 1, 0)
end
function Gcl304.processEvent_015(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A0_24:_wait(1)
  if A2_26:isUpperRank(1, 27) == true then
    A2_26:say(A0_24, 28, 0)
    A0_24:startFadeOut(A1_25, 1)
    A0_24:_wait(1)
    A0_24:startFadeIn(A1_25, 1)
    A2_26:_runCharaScheduler(354099200)
    A0_24:_wait(1)
    A2_26:say(A0_24, 29, 0)
    A2_26:_runCharaScheduler(354086912)
    A2_26:say(A0_24, 30, 0)
    A2_26:_runCharaScheduler(354091008)
    A0_24:_wait(1)
    A2_26:say(A0_24, 31, 0)
    A2_26:say(A0_24, 32, 0)
    A2_26:_runCharaScheduler(353984512)
    A2_26:say(A0_24, 33, 0)
    A2_26:_runCharaScheduler(354107392)
    A0_24:_wait(4)
  else
    A2_26:say(A0_24, 51, 0)
    A0_24:startFadeOut(A1_25, 1)
    A0_24:_wait(1)
    A0_24:startFadeIn(A1_25, 1)
    A2_26:_runCharaScheduler(354099200)
    A0_24:_wait(1)
    A2_26:say(A0_24, 52, 0)
    A2_26:_runCharaScheduler(354086912)
    A2_26:say(A0_24, 53, 0)
    A2_26:_runCharaScheduler(354091008)
    A0_24:_wait(1)
    A2_26:say(A0_24, 54, 0)
    A2_26:say(A0_24, 55, 0)
    A2_26:_runCharaScheduler(353984512)
    A2_26:say(A0_24, 56, 0)
    A2_26:_runCharaScheduler(354107392)
    A0_24:_wait(4)
  end
  A2_26:finishCliantTalkTurn()
end
