require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Cul400", "ScenarioBaseClass")
function Cul400.initText(A0_0)
  A0_0:_loadTextDataPermanently(257, "cul400")
end
function Cul400.processEventCharlysStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  if A2_3:ask(A0_1, 103, 2) == 1 then
    A2_3:say(A0_1, 7, 0)
  else
    A2_3:say(A0_1, 6, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A2_3:ask(A0_1, 103, 2))
end
function Cul400.processEvent010(A0_4, A1_5, A2_6)
  A0_4:startNQCutScene("cul40010", 1)
  A0_4:startFadeInCutSceneDefault(A1_5)
end
function Cul400.processEvent020(A0_7, A1_8, A2_9)
  A0_7:startNQCutScene("cul40020", 1)
  A0_7:startFadeInCutSceneDefault(A1_8)
end
function Cul400.processEvent025(A0_10, A1_11, A2_12)
  A0_10:startNQCutScene("cul40025", 1)
  A0_10:startFadeInCutSceneDefault(A1_11)
end
function Cul400.processEvent028(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(1, A1_14)
  A2_15:say(A0_13, 67, 0)
  A2_15:say(A0_13, 68, 0)
  A2_15:finishCliantTalkTurn()
end
function Cul400.processEvent030(A0_16, A1_17, A2_18)
  A0_16:startNQCutScene("cul40030", 1)
  A0_16:startFadeInCutSceneDefault(A1_17)
end
function Cul400.processEvent005_2(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(1, A1_20)
  A2_21:say(A0_19, 109, 0)
  A2_21:say(A0_19, 110, 0)
  A2_21:finishCliantTalkTurn()
end
function Cul400.processEvent005_3(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(1, A1_23)
  A2_24:say(A0_22, 13, 0)
  A2_24:say(A0_22, 14, 0)
  A2_24:finishCliantTalkTurn()
end
function Cul400.processEvent005_4(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 15, 0)
end
function Cul400.processEvent005_5(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(1, A1_29)
  A2_30:say(A0_28, 16, 0)
  A2_30:finishCliantTalkTurn()
end
function Cul400.processEvent005_6(A0_31, A1_32, A2_33)
  A2_33:say(A0_31, 17, 0)
end
function Cul400.processEvent005_7(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(1, A1_35)
  A2_36:say(A0_34, 18, 0)
  A2_36:finishCliantTalkTurn()
end
function Cul400.processEvent005_8(A0_37, A1_38, A2_39)
  A2_39:say(A0_37, 111, 0)
end
function Cul400.processEvent005_9(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(1, A1_41)
  A2_42:say(A0_40, 19, 0)
  A2_42:say(A0_40, 20, 0)
  A2_42:finishCliantTalkTurn()
end
function Cul400.processEvent005_10(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(1, A1_44)
  A2_45:say(A0_43, 21, 0)
  A2_45:finishCliantTalkTurn()
end
function Cul400.processEvent005_11(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(1, A1_47)
  A2_48:say(A0_46, 22, 0)
  A2_48:say(A0_46, 116, 0)
  A2_48:finishCliantTalkTurn()
end
function Cul400.processEvent010_2(A0_49, A1_50, A2_51)
  A2_51:say(A0_49, 33, 0)
end
function Cul400.processEvent010_3(A0_52, A1_53, A2_54)
  A2_54:say(A0_52, 34, 0)
end
function Cul400.processEvent010_4(A0_55, A1_56, A2_57)
  A2_57:say(A0_55, 35, 0)
end
function Cul400.processEvent010_5(A0_58, A1_59, A2_60)
  A2_60:say(A0_58, 36, 0)
end
function Cul400.processEvent020_2(A0_61, A1_62, A2_63)
  A2_63:startCliantTalkTurn(1, A1_62)
  A2_63:say(A0_61, 112, 0)
  A2_63:say(A0_61, 113, 0)
  A2_63:finishCliantTalkTurn()
end
