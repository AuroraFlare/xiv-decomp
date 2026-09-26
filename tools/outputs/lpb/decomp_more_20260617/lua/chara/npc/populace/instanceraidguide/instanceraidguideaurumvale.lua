require("/Chara/Npc/Populace/InstanceRaidGuide/NoQuestGuideBaseClass")
_defineClass("InstanceRaidGuideAurumVale", "NoQuestGuideBaseClass")
function InstanceRaidGuideAurumVale.initForInstanceRaidGuide(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(9920, "instanceRaidGuideAurumVale")
end
function InstanceRaidGuideAurumVale.createExplainSelection_(A0_1, A1_2)
  local L2_3
  L2_3 = A0_1.say
  L2_3(A0_1, A0_1, 2, 0)
  L2_3 = {
    4,
    5,
    6,
    7
  }
  return 3, L2_3, A1_2, A1_2, A1_2
end
function InstanceRaidGuideAurumVale.processExplainSelected_(A0_4, A1_5, A2_6, A3_7, A4_8, A5_9, A6_10)
  if A1_5 == 1 then
    A0_4:say(A0_4, 8, 0)
    A0_4:say(A0_4, 9, 0)
    A0_4:say(A0_4, 10, 0)
    A0_4:say(A0_4, 11, 0)
    return false
  elseif A1_5 == 2 then
    A0_4:say(A0_4, 12, 0)
    if A3_7 == A4_8 then
      worldMaster:say(A0_4, 13, A2_6, A6_10, A3_7)
    else
      worldMaster:say(A0_4, 19, A2_6, A6_10, A3_7, A4_8)
    end
    worldMaster:say(A0_4, 18)
    A0_4:say(A0_4, 14, 0)
    worldMaster:say(A0_4, 15, A2_6, A5_9)
    A0_4:say(A0_4, 16, 0)
    worldMaster:say(A0_4, 17, A2_6)
    return false
  elseif A1_5 == 3 then
    A0_4:say(A0_4, 22, 0)
    return true
  elseif A1_5 == 4 then
    return nil
  end
  return nil
end
