require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceWaveAttackCryer", "NpcBaseClass")
function PopulaceWaveAttackCryer.initForEvent(A0_0)
  A0_0:_setGroundOn(true)
  A0_0:_loadTextDataPermanently(7568, "populaceWaveAttackCryer")
end
function PopulaceWaveAttackCryer.waTalkEvent01_01(A0_1, A1_2)
  local L2_3, L3_4
  L3_4 = A0_1
  L2_3 = A0_1.startCliantTalkTurn
  L2_3(L3_4, 2, A1_2)
  L3_4 = A0_1
  L2_3 = A0_1.say
  L2_3(L3_4, A0_1, 56, 0)
  L3_4 = A0_1
  L2_3 = A0_1.askExtendWidget
  L2_3 = L2_3(L3_4, A0_1, 4, 3, 1, 1)
  L3_4 = L2_3
  if L3_4 == 1 then
    A0_1:say(A0_1, 57, 0)
    break
  else
  end
  if L3_4 == 2 then
    A0_1:say(A0_1, 58, 0)
    break
  else
  end
  if L3_4 == 3 then
    A0_1:say(A0_1, 59, 0)
    break
  else
  end
  L3_4 = A0_1.finishCliantTalkTurn
  L3_4(A0_1)
  return L2_3
end
function PopulaceWaveAttackCryer.waTalkEvent02_01(A0_5, A1_6)
  local L2_7, L3_8
  L3_8 = A0_5
  L2_7 = A0_5.startCliantTalkTurn
  L2_7(L3_8, 2, A1_6)
  L3_8 = A0_5
  L2_7 = A0_5.say
  L2_7(L3_8, A0_5, 61, 0)
  L3_8 = A0_5
  L2_7 = A0_5.askExtendWidget
  L2_7 = L2_7(L3_8, A0_5, 4, 3, 1, 1)
  L3_8 = L2_7
  if L3_8 == 1 then
    A0_5:say(A0_5, 62, 0)
    break
  else
  end
  if L3_8 == 2 then
    A0_5:say(A0_5, 63, 0)
    break
  else
  end
  if L3_8 == 3 then
    A0_5:say(A0_5, 64, 0)
    break
  else
  end
  L3_8 = A0_5.finishCliantTalkTurn
  L3_8(A0_5)
  return L2_7
end
function PopulaceWaveAttackCryer.waTalkEvent02_01_WIN(A0_9, A1_10)
  local L2_11, L3_12
  L3_12 = A0_9
  L2_11 = A0_9.startCliantTalkTurn
  L2_11(L3_12, 2, A1_10)
  L3_12 = A0_9
  L2_11 = A0_9.say
  L2_11(L3_12, A0_9, 66, 0)
  L3_12 = A0_9
  L2_11 = A0_9.askExtendWidget
  L2_11 = L2_11(L3_12, A0_9, 18, 2, 1, 1)
  L3_12 = L2_11
  if L3_12 == 1 then
    A0_9:say(A0_9, 67, 0)
    break
  else
  end
  if L3_12 == 2 then
    A0_9:say(A0_9, 68, 0)
    break
  else
  end
  L3_12 = A0_9.finishCliantTalkTurn
  L3_12(A0_9)
  return L2_11
end
function PopulaceWaveAttackCryer.waTalkEvent02_01_LOSE(A0_13, A1_14)
  local L2_15, L3_16
  L3_16 = A0_13
  L2_15 = A0_13.startCliantTalkTurn
  L2_15(L3_16, 2, A1_14)
  L3_16 = A0_13
  L2_15 = A0_13.say
  L2_15(L3_16, A0_13, 70, 0)
  L3_16 = A0_13
  L2_15 = A0_13.askExtendWidget
  L2_15 = L2_15(L3_16, A0_13, 18, 2, 1, 1)
  L3_16 = L2_15
  if L3_16 == 1 then
    A0_13:say(A0_13, 71, 0)
    break
  else
  end
  if L3_16 == 2 then
    A0_13:say(A0_13, 72, 0)
    break
  else
  end
  L3_16 = A0_13.finishCliantTalkTurn
  L3_16(A0_13)
  return L2_15
end
function PopulaceWaveAttackCryer.waTalkEvent03_01(A0_17, A1_18)
  local L2_19, L3_20
  L3_20 = A0_17
  L2_19 = A0_17.startCliantTalkTurn
  L2_19(L3_20, 2, A1_18)
  L3_20 = A0_17
  L2_19 = A0_17.say
  L2_19(L3_20, A0_17, 74, 0)
  L3_20 = A0_17
  L2_19 = A0_17.askExtendWidget
  L2_19 = L2_19(L3_20, A0_17, 4, 3, 1, 1)
  L3_20 = L2_19
  if L3_20 == 1 then
    A0_17:say(A0_17, 75, 0)
    break
  else
  end
  if L3_20 == 2 then
    A0_17:say(A0_17, 76, 0)
    break
  else
  end
  if L3_20 == 3 then
    A0_17:say(A0_17, 77, 0)
    break
  else
  end
  L3_20 = A0_17.finishCliantTalkTurn
  L3_20(A0_17)
  return L2_19
end
function PopulaceWaveAttackCryer.waTalkEvent04_01(A0_21, A1_22)
  local L2_23, L3_24
  L3_24 = A0_21
  L2_23 = A0_21.startCliantTalkTurn
  L2_23(L3_24, 2, A1_22)
  L3_24 = A0_21
  L2_23 = A0_21.say
  L2_23(L3_24, A0_21, 79, 0)
  L3_24 = A0_21
  L2_23 = A0_21.askExtendWidget
  L2_23 = L2_23(L3_24, A0_21, 4, 3, 1, 1)
  L3_24 = L2_23
  if L3_24 == 1 then
    A0_21:say(A0_21, 80, 0)
    break
  else
  end
  if L3_24 == 2 then
    A0_21:say(A0_21, 81, 0)
    break
  else
  end
  if L3_24 == 3 then
    A0_21:say(A0_21, 82, 0)
    break
  else
  end
  L3_24 = A0_21.finishCliantTalkTurn
  L3_24(A0_21)
  return L2_23
end
function PopulaceWaveAttackCryer.waTalkEvent04_01_WIN(A0_25, A1_26)
  local L2_27, L3_28
  L3_28 = A0_25
  L2_27 = A0_25.startCliantTalkTurn
  L2_27(L3_28, 2, A1_26)
  L3_28 = A0_25
  L2_27 = A0_25.say
  L2_27(L3_28, A0_25, 84, 0)
  L3_28 = A0_25
  L2_27 = A0_25.askExtendWidget
  L2_27 = L2_27(L3_28, A0_25, 18, 2, 1, 1)
  L3_28 = L2_27
  if L3_28 == 1 then
    A0_25:say(A0_25, 85, 0)
    break
  else
  end
  if L3_28 == 2 then
    A0_25:say(A0_25, 86, 0)
    break
  else
  end
  L3_28 = A0_25.finishCliantTalkTurn
  L3_28(A0_25)
  return L2_27
end
function PopulaceWaveAttackCryer.waTalkEvent04_01_LOSE(A0_29, A1_30)
  local L2_31, L3_32
  L3_32 = A0_29
  L2_31 = A0_29.startCliantTalkTurn
  L2_31(L3_32, 2, A1_30)
  L3_32 = A0_29
  L2_31 = A0_29.say
  L2_31(L3_32, A0_29, 88, 0)
  L3_32 = A0_29
  L2_31 = A0_29.askExtendWidget
  L2_31 = L2_31(L3_32, A0_29, 18, 2, 1, 1)
  L3_32 = L2_31
  if L3_32 == 1 then
    A0_29:say(A0_29, 89, 0)
    break
  else
  end
  if L3_32 == 2 then
    A0_29:say(A0_29, 90, 0)
    break
  else
  end
  L3_32 = A0_29.finishCliantTalkTurn
  L3_32(A0_29)
  return L2_31
end
function PopulaceWaveAttackCryer.waTalkEvent05_01(A0_33, A1_34)
  local L2_35, L3_36
  L3_36 = A0_33
  L2_35 = A0_33.startCliantTalkTurn
  L2_35(L3_36, 2, A1_34)
  L3_36 = A0_33
  L2_35 = A0_33.say
  L2_35(L3_36, A0_33, 92, 0)
  L3_36 = A0_33
  L2_35 = A0_33.askExtendWidget
  L2_35 = L2_35(L3_36, A0_33, 4, 3, 1, 1)
  L3_36 = L2_35
  if L3_36 == 1 then
    A0_33:say(A0_33, 93, 0)
    break
  else
  end
  if L3_36 == 2 then
    A0_33:say(A0_33, 94, 0)
    break
  else
  end
  if L3_36 == 3 then
    A0_33:say(A0_33, 95, 0)
    break
  else
  end
  L3_36 = A0_33.finishCliantTalkTurn
  L3_36(A0_33)
  return L2_35
end
function PopulaceWaveAttackCryer.waTalkEvent06_01(A0_37, A1_38)
  local L2_39, L3_40
  L3_40 = A0_37
  L2_39 = A0_37.startCliantTalkTurn
  L2_39(L3_40, 2, A1_38)
  L3_40 = A0_37
  L2_39 = A0_37.say
  L2_39(L3_40, A0_37, 97, 0)
  L3_40 = A0_37
  L2_39 = A0_37.askExtendWidget
  L2_39 = L2_39(L3_40, A0_37, 4, 3, 1, 1)
  L3_40 = L2_39
  if L3_40 == 1 then
    A0_37:say(A0_37, 98, 0)
    break
  else
  end
  if L3_40 == 2 then
    A0_37:say(A0_37, 99, 0)
    break
  else
  end
  if L3_40 == 3 then
    A0_37:say(A0_37, 100, 0)
    break
  else
  end
  L3_40 = A0_37.finishCliantTalkTurn
  L3_40(A0_37)
  return L2_39
end
function PopulaceWaveAttackCryer.waTalkEvent06_01_WIN(A0_41, A1_42)
  local L2_43, L3_44
  L3_44 = A0_41
  L2_43 = A0_41.startCliantTalkTurn
  L2_43(L3_44, 2, A1_42)
  L3_44 = A0_41
  L2_43 = A0_41.say
  L2_43(L3_44, A0_41, 102, 0)
  L3_44 = A0_41
  L2_43 = A0_41.askExtendWidget
  L2_43 = L2_43(L3_44, A0_41, 18, 2, 1, 1)
  L3_44 = L2_43
  if L3_44 == 1 then
    A0_41:say(A0_41, 103, 0)
    break
  else
  end
  if L3_44 == 2 then
    A0_41:say(A0_41, 104, 0)
    break
  else
  end
  L3_44 = A0_41.finishCliantTalkTurn
  L3_44(A0_41)
  return L2_43
end
function PopulaceWaveAttackCryer.waTalkEvent06_01_LOSE(A0_45, A1_46)
  local L2_47, L3_48
  L3_48 = A0_45
  L2_47 = A0_45.startCliantTalkTurn
  L2_47(L3_48, 2, A1_46)
  L3_48 = A0_45
  L2_47 = A0_45.say
  L2_47(L3_48, A0_45, 106, 0)
  L3_48 = A0_45
  L2_47 = A0_45.askExtendWidget
  L2_47 = L2_47(L3_48, A0_45, 18, 2, 1, 1)
  L3_48 = L2_47
  if L3_48 == 1 then
    A0_45:say(A0_45, 107, 0)
    break
  else
  end
  if L3_48 == 2 then
    A0_45:say(A0_45, 108, 0)
    break
  else
  end
  L3_48 = A0_45.finishCliantTalkTurn
  L3_48(A0_45)
  return L2_47
end
