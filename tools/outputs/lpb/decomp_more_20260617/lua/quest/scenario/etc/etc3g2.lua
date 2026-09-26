require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3g2", "ScenarioBaseClass")
function Etc3g2.initText(A0_0)
  A0_0:_loadTextDataPermanently(4515, "etc3g2")
end
function Etc3g2.processEventBiddyStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(354082816)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 7, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 8, 0)
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc3g2.processEvent_000_01(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 9, 0)
  A2_6:say(A0_4, 10, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc3g2.processEvent_010(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(83988480)
  A2_9:say(A0_7, 13, 0)
  A2_9:say(A0_7, 14, 0)
  A2_9:say(A0_7, 15, 0)
  A2_9:_runCharaScheduler(83980288)
  A2_9:say(A0_7, 16, 0)
  A2_9:say(A0_7, 17, 0)
  A2_9:_runCharaScheduler(67723264)
  A2_9:say(A0_7, 18, 0)
  A2_9:finishCliantTalkTurn()
end
function Etc3g2.processEvent_010_01(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 11, 0)
  A2_12:finishCliantTalkTurn()
end
function Etc3g2.processEvent_010_02(A0_13, A1_14, A2_15)
  A2_15:say(A0_13, 12, 0)
end
function Etc3g2.processEvent_010_3(A0_16, A1_17, A2_18)
  A2_18:say(A0_16, 20, 0)
end
function Etc3g2.processEvent_010_4(A0_19, A1_20, A2_21)
  A0_19:_wait(1.5)
end
function Etc3g2.processEvent_015(A0_22, A1_23, A2_24, A3_25)
  A2_24:startCliantTalkTurn(1, A1_23)
  A2_24:_runCharaScheduler(364748800)
  if A3_25 == true then
    A2_24:say(A0_22, 21, 0)
    A2_24:say(A0_22, 45, 0)
  else
    A2_24:say(A0_22, 46, 0)
    A2_24:say(A0_22, 47, 0)
  end
  A0_22:startFadeOut(A1_23, 1)
  A0_22:_wait(2)
  A0_22:startFadeIn(A1_23, 1)
  A2_24:_runCharaScheduler(364752896)
  A2_24:say(A0_22, 22, 0)
  A2_24:say(A0_22, 23, 0)
  A2_24:_runCharaScheduler(79577088)
  A2_24:say(A0_22, 24, 0)
  if worldMaster:ask(A0_22, worldMaster, 51030, 2) == 1 then
    A0_22:runCharaSchedulerPastAreaIn(A1_23)
  else
    A2_24:_runCharaScheduler(364761088)
    A2_24:say(A0_22, 25, 0)
  end
  A2_24:finishCliantTalkTurn()
  return (worldMaster:ask(A0_22, worldMaster, 51030, 2))
end
function Etc3g2.processEvent_015_2(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:_runCharaScheduler(364761088)
  A2_28:say(A0_26, 24, 0)
  if worldMaster:ask(A0_26, worldMaster, 51030, 2) == 1 then
    A0_26:runCharaSchedulerPastAreaIn(A1_27)
  else
    A2_28:_runCharaScheduler(79577088)
    A2_28:say(A0_26, 25, 0)
  end
  A2_28:finishCliantTalkTurn()
  return (worldMaster:ask(A0_26, worldMaster, 51030, 2))
end
function Etc3g2.processEvent_020(A0_29, A1_30, A2_31)
  A0_29:startFadeOutCutSceneDefault(A1_30)
  A0_29:startNQCutScene("etc3g210", 1)
  A0_29:startFadeInCutSceneAfterWarp(A1_30)
end
function Etc3g2.processEvent_030(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:_runCharaScheduler(353968128)
  A2_34:say(A0_32, 37, 0)
  A2_34:say(A0_32, 38, 0)
  A0_32:startFadeOut(A1_33, 1)
  A2_34:startCliantTalkTurn(1, A1_33)
  A0_32:_wait(1)
  A0_32:startFadeIn(A1_33, 1)
  A2_34:_runCharaScheduler(354054144)
  A2_34:say(A0_32, 39, 0)
  A2_34:say(A0_32, 40, 0)
  A2_34:_runCharaScheduler(354086912)
  A2_34:say(A0_32, 41, 0)
  A2_34:say(A0_32, 42, 0)
  A2_34:_runCharaScheduler(354099200)
  A2_34:say(A0_32, 43, 0)
  A0_32:startFadeOut(A1_33, 1)
  A2_34:finishCliantTalkTurn()
  A0_32:_wait(1)
  A0_32:startFadeIn(A1_33, 1)
end
