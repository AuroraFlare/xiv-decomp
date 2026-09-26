require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Exc400", "ScenarioBaseClass")
function Exc400.initText(A0_0)
  A0_0:_loadTextDataPermanently(287, "exc400")
end
function Exc400.processEventWaekbyrtStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A2_3:ask(A0_1, 6, 2) == 1 then
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A2_3:ask(A0_1, 6, 2))
end
function Exc400.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Exc400.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startFadeInCutSceneDefault(A1_8)
  return 1
end
function Exc400.processEvent023(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(1, A1_11)
  A2_12:say(A0_10, 31, 0)
  A2_12:say(A0_10, 32, 0)
  A2_12:say(A0_10, 33, 0)
  A2_12:say(A0_10, 34, 0)
  A2_12:say(A0_10, 35, 0)
  if A2_12:ask(A0_10, 6, 2) == 1 then
    A2_12:say(A0_10, 39, 0)
  else
  end
  A2_12:finishCliantTalkTurn()
  return (A2_12:ask(A0_10, 6, 2))
end
function Exc400.processEvent027(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(1, A1_14)
  A2_15:say(A0_13, 40, 0)
  A2_15:say(A0_13, 41, 0)
  A2_15:finishCliantTalkTurn()
end
function Exc400.processEvent030(A0_16, A1_17, A2_18)
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startFadeInCutSceneDefault(A1_17)
end
function Exc400.processEvent032(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(1, A1_20)
  A2_21:say(A0_19, 66, 0)
  A2_21:finishCliantTalkTurn()
end
function Exc400.processEvent035(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(1, A1_23)
  A2_24:say(A0_22, 67, 0)
  A2_24:finishCliantTalkTurn()
end
function Exc400.processEvent038(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(1, A1_26)
  A2_27:finishCliantTalkTurn()
end
function Exc400.processEvent040(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startFadeInCutSceneDefault(A1_29)
end
function Exc400.processEvent060(A0_31, A1_32, A2_33)
  A0_31:startFadeOutCutSceneDefault(A1_32)
  A0_31:startFadeInCutSceneDefault(A1_32)
end
function Exc400.processEvent070(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(1, A1_35)
  A2_36:say(A0_34, 90, 0)
  A2_36:say(A0_34, 91, 0)
  A2_36:say(A0_34, 92, 0)
  A2_36:say(A0_34, 93, 0)
  A2_36:finishCliantTalkTurn()
end
function Exc400.processEvent000(A0_37, A1_38, A2_39)
  if A2_39:ask(A0_37, 6, 2) == 1 then
  end
end
function Exc400.processEvent111(A0_40, A1_41, A2_42)
end
