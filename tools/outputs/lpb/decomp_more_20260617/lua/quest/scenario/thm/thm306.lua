require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Thm306", "ScenarioBaseClass")
function Thm306.initText(A0_0)
  A0_0:_loadTextDataPermanently(557, "thm306")
end
function Thm306.processEventYayakeStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A0_1:startFadeOutCutSceneDefault(A1_2)
  if A0_1:startNQCutScene("thm30610", 2) == 1 then
    A0_1:startFadeInCutSceneDefault(A1_2)
  else
    A0_1:startFadeInCutSceneDefault(A1_2)
  end
  return (A0_1:startNQCutScene("thm30610", 2))
end
function Thm306.processEvent020(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("thm30620", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Thm306.processEvent030(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("thm30630", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Thm306.processEvent035(A0_10, A1_11, A2_12)
  if worldMaster:ask(A0_10, worldMaster, 51030, 2) == 1 then
    A0_10:runCharaSchedulerPastAreaIn(A1_11)
  else
  end
  return (worldMaster:ask(A0_10, worldMaster, 51030, 2))
end
function Thm306.processEvent040(A0_13, A1_14, A2_15)
  A0_13:startFadeOutCutSceneDefault(A1_14)
  A0_13:startNQCutScene("thm30640", 1)
  A0_13:startFadeInCutSceneAfterWarp(A1_14)
end
function Thm306.processEvent050(A0_16, A1_17, A2_18)
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startNQCutScene("thm30650", 1)
  A0_16:startFadeInCutSceneAfterWarp(A1_17)
end
function Thm306.processEvent060(A0_19, A1_20, A2_21)
  A0_19:startFadeOutCutSceneDefault(A1_20)
  A0_19:startNQCutScene("thm30660", 1)
  A0_19:startFadeInCutSceneDefault(A1_20)
end
function Thm306.processEvent010_2(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 12, 0)
  A2_24:say(A0_22, 61, 0)
  A2_24:say(A0_22, 13, 0)
  A2_24:finishCliantTalkTurn()
end
function Thm306.processEvent010_3(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 22, 0)
  A2_27:say(A0_25, 23, 0)
  A2_27:finishCliantTalkTurn()
end
function Thm306.processEvent010_4(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 24, 0)
  A2_30:say(A0_28, 63, 0)
  A2_30:finishCliantTalkTurn()
end
function Thm306.processEvent010_5(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 27, 0)
  A2_33:say(A0_31, 64, 0)
  A2_33:finishCliantTalkTurn()
end
function Thm306.processEvent010_6(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 26, 0)
  A2_36:say(A0_34, 65, 0)
  A2_36:finishCliantTalkTurn()
end
function Thm306.processEvent010_7(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 66, 0)
  A2_39:say(A0_37, 67, 0)
  A2_39:finishCliantTalkTurn()
end
function Thm306.processEvent020_2(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 20, 0)
  A2_42:say(A0_40, 21, 0)
  A2_42:finishCliantTalkTurn()
end
function Thm306.processEvent020_3(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 68, 0)
  A2_45:say(A0_43, 69, 0)
  A2_45:finishCliantTalkTurn()
end
function Thm306.processEvent040_2(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 73, 0)
  A2_48:say(A0_46, 74, 0)
  A2_48:finishCliantTalkTurn()
end
function Thm306.processEvent040_3(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 75, 0)
  A2_51:say(A0_49, 76, 0)
  A2_51:finishCliantTalkTurn()
end
function Thm306.processEvent050_2(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 77, 0)
  A2_54:say(A0_52, 78, 0)
  A2_54:finishCliantTalkTurn()
end
function Thm306.processEvent050_3(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 79, 0)
  A2_57:say(A0_55, 80, 0)
  A2_57:finishCliantTalkTurn()
end
function Thm306.processEvent050_4(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 81, 0)
  A2_60:say(A0_58, 82, 0)
  A2_60:finishCliantTalkTurn()
end
function Thm306.processEvent050_5(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 83, 0)
  A2_63:say(A0_61, 84, 0)
  A2_63:finishCliantTalkTurn()
end
function Thm306.processEvent050_6(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 85, 0)
  A2_66:say(A0_64, 86, 0)
  A2_66:finishCliantTalkTurn()
end
function Thm306.processEvent050_7(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 87, 0)
  A2_69:say(A0_67, 88, 0)
  A2_69:finishCliantTalkTurn()
end
