require("/Chara/Npc/NpcBaseClass_battletest")
function NpcBaseClass.initForBattle(A0_0, ...)
end
function NpcBaseClass.initForBattleCommon(A0_2, A1_3, ...)
  local L3_5, L4_6
  L3_5._nesting = L4_6
  L3_5.aggro = L4_6
  L3_5.partsName = L4_6
  for _FORV_6_ = 1, 8 do
    A0_2.npcWork.battleCommon.partsExists[_FORV_6_] = select(2 + _FORV_6_, ...)
  end
end
function NpcBaseClass.getPartsName(A0_7)
  local L1_8
  L1_8 = A0_7.npcWork
  L1_8 = L1_8.battleCommon
  L1_8 = L1_8.partsName
  return L1_8
end
function NpcBaseClass.isPartsExists(A0_9, A1_10)
  local L2_11
  L2_11 = A0_9.npcWork
  L2_11 = L2_11.battleCommon
  L2_11 = L2_11.partsExists
  L2_11 = L2_11[A1_10]
  return L2_11
end
function NpcBaseClass.getAggro(A0_12)
  local L1_13
  L1_13 = A0_12.npcWork
  L1_13 = L1_13.battleCommon
  L1_13 = L1_13.aggro
  return L1_13
end
