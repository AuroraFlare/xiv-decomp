require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonExit", "NpcBaseClass")
function RaidDungeonExit.initForEvent(A0_0)
  A0_0:_loadTextDataPermanently(6736, "raidDungeonExit")
end
function RaidDungeonExit.eventTalkStep0(A0_1)
  local L1_2
end
function RaidDungeonExit.askYesNo(A0_3, A1_4, A2_5, A3_6, A4_7)
  local L5_8, L6_9
  L6_9 = A1_4
  if L6_9 == 0 then
  else
  end
  if L6_9 == 3 then
    L5_8 = A0_3:askExtendWidget(A0_3, 7, 2, 1, 2, A2_5)
    break
  elseif L6_9 == 1 then
  elseif L6_9 == 2 then
  else
    if L6_9 == 4 then
    else
    end
  end
  L5_8 = A0_3:askExtendWidget(A0_3, 1, 2, 1, 2, A2_5)
  if L5_8 == 1 then
    L5_8 = A0_3:askExtendWidget(A0_3, 4, 2, 1, 2, A3_6, A4_7, A2_5)
  else
  end
  return L5_8
end
function RaidDungeonExit.debugAskYesNo(A0_10, A1_11)
  local L2_12
  return L2_12
end
