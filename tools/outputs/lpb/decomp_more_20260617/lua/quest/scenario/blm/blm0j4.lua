require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Blm0j4", "ScenarioBaseClass")
function Blm0j4.initText(A0_0)
  A0_0:_loadTextDataPermanently(8660, "blm0j4")
end
function Blm0j4.processEvent_hint(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(70017024)
  A2_3:say(A0_1, 27, 0)
  worldMaster:say(A0_1, 28, 0)
  A2_3:finishCliantTalkTurn()
end
function Blm0j4.processEventDOZOLMELOCStart(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(70017024)
  A2_6:say(A0_4, 2, 0)
  if A2_6:ask(A0_4, 29, 2) == 1 then
    A2_6:say(A0_4, 3, 0)
  else
    A2_6:say(A0_4, 32, 0)
  end
  A2_6:_runCharaScheduler(70017024)
  A2_6:say(A0_4, 4, 0)
  A2_6:say(A0_4, 34, 0)
  A2_6:say(A0_4, 5, 0)
  A2_6:say(A0_4, 39, 0)
  A2_6:say(A0_4, 6, 0)
  A2_6:say(A0_4, 41, 0)
  A2_6:_runCharaScheduler(70017024)
  A2_6:say(A0_4, 7, 0)
  A2_6:say(A0_4, 35, 0)
  A2_6:say(A0_4, 9, 0)
  A2_6:_runCharaScheduler(70017024)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 36, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:say(A0_4, 38, 0)
  A2_6:say(A0_4, 37, 0)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:_runCharaScheduler(70017024)
    A2_6:say(A0_4, 15, 0)
  else
    A2_6:_runCharaScheduler(70017024)
    A2_6:say(A0_4, 14, 0)
  end
  A2_6:finishCliantTalkTurn()
  return (A0_4:showQuestInfomation())
end
function Blm0j4.processEvent005(A0_7, A1_8, A2_9)
  worldMaster:say(A0_7, 24, 0)
  A0_7:sayFreeDisplayName(4000257, A0_7, 25)
end
function Blm0j4.processEvent000_DOZOLMELOC(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(70017024)
  A2_12:say(A0_10, 16, 0)
  A2_12:say(A0_10, 17, 0)
  A2_12:_runCharaScheduler(70017024)
  A2_12:say(A0_10, 18, 0)
  A2_12:say(A0_10, 19, 0)
  A2_12:finishCliantTalkTurn()
end
function Blm0j4.processEvent000_LALAI(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(353964032)
  A2_15:say(A0_13, 26, 0)
  A2_15:finishCliantTalkTurn()
end
function Blm0j4.processEvent000_KAZAGGCHAH(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(70017024)
  A2_18:say(A0_16, 20, 0)
  A2_18:say(A0_16, 21, 0)
  A2_18:finishCliantTalkTurn()
end
function Blm0j4.processEvent000_DAZA(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(70017024)
  A2_21:say(A0_19, 22, 0)
  A2_21:say(A0_19, 23, 0)
  A2_21:finishCliantTalkTurn()
end
function Blm0j4.processEvent000_SEKIHI(A0_22, A1_23, A2_24)
  worldMaster:say(A0_22, 33, 0)
end
function Blm0j4.onJobQuestCompleteFirst(A0_25, A1_26)
  desktopWidget:openPublicInformLongDialogWidget(A0_25, 40)
  A0_25:_wait(8)
end
function Blm0j4.onJobQuestCompleteSecond(A0_27, A1_28)
  A0_27:showGetJobAbilityWidget(A1_28, 27317, 2)
  A0_27:_wait(6)
end
function Blm0j4.processEventChuui(A0_29, A1_30, A2_31)
  worldMaster:say(worldMaster, 51131, 111264, 26)
end
function Blm0j4.processEventChuui2(A0_32, A1_33, A2_34)
  worldMaster:say(worldMaster, 51132, 111264, 26)
end
