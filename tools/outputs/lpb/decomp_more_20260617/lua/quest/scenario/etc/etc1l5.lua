require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l5", "ScenarioBaseClass")
function Etc1l5.initText(A0_0)
  A0_0:_loadTextDataPermanently(3415, "etc1l5")
end
function Etc1l5.processEventLahonoStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354041856)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:askExtendWidget(A0_1, 3, 2, 0, 2) == 2 then
    A2_3:say(A0_1, 14, 0)
    A2_3:say(A0_1, 15, 0)
    A2_3:_runCharaScheduler(353976320)
    A2_3:say(A0_1, 16, 0)
    A2_3:say(A0_1, 17, 0)
    A2_3:say(A0_1, 18, 0)
    A2_3:say(A0_1, 19, 0, 0, 0, 0, 0, A4_5)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:_runCharaScheduler(353968128)
      A2_3:say(A0_1, 21, 0)
      A2_3:say(A0_1, 22, 0, 0, 0, 0, 0, A4_5)
      A2_3:finishCliantTalkTurn()
      return (A0_1:showQuestInfomation())
    else
      A2_3:_runCharaScheduler(354058240)
      A2_3:say(A0_1, 20, 0)
      A2_3:finishCliantTalkTurn()
      return (A0_1:showQuestInfomation())
    end
  else
    A2_3:_runCharaScheduler(354058240)
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return
  end
end
function Etc1l5.processEventAfter(A0_6, A1_7, A2_8, A3_9)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(353972224)
  A2_8:say(A0_6, 30, 0)
  A2_8:say(A0_6, 31, 0)
  A2_8:say(A0_6, 32, 0)
  A2_8:say(A0_6, 33, 0)
  A2_8:_runCharaScheduler(354054144)
  A2_8:say(A0_6, 34, 0)
  A2_8:say(A0_6, 35, 0)
  A2_8:finishCliantTalkTurn()
  return
end
function Etc1l5.processEventFree(A0_10, A1_11, A2_12, A3_13, A4_14)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(353964032)
  A2_12:say(A0_10, 24, 0)
  A2_12:say(A0_10, 36, 0, 0, 0, 0, 0, A4_14)
  A2_12:finishCliantTalkTurn()
  return
end
