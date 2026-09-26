require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0g6", "ScenarioBaseClass")
function Com0g6.initText(A0_0)
  A0_0:_loadTextDataPermanently(6032, "com0g6")
end
function Com0g6.processEventHint(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(2, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 80, 0)
  A2_3:say(A0_1, 81, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 82, 0)
  A2_3:say(A0_1, 83, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 84, 0)
  A2_3:finishCliantTalkTurn()
end
function Com0g6.processEventStart(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(7, A1_5)
  if A2_6:doSalute(2, 33) == 0 then
    A2_6:_runCharaScheduler(354062336)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 2, 0)
  A0_4:startFadeOut(A1_5, 1)
  A0_4:_wait(1)
  A2_6:_runCharaScheduler(354086912)
  A0_4:startFadeIn(A1_5, 1)
  A2_6:say(A0_4, 86, 0)
  A2_6:say(A0_4, 3, 0)
  A2_6:say(A0_4, 73, 0)
  A2_6:say(A0_4, 4, 0)
  A2_6:say(A0_4, 5, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 6, 0)
  A2_6:say(A0_4, 7, 0)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 8, 0)
  A2_6:say(A0_4, 9, 0)
  A2_6:_runCharaScheduler(353976320)
  A2_6:say(A0_4, 10, 0)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:say(A0_4, 12, 0)
    A2_6:finishCliantTalkTurn()
    return (A0_4:showQuestInfomation())
  else
    A2_6:say(A0_4, 11, 0)
    A2_6:finishCliantTalkTurn()
    return (A0_4:showQuestInfomation())
  end
end
function Com0g6.processEventStartAfter(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(7, A1_8)
  if A2_9:doSalute(2, 33) == 0 then
    A2_9:_runCharaScheduler(353959936)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 13, 0)
  A2_9:say(A0_7, 14, 0)
  A2_9:finishCliantTalkTurn()
  return
end
function Com0g6.processEventLewin(A0_10, A1_11, A2_12, A3_13, A4_14)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A3_13 == 1 and A4_14 == 2 then
    A2_12:_runCharaScheduler(353959936)
    A2_12:say(A0_10, 15, 0)
  else
    A2_12:_runCharaScheduler(353959936)
    A2_12:say(A0_10, 16, 0)
  end
  A2_12:say(A0_10, 17, 0)
  A2_12:_runCharaScheduler(354086912)
  A2_12:say(A0_10, 18, 0)
  A2_12:say(A0_10, 19, 0)
  A2_12:say(A0_10, 20, 0)
  A2_12:_runCharaScheduler(354103296)
  A2_12:say(A0_10, 21, 0)
  A2_12:say(A0_10, 22, 0)
  A2_12:say(A0_10, 23, 0)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 24, 0)
  A2_12:say(A0_10, 25, 0)
  A2_12:say(A0_10, 26, 0)
  A2_12:finishCliantTalkTurn()
  return
end
function Com0g6.processEventLewinAfter(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:_runCharaScheduler(353959936)
  A2_17:say(A0_15, 68, 0)
  A2_17:say(A0_15, 79, 0)
  A2_17:finishCliantTalkTurn()
  return
end
function Com0g6.processEventPesi(A0_18, A1_19, A2_20, A3_21, A4_22)
  A2_20:startCliantTalkTurn(2, A1_19)
  if A3_21 == 1 and A4_22 == 2 then
    A2_20:_runCharaScheduler(353959936)
    A2_20:say(A0_18, 61, 0)
  else
    A2_20:_runCharaScheduler(353964032)
    A2_20:say(A0_18, 60, 0)
  end
  A2_20:finishCliantTalkTurn()
  return
end
function Com0g6.processEventPesiAfter(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(353964032)
  A2_25:say(A0_23, 67, 0)
  A2_25:finishCliantTalkTurn()
  return
end
function Com0g6.processEventSwethyna(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:_runCharaScheduler(353959936)
  A2_28:say(A0_26, 59, 0)
  A2_28:finishCliantTalkTurn()
  return
end
function Com0g6.processEventSwethynaAfter(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:_runCharaScheduler(353959936)
  A2_31:say(A0_29, 66, 0)
  A2_31:finishCliantTalkTurn()
  return
end
function Com0g6.processEventConcessa(A0_32, A1_33, A2_34)
  A2_34:startCliantTalkTurn(2, A1_33)
  A2_34:say(A0_32, 64, 0)
  A2_34:finishCliantTalkTurn()
  return
end
function Com0g6.processEventConcessaAfter(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  A2_37:say(A0_35, 71, 0)
  A2_37:finishCliantTalkTurn()
  return
end
function Com0g6.processEventKinborow(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  A2_40:say(A0_38, 65, 0)
  A2_40:finishCliantTalkTurn()
  return
end
function Com0g6.processEventKinborowAfter(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 72, 0)
  A2_43:finishCliantTalkTurn()
  return
end
function Com0g6.processEventNorbertillon(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:_runCharaScheduler(353968128)
  A2_46:say(A0_44, 63, 0)
  A2_46:finishCliantTalkTurn()
  return
end
function Com0g6.processEventNorbertillonAfter(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:_runCharaScheduler(353964032)
  A2_49:say(A0_47, 70, 0)
  A2_49:finishCliantTalkTurn()
  return
end
function Com0g6.processEventSorezari(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:_runCharaScheduler(353964032)
  A2_52:say(A0_50, 62, 0)
  A2_52:finishCliantTalkTurn()
  return
end
function Com0g6.processEventSorezariAfter(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:_runCharaScheduler(353968128)
  A2_55:say(A0_53, 69, 0)
  A2_55:finishCliantTalkTurn()
  return
end
function Com0g6.processEventClear(A0_56, A1_57, A2_58, A3_59)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:_runCharaScheduler(353959936)
  if A3_59 == 1 then
    A2_58:say(A0_56, 46, 0)
    break
  else
  end
  if A3_59 == 2 then
    A2_58:say(A0_56, 46, 0)
    break
  else
  end
  if A3_59 == 3 then
    A2_58:say(A0_56, 74, 0)
    break
  else
  end
  if A3_59 == 4 then
    A2_58:say(A0_56, 46, 0)
    break
  else
  end
  A2_58:say(A0_56, 74, 0)
  do break end
  A2_58:say(A0_56, 75, 0)
  A2_58:say(A0_56, 47, 0)
  A2_58:_runCharaScheduler(353972224)
  A2_58:say(A0_56, 48, 0)
  A2_58:say(A0_56, 49, 0)
  A2_58:say(A0_56, 50, 0)
  A2_58:_runCharaScheduler(354086912)
  A2_58:say(A0_56, 51, 0)
  if A3_59 == 1 then
    A2_58:say(A0_56, 53, 0)
    break
  else
  end
  if A3_59 == 2 then
    A2_58:say(A0_56, 54, 0)
    break
  else
  end
  if A3_59 == 3 then
    A2_58:say(A0_56, 52, 0)
    break
  else
  end
  if A3_59 == 4 then
    A2_58:say(A0_56, 55, 0)
    break
  else
  end
  A2_58:say(A0_56, 52, 0)
  do break end
  A0_56:_wait(1)
  A2_58:startCliantTalkTurn(1, A1_57)
  A2_58:waitCliantTalkTurn()
  A2_58:_runCharaScheduler(354099200)
  A2_58:say(A0_56, 56, 0)
  A2_58:say(A0_56, 76, 0)
  A2_58:say(A0_56, 57, 0)
  A2_58:_runCharaScheduler(353959936)
  A2_58:say(A0_56, 58, 0)
  A2_58:say(A0_56, 78, 0)
  A2_58:finishCliantTalkTurn()
  return
end
function Com0g6.processEventNq(A0_60, A1_61, A2_62)
  A0_60:startFadeOutCutSceneDefault(A1_61)
  A0_60:startNQCutScene("COM0G510", 1)
  A0_60:startFadeInCutSceneDefault(A1_61)
end
