require("/Chara/Npc/Populace/InstanceRaidGuide/NoQuestGuideBaseClass")
_defineClass("InstanceRaidGuideCuttersCry", "NoQuestGuideBaseClass")
function InstanceRaidGuideCuttersCry.initForInstanceRaidGuide(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(9936, "instanceRaidGuideCuttersCry")
end
function InstanceRaidGuideCuttersCry.createExplainSelection_(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.doSalute
  L2_3 = L2_3(L3_4, 3, 17)
  if L2_3 == 0 then
    L3_4 = A0_1._runCharaScheduler
    L3_4(A0_1, 353959936)
  end
  L3_4 = A0_1._wait
  L3_4(A0_1, 1)
  L3_4 = A0_1.sayText_
  L3_4(A0_1, 2, 22)
  L3_4 = {
    4,
    5,
    6,
    7
  }
  return 3, L3_4, A1_2, A1_2, A1_2
end
function InstanceRaidGuideCuttersCry.processExplainSelected_(A0_5, A1_6, A2_7, A3_8, A4_9, A5_10, A6_11)
  if A1_6 == 1 then
    A0_5:sayText_(8, 23)
    A0_5:sayText_(9, 24)
    A0_5:sayText_(10, 25)
    A0_5:sayText_(21, 26)
    A0_5:sayText_(11, 27)
    return false
  elseif A1_6 == 2 then
    A0_5:sayText_(12, 28)
    if A3_8 == A4_9 then
      worldMaster:say(A0_5, 13, A2_7, A6_11, A3_8)
    else
      worldMaster:say(A0_5, 18, A2_7, A6_11, A3_8, A4_9)
    end
    A0_5:sayText_(14, 29)
    worldMaster:say(A0_5, 15, A2_7, A5_10)
    A0_5:sayText_(16, 30)
    worldMaster:say(A0_5, 17, A2_7)
    return false
  elseif A1_6 == 3 then
    A0_5:sayText_(19, 31)
    return true
  elseif A1_6 == 4 then
    return nil
  end
  return nil
end
function InstanceRaidGuideCuttersCry.sayText_(A0_12, A1_13, A2_14)
  if A0_12:isUpperRank(3, 17) then
    A0_12:say(A0_12, A1_13, 0)
  else
    A0_12:say(A0_12, A2_14, 0)
  end
end
