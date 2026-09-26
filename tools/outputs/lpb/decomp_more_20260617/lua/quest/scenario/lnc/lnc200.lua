require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Lnc200", "ScenarioBaseClass")
function Lnc200.initText(A0_0)
  A0_0:_loadTextDataPermanently(455, "lnc200")
end
function Lnc200.processEventWilleldaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 61, 2) == 1 then
    A2_3:say(A0_1, 3, 0)
    A2_3:say(A0_1, 4, 0)
    A2_3:say(A0_1, 5, 0)
    A2_3:say(A0_1, 6, 0)
    A2_3:say(A0_1, 7, 0)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 10, 0)
    else
      A2_3:say(A0_1, 8, 0)
      A2_3:say(A0_1, 9, 0)
    end
    A2_3:finishCliantTalkTurn()
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 68, 0)
  end
  A2_3:finishCliantTalkTurn()
end
function Lnc200.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("lnc20010", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Lnc200.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("lnc20020", 1)
  A0_7:startFadeInCutSceneAfterWarp(A1_8)
end
function Lnc200.processEvent030(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("lnc20030", 1)
  A0_10:startFadeInCutSceneDefault(A1_11)
end
function Lnc200.processEvent040(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 32, 0)
  A2_15:say(A0_13, 33, 0)
  A2_15:say(A0_13, 34, 0)
  A2_15:finishCliantTalkTurn()
end
function Lnc200.processEvent005_2(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 38, 0)
  A2_18:say(A0_16, 39, 0)
  A2_18:finishCliantTalkTurn()
end
function Lnc200.processEvent005_3(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 19, 0)
  A2_21:say(A0_19, 40, 0)
  A2_21:finishCliantTalkTurn()
end
function Lnc200.processEvent005_4(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 23, 0)
  A2_24:finishCliantTalkTurn()
end
function Lnc200.processEvent005_5(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 22, 0)
  A2_27:finishCliantTalkTurn()
end
function Lnc200.processEvent005_6(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 20, 0)
  A2_30:say(A0_28, 43, 0)
  A2_30:finishCliantTalkTurn()
end
function Lnc200.processEvent005_7(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 17, 0)
  A2_33:say(A0_31, 18, 0)
  A2_33:finishCliantTalkTurn()
end
function Lnc200.processEvent005_8(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 21, 0)
  A2_36:say(A0_34, 44, 0)
  A2_36:finishCliantTalkTurn()
end
function Lnc200.processEvent010_2(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 41, 0)
  A2_39:say(A0_37, 42, 0)
  A2_39:finishCliantTalkTurn()
end
function Lnc200.processEvent010_6(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 45, 0)
  A2_42:say(A0_40, 46, 0)
  A2_42:finishCliantTalkTurn()
end
function Lnc200.processEvent010_7(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 47, 0)
  A2_45:say(A0_43, 48, 0)
  A2_45:finishCliantTalkTurn()
end
function Lnc200.processEvent010_8(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 64, 0)
  A2_48:finishCliantTalkTurn()
end
function Lnc200.processEvent020_2(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:say(A0_49, 25, 0)
  A2_51:finishCliantTalkTurn()
end
function Lnc200.processEvent020_3(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:say(A0_52, 49, 0)
  A2_54:say(A0_52, 50, 0)
  A2_54:finishCliantTalkTurn()
end
function Lnc200.processEvent020_4(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 51, 0)
  A2_57:say(A0_55, 52, 0)
  A2_57:finishCliantTalkTurn()
end
function Lnc200.processEvent020_5(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  A2_60:say(A0_58, 53, 0)
  A2_60:say(A0_58, 54, 0)
  A2_60:finishCliantTalkTurn()
end
function Lnc200.processEvent020_6(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(2, A1_62)
  A2_63:say(A0_61, 67, 0)
  A2_63:finishCliantTalkTurn()
end
function Lnc200.processEvent020_7(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:say(A0_64, 55, 0)
  A2_66:finishCliantTalkTurn()
end
function Lnc200.processEvent030_3(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:say(A0_67, 65, 0)
  A2_69:say(A0_67, 66, 0)
  A2_69:finishCliantTalkTurn()
end
