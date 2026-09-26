require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceCaravanManager", "NpcBaseClass")
function PopulaceCaravanManager.initForEvent(A0_0)
  local L1_1
  L1_1 = A0_0._loadTextDataPermanently
  L1_1(A0_0, 7520, "populaceCaravanManager")
  L1_1 = {}
  A0_0:initWork(nil, L1_1)
  A0_0:_setGroundOn(false)
end
function PopulaceCaravanManager.caravanGuardEntry(A0_2, A1_3, A2_4, A3_5, A4_6, A5_7, A6_8, A7_9)
  local L8_10, L9_11, L10_12
  L8_10 = worldMaster
  L9_11 = L8_10
  L8_10 = L8_10._getMyPlayer
  L8_10 = L8_10(L9_11)
  L10_12 = A0_2
  L9_11 = A0_2.startCliantTalkTurn
  L9_11(L10_12, 2, L8_10)
  if A1_3 ~= A5_7 then
    L10_12 = A0_2
    L9_11 = A0_2.isUpperRank
    L9_11 = L9_11(L10_12, A5_7, 25)
    if L9_11 == true then
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 63, 0, A1_3)
    else
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 64, 0, A1_3)
    end
  end
  if A4_6 >= 40 and A3_5 == 0 then
    L10_12 = A0_2
    L9_11 = A0_2.isUpperRank
    L9_11 = L9_11(L10_12, A5_7, 25)
    if L9_11 == true then
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 47, 0, A1_3)
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 49, 0)
    else
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 48, 0, A1_3)
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 50, 0)
    end
  else
    L10_12 = A0_2
    L9_11 = A0_2.isUpperRank
    L9_11 = L9_11(L10_12, A5_7, 25)
    if L9_11 == true then
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 15, 0, A1_3, A1_3 + A3_5)
    else
      L10_12 = A0_2
      L9_11 = A0_2.say
      L9_11(L10_12, A0_2, 37, 0, A1_3, A1_3 + A3_5)
    end
  end
  if A3_5 == 0 then
    L9_11 = worldMaster
    L10_12 = L9_11
    L9_11 = L9_11.say
    L9_11(L10_12, A0_2, 65, A1_3 + A3_5, A7_9, A6_8)
  else
    L9_11 = worldMaster
    L10_12 = L9_11
    L9_11 = L9_11.say
    L9_11(L10_12, A0_2, 65, A1_3 + A3_5, A7_9, A6_8)
  end
  L10_12 = A0_2
  L9_11 = A0_2.askExtendWidget
  L9_11 = L9_11(L10_12, A0_2, 16, 2, 1, 1, A1_3 + A3_5)
  L10_12 = L9_11
  if L10_12 == 1 then
    if A2_4 == false then
      if A0_2:isUpperRank(A5_7, 25) == true then
        A0_2:say(A0_2, 22, 0)
      else
        A0_2:say(A0_2, 38, 0)
      end
      L9_11 = A0_2:askExtendWidget(A0_2, 23, 2, 1, 2)
      do break end
      else
      end
      if L10_12 == 2 then
        if A4_6 >= 40 and A3_5 == 0 then
          A0_2:_runCharaScheduler(70795264)
          L9_11 = 3
        elseif A0_2:isUpperRank(A5_7, 25) == true then
          A0_2:say(A0_2, 21, 0, A5_7)
        else
          A0_2:say(A0_2, 41, 0, A5_7)
        end
      end
    else
    end
  return L9_11
end
function PopulaceCaravanManager.caravanGuardQuestion(A0_13, A1_14, A2_15, A3_16, A4_17, A5_18)
  local L6_19, L7_20, L8_21
  L6_19 = worldMaster
  L7_20 = L6_19
  L6_19 = L6_19._getMyPlayer
  L6_19 = L6_19(L7_20)
  L8_21 = A0_13
  L7_20 = A0_13.startCliantTalkTurn
  L7_20(L8_21, 2, L6_19)
  L8_21 = A0_13
  L7_20 = A0_13.doSalute
  L7_20 = L7_20(L8_21, A1_14, 25)
  if A4_17 == true then
    L8_21 = A0_13.isUpperRank
    L8_21 = L8_21(A0_13, A5_18, 25)
    if L8_21 == true then
      L8_21 = A0_13.say
      L8_21(A0_13, A0_13, 60, 0, A1_14)
    else
      L8_21 = A0_13.say
      L8_21(A0_13, A0_13, 42, 0, A1_14)
    end
  end
  L8_21 = A0_13.isUpperRank
  L8_21 = L8_21(A0_13, A5_18, 25)
  if L8_21 == true then
    L8_21 = A0_13.say
    L8_21(A0_13, A0_13, 3, 0, A1_14, A1_14 + A2_15)
  else
    L8_21 = A0_13.say
    L8_21(A0_13, A0_13, 28, 0, A1_14, A1_14 + A2_15)
  end
  L8_21 = nil
  while true do
    if L8_21 ~= 3 then
      L8_21 = A0_13:askExtendWidget(A0_13, 4, 3, 1, 3)
      if L8_21 == 1 then
        if A0_13:isUpperRank(A5_18, 25) == true then
          A0_13:_runCharaScheduler(353964032)
          A0_13:say(A0_13, 8, 0, A1_14 + A2_15)
          A0_13:say(A0_13, 9, 0)
          A0_13:_runCharaScheduler(354103296)
          A0_13:say(A0_13, 10, 0, A1_14)
        else
          A0_13:_runCharaScheduler(353964032)
          A0_13:say(A0_13, 29, 0, A1_14 + A2_15)
          A0_13:say(A0_13, 30, 0)
          A0_13:_runCharaScheduler(354103296)
          A0_13:say(A0_13, 31, 0, A1_14)
        end
      elseif L8_21 == 2 then
        if A0_13:isUpperRank(A5_18, 25) == true then
          A0_13:_runCharaScheduler(354099200)
          A0_13:say(A0_13, 11, 0, A3_16)
          A0_13:say(A0_13, 43, 0, A3_16)
          A0_13:say(A0_13, 12, 0, A1_14 + A2_15)
          A0_13:_runCharaScheduler(353980416)
          A0_13:say(A0_13, 13, 0)
          A0_13:say(A0_13, 45, 0)
          if A1_14 ~= A5_18 then
            A0_13:say(A0_13, 61, 0, A5_18)
          end
        else
          A0_13:_runCharaScheduler(354099200)
          A0_13:say(A0_13, 32, 0, A3_16)
          A0_13:say(A0_13, 44, 0, A3_16)
          A0_13:say(A0_13, 33, 0, A1_14 + A2_15)
          A0_13:_runCharaScheduler(353980416)
          A0_13:say(A0_13, 34, 0)
          A0_13:say(A0_13, 46, 0)
          if A1_14 ~= A5_18 then
            A0_13:say(A0_13, 62, 0, A5_18)
          end
        end
      else
      end
      if L8_21 == 3 then
      end
      L8_21 = 3
    end
  end
  A0_13:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardJoinOK(A0_22, A1_23, A2_24, A3_25)
  if A0_22:isUpperRank(A3_25, 25) == true then
    A0_22:say(A0_22, 19, 0, A1_23 + A2_24)
  else
    A0_22:say(A0_22, 39, 0, A1_23 + A2_24)
  end
  worldMaster:say(A0_22, 66)
  worldMaster:say(A0_22, 27)
  if A1_23 == 2 then
    if A0_22:isUpperRank(A3_25, 25) == true then
      A0_22:say(A0_22, 58, 0, A1_23 + A2_24)
    else
      A0_22:say(A0_22, 59, 0, A1_23 + A2_24)
    end
  end
  A0_22:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardJoinNG(A0_26, A1_27, A2_28, A3_29)
  local L4_30
  L4_30 = worldMaster
  L4_30 = L4_30._getMyPlayer
  L4_30 = L4_30(L4_30)
  A0_26:startCliantTalkTurn(2, L4_30)
  if A0_26:isUpperRank(A3_29, 25) == true then
    A0_26:say(A0_26, 20, 0, A2_28)
  else
    A0_26:say(A0_26, 40, 0, A2_28)
  end
  A0_26:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardAmple(A0_31, A1_32, A2_33, A3_34)
  local L4_35
  L4_35 = worldMaster
  L4_35 = L4_35._getMyPlayer
  L4_35 = L4_35(L4_35)
  A0_31:startCliantTalkTurn(2, L4_35)
  if A0_31:isUpperRank(A3_34, 25) == true then
    A0_31:say(A0_31, 26, 0, A2_33)
  else
    A0_31:say(A0_31, 36, 0, A2_33)
  end
  A0_31:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardOther(A0_36, A1_37)
  local L2_38
  L2_38 = worldMaster
  L2_38 = L2_38._getMyPlayer
  L2_38 = L2_38(L2_38)
  A0_36:startCliantTalkTurn(2, L2_38)
  A0_36:_runCharaScheduler(354078720)
  A0_36:say(A0_36, 2, 0, A1_37)
  A0_36:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardSigh(A0_39)
  A0_39:_runCharaScheduler(354041856)
  A0_39:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardHuh(A0_40)
  A0_40:_runCharaScheduler(83955712)
  A0_40:finishCliantTalkTurn()
end
function PopulaceCaravanManager.caravanGuardCancel(A0_41, A1_42, A2_43)
  if A0_41:isUpperRank(A2_43, 25) == true then
    A0_41:say(A0_41, 51, 0)
  else
    A0_41:say(A0_41, 52, 0)
  end
  if A0_41:askExtendWidget(A0_41, 55, 2, 1, 2) == 1 then
    if A0_41:isUpperRank(A2_43, 25) == true then
      A0_41:say(A0_41, 53, 0)
    else
      A0_41:say(A0_41, 54, 0)
    end
  else
  end
  return (A0_41:askExtendWidget(A0_41, 55, 2, 1, 2))
end
