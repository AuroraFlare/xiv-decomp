require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man2u0", "ScenarioBaseClass")
function Man2u0.initText(A0_0)
  A0_0:_loadTextDataPermanently(1367, "man2u0")
end
function Man2u0.processEventMomodiStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 141, 0)
  A2_3:say(A0_1, 142, 0)
  A2_3:say(A0_1, 143, 0)
  A2_3:finishCliantTalkTurn()
end
function Man2u0.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 144, 0)
  A2_6:say(A0_4, 145, 0)
  A2_6:say(A0_4, 146, 0)
  A2_6:finishCliantTalkTurn()
end
function Man2u0.processEvent005(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("man2u000", 1)
  A0_7:startNQCutScene("man2u010", 1)
  A0_7:startHQCutScene("MAN2U020", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Man2u0.processEvent005_2(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 162, 0)
  A2_12:say(A0_10, 163, 0)
  A2_12:finishCliantTalkTurn()
end
function Man2u0.processEvent005_3(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 171, 0)
  A2_15:finishCliantTalkTurn()
end
function Man2u0.processEvent005_4(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 172, 0)
  A2_18:finishCliantTalkTurn()
end
function Man2u0.processEvent005_5(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 173, 0)
  A2_21:finishCliantTalkTurn()
end
function Man2u0.processEvent005_6(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 174, 0)
  A2_24:finishCliantTalkTurn()
end
function Man2u0.processEvent005_7(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 175, 0)
  A2_27:finishCliantTalkTurn()
end
function Man2u0.processEvent030(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("man2u030", 1)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Man2u0.processEvent030_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 164, 0)
  A2_33:say(A0_31, 165, 0)
  A2_33:say(A0_31, 166, 0)
  A2_33:finishCliantTalkTurn()
end
function Man2u0.processEvent040(A0_34, A1_35, A2_36)
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("man2u040", 1)
  A0_34:startFadeInCutSceneAfterWarp(A1_35)
end
function Man2u0.processEvent040_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 167, 0)
  A2_39:finishCliantTalkTurn()
end
function Man2u0.processEvent040_3(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 168, 0)
  A2_42:finishCliantTalkTurn()
end
function Man2u0.processEvent040_4(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 169, 0)
  A2_45:finishCliantTalkTurn()
end
function Man2u0.processEvent040_5(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 170, 0)
  A2_48:finishCliantTalkTurn()
end
function Man2u0.processEvent050(A0_49, A1_50, A2_51)
  A0_49:startFadeOutCutSceneDefault(A1_50)
  A0_49:startNQCutScene("man2u050", 1)
  A0_49:startFadeInCutSceneAfterWarp(A1_50)
end
function Man2u0.processEvent050_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 153, 0)
  A2_54:finishCliantTalkTurn()
end
function Man2u0.processEvent060(A0_55, A1_56, A2_57)
  A0_55:startFadeOutCutSceneDefault(A1_56)
  A0_55:startNQCutScene("man2u060", 1)
  A0_55:startFadeInCutSceneDefault(A1_56)
end
function Man2u0.processEvent065_2(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 155, 0)
  A2_60:say(A0_58, 156, 0)
  A2_60:say(A0_58, 157, 0)
  A2_60:finishCliantTalkTurn()
end
function Man2u0.processEvent070(A0_61, A1_62, A2_63)
  A0_61:startFadeOutCutSceneDefault(A1_62)
  A0_61:startNQCutScene("man2u070", 1)
  A0_61:startFadeInCutSceneDefault(A1_62)
end
function Man2u0.processEvent070_2(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 158, 0)
  A2_66:say(A0_64, 159, 0)
  A2_66:finishCliantTalkTurn()
end
function Man2u0.processEvent080(A0_67, A1_68, A2_69)
  A0_67:startFadeOutCutSceneDefault(A1_68)
  A0_67:startNQCutScene("man2u080", 1)
  A0_67:startFadeInCutSceneAfterWarp(A1_68)
end
function Man2u0.processEvent085(A0_70, A1_71, A2_72)
  A0_70:startFadeOutCutSceneDefault(A1_71)
  A0_70:startNQCutScene("man2u085", 1)
  A0_70:startHQCutScene("MAN2U090", 1)
  A0_70:startNQCutScene("man2u100", 1)
  A0_70:startNQCutScene("man2u110", 1)
  A0_70:startFadeInCutSceneAfterWarp(A1_71)
end
function Man2u0.processEventSystemMessage(A0_73, A1_74, A2_75, A3_76)
  if A3_76 >= 18 then
    worldMaster:say(A0_73, 179)
  else
    worldMaster:say(A0_73, 180)
  end
end
