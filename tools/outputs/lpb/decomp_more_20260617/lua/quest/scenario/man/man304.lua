require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man304", "ScenarioBaseClass")
function Man304.initText(A0_0)
  A0_0:_loadTextDataPermanently(1596, "man304")
end
function Man304.pES(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8)
  local L8_9
  L8_9 = A0_1.getSnpcActorClassID
  L8_9 = L8_9(A0_1, A4_5)
  A4_5 = L8_9
  L8_9 = A0_1.startFadeOutCutSceneDefault
  L8_9(A0_1, A1_2)
  L8_9 = 0
  if A5_6 == 1 then
    L8_9 = 1
  elseif A5_6 == 2 then
    L8_9 = 1
  elseif A5_6 == 3 then
    L8_9 = 2
  elseif A5_6 == 4 then
    L8_9 = 2
  elseif A5_6 == 5 then
    L8_9 = 3
  elseif A5_6 == 6 then
    L8_9 = 3
  elseif A5_6 == 7 then
    L8_9 = 4
  elseif A5_6 == 8 then
    L8_9 = 5
  elseif A5_6 == 9 then
    L8_9 = 1
  end
  A0_1:startFadeOutCutSceneDefault(A1_2)
  A0_1:startFadeInCutSceneDefault(A1_2)
  return (A0_1:startSnpcNQCutScene("man30400", 2, A3_4, A4_5, A5_6, A6_7, A7_8, L8_9, 5, 10))
end
function Man304.pE10(A0_10, A1_11, A2_12, A3_13, A4_14, A5_15, A6_16, A7_17)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 306, 0)
  A4_14 = A0_10:getSnpcActorClassID(A4_14)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startSnpcNQCutScene("man30410", 1, A3_13, A4_14, A5_15, A6_16, A7_17)
  A0_10:startFadeInCutSceneDefault(A1_11)
end
function Man304.pE20(A0_18, A1_19, A2_20, A3_21, A4_22, A5_23, A6_24, A7_25)
  A4_22 = A0_18:getSnpcActorClassID(A4_22)
  A0_18:startFadeOutCutSceneDefault(A1_19)
  A0_18:startSnpcNQCutScene("man30420", 1, A3_21, A4_22, A5_23, A6_24, A7_25)
  A0_18:startFadeInCutSceneAfterWarp(A1_19)
end
function Man304.pE30(A0_26, A1_27, A2_28, A3_29, A4_30, A5_31, A6_32, A7_33)
  if A5_31 == 1 then
    A2_28:say(A0_26, 369, 0)
    A2_28:say(A0_26, 378, 0)
    break
  else
  end
  if A5_31 == 2 then
    A2_28:say(A0_26, 370, 0)
    A2_28:say(A0_26, 379, 0)
    break
  else
  end
  if A5_31 == 3 then
    A2_28:say(A0_26, 371, 0)
    A2_28:say(A0_26, 380, 0)
    break
  else
  end
  if A5_31 == 4 then
    A2_28:say(A0_26, 372, 0)
    A2_28:say(A0_26, 381, 0)
    break
  else
  end
  if A5_31 == 5 then
    A2_28:say(A0_26, 373, 0)
    A2_28:say(A0_26, 382, 0)
    break
  else
  end
  if A5_31 == 6 then
    A2_28:say(A0_26, 374, 0)
    A2_28:say(A0_26, 383, 0)
    break
  else
  end
  if A5_31 == 7 then
    A2_28:say(A0_26, 376, 0)
    A2_28:say(A0_26, 385, 0)
    break
  else
  end
  if A5_31 == 8 then
    A2_28:say(A0_26, 375, 0)
    A2_28:say(A0_26, 384, 0)
    break
  else
  end
  if A5_31 == 9 then
    A2_28:say(A0_26, 377, 0)
    A2_28:say(A0_26, 386, 0)
    break
  else
  end
  A4_30 = A0_26:getSnpcActorClassID(A4_30)
  A0_26:startFadeOutCutSceneDefault(A1_27)
  A0_26:startSnpcNQCutScene("man30430", 1, A3_29, A4_30, A5_31, A6_32, A7_33)
  A0_26:startFadeInCutSceneAfterWarp(A1_27)
end
function Man304.processEvent000_2(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 469, 0)
  A2_36:finishCliantTalkTurn()
end
function Man304.processEvent000_3(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 470, 0)
  A2_39:finishCliantTalkTurn()
end
function Man304.processEvent000_4(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 471, 0)
  A2_42:finishCliantTalkTurn()
end
function Man304.processEvent000_5(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 472, 0)
  A2_45:finishCliantTalkTurn()
end
function Man304.processEvent000_6(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 473, 0)
  A2_48:finishCliantTalkTurn()
end
function Man304.processEvent000_7(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 474, 0)
  A2_51:finishCliantTalkTurn()
end
function Man304.processEvent000_8(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 475, 0)
  A2_54:finishCliantTalkTurn()
end
function Man304.processEvent000_9(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 476, 0)
  A2_57:finishCliantTalkTurn()
end
function Man304.processEvent000_10(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 477, 0)
  A2_60:finishCliantTalkTurn()
end
function Man304.processEvent000_11(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 478, 0)
  A2_63:finishCliantTalkTurn()
end
function Man304.processEvent000_12(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 479, 0)
  A2_66:finishCliantTalkTurn()
end
function Man304.processEvent000_13(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 480, 0)
  A2_69:finishCliantTalkTurn()
end
function Man304.processEvent000_20(A0_70, A1_71, A2_72)
  if A2_72:ask(A0_70, 490, 2) == 1 then
  end
  return (A2_72:ask(A0_70, 490, 2))
end
function Man304.processEvent000_21(A0_73, A1_74, A2_75)
end
function Man304.processEvent000_22(A0_76, A1_77, A2_78, A3_79)
  worldMaster:tell(A1_77, worldMaster, A0_76, 494, A3_79, A3_79)
end
function Man304.processEvent001_2(A0_80, A1_81, A2_82)
  A2_82:startCliantTalkTurn(2, A1_81)
  A2_82:say(A0_80, 304, 0)
  A2_82:finishCliantTalkTurn()
end
function Man304.processEvent001_3(A0_83, A1_84, A2_85, A3_86)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:say(A0_83, 481, 0)
  A2_85:say(A0_83, 482, 0, A3_86, A3_86)
  A2_85:finishCliantTalkTurn()
end
function Man304.processEvent001_4(A0_87, A1_88, A2_89)
  A2_89:startCliantTalkTurn(2, A1_88)
  A2_89:say(A0_87, 483, 0)
  A2_89:say(A0_87, 484, 0)
  A2_89:finishCliantTalkTurn()
end
function Man304.processEvent001_5(A0_90, A1_91, A2_92)
  A2_92:startCliantTalkTurn(2, A1_91)
  A2_92:say(A0_90, 485, 0)
  A2_92:say(A0_90, 486, 0)
  A2_92:finishCliantTalkTurn()
end
function Man304.processEvent001_6(A0_93, A1_94, A2_95, A3_96)
  A2_95:startCliantTalkTurn(2, A1_94)
  A2_95:say(A0_93, 487, 0)
  A2_95:say(A0_93, 488, 0, A3_96, A3_96)
  A2_95:finishCliantTalkTurn()
end
function Man304.processEvent005_1(A0_97, A1_98, A2_99)
  A2_99:startCliantTalkTurn(2, A1_98)
  A2_99:say(A0_97, 505, 0)
  A2_99:finishCliantTalkTurn()
end
function Man304.processEvent005_2(A0_100, A1_101, A2_102)
  A2_102:startCliantTalkTurn(2, A1_101)
  A2_102:say(A0_100, 504, 0)
  A2_102:finishCliantTalkTurn()
end
function Man304.processEvent010_2(A0_103, A1_104, A2_105)
  A2_105:startCliantTalkTurn(2, A1_104)
  A2_105:say(A0_103, 459, 0)
  A2_105:say(A0_103, 460, 0)
  A2_105:finishCliantTalkTurn()
end
function Man304.processEvent010_3(A0_106, A1_107, A2_108)
  A2_108:startCliantTalkTurn(2, A1_107)
  A2_108:say(A0_106, 461, 0)
  A2_108:finishCliantTalkTurn()
end
function Man304.processEvent010_4(A0_109, A1_110, A2_111)
  A2_111:startCliantTalkTurn(2, A1_110)
  A2_111:say(A0_109, 462, 0)
  A2_111:finishCliantTalkTurn()
end
function Man304.processEvent010_5(A0_112, A1_113, A2_114)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:say(A0_112, 463, 0)
  A2_114:say(A0_112, 464, 0)
  A2_114:finishCliantTalkTurn()
end
function Man304.processEvent010_6(A0_115, A1_116, A2_117)
  A2_117:startCliantTalkTurn(2, A1_116)
  A2_117:say(A0_115, 465, 0)
  A2_117:finishCliantTalkTurn()
end
function Man304.processEvent010_7(A0_118, A1_119, A2_120)
  A2_120:startCliantTalkTurn(2, A1_119)
  A2_120:say(A0_118, 466, 0)
  A2_120:say(A0_118, 467, 0)
  A2_120:finishCliantTalkTurn()
end
function Man304.processEvent010_8(A0_121, A1_122, A2_123)
  A2_123:startCliantTalkTurn(2, A1_122)
  A2_123:say(A0_121, 468, 0)
  A2_123:finishCliantTalkTurn()
end
