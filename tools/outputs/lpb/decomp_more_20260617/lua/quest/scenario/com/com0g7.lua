require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0g7", "ScenarioBaseClass")
function Com0g7.initText(A0_0)
  A0_0:_loadTextDataPermanently(6048, "com0g7")
end
function Com0g7.processEventFulkeStart(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 2, 0)
  A2_3:say(A0_1, 3, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 43, 0)
  A2_3:say(A0_1, 5, 0)
  worldMaster:say(A0_1, 6, 0)
  worldMaster:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(353959936)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 41, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:_runCharaScheduler(353964032)
  A2_3:say(A0_1, 10, 0)
  A2_3:say(A0_1, 42, 0)
  A2_3:say(A0_1, 11, 0)
  desktopWidget:openGrandCompanyStatusWidgetYield(2)
  if A2_3:ask(A0_1, 12, 2) == 1 then
    if desktopWidget:askEventModeWidgetYield("Ask/GrandCompanyOfficialJoinWidget", 1, 2) == true then
      if desktopWidget:askEventModeWidgetYield("Ask/GrandCompanyOfficialJoinWidget", 1, 2) == 1 then
        L3_4 = 1
        desktopWidget:closeGrandCompanyStatusWidget()
        A0_1:_wait(0.7)
        desktopWidget:openGrandCompanyJoinEffectWidget(2, 11)
        A0_1:_wait(4.7)
        desktopWidget:openGrandCompanyStatusWidgetYield(2)
        A0_1:_wait(2)
        desktopWidget:setGrandCompanyStatusWidgetJoinStatus(11)
        A0_1:_wait(2)
        A2_3:_runCharaScheduler(353959936)
        A2_3:say(A0_1, 17, 0)
        A2_3:say(A0_1, 18, 0)
        A2_3:say(A0_1, 19, 0)
        A2_3:say(A0_1, 44, 0)
        A2_3:_runCharaScheduler(84094976)
        worldMaster:say(A0_1, 20, 0)
        A2_3:_waitForCharaSchedulerFinished(84094976)
        A2_3:_runCharaScheduler(353964032)
        A2_3:say(A0_1, 21, 0)
        worldMaster:say(A0_1, 22, 0)
        A2_3:say(A0_1, 23, 0)
        while true do
          if L4_5 ~= 5 then
            L4_5 = A2_3:askExtendWidget(A0_1, 24, 5, 1, 1)
            if L4_5 == 1 then
              A2_3:_runCharaScheduler(353964032)
              A2_3:say(A0_1, 30, 0)
            elseif L4_5 == 2 then
              A2_3:_runCharaScheduler(353972224)
              A2_3:say(A0_1, 31, 0)
            elseif L4_5 == 3 then
              A2_3:_runCharaScheduler(353959936)
              A2_3:say(A0_1, 33, 0)
            elseif L4_5 == 4 then
              A2_3:_runCharaScheduler(353968128)
              A2_3:say(A0_1, 32, 0)
            else
            end
            if L4_5 == 5 then
            end
            L4_5 = 5
          end
        end
        L4_5 = 1
        A2_3:_runCharaScheduler(353964032)
        A2_3:say(A0_1, 34, 0)
        A2_3:say(A0_1, 35, 0)
        A2_3:say(A0_1, 36, 0)
        A2_3:say(A0_1, 37, 0)
        A2_3:_runCharaScheduler(353959936)
        A2_3:say(A0_1, 39, 0)
        A2_3:say(A0_1, 40, 0)
        desktopWidget:closeGrandCompanyStatusWidget()
        A2_3:finishCliantTalkTurn()
        return L4_5
      else
        L3_4 = 0
        A2_3:say(A0_1, 16, 0)
      end
    end
  else
    A2_3:say(A0_1, 15, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Com0g7.processEventFulkeEnd(A0_6, A1_7, A2_8, A3_9, A4_10)
  A0_6:_wait(1)
  desktopWidget:setGrandCompanyStatusWidgetPoint(0)
  A0_6:_wait(1)
  desktopWidget:closeGrandCompanyStatusWidget()
end
