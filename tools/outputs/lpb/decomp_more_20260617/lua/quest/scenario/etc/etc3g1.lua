require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc3g1", "ScenarioBaseClass")
function Etc3g1.initText(A0_0)
  A0_0:_loadTextDataPermanently(4499, "etc3g1")
end
function Etc3g1.processEventMestonnauxStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(354168832)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(354168832)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:say(A0_1, 8, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(70828032)
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:_runCharaScheduler(70815744)
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Etc3g1.processEvent000_2(A0_5, A1_6, A2_7, A3_8)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(354168832)
  A2_7:say(A0_5, 11, 0)
  A2_7:finishCliantTalkTurn()
  return
end
function Etc3g1.processEvent010_2(A0_9, A1_10, A2_11, A3_12)
  A2_11:startCliantTalkTurn(2, A1_10)
  A2_11:_runCharaScheduler(354168832)
  A2_11:say(A0_9, 35, 0)
  A2_11:say(A0_9, 36, 0)
  A2_11:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventBiddy(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  A2_15:_runCharaScheduler(354168832)
  A2_15:say(A0_13, 12, 0)
  A2_15:say(A0_13, 13, 0)
  A2_15:say(A0_13, 14, 0)
  A2_15:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventBiddy_2(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  A2_18:_runCharaScheduler(354168832)
  A2_18:say(A0_16, 15, 0)
  A2_18:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventTatagoi(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  A2_21:_runCharaScheduler(354000896)
  A2_21:say(A0_19, 16, 0)
  A2_21:say(A0_19, 17, 0)
  A2_21:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventTatagoi_2(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  A2_24:_runCharaScheduler(354000896)
  A2_24:say(A0_22, 18, 0)
  A2_24:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventAraire(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:_runCharaScheduler(353968128)
  A2_27:say(A0_25, 19, 0)
  A2_27:say(A0_25, 20, 0)
  A2_27:say(A0_25, 21, 0)
  A2_27:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventAraire_2(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(353968128)
  A2_30:say(A0_28, 22, 0)
  A2_30:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventNuala(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  A2_33:_runCharaScheduler(354177024)
  A2_33:say(A0_31, 23, 0)
  A2_33:say(A0_31, 24, 0)
  A2_33:say(A0_31, 25, 0)
  A2_33:say(A0_31, 54, 0)
  A2_33:say(A0_31, 26, 0)
  A2_33:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventNuala_2(A0_34, A1_35, A2_36)
  A2_36:startCliantTalkTurn(2, A1_35)
  A2_36:_runCharaScheduler(354177024)
  A2_36:say(A0_34, 27, 0)
  A2_36:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventNuala_3(A0_37, A1_38, A2_39)
  A2_39:startCliantTalkTurn(2, A1_38)
  A2_39:say(A0_37, 53, 0)
  A2_39:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventNellaure(A0_40, A1_41, A2_42)
  A2_42:startCliantTalkTurn(2, A1_41)
  A2_42:_runCharaScheduler(353964032)
  A2_42:say(A0_40, 28, 0)
  A2_42:say(A0_40, 29, 0)
  A2_42:say(A0_40, 30, 0)
  A2_42:say(A0_40, 55, 0)
  A2_42:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventNellaure_2(A0_43, A1_44, A2_45)
  A2_45:startCliantTalkTurn(2, A1_44)
  A2_45:_runCharaScheduler(353964032)
  A2_45:say(A0_43, 31, 0)
  A2_45:finishCliantTalkTurn()
  return
end
function Etc3g1.processEvent010(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:_runCharaScheduler(353964032)
  A2_48:say(A0_46, 32, 0)
  A2_48:say(A0_46, 33, 0)
  A2_48:say(A0_46, 34, 0)
  A2_48:finishCliantTalkTurn()
  return
end
function Etc3g1.processEvent015(A0_49, A1_50, A2_51)
  A2_51:startCliantTalkTurn(2, A1_50)
  A2_51:_runCharaScheduler(83906560)
  A2_51:say(A0_49, 39, 0)
  A2_51:say(A0_49, 40, 0)
  A2_51:_runCharaScheduler(353959936)
  A2_51:say(A0_49, 41, 0)
  A2_51:say(A0_49, 42, 0)
  A2_51:say(A0_49, 43, 0)
  A2_51:_runCharaScheduler(353964032)
  A2_51:say(A0_49, 44, 0)
  A2_51:say(A0_49, 45, 0)
  A2_51:finishCliantTalkTurn()
  return
end
function Etc3g1.processEventYayatu(A0_52, A1_53, A2_54)
  A2_54:startCliantTalkTurn(2, A1_53)
  A2_54:_runCharaScheduler(353964032)
  A2_54:say(A0_52, 37, 0)
  A2_54:say(A0_52, 38, 0)
  A2_54:finishCliantTalkTurn()
  return
end
function Etc3g1.processEvent020(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:say(A0_55, 46, 0)
  A2_57:say(A0_55, 47, 0)
  A2_57:say(A0_55, 48, 0)
  A2_57:say(A0_55, 49, 0)
  A2_57:say(A0_55, 50, 0)
  A2_57:say(A0_55, 56, 0)
  A2_57:say(A0_55, 51, 0)
  A2_57:say(A0_55, 52, 0)
  A2_57:finishCliantTalkTurn()
  return
end
