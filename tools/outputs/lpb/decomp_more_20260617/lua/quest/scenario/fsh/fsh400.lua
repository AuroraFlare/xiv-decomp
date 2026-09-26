require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Fsh400", "ScenarioBaseClass")
function Fsh400.initText(A0_0)
  A0_0:_loadTextDataPermanently(139, "fsh400")
end
function Fsh400.processEventNnmulikaStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(1, A1_2)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 50, 0)
  A2_3:say(A0_1, 5, 0)
  if A2_3:ask(A0_1, 6, 2) == 1 then
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A2_3:ask(A0_1, 6, 2))
end
function Fsh400.processEvent005_2(A0_4, A1_5, A2_6)
  A2_6:say(A0_4, 51, 0)
end
function Fsh400.processEvent005_3(A0_7, A1_8, A2_9)
  A2_9:say(A0_7, 52, 0)
end
function Fsh400.processEvent005_4(A0_10, A1_11, A2_12)
  A2_12:say(A0_10, 53, 0)
  A2_12:say(A0_10, 54, 0)
end
function Fsh400.processEvent005_5(A0_13, A1_14, A2_15)
  A2_15:say(A0_13, 55, 0)
end
function Fsh400.processEvent005_6(A0_16, A1_17, A2_18)
  A2_18:say(A0_16, 56, 0)
end
function Fsh400.processEvent005_7(A0_19, A1_20, A2_21)
  A2_21:say(A0_19, 57, 0)
end
function Fsh400.processEvent005_8(A0_22, A1_23, A2_24)
  A2_24:say(A0_22, 58, 0)
  A2_24:say(A0_22, 59, 0)
end
function Fsh400.processEvent005_9(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 60, 0)
  A2_27:say(A0_25, 61, 0)
end
function Fsh400.processEvent005_10(A0_28, A1_29, A2_30)
  A2_30:say(A0_28, 76, 0)
  A2_30:say(A0_28, 62, 0)
end
function Fsh400.processEvent010(A0_31, A1_32, A2_33)
  A0_31:startNQCutScene("fsh40010", 1)
  A0_31:startFadeInCutSceneDefault(A1_32)
end
function Fsh400.processEvent020(A0_34, A1_35, A2_36)
  A0_34:startNQCutScene("fsh40020", 1)
  A0_34:startFadeInCutSceneDefault(A1_35)
end
function Fsh400.processEvent030(A0_37, A1_38, A2_39)
  A0_37:startNQCutScene("fsh40030", 1)
  A0_37:startFadeInCutSceneDefault(A1_38)
end
function Fsh400.processEvent040(A0_40, A1_41, A2_42)
  A0_40:startNQCutScene("fsh40040", 1)
  A0_40:startFadeInCutSceneDefault(A1_41)
end
function Fsh400.processEvent050(A0_43, A1_44, A2_45)
  A0_43:startNQCutScene("fsh40050", 1)
  A0_43:startFadeInCutSceneDefault(A1_44)
end
function Fsh400.processEvent060(A0_46, A1_47, A2_48)
  A0_46:startNQCutScene("fsh40060", 1)
  A0_46:startFadeInCutSceneDefault(A1_47)
end
function Fsh400.processEvent065(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(1, A1_50)
  A2_51:finishCliantTalkTurn()
end
function Fsh400.processEvent070(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(1, A1_53)
  A2_54:finishCliantTalkTurn()
end
