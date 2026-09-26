require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1g8", "ScenarioBaseClass")
function Etc1g8.initText(A0_0)
  A0_0:_loadTextDataPermanently(3451, "etc1g8")
end
function Etc1g8.processEventFrancisStart1g8(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0, 0, 0, 0, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 11, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 10, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc1g8.processEventFrancisFree(A0_5, A1_6, A2_7, A3_8, A4_9)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 17, 0, 0, 0, 0, 0, A4_9)
  A2_7:finishCliantTalkTurn()
end
function Etc1g8.processEventFrancisAfter(A0_10, A1_11, A2_12, A3_13)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 23, 0)
  A2_12:say(A0_10, 25, 0)
  A2_12:say(A0_10, 26, 0)
  A2_12:finishCliantTalkTurn()
end
function Etc1g8.processEventFrancisAfterFree(A0_14, A1_15, A2_16, A3_17)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:say(A0_14, 27, 0)
  A2_16:finishCliantTalkTurn()
  return
end
function Etc1g8.processEventImania(A0_18, A1_19, A2_20, A3_21)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:say(A0_18, 35, 0)
  A2_20:say(A0_18, 36, 0)
  A2_20:say(A0_18, 37, 0)
  A2_20:say(A0_18, 38, 0)
  A2_20:finishCliantTalkTurn()
  return
end
