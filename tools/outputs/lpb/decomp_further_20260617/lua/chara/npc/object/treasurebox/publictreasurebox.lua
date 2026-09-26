require("/Chara/Npc/Object/TreasureBox/TreasureBoxBaseClass")
_defineClass("PublicTreasureBox", "TreasureBoxBaseClass")
function PublicTreasureBox.initForEvent(A0_0)
  A0_0:_setGroundOn(false)
end
function PublicTreasureBox.askUseKey(A0_1, A1_2, A2_3)
  return (A0_1:askExtendWidget(worldMaster, 60023, 2, 1, 1, A1_2, A2_3))
end
