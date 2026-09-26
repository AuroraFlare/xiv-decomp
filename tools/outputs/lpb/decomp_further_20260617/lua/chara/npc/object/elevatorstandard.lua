require("/Chara/Npc/NpcBaseClass")
_defineClass("ElevatorStandard", "NpcBaseClass")
function ElevatorStandard.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(2112, "elevatorStandard")
end
function ElevatorStandard.elevatorAskLimsa001(A0_1, A1_2)
  if A1_2 == 0 then
    return (A0_1:ask(A0_1, 13, 3))
  elseif A1_2 == 1 then
    A0_1:playElevatorCutSeane("elv0l012")
  elseif A1_2 == 2 then
    A0_1:playElevatorCutSeane("elv0l01a")
  end
end
function ElevatorStandard.elevatorAskLimsa002(A0_3, A1_4)
  if A1_4 == 0 then
    return (A0_3:ask(A0_3, 17, 3))
  elseif A1_4 == 1 then
    A0_3:playElevatorCutSeane("elv0l021")
  elseif A1_4 == 2 then
    A0_3:playElevatorCutSeane("elv0l02a")
  end
end
function ElevatorStandard.elevatorAskLimsa003(A0_5, A1_6)
  local L2_7
  if A1_6 == 0 then
    return (A0_5:ask(A0_5, 21, 3))
  elseif A1_6 == 1 then
    A0_5:playElevatorCutSeane("elv0l0a1")
  elseif A1_6 == 2 then
    A0_5:playElevatorCutSeane("elv0l0a2")
  end
end
function ElevatorStandard.elevatorAskUldah001(A0_8, A1_9)
  if A1_9 == 0 then
    return (A0_8:ask(A0_8, 25, 3))
  elseif A1_9 == 1 then
    A0_8:playElevatorCutSeane("elv0u012")
  elseif A1_9 == 2 then
    A0_8:playElevatorCutSeane("elv0u01a")
  end
end
function ElevatorStandard.elevatorAskUldah002(A0_10, A1_11)
  if A1_11 == 0 then
    return (A0_10:ask(A0_10, 29, 3))
  elseif A1_11 == 1 then
    A0_10:playElevatorCutSeane("elv0u021")
  elseif A1_11 == 2 then
    A0_10:playElevatorCutSeane("elv0u02a")
  end
end
function ElevatorStandard.elevatorAskUldah003(A0_12, A1_13)
  if A1_13 == 0 then
    return (A0_12:ask(A0_12, 33, 3))
  elseif A1_13 == 1 then
    A0_12:playElevatorCutSeane("elv0u0a1")
  elseif A1_13 == 2 then
    A0_12:playElevatorCutSeane("elv0u0a2")
  end
end
function ElevatorStandard.elevatorQuestAskEvent(A0_14, A1_15)
  local L2_16, L3_17, L4_18, L5_19, L6_20
  L3_17 = A0_14
  L2_16 = A0_14.ask
  L4_18 = worldMaster
  L5_19 = 25015
  L6_20 = 2
  L2_16 = L2_16(L3_17, L4_18, L5_19, L6_20, A1_15:getQuestId())
  return L2_16
end
function ElevatorStandard.playElevatorCutSeane(A0_21, A1_22)
  local L2_23
  L2_23 = 1
  worldMaster:_getMyPlayer():_fadeOut(L2_23)
  worldMaster:_getMyPlayer():_waitForFading()
  worldMaster:createCutScene(A1_22, A0_21):_delete()
  worldMaster:_getMyPlayer():_fadeInAfterWarp()
end
