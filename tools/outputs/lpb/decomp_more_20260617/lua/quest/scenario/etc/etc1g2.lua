require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1g2", "ScenarioBaseClass")
function Etc1g2.initText(A0_0)
  A0_0:_loadTextDataPermanently(3377, "etc1g2")
end
function Etc1g2.processEventV_NabyanoStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 3, 2) == 1 then
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return
  else
    A2_3:say(A0_1, 7, 0)
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 10, 0, 0, 0, 0, 0, A4_5)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 12, 0)
      A2_3:_runCharaScheduler(353968128)
      if A3_4 == 0 then
        A2_3:say(A0_1, 13, 0)
        A2_3:finishCliantTalkTurn()
        return (A0_1:showQuestInfomation())
      else
        A2_3:say(A0_1, 14, 0)
        A2_3:finishCliantTalkTurn()
        return (A0_1:showQuestInfomation())
      end
    else
      A2_3:_runCharaScheduler(354082816)
      A2_3:say(A0_1, 11, 0)
      A2_3:finishCliantTalkTurn()
      return (A0_1:showQuestInfomation())
    end
  end
end
function Etc1g2.processEventV_NabyanoStart00(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:say(A0_6, 15, 0)
  A2_8:_runCharaScheduler(353968128)
  A2_8:say(A0_6, 16, 0)
  A2_8:finishCliantTalkTurn()
end
function Etc1g2.processEvent00(A0_9, A1_10, A2_11, A3_12)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:say(A0_9, 17, 0)
  A2_11:say(A0_9, 18, 0)
  A2_11:_runCharaScheduler(354168832)
  if A3_12 == 0 then
    A2_11:say(A0_9, 22, 0)
    A2_11:say(A0_9, 23, 0)
    A2_11:say(A0_9, 24, 0)
    A2_11:finishCliantTalkTurn()
    return
  else
    A2_11:say(A0_9, 19, 0)
    A2_11:say(A0_9, 20, 0)
    A2_11:say(A0_9, 21, 0)
    A2_11:finishCliantTalkTurn()
    return
  end
end
function Etc1g2.processEvent005(A0_13, A1_14, A2_15, A3_16)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354168832)
  A2_15:say(A0_13, 27, 0)
  A2_15:say(A0_13, 28, 0)
  A2_15:finishCliantTalkTurn()
end
function Etc1g2.processEvent005_1(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:say(A0_17, 29, 0)
  A2_19:_runCharaScheduler(353968128)
  A2_19:say(A0_17, 30, 0)
  A2_19:finishCliantTalkTurn()
end
function Etc1g2.processEvent005_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 31, 0)
  A2_22:say(A0_20, 32, 0)
  A2_22:finishCliantTalkTurn()
end
function Etc1g2.processEvent05_3(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(353968128)
  A2_25:say(A0_23, 33, 0)
  A2_25:say(A0_23, 34, 0)
  A0_23:startFadeOut(A1_24, 1)
  A0_23:_wait(1)
  A0_23:startFadeIn(A1_24, 1)
  A2_25:_runCharaScheduler(354107392)
  A2_25:say(A0_23, 35, 0)
  A2_25:say(A0_23, 36, 0)
  while true do
    if A2_25:ask(A0_23, 37, 2) == 1 then
      A2_25:_runCharaScheduler(353968128)
      A2_25:say(A0_23, 41, 0)
      A2_25:say(A0_23, 42, 0)
      A2_25:say(A0_23, 43, 0)
      break
    elseif A2_25:ask(A0_23, 37, 2) == 2 then
      A2_25:_runCharaScheduler(354086912)
      A2_25:say(A0_23, 40, 0)
    end
  end
  A2_25:finishCliantTalkTurn()
end
