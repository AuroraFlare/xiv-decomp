require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("DftSrt", "ScenarioBaseClass")
function DftSrt.initText(A0_0)
  A0_0:_loadTextDataPermanently(69, "dftSrt")
end
function DftSrt.defaultTalkWithPilot_001(A0_1, A1_2, A2_3)
  A2_3:say(A0_1, 1, 0)
end
function DftSrt.eventDeparture(A0_4, A1_5, A2_6, A3_7, A4_8)
  local L5_9
  L5_9 = worldMaster
  L5_9 = L5_9._getMyPlayer
  L5_9 = L5_9(L5_9)
  A0_4:startFadeOutCutSceneDefault(L5_9)
  A0_4:startNQCutScene(A3_7, 1)
  if A4_8 ~= nil then
    A0_4:startNQCutScene(A4_8, 1)
  end
  A0_4:startFadeInCutSceneAfterWarp(L5_9)
end
