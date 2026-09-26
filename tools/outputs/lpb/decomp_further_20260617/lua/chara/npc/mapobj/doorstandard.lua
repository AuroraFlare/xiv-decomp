require("/Chara/Npc/NpcBaseClass")
_defineClass("DoorStandard", "NpcBaseClass")
function DoorStandard.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {
    {"layout", "integer16"},
    {"instance", "integer16"},
    {"count", "integer8"},
    {
      "timerAfterOpen",
      "timer",
      true
    },
    {
      "timerAfterClose",
      "timer",
      true
    },
    {
      "serverTimeAnimation",
      "integer32"
    }
  }
  A0_0:initWork(L4_4, L5_5)
  if A0_0:getActorClassId() == 5900001 then
    A0_0:_setReactionTriggerBox("in", A1_1, A2_2, "door", nil)
    A0_0:_setReactionTriggerBox("out", A1_1, A2_2, "door", true)
  elseif A0_0:getActorClassId() == 5900003 then
    A0_0:_runBgSchedulerFromMidstream("open", 5)
  elseif A0_0:getActorClassId() == 5900004 then
    A0_0:_runBgSchedulerFromMidstream("clos", 5)
  end
  A0_0:_setGroundOn(false)
end
function DoorStandard._onReaction(A0_6, A1_7, A2_8)
  if A2_8 == "in" then
    A0_6.work.count = A0_6.work.count + 1
    if A0_6.work.count == 1 and A0_6.work.timerAfterOpen == nil and A0_6.work.timerAfterClose == nil then
      if worldMaster:_getServerTime() > A0_6.work.serverTimeAnimation + 2 then
        A0_6.work.timerAfterOpen = 2
        A0_6:_runBgScheduler("open")
      else
        A0_6.work.timerAfterClose = A0_6.work.serverTimeAnimation + 3 - worldMaster:_getServerTime()
      end
    end
  else
    A0_6.work.count = A0_6.work.count - 1
    if A0_6.work.count <= 0 then
      A0_6.work.count = 0
      if A0_6.work.timerAfterOpen == nil and A0_6.work.timerAfterClose == nil then
        if worldMaster:_getServerTime() > A0_6.work.serverTimeAnimation + 2 then
          A0_6.work.timerAfterClose = 2
          A0_6:_runBgScheduler("clos")
        else
          A0_6.work.timerAfterOpen = A0_6.work.serverTimeAnimation + 3 - worldMaster:_getServerTime()
        end
      end
    end
  end
end
function DoorStandard.processTimer(A0_9, A1_10)
  if A1_10 == "timerAfterOpen" then
    if A0_9.work.count <= 0 then
      A0_9.work.count = 0
      A0_9.work.serverTimeAnimation = worldMaster:_getServerTime()
      A0_9:_runBgScheduler("clos")
    end
  elseif A1_10 == "timerAfterClose" and A0_9.work.count >= 1 then
    A0_9.work.serverTimeAnimation = worldMaster:_getServerTime()
    A0_9:_runBgScheduler("open")
  end
end
