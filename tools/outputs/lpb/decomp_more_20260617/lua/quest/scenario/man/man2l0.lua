require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Man2l0", "ScenarioBaseClass")
function Man2l0.initText(A0_0)
  A0_0:_loadTextDataPermanently(23, "man2l0")
end
function Man2l0.processEventquestmanOffer(A0_1, A1_2, A2_3)
end
function Man2l0.processEvent000(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:say(A0_4, 1, 0)
  A2_6:say(A0_4, 118, 0)
  A2_6:say(A0_4, 2, 0)
  A2_6:finishCliantTalkTurn()
end
function Man2l0.processEvent000_2(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:say(A0_7, 119, 0)
  A2_9:say(A0_7, 120, 0)
  A2_9:say(A0_7, 121, 0)
  A2_9:finishCliantTalkTurn()
end
function Man2l0.processEvent010(A0_10, A1_11, A2_12)
  A0_10:startFadeOutCutSceneDefault(A1_11)
  A0_10:startNQCutScene("man2l010", 1)
  A0_10:startNQCutScene("man2l011", 1)
  A0_10:startFadeInCutSceneAfterWarp(A1_11)
end
function Man2l0.processEvent010_2(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:say(A0_13, 122, 0)
  A2_15:say(A0_13, 123, 0)
  if A2_15:ask(A0_13, 144, 2) == 1 then
  else
  end
  A2_15:finishCliantTalkTurn()
  return (A2_15:ask(A0_13, 144, 2))
end
function Man2l0.processEvent010_3(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:say(A0_16, 132, 0)
  A2_18:say(A0_16, 133, 0)
  A2_18:finishCliantTalkTurn()
end
function Man2l0.processEvent011_2(A0_19, A1_20, A2_21)
  A2_21:say(A0_19, 8, 0)
  A2_21:say(A0_19, 9, 0)
  if A2_21:ask(A0_19, 141, 2) == 1 then
  else
  end
  return (A2_21:ask(A0_19, 141, 2))
end
function Man2l0.processEvent011_3(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:say(A0_22, 124, 0)
  A2_24:finishCliantTalkTurn()
end
function Man2l0.processEvent011_4(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 125, 0)
  A2_27:finishCliantTalkTurn()
end
function Man2l0.processEvent012(A0_28, A1_29, A2_30)
  A0_28:startFadeOutCutSceneDefault(A1_29)
  A0_28:startNQCutScene("man2l012", 1)
  A0_28:startFadeInCutSceneAfterWarp(A1_29)
end
function Man2l0.processEvent013(A0_31, A1_32, A2_33)
  A0_31:startFadeOutCutSceneDefault(A1_32)
  A0_31:startNQCutScene("man2l013", 1)
  A0_31:startFadeInCutSceneAfterWarp(A1_32)
end
function Man2l0.processEvent020(A0_34, A1_35, A2_36, A3_37)
  A0_34:startFadeOutCutSceneDefault(A1_35)
  A0_34:startNQCutScene("man2l020", 1, true, A3_37)
  A0_34:startHQCutScene("MAN2L030", 1)
  A0_34:startNQCutScene("man2l040", 1)
  A0_34:startFadeInCutSceneAfterWarp(A1_35)
end
function Man2l0.processEvent030(A0_38, A1_39, A2_40)
  A0_38:startFadeOutCutSceneDefault(A1_39)
  A0_38:startFadeInCutSceneDefault(A1_39)
end
function Man2l0.processEvent050(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 129, 0)
  A2_43:say(A0_41, 130, 0)
  A2_43:finishCliantTalkTurn()
end
function Man2l0.processEvent050_2(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:say(A0_44, 129, 0)
  A2_46:say(A0_44, 130, 0)
  A2_46:finishCliantTalkTurn()
end
function Man2l0.processEvent060(A0_47, A1_48, A2_49)
  A0_47:startFadeOutCutSceneDefault(A1_48)
  A0_47:startNQCutScene("man2l060", 1)
  A0_47:startFadeInCutSceneDefault(A1_48)
end
function Man2l0.processEvent060_2(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:say(A0_50, 136, 0)
  A2_52:say(A0_50, 137, 0)
  A2_52:say(A0_50, 138, 0)
  A2_52:finishCliantTalkTurn()
end
function Man2l0.processEvent070(A0_53, A1_54, A2_55)
  A0_53:startFadeOutCutSceneDefault(A1_54)
  A0_53:startNQCutScene("man2l070", 1)
  A0_53:startFadeInCutSceneDefault(A1_54)
end
function Man2l0.processEvent075(A0_56, A1_57, A2_58)
  A0_56:startNQCutScene("man2l075", 1)
  A0_56:startFadeInCutSceneDefault(A1_57)
end
function Man2l0.processEvent075_2(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:say(A0_59, 67, 0)
  A2_61:say(A0_59, 116, 0)
  A2_61:finishCliantTalkTurn()
end
function Man2l0.processEvent075_3(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:say(A0_62, 139, 0)
  A2_64:say(A0_62, 140, 0)
  A2_64:finishCliantTalkTurn()
end
function Man2l0.processEvent080(A0_65, A1_66, A2_67)
  A0_65:startFadeOutCutSceneDefault(A1_66)
  A0_65:startNQCutScene("man2l080", 1)
  A0_65:startFadeInCutSceneDefault(A1_66)
end
function Man2l0.processEvent080_2(A0_68, A1_69, A2_70)
  A2_70:startCliantTalkTurn(2, A1_69)
  A2_70:say(A0_68, 114, 0)
  A2_70:say(A0_68, 115, 0)
  A2_70:finishCliantTalkTurn()
end
function Man2l0.processEvent081(A0_71, A1_72, A2_73, A3_74)
  A0_71:startFadeOutCutSceneDefault(A1_72)
  A0_71:startNQCutScene("man2l081", 1)
  A0_71:startHQCutScene("MAN2L090", 1)
  A0_71:startNQCutScene("man2l100", 1)
  A0_71:startNQCutScene("man2l110", 1)
  A0_71:startFadeInCutSceneAfterWarp(A1_72)
end
function Man2l0.processEvent081_2(A0_75, A1_76, A2_77, A3_78)
  if A3_78 >= 18 then
    worldMaster:say(A0_75, 147)
  else
    worldMaster:say(A0_75, 148)
  end
end
function Man2l0.processEventTalkMenuManCutPreview(A0_79, A1_80, A2_81, A3_82)
  if A3_82 == 205 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l080", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif A3_82 == 106 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startHQCutScene("man2l090", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif A3_82 == 107 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startHQCutScene("man2l030", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif A3_82 ~= 10004 or nil == 1 then
  elseif nil == 2 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l000", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 3 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l001", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 4 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l002", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 5 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l010", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 6 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l011", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 7 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l012", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 8 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l013", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 9 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l020", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 10 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l030", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 11 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l040", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 12 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l060", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 13 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l070", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 14 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l075", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 15 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l080", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 16 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l081", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 17 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l090", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 18 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l100", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  elseif nil == 19 then
    A0_79:startFadeOutCutSceneDefault(A1_80)
    A0_79:startNQCutScene("man2l110", 1)
    A0_79:startFadeInCutSceneDefault(A1_80)
  end
end
