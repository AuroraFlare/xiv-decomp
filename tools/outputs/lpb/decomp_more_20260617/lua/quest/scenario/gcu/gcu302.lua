require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu302", "ScenarioBaseClass")
function Gcu302.initText(A0_0)
  A0_0:_loadTextDataPermanently(7120, "gcu302")
end
function Gcu302.processEventGALERENStart(A0_1, A1_2, A2_3, A3_4)
  A0_1:startFadeOut(A1_2, 1)
  A2_3:startCliantTalkTurn(1, A1_2)
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  if A3_4 == 1 then
    A2_3:say(A0_1, 2, 0)
  else
    A2_3:say(A0_1, 49, 0)
  end
  A2_3:_runCharaScheduler(354168832)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 43, 0)
  A2_3:_runCharaScheduler(353976320)
  A2_3:say(A0_1, 41, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 44, 0)
  A2_3:say(A0_1, 42, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 7, 0)
  else
    A2_3:_runCharaScheduler(354078720)
    A2_3:say(A0_1, 6, 0)
  end
  A0_1:startFadeOut(A1_2, 1)
  A2_3:finishCliantTalkTurn()
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  return (A0_1:showQuestInfomation())
end
function Gcu302.processEvent_000(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(354168832)
  A2_7:say(A0_5, 8, 0)
  A2_7:say(A0_5, 45, 0)
  A2_7:finishCliantTalkTurn()
end
function Gcu302.processEvent_005(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  if A2_10:isUpperRank(3, 21) == true then
    A2_10:say(A0_8, 27, 0)
    A2_10:_runCharaScheduler(354099200)
    A2_10:say(A0_8, 28, 0)
    A2_10:say(A0_8, 29, 0)
    A2_10:_runCharaScheduler(354000896)
    A2_10:say(A0_8, 46, 0)
    A2_10:say(A0_8, 30, 0)
    A2_10:say(A0_8, 31, 0)
  else
    A2_10:say(A0_8, 50, 0)
    A2_10:_runCharaScheduler(354099200)
    A2_10:say(A0_8, 51, 0)
    A2_10:say(A0_8, 60, 0)
    A2_10:_runCharaScheduler(354000896)
    A2_10:say(A0_8, 52, 0)
    A2_10:say(A0_8, 53, 0)
    A2_10:say(A0_8, 54, 0)
  end
  if A2_10:doSalute(3, 21) == 0 then
    A2_10:_runCharaScheduler(353968128)
  end
  if A2_10:isUpperRank(3, 21) == true then
    A2_10:say(A0_8, 32, 0)
  else
    A2_10:say(A0_8, 55, 0)
  end
  A2_10:finishCliantTalkTurn()
end
function Gcu302.processEvent_005_1(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354099200)
  if A2_13:isUpperRank(3, 21) == true then
    A2_13:say(A0_11, 40, 0)
  else
    A2_13:say(A0_11, 56, 0)
  end
  A2_13:finishCliantTalkTurn()
end
function Gcu302.processEvent_015(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  if A2_16:doSalute(3, 31) == 0 then
    A2_16:_runCharaScheduler(354099200)
  end
  A0_14:_wait(1)
  if A2_16:isUpperRank(3, 31) == true then
    A2_16:say(A0_14, 15, 0)
    A2_16:say(A0_14, 47, 0)
    A2_16:say(A0_14, 16, 0)
    A2_16:say(A0_14, 17, 0)
    A0_14:startFadeOut(A1_15, 1)
    A0_14:_wait(1)
    A2_16:_runCharaScheduler(354086912)
    A0_14:startFadeIn(A1_15, 1)
    A2_16:say(A0_14, 33, 0)
    A2_16:say(A0_14, 48, 0)
    A2_16:say(A0_14, 34, 0)
    A2_16:_runCharaScheduler(354099200)
    A2_16:say(A0_14, 35, 0)
  else
    A2_16:say(A0_14, 61, 0)
    A2_16:say(A0_14, 62, 0)
    A2_16:say(A0_14, 63, 0)
    A2_16:say(A0_14, 64, 0)
    A0_14:startFadeOut(A1_15, 1)
    A0_14:_wait(1)
    A2_16:_runCharaScheduler(354086912)
    A0_14:startFadeIn(A1_15, 1)
    A2_16:say(A0_14, 65, 0)
    A2_16:say(A0_14, 66, 0)
    A2_16:say(A0_14, 67, 0)
    A2_16:_runCharaScheduler(354099200)
    A2_16:say(A0_14, 68, 0)
  end
  A2_16:finishCliantTalkTurn()
end
function Gcu302.processEvent_015_01(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  if A2_19:doSalute(3, 11) == 0 then
    A2_19:_runCharaScheduler(354086912)
  end
  if A2_19:isUpperRank(3, 11) == true then
    A2_19:say(A0_17, 36, 0)
  else
    A2_19:say(A0_17, 57, 0)
  end
  A2_19:finishCliantTalkTurn()
end
function Gcu302.processEvent_015_02(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  if A2_22:doSalute(3, 11) == 0 then
    A2_22:_runCharaScheduler(354041856)
  end
  if A2_22:isUpperRank(3, 11) == true then
    A2_22:say(A0_20, 37, 0)
  else
    A2_22:say(A0_20, 58, 0)
  end
  A2_22:finishCliantTalkTurn()
end
function Gcu302.processEvent_015_03(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  if A2_25:doSalute(3, 23) == 0 then
    A2_25:_runCharaScheduler(354041856)
  end
  if A2_25:isUpperRank(3, 23) == true then
    A2_25:say(A0_23, 38, 0)
  else
    A2_25:say(A0_23, 59, 0)
  end
  A2_25:finishCliantTalkTurn()
end
function Gcu302.processEvent_020(A0_26, A1_27, A2_28)
  A0_26:startFadeOut(A1_27, 1)
  A2_28:startCliantTalkTurn(1, A1_27)
  A0_26:_wait(1)
  A0_26:startFadeIn(A1_27, 1)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:_runCharaScheduler(354168832)
  A2_28:say(A0_26, 24, 0)
  A2_28:say(A0_26, 25, 0)
  A2_28:say(A0_26, 26, 0)
  A2_28:_runCharaScheduler(354107392)
  A2_28:say(A0_26, 39, 0)
  A0_26:startFadeOut(A1_27, 1)
  A2_28:finishCliantTalkTurn()
  A0_26:_wait(1)
  A0_26:startFadeIn(A1_27, 1)
  A2_28:finishCliantTalkTurn()
end
