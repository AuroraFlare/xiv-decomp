require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceHamletPushEvent", "NpcBaseClass")
function PopulaceHamletPushEvent.initTypeWork(A0_0)
  if A0_0:getActorClassId() == 1500435 then
  elseif A0_0:getActorClassId() == 1500387 then
  else
  end
  if A0_0:getActorClassId() == 1500436 then
    A0_0.work.type = 1
    break
  else
  end
  if A0_0:getActorClassId() == 1200360 then
    A0_0.work.harvestType = 1
    A0_0.work.type = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1200361 then
    A0_0.work.harvestType = 2
    A0_0.work.type = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1200362 then
    A0_0.work.harvestType = 3
    A0_0.work.type = 2
    break
  else
  end
  if A0_0:getActorClassId() == 1200381 then
    A0_0.work.type = 3
    break
  elseif A0_0:getActorClassId() == 1200369 then
  elseif A0_0:getActorClassId() == 1200370 then
  elseif A0_0:getActorClassId() == 1200371 then
  else
  end
  if A0_0:getActorClassId() == 1200372 then
    A0_0.work.type = 4
    do break end
    break
  else
  end
end
function PopulaceHamletPushEvent.initForEvent(A0_1)
  local L1_2
  L1_2 = A0_1._setGroundOn
  L1_2(A0_1, false)
  L1_2 = A0_1._loadTextDataPermanently
  L1_2(A0_1, 10176, "populaceHamletPushEvent")
  L1_2 = {
    {"type", "integer8"},
    {
      "harvestType",
      "integer8"
    }
  }
  A0_1:initWork(nil, L1_2)
  A0_1:initTypeWork()
end
function PopulaceHamletPushEvent.isMapMarkerVisibleForTalkable(A0_3)
  local L1_4
  L1_4 = A0_3.work
  L1_4 = L1_4.type
  if L1_4 == 4 then
    L1_4 = false
    return L1_4
  end
  L1_4 = true
  return L1_4
end
function PopulaceHamletPushEvent.getMapMarkerTypeForTalkable(A0_5)
  local L1_6
  L1_6 = A0_5.work
  L1_6 = L1_6.type
  if L1_6 == 2 then
    L1_6 = A0_5.work
    L1_6 = L1_6.harvestType
    if L1_6 == 1 then
      L1_6 = 14
      return L1_6
    else
      L1_6 = A0_5.work
      L1_6 = L1_6.harvestType
      if L1_6 == 2 then
        L1_6 = 15
        return L1_6
      else
        L1_6 = A0_5.work
        L1_6 = L1_6.harvestType
        if L1_6 == 3 then
          L1_6 = 16
          return L1_6
        else
        end
      end
    end
  else
    L1_6 = A0_5.work
    L1_6 = L1_6.type
    if L1_6 == 3 then
      L1_6 = 13
      return L1_6
    else
      L1_6 = A0_5.work
      L1_6 = L1_6.type
      if L1_6 == 1 then
        L1_6 = 18
        return L1_6
      end
    end
  end
  L1_6 = 6
  return L1_6
end
function PopulaceHamletPushEvent.talkToSupport(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12)
  A0_7:startCliantTalkTurn(2, A1_8)
  if A4_11 == true then
    A0_7:sayText(36)
    if A5_12 == true then
      A0_7:sayText(38, 84062208)
    else
      A0_7:sayText(37, 354041856)
    end
    A0_7:finishCliantTalkTurn()
    return
  end
  if A2_9 then
    A0_7:sayText(1, 354099200)
  elseif A3_10 then
    A0_7:sayText(2, 354099200)
  else
    A0_7:sayText(3, 354099200)
    A0_7:finishCliantTalkTurn()
    return
  end
  while true do
    if desktopWidget:askForEventMode(nil, nil, A0_7, 1, false, true, 4, {
      5,
      6,
      7,
      8
    }) == 1 then
      return (desktopWidget:askForEventMode(nil, nil, A0_7, 1, false, true, 4, {
        5,
        6,
        7,
        8
      }))
    elseif desktopWidget:askForEventMode(nil, nil, A0_7, 1, false, true, 4, {
      5,
      6,
      7,
      8
    }) == 2 then
      if A2_9 then
        A0_7:sayText(14, 353980416)
        A0_7:sayText(15, 353984512)
        A0_7:sayText(16, 353976320)
        worldMaster:say(A0_7, 51)
        worldMaster:say(A0_7, 17)
        worldMaster:say(A0_7, 18)
        worldMaster:say(A0_7, 19)
        A0_7:sayText(20, 354103296)
      else
        A0_7:sayText(21, 353980416)
        A0_7:sayText(22, 353984512)
        worldMaster:say(A0_7, 52)
        worldMaster:say(A0_7, 23)
        worldMaster:say(A0_7, 24)
        worldMaster:say(A0_7, 25)
        A0_7:sayText(26, 354103296)
      end
    elseif desktopWidget:askForEventMode(nil, nil, A0_7, 1, false, true, 4, {
      5,
      6,
      7,
      8
    }) == 3 then
      if A2_9 then
        A0_7:sayText(27, 353976320)
        worldMaster:say(A0_7, 28, 10011216, 10011217, 10011218)
        worldMaster:say(A0_7, 29, 10011216, 10011217, 10011218)
      else
        A0_7:sayText(30, 353976320)
        worldMaster:say(A0_7, 31, 10011219, 10011223, 10011227)
        worldMaster:say(A0_7, 32, 10011220, 10011224, 10011228)
        worldMaster:say(A0_7, 33, 10011222, 10011226, 10011230)
        worldMaster:say(A0_7, 34, 10011221, 10011225, 10011229)
      end
    else
      A0_7:sayText(35)
      break
    end
  end
  A0_7:finishCliantTalkTurn()
end
function PopulaceHamletPushEvent.supplyToSupport(A0_13, A1_14, A2_15, A3_16)
  if A2_15 then
    if A3_16 == 1 then
      A0_13:sayText(9, 353959936)
    elseif A3_16 == 2 then
      A0_13:sayText(10, 354054144)
    else
      if A3_16 == 3 then
        A0_13:sayText(11, 354066432)
      else
      end
    end
  elseif A3_16 == 1 then
    A0_13:sayText(12, 354099200)
  else
    if A3_16 == 3 then
      A0_13:sayText(13, 354054144)
    else
    end
  end
  A0_13:finishCliantTalkTurn()
end
function PopulaceHamletPushEvent.talkToCraft(A0_17, A1_18)
  local L2_19
  L2_19 = desktopWidget
  L2_19 = L2_19.askForEventMode
  L2_19 = L2_19(L2_19, nil, nil, A0_17, 1, false, true, 43, {
    44,
    45,
    46,
    47,
    48
  }, A0_17:getCraftItemID(A1_18, 1), A0_17:getCraftItemID(A1_18, 2), A0_17:getCraftItemID(A1_18, 3), A0_17:getCraftItemID(A1_18, 4))
  if L2_19 <= 0 or L2_19 == 5 then
    return nil
  end
  return A0_17:getCraftItemID(A1_18, L2_19)
end
function PopulaceHamletPushEvent.getCraftItemID(A0_20, A1_21, A2_22)
  return ({
    {
      10011231,
      10011235,
      10011239
    },
    {
      10011232,
      10011236,
      10011240
    },
    {
      10011234,
      10011238,
      10011242
    },
    {
      10011233,
      10011237,
      10011241
    }
  })[A2_22][A0_20:getCrafterType(A1_21)]
end
function PopulaceHamletPushEvent.getCrafterType(A0_23, A1_24)
  if A1_24:getStateMainSkill() == 29 or A1_24:getStateMainSkill() == 29 or A1_24:getStateMainSkill() == 30 or A1_24:getStateMainSkill() == 30 or A1_24:getStateMainSkill() == 31 or A1_24:getStateMainSkill() == 31 then
    return 1
  end
  if A1_24:getStateMainSkill() == 32 or A1_24:getStateMainSkill() == 32 or A1_24:getStateMainSkill() == 33 or A1_24:getStateMainSkill() == 33 or A1_24:getStateMainSkill() == 34 or A1_24:getStateMainSkill() == 34 then
    return 2
  end
  return 3
end
function PopulaceHamletPushEvent.sayText(A0_25, A1_26, A2_27)
  if A2_27 ~= nil then
    A0_25:_runCharaScheduler(A2_27)
  end
  A0_25:say(A0_25, A1_26, 0)
end
