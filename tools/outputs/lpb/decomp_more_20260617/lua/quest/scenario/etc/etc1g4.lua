require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1g4", "ScenarioBaseClass")
function Etc1g4.initText(A0_0)
  A0_0:_loadTextDataPermanently(3403, "etc1g4")
end
function Etc1g4.processEventNicoliauxStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A0_1:startFadeOut(A1_2, 0.5)
  A0_1:_wait(0.5)
  A2_3:startCliantTalkTurn(1, A1_2)
  A0_1:startFadeIn(A1_2, 0.5)
  A2_3:say(A0_1, 1, 0)
  if A2_3:ask(A0_1, 2, 2) == 1 then
    A2_3:say(A0_1, 6, 0)
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 7, 0)
    if A3_4 == true then
      A2_3:say(A0_1, 10, 0)
    else
      A2_3:say(A0_1, 8, 0)
      A2_3:_runCharaScheduler(67731456)
      A2_3:say(A0_1, 9, 0)
      A2_3:say(A0_1, 34, 0, 0, 0, 0, 0, A4_5)
    end
    if A0_1:showQuestInfomation() == 1 then
      A2_3:_runCharaScheduler(69267456)
      A2_3:say(A0_1, 12, 0)
      if A3_4 == true then
        A2_3:say(A0_1, 14, 0)
        A2_3:say(A0_1, 32, 0)
      else
        A2_3:say(A0_1, 13, 0)
      end
    else
      A2_3:_runCharaScheduler(354041856)
      A2_3:say(A0_1, 11, 0)
    end
    A0_1:startFadeOut(A1_2, 0.5)
    A0_1:_wait(0.5)
    A2_3:finishCliantTalkTurn()
    A0_1:_wait(0.4)
    A0_1:startFadeIn(A1_2, 0.5)
    return (A0_1:showQuestInfomation())
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 5, 0)
    A0_1:startFadeOut(A1_2, 0.5)
    A0_1:_wait(0.5)
    A2_3:finishCliantTalkTurn()
    A0_1:_wait(0.4)
    A0_1:startFadeIn(A1_2, 0.5)
    return (A2_3:ask(A0_1, 2, 2))
  end
  A0_1:startFadeOut(A1_2, 0.5)
  A0_1:_wait(0.5)
  A2_3:finishCliantTalkTurn()
  A0_1:_wait(0.4)
  A0_1:startFadeIn(A1_2, 0.5)
end
function Etc1g4.processEvent010(A0_6, A1_7, A2_8, A3_9, A4_10)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353964032)
  if A3_9 == 1 then
    A2_8:say(A0_6, 17, 0)
    A2_8:say(A0_6, 33, 0)
  else
    A2_8:say(A0_6, 16, 0, 0, 0, 0, 0, A4_10)
  end
  A2_8:say(A0_6, 18, 0)
  A2_8:finishCliantTalkTurn()
end
function Etc1g4.processEvent020(A0_11, A1_12, A2_13, A3_14)
  A0_11:startFadeOut(A1_12, 0.5)
  A0_11:_wait(0.5)
  A2_13:startCliantTalkTurn(1, A1_12)
  A0_11:startFadeIn(A1_12, 0.5)
  if A3_14 == 1 then
    A2_13:say(A0_11, 21, 0)
    A2_13:say(A0_11, 22, 0)
  else
    A2_13:_runCharaScheduler(67731456)
    A2_13:say(A0_11, 19, 0)
    A2_13:say(A0_11, 20, 0)
  end
  A2_13:_runCharaScheduler(68378624)
  A2_13:say(A0_11, 23, 0)
  worldMaster:say(A0_11, 24, 1, 0)
  A2_13:_runCharaScheduler(67846144)
  A0_11:_wait(2)
  A2_13:say(A0_11, 25, 0)
  A2_13:_runCharaScheduler(353964032)
  if A3_14 == 1 then
    A2_13:say(A0_11, 28, 0)
    A2_13:say(A0_11, 29, 0)
  else
    A2_13:say(A0_11, 26, 0)
    A2_13:say(A0_11, 27, 0)
  end
  A2_13:say(A0_11, 30, 0)
  A2_13:say(A0_11, 31, 0)
  A0_11:startFadeOut(A1_12, 0.5)
  A0_11:_wait(0.5)
  A2_13:finishCliantTalkTurn()
  A0_11:_wait(0.4)
  A0_11:startFadeIn(A1_12, 0.5)
end
