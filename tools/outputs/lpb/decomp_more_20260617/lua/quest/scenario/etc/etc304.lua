require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc304", "ScenarioBaseClass")
function Etc304.initText(A0_0)
  A0_0:_loadTextDataPermanently(10448, "etc304")
end
function Etc304.processEventLim(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(1, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(354066432)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:say(A0_1, 10, 0)
  A2_3:_runCharaScheduler(354078720)
  A2_3:say(A0_1, 11, 0)
  A2_3:say(A0_1, 12, 0)
  A2_3:finishCliantTalkTurn()
end
function Etc304.processEventGri(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(2, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 142, 0)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 143, 0)
  A2_6:say(A0_4, 144, 0)
  A2_6:_runCharaScheduler(354066432)
  A2_6:say(A0_4, 145, 0)
  A2_6:say(A0_4, 146, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 147, 0)
  A2_6:say(A0_4, 148, 0)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 149, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc304.processEventUld(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(3, 33) == 0 then
    A2_9:_runCharaScheduler(353959936)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 150, 0)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 151, 0)
  A2_9:say(A0_7, 152, 0)
  A2_9:_runCharaScheduler(354041856)
  A2_9:say(A0_7, 153, 0)
  A2_9:say(A0_7, 154, 0)
  A2_9:_runCharaScheduler(353964032)
  A2_9:say(A0_7, 155, 0)
  A2_9:say(A0_7, 156, 0)
  A2_9:_runCharaScheduler(354066432)
  A2_9:say(A0_7, 157, 0)
  A2_9:finishCliantTalkTurn()
end
function Etc304.processEventStart(A0_10, A1_11, A2_12, A3_13)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startFadeInCutSceneDefault(A1_11)
  return (A0_10:startNQCutScene("gc010810", 2, 0, A3_13))
end
function Etc304.processEventFree(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(353968128)
  A2_16:say(A0_14, 2, 0)
  A2_16:say(A0_14, 3, 0)
  desktopWidget:openPublicInformDialogWidget(A0_14, 4)
  worldMaster:say(A0_14, 4, 0)
  A0_14:_wait(3)
  A2_16:finishCliantTalkTurn()
end
function Etc304.processEventPray(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22, A6_23)
  local L7_24
  L7_24 = A3_20
  if L7_24 == 11 then
    A0_17:startFadeOutCutSceneDefault(A1_18)
    A0_17:startNQCutScene("gc010820", 1, 0)
    A0_17:startFadeInCutSceneDefault(A1_18)
    break
  else
  end
  if L7_24 == 10 then
    A0_17:startFadeOutCutSceneDefault(A1_18)
    A0_17:startNQCutScene("gc010830", 1, 0)
    A0_17:startFadeInCutSceneDefault(A1_18)
    break
  else
  end
  if L7_24 == 5 then
    A0_17:startFadeOutCutSceneDefault(A1_18)
    A0_17:startNQCutScene("gc010840", 1, 0)
    A0_17:startFadeInCutSceneDefault(A1_18)
    break
  else
  end
  if L7_24 == 1 then
    A0_17:startFadeOutCutSceneDefault(A1_18)
    A0_17:startNQCutScene("gc010850", 1, 0, A6_23)
    if worldMaster:_getSpecialEventWork(9) == 20 then
      A0_17:setMusic(A1_18, 29, 1)
    end
    A0_17:startFadeInCutSceneDefault(A1_18)
    break
  else
  end
  if L7_24 == 3 then
    A0_17:startFadeOutCutSceneDefault(A1_18)
    A0_17:startNQCutScene("gc010860", 1, 0)
    A0_17:startFadeInCutSceneDefault(A1_18)
    break
  else
  end
  A2_19:_runBgScheduler("von1", nil)
  A0_17:_wait(4)
  L7_24 = 0
  if A3_20 == 1 then
  else
  end
  if A3_20 == 2 then
    L7_24 = 97
    break
  elseif A3_20 == 3 then
  else
  end
  if A3_20 == 4 then
    L7_24 = 119
    break
  elseif A3_20 == 5 then
  else
  end
  if A3_20 == 6 then
    L7_24 = 100
    break
  elseif A3_20 == 7 then
  else
  end
  if A3_20 == 8 then
    L7_24 = 64
    break
  elseif A3_20 == 9 then
  elseif A3_20 == 13 then
  else
  end
  if A3_20 == 10 then
    L7_24 = 67
    break
  elseif A3_20 == 11 then
  else
  end
  if A3_20 == 12 then
    L7_24 = 59
    do break end
    break
  else
  end
  if L7_24 ~= 0 then
    desktopWidget:openPublicInformDialogWidget(A0_17, L7_24)
    worldMaster:notify(A0_17, L7_24)
    A0_17:_wait(3)
  end
  A1_18:_runCharaScheduler(67108920)
  worldMaster:say(worldMaster, 52084, A4_21, A5_22)
end
function Etc304.processEventTutorial(A0_25, A1_26, A2_27)
  desktopWidget:openPublicInformDialogWidget(A0_25, 4)
  worldMaster:say(A0_25, 4, 0)
end
function Etc304.processAfterQuestRewardWidget(A0_28, A1_29, A2_30)
  A0_28:_wait(5)
  if desktopWidget:openEventModeWidgetYield("ExtraBossInfomationWidget") == true then
    A0_28:_wait(4)
    worldMaster:say(A0_28, 158)
    desktopWidget:closeEventModeWidget("ExtraBossInfomationWidget")
  end
end
function Etc304.processEventHiseki(A0_31, A1_32, A2_33)
  local L3_34, L4_35
  L4_35 = A2_33
  L3_34 = A2_33.getActorClassId
  L3_34 = L3_34(L4_35)
  L4_35 = 0
  if L3_34 == 1080134 then
    L4_35 = 11
  elseif L3_34 == 1080135 then
    L4_35 = 12
  elseif L3_34 == 1080129 then
    L4_35 = 7
  elseif L3_34 == 1080130 then
    L4_35 = 8
  elseif L3_34 == 1080131 then
    L4_35 = 9
  elseif L3_34 == 1080132 or L3_34 == 1080133 then
    L4_35 = 10
  elseif L3_34 == 1080123 then
    L4_35 = 1
  elseif L3_34 == 1080124 then
    L4_35 = 2
  elseif L3_34 == 1080128 then
    L4_35 = 6
  elseif L3_34 == 1080127 then
    L4_35 = 5
  elseif L3_34 == 1080126 then
    L4_35 = 4
  elseif L3_34 == 1080125 then
    L4_35 = 3
  end
  if L4_35 ~= 0 then
    worldMaster:say(A0_31, 120, L4_35)
  end
end
