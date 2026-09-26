require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("SceAlphaA", "ScenarioBaseClass")
function SceAlphaA.initText(A0_0)
  local L1_1
end
function SceAlphaA.processQuestOffer(A0_2, A1_3, A2_4)
  local L3_5
  return L3_5
end
function SceAlphaA.processOfferGood(A0_6, A1_7, A2_8)
  A0_6:startFadeOutCutSceneDefault(A1_7)
  A1_7:_wait(10)
  A0_6:startFadeInCutSceneDefault(A1_7)
end
function SceAlphaA.processOfferGoodNqEvent(A0_9, A1_10, A2_11)
  A0_9:startFadeOutCutSceneDefault(A1_10)
  A1_10:_wait(10)
  A0_9:startFadeInCutSceneDefault(A1_10)
end
function SceAlphaA.processOfferBad(A0_12, A1_13, A2_14)
end
function SceAlphaA.processEventTalkStep0(A0_15, A1_16, A2_17)
  local L3_18
  if L3_18 == 1 then
    A0_15:startFadeOutCutSceneDefault(A1_16)
    A1_16:_wait(10)
    A0_15:startFadeInCutSceneDefault(A1_16)
  elseif L3_18 == 2 then
    A0_15:startFadeOutCutSceneDefault(A1_16)
    A1_16:_wait(10)
    A0_15:startFadeInCutSceneDefault(A1_16)
  elseif L3_18 == 3 then
    A0_15:startFadeOutCutSceneDefault(A1_16)
    A1_16:_wait(10)
    A0_15:startFadeInCutSceneDefault(A1_16)
  elseif L3_18 == 4 then
    A0_15:startFadeOutCutSceneDefault(A1_16)
    A1_16:_wait(10)
    A0_15:startFadeInCutSceneDefault(A1_16)
  elseif L3_18 == 5 then
    A0_15:startFadeOutCutSceneDefault(A1_16)
    A1_16:_wait(10)
    A0_15:startFadeInCutSceneDefault(A1_16)
  else
    if L3_18 == 6 then
    else
    end
  end
end
function SceAlphaA.processEventTalkStep1(A0_19, A1_20, A2_21)
  if nil == 1 then
    if nil == 1 then
      if nil == 1 then
      elseif nil == 2 then
      elseif nil == 3 then
      elseif nil == 4 then
      else
      end
    elseif nil == 2 then
      if nil == 1 then
      elseif nil == 2 then
      elseif nil == 3 then
      elseif nil == 4 then
      else
      end
    elseif nil == 3 then
      if nil == 1 then
      else
      end
    else
    end
    if 99999 ~= 99999 then
    end
    if 99999 == 1 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 2 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 3 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 4 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 5 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 6 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 7 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 8 then
      A0_19:startFadeOutCutSceneDefault(A1_20)
      A0_19:startFadeInCutSceneDefault(A1_20)
    elseif 99999 == 9 then
    else
      if 99999 == 99999 then
      else
      end
    end
    if 99999 ~= 99999 then
    end
  else
    A0_19:startFadeOutCutSceneDefault(A1_20)
    A0_19:startFadeInCutSceneDefault(A1_20)
    A2_21:say(A0_19, 10008, 0)
    while true == true do
      if A2_21:ask(A0_19, 10010, 3) == 1 then
        A2_21:say(A0_19, 10018, 0)
        A2_21:say(A0_19, 10020, 0)
        A2_21:say(A0_19, 10022, 0)
      elseif A2_21:ask(A0_19, 10010, 3) == 2 then
        A2_21:say(A0_19, 10029, 0)
        A0_19:startFadeOutCutSceneDefault(A1_20)
        A1_20:_wait(10)
        A0_19:startFadeInCutSceneDefault(A1_20)
      else
        A2_21:say(A0_19, 10035, 0)
      end
    end
  end
end
function SceAlphaA.processEventTalkStep2(A0_22, A1_23, A2_24)
  A2_24:say(A0_22, 10036, 0)
  A2_24:say(A0_22, 10037, 0)
end
function SceAlphaA.processEventTalkStep3(A0_25, A1_26, A2_27)
  A2_27:say(A0_25, 10039, 0)
end
function SceAlphaA.processEventTalkGuildleve1(A0_28, A1_29, A2_30)
  A2_30:say(A0_28, 10043, 0)
  A2_30:say(A0_28, 10044, 0)
  A2_30:say(A0_28, 10045, 0)
end
function SceAlphaA.processEventTalkGuildleve2(A0_31, A1_32, A2_33)
  A2_33:say(A0_31, 10047, 0)
end
function SceAlphaA.processEventTalkGuildleve3(A0_34, A1_35, A2_36)
  A2_36:say(A0_34, 10049, 0)
end
function SceAlphaA.processEventTalkGuildleve4(A0_37, A1_38, A2_39)
  A0_37:startFadeOutCutSceneDefault(A1_38)
  A1_38:_wait(10)
  A0_37:startFadeInCutSceneDefault(A1_38)
end
function SceAlphaA.processEventTalkGuildleve5(A0_40, A1_41, A2_42)
  A0_40:startFadeOutCutSceneDefault(A1_41)
  A1_41:_wait(10)
  A0_40:startFadeInCutSceneDefault(A1_41)
end
function SceAlphaA.processEventTalkAnselmet(A0_43, A1_44, A2_45)
  A2_45:say(A0_43, 10079, 0)
end
function SceAlphaA.processEventTalkClerebold(A0_46, A1_47, A2_48)
  A2_48:say(A0_46, 10081, 0)
  A2_48:say(A0_46, 10082, 0)
end
function SceAlphaA.processEventTalkOIsamNene0(A0_49, A1_50, A2_51)
  A2_51:say(A0_49, 10065, 0)
  A2_51:say(A0_49, 10066, 0)
end
function SceAlphaA.processEventTalkOIsamNene1(A0_52, A1_53, A2_54)
  A2_54:say(A0_52, 10068, 0)
  A2_54:say(A0_52, 10069, 0)
  A2_54:say(A0_52, 10070, 0)
  A2_54:say(A0_52, 10071, 0)
end
function SceAlphaA.processEventTalkOIsamNene2(A0_55, A1_56, A2_57)
  A2_57:say(A0_55, 10072, 0)
end
function SceAlphaA.processEventTalkOIsamNene2b(A0_58, A1_59, A2_60)
  A2_60:say(A0_58, 10073, 0)
end
function SceAlphaA.processEventTalkOIsamNene3(A0_61, A1_62, A2_63, A3_64)
  A2_63:say(A0_61, 10074, A3_64, 0)
end
function SceAlphaA.processEventTalkOIsamNene4(A0_65, A1_66, A2_67)
  A2_67:say(A0_65, 10076, 0)
  A2_67:say(A0_65, 10077, 0)
end
function SceAlphaA.processEventTalkOIsamNene5(A0_68, A1_69, A2_70)
  A2_70:say(A0_68, 10078, 0)
end
function SceAlphaA.processEventPonyoTalk(A0_71, A1_72, A2_73)
  A2_73:say(A0_71, 10015, 0)
end
function SceAlphaA.processEventJajaTalk1(A0_74, A1_75, A2_76)
  A2_76:say(A0_74, 10026, 0)
  A2_76:say(A0_74, 10027, 0)
end
function SceAlphaA.processEventJajaTalk2(A0_77, A1_78, A2_79)
  A2_79:say(A0_77, 10028, 0)
end
function SceAlphaA.processEventTalkMenuManCutPreview(A0_80, A1_81, A2_82, A3_83)
  if A3_83 == 101 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 102 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 103 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 104 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 105 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 201 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 202 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 203 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 204 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 301 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 302 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 303 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 304 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  elseif A3_83 == 305 then
    A0_80:startFadeOutCutSceneDefault(A1_81)
    A0_80:startFadeInCutSceneDefault(A1_81)
  end
end
function SceAlphaA.processEventTalkStepDammy1(A0_84, A1_85, A2_86)
end
