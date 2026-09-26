require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Trl0g1", "ScenarioBaseClass")
function Trl0g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(2152, "trl0g1")
end
function Trl0g1.processEventMiounneStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 10, 0)
  A2_3:say(A0_1, 11, 0)
  A2_3:finishCliantTalkTurn()
  return (A2_3:ask(A0_1, 12, 3))
end
function Trl0g1.processEvent225(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("man0g225", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Trl0g1.processEvent230(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("man0g230", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
