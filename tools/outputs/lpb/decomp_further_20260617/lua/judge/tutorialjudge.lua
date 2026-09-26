_defineClass("TutorialJudge", "JudgeBaseClass")
function TutorialJudge._onInit(A0_0)
  local L1_1
end
function TutorialJudge.man0u0processEvent000_3(A0_2, A1_3, A2_4, A3_5)
  A3_5:startCliantTalkTurn(2, A2_4)
  A3_5:say(A1_3, 126, 0)
  A3_5:finishCliantTalkTurn()
end
function TutorialJudge.man0u0processEvent020_8(A0_6, A1_7, A2_8, A3_9)
  A3_9:startCliantTalkTurn(2, A2_8)
  A3_9:say(A1_7, 128, 0)
  A3_9:say(A1_7, 127, 0)
  A3_9:finishCliantTalkTurn()
  return 2
end
