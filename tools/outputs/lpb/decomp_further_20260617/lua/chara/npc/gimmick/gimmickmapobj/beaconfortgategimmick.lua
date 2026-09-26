require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("BeaconFortGateGimmick", "GimmickNpcBaseClass")
function BeaconFortGateGimmick.initForGimmick(A0_0, A1_1, A2_2)
  A0_0.work._temp = {
    {
      "showSchedulerName",
      "string",
      #A1_1
    },
    {
      "hideSchedulerName",
      "string",
      #A2_2
    },
    {
      "currentStatus",
      "integer8"
    }
  }
  A0_0.work._sync = {
    {"status", "integer8"}
  }
  A0_0.work._tag = {
    {
      "mapStat",
      1,
      {"status"}
    }
  }
  A0_0.work.showSchedulerName = A1_1
  A0_0.work.hideSchedulerName = A2_2
  A0_0.work.currentStatus = 0
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(10432, "beaconFortGateGimmick")
end
function BeaconFortGateGimmick.processUpdateWork(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3.work
  L2_5 = L2_5.status
  if A0_3.work.currentStatus ~= L2_5 then
    A0_3:executeScheduler(A0_3.work.status)
  else
  end
end
function BeaconFortGateGimmick.executeScheduler(A0_6, A1_7)
  local L2_8
  L2_8 = A0_6.getSchedulerName
  L2_8 = L2_8(A0_6, A1_7)
  if A0_6.work.currentStatus == 0 then
    A0_6:_runBgSchedulerFromMidstream(L2_8, 5)
  else
    A0_6:_runBgScheduler(L2_8)
  end
  A0_6.work.currentStatus = A1_7
end
function BeaconFortGateGimmick.getSchedulerName(A0_9, A1_10)
  local L2_11, L3_12
  L2_11 = ""
  if A1_10 == 1 then
    L3_12 = A0_9.work
    L2_11 = L3_12.showSchedulerName
  else
    L3_12 = A0_9.work
    L2_11 = L3_12.hideSchedulerName
  end
  return L2_11
end
