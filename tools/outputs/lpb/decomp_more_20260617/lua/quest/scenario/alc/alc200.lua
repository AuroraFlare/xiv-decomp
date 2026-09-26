require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Alc200", "ScenarioBaseClass")
function Alc200.initText(A0_0)
  A0_0:_loadTextDataPermanently(335, "alc200")
end
function Alc200.processEventNogeloixStart(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = A2_3.startCliantTalkTurn
  L3_4(A2_3, 2, A1_2)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 1, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 2, 0)
  L3_4 = A2_3.say
  L3_4(A2_3, A0_1, 3, 0)
  L3_4 = A2_3.ask
  L3_4 = L3_4(A2_3, A0_1, 51, 2)
  if L3_4 == 1 then
    A0_1:startFadeOutCutSceneDefault(A1_2)
    L3_4 = A0_1:startNQCutScene("alc20010", 2)
    A0_1:startFadeInCutSceneDefault(A1_2)
  else
    A2_3:say(A0_1, 97, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Alc200.processEvent010(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 15, 0)
  A2_7:say(A0_5, 16, 0)
  A2_7:finishCliantTalkTurn()
end
function Alc200.processEvent015(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:say(A0_8, 17, 0)
  A2_10:say(A0_8, 65, 0)
  A2_10:say(A0_8, 18, 0)
  A2_10:say(A0_8, 19, 0)
  A2_10:finishCliantTalkTurn()
end
function Alc200.processEvent020(A0_11, A1_12, A2_13, A3_14)
  local L4_15
  if A3_14 == 3 then
    L4_15 = 1
  else
    L4_15 = 2
  end
  A0_11:startFadeOutCutSceneDefault(A1_12)
  A0_11:startNQCutScene("alc20020", 1, true, L4_15)
  A0_11:startFadeInCutSceneAfterWarp(A1_12)
end
function Alc200.processEvent030(A0_16, A1_17, A2_18, A3_19)
  local L4_20
  if A3_19 == 3 then
    L4_20 = 1
  else
    L4_20 = 2
  end
  A0_16:startFadeOutCutSceneDefault(A1_17)
  A0_16:startNQCutScene("alc20030", 1, true, L4_20)
  A0_16:startFadeInCutSceneDefault(A1_17)
end
function Alc200.processEvent005_2(A0_21, A1_22, A2_23)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:say(A0_21, 54, 0)
  A2_23:say(A0_21, 55, 0)
  A2_23:say(A0_21, 56, 0)
  A2_23:finishCliantTalkTurn()
end
function Alc200.processEvent005_3(A0_24, A1_25, A2_26)
  A2_26:startCliantTalkTurn(2, A1_25)
  A2_26:say(A0_24, 57, 0)
  A2_26:say(A0_24, 58, 0)
  A2_26:finishCliantTalkTurn()
end
function Alc200.processEvent005_4(A0_27, A1_28, A2_29)
  A2_29:startCliantTalkTurn(2, A1_28)
  A2_29:say(A0_27, 59, 0)
  A2_29:say(A0_27, 60, 0)
  A2_29:finishCliantTalkTurn()
end
function Alc200.processEvent005_5(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:say(A0_30, 61, 0)
  A2_32:say(A0_30, 62, 0)
  A2_32:finishCliantTalkTurn()
end
function Alc200.processEvent010_2(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:say(A0_33, 63, 0)
  A2_35:say(A0_33, 64, 0)
  A2_35:finishCliantTalkTurn()
end
function Alc200.processEvent015_2(A0_36, A1_37, A2_38)
  A2_38:startCliantTalkTurn(2, A1_37)
  A2_38:say(A0_36, 66, 0)
  A2_38:say(A0_36, 67, 0)
  A2_38:finishCliantTalkTurn()
end
function Alc200.processEvent015_3(A0_39, A1_40, A2_41)
  A2_41:startCliantTalkTurn(2, A1_40)
  A2_41:say(A0_39, 68, 0)
  A2_41:say(A0_39, 69, 0)
  A2_41:finishCliantTalkTurn()
end
function Alc200.processEvent015_4(A0_42, A1_43, A2_44)
  A2_44:startCliantTalkTurn(2, A1_43)
  A2_44:say(A0_42, 70, 0)
  A2_44:say(A0_42, 71, 0)
  A2_44:finishCliantTalkTurn()
end
function Alc200.processEvent015_5(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  A2_47:say(A0_45, 72, 0)
  A2_47:say(A0_45, 73, 0)
  A2_47:finishCliantTalkTurn()
end
function Alc200.processEvent015_6(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  A2_50:say(A0_48, 20, 0)
  if A2_50:ask(A0_48, 44, 2) == 1 then
  end
  A2_50:finishCliantTalkTurn()
  return (A2_50:ask(A0_48, 44, 2))
end
function Alc200.processEvent020_2(A0_51, A1_52, A2_53, A3_54)
  local L4_55
  if A3_54 == 3 then
    L4_55 = 1
  else
    L4_55 = 2
  end
  A2_53:startCliantTalkTurn(2, A1_52)
  A2_53:say(A0_51, 75, 0, L4_55)
  A2_53:say(A0_51, 76, 0, L4_55)
  A2_53:finishCliantTalkTurn()
end
function Alc200.processEvent020_3(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:say(A0_56, 77, 0)
  A2_58:say(A0_56, 78, 0)
  A2_58:finishCliantTalkTurn()
end
function Alc200.processEvent020_4(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 79, 0)
  A2_61:say(A0_59, 80, 0)
  A2_61:finishCliantTalkTurn()
end
