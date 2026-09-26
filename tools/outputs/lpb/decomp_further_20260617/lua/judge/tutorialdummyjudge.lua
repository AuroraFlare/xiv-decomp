_defineClass("TutorialDummyJudge", "JudgeBaseClass")
function TutorialDummyJudge._onInit(A0_0)
  local L1_1
end
function TutorialDummyJudge.man0u0processEvent000_3(A0_2, A1_3, A2_4, A3_5)
  A3_5:say(A1_3, 5, 0)
end
function TutorialDummyJudge.man0u0processEvent020_8(A0_6, A1_7, A2_8, A3_9)
  A3_9:startCliantTalkTurn(2, A2_8)
  A3_9:say(A1_7, 86, 0)
  A3_9:say(A1_7, 87, 0)
  if A3_9:ask(A1_7, 91, 2) == 1 then
    A3_9:say(A1_7, 88, 0)
  else
    A3_9:say(A1_7, 94, 0)
  end
  A3_9:finishCliantTalkTurn()
  return (A3_9:ask(A1_7, 91, 2))
end
