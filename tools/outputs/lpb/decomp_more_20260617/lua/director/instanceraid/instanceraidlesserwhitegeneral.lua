require("/Director/InstanceRaid/InstanceRaidBaseClass")
_defineClass("InstanceRaidLesserWhiteGeneral", "InstanceRaidBaseClass")
function InstanceRaidLesserWhiteGeneral.processStartEvent(A0_0, A1_1)
  A0_0:executeCutScene("gc010715", A1_1, true)
end
function InstanceRaidLesserWhiteGeneral.processCutSceneEvent(A0_2, A1_3, A2_4, A3_5)
  worldMaster:_getMyPlayer():_fadeOut(1)
  worldMaster:_getMyPlayer():_waitForFading()
  worldMaster:_getMyPlayer():_setWeather(A3_5, 0)
  A0_2:executeCutScene(A1_3, A2_4, true)
  worldMaster:_getMyPlayer():_fadeIn(1)
  A0_2:_wait(1)
end
function InstanceRaidLesserWhiteGeneral.processDummy(A0_6)
  local L1_7
end
