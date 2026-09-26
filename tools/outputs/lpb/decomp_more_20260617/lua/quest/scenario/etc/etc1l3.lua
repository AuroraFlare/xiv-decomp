require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1l3", "ScenarioBaseClass")
function Etc1l3.initText(A0_0)
  A0_0:_loadTextDataPermanently(3393, "etc1l3")
end
function Etc1l3.processEventChaunolletStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354172928)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0, 0, 0, 0, 0, A3_4)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354172928)
    A2_3:say(A0_1, 8, 0, 0, 0, 0, 0, A3_4)
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:_runCharaScheduler(70815744)
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc1l3.processEvent000Chaunollet(A0_5, A1_6, A2_7, A3_8)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(354172928)
  A2_7:say(A0_5, 10, 0)
  A2_7:say(A0_5, 11, 0, 0, 0, 0, 0, A3_8)
  A2_7:finishCliantTalkTurn()
end
function Etc1l3.processEvent010Chaunollet(A0_9, A1_10, A2_11)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(70795264)
  A2_11:say(A0_9, 12, 0)
  A2_11:_runCharaScheduler(354172928)
  A2_11:say(A0_9, 13, 0)
  A2_11:finishCliantTalkTurn()
end
