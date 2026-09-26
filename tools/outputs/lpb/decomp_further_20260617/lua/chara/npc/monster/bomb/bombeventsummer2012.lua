require("/Chara/Npc/Monster/Bomb/BombEventBaseClass")
_defineClass("BombEventSummer2012", "BombEventBaseClass")
function BombEventSummer2012.getBattalion(A0_0)
  local L1_1
  L1_1 = 1
  return L1_1
end
function BombEventSummer2012.getMapMarkerTypeForTalkable(A0_2)
  if A0_2:isPropertyEnabled(2) then
    return 8
  else
    return nil
  end
end
