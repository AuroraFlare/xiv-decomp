require("/Chara/Npc/NpcBaseClass")
_defineClass("TestMapObj", "NpcBaseClass")
function TestMapObj.initForEvent(A0_0, A1_1, A2_2, A3_3)
  local L4_4, L5_5
  L4_4 = {L5_5}
  L5_5 = {"dummy", "integer32"}
  L5_5 = {
    {"layout", "integer16"},
    {"instance", "integer16"}
  }
  A0_0:initWork(L4_4, L5_5)
  A0_0:_setReactionTriggerBox("in", 101, 949, "tb01", nil)
  A0_0:_setReactionTriggerBox("out", 101, 949, "tb01", true)
end
function TestMapObj._onReaction(A0_6, A1_7, A2_8)
  A0_6:_runBgScheduler("aeth")
end
