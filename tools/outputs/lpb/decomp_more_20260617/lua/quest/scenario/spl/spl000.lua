require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Spl000", "ScenarioBaseClass")
function Spl000.initText(A0_0)
  A0_0:_loadTextDataPermanently(10000, "spl000")
end
function Spl000.processEvent_PRINCESSDAY_LIM_HIME(A0_1, A1_2, A2_3, A3_4)
  A2_3:_runCharaScheduler(354054144)
  A2_3:say(A0_1, 38, 0)
  A2_3:_waitForCharaSchedulerFinished(354054144)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 39, 0)
  A2_3:_runCharaScheduler(353968128)
  A2_3:say(A0_1, 40, 0)
  A2_3:_waitForCharaSchedulerFinished(353968128)
  if A3_4 == 0 then
    A2_3:_runCharaScheduler(354107392)
    A2_3:say(A0_1, 41, 0)
    A2_3:_waitForCharaSchedulerFinished(354107392)
  else
    if A3_4 == 1 then
      A2_3:_runCharaScheduler(70815744)
      A2_3:say(A0_1, 42, 0)
      A2_3:_waitForCharaSchedulerFinished(70815744)
    else
    end
  end
  A2_3:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_LIM_SHITSU(A0_5, A1_6, A2_7)
  A2_7:startCliantTalkTurn(2, A1_6)
  A2_7:say(A0_5, 43, 0)
  A2_7:say(A0_5, 44, 0)
  A2_7:say(A0_5, 45, 0)
  A2_7:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_LIM_JIJO(A0_8, A1_9, A2_10)
  A2_10:startCliantTalkTurn(2, A1_9)
  A2_10:_runCharaScheduler(354054144)
  A2_10:say(A0_8, 46, 0)
  A2_10:_waitForCharaSchedulerFinished(354054144)
  if A2_10:askExtendWidget(A0_8, 10, 2, 1, 1) == 1 then
    A2_10:_runCharaScheduler(353959936)
    A2_10:say(A0_8, 47, 0)
    A2_10:_runCharaScheduler(353972224)
    A2_10:say(A0_8, 48, 0)
    A2_10:say(A0_8, 49, 0)
    A2_10:say(A0_8, 50, 0)
    A2_10:_runCharaScheduler(353964032)
    A2_10:say(A0_8, 51, 0)
    A2_10:say(A0_8, 52, 0)
    A2_10:_runCharaScheduler(353984512)
    A2_10:say(A0_8, 53, 0)
    A2_10:_runCharaScheduler(354054144)
    A2_10:say(A0_8, 54, 0)
  else
  end
  A2_10:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_YDA(A0_11, A1_12, A2_13, A3_14)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:_runCharaScheduler(354082816)
  A2_13:say(A0_11, 21, 0)
  A2_13:_waitForCharaSchedulerFinished(354082816)
  A2_13:_runCharaScheduler(354086912)
  A2_13:say(A0_11, 22, 0)
  A2_13:_waitForCharaSchedulerFinished(354086912)
  A2_13:_runCharaScheduler(354054144)
  A2_13:say(A0_11, 23, 0)
  A2_13:_waitForCharaSchedulerFinished(354054144)
  if A3_14 == 0 then
    A2_13:_runCharaScheduler(354107392)
    A2_13:say(A0_11, 24, 0)
    A2_13:_waitForCharaSchedulerFinished(354107392)
  else
    if A3_14 == 1 then
      A2_13:_runCharaScheduler(354103296)
      A2_13:say(A0_11, 25, 0)
      A2_13:_waitForCharaSchedulerFinished(354103296)
    else
    end
  end
  A2_13:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_GRI_SHITSU(A0_15, A1_16, A2_17)
  A2_17:startCliantTalkTurn(2, A1_16)
  A2_17:say(A0_15, 26, 0)
  A2_17:say(A0_15, 27, 0)
  A2_17:say(A0_15, 28, 0)
  A2_17:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_GRI_JIJO(A0_18, A1_19, A2_20)
  A2_20:startCliantTalkTurn(2, A1_19)
  A2_20:_runCharaScheduler(354054144)
  A2_20:say(A0_18, 29, 0)
  A2_20:_waitForCharaSchedulerFinished(354054144)
  if A2_20:askExtendWidget(A0_18, 10, 2, 1, 1) == 1 then
    A2_20:_runCharaScheduler(353976320)
    A2_20:say(A0_18, 30, 0)
    A2_20:say(A0_18, 31, 0)
    A2_20:_runCharaScheduler(353972224)
    A2_20:say(A0_18, 32, 0)
    A2_20:say(A0_18, 33, 0)
    A2_20:_runCharaScheduler(353968128)
    A2_20:say(A0_18, 34, 0)
    A2_20:say(A0_18, 35, 0)
    A2_20:_runCharaScheduler(353980416)
    A2_20:say(A0_18, 36, 0)
    A2_20:_runCharaScheduler(354054144)
    A2_20:say(A0_18, 37, 0)
  else
  end
  A2_20:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_UL_HIME(A0_21, A1_22, A2_23, A3_24)
  A2_23:startCliantTalkTurn(2, A1_22)
  A2_23:_runCharaScheduler(354054144)
  A2_23:say(A0_21, 2, 0)
  A2_23:_waitForCharaSchedulerFinished(354054144)
  A2_23:_runCharaScheduler(353964032)
  A2_23:say(A0_21, 3, 0)
  A2_23:_waitForCharaSchedulerFinished(353964032)
  if A3_24 == 0 then
    A2_23:_runCharaScheduler(354107392)
    A2_23:say(A0_21, 4, 0)
    A2_23:_waitForCharaSchedulerFinished(354107392)
  else
    if A3_24 == 1 then
      A2_23:_runCharaScheduler(353959936)
      A2_23:say(A0_21, 5, 0)
      A2_23:_waitForCharaSchedulerFinished(353959936)
    else
    end
  end
  A2_23:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_UL_SHITSU(A0_25, A1_26, A2_27)
  A2_27:startCliantTalkTurn(2, A1_26)
  A2_27:say(A0_25, 6, 0)
  A2_27:say(A0_25, 7, 0)
  A2_27:say(A0_25, 8, 0)
  A2_27:finishCliantTalkTurn()
end
function Spl000.processEvent_PRINCESSDAY_UL_JIJO(A0_28, A1_29, A2_30)
  A2_30:startCliantTalkTurn(2, A1_29)
  A2_30:_runCharaScheduler(353980416)
  A2_30:say(A0_28, 9, 0)
  A2_30:_waitForCharaSchedulerFinished(353980416)
  if A2_30:askExtendWidget(A0_28, 10, 2, 1, 1) == 1 then
    A2_30:_runCharaScheduler(353968128)
    A2_30:say(A0_28, 13, 0)
    A2_30:say(A0_28, 14, 0)
    A2_30:_runCharaScheduler(354086912)
    A2_30:say(A0_28, 15, 0)
    A2_30:say(A0_28, 16, 0)
    A2_30:_runCharaScheduler(353980416)
    A2_30:say(A0_28, 17, 0)
    A2_30:say(A0_28, 18, 0)
    A2_30:_runCharaScheduler(353968128)
    A2_30:say(A0_28, 19, 0)
    A2_30:say(A0_28, 20, 0)
  else
  end
  A2_30:finishCliantTalkTurn()
end
function Spl000.processEventLINDLEADER(A0_31, A1_32, A2_33, A3_34)
  A2_33:startCliantTalkTurn(2, A1_32)
  if A2_33:doSalute(1, 31) == 0 then
    A2_33:_runCharaScheduler(353959936)
  else
    A0_31:_wait(2)
  end
  A2_33:say(A0_31, 55, 0)
  if A3_34 >= 2 then
    A2_33:_runCharaScheduler(354066432)
    A2_33:say(A0_31, 56, 0)
  elseif A3_34 >= 1 then
    worldMaster:say(A0_31, 57, 3020614)
  end
  A2_33:finishCliantTalkTurn()
end
function Spl000.processEventBRIELLE(A0_35, A1_36, A2_37)
  A2_37:startCliantTalkTurn(2, A1_36)
  if A2_37:doSalute(1, 21) == 0 then
    A2_37:_runCharaScheduler(353959936)
  else
    A0_35:_wait(2)
  end
  A2_37:say(A0_35, 58, 0)
  A2_37:say(A0_35, 59, 0)
  A2_37:finishCliantTalkTurn()
end
function Spl000.processEventGILLARD(A0_38, A1_39, A2_40)
  A2_40:startCliantTalkTurn(2, A1_39)
  if A2_40:doSalute(1, 13) == 0 then
    A2_40:_runCharaScheduler(353959936)
  else
    A0_38:_wait(2)
  end
  A2_40:say(A0_38, 60, 0)
  A2_40:finishCliantTalkTurn()
end
function Spl000.processEventELNAURE(A0_41, A1_42, A2_43, A3_44)
  A2_43:startCliantTalkTurn(2, A1_42)
  if A2_43:doSalute(2, 31) == 0 then
    A2_43:_runCharaScheduler(353959936)
  else
    A0_41:_wait(2)
  end
  A2_43:say(A0_41, 61, 0)
  if A3_44 >= 2 then
    A2_43:_runCharaScheduler(354066432)
    A2_43:say(A0_41, 62, 0)
  elseif A3_44 >= 1 then
    worldMaster:say(A0_41, 63, 3020615)
  end
  A2_43:finishCliantTalkTurn()
end
function Spl000.processEventARISMONT(A0_45, A1_46, A2_47)
  A2_47:startCliantTalkTurn(2, A1_46)
  if A2_47:doSalute(2, 21) == 0 then
    A2_47:_runCharaScheduler(353959936)
  else
    A0_45:_wait(2)
  end
  A2_47:say(A0_45, 64, 0)
  A2_47:say(A0_45, 65, 0)
  A2_47:finishCliantTalkTurn()
end
function Spl000.processEventMERLIE(A0_48, A1_49, A2_50)
  A2_50:startCliantTalkTurn(2, A1_49)
  if A2_50:doSalute(2, 13) == 0 then
    A2_50:_runCharaScheduler(353959936)
  else
    A0_48:_wait(2)
  end
  A2_50:say(A0_48, 66, 0)
  A2_50:finishCliantTalkTurn()
end
function Spl000.processEventSOMBER(A0_51, A1_52, A2_53, A3_54)
  A2_53:startCliantTalkTurn(2, A1_52)
  if A2_53:doSalute(3, 31) == 0 then
    A2_53:_runCharaScheduler(353959936)
  else
    A0_51:_wait(2)
  end
  A2_53:say(A0_51, 67, 0)
  if A3_54 >= 2 then
    A2_53:_runCharaScheduler(354066432)
    A2_53:say(A0_51, 68, 0)
  elseif A3_54 >= 1 then
    worldMaster:say(A0_51, 57, 3020616)
  end
  A2_53:finishCliantTalkTurn()
end
function Spl000.processEventMIMIO(A0_55, A1_56, A2_57)
  A2_57:startCliantTalkTurn(2, A1_56)
  if A2_57:doSalute(3, 21) == 0 then
    A2_57:_runCharaScheduler(353959936)
  else
    A0_55:_wait(2)
  end
  A2_57:say(A0_55, 70, 0)
  A2_57:say(A0_55, 71, 0)
  A2_57:finishCliantTalkTurn()
end
function Spl000.processEventSISIMUZA(A0_58, A1_59, A2_60)
  A2_60:startCliantTalkTurn(2, A1_59)
  if A2_60:doSalute(3, 13) == 0 then
    A2_60:_runCharaScheduler(353959936)
  else
    A0_58:_wait(2)
  end
  A2_60:say(A0_58, 72, 0)
  A2_60:finishCliantTalkTurn()
end
