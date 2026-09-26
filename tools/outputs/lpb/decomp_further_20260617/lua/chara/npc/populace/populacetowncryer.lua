require("/Chara/Npc/NpcBaseClass")
_defineClass("PopulaceTownCryer", "NpcBaseClass")
function PopulaceTownCryer.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(5939, "populaceTownCryer")
end
function PopulaceTownCryer.gmMenu(A0_1, A1_2)
  local L2_3, L3_4
  L2_3 = -3
  L3_4 = -3
  repeat
    L2_3 = A0_1:askExtendWidget(A0_1, 22, 3, 1, 1)
    if L2_3 == 1 then
      L3_4 = 0
      break
    else
    end
    if L2_3 == 2 then
      L3_4 = A0_1:askExtendWidget(A0_1, 26, 2, 1, 2)
      break
    else
    end
    if L2_3 == 3 then
      L3_4 = A0_1:askExtendWidget(A0_1, 29, 3, 1, 1)
      break
    else
    end
  until L2_3 == -3 or L3_4 ~= -3
  return L2_3, L3_4
end
function PopulaceTownCryer.tcTalkEvent01_01(A0_5, A1_6)
  local L2_7, L3_8
  L3_8 = A0_5
  L2_7 = A0_5.startCliantTalkTurn
  L2_7(L3_8, 2, A1_6)
  L3_8 = A0_5
  L2_7 = A0_5.say
  L2_7(L3_8, A0_5, 2, 0)
  L3_8 = A0_5
  L2_7 = A0_5.askExtendWidget
  L2_7 = L2_7(L3_8, A0_5, 3, 2, 1, 1)
  L3_8 = L2_7
  if L3_8 == 1 then
    A0_5:say(A0_5, 6, 0)
    break
  else
  end
  if L3_8 == 2 then
    A0_5:say(A0_5, 7, 0)
    break
  else
  end
  L3_8 = A0_5.finishCliantTalkTurn
  L3_8(A0_5)
  return L2_7
end
function PopulaceTownCryer.tcTalkEvent01_02(A0_9, A1_10, A2_11)
  local L3_12, L4_13
  L4_13 = A0_9
  L3_12 = A0_9.startCliantTalkTurn
  L3_12(L4_13, 2, A1_10)
  L4_13 = A0_9
  L3_12 = A0_9.say
  L3_12(L4_13, A0_9, 34, 0)
  L4_13 = A0_9
  L3_12 = A0_9.askExtendWidget
  L3_12 = L3_12(L4_13, A0_9, 35, 3, 1, 1)
  L4_13 = L3_12
  if L4_13 == 1 then
    A0_9:say(A0_9, 39, 0)
    break
  else
  end
  if L4_13 == 2 then
    A0_9:say(A0_9, 40, 0)
    break
  else
  end
  if L4_13 == 3 then
    if A2_11 == 101 then
      A0_9:say(A0_9, 41, 0)
      break
    else
    end
    if A2_11 == 103 then
      A0_9:say(A0_9, 42, 0)
      break
    else
    end
    if A2_11 == 104 then
      A0_9:say(A0_9, 43, 0)
      do break end
      break
    else
    end
  else
  end
  L4_13 = A0_9.finishCliantTalkTurn
  L4_13(A0_9)
  return L3_12
end
function PopulaceTownCryer.tcTalkEvent01_03(A0_14, A1_15)
  local L2_16, L3_17
  L3_17 = A0_14
  L2_16 = A0_14.startCliantTalkTurn
  L2_16(L3_17, 2, A1_15)
  L3_17 = A0_14
  L2_16 = A0_14.say
  L2_16(L3_17, A0_14, 52, 0)
  L3_17 = A0_14
  L2_16 = A0_14.askExtendWidget
  L2_16 = L2_16(L3_17, A0_14, 53, 2, 1, 1)
  L3_17 = L2_16
  if L3_17 == 1 then
    A0_14:say(A0_14, 56, 0)
    break
  else
  end
  if L3_17 == 2 then
    A0_14:say(A0_14, 57, 0)
    break
  else
  end
  L3_17 = A0_14.finishCliantTalkTurn
  L3_17(A0_14)
  return L2_16
end
function PopulaceTownCryer.tcTalkEvent01_04(A0_18, A1_19)
  local L2_20, L3_21
  L3_21 = A0_18
  L2_20 = A0_18.startCliantTalkTurn
  L2_20(L3_21, 2, A1_19)
  L3_21 = A0_18
  L2_20 = A0_18.say
  L2_20(L3_21, A0_18, 63, 0)
  L3_21 = A0_18
  L2_20 = A0_18.askExtendWidget
  L2_20 = L2_20(L3_21, A0_18, 53, 2, 1, 1)
  L3_21 = L2_20
  if L3_21 == 1 then
    A0_18:say(A0_18, 64, 0)
    break
  else
  end
  if L3_21 == 2 then
    A0_18:say(A0_18, 65, 0)
    break
  else
  end
  L3_21 = A0_18.finishCliantTalkTurn
  L3_21(A0_18)
  return L2_20
end
function PopulaceTownCryer.tcTalkEvent01_05(A0_22, A1_23, A2_24)
  local L3_25, L4_26
  L4_26 = A0_22
  L3_25 = A0_22.startCliantTalkTurn
  L3_25(L4_26, 2, A1_23)
  L4_26 = A0_22
  L3_25 = A0_22.say
  L3_25(L4_26, A0_22, 71, 0)
  L4_26 = A0_22
  L3_25 = A0_22.askExtendWidget
  L3_25 = L3_25(L4_26, A0_22, 72, 2, 1, 1)
  L4_26 = L3_25
  if L4_26 == 1 then
    A0_22:say(A0_22, 75, 0)
    break
  else
  end
  if L4_26 == 2 then
    if A2_24 == 101 then
      A0_22:say(A0_22, 76, 0)
      break
    else
    end
    if A2_24 == 103 then
      A0_22:say(A0_22, 77, 0)
      break
    else
    end
    if A2_24 == 104 then
      A0_22:say(A0_22, 115, 0)
      do break end
      break
    else
    end
  else
  end
  L4_26 = A0_22.finishCliantTalkTurn
  L4_26(A0_22)
  return L3_25
end
function PopulaceTownCryer.tcTalkEvent01_06(A0_27, A1_28)
  local L2_29, L3_30
  L3_30 = A0_27
  L2_29 = A0_27.startCliantTalkTurn
  L2_29(L3_30, 2, A1_28)
  L3_30 = A0_27
  L2_29 = A0_27.say
  L2_29(L3_30, A0_27, 84, 0)
  L3_30 = A0_27
  L2_29 = A0_27.askExtendWidget
  L2_29 = L2_29(L3_30, A0_27, 85, 2, 1, 1)
  L3_30 = L2_29
  if L3_30 == 1 then
    A0_27:say(A0_27, 88, 0)
    break
  else
  end
  if L3_30 == 2 then
    A0_27:say(A0_27, 89, 0)
    break
  else
  end
  L3_30 = A0_27.finishCliantTalkTurn
  L3_30(A0_27)
  return L2_29
end
function PopulaceTownCryer.tcTalkEvent01_07(A0_31, A1_32)
  local L2_33, L3_34
  L3_34 = A0_31
  L2_33 = A0_31.startCliantTalkTurn
  L2_33(L3_34, 2, A1_32)
  L3_34 = A0_31
  L2_33 = A0_31.say
  L2_33(L3_34, A0_31, 95, 0)
  L3_34 = A0_31
  L2_33 = A0_31.askExtendWidget
  L2_33 = L2_33(L3_34, A0_31, 96, 2, 1, 1)
  L3_34 = L2_33
  if L3_34 == 1 then
    A0_31:say(A0_31, 99, 0)
    break
  else
  end
  if L3_34 == 2 then
    A0_31:say(A0_31, 100, 0)
    break
  else
  end
  L3_34 = A0_31.finishCliantTalkTurn
  L3_34(A0_31)
  return L2_33
end
function PopulaceTownCryer.tcTalkEvent01_08(A0_35, A1_36)
  A0_35:startCliantTalkTurn(2, A1_36)
  A0_35:say(A0_35, 164, 0)
  A0_35:say(A0_35, 165, 0)
  A0_35:say(A0_35, 166, 0)
  A0_35:say(A0_35, 167, 0)
  if A0_35:askExtendWidget(A0_35, 168, 2, 1, 2) ~= 1 then
    A0_35:say(A0_35, 171, 0)
    A0_35:finishCliantTalkTurn()
    return
  end
  A0_35:say(A0_35, 172, 0)
  if A0_35:askExtendWidget(A0_35, 173, 2, 1, 2) ~= 1 then
    A0_35:say(A0_35, 176, 0)
    A0_35:finishCliantTalkTurn()
    return
  end
  A0_35:say(A0_35, 177, 0)
  A0_35:say(A0_35, 178, 0)
  if A0_35:askExtendWidget(A0_35, 179, 2, 1, 2) ~= 1 then
    A0_35:say(A0_35, 182, 0)
    A0_35:finishCliantTalkTurn()
    return
  end
  A1_36:_runCharaScheduler(67112954)
  A0_35:say(A0_35, 183, 0)
  A0_35:_wait(1)
  A1_36:_runCharaScheduler(67112955)
  A0_35:finishCliantTalkTurn()
  return true
end
function PopulaceTownCryer.tcTalkEvent02_01(A0_37, A1_38)
  local L2_39, L3_40
  L3_40 = A0_37
  L2_39 = A0_37.startCliantTalkTurn
  L2_39(L3_40, 2, A1_38)
  L3_40 = A0_37
  L2_39 = A0_37.say
  L2_39(L3_40, A0_37, 9, 0)
  L3_40 = A0_37
  L2_39 = A0_37.askExtendWidget
  L2_39 = L2_39(L3_40, A0_37, 10, 2, 1, 1)
  L3_40 = L2_39
  if L3_40 == 1 then
    A0_37:say(A0_37, 13, 0)
    break
  else
  end
  if L3_40 == 2 then
    A0_37:say(A0_37, 14, 0)
    break
  else
  end
  L3_40 = A0_37.finishCliantTalkTurn
  L3_40(A0_37)
  return L2_39
end
function PopulaceTownCryer.tcTalkEvent02_02(A0_41, A1_42, A2_43)
  local L3_44, L4_45
  L4_45 = A0_41
  L3_44 = A0_41.startCliantTalkTurn
  L3_44(L4_45, 2, A1_42)
  L4_45 = A0_41
  L3_44 = A0_41.say
  L3_44(L4_45, A0_41, 45, 0)
  L4_45 = A0_41
  L3_44 = A0_41.askExtendWidget
  L3_44 = L3_44(L4_45, A0_41, 35, 3, 1, 1)
  L4_45 = L3_44
  if L4_45 == 1 then
    A0_41:say(A0_41, 46, 0)
    break
  else
  end
  if L4_45 == 2 then
    A0_41:say(A0_41, 47, 0)
    break
  else
  end
  if L4_45 == 3 then
    if A2_43 == 101 then
      A0_41:say(A0_41, 48, 0)
      break
    else
    end
    if A2_43 == 103 then
      A0_41:say(A0_41, 49, 0)
      break
    else
    end
    if A2_43 == 104 then
      A0_41:say(A0_41, 50, 0)
      do break end
      break
    else
    end
  else
  end
  L4_45 = A0_41.finishCliantTalkTurn
  L4_45(A0_41)
  return L3_44
end
function PopulaceTownCryer.tcTalkEvent02_03(A0_46, A1_47)
  local L2_48, L3_49
  L3_49 = A0_46
  L2_48 = A0_46.startCliantTalkTurn
  L2_48(L3_49, 2, A1_47)
  L3_49 = A0_46
  L2_48 = A0_46.say
  L2_48(L3_49, A0_46, 59, 0)
  L3_49 = A0_46
  L2_48 = A0_46.askExtendWidget
  L2_48 = L2_48(L3_49, A0_46, 53, 2, 1, 1)
  L3_49 = L2_48
  if L3_49 == 1 then
    A0_46:say(A0_46, 60, 0)
    break
  else
  end
  if L3_49 == 2 then
    A0_46:say(A0_46, 61, 0)
    break
  else
  end
  L3_49 = A0_46.finishCliantTalkTurn
  L3_49(A0_46)
  return L2_48
end
function PopulaceTownCryer.tcTalkEvent02_04(A0_50, A1_51)
  local L2_52, L3_53
  L3_53 = A0_50
  L2_52 = A0_50.startCliantTalkTurn
  L2_52(L3_53, 2, A1_51)
  L3_53 = A0_50
  L2_52 = A0_50.say
  L2_52(L3_53, A0_50, 67, 0)
  L3_53 = A0_50
  L2_52 = A0_50.askExtendWidget
  L2_52 = L2_52(L3_53, A0_50, 53, 2, 1, 1)
  L3_53 = L2_52
  if L3_53 == 1 then
    A0_50:say(A0_50, 68, 0)
    break
  else
  end
  if L3_53 == 2 then
    A0_50:say(A0_50, 69, 0)
    break
  else
  end
  L3_53 = A0_50.finishCliantTalkTurn
  L3_53(A0_50)
  return L2_52
end
function PopulaceTownCryer.tcTalkEvent02_05(A0_54, A1_55, A2_56)
  local L3_57, L4_58
  L4_58 = A0_54
  L3_57 = A0_54.startCliantTalkTurn
  L3_57(L4_58, 2, A1_55)
  L4_58 = A0_54
  L3_57 = A0_54.say
  L3_57(L4_58, A0_54, 79, 0)
  L4_58 = A0_54
  L3_57 = A0_54.askExtendWidget
  L3_57 = L3_57(L4_58, A0_54, 72, 2, 1, 1)
  L4_58 = L3_57
  if L4_58 == 1 then
    A0_54:say(A0_54, 80, 0)
    break
  else
  end
  if L4_58 == 2 then
    if A2_56 == 101 then
      A0_54:say(A0_54, 81, 0)
      break
    else
    end
    if A2_56 == 103 then
      A0_54:say(A0_54, 82, 0)
      break
    else
    end
    if A2_56 == 104 then
      A0_54:say(A0_54, 116, 0)
      do break end
      break
    else
    end
  else
  end
  L4_58 = A0_54.finishCliantTalkTurn
  L4_58(A0_54)
  return L3_57
end
function PopulaceTownCryer.tcTalkEvent02_06(A0_59, A1_60)
  local L2_61, L3_62
  L3_62 = A0_59
  L2_61 = A0_59.startCliantTalkTurn
  L2_61(L3_62, 2, A1_60)
  L3_62 = A0_59
  L2_61 = A0_59.say
  L2_61(L3_62, A0_59, 91, 0)
  L3_62 = A0_59
  L2_61 = A0_59.askExtendWidget
  L2_61 = L2_61(L3_62, A0_59, 85, 2, 1, 1)
  L3_62 = L2_61
  if L3_62 == 1 then
    A0_59:say(A0_59, 92, 0)
    break
  else
  end
  if L3_62 == 2 then
    A0_59:say(A0_59, 93, 0)
    break
  else
  end
  L3_62 = A0_59.finishCliantTalkTurn
  L3_62(A0_59)
  return L2_61
end
function PopulaceTownCryer.tcTalkEvent02_07(A0_63, A1_64)
  local L2_65, L3_66
  L3_66 = A0_63
  L2_65 = A0_63.startCliantTalkTurn
  L2_65(L3_66, 2, A1_64)
  L3_66 = A0_63
  L2_65 = A0_63.say
  L2_65(L3_66, A0_63, 102, 0)
  L3_66 = A0_63
  L2_65 = A0_63.askExtendWidget
  L2_65 = L2_65(L3_66, A0_63, 96, 2, 1, 1)
  L3_66 = L2_65
  if L3_66 == 1 then
    A0_63:say(A0_63, 103, 0)
    break
  else
  end
  if L3_66 == 2 then
    A0_63:say(A0_63, 104, 0)
    break
  else
  end
  L3_66 = A0_63.finishCliantTalkTurn
  L3_66(A0_63)
  return L2_65
end
function PopulaceTownCryer.tcTalkEvent03_01(A0_67, A1_68)
  local L2_69, L3_70
  L3_70 = A0_67
  L2_69 = A0_67.startCliantTalkTurn
  L2_69(L3_70, 2, A1_68)
  L3_70 = A0_67
  L2_69 = A0_67.say
  L2_69(L3_70, A0_67, 16, 0)
  L3_70 = A0_67
  L2_69 = A0_67.askExtendWidget
  L2_69 = L2_69(L3_70, A0_67, 17, 2, 1, 1)
  L3_70 = L2_69
  if L3_70 == 1 then
    A0_67:say(A0_67, 20, 0)
    break
  else
  end
  if L3_70 == 2 then
    A0_67:say(A0_67, 21, 0)
    break
  else
  end
  L3_70 = A0_67.finishCliantTalkTurn
  L3_70(A0_67)
  return L2_69
end
function PopulaceTownCryer.tcTalkEvent04_01(A0_71, A1_72)
  local L2_73, L3_74
  L3_74 = A0_71
  L2_73 = A0_71.startCliantTalkTurn
  L2_73(L3_74, 2, A1_72)
  L3_74 = A0_71
  L2_73 = A0_71.say
  L2_73(L3_74, A0_71, 106, 0)
  L3_74 = A0_71
  L2_73 = A0_71.say
  L2_73(L3_74, A0_71, 107, 0)
  L3_74 = A0_71
  L2_73 = A0_71.say
  L2_73(L3_74, A0_71, 108, 0)
  L3_74 = A0_71
  L2_73 = A0_71.askExtendWidget
  L2_73 = L2_73(L3_74, A0_71, 109, 2, 1, 1)
  L3_74 = L2_73
  if L3_74 == 1 then
    if math:_randomInteger(1, 2) == 1 then
      A0_71:say(A0_71, 112, 0)
    else
      A0_71:say(A0_71, 113, 0)
      do break end
      else
      end
      if L3_74 == 2 then
        A0_71:say(A0_71, 114, 0)
        break
      else
      end
    end
  L3_74 = A0_71.finishCliantTalkTurn
  L3_74(A0_71)
  return L2_73
end
function PopulaceTownCryer.tcTalkEvent05_01(A0_75, A1_76)
  local L2_77, L3_78
  L3_78 = A0_75
  L2_77 = A0_75.startCliantTalkTurn
  L2_77(L3_78, 2, A1_76)
  L3_78 = A0_75
  L2_77 = A0_75.say
  L2_77(L3_78, A0_75, 118, 0)
  L3_78 = A0_75
  L2_77 = A0_75.askExtendWidget
  L2_77 = L2_77(L3_78, A0_75, 119, 3, 1, 1)
  L3_78 = L2_77
  if L3_78 == 1 then
    A0_75:say(A0_75, 123, 0)
    A0_75:say(A0_75, 163, 0)
    A0_75:say(A0_75, 124, 0)
    A0_75:say(A0_75, 125, 0)
    A0_75:say(A0_75, 126, 0)
    A0_75:say(A0_75, 127, 0)
    break
  else
  end
  if L3_78 == 2 then
    A0_75:say(A0_75, 128, 0)
    A0_75:say(A0_75, 129, 0)
    A0_75:say(A0_75, 130, 0)
    break
  else
  end
  if L3_78 == 3 then
    A0_75:say(A0_75, 131, 0)
    A0_75:say(A0_75, 132, 0)
    break
  else
  end
  L3_78 = A0_75.finishCliantTalkTurn
  L3_78(A0_75)
  return L2_77
end
function PopulaceTownCryer.tcTalkEvent05_02(A0_79, A1_80)
  local L2_81, L3_82
  L3_82 = A0_79
  L2_81 = A0_79.startCliantTalkTurn
  L2_81(L3_82, 2, A1_80)
  L3_82 = A0_79
  L2_81 = A0_79.say
  L2_81(L3_82, A0_79, 118, 0)
  L3_82 = A0_79
  L2_81 = A0_79.askExtendWidget
  L2_81 = L2_81(L3_82, A0_79, 119, 3, 1, 1)
  L3_82 = L2_81
  if L3_82 == 1 then
    A0_79:say(A0_79, 123, 0)
    A0_79:say(A0_79, 163, 0)
    A0_79:say(A0_79, 124, 0)
    A0_79:say(A0_79, 125, 0)
    A0_79:say(A0_79, 126, 0)
    A0_79:say(A0_79, 127, 0)
    break
  else
  end
  if L3_82 == 2 then
    A0_79:say(A0_79, 128, 0)
    A0_79:say(A0_79, 129, 0)
    A0_79:say(A0_79, 130, 0)
    break
  else
  end
  if L3_82 == 3 then
    A0_79:say(A0_79, 131, 0)
    A0_79:say(A0_79, 133, 0)
    break
  else
  end
  L3_82 = A0_79.finishCliantTalkTurn
  L3_82(A0_79)
  return L2_81
end
function PopulaceTownCryer.tcTalkEvent06_01(A0_83, A1_84)
  local L2_85, L3_86
  L3_86 = A0_83
  L2_85 = A0_83.startCliantTalkTurn
  L2_85(L3_86, 2, A1_84)
  L3_86 = A0_83
  L2_85 = A0_83.say
  L2_85(L3_86, A0_83, 135, 0)
  L3_86 = A0_83
  L2_85 = A0_83.askExtendWidget
  L2_85 = L2_85(L3_86, A0_83, 119, 3, 1, 1)
  L3_86 = L2_85
  if L3_86 == 1 then
    A0_83:say(A0_83, 136, 0)
    A0_83:say(A0_83, 160, 0)
    A0_83:say(A0_83, 137, 0)
    A0_83:say(A0_83, 138, 0)
    A0_83:say(A0_83, 139, 0)
    A0_83:say(A0_83, 140, 0)
    break
  else
  end
  if L3_86 == 2 then
    A0_83:say(A0_83, 141, 0)
    A0_83:say(A0_83, 142, 0)
    A0_83:say(A0_83, 161, 0)
    A0_83:say(A0_83, 143, 0)
    break
  else
  end
  if L3_86 == 3 then
    A0_83:say(A0_83, 144, 0)
    A0_83:say(A0_83, 145, 0)
    break
  else
  end
  L3_86 = A0_83.finishCliantTalkTurn
  L3_86(A0_83)
  return L2_85
end
function PopulaceTownCryer.tcTalkEvent06_02(A0_87, A1_88)
  local L2_89, L3_90
  L3_90 = A0_87
  L2_89 = A0_87.startCliantTalkTurn
  L2_89(L3_90, 2, A1_88)
  L3_90 = A0_87
  L2_89 = A0_87.say
  L2_89(L3_90, A0_87, 135, 0)
  L3_90 = A0_87
  L2_89 = A0_87.askExtendWidget
  L2_89 = L2_89(L3_90, A0_87, 119, 3, 1, 1)
  L3_90 = L2_89
  if L3_90 == 1 then
    A0_87:say(A0_87, 136, 0)
    A0_87:say(A0_87, 160, 0)
    A0_87:say(A0_87, 137, 0)
    A0_87:say(A0_87, 138, 0)
    A0_87:say(A0_87, 139, 0)
    A0_87:say(A0_87, 140, 0)
    break
  else
  end
  if L3_90 == 2 then
    A0_87:say(A0_87, 141, 0)
    A0_87:say(A0_87, 142, 0)
    A0_87:say(A0_87, 161, 0)
    A0_87:say(A0_87, 143, 0)
    break
  else
  end
  if L3_90 == 3 then
    A0_87:say(A0_87, 144, 0)
    A0_87:say(A0_87, 146, 0)
    break
  else
  end
  L3_90 = A0_87.finishCliantTalkTurn
  L3_90(A0_87)
  return L2_89
end
function PopulaceTownCryer.tcTalkEvent07_01(A0_91, A1_92)
  local L2_93, L3_94
  L3_94 = A0_91
  L2_93 = A0_91.startCliantTalkTurn
  L2_93(L3_94, 2, A1_92)
  L3_94 = A0_91
  L2_93 = A0_91.say
  L2_93(L3_94, A0_91, 148, 0)
  L3_94 = A0_91
  L2_93 = A0_91.askExtendWidget
  L2_93 = L2_93(L3_94, A0_91, 119, 3, 1, 1)
  L3_94 = L2_93
  if L3_94 == 1 then
    A0_91:say(A0_91, 149, 0)
    A0_91:say(A0_91, 150, 0)
    A0_91:say(A0_91, 151, 0)
    A0_91:say(A0_91, 152, 0)
    A0_91:say(A0_91, 153, 0)
    break
  else
  end
  if L3_94 == 2 then
    A0_91:say(A0_91, 154, 0)
    A0_91:say(A0_91, 155, 0)
    A0_91:say(A0_91, 162, 0)
    A0_91:say(A0_91, 156, 0)
    break
  else
  end
  if L3_94 == 3 then
    A0_91:say(A0_91, 157, 0)
    A0_91:say(A0_91, 158, 0)
    break
  else
  end
  L3_94 = A0_91.finishCliantTalkTurn
  L3_94(A0_91)
  return L2_93
end
function PopulaceTownCryer.tcTalkEvent07_02(A0_95, A1_96)
  local L2_97, L3_98
  L3_98 = A0_95
  L2_97 = A0_95.startCliantTalkTurn
  L2_97(L3_98, 2, A1_96)
  L3_98 = A0_95
  L2_97 = A0_95.say
  L2_97(L3_98, A0_95, 148, 0)
  L3_98 = A0_95
  L2_97 = A0_95.askExtendWidget
  L2_97 = L2_97(L3_98, A0_95, 119, 3, 1, 1)
  L3_98 = L2_97
  if L3_98 == 1 then
    A0_95:say(A0_95, 149, 0)
    A0_95:say(A0_95, 150, 0)
    A0_95:say(A0_95, 151, 0)
    A0_95:say(A0_95, 152, 0)
    A0_95:say(A0_95, 153, 0)
    break
  else
  end
  if L3_98 == 2 then
    A0_95:say(A0_95, 154, 0)
    A0_95:say(A0_95, 155, 0)
    A0_95:say(A0_95, 162, 0)
    A0_95:say(A0_95, 156, 0)
    break
  else
  end
  if L3_98 == 3 then
    A0_95:say(A0_95, 157, 0)
    A0_95:say(A0_95, 159, 0)
    break
  else
  end
  L3_98 = A0_95.finishCliantTalkTurn
  L3_98(A0_95)
  return L2_97
end
