require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl0i4", "ScenarioBaseClass")
function Spl0i4.initText(A0_0)
  A0_0:_loadTextDataPermanently(5731, "spl0i4")
end
function Spl0i4.processEventStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 38, 0)
  if A3_4 == 0 then
    A2_3:say(A0_1, 70, 0)
    A2_3:_runCharaScheduler(353980416)
    A2_3:say(A0_1, 71, 0)
  end
  A2_3:say(A0_1, 39, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 40, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354066432)
    A2_3:say(A0_1, 42, 0)
    A2_3:say(A0_1, 43, 0)
    A2_3:_runCharaScheduler(353968128)
    A2_3:say(A0_1, 44, 0)
    A2_3:say(A0_1, 45, 0)
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 46, 0)
  else
    A2_3:_runCharaScheduler(354082816)
    A2_3:say(A0_1, 41, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Spl0i4.processEventStartAfter(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(353959936)
  A2_7:say(A0_5, 47, 0)
  A2_7:say(A0_5, 48, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Spl0i4.processEvent04(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:_runCharaScheduler(353959936)
  A2_10:say(A0_8, 50, 0)
  A2_10:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventA(A0_11, A1_12, A2_13)
  worldMaster:say(A0_11, 49, 0)
  return
end
function Spl0i4.processEventB(A0_14, A1_15, A2_16)
  worldMaster:say(A0_14, 51, 0)
  return
end
function Spl0i4.processEventC(A0_17, A1_18, A2_19)
  worldMaster:say(A0_17, 52, 0)
  return
end
function Spl0i4.processEventNQ(A0_20, A1_21, A2_22)
  A0_20:startFadeOutCutSceneDefault(A1_21)
  A0_20:startNQCutScene("spl0i410", 1)
  A0_20:startFadeInCutSceneDefault(A1_21)
  return
end
function Spl0i4.processEventClear(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(353972224)
  A2_25:say(A0_23, 58, 0)
  A2_25:say(A0_23, 59, 0)
  A0_23:startFadeOut(A1_24, 1.5)
  A0_23:_wait(1)
  A2_25:_runCharaScheduler(354086912)
  A0_23:_wait(0.5)
  A0_23:startFadeIn(A1_24, 1.5)
  A2_25:say(A0_23, 60, 0)
  A2_25:say(A0_23, 61, 0)
  A2_25:_runCharaScheduler(353959936)
  A2_25:say(A0_23, 62, 0)
  A2_25:say(A0_23, 63, 0)
  A1_24:_runCharaScheduler(354111488)
  A2_25:_runCharaScheduler(354107392)
  A2_25:say(A0_23, 64, 0)
  A2_25:say(A0_23, 65, 0)
  A2_25:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventClearAfter(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:_runCharaScheduler(353959936)
  A2_28:say(A0_26, 66, 0)
  A2_28:say(A0_26, 67, 0)
  A2_28:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventHin(A0_29, A1_30, A2_31, A3_32, A4_33)
  A2_31:startCliantTalkTurn(2, A1_30)
  if A4_33 == 1 then
    if A3_32 == 1 then
      A2_31:_runCharaScheduler(353959936)
      A2_31:say(A0_29, 2, 0)
      A2_31:say(A0_29, 3, 0)
      A2_31:_runCharaScheduler(353964032)
      A2_31:say(A0_29, 4, 0)
      A2_31:say(A0_29, 5, 0)
    elseif A3_32 == 2 then
      A2_31:_runCharaScheduler(353959936)
      A2_31:say(A0_29, 14, 0)
      A2_31:say(A0_29, 15, 0)
      A2_31:_runCharaScheduler(353968128)
      A2_31:say(A0_29, 16, 0)
      A2_31:say(A0_29, 17, 0)
    elseif A3_32 == 3 then
      A2_31:_runCharaScheduler(353959936)
      A2_31:say(A0_29, 27, 0)
      A2_31:say(A0_29, 28, 0)
      A2_31:_runCharaScheduler(353964032)
      A2_31:say(A0_29, 29, 0)
      A2_31:say(A0_29, 30, 0)
    end
  elseif A3_32 == 1 then
    A2_31:_runCharaScheduler(353959936)
    A2_31:say(A0_29, 6, 0)
    A2_31:say(A0_29, 7, 0)
    A2_31:_runCharaScheduler(353972224)
    A2_31:say(A0_29, 8, 0)
    A2_31:say(A0_29, 9, 0)
    A2_31:_runCharaScheduler(353964032)
    A2_31:say(A0_29, 10, 0)
  elseif A3_32 == 2 then
    A2_31:_runCharaScheduler(353976320)
    A2_31:say(A0_29, 18, 0)
    A2_31:say(A0_29, 19, 0)
    A2_31:say(A0_29, 20, 0)
    A2_31:_runCharaScheduler(353968128)
    A2_31:say(A0_29, 21, 0)
    A2_31:say(A0_29, 22, 0)
  elseif A3_32 == 3 then
    A2_31:_runCharaScheduler(354086912)
    A2_31:say(A0_29, 31, 0)
    A2_31:say(A0_29, 32, 0)
    A2_31:say(A0_29, 33, 0)
    A2_31:say(A0_29, 34, 0)
  end
  A2_31:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventClearAfterItem(A0_34, A1_35, A2_36, A3_37)
  A2_36:startCliantTalkTurn(2, A1_35)
  if A3_37 == 1 then
    A2_36:_runCharaScheduler(353959936)
    A2_36:say(A0_34, 11, 0)
    A2_36:say(A0_34, 12, 0)
  elseif A3_37 == 2 then
    A2_36:_runCharaScheduler(353959936)
    A2_36:say(A0_34, 23, 0)
    A2_36:say(A0_34, 24, 0)
    A2_36:say(A0_34, 25, 0)
  elseif A3_37 == 3 then
    A2_36:_runCharaScheduler(353959936)
    A2_36:say(A0_34, 35, 0)
    A2_36:say(A0_34, 36, 0)
  end
  A2_36:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventClearAfterItemAfter(A0_38, A1_39, A2_40, A3_41)
  A2_40:startCliantTalkTurn(2, A1_39)
  if A3_41 == 1 then
    A2_40:_runCharaScheduler(353959936)
    A2_40:say(A0_38, 13, 0)
  elseif A3_41 == 2 then
    A2_40:_runCharaScheduler(353959936)
    A2_40:say(A0_38, 26, 0)
  elseif A3_41 == 3 then
    A2_40:_runCharaScheduler(353959936)
    A2_40:say(A0_38, 37, 0)
  end
  A2_40:finishCliantTalkTurn()
  return
end
function Spl0i4.processEventSnowdefo(A0_42, A1_43, A2_44, A3_45)
  worldMaster:say(A0_42, 53, 0)
  return
end
