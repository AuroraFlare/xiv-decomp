require("/Chara/Npc/Object/TreasureBox/TreasureBoxBaseClass")
_defineClass("AnimaTreasureBox", "TreasureBoxBaseClass")
function AnimaTreasureBox.initForEvent(A0_0)
  local L1_1
end
function AnimaTreasureBox.processInitTreasureBox(A0_2)
  local L1_3
end
function AnimaTreasureBox.askCheckAnima(A0_4)
  return (A0_4:askExtendWidget(worldMaster, 60080, 2, 1, 1))
end
function AnimaTreasureBox.processSubAnima(A0_5, A1_6)
  A1_6:_runCharaScheduler(69189632)
end
function AnimaTreasureBox.processAddAnima(A0_7, A1_8)
  A1_8:_runCharaScheduler(67108920)
end
