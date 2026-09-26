require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Thm200", "ScenarioBaseClass")
function Thm200.initText(A0_0)
  A0_0:_loadTextDataPermanently(549, "thm200")
end
function Thm200.processEventYayakeStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  if A2_3:ask(A0_1, 40, 2) == 1 then
    A0_1:startFadeOutCutSceneDefault(A1_2)
    if A0_1:startNQCutScene("thm20010", 2) == 1 then
      A0_1:startFadeInCutSceneDefault(A1_2)
    else
      A0_1:startFadeInCutSceneDefault(A1_2)
    end
    return (A0_1:startNQCutScene("thm20010", 2))
  else
    A2_3:say(A0_1, 71, 0)
  end
  A2_3:finishCliantTalkTurn()
end
function Thm200.processEvent020(A0_4, A1_5, A2_6)
  A0_4:startFadeOutCutSceneDefault(A1_5)
  A0_4:startNQCutScene("thm20020", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Thm200.processEvent030(A0_7, A1_8, A2_9)
  A0_7:startFadeOutCutSceneDefault(A1_8)
  A0_7:startNQCutScene("thm20030", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Thm200.processEvent010_2(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:say(A0_10, 43, 0)
  A2_12:say(A0_10, 44, 0)
  A2_12:finishCliantTalkTurn()
end
function Thm200.processEvent010_3(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 45, 0)
  A2_15:say(A0_13, 46, 0)
  A2_15:finishCliantTalkTurn()
end
function Thm200.processEvent010_4(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 47, 0)
  A2_18:say(A0_16, 48, 0)
  A2_18:finishCliantTalkTurn()
end
function Thm200.processEvent010_5(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:say(A0_19, 49, 0)
  A2_21:say(A0_19, 50, 0)
  A2_21:finishCliantTalkTurn()
end
function Thm200.processEvent010_6(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 51, 0)
  A2_24:say(A0_22, 52, 0)
  A2_24:finishCliantTalkTurn()
end
function Thm200.processEvent010_7(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 53, 0)
  A2_27:say(A0_25, 54, 0)
  A2_27:finishCliantTalkTurn()
end
function Thm200.processEvent020_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:say(A0_28, 22, 0)
  A2_30:say(A0_28, 55, 0)
  A2_30:say(A0_28, 66, 0)
  A2_30:finishCliantTalkTurn()
end
function Thm200.processEvent020_3(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:say(A0_31, 21, 0)
  A2_33:say(A0_31, 67, 0)
  A2_33:finishCliantTalkTurn()
end
function Thm200.processEvent020_4(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:say(A0_34, 56, 0)
  A2_36:say(A0_34, 57, 0)
  A2_36:finishCliantTalkTurn()
end
function Thm200.processEvent020_5(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 58, 0)
  A2_39:say(A0_37, 59, 0)
  A2_39:finishCliantTalkTurn()
end
function Thm200.processEvent020_6(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:say(A0_40, 60, 0)
  A2_42:say(A0_40, 61, 0)
  A2_42:finishCliantTalkTurn()
end
function Thm200.processEvent020_7(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:say(A0_43, 62, 0)
  A2_45:say(A0_43, 63, 0)
  A2_45:finishCliantTalkTurn()
end
function Thm200.processEvent020_8(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:say(A0_46, 64, 0)
  A2_48:say(A0_46, 65, 0)
  A2_48:finishCliantTalkTurn()
end
