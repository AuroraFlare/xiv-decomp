require("/Chara/Npc/NpcBaseClass")
_defineClass("InstanceRaidExit", "NpcBaseClass")
function InstanceRaidExit.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
end
function InstanceRaidExit.askExit(A0_1, A1_2)
  local L2_3, L3_4
  L2_3 = false
  L3_4 = {52043, 52044}
  if desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true, 52042, L3_4, A1_2) == 1 then
    L2_3 = true
  end
  return L2_3
end
