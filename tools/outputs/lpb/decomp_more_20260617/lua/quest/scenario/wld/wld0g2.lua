require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Wld0g2", "ScenarioBaseClass")
function Wld0g2.initText(A0_0)
  A0_0:_loadTextDataPermanently(4979, "wld0g2")
end
function Wld0g2.processEventSwaenhyltStart(A0_1, A1_2, A2_3)
  A0_1:startFadeOut(A1_2, 1)
  A2_3:startCliantTalkTurn(1, A1_2)
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  A2_3:_runCharaScheduler(353976320)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:_runCharaScheduler(354000896)
  A2_3:say(A0_1, 5, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(70828032)
    A2_3:_runCharaScheduler(353959936)
    A2_3:say(A0_1, 8, 0)
    A2_3:say(A0_1, 9, 0)
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:_runCharaScheduler(354078720)
    A2_3:say(A0_1, 6, 0)
  end
  A0_1:startFadeOut(A1_2, 1)
  A2_3:finishCliantTalkTurn()
  A0_1:_wait(1)
  A0_1:startFadeIn(A1_2, 1)
  return (A0_1:showQuestInfomation())
end
function Wld0g2.processEvent000_2(A0_4, A1_5, A2_6, A3_7)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 11, 0)
  A2_6:say(A0_4, 12, 0)
  A2_6:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent005(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:_runCharaScheduler(353959936)
  A2_10:say(A0_8, 13, 0)
  A2_10:say(A0_8, 14, 0)
  A2_10:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent005_2(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(353959936)
  A2_13:say(A0_11, 15, 0)
  A2_13:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent010(A0_14, A1_15, A2_16)
  A2_16:startCliantTalkTurn(2, A1_15)
  A2_16:_runCharaScheduler(354000896)
  A2_16:say(A0_14, 16, 0)
  A0_14:_wait(3)
  A2_16:say(A0_14, 17, 0)
  A2_16:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent010_2(A0_17, A1_18, A2_19)
  A2_19:startCliantTalkTurn(2, A1_18)
  A2_19:_runCharaScheduler(354000896)
  A2_19:say(A0_17, 18, 0)
  A2_19:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent015(A0_20, A1_21, A2_22)
  A2_22:startCliantTalkTurn(2, A1_21)
  A2_22:_runCharaScheduler(353968128)
  A2_22:say(A0_20, 19, 0)
  A2_22:say(A0_20, 20, 0)
  A2_22:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent015_2(A0_23, A1_24, A2_25)
  A2_25:startCliantTalkTurn(2, A1_24)
  A2_25:_runCharaScheduler(353968128)
  A2_25:say(A0_23, 21, 0)
  A2_25:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent020(A0_26, A1_27, A2_28)
  A2_28:startCliantTalkTurn(2, A1_27)
  A2_28:_runCharaScheduler(353964032)
  A2_28:say(A0_26, 22, 0)
  A2_28:say(A0_26, 23, 0)
  A2_28:say(A0_26, 24, 0)
  A2_28:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent020_2(A0_29, A1_30, A2_31)
  A2_31:startCliantTalkTurn(2, A1_30)
  A2_31:_runCharaScheduler(353964032)
  A2_31:say(A0_29, 25, 0)
  A2_31:finishCliantTalkTurn()
  return
end
function Wld0g2.processEvent025(A0_32, A1_33, A2_34)
  A0_32:startFadeOut(A1_33, 1)
  A2_34:startCliantTalkTurn(1, A1_33)
  A0_32:_wait(1)
  A0_32:startFadeIn(A1_33, 1)
  A2_34:_runCharaScheduler(353972224)
  A2_34:say(A0_32, 26, 0)
  A2_34:say(A0_32, 27, 0)
  A2_34:say(A0_32, 28, 0)
  A2_34:say(A0_32, 29, 0)
  A2_34:_runCharaScheduler(354107392)
  A2_34:say(A0_32, 30, 0)
  A0_32:startFadeOut(A1_33, 1)
  A2_34:finishCliantTalkTurn()
  A0_32:_wait(1)
  A0_32:startFadeIn(A1_33, 1)
  return
end
