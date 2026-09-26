require("/Director/Quest/QuestDirectorBaseClass")
_defineBaseClass("SimpleQuestBattleBaseClass", "QuestDirectorBaseClass")
function SimpleQuestBattleBaseClass.eventContentGiveUp(A0_0, A1_1, A2_2)
  return (worldMaster:ask(A0_0, worldMaster, 25230, 2, A2_2))
end
function SimpleQuestBattleBaseClass.getOwnClientQuestId(A0_3)
  return (A0_3:getOwnClientQuestIdAsSimple())
end
function SimpleQuestBattleBaseClass.getOwnClientQuestIdAsSimple(A0_4)
  local L1_5
end
