require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("War0j4", "ScenarioBaseClass")
function War0j4.initText(A0_0)
  A0_0:_loadTextDataPermanently(8180, "war0j4")
end
function War0j4.processEventCURIOUS_GORGE_Hint(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354086912)
  A2_3:say(A0_1, 2, 0)
  worldMaster:say(A0_1, 3, 0)
  A2_3:finishCliantTalkTurn()
end
function War0j4.processEventCURIOUS_GORGE_Start(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(354099200)
  A2_6:say(A0_4, 4, 0)
  A2_6:say(A0_4, 5, 0)
  A2_6:say(A0_4, 15, 0)
  A2_6:say(A0_4, 6, 0)
  A2_6:_runCharaScheduler(354082816)
  A2_6:say(A0_4, 7, 0)
  A2_6:say(A0_4, 8, 0)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 16, 0)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:_runCharaScheduler(353968128)
    A2_6:say(A0_4, 13, 0)
  else
    A2_6:_runCharaScheduler(353980416)
    A2_6:say(A0_4, 12, 0)
  end
  A2_6:finishCliantTalkTurn()
  return (A0_4:showQuestInfomation())
end
function War0j4.processEventCURIOUS_GORGE_Follow(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353972224)
  A2_9:say(A0_7, 14, 0)
  A2_9:finishCliantTalkTurn()
end
function War0j4.processEvent_getAF_info(A0_10, A1_11, A2_12, A3_13)
  A2_12:_runCharaScheduler(67108910)
  A0_10:showGetJobItemWidget(A1_11, A3_13, 0)
end
function War0j4.processEventChuui(A0_14, A1_15, A2_16)
  worldMaster:say(worldMaster, 51131, 111204, 17)
end
function War0j4.processEventChuui2(A0_17, A1_18, A2_19)
  worldMaster:say(worldMaster, 51132, 111204, 17)
end
