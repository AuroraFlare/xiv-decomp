require("/Chara/Npc/NpcBaseClass")
_defineClass("RaidDungeonPoster", "NpcBaseClass")
function RaidDungeonPoster.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
  A0_0:_loadTextDataPermanently(6753, "raidDungeonPoster")
end
function RaidDungeonPoster.eventTalkRead(A0_1, A1_2)
  local L2_3
  L2_3 = A1_2
  if L2_3 == 1 then
    A0_1:say(A0_1, 1)
    break
  else
  end
  if L2_3 == 2 then
    A0_1:say(A0_1, 2)
    break
  else
  end
  if L2_3 == 3 then
    A0_1:say(A0_1, 3)
    break
  else
  end
  if L2_3 == 4 then
    A0_1:say(A0_1, 4)
    break
  else
  end
  if L2_3 == 5 then
    A0_1:say(A0_1, 5)
    break
  else
  end
  if L2_3 == 6 then
    A0_1:say(A0_1, 6)
    break
  else
  end
  if L2_3 == 7 then
    A0_1:say(A0_1, 7)
    break
  else
  end
  if L2_3 == 8 then
    worldMaster:say(A0_1, 14)
    break
  else
  end
  if L2_3 == 9 then
    worldMaster:say(A0_1, 15)
    break
  else
  end
  if L2_3 == 10 then
    worldMaster:say(A0_1, 16)
    do break end
    break
  else
  end
end
