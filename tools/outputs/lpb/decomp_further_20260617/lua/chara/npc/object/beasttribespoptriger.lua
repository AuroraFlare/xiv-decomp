require("/Chara/Npc/NpcBaseClass")
_defineClass("BeastTribesPopTriger", "NpcBaseClass")
function BeastTribesPopTriger.initForEvent(A0_0)
  local L1_1, L2_2
  L1_1 = {L2_2}
  L2_2 = {"dummy", "integer32"}
  L2_2 = {}
  A0_0:initWork(L1_1, L2_2)
end
function BeastTribesPopTriger.isMapMarkerVisibleForTalkable(A0_3)
  local L1_4
  L1_4 = false
  return L1_4
end
function BeastTribesPopTriger.defTalk(A0_5, A1_6)
  A0_5:_runCharaScheduler(67522560)
end
