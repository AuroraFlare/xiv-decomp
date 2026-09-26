require("/Quest/QuestBaseClass")
_defineBaseClass("PassiveGuildleveBaseClass", "QuestBaseClass")
function PassiveGuildleveBaseClass.welcomeTalk(A0_0, A1_1, A2_2)
  A2_2:startCliantTalkTurn(2, A1_1)
end
function PassiveGuildleveBaseClass.processPgEvent(A0_3, A1_4, A2_5, A3_6, A4_7)
  if A4_7 ~= nil then
    A2_5:_runCharaScheduler(A4_7)
  end
  A2_5:say(A0_3, A3_6, 0)
end
function PassiveGuildleveBaseClass.finishTalkTurn(A0_8, A1_9, A2_10)
  A2_10:finishCliantTalkTurn()
end
function PassiveGuildleveBaseClass.simpleFadeInAndOut(A0_11, A1_12, A2_13)
  A1_12:_fadeOut(2)
  A1_12:_waitForFading()
  A1_12:_fadeIn(1)
  A1_12:_waitForFading()
end
