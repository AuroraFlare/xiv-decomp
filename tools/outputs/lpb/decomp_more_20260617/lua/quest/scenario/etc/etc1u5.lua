require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Etc1u5", "ScenarioBaseClass")
function Etc1u5.initText(A0_0)
  A0_0:_loadTextDataPermanently(3463, "etc1u5")
end
function Etc1u5.processEventUbokhnStart(A0_1, A1_2, A2_3, A3_4, A4_5)
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 1, 0)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  A2_3:say(A0_1, 6, 0)
  A2_3:say(A0_1, 7, 0)
  if A3_4 == 0 then
    A2_3:say(A0_1, 8, 0, 0, 0, 0, 0, A4_5)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 10, 0)
      A2_3:say(A0_1, 11, 0)
      A2_3:finishCliantTalkTurn()
    else
      A2_3:say(A0_1, 9, 0)
      A2_3:finishCliantTalkTurn()
    end
    return (A0_1:showQuestInfomation())
  else
    A2_3:say(A0_1, 12, 0)
    A2_3:say(A0_1, 13, 0)
    A2_3:say(A0_1, 14, 0)
    A2_3:say(A0_1, 15, 0)
    if A0_1:showQuestInfomation() == 1 then
      A2_3:say(A0_1, 17, 0)
      A2_3:finishCliantTalkTurn()
    else
      A2_3:say(A0_1, 16, 0)
      A2_3:finishCliantTalkTurn()
    end
    return (A0_1:showQuestInfomation())
  end
end
function Etc1u5.processEventUbokhnAfterOffer(A0_6, A1_7, A2_8, A3_9, A4_10)
  A2_8:startCliantTalkTurn(2, A1_7)
  if A3_9 == 5 then
    A2_8:say(A0_6, 18, 0, 0, 0, 0, 0, A4_10)
  else
    A2_8:say(A0_6, 19, 0)
    A2_8:say(A0_6, 20, 0)
  end
  A2_8:finishCliantTalkTurn()
end
function Etc1u5.processEvent010(A0_11, A1_12, A2_13, A3_14)
  A2_13:startCliantTalkTurn(2, A1_12)
  A2_13:say(A0_11, 21, 0)
  if A3_14 == 5 then
    A2_13:say(A0_11, 23, 0)
    A2_13:say(A0_11, 24, 0)
  else
    A2_13:say(A0_11, 25, 0)
    A2_13:say(A0_11, 26, 0)
    A2_13:say(A0_11, 27, 0)
  end
  A2_13:say(A0_11, 28, 0)
  A2_13:say(A0_11, 29, 0)
  A2_13:finishCliantTalkTurn()
end
