require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjFireworks", "NpcBaseClass")
function MapObjFireworks.initForEvent(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = {L4_4}
  L4_4 = {"dummy", "integer32"}
  L4_4 = {
    {"layout", "integer16"},
    {"instance", "integer16"},
    {"fire", "boolean"}
  }
  A0_0:initWork(L3_3, L4_4)
  A0_0:_setGroundOn(false)
  A0_0:_setLoopInterval(10)
end
function MapObjFireworks._onLoop(A0_5)
  local L1_6, L2_7
  L1_6 = A0_5.work
  L1_6 = L1_6.fire
  if L1_6 == false then
    L1_6 = worldMaster
    L2_7 = L1_6
    L1_6 = L1_6._getServerTime
    L1_6 = L1_6(L2_7)
    L2_7 = _math
    L2_7 = L2_7.floor
    L2_7 = L2_7(L1_6 / 86400)
    L2_7 = L2_7 * 5
    if worldMaster:isHydaelynNight(L1_6) then
      A0_5:_runBgScheduler(A0_5:getFireworksSchedulor(1, L2_7))
      A0_5:_wait(2)
      A0_5:_runBgScheduler(A0_5:getFireworksSchedulor(2, L2_7))
      A0_5:_wait(2)
      A0_5:_runBgScheduler(A0_5:getFireworksSchedulor(3, L2_7))
      A0_5:_wait(3)
      A0_5:_runBgScheduler(A0_5:getFireworksSchedulor(4, L2_7))
      A0_5:_wait(2)
      A0_5:_runBgScheduler(A0_5:getFireworksSchedulor(5, L2_7))
      A0_5.work.fire = true
    end
  else
    L1_6 = A0_5.work
    L1_6.fire = false
  end
end
function MapObjFireworks.getFireworksSchedulor(A0_8, A1_9, A2_10)
  local L3_11, L4_12, L5_13
  if A1_9 == 1 or A1_9 == 4 then
    L3_11 = "l"
  elseif A1_9 == 2 then
    L3_11 = "c"
  else
    L3_11 = "r"
  end
  L4_12 = math
  L5_13 = L4_12
  L4_12 = L4_12._randomIntegerWithSeed
  L4_12 = L4_12(L5_13, 1, 5, A2_10 + A1_9)
  L5_13 = tostring
  L5_13 = L5_13(L4_12)
  return "v_" .. L3_11 .. L5_13
end
