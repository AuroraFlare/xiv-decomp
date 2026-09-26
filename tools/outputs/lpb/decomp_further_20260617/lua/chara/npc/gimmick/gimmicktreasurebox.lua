require("/Chara/Npc/Gimmick/GimmickNpcBaseClass")
_defineClass("GimmickTreasureBox", "GimmickNpcBaseClass")
function GimmickTreasureBox.initForGimmick(A0_0, A1_1)
  A0_0.work._temp = {
    {
      "mapMarkerVisible",
      "boolean"
    }
  }
  A0_0.work.mapMarkerVisible = A1_1
  A0_0:_setGroundOn(false)
end
function GimmickTreasureBox.isMapMarkerVisibleForTalkable(A0_2)
  return A0_2.work.mapMarkerVisible
end
function GimmickTreasureBox.askKeyItemUse(A0_3, A1_4)
  if desktopWidget:askForEventMode(nil, nil, worldMaster, 1, false, true, 60023, {60024, 60025}, A1_4, 1) == 1 then
    return true
  end
  return false
end
