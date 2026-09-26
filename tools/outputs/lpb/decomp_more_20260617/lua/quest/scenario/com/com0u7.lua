require("/Quest/Scenario/ScenarioBaseClass")
_defineClass("Com0u7", "ScenarioBaseClass")
function Com0u7.initText(A0_0)
  A0_0:_loadTextDataPermanently(6336, "com0u7")
end
function Com0u7.processEventAubreyStart(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  A2_3:startCliantTalkTurn(2, A1_2)
  A2_3:say(A0_1, 2, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 3, 0)
  A2_3:say(A0_1, 4, 0)
  A2_3:say(A0_1, 5, 0)
  worldMaster:say(A0_1, 6, 0)
  worldMaster:say(A0_1, 7, 0)
  A2_3:_runCharaScheduler(354082816)
  A2_3:say(A0_1, 8, 0)
  A2_3:say(A0_1, 9, 0)
  A2_3:say(A0_1, 10, 0)
  A2_3:_runCharaScheduler(353984512)
  A2_3:say(A0_1, 11, 0)
  A2_3:say(A0_1, 12, 0)
  desktopWidget:openGrandCompanyStatusWidgetYield(3)
  if A2_3:ask(A0_1, 13, 2) == 1 then
    if desktopWidget:askEventModeWidgetYield("Ask/GrandCompanyOfficialJoinWidget", 1, 3) == true then
      if desktopWidget:askEventModeWidgetYield("Ask/GrandCompanyOfficialJoinWidget", 1, 3) == 1 then
        L3_4 = 1
        desktopWidget:closeGrandCompanyStatusWidget()
        A0_1:_wait(0.7)
        desktopWidget:openGrandCompanyJoinEffectWidget(3, 11)
        A0_1:_wait(4.7)
        desktopWidget:openGrandCompanyStatusWidgetYield(3)
        A0_1:_wait(2)
        desktopWidget:setGrandCompanyStatusWidgetJoinStatus(11)
        A0_1:_wait(2)
        A2_3:_runCharaScheduler(353984512)
        A2_3:say(A0_1, 18, 0)
        A2_3:say(A0_1, 19, 0)
        A2_3:say(A0_1, 20, 0)
        A2_3:_runCharaScheduler(84099072)
        worldMaster:say(A0_1, 21, 0)
        A2_3:_waitForCharaSchedulerFinished(84099072)
        A2_3:_runCharaScheduler(353984512)
        A2_3:say(A0_1, 22, 0)
        worldMaster:say(A0_1, 23, 0)
        A2_3:say(A0_1, 24, 0)
        while true do
          if L4_5 ~= 5 then
            L4_5 = A2_3:askExtendWidget(A0_1, 25, 5, 1, 1)
            if L4_5 == 1 then
              A2_3:_runCharaScheduler(353964032)
              A2_3:say(A0_1, 31, 0)
            elseif L4_5 == 2 then
              A2_3:_runCharaScheduler(353972224)
              A2_3:say(A0_1, 32, 0)
            elseif L4_5 == 3 then
              A2_3:_runCharaScheduler(353959936)
              A2_3:say(A0_1, 34, 0)
            elseif L4_5 == 4 then
              A2_3:_runCharaScheduler(353968128)
              A2_3:say(A0_1, 33, 0)
            else
            end
            if L4_5 == 5 then
            end
            L4_5 = 5
          end
        end
        L4_5 = 1
        A2_3:_runCharaScheduler(354082816)
        A2_3:say(A0_1, 35, 0)
        A2_3:say(A0_1, 36, 0)
        A2_3:_runCharaScheduler(353984512)
        A2_3:say(A0_1, 37, 0)
        A2_3:say(A0_1, 38, 0)
        A2_3:_runCharaScheduler(353984512)
        A2_3:say(A0_1, 40, 0)
        A2_3:say(A0_1, 41, 0)
        desktopWidget:closeGrandCompanyStatusWidget()
        A2_3:finishCliantTalkTurn()
        return L4_5
      else
        L3_4 = 0
        A2_3:_runCharaScheduler(354041856)
        A2_3:say(A0_1, 17, 0)
      end
    end
  else
    A2_3:_runCharaScheduler(354041856)
    A2_3:say(A0_1, 16, 0)
  end
  A2_3:finishCliantTalkTurn()
  return L3_4
end
function Com0u7.processEventAubreyEnd(A0_6, A1_7, A2_8, A3_9, A4_10)
  A0_6:_wait(1)
  desktopWidget:setGrandCompanyStatusWidgetPoint(0)
  A0_6:_wait(1)
  desktopWidget:closeGrandCompanyStatusWidget()
end
