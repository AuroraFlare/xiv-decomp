require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Pld0j5", "ScenarioBaseClass")
function Pld0j5.initText(A0_0)
  A0_0:_loadTextDataPermanently(9636, "pld0j5")
end
function Pld0j5.processEventJENLYNSStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:_runCharaScheduler(354099200)
  A2_3:say(A0_1, 21, 0)
  A2_3:say(A0_1, 22, 0)
  A2_3:say(A0_1, 23, 0)
  A2_3:_runCharaScheduler(354103296)
  A2_3:say(A0_1, 24, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 26, 0)
    A2_3:say(A0_1, 27, 0)
    A2_3:_waitForCharaSchedulerFinished(353959936)
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 25, 0)
    A2_3:_waitForCharaSchedulerFinished(354041856)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Pld0j5.processEvent_000_JENLYNSSFollow(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(1, A1_5)
  A2_6:_runCharaScheduler(354103296)
  A2_6:say(A0_4, 28, 0)
  A2_6:_waitForCharaSchedulerFinished(354103296)
  A2_6:finishCliantTalkTurn()
end
function Pld0j5.processEvent_005NQ_1(A0_7, A1_8, A2_9, A3_10)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("pld0j510", 1)
  if A3_10 == true then
    A0_7:startFadeInCutSceneDefault(A1_8)
  else
    A0_7:startFadeInCutSceneAfterWarp(A1_8)
  end
end
function Pld0j5.processEvent_015NQ_2(A0_11, A1_12, A2_13)
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startNQCutScene("pld0j520", 1)
  A0_11:startFadeInCutSceneDefault(A1_12)
end
function Pld0j5.processEventClear(A0_14, A1_15, A2_16)
  worldMaster:say(A0_14, 29, 0)
  desktopWidget:openPublicInformLongDialogWidget(A0_14, 31)
  A0_14:_wait(8)
  A0_14:showGetJobAbilityWidget(A1_15, 27159, 3)
  A0_14:_wait(6)
end
function Pld0j5.processEventChuui(A0_17, A1_18, A2_19)
  worldMaster:say(worldMaster, 51131, 111285, 16)
end
function Pld0j5.processEventChuui2(A0_20, A1_21, A2_22)
  worldMaster:say(worldMaster, 51132, 111285, 16)
end
