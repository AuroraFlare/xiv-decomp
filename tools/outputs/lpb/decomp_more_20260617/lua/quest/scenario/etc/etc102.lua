require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc102", "ScenarioBaseClass")
function Etc102.initText(A0_0)
  A0_0:_loadTextDataPermanently(7408, "etc102")
end
function Etc102.processEventSwynbroesStart(A0_1, A1_2, A2_3)
  A2_3:_runCharaScheduler(354082816)
  A2_3:say(A0_1, 3, 0)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 28, 0)
  A2_3:_runCharaScheduler(354004992)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 29, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 27, 0)
    A2_3:say(A0_1, 7, 0)
    A2_3:_runCharaScheduler(354103296)
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 30, 0)
    A2_3:say(A0_1, 31, 0)
    A2_3:say(A0_1, 10, 0)
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 11, 0)
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 32, 0)
    A2_3:_runCharaScheduler(354107392)
    A2_3:say(A0_1, 13, 0)
    A2_3:say(A0_1, 33, 0)
    worldMaster:say(A0_1, 14, 0)
    worldMaster:say(A0_1, 19, 0)
    A2_3:say(A0_1, 34, 0)
    worldMaster:say(A0_1, 18, 0)
    A2_3:_runCharaScheduler(353984512)
    A2_3:say(A0_1, 17, 0)
  else
    A2_3:_runCharaScheduler(353980416)
    A2_3:say(A0_1, 5, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc102.processEventSwynbroesStartYet(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353980416)
  A0_4:_wait(1)
  A2_6:say(A0_4, 2, 0)
  worldMaster:say(A0_4, 36, 0)
  A2_6:finishCliantTalkTurn()
end
function Etc102.processEvent_000(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12, L6_13, L7_14, L8_15
  L4_11 = A2_9
  L3_10 = A2_9.startCliantTalkTurn
  L3_10(L4_11, L5_12, L6_13)
  L4_11 = A2_9
  L3_10 = A2_9._runCharaScheduler
  L3_10(L4_11, L5_12)
  L4_11 = A1_8
  L3_10 = A1_8._getItemPackageCapacity
  L3_10 = L3_10(L4_11, L5_12)
  L4_11 = 0
  for L8_15 = 1, L3_10 do
    if A0_7:checkEquipItemMaterialize(A1_8, L8_15) == 2 then
      L4_11 = 2
      break
    elseif A0_7:checkEquipItemMaterialize(A1_8, L8_15) == 1 then
      L4_11 = 1
    end
  end
  if L4_11 == 2 then
    L5_12(L6_13, L7_14)
    L8_15 = 16
    L5_12(L6_13, L7_14, L8_15, 0)
    L8_15 = 18
    L5_12(L6_13, L7_14, L8_15, 0)
  elseif L4_11 == 1 then
    L5_12(L6_13, L7_14)
    L8_15 = 37
    L5_12(L6_13, L7_14, L8_15, 0)
  else
    L8_15 = 15
    L5_12(L6_13, L7_14, L8_15, 0)
    L8_15 = 19
    L5_12(L6_13, L7_14, L8_15, 0)
    L8_15 = 14
    L5_12(L6_13, L7_14, L8_15, 0)
  end
  L5_12(L6_13)
end
function Etc102.checkEquipItemMaterialize(A0_16, A1_17, A2_18)
  if A1_17:_getItem(1, A2_18) ~= nil then
    if A1_17:_getItem(1, A2_18):getNormalItemFitness() >= 10000 then
      if A1_17:_getItem(1, A2_18):getMaterializePermission() == true then
        return 2
      else
        return 1
      end
    else
      return 0
    end
  end
end
function Etc102.processEvent_005(A0_19, A1_20, A2_21, A3_22)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(353980416)
  A0_19:_wait(1)
  A2_21:say(A0_19, 22, 0)
  if A3_22 == 1 then
    A2_21:_runCharaScheduler(353984512)
    A0_19:_wait(1)
    A2_21:say(A0_19, 23, 0)
  else
    A2_21:_runCharaScheduler(354041856)
    A0_19:_wait(1)
    A2_21:say(A0_19, 24, 0)
    A2_21:say(A0_19, 35, 0)
    A2_21:say(A0_19, 25, 0)
  end
  A2_21:_runCharaScheduler(353959936)
  A0_19:_wait(1)
  A2_21:say(A0_19, 26, 0)
  A2_21:finishCliantTalkTurn()
  return
end
