require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1g1", "ScenarioBaseClass")
function Etc1g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(3361, "etc1g1")
end
function Etc1g1.processEventMaroileStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(354172928)
  if A3_4 == 1 then
    A2_3:say(A0_1, 4, 0)
  else
    A2_3:say(A0_1, 5, 0)
  end
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 10, 0)
    A2_3:say(A0_1, 11, 0, 0, 0, 0, 0, A4_5)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  elseif A3_4 == 1 then
    A2_3:say(A0_1, 6, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 7, 0)
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  end
end
function Etc1g1.processEvent000(A0_6, A1_7, A2_8, A3_9)
  A2_8:startCliantTalkTurn(2, A1_7)
  A2_8:_runCharaScheduler(354172928)
  A2_8:say(A0_6, 12, 0)
  A2_8:say(A0_6, 13, 0, 0, 0, 0, 0, A3_9)
  A2_8:finishCliantTalkTurn()
end
function Etc1g1.processEvent010(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(354172928)
  A2_12:say(A0_10, 14, 0)
  A2_12:say(A0_10, 15, 0)
  A2_12:say(A0_10, 16, 0)
  A2_12:finishCliantTalkTurn()
end
function Etc1g1.processBUSH(A0_13, A1_14, A2_15)
  A2_15:_runBgScheduler("von1")
end
