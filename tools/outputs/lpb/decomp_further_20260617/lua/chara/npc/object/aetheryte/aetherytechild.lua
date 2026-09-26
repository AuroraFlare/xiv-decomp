require("/Chara/Npc/Object/Aetheryte/AetheryteBaseClass")
_defineClass("AetheryteChild", "AetheryteBaseClass")
function AetheryteChild.initForEventAsAetheryte(A0_0)
  A0_0:_loadTextDataPermanently(299, "aetheryteChild")
end
function AetheryteChild.eventAetheryteChildSelect(A0_1, A1_2, A2_3, A3_4, A4_5)
  local L5_6
  if A1_2 then
    L5_6 = worldMaster:askRestrictChoices(A0_1, A0_1, 21, true, true, true, true, true, 0, A2_3)
    if L5_6 == 1 then
      return nil
    elseif L5_6 == 2 then
      worldMaster:say(A0_1, 31, A4_5, A3_4)
      if worldMaster:ask(A0_1, A0_1, 32, 2) == 1 then
        if A3_4 == 0 and A4_5 ~= 0 then
          worldMaster:say(worldMaster, 34115, 1, 0)
          return nil
        end
        return L5_6
      else
        return nil
      end
    end
  else
    L5_6 = worldMaster:askRestrictChoices(A0_1, A0_1, 21, true, false, true, true, true)
    if L5_6 == 1 then
      return nil
    end
  end
  if L5_6 == 3 then
    return -1
  elseif L5_6 == 4 then
    worldMaster:say(A0_1, 55)
    L5_6 = worldMaster:ask(A0_1, A0_1, 56, 2)
    if L5_6 ~= 1 then
      return nil
    end
    return -2
  elseif L5_6 == 5 then
    return -3
  end
end
function AetheryteChild.eventAetheryteChildDesion(A0_7, A1_8)
  worldMaster:say(A0_7, 59, A1_8)
end
function AetheryteChild.processGuildleveBoost(A0_9, A1_10, A2_11)
  worldMaster:say(A0_9, 15)
  return (worldMaster:ask(A0_9, A0_9, 16, 2, A2_11, A1_10))
end
function AetheryteChild.processGuildlevePlaying(A0_12, A1_13, A2_14, A3_15, A4_16, A5_17, A6_18, A7_19, A8_20, A9_21)
  local L10_22, L11_23, L12_24, L13_25, L14_26, L15_27, L16_28
  L10_22 = 0
  L11_23 = 0
  L12_24 = false
  if A7_19 == nil then
    A7_19 = 0
  end
  if A7_19 > 0 then
    L12_24 = true
  end
  L13_25 = false
  if A8_20 > 0 then
    L13_25 = true
  end
  L14_26 = false
  while L10_22 == 0 do
    L15_27 = worldMaster
    L16_28 = L15_27
    L15_27 = L15_27.askRestrictChoices
    L15_27 = L15_27(L16_28, A0_12, A0_12, 35, true, A2_14, L12_24, L13_25, L14_26, true, A1_13, A7_19, A6_18, A8_20)
    L10_22 = L15_27
    if L10_22 == 2 then
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.say
      L15_27(L16_28, A0_12, 42)
      if A9_21 ~= nil and A9_21 ~= 0 then
        L15_27 = worldMaster
        L16_28 = L15_27
        L15_27 = L15_27._getMyPlayer
        L15_27 = L15_27(L16_28)
        L16_28 = worldMaster
        L16_28 = L16_28.say
        L16_28(L16_28, worldMaster, 50039, A9_21, L15_27)
      end
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.ask
      L15_27 = L15_27(L16_28, A0_12, A0_12, 43, 2, A3_15, A4_16, A5_17, A1_13)
      if L15_27 ~= 1 then
        L10_22 = 0
      else
        return L10_22
      end
    elseif L10_22 == 3 then
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.say
      L15_27(L16_28, A0_12, 15)
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.ask
      L15_27 = L15_27(L16_28, A0_12, A0_12, 16, 2, A7_19, A6_18)
      if L15_27 ~= 1 then
        L10_22 = 0
      else
        return L10_22
      end
    elseif L10_22 == 4 then
      if A8_20 == 1 then
        L15_27 = worldMaster
        L16_28 = L15_27
        L15_27 = L15_27.say
        L15_27(L16_28, A0_12, 53)
        L10_22 = 0
      else
        L15_27 = worldMaster
        L16_28 = L15_27
        L15_27 = L15_27.say
        L15_27(L16_28, A0_12, 51)
        L15_27 = desktopWidget
        L16_28 = L15_27
        L15_27 = L15_27.askEventModeWidgetYield
        L16_28 = L15_27(L16_28, "Ask/GuildleveSelectLevelWidget", 1, A8_20 - 1)
        if L15_27 ~= true or L16_28 == -1 then
          L10_22 = 0
        elseif L16_28 ~= nil and L16_28 > 0 and L16_28 < 6 then
          return L10_22, L16_28
        else
          L10_22 = 0
        end
      end
    elseif L10_22 == 6 then
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.say
      L15_27(L16_28, A0_12, 47)
      L15_27 = worldMaster
      L16_28 = L15_27
      L15_27 = L15_27.ask
      L15_27 = L15_27(L16_28, A0_12, A0_12, 48, 2)
      if L15_27 ~= 1 then
        L10_22 = 0
      else
        return L10_22
      end
    end
  end
  return L10_22
end
function AetheryteChild.processGuildleveJoin(A0_29)
  return (worldMaster:ask(A0_29, A0_29, 7, 2))
end
