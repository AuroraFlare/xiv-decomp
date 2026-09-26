require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Gcu304", "ScenarioBaseClass")
function Gcu304.initText(A0_0)
  A0_0:_loadTextDataPermanently(7152, "gcu304")
end
function Gcu304.processEventBERTHARStart(A0_1, A1_2, A2_3, A3_4)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 2, 0, A3_4)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(354066432)
  A2_3:say(A0_1, 42, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 43, 0)
  A2_3:_runCharaScheduler(353976320)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:_runCharaScheduler(354107392)
    A2_3:say(A0_1, 9, 0)
    A2_3:say(A0_1, 10, 0)
  else
    A2_3:_runCharaScheduler(70823936)
    A2_3:say(A0_1, 8, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Gcu304.processEvent_000(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:_runCharaScheduler(353984512)
  A2_7:say(A0_5, 11, 0)
  A2_7:say(A0_5, 12, 0)
  A2_7:finishCliantTalkTurn()
end
function Gcu304.processEvent_005(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  if A2_10:doSalute(3, 23) == 0 then
    A2_10:_runCharaScheduler(353959936)
  end
  A0_8:_wait(1)
  if A2_10:isUpperRank(3, 23) == true then
    A2_10:say(A0_8, 13, 0)
    A2_10:say(A0_8, 14, 0)
    A2_10:_runCharaScheduler(353976320)
    A2_10:say(A0_8, 15, 0)
    A2_10:say(A0_8, 16, 0)
    A2_10:_runCharaScheduler(353964032)
    A2_10:say(A0_8, 17, 0)
    A2_10:say(A0_8, 18, 0)
    A2_10:say(A0_8, 19, 0)
  else
    A2_10:say(A0_8, 44, 0)
    A2_10:say(A0_8, 45, 0)
    A2_10:_runCharaScheduler(353976320)
    A2_10:say(A0_8, 46, 0)
    A2_10:say(A0_8, 47, 0)
    A2_10:_runCharaScheduler(353964032)
    A2_10:say(A0_8, 48, 0)
    A2_10:say(A0_8, 49, 0)
    A2_10:say(A0_8, 50, 0)
  end
  A2_10:finishCliantTalkTurn()
end
function Gcu304.processEvent_005_01(A0_11, A1_12, A2_13)
  A2_13:startCliantTalkTurn(2, A1_12)
  if A2_13:doSalute(3, 23) == 0 then
    A2_13:_runCharaScheduler(353959936)
  end
  if A2_13:isUpperRank(3, 23) == true then
    A2_13:say(A0_11, 35, 0)
    A2_13:say(A0_11, 36, 0)
  else
    A2_13:say(A0_11, 51, 0)
    A2_13:say(A0_11, 52, 0)
  end
  A2_13:finishCliantTalkTurn()
end
function Gcu304.processEvent_010(A0_14, A1_15, A2_16)
  if A2_16:ask(A0_14, 38, 2) == 1 then
  else
  end
  return (A2_16:ask(A0_14, 38, 2))
end
function Gcu304.processEvent_010_01(A0_17, A1_18, A2_19, A3_20, A4_21)
  desktopWidget:openPublicInformDialogWidget(A0_17, 37, 0, A3_20, A4_21)
  return
end
function Gcu304.processEvent_010_02(A0_22, A1_23, A2_24)
  worldMaster:say(A0_22, 41, 1, 0)
end
function Gcu304.processEvent_015(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(1, A1_26)
  A2_27:_runCharaScheduler(354099200)
  if A2_27:isUpperRank(3, 23) == true then
    A2_27:say(A0_25, 22, 0)
  else
    A2_27:say(A0_25, 53, 0)
  end
  if A2_27:ask(A0_25, 23, 2) == 1 then
    A2_27:_runCharaScheduler(353959936)
    if A2_27:isUpperRank(3, 23) == true then
      A2_27:say(A0_25, 26, 0)
    else
      A2_27:say(A0_25, 54, 0)
    end
  else
    A2_27:_runCharaScheduler(353959936)
    if A2_27:isUpperRank(3, 23) == true then
      A2_27:say(A0_25, 27, 0)
    else
      A2_27:say(A0_25, 55, 0)
    end
  end
  if A2_27:isUpperRank(3, 23) == true then
    A2_27:say(A0_25, 28, 0)
    A2_27:say(A0_25, 29, 0)
  else
    A2_27:say(A0_25, 56, 0)
    A2_27:say(A0_25, 57, 0)
  end
  A2_27:_runCharaScheduler(83890176)
  if A2_27:isUpperRank(3, 23) == true then
    A2_27:say(A0_25, 30, 0)
    A2_27:_runCharaScheduler(354086912)
    A2_27:say(A0_25, 31, 0)
    A2_27:say(A0_25, 32, 0)
    A2_27:say(A0_25, 33, 0)
  else
    A2_27:say(A0_25, 58, 0)
    A2_27:_runCharaScheduler(354086912)
    A2_27:say(A0_25, 59, 0)
    A2_27:say(A0_25, 60, 0)
    A2_27:say(A0_25, 61, 0)
  end
  A2_27:_runCharaScheduler(354107392)
  A0_25:_wait(4)
  if A2_27:isUpperRank(3, 23) == true then
    A2_27:say(A0_25, 34, 0)
  else
    A2_27:say(A0_25, 62, 0)
  end
  A2_27:finishCliantTalkTurn()
  return (A2_27:ask(A0_25, 23, 2))
end
