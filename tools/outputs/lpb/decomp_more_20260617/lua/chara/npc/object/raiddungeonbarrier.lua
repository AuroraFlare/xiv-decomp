require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonBarrier", "NpcBaseClass")
function RaidDungeonBarrier.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(6829, "raidDungeonBarrier")
end
function RaidDungeonBarrier.eventTalkRead(A0_1, A1_2)
  worldMaster:say(A0_1, 5)
end
function RaidDungeonBarrier.askYesNo(A0_3)
  local L1_4
  L1_4 = A0_3:askExtendWidget(A0_3, 2, 2, 1, 1)
  return L1_4
end
