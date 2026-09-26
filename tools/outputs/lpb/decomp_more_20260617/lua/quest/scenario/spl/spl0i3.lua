require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl0i3", "ScenarioBaseClass")
function Spl0i3.initText(A0_0)
  A0_0:_loadTextDataPermanently(5715, "spl0i3")
end
function Spl0i3.processEventRimStart(A0_1, A1_2, A2_3)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353976320)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(354054144)
  A2_3:say(A0_1, 8, 0, 0, 30)
  if A0_1:showQuestInfomation() == 1 then
    A2_3:say(A0_1, 10, 0, 0, 30)
    A2_3:_runCharaScheduler(353972224)
    A2_3:say(A0_1, 11, 0)
  else
    A2_3:_runCharaScheduler(353964032)
    A2_3:say(A0_1, 9, 0)
  end
  A2_3:finishCliantTalkTurn()
  return (A0_1:showQuestInfomation())
end
function Spl0i3.processEventGriStart(A0_4, A1_5, A2_6)
  A2_6:startCliantTalkTurn(2, A1_5)
  A2_6:_runCharaScheduler(353976320)
  A2_6:say(A0_4, 20, 0)
  A2_6:say(A0_4, 21, 0)
  A2_6:_runCharaScheduler(353959936)
  A2_6:say(A0_4, 22, 0)
  A2_6:say(A0_4, 23, 0)
  A2_6:_runCharaScheduler(353968128)
  A2_6:say(A0_4, 24, 0)
  A2_6:say(A0_4, 25, 0)
  A2_6:_runCharaScheduler(353964032)
  A2_6:say(A0_4, 26, 0, 0, 30)
  if A0_4:showQuestInfomation() == 1 then
    A2_6:say(A0_4, 28, 0)
    A2_6:_runCharaScheduler(354103296)
    A2_6:say(A0_4, 29, 0)
  else
    A2_6:_runCharaScheduler(353972224)
    A2_6:say(A0_4, 27, 0)
  end
  A2_6:finishCliantTalkTurn()
  return (A0_4:showQuestInfomation())
end
function Spl0i3.processEventUldStart(A0_7, A1_8, A2_9)
  A2_9:startCliantTalkTurn(2, A1_8)
  A2_9:_runCharaScheduler(353959936)
  A2_9:say(A0_7, 39, 0)
  A2_9:say(A0_7, 40, 0)
  A2_9:_runCharaScheduler(353964032)
  A2_9:say(A0_7, 41, 0)
  A2_9:say(A0_7, 42, 0)
  A2_9:say(A0_7, 43, 0)
  A2_9:_runCharaScheduler(353972224)
  A2_9:say(A0_7, 44, 0)
  A2_9:say(A0_7, 45, 0, 0, 30)
  if A0_7:showQuestInfomation() == 1 then
    A2_9:_runCharaScheduler(353968128)
    A2_9:say(A0_7, 47, 0)
    A2_9:say(A0_7, 48, 0)
  else
    A2_9:_runCharaScheduler(353984512)
    A2_9:say(A0_7, 46, 0)
  end
  A2_9:finishCliantTalkTurn()
  return (A0_7:showQuestInfomation())
end
function Spl0i3.processEventStartAfter(A0_10, A1_11, A2_12, A3_13)
  A2_12:startCliantTalkTurn(2, A1_11)
  if A3_13 == 0 then
    A2_12:_runCharaScheduler(353959936)
    A2_12:say(A0_10, 12, 0, 0, 30)
    break
  else
  end
  if A3_13 == 1 then
    A2_12:say(A0_10, 30, 0, 0, 30)
    break
  else
  end
  if A3_13 == 2 then
    A2_12:say(A0_10, 49, 0, 0, 30)
    break
  else
  end
  return (A2_12:askExtendWidget(worldMaster, 51109, 2, 1, 1, 1000004))
end
function Spl0i3.processEventXmasitemNg(A0_14, A1_15, A2_16, A3_17)
  if A3_17 == 0 then
    A2_16:_runCharaScheduler(354041856)
    A2_16:say(A0_14, 18, 0, 0, 30)
    break
  else
  end
  if A3_17 == 1 then
    A2_16:_runCharaScheduler(354082816)
    A2_16:say(A0_14, 36, 0)
    A2_16:say(A0_14, 37, 0, 0, 30)
    break
  else
  end
  if A3_17 == 2 then
    A2_16:_runCharaScheduler(354041856)
    A2_16:say(A0_14, 55, 0, 0, 30)
    break
  else
  end
  A2_16:finishCliantTalkTurn()
end
function Spl0i3.processEventXmasitemNo(A0_18, A1_19, A2_20, A3_21)
  if A3_21 == 0 then
    A2_20:_runCharaScheduler(353964032)
    A2_20:say(A0_18, 13, 0, 0, 30)
    break
  else
  end
  if A3_21 == 1 then
    A2_20:_runCharaScheduler(354103296)
    A2_20:say(A0_18, 31, 0, 0, 30)
    break
  else
  end
  if A3_21 == 2 then
    A2_20:_runCharaScheduler(353964032)
    A2_20:say(A0_18, 50, 0, 0, 30)
    break
  else
  end
  A2_20:finishCliantTalkTurn()
end
function Spl0i3.processEventXmasitem(A0_22, A1_23, A2_24, A3_25)
  A2_24:startCliantTalkTurn(2, A1_23)
  if A3_25 == 0 then
    A2_24:_runCharaScheduler(353968128)
    A2_24:say(A0_22, 14, 0)
    A0_22:startFadeOut(A1_23, 1.5)
    A0_22:_wait(1)
    A2_24:_runCharaScheduler(83992576)
    A0_22:_wait(0.5)
    A0_22:startFadeIn(A1_23, 1.5)
    A2_24:say(A0_22, 15, 0)
    A1_23:_runCharaScheduler(354111488)
    A2_24:_runCharaScheduler(354107392)
    A2_24:say(A0_22, 16, 0)
    A2_24:say(A0_22, 17, 0)
    break
  else
  end
  if A3_25 == 1 then
    A2_24:_runCharaScheduler(353964032)
    A2_24:say(A0_22, 32, 0)
    A0_22:startFadeOut(A1_23, 1.5)
    A0_22:_wait(1)
    A2_24:_runCharaScheduler(83943424)
    A0_22:_wait(0.5)
    A0_22:startFadeIn(A1_23, 1.5)
    A2_24:say(A0_22, 33, 0)
    A1_23:_runCharaScheduler(354111488)
    A2_24:_runCharaScheduler(354107392)
    A2_24:say(A0_22, 34, 0)
    A2_24:say(A0_22, 35, 0)
    break
  else
  end
  if A3_25 == 2 then
    A2_24:_runCharaScheduler(353972224)
    A2_24:say(A0_22, 51, 0)
    A0_22:startFadeOut(A1_23, 1.5)
    A0_22:_wait(0.5)
    A2_24:_runCharaScheduler(84008960)
    A0_22:_wait(1)
    A0_22:startFadeIn(A1_23, 1.5)
    A2_24:say(A0_22, 52, 0)
    A1_23:_runCharaScheduler(354111488)
    A2_24:_runCharaScheduler(354107392)
    A2_24:say(A0_22, 53, 0)
    A2_24:say(A0_22, 54, 0)
    break
  else
  end
  A2_24:finishCliantTalkTurn()
end
function Spl0i3.processEventXmasitemAfter(A0_26, A1_27, A2_28, A3_29)
  A2_28:startCliantTalkTurn(2, A1_27)
  if A3_29 == 0 then
    A2_28:_runCharaScheduler(353959936)
    A2_28:say(A0_26, 19, 0)
    break
  else
  end
  if A3_29 == 1 then
    A2_28:_runCharaScheduler(353959936)
    A2_28:say(A0_26, 38, 0)
    break
  else
  end
  if A3_29 == 2 then
    A2_28:_runCharaScheduler(353964032)
    A2_28:say(A0_26, 56, 0)
    break
  else
  end
  A2_28:finishCliantTalkTurn()
end
function Spl0i3.processEventXmas04(A0_30, A1_31, A2_32)
  A2_32:startCliantTalkTurn(2, A1_31)
  A2_32:_runCharaScheduler(353959936)
  A2_32:say(A0_30, 58, 0)
  A2_32:say(A0_30, 59, 0)
  A2_32:_runCharaScheduler(353968128)
  A2_32:say(A0_30, 60, 0)
  A2_32:say(A0_30, 61, 0)
  A2_32:_runCharaScheduler(353964032)
  A2_32:say(A0_30, 62, 0)
  A2_32:say(A0_30, 63, 0)
  A2_32:_runCharaScheduler(353972224)
  A2_32:say(A0_30, 64, 0)
  A2_32:say(A0_30, 65, 0)
  worldMaster:say(A0_30, 66, 0)
  A2_32:finishCliantTalkTurn()
end
function Spl0i3.processEventXmas04After(A0_33, A1_34, A2_35)
  A2_35:startCliantTalkTurn(2, A1_34)
  A2_35:_runCharaScheduler(353959936)
  A2_35:say(A0_33, 67, 0)
  A2_35:finishCliantTalkTurn()
end
function Spl0i3.processEventSnowMan(A0_36, A1_37, A2_38)
  worldMaster:say(A0_36, 71, 0)
end
function Spl0i3.processEventSnowManOk(A0_39, A1_40, A2_41, A3_42)
  worldMaster:say(A0_39, 72, 0, A3_42)
end
function Spl0i3.processEventSnowManEvent(A0_43, A1_44, A2_45)
  worldMaster:say(A0_43, 68, 0)
end
function Spl0i3.processEventClear(A0_46, A1_47, A2_48)
  A2_48:startCliantTalkTurn(2, A1_47)
  A2_48:_runCharaScheduler(354066432)
  A2_48:say(A0_46, 73, 0)
  A2_48:say(A0_46, 74, 0)
  A2_48:finishCliantTalkTurn()
end
function Spl0i3.processEventSnowMandefo(A0_49, A1_50, A2_51)
  worldMaster:say(A0_49, 70, 0)
end
function Spl0i3.processEventSnowMandefo2(A0_52, A1_53, A2_54)
  worldMaster:say(A0_52, 69, 0)
end
function Spl0i3.processEventXmas04defo(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  A2_57:_runCharaScheduler(353959936)
  A2_57:say(A0_55, 57, 0)
  A2_57:finishCliantTalkTurn()
end
function Spl0i3.processEventXmasAfterdefo(A0_58, A1_59, A2_60, A3_61)
  A2_60:startCliantTalkTurn(2, A1_59)
  if A3_61 == 0 then
    A2_60:_runCharaScheduler(353968128)
    A2_60:say(A0_58, 76, 0)
    break
  else
  end
  if A3_61 == 1 then
    A2_60:_runCharaScheduler(353964032)
    A2_60:say(A0_58, 77, 0)
    break
  else
  end
  if A3_61 == 2 then
    A2_60:_runCharaScheduler(353972224)
    A2_60:say(A0_58, 78, 0)
    break
  else
  end
  A2_60:finishCliantTalkTurn()
end
function Spl0i3.processEventXmas04Afterdefo(A0_62, A1_63, A2_64)
  A2_64:startCliantTalkTurn(2, A1_63)
  A2_64:_runCharaScheduler(353959936)
  A2_64:say(A0_62, 75, 0)
  A2_64:finishCliantTalkTurn()
end
