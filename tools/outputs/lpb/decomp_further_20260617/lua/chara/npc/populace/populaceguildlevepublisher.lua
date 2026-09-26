require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceGuildlevePublisher", "NpcBaseClass")
function PopulaceGuildlevePublisher.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {
    {
      "pre_leve_id",
      "array",
      8,
      "integer16"
    },
    {
      "change_bonus",
      "array",
      16,
      "integer8"
    },
    {
      "selected_change_index",
      "array",
      4,
      "integer8"
    },
    {
      "stopRetry",
      "array",
      8,
      "boolean"
    },
    {"nowId", "integer16"},
    {
      "nowBoostPoint",
      "integer8"
    },
    {
      "nowRewardItem",
      "integer32"
    },
    {
      "nowRewardNumber",
      "integer32"
    },
    {
      "nowRewardSubItem",
      "integer32"
    },
    {
      "nowRewardSubNumber",
      "integer8"
    },
    {"nowMark", "integer8"},
    {
      "nowCompleteFlag",
      "boolean"
    },
    {"getBonus", "integer8"},
    {"startPack", "integer16"},
    {"endPack", "integer16"},
    {"changeOne", "boolean"},
    {"omenTalk", "integer8"},
    {
      "onceLastConfirm",
      "boolean"
    }
  }
  A0_0:initWork(L1_1, L2_2)
  A0_0:_loadTextDataPermanently(339, "populaceGuildlevePublisher")
  A0_0:_setGroundOn(false)
end
function PopulaceGuildlevePublisher.eventTalkType(A0_3, A1_4, A2_5, A3_6, A4_7, A5_8, A6_9, A7_10, A8_11, A9_12, A10_13, A11_14, A12_15)
  local L13_16, L14_17, L15_18, L16_19, L17_20, L18_21, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27
  L13_16 = worldMaster
  L14_17 = L13_16
  L13_16 = L13_16._getMyPlayer
  L13_16 = L13_16(L14_17)
  if A2_5 then
    L15_18 = A0_3
    L14_17 = A0_3.startCliantTalkTurn
    L16_19 = 2
    L17_20 = L13_16
    L14_17(L15_18, L16_19, L17_20)
    if A7_10 ~= 0 then
      L14_17 = A0_3.work
      L14_17 = L14_17.omenTalk
      if L14_17 == 0 then
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 78
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 81
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L15_18 = A0_3.work
        L16_19 = A0_3.work
        L16_19 = L16_19.omenTalk
        L16_19 = L16_19 + 1
        L15_18.omenTalk = L16_19
        break
      else
      end
      if L14_17 == 1 then
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 79
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 81
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L15_18 = A0_3.work
        L16_19 = A0_3.work
        L16_19 = L16_19.omenTalk
        L16_19 = L16_19 + 1
        L15_18.omenTalk = L16_19
        break
      else
      end
      if L14_17 == 2 then
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 80
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L16_19 = A0_3
        L15_18 = A0_3.say
        L17_20 = A0_3
        L18_21 = 81
        L19_22 = 0
        L15_18(L16_19, L17_20, L18_21, L19_22)
        L15_18 = A0_3.work
        L16_19 = A0_3.work
        L16_19 = L16_19.omenTalk
        L16_19 = L16_19 + 1
        L15_18.omenTalk = L16_19
      else
      end
    else
    end
    L15_18 = A0_3
    L14_17 = A0_3.say
    L16_19 = A0_3
    L17_20 = 3
    L18_21 = 0
    L19_22 = A9_12
    L14_17(L15_18, L16_19, L17_20, L18_21, L19_22)
  end
  L14_17 = nil
  if A8_11 == nil then
    L15_18 = worldMaster
    L16_19 = L15_18
    L15_18 = L15_18.askRestrictChoices
    L17_20 = A0_3
    L18_21 = A0_3
    L19_22 = 4
    L20_23 = true
    L21_24 = true
    L22_25 = false
    L23_26 = true
    L24_27 = true
    L15_18 = L15_18(L16_19, L17_20, L18_21, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, A6_9, true, true)
    L14_17 = L15_18
  elseif A8_11 >= 40 and A8_11 < 53 then
    L14_17 = 4
  elseif A8_11 >= 20 and A8_11 < 30 then
    L14_17 = 2
  elseif A8_11 == 5 then
    L14_17 = 5
  end
  if L14_17 == nil then
    L16_19 = A0_3
    L15_18 = A0_3.finishCliantTalkTurn
    L15_18(L16_19)
    L15_18 = nil
    return L15_18
  elseif L14_17 == 2 then
    L15_18 = worldMaster
    L16_19 = L15_18
    L15_18 = L15_18.ask
    L17_20 = A0_3
    L18_21 = A0_3
    L19_22 = 64
    L20_23 = 4
    L15_18 = L15_18(L16_19, L17_20, L18_21, L19_22, L20_23)
    if L15_18 == nil then
      L15_18 = 4
    end
    L15_18 = L15_18 + 20
    return L15_18
  elseif L14_17 == 4 then
    L15_18, L16_19 = nil, nil
    while true do
      if A8_11 == nil or A8_11 == 40 then
        L17_20 = worldMaster
        L18_21 = L17_20
        L17_20 = L17_20.askRestrictChoices
        L19_22 = A0_3
        L20_23 = A0_3
        L21_24 = 59
        L22_25 = true
        L23_26 = true
        L24_27 = true
        L17_20 = L17_20(L18_21, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, A3_6, A4_7, A5_8)
        L15_18 = L17_20
      else
        L17_20 = A8_11
        if L17_20 == 41 then
        elseif L17_20 == 44 then
        elseif L17_20 == 47 then
        else
        end
        if L17_20 == 48 then
          L15_18 = 1
          break
        elseif L17_20 == 42 then
        elseif L17_20 == 45 then
        else
        end
        if L17_20 == 49 then
          L15_18 = 2
          break
        elseif L17_20 == 43 then
        elseif L17_20 == 46 then
        else
        end
        if L17_20 == 50 then
          L15_18 = 3
          break
        else
        end
      end
      if L15_18 == nil or L15_18 == 4 then
        L15_18 = 13
        break
      elseif L15_18 >= 1 and L15_18 <= 3 then
        if A1_4 >= 10 then
          L17_20 = {L18_21}
          L18_21 = 100
          L18_21 = 2
          L19_22 = false
          L20_23 = false
          L21_24 = false
          L22_25 = false
          L23_26 = false
          L24_27 = false
          L17_20[L18_21] = 100
          if A1_4 >= 25 then
            L19_22 = true
            L17_20[L18_21] = 200
            L18_21 = L18_21 + 1
          end
          if A1_4 >= 35 then
            L20_23 = true
            L17_20[L18_21] = 300
            L18_21 = L18_21 + 1
          end
          if L15_18 == 3 then
            if A1_4 >= 25 then
              L21_24 = true
              L17_20[L18_21] = L15_18
            end
          elseif A1_4 >= 45 then
            L21_24 = true
            L17_20[L18_21] = L15_18
            if L15_18 == 1 then
              L22_25 = true
              L18_21 = L18_21 + 1
              L17_20[L18_21] = L15_18
            end
          end
          if A1_4 >= 45 and (L15_18 == 1 and A10_13 >= 0 or L15_18 == 2 and A10_13 >= 2 or L15_18 == 3 and A10_13 >= 1) then
            L23_26 = true
            L18_21 = L18_21 + 1
            L17_20[L18_21] = L15_18
          end
          if L15_18 == A11_14 then
            L24_27 = true
            L18_21 = L18_21 + 1
            L17_20[L18_21] = A12_15
          end
          if worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 1 then
            L16_19 = 20
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 2 then
            L16_19 = 30
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 3 then
            L16_19 = 40
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 4 then
            if L15_18 == 1 then
              L15_18 = 4
              L16_19 = 50
            elseif L15_18 == 2 then
              L15_18 = 5
              L16_19 = 50
            elseif L15_18 == 3 then
              L15_18 = 6
              L16_19 = 20
            end
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 5 then
            L16_19 = 50
            L15_18 = 7
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 6 then
            L16_19 = 50
            if L15_18 == 1 then
              L15_18 = 8
            elseif L15_18 == 2 then
              L15_18 = 9
            elseif L15_18 == 3 then
              L15_18 = 10
            end
          elseif worldMaster:askRestrictChoices(A0_3, A0_3, 69, true, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, true, unpack(L17_20)) == 7 then
            L16_19 = 50
            if A11_14 == 1 then
              L15_18 = 11
            elseif A11_14 == 2 then
              L15_18 = 12
            end
          else
            L15_18 = 13
          end
        else
          L16_19 = 20
        end
      end
      if L15_18 ~= 13 then
        break
      else
        A8_11 = nil
      end
    end
    L15_18 = L15_18 + 40
    L17_20 = L15_18
    L18_21 = L16_19
    L19_22 = A8_11
    return L17_20, L18_21, L19_22
  elseif L14_17 == 5 then
    L15_18 = nil
    while true do
      L16_19 = worldMaster
      L17_20 = L16_19
      L16_19 = L16_19.ask
      L18_21 = A0_3
      L19_22 = A0_3
      L20_23 = 86
      L21_24 = 3
      L16_19 = L16_19(L17_20, L18_21, L19_22, L20_23, L21_24)
      L15_18 = L16_19
      if L15_18 == 1 then
        return L14_17
      elseif L15_18 == 2 then
        L17_20 = A0_3
        L16_19 = A0_3.say
        L18_21 = A0_3
        L19_22 = 93
        L20_23 = 0
        L16_19(L17_20, L18_21, L19_22, L20_23)
        L17_20 = A0_3
        L16_19 = A0_3.say
        L18_21 = A0_3
        L19_22 = 94
        L20_23 = 0
        L16_19(L17_20, L18_21, L19_22, L20_23)
        L17_20 = A0_3
        L16_19 = A0_3.say
        L18_21 = A0_3
        L19_22 = 113
        L20_23 = 0
        L16_19(L17_20, L18_21, L19_22, L20_23)
        L16_19 = worldMaster
        L17_20 = L16_19
        L16_19 = L16_19.say
        L18_21 = A0_3
        L19_22 = 116
        L16_19(L17_20, L18_21, L19_22)
        L16_19 = worldMaster
        L17_20 = L16_19
        L16_19 = L16_19.say
        L18_21 = A0_3
        L19_22 = 117
        L16_19(L17_20, L18_21, L19_22)
        L16_19 = worldMaster
        L17_20 = L16_19
        L16_19 = L16_19.say
        L18_21 = A0_3
        L19_22 = 118
        L16_19(L17_20, L18_21, L19_22)
        L16_19 = worldMaster
        L17_20 = L16_19
        L16_19 = L16_19.say
        L18_21 = A0_3
        L19_22 = 119
        L16_19(L17_20, L18_21, L19_22)
      else
        break
      end
    end
    L16_19 = 7
    return L16_19
  elseif L14_17 == 7 then
    L15_18 = true
    repeat
      while L15_18 do
        L16_19 = worldMaster
        L17_20 = L16_19
        L16_19 = L16_19.askRestrictChoices
        L18_21 = A0_3
        L19_22 = A0_3
        L20_23 = 24
        L21_24 = true
        L22_25 = true
        L23_26 = true
        L24_27 = false
        L16_19 = L16_19(L17_20, L18_21, L19_22, L20_23, L21_24, L22_25, L23_26, L24_27, false, true, true, true)
        if L16_19 == nil then
          L16_19 = 8
        end
        L17_20 = L16_19
        if L17_20 == 1 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 33
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 47
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 48
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 49
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 50
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 2 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 34
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 35
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 3 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 36
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 37
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 38
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 39
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 51
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L18_21 = worldMaster
          L19_22 = L18_21
          L18_21 = L18_21.say
          L20_23 = A0_3
          L21_24 = 52
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 4 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 40
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 41
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 42
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 5 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 43
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 44
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 6 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 45
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        if L17_20 == 7 then
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 46
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 53
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 54
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 55
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 56
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 57
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          L19_22 = A0_3
          L18_21 = A0_3.say
          L20_23 = A0_3
          L21_24 = 58
          L22_25 = 0
          L18_21(L19_22, L20_23, L21_24, L22_25)
          break
        else
        end
        return L14_17
      end
    until L16_19 == 8
  else
    if L14_17 == nil or L14_17 == 8 then
      L16_19 = A0_3
      L15_18 = A0_3.finishCliantTalkTurn
      L15_18(L16_19)
    end
    return L14_17
  end
end
function PopulaceGuildlevePublisher.eventTalkPack(A0_28, A1_29, A2_30)
  A0_28.work.startPack = A1_29
  A0_28.work.endPack = A2_30
  if desktopWidget:askGuildleveSelectPackNumber(A0_28) == nil or desktopWidget:askGuildleveSelectPackNumber(A0_28) == 0 then
    return nil
  else
    return desktopWidget:askGuildleveSelectPackNumber(A0_28) + A1_29 - 1
  end
end
function PopulaceGuildlevePublisher.eventTalkCard(A0_31, A1_32, A2_33, A3_34, A4_35, A5_36, A6_37, A7_38, A8_39)
  local L9_40, L10_41, L11_42
  L9_40 = worldMaster
  L10_41 = L9_40
  L9_40 = L9_40._getMyPlayer
  L9_40 = L9_40(L10_41)
  L10_41 = A0_31.work
  L10_41 = L10_41.selected_change_index
  L10_41[1] = 0
  L10_41 = A0_31.work
  L10_41 = L10_41.selected_change_index
  L10_41[2] = 0
  L10_41 = A0_31.work
  L10_41 = L10_41.selected_change_index
  L10_41[3] = 0
  L10_41 = A0_31.work
  L10_41 = L10_41.selected_change_index
  L10_41[4] = 0
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[1] = A1_32
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[2] = A2_33
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[3] = A3_34
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[4] = A4_35
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[5] = A5_36
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[6] = A6_37
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[7] = A7_38
  L10_41 = A0_31.work
  L10_41 = L10_41.pre_leve_id
  L10_41[8] = A8_39
  L10_41 = false
  for _FORV_14_ = 1, 8 do
    if A0_31.work.pre_leve_id[_FORV_14_] ~= 0 then
      L10_41 = true
    end
  end
  if L10_41 == true then
  end
  return L11_42
end
function PopulaceGuildlevePublisher.eventTalkDetail(A0_43, A1_44, A2_45, A3_46, A4_47, A5_48, A6_49, A7_50, A8_51, A9_52)
  local L10_53, L11_54
  if A9_52 ~= nil then
    L10_53 = 110
    L11_54 = 50
    if A9_52 == 1 then
      L11_54 = 2250
      L10_53 = 90
    elseif A9_52 == 2 then
      L11_54 = 800
      if A2_45 == 1 then
        L10_53 = 91
      elseif A2_45 == 2 then
        L10_53 = 92
      elseif A2_45 == 3 then
        L10_53 = 103
      end
    elseif A9_52 == 3 then
      L11_54 = 800
      L10_53 = 104
    elseif A9_52 == 4 then
      L11_54 = 800
      L10_53 = 105
    elseif A9_52 == 5 then
      L11_54 = 400
      L10_53 = 106
    elseif A9_52 == 6 then
      L11_54 = 400
      L10_53 = 107
    elseif A9_52 == 7 then
      L11_54 = 200
      L10_53 = 108
    elseif A9_52 == 8 then
      L11_54 = 200
      L10_53 = 108
    elseif A9_52 == 9 then
      L11_54 = 100
      L10_53 = 108
    elseif A9_52 == 10 then
      L11_54 = 100
      L10_53 = 109
    elseif A9_52 == 11 then
      L11_54 = 600
      L10_53 = 120
    end
    if A3_46 ~= 1000001 then
      L11_54 = L11_54 / 10
    end
    guildleveSheet:_loadKeyTemporarily(A1_44, A1_44)
    L11_54 = L11_54 * guildleveSheet:_getData(A1_44, 5)
    A0_43:say(A0_43, L10_53, 0, A3_46, L11_54)
  end
  L10_53 = desktopWidget
  L11_54 = L10_53
  L10_53 = L10_53.askJournalDetailWidget
  L10_53 = L10_53(L11_54, 9, A1_44, A2_45, A3_46, A4_47, A5_48, A6_49, A7_50, A8_51)
  if L10_53 ~= nil then
    L11_54 = A0_43.work
    L11_54.nowId = A1_44
    L11_54 = A0_43.work
    L11_54.nowMark = A2_45
    L11_54 = A0_43.work
    L11_54.nowRewardItem = A3_46
    L11_54 = A0_43.work
    L11_54.nowRewardNumber = A4_47
    L11_54 = A0_43.work
    L11_54.nowRewardSubItem = A5_48
    L11_54 = A0_43.work
    L11_54.nowRewardSubNumber = A6_49
    L11_54 = A0_43.work
    L11_54.nowBoostPoint = A7_50
    L11_54 = A0_43.work
    L11_54.nowCompleteFlag = A8_51
  end
  return L10_53
end
function PopulaceGuildlevePublisher.eventTalkAfterOffer(A0_55)
  A0_55:say(A0_55, 102, 0)
end
function PopulaceGuildlevePublisher.eventHistoryleveExist(A0_56, A1_57)
  A0_56:say(A0_56, 112, 0, A1_57)
end
function PopulaceGuildlevePublisher.eventHistoryleveCannot(A0_58)
  A0_58:say(A0_58, 111, 0)
  worldMaster:say(A0_58, 115, 6)
end
function PopulaceGuildlevePublisher.eventGLChangeDetail(A0_59, A1_60, A2_61, A3_62, A4_63, A5_64, A6_65, A7_66, A8_67, A9_68, A10_69)
  if desktopWidget:askJournalDetailWidget(6, A2_61, A8_67, A4_63, A5_64, A6_65, A7_66, A3_62, A9_68) == nil then
    return false
  end
  if A0_59:askExtendWidget(A0_59, 98, 2, 1, 2, A2_61, A1_60) ~= 1 then
    return false
  end
  return (desktopWidget:askJournalDetailWidget(6, A2_61, A8_67, A4_63, A5_64, A6_65, A7_66, A3_62, A9_68))
end
function PopulaceGuildlevePublisher.eventTalkChangeOne(A0_70, A1_71)
  if A1_71 ~= true and worldMaster:ask(A0_70, A0_70, 95, 2) ~= 1 then
    return
  end
  worldMaster:notify(A0_70, 101)
  A0_70.work.selected_change_index[1] = 0
  if desktopWidget:askGuildleveChangeCard(A0_70) == false or desktopWidget:askGuildleveChangeCard(A0_70) == nil then
    return nil
  else
    return A0_70.work.selected_change_index[1]
  end
end
function PopulaceGuildlevePublisher.getPreGuildlevePackId(A0_72, A1_73)
  A1_73 = A0_72.work.startPack - 1 + A1_73
  if A1_73 <= A0_72.work.endPack then
    guildlevePackSheet:_loadKeyTemporarily(A1_73, A1_73)
    guildlevePackSheet:_unloadKey(A1_73, A1_73)
    return (guildlevePackSheet:_getData(A1_73, 0))
  else
    return nil
  end
end
function PopulaceGuildlevePublisher.getMaxCardNum(A0_74)
  local L1_75
  L1_75 = 8
  return L1_75
end
function PopulaceGuildlevePublisher.getPreGuildleveId(A0_76, A1_77)
  local L2_78
  if A1_77 <= 8 then
    L2_78 = A0_76.work
    L2_78 = L2_78.pre_leve_id
    L2_78 = L2_78[A1_77]
    return L2_78
  else
    L2_78 = 0
    return L2_78
  end
end
function PopulaceGuildlevePublisher.getMaxGuildlevePackNum(A0_79)
  local L1_80, L2_81
  L1_80 = A0_79.work
  L1_80 = L1_80.endPack
  L2_81 = A0_79.work
  L2_81 = L2_81.startPack
  L1_80 = L1_80 - L2_81
  L1_80 = L1_80 + 1
  return L1_80
end
function PopulaceGuildlevePublisher.getGuildleveChangeBonus(A0_82, A1_83)
  if A0_82.work.selected_change_index[1] ~= 0 then
    return nil
  end
  return 0
end
function PopulaceGuildlevePublisher.selectGuildleveChangeBonus(A0_84, A1_85)
  local L2_86
  L2_86 = A0_84.work
  L2_86 = L2_86.selected_change_index
  L2_86[1] = A1_85
end
function PopulaceGuildlevePublisher.talkOfferMaxOver(A0_87)
  A0_87:say(A0_87, 114, 0)
end
function PopulaceGuildlevePublisher.askRetryRegionalleve(A0_88, A1_89, A2_90)
  local L3_91, L4_92
  L3_91 = worldMaster:ask(A0_88, worldMaster, 50144, 2, A1_89, A2_90)
  if L3_91 == 1 then
    return L3_91, L4_92
  elseif L3_91 == 2 then
    L4_92 = worldMaster:ask(A0_88, worldMaster, 50149, 2, A1_89)
  end
  return L3_91, L4_92
end
function PopulaceGuildlevePublisher.canUseGuildleve(A0_93, A1_94, A2_95)
  local L3_96
  L3_96 = true
  return L3_96
end
