require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("SceDummy01", "ScenarioBaseClass")
function SceDummy01.processOfferBeforeTalk(A0_0, A1_1, A2_2)
end
function SceDummy01.processOfferAfterTalk(A0_3, A1_4, A2_5)
end
function SceDummy01.processDebugPush(A0_6, A1_7, A2_8)
  A2_8:startCliantTalkTurn(1, A1_7)
  A2_8:_runCharaScheduler(354168832)
  A2_8:finishCliantTalkTurn()
end
