require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonWarp", "NpcBaseClass")
function RaidDungeonWarp.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(6781, "raidDungeonWarp")
end
function RaidDungeonWarp.activateWarpDevice(A0_1, A1_2)
  A0_1:_runCharaScheduler(67493888)
end
function RaidDungeonWarp.askYesNo(A0_3, A1_4)
  if A1_4 == true then
    return A0_3:askExtendWidget(A0_3, 2, 2, 1, 2)
  else
    worldMaster:say(A0_3, 1)
  end
  return nil
end
