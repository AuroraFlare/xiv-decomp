require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l7", "ScenarioBaseClass")
function Etc1l7.initText(A0_0)
  A0_0:_loadTextDataPermanently(3411, "etc1l7")
end
function Etc1l7.processEventImaniaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 7, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc1l7.processEventImaniaFree(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc1l7.processEventYuyubesuStart(A0_7, A1_8, A2_9, A3_10, A4_11)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 11, 0)
  A2_9:say(A0_7, 12, 0)
  A2_9:say(A0_7, 13, 0)
  A2_9:say(A0_7, 14, 0)
  A2_9:say(A0_7, 45, 0, 0, 0, 0, 0, A4_11)
  A2_9:finishCliantTalkTurn()
end
function Etc1l7.processEventYuyubesuFree(A0_12, A1_13, A2_14, A3_15, A4_16)
  A2_14:startCliantTalkTurn(2, A1_13)
  A2_14:_runCharaScheduler(353959936)
  A2_14:say(A0_12, 16, 0)
  A2_14:say(A0_12, 17, 0, 0, 0, 0, 0, A4_16)
  A2_14:finishCliantTalkTurn()
  return
end
function Etc1l7.processEventYuyubesuAfter(A0_17, A1_18, A2_19, A3_20)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:_runCharaScheduler(353959936)
  A2_19:say(A0_17, 20, 0)
  A2_19:say(A0_17, 22, 0)
  A2_19:finishCliantTalkTurn()
  return
end
function Etc1l7.processEventYuyubesuAfterFree(A0_21, A1_22, A2_23, A3_24)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:_runCharaScheduler(353959936)
  A2_23:say(A0_21, 23, 0)
  A2_23:say(A0_21, 25, 0)
  A2_23:finishCliantTalkTurn()
  return
end
function Etc1l7.processEventHildie(A0_25, A1_26, A2_27, A3_28)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 26, 0)
  A2_27:say(A0_25, 27, 0)
  A2_27:say(A0_25, 29, 0)
  A2_27:say(A0_25, 30, 0)
  A2_27:say(A0_25, 32, 0)
  A2_27:say(A0_25, 36, 0)
  A2_27:say(A0_25, 37, 0)
  A2_27:say(A0_25, 39, 0)
  A2_27:say(A0_25, 40, 0)
  A2_27:say(A0_25, 41, 0)
  A2_27:finishCliantTalkTurn()
  return
end
