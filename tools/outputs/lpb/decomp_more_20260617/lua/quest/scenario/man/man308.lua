require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man308", "ScenarioBaseClass")
function Man308.initText(A0_0)
  A0_0:_loadTextDataPermanently(1609, "man308")
end
function Man308.pES(A0_1, A1_2, A2_3, A3_4, A4_5, A5_6, A6_7, A7_8)
  A2_3:startCliantTalkTurn(1, A1_2)
  if A5_6 == 1 then
    A2_3:say(A0_1, 330, 0)
    A2_3:say(A0_1, 339, 0)
    A2_3:say(A0_1, 348, 0)
    break
  else
  end
  if A5_6 == 2 then
    A2_3:say(A0_1, 331, 0)
    A2_3:say(A0_1, 340, 0)
    A2_3:say(A0_1, 349, 0)
    break
  else
  end
  if A5_6 == 3 then
    A2_3:say(A0_1, 332, 0)
    A2_3:say(A0_1, 341, 0)
    A2_3:say(A0_1, 350, 0)
    break
  else
  end
  if A5_6 == 4 then
    A2_3:say(A0_1, 333, 0)
    A2_3:say(A0_1, 342, 0)
    A2_3:say(A0_1, 351, 0)
    break
  else
  end
  if A5_6 == 5 then
    A2_3:say(A0_1, 334, 0)
    A2_3:say(A0_1, 343, 0)
    A2_3:say(A0_1, 352, 0)
    break
  else
  end
  if A5_6 == 6 then
    A2_3:say(A0_1, 335, 0)
    A2_3:say(A0_1, 344, 0)
    A2_3:say(A0_1, 353, 0)
    break
  else
  end
  if A5_6 == 7 then
    A2_3:say(A0_1, 337, 0)
    A2_3:say(A0_1, 346, 0)
    A2_3:say(A0_1, 355, 0)
    break
  else
  end
  if A5_6 == 8 then
    A2_3:say(A0_1, 336, 0)
    A2_3:say(A0_1, 345, 0)
    A2_3:say(A0_1, 354, 0)
    break
  else
  end
  if A5_6 == 9 then
    A2_3:say(A0_1, 338, 0)
    A2_3:say(A0_1, 347, 0)
    A2_3:say(A0_1, 356, 0)
    break
  else
  end
  if A0_1:showQuestInfomation() == 1 then
    if A5_6 == 1 then
      A2_3:say(A0_1, 357, 0)
      A2_3:say(A0_1, 366, 0)
      A2_3:say(A0_1, 375, 0)
      break
    else
    end
    if A5_6 == 2 then
      A2_3:say(A0_1, 358, 0)
      A2_3:say(A0_1, 367, 0)
      A2_3:say(A0_1, 376, 0)
      break
    else
    end
    if A5_6 == 3 then
      A2_3:say(A0_1, 359, 0)
      A2_3:say(A0_1, 368, 0)
      A2_3:say(A0_1, 377, 0)
      break
    else
    end
    if A5_6 == 4 then
      A2_3:say(A0_1, 360, 0)
      A2_3:say(A0_1, 369, 0)
      A2_3:say(A0_1, 378, 0)
      break
    else
    end
    if A5_6 == 5 then
      A2_3:say(A0_1, 361, 0)
      A2_3:say(A0_1, 370, 0)
      A2_3:say(A0_1, 379, 0)
      break
    else
    end
    if A5_6 == 6 then
      A2_3:say(A0_1, 362, 0)
      A2_3:say(A0_1, 371, 0)
      A2_3:say(A0_1, 380, 0)
      break
    else
    end
    if A5_6 == 7 then
      A2_3:say(A0_1, 364, 0)
      A2_3:say(A0_1, 373, 0)
      A2_3:say(A0_1, 382, 0)
      break
    else
    end
    if A5_6 == 8 then
      A2_3:say(A0_1, 363, 0)
      A2_3:say(A0_1, 372, 0)
      A2_3:say(A0_1, 381, 0)
      break
    else
    end
    if A5_6 == 9 then
      A2_3:say(A0_1, 365, 0)
      A2_3:say(A0_1, 374, 0)
      A2_3:say(A0_1, 383, 0)
      break
    else
    end
  else
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Man308.pE00(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14, A6_15, A7_16)
  A2_11:startCliantTalkTurn(1, A1_10)
  if A5_14 == 1 then
    A2_11:say(A0_9, 357, 0)
    A2_11:say(A0_9, 366, 0)
    A2_11:say(A0_9, 375, 0)
    break
  else
  end
  if A5_14 == 2 then
    A2_11:say(A0_9, 358, 0)
    A2_11:say(A0_9, 367, 0)
    A2_11:say(A0_9, 376, 0)
    break
  else
  end
  if A5_14 == 3 then
    A2_11:say(A0_9, 359, 0)
    A2_11:say(A0_9, 368, 0)
    A2_11:say(A0_9, 377, 0)
    break
  else
  end
  if A5_14 == 4 then
    A2_11:say(A0_9, 360, 0)
    A2_11:say(A0_9, 369, 0)
    A2_11:say(A0_9, 378, 0)
    break
  else
  end
  if A5_14 == 5 then
    A2_11:say(A0_9, 361, 0)
    A2_11:say(A0_9, 370, 0)
    A2_11:say(A0_9, 379, 0)
    break
  else
  end
  if A5_14 == 6 then
    A2_11:say(A0_9, 362, 0)
    A2_11:say(A0_9, 371, 0)
    A2_11:say(A0_9, 380, 0)
    break
  else
  end
  if A5_14 == 7 then
    A2_11:say(A0_9, 364, 0)
    A2_11:say(A0_9, 373, 0)
    A2_11:say(A0_9, 382, 0)
    break
  else
  end
  if A5_14 == 8 then
    A2_11:say(A0_9, 363, 0)
    A2_11:say(A0_9, 372, 0)
    A2_11:say(A0_9, 381, 0)
    break
  else
  end
  if A5_14 == 9 then
    A2_11:say(A0_9, 365, 0)
    A2_11:say(A0_9, 374, 0)
    A2_11:say(A0_9, 383, 0)
    break
  else
  end
  A2_11:finishCliantTalkTurn()
end
function Man308.pE01(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22, A6_23, A7_24)
  A4_21 = A0_17:getSnpcActorClassID(A4_21)
  A0_17:startFadeOutCutSceneDefault(A1_18)
  A0_17:startSnpcNQCutScene("man30800", 1, A3_20, A4_21, A5_22, A6_23, A7_24)
  A0_17:startFadeInCutSceneDefault(A1_18)
end
function Man308.pE10(A0_25, A1_26, A2_27, A3_28, A4_29, A5_30, A6_31, A7_32, A8_33)
  A4_29 = A0_25:getSnpcActorClassID(A4_29)
  A0_25:startFadeOutCutSceneDefault(A1_26)
  A0_25:startSnpcNQCutScene("man30810", 1, A3_28, A4_29, A5_30, A6_31, A7_32)
  if A8_33 == true then
    A0_25:startFadeInCutSceneDefault(A1_26)
  else
    A0_25:startFadeInCutSceneAfterWarp(A1_26)
  end
end
function Man308.pE20(A0_34, A1_35, A2_36, A3_37, A4_38, A5_39, A6_40, A7_41)
  A2_36:startCliantTalkTurn(2, A1_35)
  if A5_39 == 1 then
    A2_36:say(A0_34, 624, 0)
    break
  else
  end
  if A5_39 == 2 then
    A2_36:say(A0_34, 625, 0)
    break
  else
  end
  if A5_39 == 3 then
    A2_36:say(A0_34, 626, 0)
    break
  else
  end
  if A5_39 == 4 then
    A2_36:say(A0_34, 627, 0)
    break
  else
  end
  if A5_39 == 5 then
    A2_36:say(A0_34, 628, 0)
    break
  else
  end
  if A5_39 == 6 then
    A2_36:say(A0_34, 629, 0)
    break
  else
  end
  if A5_39 == 7 then
    A2_36:say(A0_34, 631, 0)
    break
  else
  end
  if A5_39 == 8 then
    A2_36:say(A0_34, 630, 0)
    break
  else
  end
  if A5_39 == 9 then
    A2_36:say(A0_34, 632, 0)
    break
  else
  end
  A2_36:finishCliantTalkTurn()
end
function Man308.processEvent020_1(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 20, 0)
  A2_44:finishCliantTalkTurn()
end
function Man308.processEvent020_2(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 21, 0)
  A2_47:finishCliantTalkTurn()
end
function Man308.pE30(A0_48, A1_49, A2_50, A3_51, A4_52, A5_53, A6_54, A7_55)
  A4_52 = A0_48:getSnpcActorClassID(A4_52)
  A0_48:startFadeOutCutSceneDefault(A1_49)
  A0_48:startSnpcNQCutScene("man30830", 1, A3_51, A4_52, A5_53, A6_54, A7_55)
  A0_48:startFadeInCutSceneAfterWarp(A1_49)
end
function Man308.pE50(A0_56, A1_57, A2_58, A3_59, A4_60, A5_61, A6_62, A7_63, A8_64)
  A4_60 = A0_56:getSnpcActorClassID(A4_60)
  A0_56:startFadeOutCutSceneDefault(A1_57)
  A0_56:startSnpcHQCutScene("man40640", 1, A3_59, A4_60, A5_61, A6_62, A7_63)
  A0_56:startSnpcNQCutScene("man30850", 1, A3_59, A4_60, A5_61, A6_62, A7_63)
  if A8_64 == true then
    A0_56:startFadeInCutSceneDefault(A1_57)
  else
    A0_56:startFadeInCutSceneAfterWarp(A1_57)
  end
end
function Man308.pE60(A0_65, A1_66, A2_67, A3_68, A4_69, A5_70, A6_71, A7_72)
  A4_69 = A0_65:getSnpcActorClassID(A4_69)
  A0_65:startFadeOutCutSceneDefault(A1_66)
  A0_65:startSnpcNQCutScene("man30860", 1, A3_68, A4_69, A5_70, A6_71, A7_72)
  A0_65:startFadeInCutSceneDefault(A1_66)
end
function Man308.pE80(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78, A6_79, A7_80)
  A4_77 = A0_73:getSnpcActorClassID(A4_77)
  A0_73:startFadeOutCutSceneDefault(A1_74)
  A0_73:startSnpcNQCutScene("man30880", 1, A3_76, A4_77, A5_78, A6_79, A7_80)
  A0_73:startSnpcNQCutScene("man30890", 1, A3_76, A4_77, A5_78, A6_79, A7_80)
  A0_73:startFadeInCutSceneDefault(A1_74)
end
function Man308.processEvent090(A0_81, A1_82, A2_83)
  A0_81:startFadeOutCutSceneDefault(A1_82)
  A0_81:startNQCutScene("man30890", 1)
  A0_81:startFadeInCutSceneDefault(A1_82)
end
function Man308.processEvent090_1(A0_84, A1_85, A2_86)
  A2_86:say(A0_84, 600, 0)
end
function Man308.processEvent090_2(A0_87, A1_88, A2_89)
  A2_89:say(A0_87, 601, 0)
  A2_89:say(A0_87, 602, 0)
end
function Man308.processEvent090_3(A0_90, A1_91, A2_92)
  A2_92:say(A0_90, 603, 0)
  A2_92:say(A0_90, 604, 0)
end
function Man308.processEvent090_4(A0_93, A1_94, A2_95)
  A2_95:say(A0_93, 605, 0)
  A2_95:say(A0_93, 606, 0)
end
function Man308.processEvent090_5(A0_96, A1_97, A2_98)
  A2_98:say(A0_96, 607, 0)
  A2_98:say(A0_96, 608, 0)
end
function Man308.processEvent090_6(A0_99, A1_100, A2_101)
  A2_101:say(A0_99, 620, 0)
end
function Man308.processEvent090_7(A0_102, A1_103, A2_104)
  A2_104:say(A0_102, 621, 0)
end
function Man308.processEvent090_8(A0_105, A1_106, A2_107)
  A2_107:say(A0_105, 622, 0)
end
function Man308.processEvent090_9(A0_108, A1_109, A2_110)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:say(A0_108, 609, 0)
  A2_110:say(A0_108, 610, 0)
  A2_110:finishCliantTalkTurn()
end
function Man308.processEvent090_10(A0_111, A1_112, A2_113)
  A2_113:startCliantTalkTurn(2, A1_112)
  A2_113:say(A0_111, 611, 0)
  A2_113:finishCliantTalkTurn()
end
function Man308.processEvent090_11(A0_114, A1_115, A2_116)
  A2_116:startCliantTalkTurn(2, A1_115)
  A2_116:say(A0_114, 612, 0)
  A2_116:say(A0_114, 613, 0)
  A2_116:finishCliantTalkTurn()
end
function Man308.processEvent090_12(A0_117, A1_118, A2_119)
  A2_119:startCliantTalkTurn(2, A1_118)
  A2_119:say(A0_117, 614, 0)
  A2_119:say(A0_117, 615, 0)
  A2_119:finishCliantTalkTurn()
end
function Man308.processEvent090_13(A0_120, A1_121, A2_122)
  A2_122:startCliantTalkTurn(2, A1_121)
  A2_122:say(A0_120, 616, 0)
  A2_122:say(A0_120, 617, 0)
  A2_122:finishCliantTalkTurn()
end
function Man308.processEvent090_14(A0_123, A1_124, A2_125)
  A2_125:startCliantTalkTurn(2, A1_124)
  A2_125:say(A0_123, 618, 0)
  A2_125:say(A0_123, 619, 0)
  A2_125:finishCliantTalkTurn()
end
function Man308.pE90(A0_126, A1_127, A2_128, A3_129, A4_130, A5_131, A6_132, A7_133)
  A0_126:startFadeOutCutSceneDefault(A1_127)
  A0_126:startSnpcNQCutScene("man30900", 1, A3_129, A4_130, A5_131, A6_132, A7_133)
  A0_126:startFadeInCutSceneAfterWarp(A1_127)
end
