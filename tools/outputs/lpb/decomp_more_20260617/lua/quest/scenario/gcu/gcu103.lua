require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu103", "ScenarioBaseClass")
function Gcu103.initText(A0_0)
  A0_0:_loadTextDataPermanently(8100, "gcu103")
end
function Gcu103.processEvent_000_AUBREYStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354062336)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 86, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354099200)
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 8, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcu103.processEvent_000_AUBREYFollow(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 10, 0)
  A2_6:_runCharaScheduler(354000896)
  A2_6:say(A0_4, 11, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcu103.processEvent_000_ELINEAfterOffer(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353964032)
  A2_9:say(A0_7, 12, 0)
  A2_9:say(A0_7, 13, 0)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 14, 0)
  A2_9:say(A0_7, 15, 0)
  A2_9:finishCliantTalkTurn()
end
function Gcu103.processEvent_005_RAUBAHN(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(1, A1_11)
  A2_12:_runCharaScheduler(353980416)
  A2_12:say(A0_10, 16, 0)
  A2_12:say(A0_10, 17, 0)
  A2_12:_runCharaScheduler(353964032)
  A2_12:say(A0_10, 18, 0)
  A2_12:say(A0_10, 19, 0)
  A2_12:_runCharaScheduler(354082816)
  A2_12:say(A0_10, 20, 0)
  A2_12:say(A0_10, 21, 0)
  A2_12:_runCharaScheduler(354000896)
  A2_12:say(A0_10, 22, 0)
  A2_12:say(A0_10, 23, 0)
  A2_12:_runCharaScheduler(353972224)
  A2_12:say(A0_10, 24, 0)
  A2_12:say(A0_10, 83, 0)
  A2_12:say(A0_10, 84, 0)
  A2_12:say(A0_10, 65, 0)
  A2_12:_runCharaScheduler(354099200)
  A2_12:say(A0_10, 66, 0)
end
function Gcu103.processEvent_010_NQ_1(A0_13, A1_14, A2_15, A3_16)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("gc01u320", 1)
  A0_13:startFadeInCutSceneDefault(A1_14)
end
function Gcu103.processEvent_015_FUMETSU01(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  if A2_19:isUpperRank(3, 27) == true then
    A2_19:say(A0_17, 67, 0)
  else
    A2_19:say(A0_17, 68, 0)
  end
  A2_19:finishCliantTalkTurn()
end
function Gcu103.processEvent_015_FUMETSU02(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  if A2_22:isUpperRank(3, 27) == true then
    A2_22:say(A0_20, 69, 0)
    A2_22:say(A0_20, 71, 0)
  else
    A2_22:say(A0_20, 70, 0)
    A2_22:say(A0_20, 72, 0)
  end
  A2_22:finishCliantTalkTurn()
end
function Gcu103.processEvent_015_FUMETSU03(A0_23, A1_24, A2_25)
  A2_25:say(A0_23, 73, 0)
end
function Gcu103.processEvent_015_FUMETSU04(A0_26, A1_27, A2_28)
  A2_28:say(A0_26, 74, 0)
end
function Gcu103.processEvent_015_FUMETSU05(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  if A2_31:isUpperRank(3, 27) == true then
    A2_31:say(A0_29, 75, 0)
    A2_31:say(A0_29, 77, 0)
    A2_31:say(A0_29, 79, 0)
  else
    A2_31:say(A0_29, 76, 0)
    A2_31:say(A0_29, 78, 0)
    A2_31:say(A0_29, 80, 0)
  end
  A2_31:finishCliantTalkTurn()
end
function Gcu103.processEvent_025_NQ_2(A0_32, A1_33, A2_34, A3_35)
  A0_32:startFadeOutCutSceneDefault(A1_33)
  A0_32:startNQCutScene("gc01u310", 1)
  A0_32:startFadeInCutSceneDefault(A1_33)
end
