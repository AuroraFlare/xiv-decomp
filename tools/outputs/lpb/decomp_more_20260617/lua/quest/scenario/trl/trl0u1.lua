require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Trl0u1", "ScenarioBaseClass")
function Trl0u1.initText(A0_0)
  A0_0:_loadTextDataPermanently(2178, "trl0u1")
end
function Trl0u1.processEventMomodiStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:finishCliantTalkTurn()
  return (A2_3:ask(A0_1, 10, 3))
end
function Trl0u1.processEvent235(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("man0u235", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Trl0u1.processEvent240(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("man0u240", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
