require("/Chara/Npc/NpcBaseClass")
_defineClass("BarrierTree", "NpcBaseClass")
function BarrierTree.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {
    {"layout", "integer16"},
    {"instance", "integer16"}
  }
  A0_0:initWork(L4_4, L5_5)
  A0_0:_setGroundOn(false)
end
