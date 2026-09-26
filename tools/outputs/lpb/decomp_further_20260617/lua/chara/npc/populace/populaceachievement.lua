require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceAchievement", "NpcBaseClass")
function PopulaceAchievement.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(8000, "populaceAchievement")
end
function PopulaceAchievement.eventNoGC(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = worldMaster
  L2_5 = L1_4
  L1_4 = L1_4._getMyPlayer
  L1_4 = L1_4(L2_5)
  L3_6 = A0_3
  L2_5 = A0_3.startCliantTalkTurn
  L2_5(L3_6, 2, L1_4)
  L3_6 = A0_3
  L2_5 = A0_3.getActorClassId
  L2_5 = L2_5(L3_6)
  L3_6 = nil
  if L2_5 == 1500280 then
    L3_6 = 1
  elseif L2_5 == 1500281 then
    L3_6 = 2
  elseif L2_5 == 1500282 then
    L3_6 = 3
  end
  A0_3:say(A0_3, 169, 0, L3_6)
  A0_3:finishCliantTalkTurn()
end
function PopulaceAchievement.eventUnlock(A0_7, A1_8)
  local L2_9, L3_10, L4_11
  L2_9 = worldMaster
  L3_10 = L2_9
  L2_9 = L2_9._getMyPlayer
  L2_9 = L2_9(L3_10)
  L4_11 = A0_7
  L3_10 = A0_7.startCliantTalkTurn
  L3_10(L4_11, 2, L2_9)
  L4_11 = A0_7
  L3_10 = A0_7.getActorClassId
  L3_10 = L3_10(L4_11)
  if L3_10 == 1500270 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 133, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 134, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 135, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 136, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 137, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 138, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 139, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500271 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 121, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 122, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 123, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 124, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 149, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500272 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 2, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 3, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 4, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 5, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 6, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 7, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500273 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 16, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 17, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 18, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 19, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500274 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 153, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 154, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 155, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 156, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500275 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 29, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 30, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 31, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 32, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 33, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500276 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 42, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 43, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 44, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 45, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 46, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 47, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500277 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 59, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 60, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 61, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 62, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 63, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 64, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 65, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 151, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 66, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500278 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 91, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 92, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 93, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 94, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 95, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 96, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500279 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 76, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 77, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 78, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 79, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 152, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 80, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  elseif L3_10 == 1500280 or L3_10 == 1500281 or L3_10 == 1500282 then
    L4_11 = nil
    if L3_10 == 1500280 then
      L4_11 = 1
    elseif L3_10 == 1500281 then
      L4_11 = 2
    elseif L3_10 == 1500282 then
      L4_11 = 3
    end
    A0_7:doSalute(L4_11, 0)
    A0_7:say(A0_7, 161, 0)
    A0_7:say(A0_7, 162, 0, L4_11)
    A0_7:say(A0_7, 163, 0)
    A0_7:say(A0_7, 164, 0)
    A0_7:say(A0_7, 165, 0)
    worldMaster:say(A0_7, 8, A1_8)
    worldMaster:say(A0_7, 9, A0_7)
    worldMaster:say(A0_7, 10)
  elseif L3_10 == 1500283 then
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 107, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 108, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 109, 0)
    L4_11 = A0_7.say
    L4_11(A0_7, A0_7, 110, 0)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 8, A1_8)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 9, A0_7)
    L4_11 = worldMaster
    L4_11 = L4_11.say
    L4_11(L4_11, A0_7, 10)
  end
  L4_11 = A0_7.finishCliantTalkTurn
  L4_11(A0_7)
end
function PopulaceAchievement.eventReward(A0_12, A1_13, A2_14, A3_15, A4_16)
  local L5_17, L6_18, L7_19
  L5_17 = worldMaster
  L6_18 = L5_17
  L5_17 = L5_17._getMyPlayer
  L5_17 = L5_17(L6_18)
  L7_19 = A0_12
  L6_18 = A0_12.startCliantTalkTurn
  L6_18(L7_19, 2, L5_17)
  L7_19 = A0_12
  L6_18 = A0_12.getActorClassId
  L6_18 = L6_18(L7_19)
  if A4_16 == false then
    if L6_18 == 1500270 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 143, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 144, 0)
    elseif L6_18 == 1500271 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 128, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 129, 0)
    elseif L6_18 == 1500272 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 11, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 12, 0)
    elseif L6_18 == 1500273 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 23, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 24, 0)
    elseif L6_18 == 1500275 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 37, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 38, 0)
    elseif L6_18 == 1500276 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 51, 0)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 52, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 53, 0)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 54, 0)
    elseif L6_18 == 1500277 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 70, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 71, 0)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 72, 0)
    elseif L6_18 == 1500278 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 100, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 101, 0)
    elseif L6_18 == 1500279 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 84, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 85, 0)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 86, 0)
    elseif L6_18 == 1500274 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 157, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 158, 0)
    elseif L6_18 == 1500280 or L6_18 == 1500281 or L6_18 == 1500282 then
      L7_19 = nil
      if L6_18 == 1500280 then
        L7_19 = 1
      elseif L6_18 == 1500281 then
        L7_19 = 2
      elseif L6_18 == 1500282 then
        L7_19 = 3
      end
      A0_12:doSalute(L7_19, 0)
      A0_12:say(A0_12, 166, 0)
      A0_12:say(A0_12, 167, 0)
    elseif L6_18 == 1500283 then
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 114, 0)
      L7_19 = L5_17._fadeOut
      L7_19(L5_17, 1)
      L7_19 = L5_17._waitForFading
      L7_19(L5_17)
      L7_19 = L5_17._fadeIn
      L7_19(L5_17, 1)
      L7_19 = A0_12._wait
      L7_19(A0_12, 0.5)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 115, 0)
      L7_19 = A0_12.say
      L7_19(A0_12, A0_12, 116, 0)
    end
  end
  if A2_14 == true then
    L7_19 = worldMaster
    L7_19 = L7_19.say
    L7_19(L7_19, A0_12, 13, A1_13, A3_15)
  else
    L7_19 = worldMaster
    L7_19 = L7_19.say
    L7_19(L7_19, A0_12, 14, A1_13, A3_15)
  end
  L7_19 = A0_12.finishCliantTalkTurn
  L7_19(A0_12)
end
function PopulaceAchievement.defTalk(A0_20)
  local L1_21, L2_22, L3_23
  L1_21 = worldMaster
  L2_22 = L1_21
  L1_21 = L1_21._getMyPlayer
  L1_21 = L1_21(L2_22)
  L3_23 = A0_20
  L2_22 = A0_20.startCliantTalkTurn
  L2_22(L3_23, 2, L1_21)
  L3_23 = A0_20
  L2_22 = A0_20.getActorClassId
  L2_22 = L2_22(L3_23)
  if L2_22 == 1500270 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 147, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 148, 0)
  elseif L2_22 == 1500271 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 132, 0)
  elseif L2_22 == 1500272 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 15, 0)
  elseif L2_22 == 1500273 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 27, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 28, 0)
  elseif L2_22 == 1500274 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 159, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 160, 0)
  elseif L2_22 == 1500275 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 41, 0)
  elseif L2_22 == 1500276 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 57, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 58, 0)
  elseif L2_22 == 1500277 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 75, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 150, 0)
  elseif L2_22 == 1500278 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 104, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 105, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 106, 0)
  elseif L2_22 == 1500279 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 89, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 90, 0)
  elseif L2_22 == 1500280 or L2_22 == 1500281 or L2_22 == 1500282 then
    L3_23 = nil
    if L2_22 == 1500280 then
      L3_23 = 1
    elseif L2_22 == 1500281 then
      L3_23 = 2
    elseif L2_22 == 1500282 then
      L3_23 = 3
    end
    A0_20:doSalute(L3_23, 0)
    A0_20:say(A0_20, 168, 0)
  elseif L2_22 == 1500283 then
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 119, 0)
    L3_23 = A0_20.say
    L3_23(A0_20, A0_20, 120, 0)
  end
  L3_23 = A0_20.finishCliantTalkTurn
  L3_23(A0_20)
end
