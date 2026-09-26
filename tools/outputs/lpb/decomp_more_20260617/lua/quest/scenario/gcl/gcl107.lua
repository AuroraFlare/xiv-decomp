require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcl107", "ScenarioBaseClass")
function Gcl107.initText(A0_0)
  A0_0:_loadTextDataPermanently(10496, "gcl107")
end
function Gcl107.processEventStartLim(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  if A2_3:doSalute(1, 33) == 0 then
    A2_3:_runCharaScheduler(353959936)
  end
  A0_1:_wait(1)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353980416)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(354103296)
  A2_3:say(A0_1, 6, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 8, 0)
    A2_3:_runCharaScheduler(353968128)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 10, 0)
    A2_3:_runCharaScheduler(354000896)
    A2_3:say(A0_1, 11, 0)
  else
    A2_3:say(A0_1, 7, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcl107.processEventStartGri(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(2, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 238, 0)
  A2_6:say(A0_4, 239, 0)
  A2_6:_runCharaScheduler(353980416)
  A2_6:say(A0_4, 240, 0)
  A2_6:say(A0_4, 241, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 242, 0)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:say(A0_4, 244, 0)
    A2_6:_runCharaScheduler(353972224)
    A2_6:say(A0_4, 245, 0)
    A2_6:say(A0_4, 246, 0)
    A2_6:_runCharaScheduler(353968128)
    A2_6:say(A0_4, 247, 0)
  else
    A2_6:say(A0_4, 243, 0)
  end
  A2_6:finishCliantTalkTurn()
  return (A0_4:showQuestInfomation())
end
function Gcl107.processEventStartUld(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(3, 33) == 0 then
    A2_9:_runCharaScheduler(354041856)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 271, 0)
  A2_9:say(A0_7, 272, 0)
  A2_9:_runCharaScheduler(353980416)
  A2_9:say(A0_7, 273, 0)
  A2_9:say(A0_7, 274, 0)
  A2_9:_runCharaScheduler(353976320)
  A2_9:say(A0_7, 275, 0)
  if A0_7:showQuestInfomation() == 1 then
    A2_9:say(A0_7, 277, 0)
    A2_9:_runCharaScheduler(353964032)
    A2_9:say(A0_7, 278, 0)
    A2_9:say(A0_7, 279, 0)
    A2_9:_runCharaScheduler(354103296)
    A2_9:say(A0_7, 280, 0)
  else
    A2_9:say(A0_7, 276, 0)
  end
  A2_9:finishCliantTalkTurn()
  return (A0_7:showQuestInfomation())
end
function Gcl107.processEventGuincum(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 12, 0)
  A2_12:say(A0_10, 13, 0)
  A2_12:_runCharaScheduler(354103296)
  A2_12:say(A0_10, 14, 0)
  A2_12:finishCliantTalkTurn()
end
function Gcl107.processEventFulke(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(353959936)
  A2_15:say(A0_13, 248, 0)
  A2_15:say(A0_13, 249, 0)
  A2_15:_runCharaScheduler(353972224)
  A2_15:say(A0_13, 250, 0)
  A2_15:finishCliantTalkTurn()
end
function Gcl107.processEventAubrey(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(353959936)
  A2_18:say(A0_16, 281, 0)
  A2_18:say(A0_16, 282, 0)
  A2_18:_runCharaScheduler(354000896)
  A2_18:say(A0_16, 283, 0)
  A2_18:finishCliantTalkTurn()
end
function Gcl107.processEventKinnison01(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(353959936)
  A2_21:say(A0_19, 15, 0)
  if A2_21:ask(A0_19, 16, 2) ~= 1 then
    A2_21:say(A0_19, 19, 0)
  end
  A2_21:finishCliantTalkTurn()
  return (A2_21:ask(A0_19, 16, 2))
end
function Gcl107.processEventMerlwyb1(A0_22, A1_23, A2_24, A3_25)
  A2_24:startCliantTalkTurn(2, A1_23)
  if A3_25 == 1 then
    A2_24:_runCharaScheduler(365002752)
    A2_24:say(A0_22, 45, 0)
    A2_24:say(A0_22, 46, 0)
    A2_24:say(A0_22, 319, 0)
    A2_24:_runCharaScheduler(364998656)
    A2_24:say(A0_22, 47, 0)
    A2_24:say(A0_22, 48, 0)
    A2_24:_runCharaScheduler(79847424)
    A2_24:say(A0_22, 49, 0)
    A2_24:say(A0_22, 50, 0)
    A2_24:_runCharaScheduler(365006848)
    A2_24:say(A0_22, 52, 0)
  else
    A2_24:_runCharaScheduler(364998656)
    A2_24:say(A0_22, 20, 0)
    A2_24:say(A0_22, 21, 0)
  end
  A2_24:finishCliantTalkTurn()
end
function Gcl107.processEventSenna01(A0_26, A1_27, A2_28, A3_29)
  A2_28:startCliantTalkTurn(2, A1_27)
  if A3_29 == 2 then
    A2_28:_runCharaScheduler(79503360)
    A2_28:say(A0_26, 251, 0)
    A2_28:say(A0_26, 252, 0)
    A2_28:say(A0_26, 253, 0)
    A2_28:_runCharaScheduler(364675072)
    A2_28:say(A0_26, 254, 0)
    A2_28:say(A0_26, 255, 0)
    A2_28:_runCharaScheduler(364679168)
    A2_28:say(A0_26, 256, 0)
    A2_28:_runCharaScheduler(79482880)
    A2_28:say(A0_26, 258, 0)
  else
    A2_28:_runCharaScheduler(364675072)
    A2_28:say(A0_26, 22, 0)
    A2_28:say(A0_26, 23, 0)
    A2_28:_runCharaScheduler(79503360)
    A2_28:say(A0_26, 24, 0)
  end
  A2_28:finishCliantTalkTurn()
end
function Gcl107.processEventRaubahn1(A0_30, A1_31, A2_32, A3_33)
  A2_32:startCliantTalkTurn(2, A1_31)
  if A3_33 == 3 then
    A2_32:_runCharaScheduler(353968128)
    A2_32:say(A0_30, 284, 0)
    A2_32:say(A0_30, 285, 0)
    A2_32:say(A0_30, 320, 0)
    A2_32:_runCharaScheduler(353959936)
    A2_32:say(A0_30, 286, 0)
    A2_32:say(A0_30, 287, 0)
    A2_32:_runCharaScheduler(354082816)
    A2_32:say(A0_30, 288, 0)
    A2_32:say(A0_30, 289, 0)
    A2_32:_runCharaScheduler(354103296)
    A2_32:say(A0_30, 291, 0)
  else
    A2_32:say(A0_30, 25, 0)
    A2_32:_runCharaScheduler(354082816)
    A2_32:say(A0_30, 26, 0)
    A2_32:say(A0_30, 27, 0)
  end
  A2_32:finishCliantTalkTurn()
end
function Gcl107.processEventEynzahr(A0_34, A1_35, A2_36, A3_37)
  A2_36:startCliantTalkTurn(2, A1_35)
  if A3_37 == 1 then
    A2_36:say(A0_34, 28, 0)
    A2_36:_runCharaScheduler(354082816)
    A2_36:say(A0_34, 29, 0)
    A2_36:say(A0_34, 30, 0)
  else
    A2_36:_runCharaScheduler(354082816)
    A2_36:say(A0_34, 31, 0)
    A2_36:say(A0_34, 32, 0)
  end
  A2_36:finishCliantTalkTurn()
end
function Gcl107.processEventSwethryk(A0_38, A1_39, A2_40, A3_41)
  A2_40:startCliantTalkTurn(2, A1_39)
  if A3_41 == 2 then
    A2_40:say(A0_38, 33, 0)
    A2_40:_runCharaScheduler(353972224)
    A2_40:say(A0_38, 34, 0)
    A2_40:say(A0_38, 35, 0)
  else
    A2_40:_runCharaScheduler(353972224)
    A2_40:say(A0_38, 36, 0)
    A2_40:say(A0_38, 37, 0)
  end
  A2_40:finishCliantTalkTurn()
end
function Gcl107.processEventEline(A0_42, A1_43, A2_44, A3_45)
  A2_44:startCliantTalkTurn(2, A1_43)
  if A3_45 == 3 then
    A2_44:_runCharaScheduler(353964032)
    A2_44:say(A0_42, 38, 0)
    A2_44:say(A0_42, 39, 0)
    A2_44:say(A0_42, 40, 0)
  else
    A2_44:_runCharaScheduler(353964032)
    A2_44:say(A0_42, 41, 0)
    A2_44:say(A0_42, 42, 0)
  end
  A2_44:finishCliantTalkTurn()
end
function Gcl107.processEventCid01(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:_runCharaScheduler(354086912)
  A2_48:say(A0_46, 43, 0)
  A2_48:say(A0_46, 44, 0)
  A2_48:finishCliantTalkTurn()
end
function Gcl107.processEventKinnison02(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:_runCharaScheduler(353959936)
  A2_51:say(A0_49, 59, 0)
  if A2_51:ask(A0_49, 16, 2) ~= 1 then
    A2_51:say(A0_49, 63, 0)
  end
  A2_51:finishCliantTalkTurn()
  return (A2_51:ask(A0_49, 16, 2))
end
function Gcl107.processEventMerlwyb2(A0_52, A1_53, A2_54, A3_55)
  A2_54:startCliantTalkTurn(2, A1_53)
  if A3_55 == 1 then
    A2_54:_runCharaScheduler(364998656)
    A2_54:say(A0_52, 101, 0)
    A0_52:startFadeOut(A1_53, 1.5)
    A0_52:_wait(1.5)
    A2_54:_runCharaScheduler(79839232)
    A0_52:startFadeIn(A1_53, 1.5)
    A2_54:say(A0_52, 102, 0)
    A2_54:_runCharaScheduler(365015040)
    A2_54:say(A0_52, 103, 0)
    A2_54:say(A0_52, 104, 0)
    A2_54:say(A0_52, 105, 0)
    A2_54:_runCharaScheduler(79835136)
    A2_54:say(A0_52, 106, 0)
    A2_54:say(A0_52, 107, 0)
    A2_54:say(A0_52, 108, 0)
    A2_54:_runCharaScheduler(79847424)
    A2_54:say(A0_52, 109, 0)
    A2_54:say(A0_52, 110, 0)
    A2_54:say(A0_52, 111, 0)
    A2_54:_runCharaScheduler(364998656)
    A2_54:say(A0_52, 112, 0)
  else
    A2_54:_runCharaScheduler(365002752)
    if A3_55 == 2 then
      A2_54:say(A0_52, 64, 0)
    else
      A2_54:say(A0_52, 65, 0)
    end
    A2_54:say(A0_52, 66, 0)
  end
  A2_54:finishCliantTalkTurn()
end
function Gcl107.processEventSenna02(A0_56, A1_57, A2_58, A3_59)
  A2_58:startCliantTalkTurn(2, A1_57)
  if A3_59 == 2 then
    A2_58:_runCharaScheduler(364675072)
    A2_58:say(A0_56, 260, 0)
    A0_56:startFadeOut(A1_57, 1.5)
    A0_56:_wait(1)
    A2_58:_runCharaScheduler(79507456)
    A0_56:_wait(0.5)
    A0_56:startFadeIn(A1_57, 1.5)
    A2_58:say(A0_56, 261, 0)
    A2_58:say(A0_56, 262, 0)
    A2_58:_runCharaScheduler(79482880)
    A2_58:say(A0_56, 263, 0)
    A2_58:say(A0_56, 264, 0)
    A2_58:_runCharaScheduler(364679168)
    A2_58:say(A0_56, 265, 0)
    A2_58:say(A0_56, 266, 0)
    A2_58:say(A0_56, 267, 0)
    A2_58:_runCharaScheduler(364675072)
    A2_58:say(A0_56, 268, 0)
    A2_58:say(A0_56, 269, 0)
    A2_58:_runCharaScheduler(79503360)
    A2_58:say(A0_56, 270, 0)
  else
    A2_58:_runCharaScheduler(79503360)
    A2_58:say(A0_56, 67, 0)
    A2_58:say(A0_56, 68, 0)
    A2_58:say(A0_56, 69, 0)
  end
  A2_58:finishCliantTalkTurn()
end
function Gcl107.processEventRaubahn2(A0_60, A1_61, A2_62, A3_63)
  A2_62:startCliantTalkTurn(2, A1_61)
  if A3_63 == 3 then
    A2_62:say(A0_60, 293, 0)
    A0_60:startFadeOut(A1_61, 1.5)
    A0_60:_wait(0.5)
    A0_60:_wait(1)
    A0_60:startFadeIn(A1_61, 1.5)
    A2_62:_runCharaScheduler(70815744)
    A2_62:say(A0_60, 294, 0)
    A2_62:_waitForCharaSchedulerFinished(354078720)
    A2_62:_runCharaScheduler(83943424)
    A2_62:say(A0_60, 295, 0)
    A2_62:say(A0_60, 296, 0)
    A2_62:_waitForCharaSchedulerFinished(69193728)
    A2_62:_runCharaScheduler(353959936)
    A2_62:say(A0_60, 297, 0)
    A2_62:say(A0_60, 298, 0)
    A2_62:_runCharaScheduler(354000896)
    A2_62:say(A0_60, 299, 0)
    A2_62:say(A0_60, 300, 0)
    A2_62:say(A0_60, 301, 0)
    A2_62:_runCharaScheduler(354082816)
    A2_62:say(A0_60, 302, 0)
    A2_62:say(A0_60, 303, 0)
    A2_62:say(A0_60, 304, 0)
  else
    A2_62:_runCharaScheduler(353959936)
    A2_62:say(A0_60, 70, 0, A3_63)
    A2_62:say(A0_60, 71, 0, A3_63)
    A2_62:_runCharaScheduler(353964032)
    A2_62:say(A0_60, 72, 0)
  end
  A2_62:finishCliantTalkTurn()
end
function Gcl107.processEventShtola(A0_64, A1_65, A2_66)
  A2_66:startCliantTalkTurn(2, A1_65)
  A2_66:_runCharaScheduler(353976320)
  A2_66:say(A0_64, 73, 0)
  A2_66:say(A0_64, 74, 0)
  A2_66:say(A0_64, 75, 0)
  A2_66:_runCharaScheduler(353959936)
  A2_66:say(A0_64, 76, 0)
  A2_66:finishCliantTalkTurn()
end
function Gcl107.processEventPapalymo(A0_67, A1_68, A2_69)
  A2_69:startCliantTalkTurn(2, A1_68)
  A2_69:_runCharaScheduler(353968128)
  A2_69:say(A0_67, 77, 0)
  A2_69:say(A0_67, 78, 0)
  A2_69:_runCharaScheduler(353972224)
  A2_69:say(A0_67, 79, 0)
  A2_69:say(A0_67, 80, 0)
  A2_69:_runCharaScheduler(353964032)
  A2_69:say(A0_67, 81, 0)
  A2_69:finishCliantTalkTurn()
end
function Gcl107.processEventYda(A0_70, A1_71, A2_72)
  A2_72:startCliantTalkTurn(2, A1_71)
  A2_72:_runCharaScheduler(353968128)
  A2_72:say(A0_70, 82, 0)
  A2_72:say(A0_70, 83, 0)
  A2_72:_runCharaScheduler(354086912)
  A2_72:say(A0_70, 84, 0)
  A2_72:say(A0_70, 85, 0)
  A2_72:finishCliantTalkTurn()
end
function Gcl107.processEventThancred(A0_73, A1_74, A2_75)
  A2_75:startCliantTalkTurn(2, A1_74)
  A2_75:_runCharaScheduler(353959936)
  A2_75:say(A0_73, 86, 0)
  if A2_75:ask(A0_73, 87, 3) == 1 then
    A2_75:_runCharaScheduler(353964032)
    A2_75:say(A0_73, 91, 0)
    A2_75:say(A0_73, 92, 0)
    A2_75:say(A0_73, 93, 0)
    A2_75:_runCharaScheduler(353968128)
    A2_75:say(A0_73, 94, 0)
    A2_75:finishCliantTalkTurn()
  elseif A2_75:ask(A0_73, 87, 3) == 2 then
    A2_75:_runCharaScheduler(353964032)
    A2_75:say(A0_73, 95, 0)
    A2_75:say(A0_73, 96, 0)
    A2_75:say(A0_73, 97, 0)
    A2_75:_runCharaScheduler(353968128)
    A2_75:say(A0_73, 98, 0)
    A2_75:finishCliantTalkTurn()
  elseif A2_75:ask(A0_73, 87, 3) == 3 then
    A2_75:finishCliantTalkTurn()
  elseif A2_75:ask(A0_73, 87, 3) == -3 then
    A2_75:finishCliantTalkTurn()
  end
  A2_75:finishCliantTalkTurn()
end
function Gcl107.processEventCid02(A0_76, A1_77, A2_78)
  A2_78:startCliantTalkTurn(2, A1_77)
  A2_78:_runCharaScheduler(354082816)
  A2_78:say(A0_76, 99, 0)
  A2_78:say(A0_76, 100, 0)
  A2_78:finishCliantTalkTurn()
end
function Gcl107.processEventMerlwyb3(A0_79, A1_80, A2_81, A3_82)
  A2_81:startCliantTalkTurn(2, A1_80)
  if A3_82 == 1 then
    A2_81:_runCharaScheduler(79835136)
    A2_81:say(A0_79, 113, 0)
    A2_81:say(A0_79, 114, 0)
  else
    A2_81:_runCharaScheduler(79847424)
    A2_81:say(A0_79, 115, 0)
    A2_81:say(A0_79, 116, 0)
  end
  A2_81:finishCliantTalkTurn()
end
function Gcl107.processEventSenna03(A0_83, A1_84, A2_85, A3_86)
  A2_85:startCliantTalkTurn(2, A1_84)
  A2_85:_runCharaScheduler(79503360)
  if A3_86 == 2 then
    A2_85:say(A0_83, 117, 0)
    A2_85:say(A0_83, 118, 0)
  else
    A2_85:say(A0_83, 119, 0)
    A2_85:say(A0_83, 120, 0)
  end
  A2_85:finishCliantTalkTurn()
end
function Gcl107.processEventRaubahn3(A0_87, A1_88, A2_89, A3_90)
  A2_89:startCliantTalkTurn(2, A1_88)
  if A3_90 == 3 then
    A2_89:_runCharaScheduler(354103296)
    A2_89:say(A0_87, 121, 0)
    A2_89:say(A0_87, 122, 0)
  else
    A2_89:_runCharaScheduler(354082816)
    A2_89:say(A0_87, 123, 0)
    A2_89:say(A0_87, 124, 0)
  end
  A2_89:finishCliantTalkTurn()
end
function Gcl107.processEventCid03(A0_91, A1_92, A2_93, A3_94, A4_95)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:_runCharaScheduler(354086912)
  A2_93:say(A0_91, 125, 0)
  A2_93:say(A0_91, 126, 0)
  A2_93:say(A0_91, 127, 0)
  A2_93:_runCharaScheduler(354082816)
  A2_93:say(A0_91, 128, 0)
  A2_93:say(A0_91, 129, 0, A3_94)
  A2_93:say(A0_91, 130, 0)
  A2_93:_runCharaScheduler(83943424)
  A2_93:say(A0_91, 131, 0)
  A2_93:_waitForCharaSchedulerFinished(83943424)
  A2_93:_runCharaScheduler(353972224)
  A2_93:say(A0_91, 132, 0)
  A2_93:_waitForCharaSchedulerFinished(353972224)
  A2_93:finishCliantTalkTurn()
  A2_93:say(A0_91, 133, 0)
  A2_93:_runCharaScheduler(83894272)
  A2_93:say(A0_91, 134, 0)
  A2_93:_waitForCharaSchedulerFinished(83894272)
  A2_93:startCliantTalkTurn(2, A1_92)
  A2_93:_runCharaScheduler(353964032)
  A2_93:say(A0_91, 135, 0)
  A2_93:say(A0_91, 136, 0)
  A2_93:_runCharaScheduler(353968128)
  A2_93:say(A0_91, 137, 0)
  worldMaster:say(A0_91, 138, A4_95)
  worldMaster:say(A0_91, 139, A4_95)
  A2_93:_runCharaScheduler(353959936)
  A2_93:say(A0_91, 140, 0)
  A2_93:finishCliantTalkTurn()
end
function Gcl107.processEventStewart(A0_96, A1_97, A2_98, A3_99, A4_100)
  local L5_101, L6_102
  L6_102 = A2_98
  L5_101 = A2_98.startCliantTalkTurn
  L5_101(L6_102, 2, A1_97)
  L6_102 = A2_98
  L5_101 = A2_98.doSalute
  L5_101 = L5_101(L6_102, 2, 11)
  if L5_101 == 0 then
    L6_102 = A2_98._runCharaScheduler
    L6_102(A2_98, 353959936)
  end
  L6_102 = A0_96._wait
  L6_102(A0_96, 1)
  L6_102 = A2_98.say
  L6_102(A2_98, A0_96, A0_96:getTextIdStewart(164, A4_100), 0)
  L6_102 = 0
  repeat
    while true do
      if true then
        L6_102 = A2_98:askExtendWidget(A0_96, A0_96:getTextIdStewart(165, A4_100), 3, 1, 1)
        if L6_102 == 1 then
          A2_98:_runCharaScheduler(353964032)
          A2_98:say(A0_96, A0_96:getTextIdStewart(178, A4_100), 0)
          A2_98:say(A0_96, A0_96:getTextIdStewart(179, A4_100), 0)
        elseif L6_102 == 2 then
          A2_98:_runCharaScheduler(353964032)
          A2_98:say(A0_96, A0_96:getTextIdStewart(169, A4_100), 0)
          worldMaster:say(A0_96, A0_96:getTextIdStewart(170, A4_100), A3_99)
          worldMaster:say(A0_96, A0_96:getTextIdStewart(171, A4_100), A3_99)
          worldMaster:say(A0_96, A0_96:getTextIdStewart(172, A4_100), A3_99)
          if A4_100 ~= true then
            A2_98:_runCharaScheduler(353968128)
            A2_98:say(A0_96, A0_96:getTextIdStewart(173, A4_100), 0)
            A2_98:say(A0_96, A0_96:getTextIdStewart(174, A4_100), 0)
          end
          worldMaster:say(A0_96, A0_96:getTextIdStewart(175, A4_100), A3_99)
          if A4_100 ~= true then
            worldMaster:say(A0_96, A0_96:getTextIdStewart(177, A4_100), A3_99)
          end
        else
        end
      end
    end
  until L6_102 == -3
  A2_98:finishCliantTalkTurn()
  return L6_102
end
function Gcl107.getTextIdStewart(A0_103, A1_104, A2_105)
  local L3_106, L4_107
  if A2_105 ~= true then
    return A1_104
  end
  L3_106 = A1_104
  if L3_106 == 164 then
    L4_107 = 321
    return L4_107
  else
  end
  if L3_106 == 165 then
    L4_107 = 322
    return L4_107
  else
  end
  if L3_106 == 169 then
    L4_107 = 326
    return L4_107
  else
  end
  if L3_106 == 170 then
    L4_107 = 327
    return L4_107
  else
  end
  if L3_106 == 171 then
    L4_107 = 328
    return L4_107
  else
  end
  if L3_106 == 172 then
    L4_107 = 329
    return L4_107
  else
  end
  if L3_106 == 175 then
    L4_107 = 330
    return L4_107
  else
  end
  if L3_106 == 178 then
    L4_107 = 332
    return L4_107
  else
  end
  if L3_106 == 179 then
    L4_107 = 333
    return L4_107
  else
  end
  return A1_104
end
function Gcl107.processEventCid04(A0_108, A1_109, A2_110, A3_111)
  A2_110:startCliantTalkTurn(2, A1_109)
  A2_110:_runCharaScheduler(354066432)
  A2_110:say(A0_108, 216, 0)
  A2_110:say(A0_108, 217, 0)
  A2_110:_runCharaScheduler(353964032)
  A2_110:say(A0_108, 218, 0)
  A2_110:say(A0_108, 219, 0)
  A2_110:_runCharaScheduler(353968128)
  A2_110:say(A0_108, 220, 0)
  A2_110:say(A0_108, 221, 0)
  A2_110:say(A0_108, 222, 0)
  A2_110:_runCharaScheduler(354103296)
  A2_110:say(A0_108, 223, 0)
  A2_110:say(A0_108, 224, 0)
  A2_110:_runCharaScheduler(354082816)
  A2_110:say(A0_108, 225, 0)
  A2_110:say(A0_108, 226, 0, A3_111)
  A2_110:say(A0_108, 227, 0)
  A2_110:finishCliantTalkTurn()
end
function Gcl107.processEventKinnison03(A0_112, A1_113, A2_114, A3_115)
  A2_114:startCliantTalkTurn(2, A1_113)
  A2_114:_runCharaScheduler(353959936)
  A2_114:say(A0_112, 228, 0)
  if A2_114:ask(A0_112, 16, 2) == 1 then
    A0_112:startFadeOutCutSceneDefault(A1_113)
    A0_112:startNQCutScene("gc010750", 1, 0, A3_115)
    A0_112:startFadeInCutSceneDefault(A1_113)
  else
    A2_114:say(A0_112, 232, 0)
  end
  A2_114:finishCliantTalkTurn()
  return (A2_114:ask(A0_112, 16, 2))
end
function Gcl107.processEventNq1(A0_116, A1_117, A2_118)
  A0_116:startFadeOutCutSceneDefault(A1_117)
  A0_116:startNQCutScene("gc010710", 1, 0)
  A0_116:startFadeInCutSceneDefault(A1_117)
end
function Gcl107.processEventNq2(A0_119, A1_120, A2_121, A3_122)
  A0_119:startFadeOutCutSceneDefault(A1_120)
  A0_119:startFadeInCutSceneDefault(A1_120)
  return (A0_119:startNQCutScene("gc010714", 2, 0, A3_122))
end
