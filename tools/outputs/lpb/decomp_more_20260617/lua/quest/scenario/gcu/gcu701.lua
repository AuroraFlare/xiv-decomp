require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu701", "ScenarioBaseClass")
function Gcu701.initText(A0_0)
  A0_0:_loadTextDataPermanently(7872, "gcu701")
end
function Gcu701.processEventStart(A0_1, A1_2, A2_3)
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
function Gcu701.processEventAubreyHint(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  if A2_6:doSalute(3, 33) == 0 then
    A2_6:_runCharaScheduler(353959936)
  end
  A0_4:_wait(1)
  A2_6:say(A0_4, 54, 0)
  A2_6:finishCliantTalkTurn()
end
function Gcu701.processEvent000_2(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  if A2_9:doSalute(3, 33) == 0 then
    A2_9:_runCharaScheduler(353959936)
  end
  A0_7:_wait(1)
  A2_9:say(A0_7, 10, 0)
  A2_9:finishCliantTalkTurn()
end
function Gcu701.processEvent000(A0_10, A1_11, A2_12)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A2_12:doSalute(3, 43) == 0 then
    A2_12:_runCharaScheduler(353959936)
  end
  A0_10:_wait(1)
  A2_12:say(A0_10, 11, 0)
  A2_12:say(A0_10, 12, 0)
  A2_12:_runCharaScheduler(353964032)
  A2_12:say(A0_10, 13, 0)
  A2_12:say(A0_10, 55, 0)
  A2_12:say(A0_10, 14, 0)
  A2_12:say(A0_10, 15, 0)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 16, 0)
  worldMaster:say(A0_10, 17, 0)
  A2_12:say(A0_10, 18, 0)
  worldMaster:say(A0_10, 19, 0)
  A2_12:_runCharaScheduler(353964032)
  A2_12:say(A0_10, 20, 0)
  worldMaster:say(A0_10, 21, 0)
  A2_12:say(A0_10, 22, 0)
  worldMaster:say(A0_10, 23, 0)
  A2_12:_runCharaScheduler(353959936)
  A2_12:say(A0_10, 24, 0)
  A2_12:finishCliantTalkTurn()
end
function Gcu701.processEvent005_2(A0_13, A1_14, A2_15)
  A2_15:startCliantTalkTurn(2, A1_14)
  if A2_15:doSalute(3, 43) == 0 then
    A2_15:_runCharaScheduler(353959936)
  end
  A0_13:_wait(1)
  A2_15:say(A0_13, 25, 0)
  A2_15:finishCliantTalkTurn()
end
function Gcu701.processEvent005(A0_16, A1_17, A2_18)
  A2_18:startCliantTalkTurn(2, A1_17)
  if A2_18:doSalute(3, 43) == 0 then
    A2_18:_runCharaScheduler(353959936)
  end
  A0_16:_wait(1)
  A2_18:say(A0_16, 26, 0)
  if A2_18:askExtendWidget(A0_16, 27, 2, 1, 1) == 1 then
    A2_18:_runCharaScheduler(353959936)
    A2_18:say(A0_16, 31, 0)
    A2_18:say(A0_16, 32, 0)
    A2_18:say(A0_16, 33, 0)
  else
    A2_18:_runCharaScheduler(353964032)
    A2_18:say(A0_16, 30, 0)
  end
  A2_18:finishCliantTalkTurn()
  return (A2_18:askExtendWidget(A0_16, 27, 2, 1, 1))
end
function Gcu701.processEvent010(A0_19, A1_20, A2_21)
  A2_21:startCliantTalkTurn(2, A1_20)
  if A2_21:doSalute(3, 43) == 0 then
    A2_21:_runCharaScheduler(353959936)
  end
  A0_19:_wait(1)
  A2_21:say(A0_19, 34, 0)
  worldMaster:say(A0_19, 35, 0)
  if A2_21:askExtendWidget(A0_19, 36, 2, 1, 2) == 1 then
    A2_21:_runCharaScheduler(353959936)
    A2_21:say(A0_19, 39, 0)
  else
    A2_21:_runCharaScheduler(353959936)
    A2_21:say(A0_19, 40, 0)
  end
  A2_21:finishCliantTalkTurn()
  return (A2_21:askExtendWidget(A0_19, 36, 2, 1, 2))
end
function Gcu701.processEvent015(A0_22, A1_23, A2_24)
  A2_24:startCliantTalkTurn(2, A1_23)
  if A2_24:doSalute(3, 43) == 0 then
    A2_24:_runCharaScheduler(353959936)
  end
  A0_22:_wait(1)
  A2_24:say(A0_22, 41, 0)
  A2_24:say(A0_22, 42, 0)
  A2_24:_runCharaScheduler(353959936)
  A2_24:say(A0_22, 43, 0)
  A2_24:say(A0_22, 44, 0)
  A2_24:finishCliantTalkTurn()
end
function Gcu701.processEvent015_2(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  if A2_27:doSalute(3, 43) == 0 then
    A2_27:_runCharaScheduler(353959936)
  end
  A0_25:_wait(1)
  A2_27:say(A0_25, 45, 0)
  A2_27:finishCliantTalkTurn()
end
function Gcu701.processEvent020(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  if A2_30:doSalute(3, 33) == 0 then
    A2_30:_runCharaScheduler(353959936)
  end
  A0_28:_wait(1)
  A2_30:say(A0_28, 46, 0)
  A2_30:say(A0_28, 47, 0)
  A2_30:_runCharaScheduler(353959936)
  A2_30:say(A0_28, 48, 0)
  A2_30:say(A0_28, 49, 0)
  worldMaster:say(A0_28, 50, 0)
  A2_30:finishCliantTalkTurn()
end
function Gcu701.processEvent025_2(A0_31, A1_32, A2_33)
  A2_33:startCliantTalkTurn(2, A1_32)
  if A2_33:doSalute(3, 33) == 0 then
    A2_33:_runCharaScheduler(353959936)
  end
  A0_31:_wait(1)
  A2_33:say(A0_31, 51, 0)
  worldMaster:say(A0_31, 50, 0)
  A2_33:finishCliantTalkTurn()
end
function Gcu701.processEvent025(A0_34, A1_35, A2_36, A3_37)
  A2_36:startCliantTalkTurn(2, A1_35)
  desktopWidget:openGrandCompanyJoinEffectWidget(3, 21)
  A0_34:_wait(4.7)
  desktopWidget:openGrandCompanyStatusWidgetYield(3)
  desktopWidget:setGrandCompanyStatusWidgetJoinStatus(A3_37)
  A0_34:_wait(2.7)
  desktopWidget:setGrandCompanyStatusWidgetJoinStatus(21)
  A0_34:_wait(2)
  if A2_36:doSalute(3, 33) == 0 then
    A2_36:_runCharaScheduler(353959936)
  end
  A0_34:_wait(1)
  A2_36:say(A0_34, 52, 0)
  A2_36:say(A0_34, 53, 0)
  A2_36:finishCliantTalkTurn()
end
