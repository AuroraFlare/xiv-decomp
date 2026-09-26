require("/Chara/Npc/NpcBaseClass")
_defineClass("MapObjShipPort", "NpcBaseClass")
function MapObjShipPort.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5, L6_6, L7_7, L8_8
  L4_4 = {L5_5}
  L5_5 = {L6_6, L7_7}
  L6_6 = "dummy"
  L7_7 = "integer32"
  L5_5 = {
    L6_6,
    L7_7,
    L8_8
  }
  L6_6 = {L7_7, L8_8}
  L7_7 = "layout"
  L8_8 = "integer16"
  L7_7 = {L8_8, "integer16"}
  L8_8 = "instance"
  L8_8 = {"baseTerm", "integer32"}
  L7_7 = A0_0
  L6_6 = A0_0.initWork
  L8_8 = L4_4
  L6_6(L7_7, L8_8, L5_5)
  L6_6 = nil
  if A1_1 == 196 or A1_1 == 496 then
    L6_6 = 600
  else
    L6_6 = 300
  end
  L7_7 = worldMaster
  L8_8 = L7_7
  L7_7 = L7_7._getServerTime
  L7_7 = L7_7(L8_8)
  L8_8 = L7_7 % L6_6
  if A1_1 == 131 or A1_1 == 321 or A1_1 == 431 then
    if L8_8 < L6_6 / 2 - 20 and L8_8 >= L6_6 / 2 - 40 then
      L8_8 = L8_8 - L6_6 / 2 + 40
      if L8_8 < 0 then
        L8_8 = 0
      end
      A0_0:_runBgSchedulerFromMidstream("stt0", L8_8)
    elseif L8_8 < L6_6 / 2 + 10 and L8_8 >= L6_6 / 2 - 10 then
      L8_8 = L8_8 - L6_6 / 2 - 10
      if L8_8 < 0 then
        L8_8 = 0
      end
      A0_0:_runBgSchedulerFromMidstream("end0", L8_8)
    end
  elseif A1_1 == 196 or A1_1 == 496 then
    if L8_8 < L6_6 / 2 then
      A0_0:_runBgSchedulerFromMidstream("spot", L8_8)
    else
      A0_0:_runBgSchedulerFromMidstream("spin", L8_8 - L6_6 / 2)
    end
  elseif L8_8 < L6_6 / 2 then
    A0_0:_runBgSchedulerFromMidstream("spin", L8_8)
  else
    A0_0:_runBgSchedulerFromMidstream("spot", L8_8 - L6_6 / 2)
  end
  A0_0:_setGroundOn(false)
end
