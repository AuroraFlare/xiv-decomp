require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceHamletCaptain", "NpcBaseClass")
function PopulaceHamletCaptain.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(10160, "PopulaceHamletCaptain")
  A0_0.work._temp = {
    {
      "localTextFunc",
      "string",
      20
    }
  }
  if A0_0:getActorClassId() == 1500340 then
    A0_0.work.localTextFunc = "getAleportText"
  elseif A0_0:getActorClassId() == 1500342 then
    A0_0.work.localTextFunc = "getHrystmillText"
  else
    if A0_0:getActorClassId() == 1500341 then
      A0_0.work.localTextFunc = "getGoldenBazaarText"
    else
    end
  end
end
function PopulaceHamletCaptain.getMapMarkerTypeForTalkable(A0_1)
  local L1_2
  L1_2 = 17
  return L1_2
end
function PopulaceHamletCaptain.talkInContents(A0_3, A1_4)
  A0_3:startCliantTalkTurn(2, A1_4)
  A0_3:sayText(2)
  if desktopWidget:askForEventMode(nil, nil, A0_3, 2, false, true, 3, {4, 5}) == 1 then
    A0_3:sayText(6, 353972224)
    if desktopWidget:askForEventMode(nil, nil, A0_3, 2, false, true, 7, {8, 9}) == 1 then
      A0_3:sayText(10, 354082816)
      A0_3:finishCliantTalkTurn()
      return (desktopWidget:askForEventMode(nil, nil, A0_3, 2, false, true, 7, {8, 9}))
    else
      A0_3:sayText(11, 354082816)
    end
  end
  A0_3:sayText(12)
  A0_3:finishCliantTalkTurn()
  return 2
end
function PopulaceHamletCaptain.talkAfterContents(A0_5, A1_6)
  A0_5:startCliantTalkTurn(2, A1_6)
  A0_5:sayText(15, 354099200)
  A0_5:sayText(16, 84058112)
end
function PopulaceHamletCaptain.talkAfterContentsSupplyReward(A0_7, A1_8, A2_9)
  local L3_10
  L3_10 = 17
  if A2_9 ~= nil then
    if A2_9 == 1 then
      L3_10 = 18
      break
    else
    end
    if A2_9 == 2 then
      L3_10 = 35
      break
    else
    end
    if A2_9 == 3 then
      L3_10 = 36
      break
    else
    end
  else
  end
  A0_7:sayText(L3_10, 354107392)
end
function PopulaceHamletCaptain.talkAfterContentsExit(A0_11, A1_12, A2_13, A3_14)
  local L4_15, L5_16, L6_17
  L4_15 = false
  L5_16 = {L6_17, 52044}
  L6_17 = 52043
  L6_17 = desktopWidget
  L6_17 = L6_17.askForEventMode
  L6_17 = L6_17(L6_17, nil, nil, worldMaster, 2, false, true, 52042, L5_16, A2_13)
  if L6_17 == 1 then
    if A3_14 == false then
      L6_17 = desktopWidget:askForEventMode(nil, nil, worldMaster, 2, false, true, 52087, L5_16, A2_13)
      if L6_17 == 1 then
        L4_15 = true
      end
    else
      L4_15 = true
    end
  end
  A0_11:finishCliantTalkTurn()
  return L4_15
end
function PopulaceHamletCaptain.sayText(A0_18, A1_19, A2_20)
  local L3_21
  if A2_20 ~= nil then
    L3_21 = A0_18._runCharaScheduler
    L3_21(A0_18, A2_20)
  end
  L3_21 = A0_18.work
  L3_21 = L3_21.localTextFunc
  L3_21 = A0_18[L3_21]
  L3_21 = L3_21(A0_18, A1_19)
  A0_18:say(A0_18, L3_21, 0)
end
function PopulaceHamletCaptain.getAleportText(A0_22, A1_23)
  local L2_24, L3_25
  L2_24 = A1_23
  if L2_24 == 2 then
    L3_25 = 19
    return L3_25
  else
  end
  if L2_24 == 6 then
    L3_25 = 21
    return L3_25
  else
  end
  if L2_24 == 10 then
    L3_25 = 23
    return L3_25
  else
  end
  if L2_24 == 11 then
    L3_25 = 24
    return L3_25
  else
  end
  if L2_24 == 12 then
    L3_25 = 25
    return L3_25
  else
  end
  if L2_24 == 15 then
    L3_25 = 29
    return L3_25
  else
  end
  if L2_24 == 16 then
    L3_25 = 30
    return L3_25
  else
  end
  if L2_24 == 17 then
    L3_25 = 31
    return L3_25
  else
  end
  if L2_24 == 18 then
    L3_25 = 37
    return L3_25
  else
  end
  if L2_24 == 35 then
    L3_25 = 38
    return L3_25
  else
  end
  if L2_24 == 36 then
    L3_25 = 39
    return L3_25
  else
  end
  return A1_23
end
function PopulaceHamletCaptain.getHrystmillText(A0_26, A1_27)
  return A1_27
end
function PopulaceHamletCaptain.getGoldenBazaarText(A0_28, A1_29)
  local L2_30, L3_31
  L2_30 = A1_29
  if L2_30 == 2 then
    L3_31 = 20
    return L3_31
  else
  end
  if L2_30 == 6 then
    L3_31 = 22
    return L3_31
  else
  end
  if L2_30 == 10 then
    L3_31 = 26
    return L3_31
  else
  end
  if L2_30 == 11 then
    L3_31 = 27
    return L3_31
  else
  end
  if L2_30 == 12 then
    L3_31 = 28
    return L3_31
  else
  end
  if L2_30 == 15 then
    L3_31 = 32
    return L3_31
  else
  end
  if L2_30 == 16 then
    L3_31 = 33
    return L3_31
  else
  end
  if L2_30 == 17 then
    L3_31 = 34
    return L3_31
  else
  end
  if L2_30 == 18 then
    L3_31 = 40
    return L3_31
  else
  end
  if L2_30 == 35 then
    L3_31 = 41
    return L3_31
  else
  end
  if L2_30 == 36 then
    L3_31 = 42
    return L3_31
  else
  end
  return A1_29
end
