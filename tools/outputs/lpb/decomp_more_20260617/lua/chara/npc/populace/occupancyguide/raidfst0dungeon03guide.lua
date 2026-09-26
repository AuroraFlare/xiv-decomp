require("/Chara/Npc/Populace/OccupancyGuide/OccupancyGuideBaseClass")
_defineClass("RaidFst0Dungeon03Guide", "OccupancyGuideBaseClass")
function RaidFst0Dungeon03Guide.initAsOccupancyGuide(A0_0)
  A0_0:_loadTextDataPermanently(6704, "raidFst0Dungeon03Guide")
end
function RaidFst0Dungeon03Guide.askMainMenu(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8, A8_9)
  local L9_10
  L9_10 = 1
  if A1_2 ~= nil then
    A0_1:startCliantTalkTurn(2, A1_2)
  end
  if not A2_3 then
    A0_1:say(A0_1, 1, 0)
  end
  repeat
    L9_10 = A0_1:askExtendWidget(A0_1, 2, 4, 1, L9_10, A8_9, A8_9, A8_9)
    if L9_10 == 1 then
      A0_1:say(A0_1, 7, 0)
      A0_1:say(A0_1, 8, 0)
      A0_1:say(A0_1, 9, 0)
      break
    else
    end
    if L9_10 == 2 then
      A0_1:say(A0_1, 10, 0)
      worldMaster:say(A0_1, 11, A8_9, 0, A3_4, A5_6)
      worldMaster:say(A0_1, 41)
      A0_1:say(A0_1, 12, 0)
      worldMaster:say(A0_1, 13, A8_9, A7_8)
      A0_1:say(A0_1, 14, 0)
      worldMaster:say(A0_1, 15, A8_9)
      worldMaster:say(A0_1, 40, A8_9)
      break
    else
    end
    if L9_10 == 3 then
      A0_1:say(A0_1, 16, 0)
      if A0_1:askExtendWidget(A0_1, 17, 2, 1, 1, A8_9) == 1 then
        do break end
        elseif L9_10 == 4 then
        else
          if L9_10 == -3 then
          else
          end
        end
      else
      end
  until true == true
  return L9_10
end
function RaidFst0Dungeon03Guide.tellErrorMessage(A0_11, A1_12, A2_13, A3_14, A4_15, A5_16, A6_17, A7_18)
  if A1_12 == 12 then
    A0_11:say(A0_11, 20, 0)
    break
  else
  end
  if A1_12 == 2 then
    A0_11:say(A0_11, 21, 0)
    break
  else
  end
  if A1_12 == 18 then
    A0_11:say(A0_11, 22, 0)
    A0_11:say(A0_11, 24, 0)
    worldMaster:say(A0_11, 23, A7_18)
    break
  else
  end
  if A1_12 == 19 then
    A0_11:say(A0_11, 25, 0)
    worldMaster:say(A0_11, 26, A7_18)
    break
  else
  end
  if A1_12 == 20 then
    A0_11:say(A0_11, 32, 0)
    worldMaster:say(A0_11, 33, A7_18, 0, 0, A4_15)
    break
  else
  end
  if A1_12 == 21 then
    A0_11:say(A0_11, 34, 0)
    worldMaster:say(A0_11, 35, A7_18, 0, 0, A4_15)
    break
  else
  end
  if A1_12 == 13 then
    A0_11:say(A0_11, 27, 0)
    break
  else
  end
  if A1_12 == 14 then
    A0_11:say(A0_11, 28, 0)
    break
  else
  end
  if A1_12 == 4 then
    A0_11:say(A0_11, 29, 0, 0, 0, A2_13)
    break
  else
  end
  if A1_12 == 3 then
    A0_11:say(A0_11, 30, 0, 0, 0, A2_13, 0, A3_14 + 1)
    break
  else
    if A1_12 == 5 then
      break
    else
    end
    if A1_12 == 10 then
      A0_11:say(A0_11, 32, 0)
      worldMaster:say(A0_11, 33, A7_18, 0, 0, A4_15)
      break
    else
    end
    if A1_12 == 11 then
      A0_11:say(A0_11, 34, 0)
      worldMaster:say(A0_11, 35, A7_18, 0, 0, A4_15)
      break
    else
    end
    if A1_12 == 8 then
      A0_11:say(A0_11, 36, 0)
      break
    else
    end
    if A1_12 == 6 then
      A0_11:say(A0_11, 37, 0)
      break
    else
    end
    if A1_12 == 7 then
      A0_11:say(A0_11, 38, 0)
      break
    else
    end
    if A1_12 == 9 then
      A0_11:say(A0_11, 39, 0)
      break
    else
    end
  end
  A0_11:finishCliantTalkTurn()
end
function RaidFst0Dungeon03Guide.debugSelectErrorCode(A0_19)
  local L1_20, L2_21, L3_22, L4_23
  L1_20 = 1
  L2_21 = nil
  L3_22 = L2_21
  if L3_22 == 1 then
    L2_21 = 1
    break
  else
  end
  if L3_22 == 2 then
    L2_21 = 16
    break
  else
  end
  if L3_22 == 3 then
    L2_21 = 17
    break
  else
  end
  if L3_22 == 4 then
    L2_21 = 12
    break
  else
  end
  if L3_22 == 5 then
    L2_21 = 2
    break
  else
  end
  if L3_22 == 6 then
    L2_21 = 18
    break
  else
  end
  if L3_22 == 7 then
    L2_21 = 19
    break
  else
  end
  if L3_22 == 8 then
    L2_21 = 13
    break
  else
  end
  if L3_22 == 9 then
    L2_21 = 14
    break
  else
  end
  if L3_22 == 10 then
    L2_21 = 4
    break
  else
  end
  if L3_22 == 11 then
    L2_21 = 3
    break
  else
  end
  if L3_22 == 12 then
    L2_21 = 5
    break
  else
  end
  if L3_22 == 13 then
    L2_21 = 10
    break
  else
  end
  if L3_22 == 14 then
    L2_21 = 11
    break
  else
  end
  if L3_22 == 15 then
    L2_21 = 8
    break
  else
  end
  if L3_22 == 16 then
    L2_21 = 6
    break
  else
  end
  if L3_22 == 17 then
    L2_21 = 7
    break
  else
  end
  if L3_22 == 18 then
    L2_21 = 9
    break
  else
  end
  if L3_22 == 19 then
    L2_21 = 20
    break
  else
  end
  if L3_22 == 20 then
    L2_21 = 21
    break
  else
  end
  L3_22 = L2_21
  L4_23 = L1_20
  return L3_22, L4_23
end
function RaidFst0Dungeon03Guide.resetClientNeckDirection(A0_24)
  A0_24:finishCliantTalkTurn()
end
