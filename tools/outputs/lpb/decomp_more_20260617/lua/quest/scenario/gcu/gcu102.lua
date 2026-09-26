require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu102", "ScenarioBaseClass")
function Gcu102.initText(A0_0)
  A0_0:_loadTextDataPermanently(7856, "gcu102")
end
function Gcu102.processEventStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(3, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 9, 0)
  else
    A2_3:say(A0_1, 8, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcu102.processEvent000_2(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(3, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 10, 0)
  A2_6:say(A0_4, 11, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcu102.processEvent000_3(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:isUpperRank(3, 11) == true then
    A2_9:say(A0_7, 12, 0)
    A2_9:say(A0_7, 13, 0)
  else
    A2_9:say(A0_7, 85, 0)
    A2_9:say(A0_7, 86, 0)
  end
  A2_9:finishCliantTalkTurn()
end
function Gcu102.processEvent000_4(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A2_12:isUpperRank(3, 11) == true then
    A2_12:say(A0_10, 14, 0)
    A2_12:say(A0_10, 15, 0)
    A2_12:_runCharaScheduler(354041856)
    A2_12:say(A0_10, 16, 0)
  else
    A2_12:say(A0_10, 87, 0)
    A2_12:say(A0_10, 88, 0)
    A2_12:_runCharaScheduler(354041856)
    A2_12:say(A0_10, 89, 0)
  end
  A2_12:finishCliantTalkTurn()
end
function Gcu102.processEvent000_5(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  if A2_15:isUpperRank(3, 11) == true then
    A2_15:say(A0_13, 17, 0)
    A2_15:say(A0_13, 18, 0)
  else
    A2_15:say(A0_13, 90, 0)
    A2_15:say(A0_13, 91, 0)
  end
  A2_15:finishCliantTalkTurn()
end
function Gcu102.processEvent005(A0_16, A1_17, A2_18, A3_19)
  A2_18:startCliantTalkTurn(2, A1_17)
  if A3_19 == 0 then
    A2_18:say(A0_16, 19, 0)
  else
    A2_18:say(A0_16, 20, 0)
  end
  A2_18:_runCharaScheduler(353976320)
  A2_18:say(A0_16, 21, 0)
  A2_18:say(A0_16, 22, 0)
  A2_18:_runCharaScheduler(354107392)
  A2_18:say(A0_16, 23, 0)
  A2_18:say(A0_16, 24, 0)
  A2_18:_runCharaScheduler(353976320)
  A2_18:say(A0_16, 25, 0)
  A2_18:say(A0_16, 26, 0)
  A2_18:say(A0_16, 27, 0)
  A2_18:finishCliantTalkTurn()
end
function Gcu102.processEvent010_2(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:say(A0_20, 28, 0)
  A2_22:_runCharaScheduler(353976320)
  A2_22:say(A0_20, 29, 0)
  A2_22:say(A0_20, 30, 0)
  A2_22:finishCliantTalkTurn()
end
function Gcu102.processEvent010_3(A0_23, A1_24, A2_25)
  worldMaster:say(A0_23, 81, 0)
end
function Gcu102.processEvent010_4(A0_26, A1_27, A2_28)
  worldMaster:say(A0_26, 81, 0)
end
function Gcu102.processEvent010_5(A0_29, A1_30, A2_31)
  worldMaster:say(A0_29, 81, 0)
end
function Gcu102.processEvent010(A0_32, A1_33, A2_34)
  A2_34:say(A0_32, 31, 1)
  if worldMaster:ask(A0_32, worldMaster, 51030, 2) == 1 then
    A0_32:runCharaSchedulerPastAreaIn(A1_33)
    return (worldMaster:ask(A0_32, worldMaster, 51030, 2))
  end
end
function Gcu102.processEvent015(A0_35, A1_36, A2_37)
  A0_35:startFadeOutCutSceneDefault(A1_36)
  A0_35:startNQCutScene("gc01u210", 1)
  A0_35:startFadeInCutSceneDefault(A1_36)
end
function Gcu102.processEvent015_2(A0_38, A1_39, A2_40)
  A2_40:say(A0_38, 48, 1)
end
function Gcu102.processEvent020(A0_41, A1_42, A2_43)
  A2_43:startCliantTalkTurn(2, A1_42)
  A2_43:say(A0_41, 49, 0)
  A2_43:_runCharaScheduler(353976320)
  A2_43:say(A0_41, 50, 0)
  A2_43:say(A0_41, 51, 0)
  A2_43:say(A0_41, 52, 0)
  A2_43:_runCharaScheduler(353976320)
  A2_43:say(A0_41, 53, 0)
  A2_43:finishCliantTalkTurn()
end
function Gcu102.processEvent025_2(A0_44, A1_45, A2_46)
  A2_46:startCliantTalkTurn(2, A1_45)
  A2_46:_runCharaScheduler(353959936)
  A2_46:say(A0_44, 54, 0)
  A2_46:say(A0_44, 55, 0)
  A2_46:finishCliantTalkTurn()
end
function Gcu102.processEvent025_3(A0_47, A1_48, A2_49)
  A2_49:startCliantTalkTurn(2, A1_48)
  A2_49:_runCharaScheduler(353959936)
  A2_49:say(A0_47, 56, 0)
  A2_49:finishCliantTalkTurn()
end
function Gcu102.processEvent025_4(A0_50, A1_51, A2_52)
  A2_52:startCliantTalkTurn(2, A1_51)
  A2_52:_runCharaScheduler(353959936)
  A2_52:say(A0_50, 57, 0)
  A2_52:say(A0_50, 58, 0)
  A2_52:finishCliantTalkTurn()
end
function Gcu102.processEvent025_5(A0_53, A1_54, A2_55)
  A2_55:startCliantTalkTurn(2, A1_54)
  A2_55:_runCharaScheduler(354177024)
  A2_55:say(A0_53, 78, 0)
  A2_55:finishCliantTalkTurn()
end
function Gcu102.processEvent025_6(A0_56, A1_57, A2_58)
  A2_58:startCliantTalkTurn(2, A1_57)
  A2_58:_runCharaScheduler(353959936)
  A2_58:say(A0_56, 79, 0)
  A2_58:finishCliantTalkTurn()
end
function Gcu102.processEvent025_7(A0_59, A1_60, A2_61)
  A2_61:startCliantTalkTurn(2, A1_60)
  A2_61:_runCharaScheduler(353959936)
  A2_61:say(A0_59, 80, 0)
  A2_61:finishCliantTalkTurn()
end
function Gcu102.processEvent025_8(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  if A2_64:doSalute(3, 33) == 0 then
    A2_64:_runCharaScheduler(353959936)
  end
  A0_62:_wait(1)
  A2_64:say(A0_62, 59, 0)
  A2_64:say(A0_62, 60, 0)
  A2_64:finishCliantTalkTurn()
end
function Gcu102.processEvent025(A0_65, A1_66, A2_67)
  A2_67:startCliantTalkTurn(2, A1_66)
  A2_67:_runCharaScheduler(354082816)
  A2_67:say(A0_65, 61, 0)
  A2_67:say(A0_65, 62, 0)
  A0_65:startFadeOut(A1_66, 1)
  A0_65:_wait(2)
  A0_65:startFadeIn(A1_66, 1)
  A2_67:_runCharaScheduler(354086912)
  A2_67:say(A0_65, 63, 0)
  A2_67:say(A0_65, 64, 0)
  A2_67:_runCharaScheduler(353959936)
  A2_67:say(A0_65, 65, 0)
  A2_67:say(A0_65, 66, 0)
  A2_67:_runCharaScheduler(354082816)
  A2_67:say(A0_65, 67, 0)
  A2_67:say(A0_65, 68, 0)
  A2_67:_runCharaScheduler(353959936)
  A2_67:say(A0_65, 69, 0)
  A2_67:say(A0_65, 82, 0)
  A2_67:say(A0_65, 70, 0)
  A2_67:_runCharaScheduler(354082816)
  A2_67:say(A0_65, 71, 0)
  A2_67:_runCharaScheduler(353959936)
  A2_67:say(A0_65, 73, 0)
  A2_67:say(A0_65, 83, 0)
  A2_67:say(A0_65, 74, 0)
  A2_67:_runCharaScheduler(354082816)
  A2_67:say(A0_65, 75, 0)
  A2_67:say(A0_65, 76, 0)
  A2_67:_runCharaScheduler(353959936)
  A2_67:say(A0_65, 84, 0)
  A2_67:finishCliantTalkTurn()
end
function Gcu102.processEvent_elevator_nq1F(A0_68, A1_69, A2_70)
  A0_68:startFadeOutCutSceneDefault(A1_69)
  A0_68:startNQCutScene("elv0u01a", 1, 0)
  A0_68:startFadeInCutSceneAfterWarp(A1_69)
  return
end
function Gcu102.processEvent_elevator_nq2F(A0_71, A1_72, A2_73)
  A0_71:startFadeOutCutSceneDefault(A1_72)
  A0_71:startNQCutScene("elv0u02a", 1, 0)
  A0_71:startFadeInCutSceneAfterWarp(A1_72)
  return
end
